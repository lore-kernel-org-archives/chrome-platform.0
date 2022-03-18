Received: from gateway20.websitewelcome.com (gateway20.websitewelcome.com [192.185.50.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137754C99
	for <chrome-platform@lists.linux.dev>; Fri, 18 Mar 2022 17:18:45 +0000 (UTC)
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
	by gateway20.websitewelcome.com (Postfix) with ESMTP id 4CF30400C347E
	for <chrome-platform@lists.linux.dev>; Fri, 18 Mar 2022 11:54:25 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with SMTP
	id VFrsnLDyNdx86VFrtnBtzH; Fri, 18 Mar 2022 11:54:25 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Wi952GqghCdLpBfnclSbwbrPudUBqxfLgOmi5Y4q56U=; b=CTusl16pLAfpHfeZrbRLpkfDgx
	N0YMEkZahV1OMNZOWzVdVKgRGp2UvL/oIpw+ggLxFkMcloArawFLKKFGTy1KAdf+ZMpRMBjK0sGLT
	ey0slJBxe8vu/7VGW6uSwDzhvVs+z7CAduUOM4JsvUIM0XK7ru9IaIOKd9YPDXb7EwSUTwWtw8Bhw
	1UqWwxxJI9mwcEMphufdDCjrZpcrGP6wK5W1QcGAvdcWmHA2gAPsuK5bPM/UiSuXxR9T9UzQpT/Vl
	3+Fdmd1VfHOPyzhfe0evUVKHi+oT1AtjTqs4CBysQ3AExrzORFUHzt02EUlpQ3ckffZWbAxi+F1ig
	TfBXn+Fg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:57540 helo=localhost)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@roeck-us.net>)
	id 1nVFrs-000Xrz-G1; Fri, 18 Mar 2022 16:54:24 +0000
From: Guenter Roeck <linux@roeck-us.net>
To: Benson Leung <bleung@chromium.org>
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	Rob Barnes <robbarnes@google.com>,
	Rajat Jain <rajatja@google.com>,
	Brian Norris <briannorris@chromium.org>,
	Parth Malkan <parthmalkan@google.com>
Subject: [PATCH v2] platform/chrome: Re-introduce cros_ec_cmd_xfer and use it for ioctls
Date: Fri, 18 Mar 2022 09:54:22 -0700
Message-Id: <20220318165422.686848-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nVFrs-000Xrz-G1
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:57540
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 7
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes

Commit 413dda8f2c6f ("platform/chrome: cros_ec_chardev: Use
cros_ec_cmd_xfer_status helper") inadvertendly changed the userspace ABI.
Previously, cros_ec ioctls would only report errors if the EC communication
failed, and otherwise return success and the result of the EC
communication. An EC command execution failure was reported in the EC
response field. The above mentioned commit changed this behavior, and the
ioctl itself would fail. This breaks userspace commands trying to analyze
the EC command execution error since the actual EC command response is no
longer reported to userspace.

Fix the problem by re-introducing the cros_ec_cmd_xfer() helper, and use it
to handle ioctl messages.

Fixes: 413dda8f2c6f ("platform/chrome: cros_ec_chardev: Use cros_ec_cmd_xfer_status helper")
Cc: Daisuke Nojiri <dnojiri@chromium.org>
Cc: Rob Barnes <robbarnes@google.com>
Cc: Rajat Jain <rajatja@google.com>
Cc: Brian Norris <briannorris@chromium.org>
Cc: Parth Malkan <parthmalkan@google.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Updated comments / return value description. No functional change.

 drivers/platform/chrome/cros_ec_chardev.c   |  2 +-
 drivers/platform/chrome/cros_ec_proto.c     | 50 +++++++++++++++++----
 include/linux/platform_data/cros_ec_proto.h |  3 ++
 3 files changed, 45 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_chardev.c b/drivers/platform/chrome/cros_ec_chardev.c
index e0bce869c49a..fd33de546aee 100644
--- a/drivers/platform/chrome/cros_ec_chardev.c
+++ b/drivers/platform/chrome/cros_ec_chardev.c
@@ -301,7 +301,7 @@ static long cros_ec_chardev_ioctl_xcmd(struct cros_ec_dev *ec, void __user *arg)
 	}
 
 	s_cmd->command += ec->cmd_offset;
