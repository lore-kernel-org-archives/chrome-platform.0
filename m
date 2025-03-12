Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C882459E1
	for <chrome-platform@lists.linux.dev>; Wed, 12 Mar 2025 10:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741776256; cv=none; b=VIHKUpjxF5PePMVBA0F4TQkxwZjhJv+cQlkADNO+fPuRNXEMaHJk2S7vYRxFQMhdTA/KmdVOP+0j6TJWQhsA7kPLbd5IRQJt2nBuHZrIZWiH/sOxlCGiK4PfzrcJ6GI2bwQeYry3R39MeZ8lpJ1MP9zq1o9DKq+JtXWTKWQOPVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741776256; c=relaxed/simple;
	bh=9hXJ05Bllblc/HNvRr6L30WMFsTUsEOeU51KuFxzBIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GtPyU3DxiA/D6FYFu1Y9m/G45cn2iGDFv7DtGIeQU/1bUy0BUjqhnXMMod32wR5aBbYwDJb/NoJYF09BgFMnO+kc7jfBYiQ7Ngbyzps3Leid0PVFlzfCbIuy46HCLhY0gxLD/pcgzlQsEyvUHAWQt+e++YI8ieLYxBR0YvR5Jcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dDwOfvb4; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dDwOfvb4"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3012885752dso224513a91.2
        for <chrome-platform@lists.linux.dev>; Wed, 12 Mar 2025 03:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741776254; x=1742381054; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07NeGidiEoFI0vJcWncCuXXVE170Ua3zDu2V1ci+TTk=;
        b=dDwOfvb4Anx2HPesUh+KXvaZCiuSi1QbK1rSDfTEl2YMitP/fkaVr91VB7oduLM68x
         4otKnTEBkt2k0WrhC0mOvQyf+fiIepyzdbPwjHxxni9CroQphpzpDgdb6rU8xqcFrz58
         +U+QQFijPnEUcHgpG1lwU9ycA2Ok6bVsxgnqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776254; x=1742381054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07NeGidiEoFI0vJcWncCuXXVE170Ua3zDu2V1ci+TTk=;
        b=DDOLm2D2xKPgFIORQarrG5844exikHsO17kazg4lv4dVRaijvF7FKaD9qfaP/b7u0y
         EtOuTdxQ0xOpmQ3onDYel7x2xXAO+HIoyRRyY6v0U7dlkk6l4Mde4STntx2tI4QWW5mh
         q5C/OpuG8ANVMoU17s+MHPjJ9kWZzVfRF6YdHvdyQRwi83G7LYuwymCmEbmybinis07M
         FTxStTGPcdptw81AbL9j7/yM7r/knlr2ocTaZxDabqhPsIqJUs12nHlR8l6gPeXejqDa
         BRjrW0ejH135ZGY1YX08OPR1tGsm2x7sPsZTdO2KyVUWV2ujgnRyB3zDdGKj+NMQAstp
         Iccg==
X-Forwarded-Encrypted: i=1; AJvYcCVgAm7DBlcWIYmim4hDZWA7IcBOrJpDPXGdxYW6EZQZkH7bQon8yO0fRiF/Pc5DFkM7QBO6nBFaTpISkiZ8ZFM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxEvyTsT6sE4+hqq6wcic8DYDObYCuHIsvmLQBdCO917x2SRXTe
	n8yDQHh4zpJX8IdqHZcSb24bnCrSS2pah6WWvqS9iui1uiGZD6S/ip6b8BiSMQ==
X-Gm-Gg: ASbGnctdNAoY2OxZ5DmWeNQ5xLmUxr+DSbzNV9K0Mj9tzJM0lf8rvF/1ZJJLYpIaVzc
	5BIq+VmN+FeXaNHz5f3PKvVhdZv/kAP+UwjZG4EnF9ioIzQHsjp716W5g/KhkJ5UNcjLbVUbs2I
	hKyyodqHbk7bPtBNta2ZGoazguyud8GnDU/QS4f689651w3wZcviFQ/dNyT5CU8vEg8Tjnj64KM
	wEzPSyJokbLDnZ4RNWLhF35FfChqeXzLJdizCSN8/AwKcWsJhaOo1eA6cIbllj69okwqvR8R1+1
	yi5MlpUoAz77Zp1iDMb0lXdiUKIQ7ipT8cwnjlAFGXDI3YfLu2aVEKTpdVW904U=
X-Google-Smtp-Source: AGHT+IFSE2gHTCSWYPmLv3kDZjxj214O8BELRgRt+BaoekLoQKZE6r3o5wS+pqNMYHoEB24uQ1fVVw==
X-Received: by 2002:a17:90b:388a:b0:2ea:bf1c:1e3a with SMTP id 98e67ed59e1d1-2ff7ce94cccmr37763724a91.12.1741776253695;
        Wed, 12 Mar 2025 03:44:13 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b5ed:b71c:fb14:a696])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm1405675a91.35.2025.03.12.03.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:44:13 -0700 (PDT)
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
Subject: [PATCH 7/8] platform/chrome: of_hw_prober: Support trackpad probing on Corsola family
Date: Wed, 12 Mar 2025 18:43:41 +0800
Message-ID: <20250312104344.3084425-8-wenst@chromium.org>
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

Various MT8186 Corsola Chromebooks (squirtle, steelix and voltorb
families) have second source trackpads that need to be probed.
The power supply for these are always on and their reset/enable
lines are not exposed.

Add them to the probing list.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/platform/chrome/chromeos_of_hw_prober.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
index c6992f5cdc76..eb01851e1cf5 100644
--- a/drivers/platform/chrome/chromeos_of_hw_prober.c
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -57,6 +57,7 @@ static int chromeos_i2c_component_prober(struct device *dev, const void *_data)
 	}
 
 DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(touchscreen);
+DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(trackpad);
 
 DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(trackpad);
 
@@ -84,6 +85,18 @@ static const struct hw_prober_entry hw_prober_platforms[] = {
 		.compatible = "google,hana",
 		.prober = chromeos_i2c_component_prober,
 		.data = &chromeos_i2c_probe_hana_trackpad,
+	}, {
+		.compatible = "google,squirtle",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_dumb_trackpad,
+	}, {
+		.compatible = "google,steelix",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_dumb_trackpad,
+	}, {
+		.compatible = "google,voltorb",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_dumb_trackpad,
 	},
 };
 
-- 
2.49.0.rc0.332.g42c0ae87b1-goog

