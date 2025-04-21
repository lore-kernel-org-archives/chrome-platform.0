Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36C02638A2
	for <chrome-platform@lists.linux.dev>; Mon, 21 Apr 2025 10:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745230403; cv=none; b=V3Bwv2EGtHbqyIqzMTimvNwf363aS5B2ZkQxPpCOgVr2d8YxbmHHwQdB14Vt3enAkLuXzit/jowMtCO8NKyFHwMmfY5wE3nP4h0Cg2gFcxjkwK0NPYKW4E6ClCcMzU90UBanF7m8mJgvgyU1m9Sg3Zch+EczEhUe+TxMsgjyfWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745230403; c=relaxed/simple;
	bh=sy8ThRyRgU7oedwZh2khgThNY5WH15EZl03oVLUYUIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RmhhXUcxkZQnLWMEKSS/MoPlvZWxYWiBhhhYYe/l+IGWpemA7/8onHgg3X131hLyLgHnENGowYkToBIcHaOYuT3ICzbpHVoDtU8L2ECBAGKHLORS/Qt+nx4U5RTwyxmgfPZqe6HINfNTK85GlNog0nSWUMwfHFWPZ93UREx0tzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CYOkeWy0; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CYOkeWy0"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b03bc416962so2651952a12.0
        for <chrome-platform@lists.linux.dev>; Mon, 21 Apr 2025 03:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230401; x=1745835201; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rok2Mg43bnfRB9cqUAfce4PsDdZdAouW+RpiAparFCo=;
        b=CYOkeWy0GfZ8EfS6mYsJaVTPqpYh7owiyIlLiIpIIRMAGf9w3SWG8vBXdUlGbvnIWA
         ulhqYlmy9a1cJ13Z4hYwVs/tbS6u4pnZv2NAkWIB07RbbatPYIqPQzEaBpICfQ7Z5bk7
         OO0E71bn1c9+iBfVmICVkPOXh8mN7J+tyjXEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230401; x=1745835201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rok2Mg43bnfRB9cqUAfce4PsDdZdAouW+RpiAparFCo=;
        b=g8Y/+60Hp5YVgUinrJUNzuKbuPl2AqfwotoMrWAhkjb5pKCA4RbQxnGW2ssJFADNfz
         8AItUdbwUipRSwMSAlYHjAfTkxUYfuJsX8nZNxX7czFMQbd/zvZc+FpKPLVYMjPVAuPg
         kXH8zC2JUMrd8hZlsgziFnNPdOYR7ilpH1OedfcF2NcGSMKdp99hFiTKby2mV4N9Mhbq
         u9ehK3wO3ATunmX7fyfL+ncUxUiFioa1PrvIng9Ks4pITgJj7orX+YC1BNTj/4Qj9PAx
         WjP+O0/XObO2s8DylOk+h72dfcVK+PcjoB3eESU68o0SqHZ8k44hCCC2EMKrhp5gY/GB
         7Wlw==
X-Forwarded-Encrypted: i=1; AJvYcCVungzMLlu9zNiSo+zc6P5VQIUPgLsvauDFWv01f2f0O6yosehC48GYZ578ywmdoGVdUhjINwJS7v5aw+NUtFw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+e5NelNH0UARK4c2GR9tsYxpw4tXNF/4cRgko5kriuYNVoVIi
	GI8Yhb2fwEM8NJlyvGDMLVzwAwkJWSt80KYaIoJD6aoNH86rc28adEouAD+l6g==
X-Gm-Gg: ASbGncsD5f+qyaW1brsh6pujIp73XDrG5ZjcmhIsCXRMnYrPjuz4u2cETpO73JPI0DH
	C6PgvQSfTGdit9RVBuJwHwkYlB9ylfPm7aoWzCr6nxSpsJ89ohsU5C/FZWfSAAjBZpgKWiPyHXY
	13ylfYcDRJCIz59cSnUPDesWi8Z/YBCkp4j67Vr/q2diNPGV5Ne/TwZ8DWqEnHdQZbIwdsk0QS2
	4CJxadueYbAjLmhlcQpQmr5YwNSxvRKGWIJ6jw2UAIeMiK1vMvSclroXtuZILG9cjygLyFrEMGz
	i/Eh0yh3APRC3W8qdS+0LUxByW9MhGyouKI/M8IN7ZG+51Gvazzne6x4slU=
X-Google-Smtp-Source: AGHT+IHzGqLnsYoPPrUzas9aFIuhG2tfwpqW1sujdJRkCyGS/gKycIu8sZyY4IdNUXVMBMKhKzW5aQ==
X-Received: by 2002:a17:90b:4ad0:b0:2fe:a742:51b0 with SMTP id 98e67ed59e1d1-3087bcc8fcbmr14175251a91.31.1745230401151;
        Mon, 21 Apr 2025 03:13:21 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:20 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 5/8] arm64: dts: mediatek: mt8186: Merge Voltorb device trees
Date: Mon, 21 Apr 2025 18:12:43 +0800
Message-ID: <20250421101248.426929-6-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250421101248.426929-1-wenst@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are only two different SKUs of Voltorb, and the only difference
between them is whether a touchscreen is present or not. This can be
detected by a simple I2C transfer to the address, instead of having
separate device trees.

Merge the two device trees together and simplify the compatible string
list. The dtsi is still kept separate since there is an incoming device
that shares the same design, but with slightly difference components.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile               |  3 +--
 .../mediatek/mt8186-corsola-voltorb-sku589824.dts   | 13 -------------
 ...orb-sku589825.dts => mt8186-corsola-voltorb.dts} |  5 ++---
 3 files changed, 3 insertions(+), 18 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
 rename arch/arm64/boot/dts/mediatek/{mt8186-corsola-voltorb-sku589825.dts => mt8186-corsola-voltorb.dts} (76%)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 58484e830063..ff67931e7821 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -73,8 +73,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacool-sku327681.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacool-sku327683.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacruel-sku262144.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacruel-sku262148.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-voltorb-sku589824.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-voltorb-sku589825.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-voltorb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku0.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
deleted file mode 100644
index d16834eec87a..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
+++ /dev/null
@@ -1,13 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2022 Google LLC
- */
-
-/dts-v1/;
-#include "mt8186-corsola-voltorb.dtsi"
-
-/ {
-	model = "Google Voltorb sku589824 board";
-	compatible = "google,voltorb-sku589824", "google,voltorb",
-		     "mediatek,mt8186";
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dts
similarity index 76%
rename from arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dts
rename to arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dts
index 45e57f7706cc..cc805408a8b7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dts
@@ -7,9 +7,8 @@
 #include "mt8186-corsola-voltorb.dtsi"
 
 / {
-	model = "Google Voltorb sku589825 board";
-	compatible = "google,voltorb-sku589825", "google,voltorb",
-		     "mediatek,mt8186";
+	model = "Google Voltorb board";
+	compatible = "google,voltorb", "mediatek,mt8186";
 };
 
 &i2c1 {
-- 
2.49.0.805.g082f7c87e0-goog

