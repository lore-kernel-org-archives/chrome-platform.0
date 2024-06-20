Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519AC1ABCCA
	for <chrome-platform@lists.linux.dev>; Thu, 20 Jun 2024 11:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718883310; cv=none; b=H0t52DsRn44gExjalq3eR6qLMADCDvlVR6FqGqznL1X5SIErGxWniimjrETiHXUZJn4/2yrYFUsr3r9C7JKXSDAn0SIQmaIChiv4y0nk6FVXJw5sO+5Z+euzae/hVamDywCO0bLcTakXBku6jnuANo+imSdimov+XnndPJq8b3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718883310; c=relaxed/simple;
	bh=u46DXMnnV+4LGWHLSY0HJbWET1X6kq31L8FmQvAWJfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TxDSzDKavWZ6ts9/5sQ2Yz+MxuVKlNgT4xQ7/oj1ZDRFcrV5mCDe3HzTI0Ut7APqO0OIjXUgl2+hMxQ8p3S3FTQLeW1Dp6DaMtiq5Z9TTGOV2f01Ba+ZI3JooW0ZilnUUzX31JwsIOtr5DbAmVb6to9+Rh1n02pX43WU0qHSTkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gRrhyUBW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gRrhyUBW"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4217c7eb6b4so8046555e9.2
        for <chrome-platform@lists.linux.dev>; Thu, 20 Jun 2024 04:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718883307; x=1719488107; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rm0p3ifM1mvsX1ZP0z5AtqzhzB7gV2tVDLMJERR6NCI=;
        b=gRrhyUBWaCbTUtVuFhl2kRN54v5j3JSVBNA9XFLzE8YgEvK8AR9OpvggO8fhFKehaM
         RfFVB9XtfNYBdmB5xkoxbz8s9BPHIiLMjg0VnEQHGVcx8p0fmIDVL0Qg61CliKVy2maL
         onazGh+a3YEFDPzBKGGtgjsh2LNHdJJq4/IHNcSdd4uES9H0S1oy/8KdXrCnPSDWK8mE
         KijAjn4A0nb9zYeJ+3lyC/zBNCvIUZc11q/ei1nDnjDXfSgQUp0j/F7i+wR9SVmQuDfI
         zOlEVERHsJDX61NDh+1KsKZHgupz7BRuhzDfNRQTQUzC0wW44fE3CYJiajGGLurIDcBF
         GzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718883307; x=1719488107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rm0p3ifM1mvsX1ZP0z5AtqzhzB7gV2tVDLMJERR6NCI=;
        b=PQfK0dscerUMiuoVW5dKyA/GvaKGq8b2VjDbRkE8s0uPM6Fchu+3L01+S6/q3UJXR7
         qzBQF/NF/ou+nMJb+DJ5i8yd0CzY/cldhHa6HvK0e/kSUBXxWq8C3ZFaNSweIC8NTK/Q
         +EfbBPBUOYreZI6El2Bh46HpuciYEy6X6y2ZgtiPxl06CJdnH+TVBXu9ZpDl/UGZhAvt
         /q5QL1EQ+PeOB9lp5iK7/5/CSwW48A0GLmZLZhe9ohMXN8493PQ/J6IjgCXNfmhheytC
         jaM2lOQoMDOxUVEp52dgTBOvncKbWsIAO+G4aB4569LPoIwONeQLpOG93aMNZdo7BOhZ
         84zw==
X-Forwarded-Encrypted: i=1; AJvYcCXBCUz+hXJ0fRYhbXEpSzTp5lWXnEM4XVL+2T/03nxUpVMVMu6JhqjEq9TNDdYQ3NY6E8Ma+5HzLsDOpz87mmFM6Ytp+cpKzx2BSSGBLc4T
X-Gm-Message-State: AOJu0Yy1/E7jlWLSH6MXjQRvT/z5opj9N9lWxtYz50co5dHeb50xP4Zj
	tnu8RRhNLPVV4lxq0TyvLgYZXjreIuuyNapUT4oOKYKjxsF8h7+pYRyyPkZimcs=
