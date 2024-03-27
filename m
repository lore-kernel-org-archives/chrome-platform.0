Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5838E52F6B
	for <chrome-platform@lists.linux.dev>; Wed, 27 Mar 2024 07:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711525536; cv=none; b=JRrejFDPxKVyXdZiotp8ympE4jEo6qLZNZnyP/NpX6EtxT37GqzpBgH9D9cHi6FU4LJ8wNPgFnspO3IhE86C1DJA6yICvu2X+OuHrR1l2g/Nh2EER3dpPTcbax9arTpiVGi/6UCxcFhKWN7iMUJmBFTBFF2/jeZSREgrOXtGaMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711525536; c=relaxed/simple;
	bh=x5aBOi8571kgH/70+hqSUTH/KgH7MbeR57HwVOqbl9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LrC/FFqDBt2Jj2xn0pfx3WiRJhe1iwT8Bv1msyvpKSrAeOgmlMKkA2vd4xFGJVhDxCWPNnllf0IHl3ivYW0cxp+smEMWLCi2EoZ4NL9hdDEHC/fx49hfInoEB3wkDVoMammaK8PZsP+idM4CLteDuVdd9EB7bD/DHB3IQGkZbsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W6obU0L/; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W6obU0L/"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-515a81928a1so5318900e87.3
        for <chrome-platform@lists.linux.dev>; Wed, 27 Mar 2024 00:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711525532; x=1712130332; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bUVarvI29GYf8qbvusCvjKrNApOji+ZWbF/VfN3ERLQ=;
        b=W6obU0L//exCsyAgjfB26DogDCPM4mwC4fHPBYBAwDut2gkxxuIp3wQrI60xYpVgKw
         eZiT5wFGy8z3OftlJNvYHXMFp32YYdsbgCISxy71PplyU6hjoT6TYWQC59njxm4gKRXF
         SoTzEx3y92knYMVtXBeMq4OcUBy24/qktY1IhxFs4SxR00FKRU9yp1kTE6QVDnQDGTme
         oSdWONMTfpwCtwNOl2kndBRaFesVJdkAMMuZ+pKVm/YXwMSP56jCYvFqE8utAzBvaenB
         g/zAQQKdzIDnuvSVcNfsSqU2QgsDQ4IeQVS9vaQ5wivk+xfTad++nTF/bxKpvFlauVTg
         g8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711525532; x=1712130332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bUVarvI29GYf8qbvusCvjKrNApOji+ZWbF/VfN3ERLQ=;
        b=JTVIdrOJ+QzhENsIAjubju7mXEACaC0hVHCo4xicXVuegkwsU5KKSEw/8L2XAgwuH1
         aJvw/7GmKZRLs3B/oICEWe1sFg5PKJ3++HQwK6FICh84anNilso0riuZ2aOWiq4HQsc3
         5p1LFl24QL9if9nXQdJNxjSh3lHMfIG0YC9WZYeL7/t/SsUS2vjuosd8kt1Uli2b/yuI
         90tpT4X5NljRqaTQ6bZYiyXe3xp7cX6JExXvwBzA7y8STq9V1FECoy8oBXngi9bb7XLf
         VYrOkrskF1gcwlIh8eaehwfVpyAr/U74fyAFJF6X6XEPOlXJDxGrYZiODwPc4tnUL5As
         ARXw==
X-Forwarded-Encrypted: i=1; AJvYcCU3OTTO/3WXVX4gAMO2sb2xmFAKebR8cZajozxmA2VNOl2b2NjQ8oAjtOX7QmTm4KQ0ngL+wH7iYthEjoIlKT5jAucFy2GF4Bpmh4ZhBIGA
X-Gm-Message-State: AOJu0YwkbPsTZU9kTqT23+VdIb02BcqX0xwt7uoAlzIYs/asI/lYuL18
	TxUdTndda2TRy/SD45M58r+iMqwOUfTuMuoq8E6/bSRCs8mz6LRVGRoH1MHWt2M=
