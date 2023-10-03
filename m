Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9D66AC0
	for <chrome-platform@lists.linux.dev>; Tue,  3 Oct 2023 08:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF6B6C433C8;
	Tue,  3 Oct 2023 08:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696320308;
	bh=P6ZoaKpKZhytyJm8MWN02ndOrqzwlHri/jkJrY69plc=;
	h=From:To:Cc:Subject:Date:From;
	b=baDzcJgU/EFIxkQ+P3eEcs0QtwXwv26JfC0jiYrypybKJN5YOtPwaqOmUXabUP7j/
	 P0YDX8BOke7MTcX3V6EkVhWwEFYBzbtiNAww7dkLeg6vDbjISFLVX9zwBLV1CiTfyk
	 rMSd74jL8qIJY+WWXj2ANcXeMvNqxxUIGJV+hksxmEC8nlerOVTDnUBGhX9fA0QQee
	 GoErog4mY8lRztvVRXXS6oPgbxGkcIajR64ScueelJm+1JN+u7fySE5AfFdZcrThRe
	 dHYoIBemnIkQZntcpmiVhtUfhNyAcvsOz4J4IvQ/TegvtAQ0bZ0DyvBu6KD+kpp9H3
	 F01HpulPP3arg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: tzungbi@kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH] platform/chrome: kunit: initialize lock for fake ec_dev
Date: Tue,  3 Oct 2023 08:05:04 +0000
Message-ID: <20231003080504.4011337-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cros_ec_cmd_xfer() uses ec_dev->lock.  Initialize it.

Otherwise, dmesg shows the following:
> DEBUG_LOCKS_WARN_ON(lock->magic != lock)
> ...
> Call Trace:
>  ? __mutex_lock
>  ? __warn
>  ? __mutex_lock
>  ...
>  ? cros_ec_cmd_xfer

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
index 28f722396fc1..b6169d6f2467 100644
--- a/drivers/platform/chrome/cros_ec_proto_test.c
+++ b/drivers/platform/chrome/cros_ec_proto_test.c
@@ -2668,6 +2668,7 @@ static int cros_ec_proto_test_init(struct kunit *test)
 	ec_dev->dev->release = cros_ec_proto_test_release;
 	ec_dev->cmd_xfer = cros_kunit_ec_xfer_mock;
 	ec_dev->pkt_xfer = cros_kunit_ec_xfer_mock;
+	mutex_init(&ec_dev->lock);
 
 	priv->msg = (struct cros_ec_command *)priv->_msg;
 
-- 
2.42.0.582.g8ccd20d70d-goog

