Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A7B3217
	for <chrome-platform@lists.linux.dev>; Mon, 10 Apr 2023 16:58:42 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id s93-20020a17090a2f6600b0024670ac71caso2255863pjd.4
        for <chrome-platform@lists.linux.dev>; Mon, 10 Apr 2023 09:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1681145922;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HaDUWzfCnhavY9dvdByWbTuvqMKEfss08PENWwdz0x0=;
        b=gSdy5gCc2tn4EHEcMCgn6NQZnsJFd7idyq5nXHD9bSAQ7HGjTo+I21JvHanxEM7qy/
         mU5lwAMDacPePcEh32j7UOZmQRMfAY9dxhte5tmL3utnT1eDaWM2scKaNuRj8KR4RTto
         mQyNoviHBk7fkA+dGtkW24tIu20ic6SJYIL42gUBMPZ2tB/2rSQq9yEmqeMKkJfjJqFF
         gLmLbXSYIdIDwBwpYGQstW0InyEzCWah3A93Xvd9ML+RH+hmmX9TnGJHWaQTMthtWkME
         BaxzPHSeiqn/Y/oMIp5EddvtFblHV5NWx6beGEIfPRubL3bqP+5LJJMJHu9yJ5hlYUvn
         M7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681145922;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HaDUWzfCnhavY9dvdByWbTuvqMKEfss08PENWwdz0x0=;
        b=HhQ9SvK4FOMqv9nIsHU9FDA0qanQxe7MK4DaOB6BaJdCoW09Eli+3+MtX9Bu+qxS7R
         cskS005RPFVTSmyw0zuUKG7YgnLE93QKSyw8GjwgEzpcgypV5kuh/EZsDsNHSKSj3K27
         KhF5vEFpLQ0D27zhO1NtMZm0TWDgxQAIyRj3IudGUJqa1t1QLHZcF7Wn91z4w+PWfUu2
         5BCycoszTX/Y//xXfVLeUqmsBz9slsV2ZzRuKszpbOc79rMWu3kiH1buWGHy6+l16+V+
         BlkZa2wVqZYg1hPDbUdmGtyi4wQi46CWoiMRUlO5JXc2jTTLvUVot+JoqEl5mXTYH+Hq
         Z6Vw==
X-Gm-Message-State: AAQBX9fBVXDxocmXjIfPqUuwj2WAzi68T3lNadihcROxpE87FUhRhkkS
	qBjOU/5YtITM2QO/NXjbRRgVsUuzvumJvZLnmJ92APn8MA10Y2iv/tBQugEFKgnAatbave6aJtm
	l9WkRBhavDP81u9W2JTRGk4rKXj3Oh8/XoWZlCahUhPHih1Cg07Ke8cHHZXXhbY+So3DtFa4b4+
	xWZj69sA==
X-Google-Smtp-Source: AKy350ZKVvghke/5Q5TVL44O5CxX5YgGAVFCLgWTNFumbIFKyCorbseKsjp8x+VGyhRCIHPLpt9347JLDhsN4/c=
X-Received: from robbarnes3.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6451])
 (user=robbarnes job=sendgmr) by 2002:a63:5fcb:0:b0:518:844d:bf78 with SMTP id
 t194-20020a635fcb000000b00518844dbf78mr1642137pgb.3.1681145921883; Mon, 10
 Apr 2023 09:58:41 -0700 (PDT)
Date: Mon, 10 Apr 2023 16:58:17 +0000
In-Reply-To: <ZC+BC062FGL5ylMb@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <ZC+BC062FGL5ylMb@google.com>
X-Mailer: git-send-email 2.40.0.577.gac1e443424-goog
Message-ID: <20230410165817.932449-1-robbarnes@google.com>
Subject: [PATCH v2] platform/chrome: cros_ec: Separate logic for getting panic info
From: Rob Barnes <robbarnes@google.com>
To: chrome-platform@lists.linux.dev
Cc: dnojiri@chromium.org, gwendal@chromium.org, tzungbi@kernel.org, 
	Rob Barnes <robbarnes@google.com>
Content-Type: text/plain; charset="UTF-8"

Create a separate function called cros_ec_get_panicinfo for getting
panic info from EC.

Currently cros_ec_create_panicinfo is the only caller.

Signed-off-by: Rob Barnes <robbarnes@google.com>
---
Changelog since v1:
- Minor cleanup

drivers/platform/chrome/cros_ec_debugfs.c | 42 ++++++++++++++++++-----
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform/chrome/cros_ec_debugfs.c
index 9044c6bab770..58d1d7f6c94f 100644
--- a/drivers/platform/chrome/cros_ec_debugfs.c
+++ b/drivers/platform/chrome/cros_ec_debugfs.c
@@ -400,24 +400,48 @@ static void cros_ec_cleanup_console_log(struct cros_ec_debugfs *debug_info)
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
 	int ret;
 	struct cros_ec_command *msg;
-	int insize;
 
-	insize = ec_dev->max_response;
+	if (!data || data_size <= 0 || data_size > ec_dev->max_response)
+		return -EINVAL;
 
-	msg = devm_kzalloc(debug_info->ec->dev,
-			sizeof(*msg) + insize, GFP_KERNEL);
+	msg = kzalloc(sizeof(*msg) + data_size, GFP_KERNEL);
 	if (!msg)
 		return -ENOMEM;
 
 	msg->command = EC_CMD_GET_PANIC_INFO;
-	msg->insize = insize;
+	msg->insize = data_size;
 
 	ret = cros_ec_cmd_xfer_status(ec_dev, msg);
+	if (ret < 0)
+		goto free;
+
+	memcpy(data, msg->data, data_size);
+
+free:
+	kfree(msg);
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
 	if (ret < 0) {
 		ret = 0;
 		goto free;
@@ -427,7 +451,7 @@ static int cros_ec_create_panicinfo(struct cros_ec_debugfs *debug_info)
 	if (ret == 0)
 		goto free;
 
-	debug_info->panicinfo_blob.data = msg->data;
+	debug_info->panicinfo_blob.data = data;
 	debug_info->panicinfo_blob.size = ret;
 
 	debugfs_create_blob("panicinfo", S_IFREG | 0444, debug_info->dir,
@@ -436,7 +460,7 @@ static int cros_ec_create_panicinfo(struct cros_ec_debugfs *debug_info)
 	return 0;
 
 free:
-	devm_kfree(debug_info->ec->dev, msg);
+	devm_kfree(debug_info->ec->dev, data);
 	return ret;
 }
 
-- 
2.40.0.577.gac1e443424-goog

