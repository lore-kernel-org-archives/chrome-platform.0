Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36714175BF;
	Fri,  6 Dec 2024 03:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733454944; cv=none; b=osRlZ+LdIYRY5WWTtFmNC+K14tmR6EqRWCV/z9TULHJ6z583i5PutMZGGZhlJXoQ7C+XXM8vKtJYeuqqrPsYpMiv8C1ISrXf4s4IbOj4r+NHIIorlsN/SSBvby5iIZJfzwdomNRgIPG5prd/F5FivohvWEEel2wHju/Rp0aIz0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733454944; c=relaxed/simple;
	bh=zQXJcJ42eZeCkXUcZcfvCDN5aoEbWTGs0+cWtqvl/+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=obpI9/QneoC171Zac4GvEDTekUfMC5hQ+mtiUap/dBl7ftntSfc0CO+yBs+Dqb1BV2gfZZWDK7NR0MDd6ZXjibF5hwbGPhDDbq1WLDypZZtJBlOHOvrg4w82Zqh4wxao+Sgjf4fI2t9FoY4i6xd8sSSoXY4I+HF720+pbWEeyck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wjanxt3t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wjanxt3t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A71CCC4CED6;
	Fri,  6 Dec 2024 03:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733454943;
	bh=zQXJcJ42eZeCkXUcZcfvCDN5aoEbWTGs0+cWtqvl/+o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wjanxt3tDKPkTCC4o7YbLMF8UvgURcAjva9M93hiKqjYB//z/BedY8ri7VU2TLoRL
	 Meh0BpwdElqJrScIBjSmYoLBtfSFPGQ/xameDyYeS7b26e3ZqLGZSmpREVzIL1gVod
	 Y+41Uprf9h+2SOvknU+jRcUKNZWjGZCGFPCLo+oM+Pq5XAB5YyzhKjtYUwDD1EV99Z
	 xa2qnZCAi+VL2XfnOWdznOuzym2MLmbYeR6GftiFUlHm7wABLfQlP2kyjp15YOOBTP
	 4ECm4kDDVBq4vgD6BwpO5XXq7OJxL+pCgfZoZlSfVxsLoARtQ4c4fhYWn8fk09nMOW
	 wcMD5piMFE9vA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org
Cc: nfraprado@collabora.com,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	linux@weissschuh.net,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	bleung@chromium.org,
	groeck@chromium.org,
	tzungbi@kernel.org
Subject: [PATCH 2/2] dt-bindings: cros-ec: Remove google,cros-kbd-led-backlight
Date: Fri,  6 Dec 2024 03:14:05 +0000
Message-ID: <20241206031405.1711996-3-tzungbi@kernel.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241206031405.1711996-1-tzungbi@kernel.org>
References: <20241206031405.1711996-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After applying 4c03a44e2668 ("arm64: dts: mediatek: mt8195-cherry: Remove
keyboard-backlight node"), there are no users for using the OF match.
Instead, the device is added via drivers/mfd/cros_ec_dev.c by
970c3a6b7aa3 ("mfd: cros_ec: Register keyboard backlight subdevice").

Remove the DT bindings.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 .../chrome/google,cros-kbd-led-backlight.yaml | 36 -------------------
 .../bindings/mfd/google,cros-ec.yaml          |  3 --
 2 files changed, 39 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/chrome/google,cros-kbd-led-backlight.yaml

diff --git a/Documentation/devicetree/bindings/chrome/google,cros-kbd-led-backlight.yaml b/Documentation/devicetree/bindings/chrome/google,cros-kbd-led-backlight.yaml
deleted file mode 100644
index c94ab8f9e0b8..000000000000
--- a/Documentation/devicetree/bindings/chrome/google,cros-kbd-led-backlight.yaml
+++ /dev/null
@@ -1,36 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/chrome/google,cros-kbd-led-backlight.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: ChromeOS keyboard backlight LED driver.
-
-maintainers:
-  - Tzung-Bi Shih <tzungbi@kernel.org>
-
-properties:
-  compatible:
-    const: google,cros-kbd-led-backlight
-
-required:
-  - compatible
-
-additionalProperties: false
-
-examples:
-  - |
-    spi {
-      #address-cells = <1>;
-      #size-cells = <0>;
-
-      cros_ec: ec@0 {
-        compatible = "google,cros-ec-spi";
-        reg = <0>;
-        interrupts = <15 0>;
-
-        kbd-led-backlight {
-          compatible = "google,cros-kbd-led-backlight";
-        };
-      };
-    };
diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index aac8819bd00b..50f457090066 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -108,9 +108,6 @@ properties:
   pwm:
     $ref: /schemas/pwm/google,cros-ec-pwm.yaml#
 
-  kbd-led-backlight:
-    $ref: /schemas/chrome/google,cros-kbd-led-backlight.yaml#
-
   keyboard-controller:
     $ref: /schemas/input/google,cros-ec-keyb.yaml#
 
-- 
2.47.0.338.g60cca15819-goog

