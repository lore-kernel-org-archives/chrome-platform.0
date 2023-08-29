Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F5AA47
	for <chrome-platform@lists.linux.dev>; Tue, 29 Aug 2023 03:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB733C433C7;
	Tue, 29 Aug 2023 03:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693278406;
	bh=QKe8SUE1Ew+GerDkUiq65QOLr+UYSEHt3K5MUDwaSC0=;
	h=From:To:Cc:Subject:Date:From;
	b=cpv9R3GNpa4yz4bv0ge0kjV1mTzL8SX4F9ply1yWfryfW5SlOPPpj1gRR4N/mPvs/
	 FbLr8VPD8GxTEeKz3qH89hZ18pJM+AUezgYWb+FCxWlxV5f4XHtuoz1d6yQq6XoXF/
	 XviRCxp+PI4ORKolz1XwIzVXh1PgtQzkGkThoPqDwRTBIzeiONillc3eUF3K+nyCX2
	 5Lm8uOAqA0ZmMaPTY9yg68oAmgr9aGqq/tLy8C9peEaQtdv1Z1Ubl+M0HURFKwhzs9
	 TXz27/7KIkkbyM4zZIJFIQf/W0wxhI1H9PxZqprFi6QZS2ALQGuHa3ZofWWjHRPkNE
	 57dPr4GvFGDag==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org,
	jic23@kernel.org,
	lars@metafoo.de
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	gwendal@chromium.org,
	linux-iio@vger.kernel.org,
	dianders@chromium.org,
	swboyd@chromium.org,
	stable@vger.kernel.org
Subject: [PATCH v2] iio: cros_ec: fix an use-after-free in cros_ec_sensors_push_data()
Date: Tue, 29 Aug 2023 11:06:22 +0800
Message-ID: <20230829030622.1571852-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cros_ec_sensors_push_data() reads `indio_dev->active_scan_mask` and
calls iio_push_to_buffers_with_timestamp() without making sure the
`indio_dev` stays in buffer mode.  There is a race if `indio_dev` exits
buffer mode right before cros_ec_sensors_push_data() accesses them.

An use-after-free on `indio_dev->active_scan_mask` was observed.  The
call trace:
[...]
 _find_next_bit
 cros_ec_sensors_push_data
 cros_ec_sensorhub_event
 blocking_notifier_call_chain
 cros_ec_irq_thread

It was caused by a race condition: one thread just freed
`active_scan_mask` at [1]; while another thread tried to access the
memory at [2].

Fix it by calling iio_device_claim_buffer_mode() to ensure the
`indio_dev` can't exit buffer mode during cros_ec_sensors_push_data().

[1]: https://elixir.bootlin.com/linux/v6.5/source/drivers/iio/industrialio-buffer.c#L1189
[2]: https://elixir.bootlin.com/linux/v6.5/source/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c#L198

Cc: stable@vger.kernel.org
Fixes: aa984f1ba4a4 ("iio: cros_ec: Register to cros_ec_sensorhub when EC supports FIFO")
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
Changes from v1(https://patchwork.kernel.org/project/linux-iio/patch/20230828094339.1248472-1-tzungbi@kernel.org/):
- Use iio_device_{claim|release}_buffer_mode() instead of accessing `mlock`.

 drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
index b72d39fc2434..6bfe5d6847e7 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
@@ -190,8 +190,11 @@ int cros_ec_sensors_push_data(struct iio_dev *indio_dev,
 	/*
 	 * Ignore samples if the buffer is not set: it is needed if the ODR is
 	 * set but the buffer is not enabled yet.
+	 *
+	 * Note: iio_device_claim_buffer_mode() returns -EBUSY if the buffer
+	 * is not enabled.
 	 */
-	if (!iio_buffer_enabled(indio_dev))
+	if (iio_device_claim_buffer_mode(indio_dev) < 0)
 		return 0;
 
 	out = (s16 *)st->samples;
@@ -210,6 +213,7 @@ int cros_ec_sensors_push_data(struct iio_dev *indio_dev,
 	iio_push_to_buffers_with_timestamp(indio_dev, st->samples,
 					   timestamp + delta);
 
+	iio_device_release_buffer_mode(indio_dev);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(cros_ec_sensors_push_data);
-- 
2.42.0.rc2.253.gd59a3bf2b4-goog

