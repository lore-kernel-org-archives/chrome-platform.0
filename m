Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C622D481D
	for <chrome-platform@lists.linux.dev>; Thu, 21 Aug 2025 06:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755757730; cv=none; b=KI1Bx+qTbFphsHEK0wp/ibsKH1GqfQeEw0aa6FpwhI0TC91uUG5bzmkFpJgfvLqrlkF0A0iAydrnYXaKHnDc1SUbv5shvXhyKEL+eIfPHQr/MqZbAh9cpUxzLx3JOBtXBHTNuVDXv7LSJafyz5hS3NjkV5mV4+uGecBAa3ZM/uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755757730; c=relaxed/simple;
	bh=BuRfAnFnaOP1D4CJsQUvuku8RSgN8ChGH2kSyQKMXpM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f9oTRXDYiODuSCd/fdYktcCEJons5aUvxjg31H24P2DO2ALtLZHvuPpA6l+fovKu03kZJY9JVp0fzSZjFKmxV62MaaxxLzHYzqvzvQI3uM1jWhUJgK7HKj5UjCxa65EepFBnwx/XuBP2RVrMHMCWMRErW09D8+LhmvGRLPOlZnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g96ObJ2b; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g96ObJ2b"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-afdefc9b005so11931766b.0
        for <chrome-platform@lists.linux.dev>; Wed, 20 Aug 2025 23:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755757727; x=1756362527; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RdUVASp7YNyKaUR2qHcgjrjThqHqtigmKhoUTntMczo=;
        b=g96ObJ2bb13aeoKBnWRmWZiXm5BD7KogR/vVgy56FJSU9TUap5UgqxtaIrbiF6uZ0F
         p7ZodJkEPrh+iEzQsctkCxJj2FX9VNBkz9r0eZ5A3NjLadzRqFXnZ6bvSZOiXaHznLEv
         OXGtyKvwbtivjhYqfjnT9tqkWfBW/EiBotsz2RzWA2s4vIdZa+wXdyrutQgjZuADPXNM
         7+Sd2n7P2LTWmS137Kr0NbgFh7ynWxKwxAP5PLQ4PNNVxFGyWZpsf3tZxJG/oqb1SDOG
         L7vCMfK4YRUHf78PKvnP7BjM97/jFUkPuJuQjbAKE79lZpAEy/bxOsgm6GLy+JwqF1S0
         H10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755757727; x=1756362527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RdUVASp7YNyKaUR2qHcgjrjThqHqtigmKhoUTntMczo=;
        b=Ze2GKbpRtjes/9DjNEq+WUXWBHhifkUFiB2NPWy9r/+lcITWyru+ZM0ITDS8LyCjKS
         Fl0PtG6RZVQTPzgGPyK9ksGur7pE4ZNeHvq7vwrXOvGaTegO+IfAyodaD2ZxxdFzqRH/
         OFrF5Vw4KRm2NHVBrX/73AP2vxDFMkTnSBaeme6Mhed+FxeZNYcONjmpsEbg7HjU03uZ
         VyAfPybvf7LRiNrL3RMkyfNwfTN2WNY4PfNpKMm80pqFR5ht9qToFaJgPsBIM+yniwUx
         HDXwZptckku7dQxyzHo4vy98Ej++x9OziZ85TmQVOhiwMbuhC+cVNDgaNlZP+TwshHYo
         Fgwg==
X-Forwarded-Encrypted: i=1; AJvYcCX6tiTrULDVaY4jZwMAGaC+ovjSeHVjnw/jVNtvQVH6AB7LELAOQMjmNhJKY85Bs5jLhLOzHpJ3/TN9FlbHstQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9jXBmXahAhItOTWnR8Ptmh5856GBBrDhWEKLKMd70Q176ezQC
	scgOuZ5Jjc+woQtIGuo52sxltd1/EsDoRsJaI1q3gloQCIxR1c4nKGL3uAUGm9iY2rI=