-	ret = cros_ec_cmd_xfer_status(ec->ec_dev, s_cmd);
+	ret = cros_ec_cmd_xfer(ec->ec_dev, s_cmd);
 	/* Only copy data to userland if data was received. */
 	if (ret < 0)
 		goto exit;
diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index c4caf2e2de82..ac1419881ff3 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -560,22 +560,28 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
 EXPORT_SYMBOL(cros_ec_query_all);
 
 /**
- * cros_ec_cmd_xfer_status() - Send a command to the ChromeOS EC.
+ * cros_ec_cmd_xfer() - Send a command to the ChromeOS EC.
  * @ec_dev: EC device.
  * @msg: Message to write.
  *
- * Call this to send a command to the ChromeOS EC. This should be used instead of calling the EC's
- * cmd_xfer() callback directly. It returns success status only if both the command was transmitted
- * successfully and the EC replied with success status.
+ * Call this to send a command to the ChromeOS EC. This should be used instead
+ * of calling the EC's cmd_xfer() callback directly. This function does not
+ * convert EC command execution error codes to Linux error codes. Most
+ * in-kernel users will want to use cros_ec_cmd_xfer_status() instead since
+ * that function implements the conversion.
  *
  * Return:
- * >=0 - The number of bytes transferred
- * <0 - Linux error code
+ * >0 - EC command was executed successfully. The return value is the number
+ *      of bytes returned by the EC (excluding the header).
+ * =0 - EC communication was successful. EC command execution results are
+ *      reported in msg->result. The result will be EC_RES_SUCCESS if the
+ *      command was executed successfully or report an EC command execution
+ *      error.
+ * <0 - EC communication error. Return value is the Linux error code.
  */
-int cros_ec_cmd_xfer_status(struct cros_ec_device *ec_dev,
-			    struct cros_ec_command *msg)
+int cros_ec_cmd_xfer(struct cros_ec_device *ec_dev, struct cros_ec_command *msg)
 {
-	int ret, mapped;
+	int ret;
 
 	mutex_lock(&ec_dev->lock);
 	if (ec_dev->proto_version == EC_PROTO_VERSION_UNKNOWN) {
@@ -616,6 +622,32 @@ int cros_ec_cmd_xfer_status(struct cros_ec_device *ec_dev,
 	ret = send_command(ec_dev, msg);
 	mutex_unlock(&ec_dev->lock);
 
+	return ret;
+}
+EXPORT_SYMBOL(cros_ec_cmd_xfer);
+
+/**
+ * cros_ec_cmd_xfer_status() - Send a command to the ChromeOS EC.
+ * @ec_dev: EC device.
+ * @msg: Message to write.
+ *
+ * Call this to send a command to the ChromeOS EC. This should be used instead of calling the EC's
+ * cmd_xfer() callback directly. It returns success status only if both the command was transmitted
+ * successfully and the EC replied with success status.
+ *
+ * Return:
+ * >=0 - The number of bytes transferred.
+ * <0 - Linux error code
+ */
+int cros_ec_cmd_xfer_status(struct cros_ec_device *ec_dev,
+			    struct cros_ec_command *msg)
+{
+	int ret, mapped;
+
+	ret = cros_ec_cmd_xfer(ec_dev, msg);
+	if (ret < 0)
+		return ret;
+
 	mapped = cros_ec_map_error(msg->result);
 	if (mapped) {
 		dev_dbg(ec_dev->dev, "Command result (err: %d [%d])\n",
diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
index df3c78c92ca2..16931569adce 100644
--- a/include/linux/platform_data/cros_ec_proto.h
+++ b/include/linux/platform_data/cros_ec_proto.h
@@ -216,6 +216,9 @@ int cros_ec_prepare_tx(struct cros_ec_device *ec_dev,
 int cros_ec_check_result(struct cros_ec_device *ec_dev,
 			 struct cros_ec_command *msg);
 
+int cros_ec_cmd_xfer(struct cros_ec_device *ec_dev,
+		     struct cros_ec_command *msg);
+
 int cros_ec_cmd_xfer_status(struct cros_ec_device *ec_dev,
 			    struct cros_ec_command *msg);
 
-- 
2.35.1