X-Google-Smtp-Source: AGHT+IGITfCEpwFct/l4OjaPbZYnxzu8jG4aF3Etd4mv8IL4/vYQZk/8aqDfBzKmZssKsLb26FIdcw==
X-Received: by 2002:a05:600c:22c3:b0:424:7615:ecc0 with SMTP id 5b1f17b1804b1-4247615eed9mr36879725e9.6.1718883306600;
        Thu, 20 Jun 2024 04:35:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42471e6623fsm49708985e9.1.2024.06.20.04.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 04:35:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 20 Jun 2024 13:34:49 +0200
Subject: [PATCH 1/7] dt-bindings: i2c: atmel,at91sam: correct path to
 i2c-controller schema
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240620-dt-bindings-i2c-clean-v1-1-3a1016a95f9d@linaro.org>
References: <20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org>
In-Reply-To: <20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Sergiu Moga <sergiu.moga@microchip.com>, Benson Leung <bleung@chromium.org>, 
 Guenter Roeck <groeck@chromium.org>, Doug Anderson <dianders@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 =?utf-8?q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Vignesh R <vigneshr@ti.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Chris Brandt <chris.brandt@renesas.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-omap@vger.kernel.org, 
 Kamal Dasu <kdasu.kdev@gmail.com>, linux-renesas-soc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=952;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=u46DXMnnV+4LGWHLSY0HJbWET1X6kq31L8FmQvAWJfo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmdBPfKTxkgSWFS16ttNrSkHVD+KfF9UARnuiYo
 p/Rg1/qfC2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnQT3wAKCRDBN2bmhouD
 1zFeEACRB+3buIVB42wep9GrsWRJvPAbGfU1NiSOwOWMl4acBsi/Ae7Sgi5W0g2LptUCrzkfkGQ
 xUD/SXSg8YfnX4nS43j8v+T6sdKojb/YDnwydeU4dcZ3QiXwDOFXKUYBhD1fDg+H8nj/Bf0ONL8
 5ACzYaz7KG+UibU9qrO38oQZRUGnnaQZziZ5PPDbdhKmJJMR17dJm+j5b95yf1vddig+6q3EXyB
 3Pe15ZkAttWaqygCI9BzVdJtRI+fLyuZyRElgrKPHFiRUZ8CCQraImgzLMPAiImujpgWBw6S3gk
 aQ7agZgAsbtcx5zTS6OkpIjqKfTWoiJ2mLhllJ9K7NsaD30I3b7zZcx8xdf1RgWVcites4dLQ/h
 MrDNwXUxJ9+OCngyaGTvvk7S9Ue5pkucYk3Xkh3sqgGmko1AnAHHJbj9/4OEf6yDuMqerFsa+up
 iXraRVe4ss1L9zvciJRhJ5/GAFq8b+9wNKpOaQJ5E/iwdSQP6GwGQpG0EbGqavil/1deI6DnXYq
 ojQlij3BgC/stXMg4mA/56o/2yDjIKup6nrl+lUWebS9+DV96Mnmw+eb8KxRc5df6fogfVBRT3p
 bjtUkCU/fR5+IQyJkhrqTIcDZsveUV/E3H7/oiFIk/ShvLXbcGQuuBd/y1ug0McV5mw9W+gKcmu
 3xrSukroiOeO5GQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The referenced i2c-controller.yaml schema is provided by dtschema
package (outside of Linux kernel), so use full path to reference it.

Cc: <stable@vger.kernel.org>
Fixes: 7ea75dd386be ("dt-bindings: i2c: convert i2c-at91 to json-schema")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
index b1c13bab2472..b2d19cfb87ad 100644
--- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
@@ -77,7 +77,7 @@ required:
   - clocks
 
 allOf:
-  - $ref: i2c-controller.yaml
+  - $ref: /schemas/i2c/i2c-controller.yaml#
   - if:
       properties:
         compatible:

-- 
2.43.0

