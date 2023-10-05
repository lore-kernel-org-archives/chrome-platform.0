Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D570A341A0
	for <chrome-platform@lists.linux.dev>; Thu,  5 Oct 2023 16:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=howett.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b="BeWT67ks"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3af609c4dfeso750999b6e.1
        for <chrome-platform@lists.linux.dev>; Thu, 05 Oct 2023 09:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett-net.20230601.gappssmtp.com; s=20230601; t=1696522078; x=1697126878; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fKbLM1rnC24y2SybHOTvD4S16XjSJ/8+LSwsuGXtOa4=;
        b=BeWT67ksS5pLD+ji40GmP1kj7AQNxaII6/u6AgPheJbZhHGL8AHAOAz8kcAbfRAXP2
         +rgVL06QJf5T/FcEZ+kc+N3oKls6Hn4zxP2WAghZrxJLZkP/ho19YZKGmfyKkRS/fUmT
         EqJD1P8bXsi4D1kcSQcXwR+AB1o8u/iqWZna/0SvCvu3/4b72WHCqbZahymWZzkmuYF5
         kS2gI5ZpVBPLZaJEU9mg1O69DLYB1KwVk6XmMQ3CMneUU+e94f4TfoY5dcKDcLDPxOvb
         iZO9nVdsEYuLwnXupo8KMzQLbbR3+W+oPRpXeFroRtm/zcEBxcCtsap9/A2nZeQi4fgM
         cNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696522078; x=1697126878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fKbLM1rnC24y2SybHOTvD4S16XjSJ/8+LSwsuGXtOa4=;
        b=AgHZIpr+6owP0SseRZlQKXFK2bx+4XGP9/K/Q8JqbHjDHh023P/pd5KzlVHZlAR6IA
         TnhmF6iamNM6WEc3cBOliKJFanx0zEu4bjkpKslBOq8GoOUWzvpGCr/aNwqFrXWPFyAx
         YEgKsxYLG65Lp4JsjCeDeFNS2DgzxCYD0s3BP2jjRmxFaIqs5YQ2nnbTUb3pFyB88QHF
         WyBEa2+/NWjsAfRbmXXBZcK6ajRS7saulOdt78d4gO1bZCtJcKblQU8fbW0LqFWUHxDJ
         HnTS8sgyV5fL9FQfgWNlYDtgB+A4oQnyYov5SMM7jskkMw/WKAyUrDJToPD5pTDyUWxO
         cu6A==
X-Gm-Message-State: AOJu0Yw/nn1MbpKLCPEFO4kp5xqbWcr1rBOXBwAt9A/1o1PCj7xReoG/
	4KDkfI+xBlhaAY8LSV/oHelolg==
X-Google-Smtp-Source: AGHT+IEeLkzw0C8OpIY4CAQLonFaWJ2iYDTxeVtdkqB8NZHvSHTijtq3YcbUsYv1TaXqQtEYiS6+MQ==
X-Received: by 2002:a05:6808:d52:b0:3a8:74bf:8977 with SMTP id w18-20020a0568080d5200b003a874bf8977mr6821402oik.56.1696522077896;
        Thu, 05 Oct 2023 09:07:57 -0700 (PDT)
Received: from tycho.delfino.n.howett.net (99-107-94-179.lightspeed.stlsmo.sbcglobal.net. [99.107.94.179])
        by smtp.googlemail.com with ESMTPSA id k3-20020a0cabc3000000b0063d5d173a51sm611422qvb.50.2023.10.05.09.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 09:07:57 -0700 (PDT)
From: "Dustin L. Howett" <dustin@howett.net>
To: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	Kieran Levin <ktl@frame.work>,
	Mario Limonciello <Mario.Limonciello@amd.com>
Cc: "Dustin L. Howett" <dustin@howett.net>
Subject: [PATCH v1 4/4] cros_ec_lpc: add quirks for the Framework Laptop
Date: Thu,  5 Oct 2023 11:07:02 -0500
Message-ID: <20231005160701.19987-6-dustin@howett.net>
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

The original Framework Laptop contains a Microchip EC, but the newer
ones have switched to an NPCX EC which uses the standard linear MMIO
protocol for host commands and EC memory.

However, those newer Framework Laptops diverge from the standard
ChromeOS EC in two important ways:

1. The ACPI table for PNP0C09 only claims I/O ports 0x800 to 0x8FE
   instead of the traditional 0x8FF
2. The MMIO region for EC memory begins at port 0xE00 rather than the
   traditional 0x900.

cros_ec_lpc's quirks system addresses both of these issues.

Signed-off-by: Dustin L. Howett <dustin@howett.net>
---
 drivers/platform/chrome/cros_ec_lpc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index c06575625d2f..66285c66ff22 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -537,6 +537,13 @@ static const struct acpi_device_id cros_ec_lpc_acpi_device_ids[] = {
 };
 MODULE_DEVICE_TABLE(acpi, cros_ec_lpc_acpi_device_ids);
 
+static const struct lpc_driver_data framework_laptop_lpc_driver_data __initconst = {
+	.quirks =
+		CROS_EC_LPC_QUIRK_REMAP_MEMORY |
+		CROS_EC_LPC_QUIRK_SHORT_HOSTCMD_RESERVATION,
+	.quirk_mmio_memory_base = 0xE00,
+};
+
 static const struct dmi_system_id cros_ec_lpc_dmi_table[] __initconst = {
 	{
 		/*
@@ -596,6 +603,7 @@ static const struct dmi_system_id cros_ec_lpc_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Framework"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Laptop"),
 		},
+		.driver_data = (void *)&framework_laptop_lpc_driver_data,
 	},
 	{ /* sentinel */ }
 };
-- 
2.42.0

