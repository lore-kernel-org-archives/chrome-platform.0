Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70270256C
	for <chrome-platform@lists.linux.dev>; Mon, 22 Aug 2022 16:28:24 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-335420c7bfeso195735087b3.16
        for <chrome-platform@lists.linux.dev>; Mon, 22 Aug 2022 09:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc;
        bh=AxrrQ/cU54Du/u6O6i3La3esh5CO5fel4eR9JQBqAWo=;
        b=S3lkQEZjJ1frFfLakQXlelf15iQfOokMGlDcgxARv/KBBT/r2A1LzgMC1e4XwLS20J
         oP5iWjbcOlW5Z8J5UwdsKts+WuCMiLZTXDmS7ONa+zjN0++zr2IRViU7+5sgaDcatEw0
         H4aPGKJkv0GX2aTP/N7ddrNADyht+To69kQGwMECr3OTofmPiqND0KG2LYKRzrPJsJIy
         fbMAjEsOPTfukK/yZkcFtpJuKAQ1P/rMJkkNAdh9XSjISCuH1lEp99PufbtCGSmB25Wc
         yroZOr+6mNwK9Z5/6bypdf4KR/tPb1JII+jVp7Lt9+5sU901o/Y80V5nEeEZdghsSz/k
         rsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc;
        bh=AxrrQ/cU54Du/u6O6i3La3esh5CO5fel4eR9JQBqAWo=;
        b=YeoVA+osNjBlap/7uDqP1EVNWVekMVjQOYwHgy58EcCnfAb08rztjX2C7+19PHkuFF
         eCqBnsR2Rmk6T4fxZiZq4w9T9db9S7r7+1KONgxnA30bfW+e+o0h0va/dY2x/4gFQKFB
         vIp2ZTCha1zhOAdKVGcAs/T+pRU2TCWIexVt2DCCrj3aGBvWHKa5g0+wvrzRFmjG8b/9
         tbSejJwY8V/Di+HC/TQ7uKnGdieRQAcUFqPm5SmQmoojNWOc++8RbJ7rfmTZc1R8b8PI
         B7reEpkf+tt4oH8mjZcThFBDpHs7oQkfZsikpujxpFI+HwyhCrQMPLLBzmSedu2zaVsh
         DnSw==
X-Gm-Message-State: ACgBeo3MpHBC3/i3lrqacnMY+vaBkYYu95BBFmm8IsAA6mGTi5spvlam
	EJESXSTwrKmjnQzLDx5GHz4PpjGSyA==
X-Google-Smtp-Source: AA6agR7Mw58dFCBQKrf04lrAy5d1aWcFcyQvhwDseobFsnt7EMHiq+aZlF5HNSA7qRRwrRN8i20UJVnkeA==
X-Received: from timvp-p620-9115096.bld.corp.google.com ([2620:15c:183:200:762:7c61:946f:731])
 (user=timvp job=sendgmr) by 2002:a81:1e0d:0:b0:33b:fb67:9895 with SMTP id
 e13-20020a811e0d000000b0033bfb679895mr5820461ywe.188.1661185703445; Mon, 22
 Aug 2022 09:28:23 -0700 (PDT)
Date: Mon, 22 Aug 2022 10:28:20 -0600
Message-Id: <20220822102812.v4.1.I0c49f19e953a76ff6e6debc2990a1d108d6f842a@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
Subject: [PATCH v4] platform/chrome: cros_ec_lpc: Move host event to prepare/complete
From: Tim Van Patten <timvp@google.com>
To: rrangel@chromium.org, robbarnes@google.com
Cc: Tim Van Patten <timvp@google.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Update cros_ec_lpc_pm_ops to call cros_ec_lpc_prepare() during PM
.prepare() and cros_ec_lpc_complete() during .complete(). This moves the
host event that the AP sends and allows the EC to log entry/exit of AP's
suspend/resume more accurately.

Signed-off-by: Tim Van Patten <timvp@google.com>
---

Changes in v4:
- Update title and description.

Changes in v3:
- Update cros_ec_lpc_suspend() to cros_ec_lpc_prepare()
- Update cros_ec_lpc_resume() to cros_ec_lpc_complete()

Changes in v2:
- Include cros_ec_resume() return value in dev_info() output.
- Guard setting .prepare/.complete with #ifdef CONFIG_PM_SLEEP.

 drivers/platform/chrome/cros_ec_lpc.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 7677ab3c0ead..ce49fbc4ed2e 100644
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
2.37.1.595.g718a3a8f04-goog

