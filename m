Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275DCA94F
	for <chrome-platform@lists.linux.dev>; Thu,  6 Apr 2023 16:14:24 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id b16-20020a17090a991000b0023f803081beso12835061pjp.3
        for <chrome-platform@lists.linux.dev>; Thu, 06 Apr 2023 09:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680797663;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WSWz/YXccaOSnt56HcEB5iWpOOqQeZJL3ogKdzUpqTA=;
        b=kNAAWdspvYyiZSL1HSAzbG2E+NirXjaPSEP2mkTwBz4Cv2+85r0ywaUla+7bYHH+ob
         T2pRxy5mt7mV3JrokPmrTImdFU8DfNGTvZH1rViWJ/yarjU5OSQjFTh/noArYCtMvpdj
         m6SVdc61qVm2YoE1S5bWAdhBxP9F6QIzXm3EF2aHbRQbRTE3598nKSmFCjNFf1Z4uQWa
         rOiFurnBjBoW5XbJ2rJzwSu+IL8uT0LVeo1i7vRmRiGO176GI3S8lCc/WlEj9uVNsgru
         MDKygAXL8A4aIYujJoLenJxBAUxW/EDIYqIyzoei4wOgh+xTFpPi7gLCH8wk6GHuIkO8
         6eLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680797663;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WSWz/YXccaOSnt56HcEB5iWpOOqQeZJL3ogKdzUpqTA=;
        b=UZeDwo+WExCK8Db9Sbh21iKnHpDZb7E1ZVDgvzpRASqGK/tyhRaLYp23ZitvzMCdPP
         cFcOzI8mxNV+eig7NSw2XBwJY1AyCEc5KS0UIVEnIc9inVE+uMjYcDJgdZJmvMPKIdaQ
         NXZsZ/5/Jyi7ry5Qnzhnn+y/GcMdsoMj+M4pnBxsihO6xWmDCsyorOQFweaplc0cp7aK
         YHF5xTHzfYPy+mUAwUyN/q9z/36I/cQQZiCIkbQxA9PQ/Kv5U//AofTUfVUaobMowgmT
         ptG1BK7kbvU2Wz0/4wJ+9bWVUaKOBdpAkC7L4S18+YT8sXieIJOOfP1j07qOH8Cnx6er
         niOA==
X-Gm-Message-State: AAQBX9dvNEaxpEIrNY2PEoA8ZjlCGpXdOw2UTlMwzKMPHVsCWjGYXyYB
	r56lq5AOXt1fmv01krebU2NryWbyBeVUbDXeVX+oS0pqTjxYCMYvDjfYKeznh8UAGxNEF9HiK0/
	wiRSbuc8kVNuWEOORt0ySVZ/HjKgFzXmpbt+1wR/NpT7HByHhMOiCTMkMBc0vbWE+4qKk9K4FTo
	cCM1mAqw==
X-Google-Smtp-Source: AKy350YK/9nVOxJzCAsERY4xKgQNGa3FPVTDjPS3qNCK1+BqSjJ9pDy6eeTLo3aLOzT5qAziurDXvxwx3AMJK6M=
X-Received: from robbarnes3.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6451])
 (user=robbarnes job=sendgmr) by 2002:a17:902:eb52:b0:1a1:aea7:6d6d with SMTP
 id i18-20020a170902eb5200b001a1aea76d6dmr4211539pli.9.1680797663472; Thu, 06
 Apr 2023 09:14:23 -0700 (PDT)
Date: Thu,  6 Apr 2023 16:14:14 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230406095423.1.I8e3c16fbecd17956b0a44fc486a8ede3ddb13eec@changeid>
Subject: [PATCH] platform/chrome: cros_ec: Separate logic for getting panic info
From: Rob Barnes <robbarnes@google.com>
To: chrome-platform@lists.linux.dev
Cc: dnojiri@chromium.org, groweck@chromium.org, gwendal@chromium.org, 
	Rob Barnes <robbarnes@google.com>
Content-Type: text/plain; charset="UTF-8"

Create a separate function called cros_ec_get_panicinfo for getting
panic info from EC.

Currently cros_ec_create_panicinfo is the only caller.

Signed-off-by: Rob Barnes <robbarnes@google.com>
---

 drivers/platform/chrome/cros_ec_debugfs.c | 46 ++++++++++++++++++-----
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform/chrome/cros_ec_debugfs.c
index a98c529d8c698..def7b2f2dd7f9 100644
--- a/drivers/platform/chrome/cros_ec_debugfs.c
+++ b/drivers/platform/chrome/cros_ec_debugfs.c
@@ -400,24 +400,50 @@ static void cros_ec_cleanup_console_log(struct cros_ec_debugfs *debug_info)
 	}
 }
 
-static int cros_ec_create_panicinfo(struct cros_ec_debugfs *debug_info)
+/**
+ * Returns the size of the panicinfo data fetched from the EC
+ */
+static int cros_ec_get_panicinfo(struct cros_ec_device *ec_dev, uint8_t *data,
+				 int data_size)
 {
-	struct cros_ec_device *ec_dev = debug_info->ec->ec_dev;
-	int ret;
+	int ret = 0;
 	struct cros_ec_command *msg;
-	int insize;
 
-	insize = ec_dev->max_response;
+	if (!data || data_size <= 0)
+		return -EINVAL;
 
-	msg = devm_kzalloc(debug_info->ec->dev,
-			sizeof(*msg) + insize, GFP_KERNEL);
+	msg = devm_kzalloc(ec_dev->dev, sizeof(*msg) + data_size, GFP_KERNEL);
 	if (!msg)
 		return -ENOMEM;
 
 	msg->command = EC_CMD_GET_PANIC_INFO;
-	msg->insize = insize;
+	msg->insize = data_size;
 
 	ret = cros_ec_cmd_xfer_status(ec_dev, msg);
+
+	if (ret < 0)
+		goto free;
+
+	memcpy(data, msg->data, data_size);
+
+free:
+	devm_kfree(ec_dev->dev, msg);
+	return ret;
+}
+
+static int cros_ec_create_panicinfo(struct cros_ec_debugfs *debug_info)
+{
+	struct cros_ec_device *ec_dev = debug_info->ec->ec_dev;
+	int ret;
+	void *data;
+
+	data = devm_kzalloc(debug_info->ec->dev, ec_dev->max_response,
+			    GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	ret = cros_ec_get_panicinfo(ec_dev, data, ec_dev->max_response);
+
 	if (ret < 0) {
 		ret = 0;
 		goto free;
@@ -427,7 +453,7 @@ static int cros_ec_create_panicinfo(struct cros_ec_debugfs *debug_info)
 	if (ret == 0)
 		goto free;
 
-	debug_info->panicinfo_blob.data = msg->data;
+	debug_info->panicinfo_blob.data = data;
 	debug_info->panicinfo_blob.size = ret;
 
 	debugfs_create_blob("panicinfo", S_IFREG | 0444, debug_info->dir,
@@ -436,7 +462,7 @@ static int cros_ec_create_panicinfo(struct cros_ec_debugfs *debug_info)
 	return 0;
 
 free:
-	devm_kfree(debug_info->ec->dev, msg);
+	devm_kfree(debug_info->ec->dev, data);
 	return ret;
 }
 
-- 
2.39.2

