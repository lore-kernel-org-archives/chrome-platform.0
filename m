Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6002A261381
	for <chrome-platform@lists.linux.dev>; Mon, 21 Apr 2025 10:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745230390; cv=none; b=RZTGoC79tvNqMCl14nssPdv5nb2YV/v7UShGdPb6BlcWlnnA3cs7Cw3MvWZX8ikEPCrfVVZ2sxiggD+axZa34ektJ1VQUcgIiXJZZkHpi/6vHF/ZJlorNiVtQXtOGMmjwZIYwQHGAJVufZjEbQQ7M8hIaw8dcrGOweFWFUeeFZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745230390; c=relaxed/simple;
	bh=/aJIi6jFMkCKzafBM/nNKdpS5PB1CaOQsX/+a6oYEE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XuyvTIY5zcLZbsl6tS1cALY6UHFvZpus8aTs/aQA9VJxZBqCR4QuM0iDUYNDmvW6lCGvdhPHk/QexChkYs0qe2XIvLUdD2iC0qwayjo4y18ouB0pR5P1F6QM9/a6I9uJdO8tioiiM8v0SI7Df4oEVVOr2N0NKRyzWwxnu1h6DSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZGiAyWcb; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZGiAyWcb"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-227c7e57da2so33315185ad.0
        for <chrome-platform@lists.linux.dev>; Mon, 21 Apr 2025 03:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230389; x=1745835189; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gUKhgL8xbYN2S+4GVogDZp2nilBSVWla8H/MwRjdFI=;
        b=ZGiAyWcb7l0NOesjVCdnDyQitMem6ZooGO9R6n5lgNUJUQNZ18v3xz6lcjbiDEyXTJ
         wAlJ1r1Et8p/MNs191A667/QepGA4EL3Xn+CBfnZx+NAct1q9ixM/vBaI4UhMD8BM/Rv
         2/7zVlhJn9jUQFn3gcJzaDBQBh6fIz/2uNmdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230389; x=1745835189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5gUKhgL8xbYN2S+4GVogDZp2nilBSVWla8H/MwRjdFI=;
        b=LlzXEBo3RFPCjXyY29nmtSmWcvklXDhRJIx+zhzglYA0n3MRQtgBmza6haPZbvVR7x
         UrLeE1HfMkULmaGYYF0qCVUyrG6OJJG3jGEsUfVoalJfcUQzzvGTARduF5AXawho0dib
         y6MhRYsve6+wChC9QqMMwaCuhRp5GBSvO4KFnjHH+E2qxMf/x0GVwOB1n7T7VjnpEb5d
         d1optOSR2m+k8Hc5D+r5IPYGtMEgTIFa2Mue8qQl4sIx7IqUf5nVDm2W5Z66sqweRLo6
         3jsKu4c2rY035fZFCoY0pmLDPwhgxfQn8Q0XhQYVO6pa/uBrwPHAPdh+7plUSzGYkc8h
         t0uw==
X-Forwarded-Encrypted: i=1; AJvYcCWAlD01VKotw2wr2bOHJft+dNqDqhKcOFdwjbhbEDRveV/E48zGpYlwQeKacp0uG+iCCmWpIzVzJ/Eni0PAU00=@lists.linux.dev
X-Gm-Message-State: AOJu0YycrefRayesi44YKugH3W0OCg+jbOFujsnyBhGjYSBMkINuc5ft
	QDCcUlAThNb5cStz1FDP/wt6zMhYOq3OcPz9Qjpgk36H5J1fqGd07w7jWgFeAQ==
X-Gm-Gg: ASbGncv/FVq/1cQegmbnGN16u9N/4gZLfcku3xnZngEBPImnK8vN3esumQOM3bY0zFl
	uM3mZtlJ60RLIjfIOIIWWAlUWhR1PId3Hqd1y2IjVaktT720yvMS0AGCMRlNqvtEAl7d0F1af9N
	YmmPScV7XMrGGO6elaDlquhlQYp6DIwgHpdVugp1FAE6xIv4yVKfsaL3y8YzcMPlCmI+C+ZVyAv
	hGPiHkigORfgRy20AVjvYKHxoiM4T7HkhvByOWpp+QaFeDli2mIQ0gsWkdhH7Jls3vi/XEoTnrf
	h5YYnd8nmf/jJ0Rz1l4fnkJOso6vU2agB7AKbxUfaonyIMyW6rpv5EsfHuQ=
X-Google-Smtp-Source: AGHT+IEkr0EFkCj5J6CNLSHPTa49yKoitttF/R1BiDswDnBiG+hklRUae4FmkHmy3Ilt86P50nrk5g==
X-Received: by 2002:a17:902:f78c:b0:215:9bc2:42ec with SMTP id d9443c01a7336-22c5361fcedmr148300365ad.47.1745230388644;
        Mon, 21 Apr 2025 03:13:08 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:08 -0700 (PDT)
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
Subject: [PATCH v2 1/8] dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
Date: Mon, 21 Apr 2025 18:12:39 +0800
Message-ID: <20250421101248.426929-2-wenst@chromium.org>
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

The Elan eKTH8D18 touchscreen controller is an I2C HID device with a
longer boot-up time. Power sequence timing wise it is compatible with
the eKTH6A12NAY, with a power-on delay of at least 5ms, 20ms
out-of-reset for I2C ack response, and 150ms out-of-reset for I2C HID
enumeration, both shorter than what the eKTH6A12NAY requires.
Enumeration and subsequent operation follows the I2C HID standard.

Add a compatible string for it with the ekth6a12nay one as a fallback.
No enum was used as it is rare to actually add new entries. These
chips are commonly completely backward compatible, and unless the
power sequencing delays change, there is no real effort being made to
keep track of new parts, which come out constantly.

Also drop the constraints on the I2C address since it's not really
part of the binding.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Reworded commit message
- Dropped the enum for the new compatible string entry
- Dropped constraint on I2C address completely
---
 .../devicetree/bindings/input/elan,ekth6915.yaml     | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
index cb3e1801b0d3..0840e4ab28b7 100644
--- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
+++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
@@ -4,14 +4,14 @@
 $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Elan eKTH6915 touchscreen controller
+title: Elan I2C-HID touchscreen controllers
 
 maintainers:
   - Douglas Anderson <dianders@chromium.org>
 
 description:
-  Supports the Elan eKTH6915 touchscreen controller.
-  This touchscreen controller uses the i2c-hid protocol with a reset GPIO.
+  Supports the Elan eKTH6915 and other I2C-HID touchscreen controllers.
+  These touchscreen controller use the i2c-hid protocol with a reset GPIO.
 
 allOf:
   - $ref: /schemas/input/touchscreen/touchscreen.yaml#
@@ -23,12 +23,14 @@ properties:
           - enum:
               - elan,ekth5015m
           - const: elan,ekth6915
+      - items:
+          - const: elan,ekth8d18
+          - const: elan,ekth6a12nay
       - enum:
           - elan,ekth6915
           - elan,ekth6a12nay
 
-  reg:
-    const: 0x10
+  reg: true
 
   interrupts:
     maxItems: 1
-- 
2.49.0.805.g082f7c87e0-goog

