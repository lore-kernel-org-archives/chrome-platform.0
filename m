Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B74B18BBAD
	for <chrome-platform@lists.linux.dev>; Tue,  3 Sep 2024 16:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725381048; cv=none; b=CKl6/blGUYOEcyALRQkXb3w8x0Yos+jlB4DzKrwBNdxYJR5rfX7WJkIyNRi9fYc2gsQYNch3TQRzEK3mGUI1+CjJwMMJrO2UQ2Msg6lB7Ws3T/UXsJeXf15KRt2jINX4wTwRXWXLSYUFylCkghZB7twx2YJ/KqseWurM6Y5TKaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725381048; c=relaxed/simple;
	bh=+SIfP7UISjPZqy3MROtCCerdpwFBvqDPS8zBDXoCQ6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VFvs48mRl6qC/1B9R8Kizkpoc3MRmnuUcVQXAxMHhkbWRiBAcn8NtQ3Z2JTjR5p0wJmeXiCPvcCzeN88SJKPc1XnAz9Dzk3SyC4EbkxUxEGjSTHJ2m5rf7KjwO7gqIejEG5cmLfNwVOY4VJHPDmIqA2BNLChQ/1sSWb1Wxe4tJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QeYU4NPp; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QeYU4NPp"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8695cc91c8so552033766b.3
        for <chrome-platform@lists.linux.dev>; Tue, 03 Sep 2024 09:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725381046; x=1725985846; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=abnaghlK+pw02PpQ8vIksrIw0Rsf4nvWXUu7Ofg0f3k=;
        b=QeYU4NPp3ooSL/eN8X5JswBPBSt5zUq1ZvgwaAeHEddJq7nG/CwiMCd2QIbNdzxMx0
         CKODED/99EKwvJqjq38OF1uqKlwjDr2Ak5MjwFZxp53PskgeJQtQzXHtcc4CQWkwwlTb
         gNQ7EZtEO+I3Fw/ozWYHBbFppb4/8Io8YetJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725381046; x=1725985846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=abnaghlK+pw02PpQ8vIksrIw0Rsf4nvWXUu7Ofg0f3k=;
        b=NEBgpftYFM8l0EOthjwdaZ96GEqcAzoG8LSeLUXaS0HYONF8vcczlLTG8uppCWOMSV
         wQ2XajXAw2bdlruh2au6Ko4Fq2YGbvMSiJysK28y0Dlg0rd38NBtU95PPDtaGwla00qW
         KUQywdIipyumwpWw2lBXdjmqU5l7kX+33OnlCIsdY/ApykL75O/gZNn4gUpd2+kcIDyw
         0Leic2G9P9IuORXvkUJlVkEdHQFLuIdi5Pxqz8QQC4nLaaL7WEpIx30UpDks2CkEL4BZ
         fpzi0g6tS6KtzdJg4t3n2bPJgeN7ISJbI7IxpPsIW2OkAdlRu9BuAYj8kmMIIo0C0zgY
         0YcQ==
X-Forwarded-Encrypted: i=1; AJvYcCViphVWAahPxBe4EkwBvdFwd/iZowXXaJCK/ycyR2kKi8K5OZ6Hpx9FYDBSCdFr0FgugQakIZI6kGyoNF8I4fU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwW/30jmYy8YtBQhay9WaW6KGfwYz96OqGowzWVIA2Uds2vzJ4l
	31s2WOTkQOGffUS9Y5sc/Jy1tkfHoyuA2frIPLossTYT8HWHD+NUHYMFaUQr
X-Google-Smtp-Source: AGHT+IGyA2BXvcyBi9Eat2Zpbm/KcDxn+TOMa7RYJ393x/0cWxbrH8YSipKSJQZfPaSIpsa1AvtybA==
X-Received: by 2002:a17:907:1c0a:b0:a7a:ab8a:380 with SMTP id a640c23a62f3a-a897fad872amr1435845166b.69.1725381045331;
        Tue, 03 Sep 2024 09:30:45 -0700 (PDT)
Received: from ukaszb-ng.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989196bc4sm700685866b.125.2024.09.03.09.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 09:30:44 -0700 (PDT)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v5 8/8] mfd: cros_ec: Don't load charger with UCSI
Date: Tue,  3 Sep 2024 16:30:33 +0000
Message-ID: <20240903163033.3170815-9-ukaszb@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240903163033.3170815-1-ukaszb@chromium.org>
References: <20240903163033.3170815-1-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

When UCSI is enabled, don't load cros_usbpd_charger and cros_usbpd_logger
drivers. Charger functionality is provided by the UCSI driver already and
logging will need to be added.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---
 drivers/mfd/cros_ec_dev.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index d5d63df7fcbd..bc083c7b21de 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -133,11 +133,6 @@ static const struct cros_feature_to_cells cros_subdevices[] = {
 		.mfd_cells	= cros_ec_ucsi_cells,
 		.num_cells	= ARRAY_SIZE(cros_ec_ucsi_cells),
 	},
-	{
-		.id		= EC_FEATURE_USB_PD,
-		.mfd_cells	= cros_usbpd_charger_cells,
-		.num_cells	= ARRAY_SIZE(cros_usbpd_charger_cells),
-	},
 	{
 		.id		= EC_FEATURE_HANG_DETECT,
 		.mfd_cells	= cros_ec_wdt_cells,
@@ -261,6 +256,21 @@ static int ec_device_probe(struct platform_device *pdev)
 		}
 	}
 
+	/*
+	 * UCSI provides power supply information so we don't need to separately
+	 * load the cros_usbpd_charger driver.
+	 */
+	if (cros_ec_check_features(ec, EC_FEATURE_USB_PD) &&
+	    !cros_ec_check_features(ec, EC_FEATURE_UCSI_PPM)) {
+		retval = mfd_add_hotplug_devices(ec->dev,
+						 cros_usbpd_charger_cells,
+						 ARRAY_SIZE(cros_usbpd_charger_cells));
+
+		if (retval)
+			dev_warn(ec->dev, "failed to add usbpd-charger: %d\n",
+				 retval);
+	}
+
 	/*
 	 * Lightbar is a special case. Newer devices support autodetection,
 	 * but older ones do not.
-- 
2.46.0.469.g59c65b2a67-goog

