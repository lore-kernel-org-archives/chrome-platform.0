Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1BC7C
	for <chrome-platform@lists.linux.dev>; Wed, 15 Jun 2022 05:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF3B3C341C8;
	Wed, 15 Jun 2022 05:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655269988;
	bh=eh0wHoBVv18wEv+R8ggGvnitBSyOqK/G5EAzt9lOmDw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yt6hKy+q5jlj//QHdEMotgEX4SCsX6VksZfcJLmvBrSCgEjbj1WPuLitNbK9+X6sC
	 HYBF2o6ffImHUQ2HHDHjFOHSrscqV/kzcG4U0eLMZcQJOGaD8jTfGUX7KzhUygvD5I
	 jFkfGtRWO8Gpu3tYP1cuiwEUaYcpsOAcfiCsk5GcmXBEajxrKNg/VGsz9K7ZS3ov8N
	 1WW/4os/TJQbny/tyt6s9C0VANaH0P2QC/WEWDX5xujWxF2/62C+2CpBwHJ6AIqs8h
	 7v+c5kYRWNMFlTFv2ED0reJHkgDyeSyTWm/6HGlL2riJjJ0Wgao2NgWWGXPLLmsBjn
	 OkE4OrWNIRcJg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] platform/chrome: cros_ec_proto: separate cros_ec_xfer_command()
Date: Wed, 15 Jun 2022 05:12:41 +0000
Message-Id: <20220615051248.1628156-5-tzungbi@kernel.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220615051248.1628156-1-tzungbi@kernel.org>
References: <20220615051248.1628156-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cros_ec_send_command() has extra logic to handle EC_RES_IN_PROGRESS.
Separate the command transfer part into cros_ec_xfer_command() so
that other functions can re-use it.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index b02fd1414e52..0cec013be3d3 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -107,7 +107,7 @@ static int prepare_tx_legacy(struct cros_ec_device *ec_dev,
 	return EC_MSG_TX_PROTO_BYTES + msg->outsize;
 }
 
-static int cros_ec_send_command(struct cros_ec_device *ec_dev, struct cros_ec_command *msg)
+static int cros_ec_xfer_command(struct cros_ec_device *ec_dev, struct cros_ec_command *msg)
 {
 	int ret;
 	int (*xfer_fxn)(struct cros_ec_device *ec, struct cros_ec_command *msg);
@@ -123,14 +123,21 @@ static int cros_ec_send_command(struct cros_ec_device *ec_dev, struct cros_ec_co
 		 * the EC is trying to use protocol v2, on an underlying
 		 * communication mechanism that does not support v2.
 		 */
-		dev_err_once(ec_dev->dev,
-			     "missing EC transfer API, cannot send command\n");
+		dev_err_once(ec_dev->dev, "missing EC transfer API, cannot send command\n");
 		return -EIO;
 	}
 
 	trace_cros_ec_request_start(msg);
 	ret = (*xfer_fxn)(ec_dev, msg);
 	trace_cros_ec_request_done(msg, ret);
+
+	return ret;
+}
+
+static int cros_ec_send_command(struct cros_ec_device *ec_dev, struct cros_ec_command *msg)
+{
+	int ret = cros_ec_xfer_command(ec_dev, msg);
+
 	if (msg->result == EC_RES_IN_PROGRESS) {
 		int i;
 		struct cros_ec_command *status_msg;
-- 
2.36.1.476.g0c4daa206d-goog

