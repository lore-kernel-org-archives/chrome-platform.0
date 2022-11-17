Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480898BFF
	for <chrome-platform@lists.linux.dev>; Thu, 17 Nov 2022 18:49:24 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id q21so2082398iod.4
        for <chrome-platform@lists.linux.dev>; Thu, 17 Nov 2022 10:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwzrdAjSSAlR7tomqz0SMFI6hrURlEbNjDi6TcOBnt0=;
        b=E44uNGH0u4GiDI9/R8ntoTWwFpkCtXbQQISOpey6uGAk8d9oQyqEokIve+OP7X6gVR
         vBmMGMWfG2WltzzHPFvFHfREQNQwg7TMLrWzUDVYt2IXsK6xdSGVW8g67dbp11FwLfUj
         fTbO/ELwd/VaXdxMYgeS87+EWIbSshQFaJ334=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vwzrdAjSSAlR7tomqz0SMFI6hrURlEbNjDi6TcOBnt0=;
        b=hZImnKswu0299jJzB6hmWslGgnQAmCV/cNe/QpVeJsjHh82L3RJotYH+xlb4Rz4V4H
         uDq/6/kjd8SBSCUWRmoJvPwIyS10niSWjZkGk3Ysej+vcJ8Rua94z6JrC7xzfuQp8hBX
         7H+hRBJHwpS5uLlcHJVt7px+y6JgV/Ga2CU0t6HzwZeipRLqqMv3dazVm41F8hIAVubL
         QTlN4kidWkXkU5PDC8nHcAyUgmicVwtZyCYsFWOl5KhTUg5rh/3hjeYnNUa2iENwuO6U
         2QtBYPWo8T04iDlVpbpCzwQuA/+EEFRxEGThNN+90FxmP1kQcwX3g4TWkZ0Mcrfctek0
         wuIg==
X-Gm-Message-State: ANoB5pmR5upB/hRM0GqDiWzMKtPp4H8wjT4pSVtEHtZGhEiQR2an1o3t
	KN8Ezrs0DkDWsGeCdOWK96PKmw==
X-Google-Smtp-Source: AA0mqf4xJVic7rEkv3i2u+R7IhZ3CpWt29dtFNy0xvD3DKuKWyI1+zhINPI9HuFHKy5g90CRw0pBMQ==
X-Received: by 2002:a02:5dc1:0:b0:375:eb33:f73e with SMTP id w184-20020a025dc1000000b00375eb33f73emr1609076jaa.171.1668710963450;
        Thu, 17 Nov 2022 10:49:23 -0800 (PST)
Received: from markhas1.corp.google.com ([100.107.108.223])
        by smtp.gmail.com with ESMTPSA id q6-20020a02a986000000b00363faa1ea9asm503282jam.15.2022.11.17.10.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 10:49:23 -0800 (PST)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Raul Rangel <rrangel@chromium.org>,
	Mark Hasemeyer <markhas@chromium.org>,
	Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev
Subject: [PATCH v7 3/3] platform/chrome: cros_ec_uart: Add DT enumeration support
Date: Thu, 17 Nov 2022 11:48:48 -0700
Message-Id: <20221117114818.v7.3.Ie23c217d69ff25d7354db942613f143bbc8ef891@changeid>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
In-Reply-To: <20221117114818.v7.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
References: <20221117114818.v7.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Existing firmware uses the "PRP0001" _HID and an associated compatible
string to enumerate the cros_ec_uart.

Add DT enumeration support for already shipped firmware.

Signed-off-by: Bhanu Prakash Maiya <bhanumaiya@chromium.org>
Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
---

Changes in v7:
- Move PRP0001 enumeration support to its own commit

 drivers/platform/chrome/cros_ec_uart.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_uart.c b/drivers/platform/chrome/cros_ec_uart.c
index b5f72f0104985..d44efb78bc881 100644
--- a/drivers/platform/chrome/cros_ec_uart.c
+++ b/drivers/platform/chrome/cros_ec_uart.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/acpi.h>
+#include <linux/of.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
 #include <linux/serdev.h>
@@ -392,6 +393,12 @@ static int __maybe_unused cros_ec_uart_resume(struct device *dev)
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
@@ -405,6 +412,7 @@ static struct serdev_device_driver cros_ec_uart_driver = {
 	.driver	= {
 		.name	= "cros-ec-uart",
 		.acpi_match_table = ACPI_PTR(cros_ec_uart_acpi_id),
+		.of_match_table = cros_ec_uart_of_match,
 		.pm	= &cros_ec_uart_pm_ops,
 	},
 	.probe		= cros_ec_uart_probe,
-- 
2.38.1.584.g0f3c55d4c2-goog

