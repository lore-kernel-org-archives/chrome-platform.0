Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C43D2F38
	for <chrome-platform@lists.linux.dev>; Mon, 28 Aug 2023 09:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33BE7C433C7;
	Mon, 28 Aug 2023 09:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693215839;
	bh=xjAeVP31obttB8Bvi53bbgjrxVQcHlvWuSepU2NlDME=;
	h=From:To:Cc:Subject:Date:From;
	b=cugJG4/qmTzGMC+Vw/+V6jdhsSzRJYf5aTW+RzXw16WEBCoNdKtICGoQhshJSlf7T
	 /eRYxRYHMpIBqtR2h8LHiUdBUDfovOX1ikseHoXzTxTZSHz8l8owiHIHNibcZw52ib
	 7aZpQ17gDxL9eELUHU1EA/xD4tCSW8x9aV6/Ayag42oGoYrc9iIsGQzaSm+wEltO0r
	 60XkHU0adZ4Vws8/NX2UcADa71iL6R81R7QWEQjPddvosNAvrE8GvK7YpOdwC8JPSi
	 g9CW5DMZNeXlpmONXxf8SPlFBk89b0udzvfZMlDNGHUU4Y88VMgtUo3iaKJdc9CmRD
	 75vhN5QMpRyAw==
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
Subject: [PATCH] iio: cros_ec: fix an use-after-free in cros_ec_sensors_push_data()
Date: Mon, 28 Aug 2023 17:43:39 +0800
Message-ID: <20230828094339.1248472-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cros_ec_sensors_push_data() reads some `indio_dev` states (e.g.
iio_buffer_enabled() and `indio_dev->active_scan_mask`) without holding
the `mlock`.

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

Fix it by acquiring the `mlock` before accessing the `indio_dev` states.

[1]: https://elixir.bootlin.com/linux/v6.5/source/drivers/iio/industrialio-buffer.c#L1189
[2]: https://elixir.bootlin.com/linux/v6.5/source/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c#L198

Cc: stable@vger.kernel.org
Fixes: aa984f1ba4a4 ("iio: cros_ec: Register to cros_ec_sensorhub when EC supports FIFO")
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
index b72d39fc2434..a514d0dbafc7 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
@@ -182,17 +182,20 @@ int cros_ec_sensors_push_data(struct iio_dev *indio_dev,
 			      s16 *data,
 			      s64 timestamp)
 {
+	struct iio_dev_opaque *iio_dev_opaque = to_iio_dev_opaque(indio_dev);
 	struct cros_ec_sensors_core_state *st = iio_priv(indio_dev);
 	s16 *out;
 	s64 delta;
 	unsigned int i;
 
+	mutex_lock(&iio_dev_opaque->mlock);
+
 	/*
 	 * Ignore samples if the buffer is not set: it is needed if the ODR is
 	 * set but the buffer is not enabled yet.
 	 */
 	if (!iio_buffer_enabled(indio_dev))
-		return 0;
+		goto exit;
 
 	out = (s16 *)st->samples;
 	for_each_set_bit(i,
@@ -210,6 +213,8 @@ int cros_ec_sensors_push_data(struct iio_dev *indio_dev,
 	iio_push_to_buffers_with_timestamp(indio_dev, st->samples,
 					   timestamp + delta);
 
+exit:
+	mutex_unlock(&iio_dev_opaque->mlock);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(cros_ec_sensors_push_data);
-- 
2.42.0.rc1.204.g551eb34607-goog

