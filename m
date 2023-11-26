Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5DE12E50
	for <chrome-platform@lists.linux.dev>; Sun, 26 Nov 2023 19:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=howett.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b="xlROv+AW"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3b83ed78a91so2246286b6e.1
        for <chrome-platform@lists.linux.dev>; Sun, 26 Nov 2023 11:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett-net.20230601.gappssmtp.com; s=20230601; t=1701026740; x=1701631540; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPlubBmhDMl3SA/RTbic+xD857rN9gD+m4NVPEveGAY=;
        b=xlROv+AWeLuvR7Op2xSfRTokfCjwC3UGXgjCJ5Ul3HxKsC/zHQnIgsjKHcXnKlUW6w
         p19/qaxZMLFLDQpXM9GzcOZOYzxTQIRQbXUxnE8rYC2BoAJkkyHyUajdYpIo2CaeYqGJ
         BxiJCtlu+UjoDUU0a67MxAYxxIWLw1D2PcRfk8S0ZpzvlnVfvElxPuXtJ5624Vrh0tEl
         Wa4z1l9aqtnhPItJS6KjZZ7APjGfGvr7M4bRtfwYPoSPZYuc/LtK42cboOyKL8+6mPVE
         DZxLzX57HhX889jR499vKhdrY11GCqPLd/6mVGalmYaG/MSAgyEiR5wOpU8B68xSJXmn
         Vk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701026740; x=1701631540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VPlubBmhDMl3SA/RTbic+xD857rN9gD+m4NVPEveGAY=;
        b=BSbF9dL0QFTI+buLdqLWbI0IJ8OjDOVTrjJDC2wZc5LQi110Bakj7Q187fGn4DZEPT
         iEQpIANek2Nq/Ds4FMlZWdYqUBbCwgkDMNJhJfrEA8gWo0Q+wxNbttW++QGWtAoeDxcR
         e8tA2hGRFMyxfpCnbNQ/Wj/E4OdPemPD105wrOvnDIkAddBNNRX9TlfM9mtqQS+oT401
         IXn0J3Z84dL3O+yZm3l8EJC7Qb3p7HZxFrheGb6FLy0FQ1JEkpS63gihrkiGwHm8y86u
         CVb3jcUtSxaQcrvkI/9P91iMEaMI909gjDpqBB2KZJmotX5neCByOvAvVUOF21Z0fAoS
         yfuQ==
X-Gm-Message-State: AOJu0YyqDNkC+0okW6JBTY0ibMQ4VVIhJO70bvIERGKA/LMZUUp4W1B4
	7GJ/TUBdqTQuVIRcOHxv8zesrg==
X-Google-Smtp-Source: AGHT+IFplYKNm+Py5/f2W7/nlJy+JXR8IzScw8mk7gTor4oo1FkQQclQKpQyn3zn8dbMeR7sSiPtRw==
X-Received: by 2002:a05:6871:296:b0:1fa:3b7d:1573 with SMTP id i22-20020a056871029600b001fa3b7d1573mr3396320oae.7.1701026740227;
        Sun, 26 Nov 2023 11:25:40 -0800 (PST)
Received: from localhost.localdomain ([184.169.45.4])
        by smtp.googlemail.com with ESMTPSA id tx10-20020a05620a3f0a00b0076f1d8b1c2dsm3099040qkn.12.2023.11.26.11.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 11:25:39 -0800 (PST)
From: "Dustin L. Howett" <dustin@howett.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev
Cc: "Dustin L. Howett" <dustin@howett.net>
Subject: [PATCH v2 2/4] platform/chrome: cros_ec_lpc: pass driver_data from DMI to the device
Date: Sun, 26 Nov 2023 13:24:50 -0600
Message-ID: <20231126192452.97824-3-dustin@howett.net>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231126192452.97824-1-dustin@howett.net>
References: <20231005160701.19987-1-dustin@howett.net>
 <20231126192452.97824-1-dustin@howett.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lpc_driver_data will be stored in drvdata until probe is complete, at
which point it will be replaced with a cros_ec_device.

Signed-off-by: Dustin L. Howett <dustin@howett.net>
---
 drivers/platform/chrome/cros_ec_lpc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 9f2ea75c76b6..f1d1615d9b37 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -615,14 +615,16 @@ static int __init cros_ec_lpc_init(void)
 {
 	int ret;
 	acpi_status status;
+	const struct dmi_system_id *dmi_match;
 
 	status = acpi_get_devices(ACPI_DRV_NAME, cros_ec_lpc_parse_device,
 				  &cros_ec_lpc_acpi_device_found, NULL);
 	if (ACPI_FAILURE(status))
 		pr_warn(DRV_NAME ": Looking for %s failed\n", ACPI_DRV_NAME);
 
-	if (!cros_ec_lpc_acpi_device_found &&
-	    !dmi_check_system(cros_ec_lpc_dmi_table)) {
+	dmi_match = dmi_first_match(cros_ec_lpc_dmi_table);
+
+	if (!cros_ec_lpc_acpi_device_found && !dmi_match) {
 		pr_err(DRV_NAME ": unsupported system.\n");
 		return -ENODEV;
 	}
@@ -635,6 +637,9 @@ static int __init cros_ec_lpc_init(void)
 	}
 
 	if (!cros_ec_lpc_acpi_device_found) {
+		/* Pass the DMI match's driver data down to the platform device */
+		platform_set_drvdata(&cros_ec_lpc_device, dmi_match->driver_data);
+
 		/* Register the device, and it'll get hooked up automatically */
 		ret = platform_device_register(&cros_ec_lpc_device);
 		if (ret) {
-- 
2.42.0

