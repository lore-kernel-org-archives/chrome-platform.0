Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25F4367
	for <chrome-platform@lists.linux.dev>; Thu,  7 Jul 2022 02:51:44 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-31c9a49a1a8so67405777b3.9
        for <chrome-platform@lists.linux.dev>; Wed, 06 Jul 2022 19:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=7LPSlq7Trkpni6Jiwio8XRfrUDHcOcS9L2wBFBR2Vzo=;
        b=abzazCQT38DTazMiKkJ2tFav1z5MzZhausH2mwikpoIfOK5eCPul9C4byXwCWzLOXT
         xhWQL709yuL0pVbkXWaW5K+AjBEWpvihA98fJhwMJn/OIqLAXF6Shi6B+NSxcOw+wHZf
         pcnPXwc4JBaHkMYDqlIlE7KjNr/uDUgN5443g6weKVY1Z73u+0XxnMPkxh+Imd8V66x7
         snjGnB4jYIyvwGmkLd6IxcgwES5AtwFd2OBUt6eZsu/RHseCE/L6WO04BAMXge5uscNA
         UuwnwCqOHx5M8cjTWO77p1d3CrFvCp7ePhNo+QPLwaetw2HcmdKMBnorMsRG2/SIUD+4
         Q7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=7LPSlq7Trkpni6Jiwio8XRfrUDHcOcS9L2wBFBR2Vzo=;
        b=TOXM+0igZgVluE1b0R6LKdIxlzEcEFHfaCinRHmDvxMEAYHmunTRPFofr+fqfu01OM
         3PFQW+wxBOVYCAzH3L+B7hsEOxsLymDGxu+Qxejx4Qm3BA6zGBbhjR7dF2Vv7TxF/6Tj
         GgoLVr02cg6u3i4nzL1ZZp9O4sntk6kZt6CPp7oK8WLSZpVpMe0adKyZvpe6JnPNpIe8
         B+oMtEhSD2c8VNTuqYdKfEvExWObMZZd5mIA0q6XqJkw2k4kOQXAQ8OkXgc1WPNd5siB
         Whk+nUvn1h8d2xMwyqoJUoLV/yJ7WYszsTPNyH1Ek4P38vsJ/91gvHhx1vOsFxEkYNcc
         7koA==
X-Gm-Message-State: AJIora9TyYGBYpiykOLfMNpPnA3hoZb5t6aX7pQZg3SIzMHSIvkQ4X6b
	21JkdWzuuk/pHJdgczuZ5kcgFYtyHA==
X-Google-Smtp-Source: AGRyM1sv2sZJGNvWqq79iz8jLwYOOA59LiIbMmIQLBcMUQ60SAqPfvBk+4L77cgS6cOmbTQVOiDruUFRyg==
X-Received: from timvp.bld.corp.google.com ([2620:15c:183:200:7d77:c591:814b:4db6])
 (user=timvp job=sendgmr) by 2002:a25:3414:0:b0:66e:4752:b055 with SMTP id
 b20-20020a253414000000b0066e4752b055mr21451158yba.40.1657162303830; Wed, 06
 Jul 2022 19:51:43 -0700 (PDT)
Date: Wed,  6 Jul 2022 20:51:39 -0600
Message-Id: <20220706205136.v2.1.Ic7a7c81f880ab31533652e0928aa6e687bb268b5@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v2] platform/chrome: cros_ec: Send host event for prepare/complete
From: Tim Van Patten <timvp@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: rrangel@chromium.org, robbarnes@google.com, 
	Tim Van Patten <timvp@google.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Update cros_ec_lpc_pm_ops to call cros_ec_lpc_suspend() during PM
.prepare() and cros_ec_lpc_resume() during .complete. This allows the
EC to log entry/exit of AP's suspend/resume more accurately.

Signed-off-by: Tim Van Patten <timvp@google.com>
---

Changes in v2:
- Include cros_ec_resume() return value in dev_info() output.
- Guard setting .prepare/.complete with #ifdef CONFIG_PM_SLEEP.

 drivers/platform/chrome/cros_ec_lpc.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 7677ab3c0ead9..ce49fbc4ed2e1 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -534,19 +534,27 @@ static int cros_ec_lpc_suspend(struct device *dev)
 {
 	struct cros_ec_device *ec_dev = dev_get_drvdata(dev);
 
+	dev_info(dev, "Prepare EC suspend\n");
+
 	return cros_ec_suspend(ec_dev);
 }
 
-static int cros_ec_lpc_resume(struct device *dev)
+static void cros_ec_lpc_resume(struct device *dev)
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
+	.prepare = cros_ec_lpc_suspend,
+	.complete = cros_ec_lpc_resume
+#endif
 };
 
 static struct platform_driver cros_ec_lpc_driver = {
-- 
2.37.0.rc0.161.g10f37bed90-goog