X-Google-Smtp-Source: AGHT+IH43p45oeCz29sanitb4HfB/d5qNm5GGwH5K1q6QtQ2IhsVB/nu/NZBEW4M+613n7w7MV8gog==
X-Received: by 2002:a05:6512:3d1:b0:515:a9d5:aab6 with SMTP id w17-20020a05651203d100b00515a9d5aab6mr1344695lfp.18.1711525532566;
        Wed, 27 Mar 2024 00:45:32 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id am11-20020a170906568b00b00a474690a946sm4671745ejc.48.2024.03.27.00.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 00:45:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 08:44:00 +0100
Subject: [PATCH 13/19] platform/x86/toshiba_acpi: drop owner assignment
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-b4-module-owner-acpi-v1-13-725241a2d224@linaro.org>
References: <20240327-b4-module-owner-acpi-v1-0-725241a2d224@linaro.org>
In-Reply-To: <20240327-b4-module-owner-acpi-v1-0-725241a2d224@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, 
 Daniel Oliveira Nascimento <don@syst.com.br>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Matan Ziv-Av <matan@svgalib.org>, Mattia Dongili <malattia@linux.it>, 
 Azael Avalos <coproscefalo@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>, Jeff Sipek <jsipek@vmware.com>, 
 Ajay Kaher <akaher@vmware.com>, Alexey Makhalov <amakhalov@vmware.com>, 
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 acpica-devel@lists.linux.dev, linux-input@vger.kernel.org, 
 netdev@vger.kernel.org, chrome-platform@lists.linux.dev, 
 platform-driver-x86@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=716;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=x5aBOi8571kgH/70+hqSUTH/KgH7MbeR57HwVOqbl9w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmA85WYaPnCni2SJTIfYMu6nl8u8HCpyEBx/zm+
 akXWB+YnymJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgPOVgAKCRDBN2bmhouD
 1zwaEACAjYbKdJXrMSUbxc4nKtGoFPWrLCKVqSibV0vxi34qgJolGqwGNMlDf1EbR7zNuWkRWf1
 SAkSo/ZjSy9ljMZTB+PVf/rBCZhEjLGaVJcUcu4lvaHpjYqA3flInybJXH/dnis6s7GQJEjwCbI
 Urg4xT3YL+pEwOQEaxZ+RR784CtgfPRcRZJ/y2hZHbLqGolVcrygiCisFvxmNBfyX2IgW8qzVtw
 ZC9sexJanCjRdDdeSqqoW8HfiFLv3kL6o5lvq01gJQ+Ch0QEcyMkKF69nwS+99sLA+gczGBSIdO
 HA/LUt7UtZGA5BqNtXGRxvIHU3JcNctMDbgUNU51zZTuMLPOR5zAy+pZPbScboBEobH8u3buYyI
 0MazJJzSYkzF1E9pEayUzam31VNJzF9LDQdXf71xL7c5hQvhEOgLrdYtd+NHHcT8QJ6KyGkXlJq
 S8ohVQ33OfFfZmCqNmFeUuE6sgFOi3yXk3mCrwgakKm0j9xool6qTEqAYFK35jBiH1RZjMS2/3b
 20vZcrPTTv/1steGsyfHnqoRnmquIwWJU7cpmZtp7sfrP9VtakfLAk/Skb4bey9hgdxJa0dQ2Nd
 /jAUhNyL/u5mTZ8NAZuDN7KrPv8hyTPaqwNDWOE/y2HXvWNm321FRUqeoMm/Zu3myuyaUrVfESB
 n7esZW5XGAls0CA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

ACPI bus core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/platform/x86/toshiba_acpi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 291f14ef6702..6f9bd675f044 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -3581,7 +3581,6 @@ static SIMPLE_DEV_PM_OPS(toshiba_acpi_pm,
 
 static struct acpi_driver toshiba_acpi_driver = {
 	.name	= "Toshiba ACPI driver",
-	.owner	= THIS_MODULE,
 	.ids	= toshiba_device_ids,
 	.flags	= ACPI_DRIVER_ALL_NOTIFY_EVENTS,
 	.ops	= {

-- 
2.34.1

