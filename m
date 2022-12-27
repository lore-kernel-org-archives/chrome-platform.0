Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4673B63C8
	for <chrome-platform@lists.linux.dev>; Tue, 27 Dec 2022 19:33:10 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id y3so7211627ilq.0
        for <chrome-platform@lists.linux.dev>; Tue, 27 Dec 2022 11:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/vFqs9zTl4UAxKrKxsxms/5j3RJaU9FKMLZvOt0iQs=;
        b=oCDoLpOy+2jWXVLrcvUNlYTWaXjNhm5UxcC8EI6ZFW/yjDEZKrc2o5NKDuzvpelFvN
         nDnx4zEm28GxT3Bp91fsXJ23rf+N9gdP2rAr2J+FzcYns7h1SsiUmFZJDOxo1o+32gaf
         24wk8dKHiJE3Quldwf6ZWdMGR8YM/R7qZQaAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/vFqs9zTl4UAxKrKxsxms/5j3RJaU9FKMLZvOt0iQs=;
        b=s/T28CmivhuJ9NjLfgCqWSKQAyuoTJhGaylAez/ninjGRLVh7VlqHEhLoFY6ChsF6K
         DBdS9qWt+gRkkSw6Z1ot/qEIGuXwcp2RtHUtzIpiTfmxgtcttzyteOUSRk6xa0/Hqau/
         hQGX9XhitEnFQKQm1G6yLDjbRILKJrjAySmjVqw9tlg04a2uf3okLmzXsaedXwgzxWH1
         l+uhZaBcljkodzC/fk/oeZQHMk8D+SLeMA0ymm6pwj2lM7wWyVeHtd8DwiPgC2IuSP6z
         So6BiVllRgt+u1pOjkKqZUNeloLihtDEw8jRDPb+TGXb6lOaMZ5W+IaSZ3btqwSicABo
         SovQ==
X-Gm-Message-State: AFqh2kru7pa16jChte2ShULWEF9viXV9NsAdQo9lBhHDOrPDDTaypjD2
	MiN6cm1OxcaWrUEvMKZGux8SAw==
X-Google-Smtp-Source: AMrXdXtzTM1OkqtpgvC+HTQ30IXvgX12WHCehN4EDAO4nxLZcNIFYRDGEoSFyn+PgsHskYw6A+oxPA==
X-Received: by 2002:a05:6e02:1d99:b0:30b:d861:2c84 with SMTP id h25-20020a056e021d9900b0030bd8612c84mr20324642ila.0.1672169589390;
        Tue, 27 Dec 2022 11:33:09 -0800 (PST)
Received: from markhas1.corp.google.com ([100.107.108.223])
        by smtp.gmail.com with ESMTPSA id a10-20020a02ac0a000000b003755a721e98sm4504995jao.107.2022.12.27.11.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 11:33:09 -0800 (PST)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Raul Rangel <rrangel@chromium.org>,
	Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
	Mark Hasemeyer <markhas@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev
Subject: [PATCH v13 3/3] platform/chrome: cros_ec_uart: Add DT enumeration support
Date: Tue, 27 Dec 2022 12:32:24 -0700
Message-Id: <20221227123212.v13.3.Ie23c217d69ff25d7354db942613f143bbc8ef891@changeid>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20221227123212.v13.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
References: <20221227123212.v13.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
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
Reviewed-by: Prashant Malani <pmalani@chromium.org>

---

Changes in v13:
- No change

Changes in v12:
- Add Reviewed-by: Prashant Malani <pmalani@chromium.org>

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
index 971ea4bc2df80..0cef2888dffd0 100644
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
2.39.0.314.g84b9a713c41-goog

