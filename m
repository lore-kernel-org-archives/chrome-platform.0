Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B52F7C
	for <chrome-platform@lists.linux.dev>; Mon,  5 Dec 2022 07:20:22 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id h15so4724128ilh.12
        for <chrome-platform@lists.linux.dev>; Sun, 04 Dec 2022 23:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFBuZgmPhW5LWntAwnJs0BrrqusNQIYCnHrYxYRlVks=;
        b=lkVVjG0Z8biqffn+OcAxsV1R0osXrCwi99bUnP2ndNZ3RweZZUHZ7VQyJmGuBmPjTI
         CpEgr1GsyGSbxYh2KToeaLCzobKs429ZafFNtxbE4nDlqdI8OA6fUQ1VfTjrL2AcziYA
         SYobP9ouwyxsQJalBeaFVZC8SWurgcVnPludY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFBuZgmPhW5LWntAwnJs0BrrqusNQIYCnHrYxYRlVks=;
        b=IcucJ3WL/vVL0ow8Yj5bU8bcADoyQde2MMqZC5Io2XXV2fkK1QObOUY6XaVre3Zvvd
         54AXhbBzUTTy9O3hWp95TWdL3iFVxNxZ638z8J7EKGCFk4hNb9R/0LoUhL2dSfQBL4PM
         pFBMoccRgNm529xLFqF+Zh9eY/11CpBCCeoWFmn/qHzmiWfd1xPkcn2uqFnMwzxsm/8X
         jJ5j5A3MCCyTbC8gkLomKbitUGfYDz38ZQv0TdTtzLIDibb1mRIyjWc6EOSLes3SdrL7
         i+jrHUbW9I8u9AoFLac/OzRisbZHU6TIv+8bLW+DI1SbMrdGlnG9gRsqc9oOvE9NyAtQ
         CGDw==
X-Gm-Message-State: ANoB5pm72onR+1LTQx9BUI6v9efLT61k7TRKjbuNG3PfLD8hhfIRvYvY
	ac1hNpS5DGqrQ08Eoia2IHZNaQ==
X-Google-Smtp-Source: AA0mqf5UQ+K5oGoOgAf0qW6vHXRTW1JfVIl85uBn5614aWT7wRKgHIDraWpOGZLqOSOKx+zjm/JYaA==
X-Received: by 2002:a05:6e02:1785:b0:303:542:f2c5 with SMTP id y5-20020a056e02178500b003030542f2c5mr18835048ilu.176.1670224821754;
        Sun, 04 Dec 2022 23:20:21 -0800 (PST)
Received: from markhas1.roam.corp.google.com (63-225-246-100.hlrn.qwest.net. [63.225.246.100])
        by smtp.gmail.com with ESMTPSA id a8-20020a021608000000b003755aa71fffsm5581184jaa.105.2022.12.04.23.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 23:20:21 -0800 (PST)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Raul Rangel <rrangel@chromium.org>,
	Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
	Mark Hasemeyer <markhas@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev
Subject: [PATCH v9 3/3] platform/chrome: cros_ec_uart: Add DT enumeration support
Date: Mon,  5 Dec 2022 00:20:01 -0700
Message-Id: <20221205001932.v9.3.Ie23c217d69ff25d7354db942613f143bbc8ef891@changeid>
X-Mailer: git-send-email 2.39.0.rc0.267.gcb52ba06e7-goog
In-Reply-To: <20221205001932.v9.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
References: <20221205001932.v9.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bhanu Prakash Maiya <bhanumaiya@chromium.org>

Existing firmware uses the "PRP0001" _HID and an associated compatible
string to enumerate the cros_ec_uart.

Add DT enumeration support for already shipped firmware.

Signed-off-by: Bhanu Prakash Maiya <bhanumaiya@chromium.org>
Co-developed-by: Mark Hasemeyer <markhas@chromium.org>
Signed-off-by: Mark Hasemeyer <markhas@chromium.org>

---

Changes in v9:
- Rebase onto for-next
- Update authorship

Changes in v8:
- No change

Changes in v7:
- Move PRP0001 enumeration support to its own commit

 drivers/platform/chrome/cros_ec_uart.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_uart.c b/drivers/platform/chrome/cros_ec_uart.c
index 4b416441f973c..ea4922238eaae 100644
--- a/drivers/platform/chrome/cros_ec_uart.c
+++ b/drivers/platform/chrome/cros_ec_uart.c
@@ -11,6 +11,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
 #include <linux/serdev.h>
@@ -347,6 +348,12 @@ static int __maybe_unused cros_ec_uart_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(cros_ec_uart_pm_ops, cros_ec_uart_suspend,
 			 cros_ec_uart_resume);
 
+static const struct of_device_id cros_ec_uart_of_match[] = {
+	{ .compatible = "google,cros-ec-uart" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, cros_ec_uart_of_match);
+
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id cros_ec_uart_acpi_id[] = {
 	{ "GOOG0019", 0 },
@@ -360,6 +367,7 @@ static struct serdev_device_driver cros_ec_uart_driver = {
 	.driver	= {
 		.name	= "cros-ec-uart",
 		.acpi_match_table = ACPI_PTR(cros_ec_uart_acpi_id),
+		.of_match_table = cros_ec_uart_of_match,
 		.pm	= &cros_ec_uart_pm_ops,
 	},
 	.probe		= cros_ec_uart_probe,
-- 
2.39.0.rc0.267.gcb52ba06e7-goog

