Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CEA3C1E
	for <chrome-platform@lists.linux.dev>; Fri,  1 Jul 2022 15:54:28 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-317765eb7ccso21919817b3.13
        for <chrome-platform@lists.linux.dev>; Fri, 01 Jul 2022 08:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=nhCCzZMa1NRxw8NA7BhUvRU+X+N/8lSC/+E4poQXxXg=;
        b=GwgECqQfra9vVYA3QvdkTdaAb2D9IVUyR9uGRyWgTcDgxzxUrHgC3N3VCkF13Kfpea
         U1iWeRJfXV4EFTbea/73wvzow60RLTEFwKnp6djpYBaBX0iTekhkHv+P0kixnppFKorw
         En+D7SEVMyjmu8G+Txk6xf30szE+rn5RuV29kAIgsgtpmb+YRmNZBKpe1LJbVtHvKfdV
         Xy6tRJNeCwUD/ae7wY/cRCuHdCIFq4MbAH746J5m/tTPjjw1amSBk+gOhUg0UXbzrBdB
         uNrbDhIgcj3TEEwq3XOL+xLQp+Z55B8XvS5W7MhM/RF4TNY3M2HMyhyMczoZVKWtG3bx
         vReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=nhCCzZMa1NRxw8NA7BhUvRU+X+N/8lSC/+E4poQXxXg=;
        b=yWwHqepcdwUHMl9KwUTARTUsoEV/KrNJfzHfyLloaL22NBPS5OX8ghe6HxCw0BQs/c
         MXZiXKWaRMdVSvhaPDXVY6L/TnY2fQj5Ks8+LxP2OpubePpeEtr+Lo2u0qOYhstMqHqs
         HCJeCjwp0fNS0vdWuZBsaq4NSWx9tpBBmR64gPJNJslHltHQ5dTf3CHh9wklnhXeHmZ5
         vfVNqfhQoXNeTVXQkvRqKGYO4tE03OfQIDxXf/tcea4dHTKD+QejyFyWiQ+X61zH/y19
         x2OtywCpCVS8q42hoXmD8rTmbIrdS6zSBsElI3ZKF/qkCLDfWk9G34WX+A7ZnofdA2Ny
         SslA==
X-Gm-Message-State: AJIora9YrtywYKRF1TmpIWNtevLQvXZdRvRaPJv1vriZbDolOKUEM85c
	VNPEFXqOULuGXesJn28JdS7UPlvn/w==
X-Google-Smtp-Source: AGRyM1v1m+1kAkaGguGEjtHSsXlrp3OWRf0ZqANHx5xmqifvAHQx6lQWEmGIMGySj89JqO8Q/CqOR0nffA==
X-Received: from timvp.bld.corp.google.com ([2620:15c:183:200:fb13:9807:34b4:6d59])
 (user=timvp job=sendgmr) by 2002:a81:8ac6:0:b0:31c:11fe:d215 with SMTP id
 a189-20020a818ac6000000b0031c11fed215mr17802733ywg.417.1656690867969; Fri, 01
 Jul 2022 08:54:27 -0700 (PDT)
Date: Fri,  1 Jul 2022 09:54:23 -0600
Message-Id: <20220701095421.1.I78ded92e416b55de31975686d34b2058d4761c07@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH] platform/chrome: cros_ec: Send host event for prepare/complete
From: Tim Van Patten <timvp@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: robbarnes@google.com, rrangel@chromium.org, 
	Tim Van Patten <timvp@google.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Update cros_ec_lpc_pm_ops to call cros_ec_lpc_suspend() during PM
.prepare() and cros_ec_lpc_resume() during .complete. This allows the
EC to log entry/exit of AP's suspend/resume more accurately.

Signed-off-by: Tim Van Patten <timvp@google.com>
---

 drivers/platform/chrome/cros_ec_lpc.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 7677ab3c0ead9..783a0e56bf5f3 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -534,19 +534,24 @@ static int cros_ec_lpc_suspend(struct device *dev)
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
 
-	return cros_ec_resume(ec_dev);
+	cros_ec_resume(ec_dev);
+
+	dev_info(dev, "EC resume completed\n");
 }
 #endif
 
 static const struct dev_pm_ops cros_ec_lpc_pm_ops = {
-	SET_LATE_SYSTEM_SLEEP_PM_OPS(cros_ec_lpc_suspend, cros_ec_lpc_resume)
+	.prepare = cros_ec_lpc_suspend,
+	.complete = cros_ec_lpc_resume
 };
 
 static struct platform_driver cros_ec_lpc_driver = {
-- 
2.37.0.rc0.161.g10f37bed90-goog

