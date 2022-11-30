Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EB98460
	for <chrome-platform@lists.linux.dev>; Wed, 30 Nov 2022 20:13:41 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id bp12so8606991ilb.9
        for <chrome-platform@lists.linux.dev>; Wed, 30 Nov 2022 12:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4gs1nqhWEkh1q6oBgpXv2FkSjhvCSKGs/o2Pfz2jr8=;
        b=M/3A/m/rdnLCwq+N0mKcmdE9X0YNCiy+AKyIyVOzqAFNENc7fYG+WQp3vAo7AhXL3I
         /c99IHcFQIxBAKtKzz91w/vQs9yd0iVRHu0YI3a23Rk4+SO7U123BhA/BbYlNt3DyohU
         KKwz+K4DFd/l4UaDzw0Y0Qbq4Skp95Fid0TF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K4gs1nqhWEkh1q6oBgpXv2FkSjhvCSKGs/o2Pfz2jr8=;
        b=Dh29g2oGM9OmRovdDS29vhPkCHnpShuCICY/KDoAWamBscQi/OhmWYu3tIg+AckjvE
         1VZdfwu9LyO3oq3nI7AH+UD5wbVZDinjLLVXRcSyEH7jqrphlC68b9dJfwwyTTVC1Zg4
         MysadU2NwpFD6P2n4ZvDVF53NUkAnlzJ5v1C/71JmhTlN15fghnRR9xa561PvjH+40rm
         YOErC4TZD2TdxPtC2Xoef97ZpuW+wv7R21iyP3PhpCwfBHzNpoAt0FysT5fK2IHtAxFO
         v6OyUoeUW+KHc4bEROgK8TpCloTylU2zyE2J3sHUKRU7TFh2AoyF53rPEjopT+UHzDvX
         lK1A==
X-Gm-Message-State: ANoB5pmIr2oDNgNF0JVs4wGSXy2aWCXItydy1wPDHAQ2wHvT0wOVFYC8
	3vyKJj1NMivhbJsiyJksZyItAg==
X-Google-Smtp-Source: AA0mqf6T5GN72ySu99K1kzD6N8MC7OS5wEzGjRwq1jjcy6Lq7g/+7JYtHedGalV19WPXMWRa1LRi2A==
X-Received: by 2002:a05:6e02:2197:b0:302:391a:f67b with SMTP id j23-20020a056e02219700b00302391af67bmr22128556ila.265.1669839220208;
        Wed, 30 Nov 2022 12:13:40 -0800 (PST)
Received: from markhas1.lan (184-96-172-159.hlrn.qwest.net. [184.96.172.159])
        by smtp.gmail.com with ESMTPSA id r2-20020a02b102000000b00363e61908bfsm902158jah.10.2022.11.30.12.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 12:13:40 -0800 (PST)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Raul Rangel <rrangel@chromium.org>,
	Mark Hasemeyer <markhas@chromium.org>,
	Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
	Benson Leung <bleung@google.com>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev
Subject: [PATCH v8 3/3] platform/chrome: cros_ec_uart: Add DT enumeration support
Date: Wed, 30 Nov 2022 13:12:56 -0700
Message-Id: <20221130131245.v8.3.Ie23c217d69ff25d7354db942613f143bbc8ef891@changeid>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
In-Reply-To: <20221130131245.v8.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
References: <20221130131245.v8.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
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

Changes in v8:
- No change

Changes in v7:
- Move PRP0001 enumeration support to its own commit

 drivers/platform/chrome/cros_ec_uart.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_uart.c b/drivers/platform/chrome/cros_ec_uart.c
index ef9ac7ace04b6..521a3ee6f60b3 100644
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
@@ -385,6 +386,12 @@ static int __maybe_unused cros_ec_uart_resume(struct device *dev)
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
@@ -398,6 +405,7 @@ static struct serdev_device_driver cros_ec_uart_driver = {
 	.driver	= {
 		.name	= "cros-ec-uart",
 		.acpi_match_table = ACPI_PTR(cros_ec_uart_acpi_id),
+		.of_match_table = cros_ec_uart_of_match,
 		.pm	= &cros_ec_uart_pm_ops,
 	},
 	.probe		= cros_ec_uart_probe,
-- 
2.38.1.584.g0f3c55d4c2-goog

