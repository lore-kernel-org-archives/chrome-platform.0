Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4727F
	for <chrome-platform@lists.linux.dev>; Tue,  2 Aug 2022 17:40:17 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id m5-20020a2598c5000000b0066faab590c5so11315717ybo.7
        for <chrome-platform@lists.linux.dev>; Tue, 02 Aug 2022 10:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=ONVk+IwfQtxkQMEE1txHxraIYz5uS1JfsA6nTBwgy+I=;
        b=VPi1EX9sV3DI3/6YfkpEke2lO5PZ2alhRTtje8l5A7fsDOKzH3zs6lpGJSy3VD1Kwc
         gSTmLomYI5iNuo+5Dqa+wxPnj84hVgh40XecRcNFbjGl/DcJomF4EL5SW2MQzR0HRS3o
         0GRMM0y9FmEbHuaDTRci/3TrTZRz5Qkwp9ZLY0htMy51YggPCh+k6riQG7qBynu6Ljt7
         txyB+cVI8TajmI/Z4yiE37p1A9Wz+9JSgHW4g3VQLlfsiVZGY4znC33U/QUu/zKe1xeK
         dX9bi2BWvBTIC+gFLiM97+BKol+uHfNy3wfz3NdjPaTTpLfjFQs7vf9UrHszGXJQ4/5N
         zgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=ONVk+IwfQtxkQMEE1txHxraIYz5uS1JfsA6nTBwgy+I=;
        b=xSPfDkpG0+zkApVwG4FESVFugeFQfBL5cLvXcStB57KqcCMx9qEQIn78/o1R44juOg
         zOes9xODRU/mI/Gl3C0XyEBD1AhRy8ofZvNg/4KwNcH+ZsgqfTzQm21UIEG7gm7rfkCf
         xFXIo1buxz9DeyKYq+aBGt/9KQw5z+5rvChKlcheMcDWU+ADOwezUZhAmcJNUFYdcGPI
         FgLksYW/MuWsVNmZ/b2ZoLFQ5fs8EdYbnuT8P2NZLnhnxFYg21Ij1LPWAuQw20no6SmK
         /XD3IpJr2BFGdGN+vw3TAxQBXVSiqFBHMUslrS7vwioCchqfbSFRWB3xM3rThGUZlJbW
         LPSA==
X-Gm-Message-State: ACgBeo0iJ5iXgzvnhTsnJjvAwwW2w7jO/Dp+v6LgzEqdS8VepDuMLOhf
	8CbhldQp5qc1hXM6A3lbei2vH+xI8A==
X-Google-Smtp-Source: AA6agR6G2fc61/vdfjDY2CqjeZK0f37dBSOoZhf6/RxQc1A4UreeeeNwIkSFEV8AcCr2cuFO5qqUDWYlZw==
X-Received: from timvp.bld.corp.google.com ([2620:15c:183:200:61dc:f28d:ccc1:638a])
 (user=timvp job=sendgmr) by 2002:a05:6902:1404:b0:64e:1ec0:cec with SMTP id
 z4-20020a056902140400b0064e1ec00cecmr15406103ybu.588.1659462017098; Tue, 02
 Aug 2022 10:40:17 -0700 (PDT)
Date: Tue,  2 Aug 2022 11:40:08 -0600
Message-Id: <20220802113957.v3.1.I2c8c550183162e7594309b66d19af696b8d84552@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.1.455.g008518b4e5-goog
Subject: [PATCH v3] platform/chrome: cros_ec: Send host event for prepare/complete
From: Tim Van Patten <timvp@google.com>
To: rrangel@chromium.org, robbarnes@google.com
Cc: Tim Van Patten <timvp@google.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Update cros_ec_lpc_pm_ops to call cros_ec_lpc_prepare() during PM
.prepare() and cros_ec_lpc_complete() during .complete(). This allows the
EC to log entry/exit of AP's suspend/resume more accurately.

Signed-off-by: Tim Van Patten <timvp@google.com>
---

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
2.37.1.455.g008518b4e5-goog

