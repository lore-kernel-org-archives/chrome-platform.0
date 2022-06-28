Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9402E368
	for <chrome-platform@lists.linux.dev>; Tue, 28 Jun 2022 02:49:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84311C385A5;
	Tue, 28 Jun 2022 02:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656384573;
	bh=oEk4k9mHkKcxC41gNaDm4MHjECQ38Oqr6p+DJ62VmFI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TtNLZPKfb5e1D8uwOQHmy3VqSKSL1e2ZpUhDnShhObF/9+xP9VUkFBc8I/NyEWj70
	 oTF5yvlzVA8fHZo4huqaKV/Znp5t8nphFU5PlTBXQ9pEMnB3u7kKiO03X8deGZMNF3
	 19H+QarUgGU4IIDAyeawJ96rtZXoq5Bmaruzl90IvyjfSRwtzTPH5nJGNJYcCVSj1E
	 Okk83+Xf6E0E05rQs8yFrv9fL53JQ7oUCyUv+D2gkwfJAmQe9X6wALlXtV3xjhj+hu
	 BD7yebPCcTqgdICPoYetSwDfl16lFCDdzHFxGlAdD6+Veex5S5VlP31pX02Bc5C4tk
	 SHvBPww/Dz6uQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 01/11] platform/chrome: cros_ec_proto: add "cros_ec_" prefix to send_command()
Date: Tue, 28 Jun 2022 02:49:03 +0000
Message-Id: <20220628024913.1755292-2-tzungbi@kernel.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220628024913.1755292-1-tzungbi@kernel.org>
References: <20220628024913.1755292-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To be neat, add "cros_ec_" prefix to static function send_command().

Reviewed-by: Guenter Roeck <groeck@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 6923ea4401e5..b02fd1414e52 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -107,8 +107,7 @@ static int prepare_tx_legacy(struct cros_ec_device *ec_dev,
 	return EC_MSG_TX_PROTO_BYTES + msg->outsize;
 }
 
-static int send_command(struct cros_ec_device *ec_dev,
-			struct cros_ec_command *msg)
+static int cros_ec_send_command(struct cros_ec_device *ec_dev, struct cros_ec_command *msg)
 {
 	int ret;
 	int (*xfer_fxn)(struct cros_ec_device *ec, struct cros_ec_command *msg);
@@ -255,7 +254,7 @@ static int cros_ec_get_host_event_wake_mask(struct cros_ec_device *ec_dev, uint3
 	msg->command = EC_CMD_HOST_EVENT_GET_WAKE_MASK;
 	msg->insize = sizeof(*r);
 
-	ret = send_command(ec_dev, msg);
+	ret = cros_ec_send_command(ec_dev, msg);
 	if (ret < 0)
 		goto exit;
 
@@ -295,7 +294,7 @@ static int cros_ec_get_proto_info(struct cros_ec_device *ec_dev, int devidx)
 	msg->command = EC_CMD_PASSTHRU_OFFSET(devidx) | EC_CMD_GET_PROTOCOL_INFO;
 	msg->insize = sizeof(*info);
 
-	ret = send_command(ec_dev, msg);
+	ret = cros_ec_send_command(ec_dev, msg);
 	/*
 	 * Send command once again when timeout occurred.
 	 * Fingerprint MCU (FPMCU) is restarted during system boot which
@@ -304,7 +303,7 @@ static int cros_ec_get_proto_info(struct cros_ec_device *ec_dev, int devidx)
 	 * attempt because we waited at least EC_MSG_DEADLINE_MS.
 	 */
 	if (ret == -ETIMEDOUT)
-		ret = send_command(ec_dev, msg);
+		ret = cros_ec_send_command(ec_dev, msg);
 
 	if (ret < 0) {
 		dev_dbg(ec_dev->dev,
@@ -376,7 +375,7 @@ static int cros_ec_get_proto_info_legacy(struct cros_ec_device *ec_dev)
 	params = (struct ec_params_hello *)msg->data;
 	params->in_data = 0xa0b0c0d0;
 
-	ret = send_command(ec_dev, msg);
+	ret = cros_ec_send_command(ec_dev, msg);
 	if (ret < 0) {
 		dev_dbg(ec_dev->dev, "EC failed to respond to v2 hello: %d\n", ret);
 		goto exit;
@@ -453,7 +452,7 @@ static int cros_ec_get_host_command_version_mask(struct cros_ec_device *ec_dev,
 	pver = (struct ec_params_get_cmd_versions *)msg->data;
 	pver->cmd = cmd;
 
-	ret = send_command(ec_dev, msg);
+	ret = cros_ec_send_command(ec_dev, msg);
 	if (ret < 0)
 		goto exit;
 
@@ -634,7 +633,7 @@ int cros_ec_cmd_xfer(struct cros_ec_device *ec_dev, struct cros_ec_command *msg)
 		}
 	}
 
-	ret = send_command(ec_dev, msg);
+	ret = cros_ec_send_command(ec_dev, msg);
 	mutex_unlock(&ec_dev->lock);
 
 	return ret;
-- 
2.37.0.rc0.161.g10f37bed90-goog

