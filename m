Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B1D30D17
	for <chrome-platform@lists.linux.dev>; Thu,  5 Oct 2023 16:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=howett.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b="lCOTfvFQ"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-65b0dad1f98so6532086d6.0
        for <chrome-platform@lists.linux.dev>; Thu, 05 Oct 2023 09:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett-net.20230601.gappssmtp.com; s=20230601; t=1696522074; x=1697126874; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehTvxGrcWJf2GK4o99VJ+trJtzmEICjcGVrEWrEqVaY=;
        b=lCOTfvFQOt+tIvI8OEOiDdJQSmhR06z7pgR2WkZ5yTztx6dhanei3UWcLIld++Ozw4
         SeEX+Iz+6VVP/OM0MzR6PYX6PZr7gutm7/O/KKyixbMxpLDKX5D4fg82Z+sSvZSsnZNx
         ErozW+jCRKYIVHjDtfvjOkTUj6QUg+VGg1NDHEi8vkqn8Chmac7XJv2RFliaBUWin+lx
         KBfmeMscKuPE9BsKAyrHcZNlgr8z+EkZyQdPbw7on5ufDv1vEdGJ+B0NY6bYohpzBq8k
         1+M4/ezM1NgD3N+MkV6BfLF++y0bs/F5Ovn+lxHinVESVw/EV/kyGW+3a/VXQ4QqBZU7
         DyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696522074; x=1697126874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehTvxGrcWJf2GK4o99VJ+trJtzmEICjcGVrEWrEqVaY=;
        b=JLcA6ynWlv+LlvlT+T8Cy9IcxvC83Orr6XsEfqMpkjx/Vu5NLxjKgyNQ1usMz/DigR
         pq//s8yPtaNTTAQVliHx5z1R/CQm2KAn3zAm8cbCuHFrLO/9QLv26iVHQpITAjVXPPKs
         X46cuPDdJ+E1ZU8Cb2VelCLTxP6PM4M90NRxC7Hze9ThLxuMP1bvx80F4gwEe17IvuNU
         PKgqBSRh2eNDckKYmDSWb0PwCDKd/n+dY1aZz9dS686gNKB3vhtfhKPOj4tTxEdtUh3i
         jLkv0QuGcKr/JrX07k10Lmd8hEGxz9H1mxuuMQp4YuwkwBK1UmReLm1+3nwDe7iFPTAS
         bDzw==
X-Gm-Message-State: AOJu0YycbxPinPK1Or75h921ZS0+LForZFYEZ+2VZM+YSu57r1I7BBLt
	ClqJc9tjDtueh0HyW7yS7yUZZg==
X-Google-Smtp-Source: AGHT+IHXnbsMFmV1xKigch6j93fZcdPPVsuNon2yqQpBMQzZpNCBWPEvX9o1ej3+mQyNPx2hLpRCJg==
X-Received: by 2002:a0c:b347:0:b0:65b:26d4:7fb6 with SMTP id a7-20020a0cb347000000b0065b26d47fb6mr4877067qvf.4.1696522074498;
        Thu, 05 Oct 2023 09:07:54 -0700 (PDT)
Received: from tycho.delfino.n.howett.net (99-107-94-179.lightspeed.stlsmo.sbcglobal.net. [99.107.94.179])
        by smtp.googlemail.com with ESMTPSA id k3-20020a0cabc3000000b0063d5d173a51sm611422qvb.50.2023.10.05.09.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 09:07:54 -0700 (PDT)
From: "Dustin L. Howett" <dustin@howett.net>
To: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	Kieran Levin <ktl@frame.work>,
	Mario Limonciello <Mario.Limonciello@amd.com>
Cc: "Dustin L. Howett" <dustin@howett.net>
Subject: [PATCH v1 2/4] cros_ec_lpc: pass driver_data from DMI down to the device
Date: Thu,  5 Oct 2023 11:07:00 -0500
Message-ID: <20231005160701.19987-4-dustin@howett.net>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231005160701.19987-1-dustin@howett.net>
References: <20231005160701.19987-1-dustin@howett.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lpc_driver_data will be stored in drvdata until probe is complete, at
which point it will be replaced with an updated copy.

Signed-off-by: Dustin L. Howett <dustin@howett.net>
---
 drivers/platform/chrome/cros_ec_lpc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 477e22e31757..ef7943e6a01d 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -615,14 +615,17 @@ static int __init cros_ec_lpc_init(void)
 {
 	int ret;
 	acpi_status status;
+	const struct dmi_system_id *dmi_match;
 
 	status = acpi_get_devices(ACPI_DRV_NAME, cros_ec_lpc_parse_device,
 				  &cros_ec_lpc_acpi_device_found, NULL);
 	if (ACPI_FAILURE(status))
 		pr_warn(DRV_NAME ": Looking for %s failed\n", ACPI_DRV_NAME);
 
+	dmi_match = dmi_first_match(cros_ec_lpc_dmi_table);
+
 	if (!cros_ec_lpc_acpi_device_found &&
-	    !dmi_check_system(cros_ec_lpc_dmi_table)) {
+	    !dmi_match) {
 		pr_err(DRV_NAME ": unsupported system.\n");
 		return -ENODEV;
 	}
@@ -635,6 +638,9 @@ static int __init cros_ec_lpc_init(void)
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

