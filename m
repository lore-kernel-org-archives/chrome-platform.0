Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386DA241666
	for <chrome-platform@lists.linux.dev>; Wed, 12 Mar 2025 10:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741776249; cv=none; b=TRuaaThmmEvU7inQnDBFHCa4FEIQGy88e14t8JHXJOhi4fGG2IVC7fthA+4xb6sAhIMhnTaUbdbAsbLBz4wVaq76CxaEPFpbBZm9xchOb1Kcmm5H9n8NL0sgmNiASgNTn2MMA4q9JM2PszVM5DLPaoSky1uyhq4uYP9jN2rSZBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741776249; c=relaxed/simple;
	bh=DLOFKyixrKjuNk5xbPr6+WZVuEvD4zxgmFK1T42/rQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LMAICxyBUQX1/028uqczM47Dc3ysmZ4P3OHlrD0YYpuQwEyJY/YT0wNiXWkk7NIXyP/B19MvqxKUPx9TmQ0fTSUWRZhcR1fpVaX3Af4cFODyx4/jJDt/2o7qa7aCl+4HIebBZhrNIsHO3jp1sOFW0ueRPyEXnWXyFXltugMn5nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M93xPcAK; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M93xPcAK"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2f9d3d0f55dso10032301a91.1
        for <chrome-platform@lists.linux.dev>; Wed, 12 Mar 2025 03:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741776247; x=1742381047; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBHq9V8lKreFqK9KM1t5HhbZfxxdkE8xQHpVyP8b1xQ=;
        b=M93xPcAKDWrs/GQV3LSv0P9C+SqU6U1AMIJ9Cy7C9EJmV6ZY+rmqSCldQUQtW+lCtQ
         FDVXN+B0PZTDZDD/biP0dUPaMzPD8afIx7Y4tx6vWCSVOT1PQ/f8PcrQCcrMA1YcAIUd
         o32Y3w17RwS4eO9tOKdtxU3kbcCktvh+L9vHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776247; x=1742381047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iBHq9V8lKreFqK9KM1t5HhbZfxxdkE8xQHpVyP8b1xQ=;
        b=SwkCak8/qP0SrIThvjaldvWqIbQQQvGWFhrKo9OOvjgysfuj0oeRZSln8yZ4S4tM1j
         l4VkTWD3QSRQRm45Ge4N33nITIzuNZW63n+OAWLlSA0tIsh0rMZZRzCjEsYv5uOI2EfW
         bsOFfssrHpkB1ZEUKtW5R3BEtAPH0YQ722JlgFWBnjdiWjA2ZbVQY8Bys1LAefmLJ32t
         7/THJNuEP1OzSt4qQc4iLgamN1tSNv4RcPYTNCimHedQPLSYGHtQruJia/lExTQh1sac
         DUXyvV5W4dR4TMyVakcxV5QkruX8w8mEBjkVg9FsUQ/DrR2s3cvd/O91uhGJNG+AXOLR
         Do4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKmQfM5St/qIVbW2CJ9J6owF8ixDleAfYMsz0vbOIhesTh5KJ0rlT7WFPJN/p4Veh3yJjeyb3i8GcEJkGWZXE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyHag3IZKHo7YiBJgM8E4CC6kDEtmbETxyMHWMedhTO2HN1Xezd
	6J6A2ukQsdaSLhi9Ae5RAKxJJEo4ELRY4EQzmGsI+qF+orYxqs1OKH/MyWtbkA==
X-Gm-Gg: ASbGncuoqLm84jw1496ebsah3w9FHpwvPAEz066fhqYLiAlNGlqRocWApQlPXagpZ6r
	IylEicYHh5rffVsHyYsOPKv7sgC3VCKCSXsnFP/PICoMFix7kLmD/nBQkTRBMRD8hG/o23/H8To
	9neG+wrtYDu1nwS2/ZJzYmRjQMl9e14PErFp7pm7pnw+8L+Mu1vkMs1i+ejO+nqctiAy5Z9XQtr
	Ch1IxkG2Ea86loq15tUs541N8S2j5e+PrsL6RVzpnavoAaXLmdnL3/hB3gjR/tPU3wKESHSJwBn
	3rh8VL+bE1lCOrx6vnQoB36ZdKvJ2fQSpk+3q6STlgO8RY/YNWmXh6NAgSpyIi4=
X-Google-Smtp-Source: AGHT+IHgEKYXDVQ8fG2MojJ+3+NZnnUhzA79ZMbcKKeZymlj+PamoGqt91exqHl5LDqK7OCjTlvNwA==
X-Received: by 2002:a17:90b:350d:b0:2ee:c04a:4276 with SMTP id 98e67ed59e1d1-2ff7ce7276dmr28891107a91.5.1741776247611;
        Wed, 12 Mar 2025 03:44:07 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b5ed:b71c:fb14:a696])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm1405675a91.35.2025.03.12.03.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:44:07 -0700 (PDT)
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
Subject: [PATCH 5/8] arm64: dts: mediatek: mt8186: Merge Voltorb device trees
Date: Wed, 12 Mar 2025 18:43:39 +0800
Message-ID: <20250312104344.3084425-6-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
In-Reply-To: <20250312104344.3084425-1-wenst@chromium.org>
References: <20250312104344.3084425-1-wenst@chromium.org>
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
2.49.0.rc0.332.g42c0ae87b1-goog

