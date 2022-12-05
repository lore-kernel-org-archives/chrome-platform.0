Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E88517D1
	for <chrome-platform@lists.linux.dev>; Mon,  5 Dec 2022 06:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A05C433D6;
	Mon,  5 Dec 2022 06:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670220649;
	bh=KJ9OyA0Vh7ucCm+6QPHfqAkB7SH227/+1tu/V9/8p+o=;
	h=From:To:Cc:Subject:Date:From;
	b=cbdV1FrYbk69UOr1NeZ4PxrnefVHC3Sx0MRdQQ4wJg1bwoONEaElS1hikHDtxTS3m
	 CKBcO+TBzPGkQosdCe5EN8HSWkIJ9AfWAMpphK2eWu6m3SsuFDso6eQuRsRFeyts1X
	 4E5eSoIl4rcDGZJmyU8C58ui96dvjbxW1Vm81C4z0P8jb9X1zOx3VqWgXNDJmdCXPs
	 PLh0IqptQz7RMvKxEw3C5CSPcmlq6sqR1a/c+LVOoqmFznseuDioy13ThGCTKZvjU9
	 8uLxoXKOyxvM3hRWoFwDFKj8jvfR03dMfWA0qzZRNNTxTAyMHr/zoeAvpXE5kiqu1A
	 HKYyVWdJvYTMA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org
Subject: [PATCH] platform/chrome: use sysfs_emit_at() instead of scnprintf()
Date: Mon,  5 Dec 2022 14:10:42 +0800
Message-Id: <20221205061042.1774769-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.39.0.rc0.267.gcb52ba06e7-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Follow the advice in Documentation/filesystems/sysfs.rst:
show() should only use sysfs_emit() or sysfs_emit_at() when formatting
the value to be returned to user space.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
Inspired by https://patchwork.kernel.org/project/chrome-platform/patch/202212021656040995199@zte.com.cn/

 drivers/platform/chrome/cros_ec_sysfs.c | 36 ++++++++++---------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_sysfs.c b/drivers/platform/chrome/cros_ec_sysfs.c
index e45e57cee3a8..09e3bf5e8ec6 100644
--- a/drivers/platform/chrome/cros_ec_sysfs.c
+++ b/drivers/platform/chrome/cros_ec_sysfs.c
@@ -27,10 +27,9 @@ static ssize_t reboot_show(struct device *dev,
 {
 	int count = 0;
 
-	count += scnprintf(buf + count, PAGE_SIZE - count,
-			   "ro|rw|cancel|cold|disable-jump|hibernate|cold-ap-off");
-	count += scnprintf(buf + count, PAGE_SIZE - count,
-			   " [at-shutdown]\n");
+	count += sysfs_emit_at(buf, count,
+			       "ro|rw|cancel|cold|disable-jump|hibernate|cold-ap-off");
+	count += sysfs_emit_at(buf, count, " [at-shutdown]\n");
 	return count;
 }
 
@@ -138,12 +137,9 @@ static ssize_t version_show(struct device *dev,
 	/* Strings should be null-terminated, but let's be sure. */
 	r_ver->version_string_ro[sizeof(r_ver->version_string_ro) - 1] = '\0';
 	r_ver->version_string_rw[sizeof(r_ver->version_string_rw) - 1] = '\0';
-	count += scnprintf(buf + count, PAGE_SIZE - count,
-			   "RO version:    %s\n", r_ver->version_string_ro);
-	count += scnprintf(buf + count, PAGE_SIZE - count,
-			   "RW version:    %s\n", r_ver->version_string_rw);
-	count += scnprintf(buf + count, PAGE_SIZE - count,
-			   "Firmware copy: %s\n",
+	count += sysfs_emit_at(buf, count, "RO version:    %s\n", r_ver->version_string_ro);
+	count += sysfs_emit_at(buf, count, "RW version:    %s\n", r_ver->version_string_rw);
+	count += sysfs_emit_at(buf, count, "Firmware copy: %s\n",
 			   (r_ver->current_image < ARRAY_SIZE(image_names) ?
 			    image_names[r_ver->current_image] : "?"));
 
@@ -152,13 +148,12 @@ static ssize_t version_show(struct device *dev,
 	msg->insize = EC_HOST_PARAM_SIZE;
 	ret = cros_ec_cmd_xfer_status(ec->ec_dev, msg);
 	if (ret < 0) {
-		count += scnprintf(buf + count, PAGE_SIZE - count,
+		count += sysfs_emit_at(buf, count,
 				   "Build info:    XFER / EC ERROR %d / %d\n",
 				   ret, msg->result);
 	} else {
 		msg->data[EC_HOST_PARAM_SIZE - 1] = '\0';
-		count += scnprintf(buf + count, PAGE_SIZE - count,
-				   "Build info:    %s\n", msg->data);
+		count += sysfs_emit_at(buf, count, "Build info:    %s\n", msg->data);
 	}
 
 	/* Get chip info. */
@@ -166,7 +161,7 @@ static ssize_t version_show(struct device *dev,
 	msg->insize = sizeof(*r_chip);
 	ret = cros_ec_cmd_xfer_status(ec->ec_dev, msg);
 	if (ret < 0) {
-		count += scnprintf(buf + count, PAGE_SIZE - count,
+		count += sysfs_emit_at(buf, count,
 				   "Chip info:     XFER / EC ERROR %d / %d\n",
 				   ret, msg->result);
 	} else {
@@ -175,12 +170,9 @@ static ssize_t version_show(struct device *dev,
 		r_chip->vendor[sizeof(r_chip->vendor) - 1] = '\0';
 		r_chip->name[sizeof(r_chip->name) - 1] = '\0';
 		r_chip->revision[sizeof(r_chip->revision) - 1] = '\0';
-		count += scnprintf(buf + count, PAGE_SIZE - count,
-				   "Chip vendor:   %s\n", r_chip->vendor);
-		count += scnprintf(buf + count, PAGE_SIZE - count,
-				   "Chip name:     %s\n", r_chip->name);
-		count += scnprintf(buf + count, PAGE_SIZE - count,
-				   "Chip revision: %s\n", r_chip->revision);
+		count += sysfs_emit_at(buf, count, "Chip vendor:   %s\n", r_chip->vendor);
+		count += sysfs_emit_at(buf, count, "Chip name:     %s\n", r_chip->name);
+		count += sysfs_emit_at(buf, count, "Chip revision: %s\n", r_chip->revision);
 	}
 
 	/* Get board version */
@@ -188,13 +180,13 @@ static ssize_t version_show(struct device *dev,
 	msg->insize = sizeof(*r_board);
 	ret = cros_ec_cmd_xfer_status(ec->ec_dev, msg);
 	if (ret < 0) {
-		count += scnprintf(buf + count, PAGE_SIZE - count,
+		count += sysfs_emit_at(buf, count,
 				   "Board version: XFER / EC ERROR %d / %d\n",
 				   ret, msg->result);
 	} else {
 		r_board = (struct ec_response_board_version *)msg->data;
 
-		count += scnprintf(buf + count, PAGE_SIZE - count,
+		count += sysfs_emit_at(buf, count,
 				   "Board version: %d\n",
 				   r_board->board_version);
 	}
-- 
2.39.0.rc0.267.gcb52ba06e7-goog

