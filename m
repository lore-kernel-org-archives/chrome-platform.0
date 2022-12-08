Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7141E8F74
	for <chrome-platform@lists.linux.dev>; Thu,  8 Dec 2022 19:40:00 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id 3so858397iou.12
        for <chrome-platform@lists.linux.dev>; Thu, 08 Dec 2022 11:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MF2GnFpAR/trOfRUw0h2YfNoFU34O3eLGi2QsSIBLfs=;
        b=hPlE8zmRLYztt7X5yzlayM9VZwsGmPFHXExXLXy7fB6CDM3KMd0FfG+TXSCQFj3HQI
         TNA799Zga7eR+gEPSU81vnBcgAS9bocdV3qnLB0KCUJsJG1IECxqxdjcPEmKOhqwygkr
         g1X6EuXc6obBF3e0FSWaTG/04o23f5jkvWHCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MF2GnFpAR/trOfRUw0h2YfNoFU34O3eLGi2QsSIBLfs=;
        b=kfY7BiXywRHTgae9e/73zvF1ep/RUDU6M8fSG2v+scWdkhmdPV+0N7hr9fJ9ZyTtQO
         lCBAjKESycTp6o7tE0jImO6UnSW6p1hHhxH49rnKziOX+8bEP4WTSIO88veit2VnHvza
         xKl9HIkl7CbxZ4/2K6qn1lKjpYLDRP4rmTfgGpFOUs6Uu/cFnhLXBX+K4V1x9vB2U81l
         98vhxO4z53wrJHxptH6Q0oiq4osfvztJFnbywNGoB8xmtnHIjQmYtjRuJ+6zCi6D/Y4+
         2RgRTCgUyN3JkOEKEty1AbhJQK4TzeMuA+C62v1eHiLQWMtv47/mg3VjnxuOvwQs0pbs
         Hv5Q==
X-Gm-Message-State: ANoB5pknE3FATocNes0ZocX8yk6TCWuL/7/xBR1rKAlzcs93CFJnJsrT
	ccSf+0v5uhdpwSRPz3BZ6Axwhw==
X-Google-Smtp-Source: AA0mqf4HUxa7I5h8YzHUdDeqvcqIxgkPjSTtyeHTtSnHiCQBhTKqlHCF2IR0+G+K5L9dbJgS0pVJ/g==
X-Received: by 2002:a05:6602:184f:b0:6e2:ca58:695 with SMTP id d15-20020a056602184f00b006e2ca580695mr2038236ioi.3.1670528399577;
        Thu, 08 Dec 2022 11:39:59 -0800 (PST)
Received: from markhas1.roam.corp.google.com (63-225-246-100.hlrn.qwest.net. [63.225.246.100])
        by smtp.gmail.com with ESMTPSA id b5-20020a05660214c500b006df13af1f16sm9245441iow.50.2022.12.08.11.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 11:39:59 -0800 (PST)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Raul Rangel <rrangel@chromium.org>,
	Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
	Mark Hasemeyer <markhas@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev
Subject: [PATCH v11 3/3] platform/chrome: cros_ec_uart: Add DT enumeration support
Date: Thu,  8 Dec 2022 12:39:52 -0700
Message-Id: <20221208123944.v11.3.Ie23c217d69ff25d7354db942613f143bbc8ef891@changeid>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
In-Reply-To: <20221208123944.v11.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
References: <20221208123944.v11.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
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

Changes in v11:
- No change

Changes in v10:
- No change

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
index 43a7493347a59..bf0c291914725 100644
--- a/drivers/platform/chrome/cros_ec_uart.c
+++ b/drivers/platform/chrome/cros_ec_uart.c
@@ -11,6 +11,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_data/cros_ec_proto.h>
 #include <linux/serdev.h>
 #include <linux/slab.h>
@@ -326,6 +327,12 @@ static int __maybe_unused cros_ec_uart_resume(struct device *dev)
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
@@ -339,6 +346,7 @@ static struct serdev_device_driver cros_ec_uart_driver = {
 	.driver	= {
 		.name	= "cros-ec-uart",
 		.acpi_match_table = ACPI_PTR(cros_ec_uart_acpi_id),
+		.of_match_table = cros_ec_uart_of_match,
 		.pm	= &cros_ec_uart_pm_ops,
 	},
 	.probe		= cros_ec_uart_probe,
-- 
2.39.0.rc1.256.g54fd8350bd-goog

