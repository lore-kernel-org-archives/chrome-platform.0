Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8147E63C3
	for <chrome-platform@lists.linux.dev>; Fri,  9 Dec 2022 16:26:30 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id h17so136466ila.6
        for <chrome-platform@lists.linux.dev>; Fri, 09 Dec 2022 08:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LET7+BVLD7u2mz2p/Z3V+N5nYBkLwsfyiST0eTO7hzc=;
        b=NDNMKLLDBAWf3MbF+6zPgovX77wTaVAyPMqg01VPkudPh14T1CwOao5Z19mx2+2xV7
         FTo99ZqyJQ83ny1hGx7ubIC4VplT5IlyRzD4g+UjgtMNKneXVSelvMsYF6GYqUyu48hU
         iJz/SJ0ywZgJyvxcUzTBEYtGf8wooFhu7IDSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LET7+BVLD7u2mz2p/Z3V+N5nYBkLwsfyiST0eTO7hzc=;
        b=T6GdAWdOeahrCHqegYt+I69eNc0SntWpuWUsgPVmM3WTQg9Z4a49X9nQSTUz3bFCRj
         AZ3hwJStv34gR8RzyEulXYTRudgqLKyE/UbPGJouoX67BGewN3b1LwfjfBkfr/ncI99V
         1/bnzE0D7QkBfixIhd9LO1QmgFy4QXcB9+jFDXpqOgtvTWTEfYORiIXhN1Cg5NxzgB+e
         F9EOzYIuxXzqOzQHsK+fSv6/Oy2VczHztmLur+FvAMXJXgHJHRkMLkq9Ip9n6GNdBnZ4
         +H42ji5i+1zz68noJ5VJoAegoES5qrX8+OuWAnwJGhel4760lgshL1QOrHGO1ns3/Y1A
         fPaw==
X-Gm-Message-State: ANoB5pmES37va0vGjL8ICarJXrOf0Iq22I0cAdXmjuUYIxZcJGqnakeW
	Ls+Dg8ASV+mknfI8YaVgdeghFfUE9dX0Afm/
X-Google-Smtp-Source: AA0mqf7uI6aQYrVVsoULaPvpOL/5vXuK5Rne8e1xh4Y/XIf48fOnoV5sJ274O/1EpgGZjeFYKlMMtA==
X-Received: by 2002:a92:d9ce:0:b0:303:2f20:1a05 with SMTP id n14-20020a92d9ce000000b003032f201a05mr3535629ilq.24.1670603189613;
        Fri, 09 Dec 2022 08:26:29 -0800 (PST)
Received: from markhas1.roam.corp.google.com (63-225-246-100.hlrn.qwest.net. [63.225.246.100])
        by smtp.gmail.com with ESMTPSA id b2-20020a92dcc2000000b002e85e8b8d1dsm556531ilr.5.2022.12.09.08.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 08:26:29 -0800 (PST)
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
Subject: [PATCH v12 3/3] platform/chrome: cros_ec_uart: Add DT enumeration support
Date: Fri,  9 Dec 2022 09:26:24 -0700
Message-Id: <20221209092619.v12.3.Ie23c217d69ff25d7354db942613f143bbc8ef891@changeid>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
In-Reply-To: <20221209092619.v12.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
References: <20221209092619.v12.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
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