X-Gm-Gg: ASbGnctIpM9nv2w7Yi0xZkDVaXw0AiKVMwnbnt+Wt9mNnvetXnBz/hV47zls+ybDAo7
	X3ShqcGHpvBJpXE54rv/03bOGeqT0KBCpKxc4owsc7dI7jwXyxGwFKiazI6sRT6Ynp91K0XUyh2
	9/IUdWCVaVig/GK1XgicyYC9BpnsisKN+AV9VRDKpv30raLhrCRtGK77qVnIo76Rf00rmCZrDKI
	9BZ8RInB1DiwkqB6OP1Nf+8M33UZinFgtWmRXjJwzl4PAKN3AcYwqaQrpHCttSA1pC/PEODXzrv
	leBQ8p+r4aI+tIY5GQCx06VJ68OvTRaHx6efFk9aTCFyPYy6impZyhqIidzzRfc4eG7BpdBldZm
	ww6p5G+/1XjP6qo0ESW3HFRzi3CXGgmYLbA==
X-Google-Smtp-Source: AGHT+IGboT0zZyC1O+5BE8fpnBfnc957GqC4iwpI3neSB8Xxwq58FC9qag7/uLD5PdUhRv7MO8IczQ==
X-Received: by 2002:a17:907:3f9e:b0:ae0:c276:d90e with SMTP id a640c23a62f3a-afe07a0e6a4mr67859966b.4.1755757727090;
        Wed, 20 Aug 2025 23:28:47 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded479868sm327334966b.58.2025.08.20.23.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 23:28:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tim Harvey <tharvey@gateworks.com>,
	Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mathew McBride <matt@traverse.com.au>
Subject: [PATCH] dt-bindings: mfd: Move embedded controllers to own directory
Date: Thu, 21 Aug 2025 08:28:41 +0200
Message-ID: <20250821062840.9383-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4904; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=BuRfAnFnaOP1D4CJsQUvuku8RSgN8ChGH2kSyQKMXpM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopryYe55RPyEPBDxuIysytsjwZXrGU13RiseVq
 9CsfRiTjXWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKa8mAAKCRDBN2bmhouD
 15kmD/9Q7Zpp5+h7XrEAaw2XkPWouR762eRSFXtOsWf0fAEy0/nEkVTJM3X2bgoCA+kzBspaOkd
 dDx+wDCAPeTEeUJhdTrlcEI9SvNrSomyNURwQr0/vbp/w4LdM9HvnYnFpZw3tFsL2/L1q8h0jsn
 l6W+JjPxHg+NyNnHfkeUQz6HgoJODDhqP5tLws5Juk8mI/nD0fJlBQQxDyAKJqBo0T+easLhKB2
 7JiwCewCrMd6u0+KkV/kghHGYsJBmR2ybifDuaxKVxHVhj6L2s+rkyqsQnxjYQZLvoWINzuuAJD
 XxB8ezzBjQqg/2IdHSRcgOHXO93e9i2dKAv/u/fw8jCX7xAj4NQG5033XopBVMNcKXTx3fn/FAC
 zjWrqCfJzmzumt22xdo2a/UmCVBpt4o6uQJF9HTn7Hjr7v8BFVanWBOooPXfYRCWYpG2duzsmqK
 X3AHv9mSmAk6EmkrtKlzTWJ4yVOXRLKDD3+l0sceBPMUnt8VgqpiYR1gcIIeURyhosfRqDfiOfz
 OdpQVZj0D9NccW7xfL+2MML2AcHZURXtiZXPQcjIHCSN0tRQL1o1Lm6689Y4j9G86VpQyWxG2oG
 etWm76IKRB20J3rj6NISaC/Nwu0etBNyVK5TYVSKoDDN+jR2oj4pqPV9fsPYdQ+gsRAsE1Cmj2H F0m0JXCBqrSIryA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Move ChromeOS Embedded Controller, Gateworks System Controller and
