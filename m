Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6164E1C2B
	for <chrome-platform@lists.linux.dev>; Fri,  2 Dec 2022 09:03:08 +0000 (UTC)
Received: from mxde.zte.com.cn (unknown [10.35.20.165])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4NNmz436ByzW2H
	for <chrome-platform@lists.linux.dev>; Fri,  2 Dec 2022 16:57:04 +0800 (CST)
Received: from mxus.zte.com.cn (unknown [10.207.168.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxde.zte.com.cn (FangMail) with ESMTPS id 4NNmyg3mZvz4xD42
	for <chrome-platform@lists.linux.dev>; Fri,  2 Dec 2022 16:56:43 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.138])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxus.zte.com.cn (FangMail) with ESMTPS id 4NNmyV0LY7z9tyD6
	for <chrome-platform@lists.linux.dev>; Fri,  2 Dec 2022 16:56:34 +0800 (CST)
Received: from mxct.zte.com.cn (unknown [192.168.251.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4NNmyJ0lt7z4xVnl
	for <chrome-platform@lists.linux.dev>; Fri,  2 Dec 2022 16:56:24 +0800 (CST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4NNmy71JNcz501Qn;
	Fri,  2 Dec 2022 16:56:15 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.40.50])
	by mse-fl2.zte.com.cn with SMTP id 2B28u1JC018322;
	Fri, 2 Dec 2022 16:56:02 +0800 (+08)
	(envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid31;
	Fri, 2 Dec 2022 16:56:04 +0800 (CST)
Date: Fri, 2 Dec 2022 16:56:04 +0800 (CST)
X-Zmail-TransId: 2af96389bda4ffffffffd68155a6
X-Mailer: Zmail v1.0
Message-ID: <202212021656040995199@zte.com.cn>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <bleung@chromium.org>
Cc: <groeck@chromium.org>, <chrome-platform@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBwbGF0Zm9ybS9jaHJvbWU6IHVzZSBzeXNmc19lbWl0KCkgdG8gaW5zdGVhZCBvZiBzY25wcmludGYoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 2B28u1JC018322
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.251.14.novalocal with ID 6389BDDF.000 by FangMail milter!
X-FangMail-Envelope: 1669971424/4NNmz436ByzW2H/6389BDDF.000/10.35.20.165/[10.35.20.165]/mxde.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6389BDDF.000/4NNmz436ByzW2H

From: ye xingchen <ye.xingchen@zte.com.cn>

Follow the advice of the Documentation/filesystems/sysfs.rst and show()
should only use sysfs_emit() or sysfs_emit_at() when formatting the
value to be returned to user space.

Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/platform/chrome/cros_ec_lightbar.c | 14 ++++++--------
 drivers/platform/chrome/cros_ec_sysfs.c    |  4 ++--
 drivers/platform/chrome/wilco_ec/sysfs.c   |  3 +--
 3 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platform/chrome/cros_ec_lightbar.c
index 1674105decfb..376425bbd8ff 100644
--- a/drivers/platform/chrome/cros_ec_lightbar.c
+++ b/drivers/platform/chrome/cros_ec_lightbar.c
@@ -34,7 +34,7 @@ static ssize_t interval_msec_show(struct device *dev,
 {
 	unsigned long msec = lb_interval_jiffies * 1000 / HZ;

-	return scnprintf(buf, PAGE_SIZE, "%lu\n", msec);
+	return sysfs_emit(buf, "%lu\n", msec);
 }

 static ssize_t interval_msec_store(struct device *dev,
@@ -169,7 +169,7 @@ static ssize_t version_show(struct device *dev,
 	if (!get_lightbar_version(ec, &version, &flags))
 		return -EIO;

-	return scnprintf(buf, PAGE_SIZE, "%d %d\n", version, flags);
+	return sysfs_emit(buf, "%d %d\n", version, flags);
 }

 static ssize_t brightness_store(struct device *dev,
@@ -302,17 +302,15 @@ static ssize_t sequence_show(struct device *dev,

 	ret = cros_ec_cmd_xfer_status(ec->ec_dev, msg);
 	if (ret < 0) {
-		ret = scnprintf(buf, PAGE_SIZE, "XFER / EC ERROR %d / %d\n",
-				ret, msg->result);
+		ret = sysfs_emit(buf, "XFER / EC ERROR %d / %d\n", ret, msg->result);
 		goto exit;
 	}

 	resp = (struct ec_response_lightbar *)msg->data;
 	if (resp->get_seq.num >= ARRAY_SIZE(seqname))
-		ret = scnprintf(buf, PAGE_SIZE, "%d\n", resp->get_seq.num);
+		ret = sysfs_emit(buf, "%d\n", resp->get_seq.num);
 	else
-		ret = scnprintf(buf, PAGE_SIZE, "%s\n",
-				seqname[resp->get_seq.num]);
+		ret = sysfs_emit(buf, "%s\n", seqname[resp->get_seq.num]);

 exit:
 	kfree(msg);
@@ -483,7 +481,7 @@ static ssize_t userspace_control_show(struct device *dev,
 				      struct device_attribute *attr,
 				      char *buf)
 {
-	return scnprintf(buf, PAGE_SIZE, "%d\n", userspace_control);
+	return sysfs_emit(buf, "%d\n", userspace_control);
 }

 static ssize_t userspace_control_store(struct device *dev,
diff --git a/drivers/platform/chrome/cros_ec_sysfs.c b/drivers/platform/chrome/cros_ec_sysfs.c
index f07eabcf9494..e45e57cee3a8 100644
--- a/drivers/platform/chrome/cros_ec_sysfs.c
+++ b/drivers/platform/chrome/cros_ec_sysfs.c
@@ -227,7 +227,7 @@ static ssize_t flashinfo_show(struct device *dev,

 	resp = (struct ec_response_flash_info *)msg->data;

-	ret = scnprintf(buf, PAGE_SIZE,
+	ret = sysfs_emit(buf,
 			"FlashSize %d\nWriteSize %d\n"
 			"EraseSize %d\nProtectSize %d\n",
 			resp->flash_size, resp->write_block_size,
@@ -264,7 +264,7 @@ static ssize_t kb_wake_angle_show(struct device *dev,
 		goto exit;

 	resp = (struct ec_response_motion_sense *)msg->data;
-	ret = scnprintf(buf, PAGE_SIZE, "%d\n", resp->kb_wake_angle.ret);
+	ret = sysfs_emit(buf, "%d\n", resp->kb_wake_angle.ret);
 exit:
 	kfree(msg);
 	return ret;
diff --git a/drivers/platform/chrome/wilco_ec/sysfs.c b/drivers/platform/chrome/wilco_ec/sysfs.c
index 79a5e8fa680f..893c59dde32a 100644
--- a/drivers/platform/chrome/wilco_ec/sysfs.c
+++ b/drivers/platform/chrome/wilco_ec/sysfs.c
@@ -119,8 +119,7 @@ static ssize_t get_info(struct device *dev, char *buf, enum get_ec_info_op op)
 	if (ret < 0)
 		return ret;

-	return scnprintf(buf, PAGE_SIZE, "%.*s\n", (int)sizeof(resp.value),
-			 (char *)&resp.value);
+	return sysfs_emit(buf, "%.*s\n", (int)sizeof(resp.value), (char *)&resp.value);
 }

 static ssize_t version_show(struct device *dev, struct device_attribute *attr,
-- 
2.25.1
