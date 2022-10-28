Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BC5BA41
	for <chrome-platform@lists.linux.dev>; Fri, 28 Oct 2022 23:18:58 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id l6so3729646ilq.3
        for <chrome-platform@lists.linux.dev>; Fri, 28 Oct 2022 16:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bn9D9kuzB0NhBMRKYFistkOXIvTNO5wPVqxp1zHUjc8=;
        b=WojazKC0d63LVfJ/T+T2JiU6FUu4WAxWNzgr8bbMShpYRjsGvJLOX6FM6Ll0XdyqyG
         KoQ/0QbAQHAoVz5AkhHQFPWE60wFseeOcgVxlRT0GFls7wg4LezmfYXe6elg7TdUg3kh
         VLGjbqmT2QLCJq6AdnqiRSuB8WZnrcY4DRnXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bn9D9kuzB0NhBMRKYFistkOXIvTNO5wPVqxp1zHUjc8=;
        b=qgcZZyahN/y8NhJnm67SuNPqvmmQxCamCggtkwh0p/QohIIe6NKKEYHWlT1CCHbOs3
         RL4WmCmi3ves3MYAMGPYvzAZ2VBEyPZzrObdJsT4xKDBZFTRI7fuTMqer2tYYyA1eYd/
         RXojnRW78axvTl2mFh4QT9HDtehx2WHUPa5LY3kcmT/4Tp3u8HxliI8f/fNECpYH8AeB
         Kb3ouPzh5/j5M2qvNKR8KsMYZ8bB7/5VY8HvPKt/bJWi/iOHUV9/gbQQ8XUsbFPnNncy
         4LjiNLYg/68sqWwte+wVfigLP024q42rgT9EBstyrT7gw2ujOBtskXZOv6Amry7z/kAN
         fimw==
X-Gm-Message-State: ACrzQf0c9r4pN8aR3n6YUszeyfRbRoDtgyLVdRdw6FMkN6e/Qy2vIiZz
	rF2KksP+z7NYEPogKOKh4uvVDQ==
X-Google-Smtp-Source: AMsMyM5I/UiaH28bV/RZ17OwbrA3rYeBNyGNSjKjgnnoNH201C6V1iLEKWvXR4T1aFgB1x15UAFjbQ==
X-Received: by 2002:a05:6e02:1c44:b0:2ff:c897:de3c with SMTP id d4-20020a056e021c4400b002ffc897de3cmr869564ilg.59.1666999138068;
        Fri, 28 Oct 2022 16:18:58 -0700 (PDT)
Received: from timvp-p620-9115096.bld.corp.google.com ([2620:15c:183:200:d811:d631:c956:7aba])
        by smtp.gmail.com with ESMTPSA id w15-20020a056602034f00b006cad30ad430sm1555iou.23.2022.10.28.16.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 16:18:57 -0700 (PDT)
From: Tim Van Patten <timvp@chromium.org>
To: rrangel@chromium.org,
	robbarnes@google.com
Cc: Tim Van Patten <timvp@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8] platform/chrome: cros_ec_lpc: Move host command to prepare/complete
Date: Fri, 28 Oct 2022 17:18:34 -0600
Message-Id: <20221028171820.v8.1.I55189adfdb8d025fc991a0fa820ec09078619b15@changeid>
X-Mailer: git-send-email 2.38.1.273.g43a17bfeac-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update cros_ec_lpc_pm_ops to call cros_ec_lpc_prepare() during PM
.prepare() and cros_ec_lpc_complete() during .complete(). This moves the
host command that the AP sends and allows the EC to log entry/exit of
AP's suspend/resume more accurately.

Signed-off-by: Tim Van Patten <timvp@chromium.org>
Reviewed-by: Raul E Rangel <rrangel@chromium.org>
---

Changes in v8:
- Resend with chromium.org account.
- No code changes.

Changes in v7:
- Rename "host event" to "host command" in title/description.

Changes in v6:
- Fully restore fixes from v3.

Changes in v5:
- Restore fixes from v3.

Changes in v4:
- Update title and description.

Changes in v3:
- Update cros_ec_lpc_suspend() to cros_ec_lpc_prepare()
- Update cros_ec_lpc_resume() to cros_ec_lpc_complete()

Changes in v2:
- Include cros_ec_resume() return value in dev_info() output.
- Guard setting .prepare/.complete with #ifdef CONFIG_PM_SLEEP.

 drivers/platform/chrome/cros_ec_lpc.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 7677ab3c0ead9..4158bdeee197b 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -530,23 +530,31 @@ static const struct dmi_system_id cros_ec_lpc_dmi_table[] __initconst = {
 MODULE_DEVICE_TABLE(dmi, cros_ec_lpc_dmi_table);
 
 #ifdef CONFIG_PM_SLEEP
-static int cros_ec_lpc_suspend(struct device *dev)
+static int cros_ec_lpc_prepare(struct device *dev)
 {
 	struct cros_ec_device *ec_dev = dev_get_drvdata(dev);
 
+	dev_info(dev, "Prepare EC suspend\n");
+
 	return cros_ec_suspend(ec_dev);
 }
 
-static int cros_ec_lpc_resume(struct device *dev)
+static void cros_ec_lpc_complete(struct device *dev)
 {
 	struct cros_ec_device *ec_dev = dev_get_drvdata(dev);
+	int ret;
+
+	ret = cros_ec_resume(ec_dev);
 
-	return cros_ec_resume(ec_dev);
+	dev_info(dev, "EC resume completed: ret = %d\n", ret);
 }
 #endif
 
 static const struct dev_pm_ops cros_ec_lpc_pm_ops = {
-	SET_LATE_SYSTEM_SLEEP_PM_OPS(cros_ec_lpc_suspend, cros_ec_lpc_resume)
+#ifdef CONFIG_PM_SLEEP
+	.prepare = cros_ec_lpc_prepare,
+	.complete = cros_ec_lpc_complete
+#endif
 };
 
 static struct platform_driver cros_ec_lpc_driver = {
-- 
2.38.1.273.g43a17bfeac-goog