Kontron sl28cpld Board Management Controller to new subdirectory
"embedded-controller" matching their purpose.  MFD is coming from Linux
and does not really fit the actual purpose of this hardware.

Rename Gateworks GSC filename to match compatible, as preferred for
bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Mathew McBride <matt@traverse.com.au>

Lee,
Can you take it via MFD?
---
 .../bindings/{mfd => embedded-controller}/google,cros-ec.yaml | 2 +-
 .../gateworks-gsc.yaml => embedded-controller/gw,gsc.yaml}    | 2 +-
 .../{mfd => embedded-controller}/kontron,sl28cpld.yaml        | 2 +-
 MAINTAINERS                                                   | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename Documentation/devicetree/bindings/{mfd => embedded-controller}/google,cros-ec.yaml (99%)
 rename Documentation/devicetree/bindings/{mfd/gateworks-gsc.yaml => embedded-controller/gw,gsc.yaml} (98%)
 rename Documentation/devicetree/bindings/{mfd => embedded-controller}/kontron,sl28cpld.yaml (97%)

diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/google,cros-ec.yaml
similarity index 99%
rename from Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
rename to Documentation/devicetree/bindings/embedded-controller/google,cros-ec.yaml
index 50f457090066..3ab5737c9a8f 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/google,cros-ec.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
+$id: http://devicetree.org/schemas/embedded-controller/google,cros-ec.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: ChromeOS Embedded Controller
diff --git a/Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml b/Documentation/devicetree/bindings/embedded-controller/gw,gsc.yaml
similarity index 98%
rename from Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml
rename to Documentation/devicetree/bindings/embedded-controller/gw,gsc.yaml
index dc379f3ebf24..82d4b2dadbae 100644
--- a/Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/gw,gsc.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/mfd/gateworks-gsc.yaml#
+$id: http://devicetree.org/schemas/embedded-controller/gw,gsc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Gateworks System Controller
diff --git a/Documentation/devicetree/bindings/mfd/kontron,sl28cpld.yaml b/Documentation/devicetree/bindings/embedded-controller/kontron,sl28cpld.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/mfd/kontron,sl28cpld.yaml
rename to Documentation/devicetree/bindings/embedded-controller/kontron,sl28cpld.yaml
index 37207a97e06c..0b752f3baaa9 100644
--- a/Documentation/devicetree/bindings/mfd/kontron,sl28cpld.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/kontron,sl28cpld.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/mfd/kontron,sl28cpld.yaml#
+$id: http://devicetree.org/schemas/embedded-controller/kontron,sl28cpld.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Kontron's sl28cpld board management controller
diff --git a/MAINTAINERS b/MAINTAINERS
index 7969d09dff17..f3e4c1aa656e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10129,7 +10129,7 @@ F:	drivers/media/i2c/gc2145.c
 GATEWORKS SYSTEM CONTROLLER (GSC) DRIVER
 M:	Tim Harvey <tharvey@gateworks.com>
 S:	Maintained
-F:	Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml
+F:	Documentation/devicetree/bindings/embedded-controller/gw,gsc.yaml
 F:	Documentation/hwmon/gsc-hwmon.rst
 F:	drivers/hwmon/gsc-hwmon.c
 F:	drivers/mfd/gateworks-gsc.c
@@ -23177,10 +23177,10 @@ F:	drivers/usb/misc/sisusbvga/
 SL28 CPLD MFD DRIVER
 M:	Michael Walle <mwalle@kernel.org>
 S:	Maintained
+F:	Documentation/devicetree/bindings/embedded-controller/kontron,sl28cpld.yaml
 F:	Documentation/devicetree/bindings/gpio/kontron,sl28cpld-gpio.yaml
 F:	Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml
-F:	Documentation/devicetree/bindings/mfd/kontron,sl28cpld.yaml
 F:	Documentation/devicetree/bindings/pwm/kontron,sl28cpld-pwm.yaml
 F:	Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
 F:	drivers/gpio/gpio-sl28cpld.c
-- 
2.48.1

