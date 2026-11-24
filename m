Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508486;
	b=1/fYAR8VvB6lwgWcLa4L3e4WbKwhnBurI/Nol3L7LW0oOzycaQiOod4Qw+vN6XzgUhCp
	 sdouGOBFwarnUbnJ3VnNG1PLPP70jUdZXQu/Ml0rNi1nNNI+XWfP80dc+pu9ezU9AU9Vo
	 Rk0x4ZJSBKyUhqnx1Afasni5nL57yj+zBuA86ClZocnPnhoo/Ss4MrNrk1NCjIbfdQYMu
	 ZI41E4NGcucLaa/gXtJPsn4m9iXRZaQM2wFKn4mJ8r1ds1TmtEaIIuejqS0eRSFV9OfJB
	 A1f0Q5ANXtS8UoaMZ2qqV6qJvd6HNeQNQghsU8PHiMqNig5u7z74RN2XM8NqeZpEGrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508486;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=lg2Ol+GcTF87EeO5zKIE96f80tydark7EpXLPBuZ09Q=;
	b=dEOOGtUtSuHeKcf434FvCKt68YUPmAA4rfJbHuxFghLpPTd2v7krym9p0Bgte82GQZ6w
	 6yl6spQ+zVi1SdibWRDWCVrKgREOirIfTbuCvOg4AZYJLnu9q3x0NqXRUJqmXSk9ouIQq
	 O4SWLgPdWcpvyLnP1H07ghv5P9Ie3TM8DpKH7Oo466BHchT87wrnUgKkgB3mIINsRteIX
	 1pyqVcHYRGa7fNQXGqOwlyMGFU2Ts193XmbgRepR3teyzdkXDFnRpB8/J11WTLiyGlvA4
	 uPEZeY0cljaWVhOVRm4QboMFOskJH28IXZF8Q1+jTnrUi+DwPGaimBMqgMVfWZWmdXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zl9vCLsv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCEF606A33A
	for <chrome-platform@lists.linux.dev>; Tue, 24 Nov 2026 08:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zl9vCLsv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C9571F000C0;
	Tue, 24 Nov 2026 08:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795508485;
	bh=lg2Ol+GcTF87EeO5zKIE96f80tydark7EpXLPBuZ09Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Zl9vCLsviLUB+KgY/hLHX6ialrS8kcqQiIZp8kkQ3WYC9ZcQqAquI3LjB/FGCkxr4
	 eTeoLnyhS83DqkRX9IzpOaRQ19x5xFCheYjTrF8Mtf3R6aKb3LV8taB62V53RfHU/9
	 nyawoARuKCnyJ789tlxBTXBj0hBGGyDQqBsgIqbtY3DKg7WLooq+84j25uiLfSkjHh
	 51JgXnCDPGnkY2g2NHhp8/iRwQ0hStSvohcBCJm3lcWgQr4n/AZJCv9xFN+mWnpgZ8
	 GhSGaJpqMNxOUxJshiCmzydgbogckHdHbqZ6QL9bsiK0lD2lRmv9ZJ5I+PyhQvWltp
	 CRAEQW8rRxBXQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>
Cc: tzungbi@kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH 2/9] platform/chrome: cros_ec_proto: Retry sending command on -EAGAIN
Date: Tue, 24 Nov 2026 08:21:05 +0000
Message-ID: <20261124082112.3361229-3-tzungbi@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
In-Reply-To: <20261124082112.3361229-1-tzungbi@kernel.org>
References: <20261124082112.3361229-1-tzungbi@kernel.org>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Underlying transport mediums can be transiently unavailable and return
-EAGAIN.  Retry sending the command in cros_ec_send_command() up to
EC_COMMAND_SEND_RETRIES times with a short delay between attempts.

Check `msg->result == EC_RES_IN_PROGRESS` before retrying so commands
that are already executing on the EC go directly to
cros_ec_wait_until_complete().

Similarly, continue polling in cros_ec_wait_until_complete() when
EC_CMD_RESEND_RESPONSE fails with -EAGAIN.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 0306bedd0f0f..135134a1e317 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -16,6 +16,7 @@
 #include "cros_ec_trace.h"
 
 #define EC_COMMAND_RETRIES	50
+#define EC_COMMAND_SEND_RETRIES	5
 #define RWSIG_CONTINUE_RETRIES	8
 #define RWSIG_CONTINUE_MAX_ERRORS_IN_ROW	3
 
@@ -194,6 +195,9 @@ static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev,
 			orig_msg->command = orig_cmd;
 			orig_msg->outsize = orig_outsize;
 			orig_msg->version = orig_version;
+
+			if (ret == -EAGAIN)
+				continue;
 			return ret;
 		}
 	}
@@ -203,10 +207,19 @@ static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev,
 
 static int cros_ec_send_command(struct cros_ec_device *ec_dev, struct cros_ec_command *msg)
 {
-	int ret = cros_ec_xfer_command(ec_dev, msg);
+	int retry_count = EC_COMMAND_SEND_RETRIES;
+	int ret;
+
+retry:
+	ret = cros_ec_xfer_command(ec_dev, msg);
 
 	if (msg->result == EC_RES_IN_PROGRESS)
-		ret = cros_ec_wait_until_complete(ec_dev, msg);
+		return cros_ec_wait_until_complete(ec_dev, msg);
+
+	if (ret == -EAGAIN && retry_count--) {
+		usleep_range(10000, 11000);
+		goto retry;
+	}
 
 	return ret;
 }
-- 
2.56.1.831.g720f3f5937-goog

