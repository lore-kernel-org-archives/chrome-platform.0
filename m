Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE864149009
	for <chrome-platform@lists.linux.dev>; Sun,  1 Sep 2024 04:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725163651; cv=none; b=Qpt/m+kpT4TELts6WNzji3qH+Z14nIzFhICDD0jpQN7XOXD7SfkHuQKxPXZunIM8WJiC4ENsCQw8JGe83LlggXJCjQXGQ2sL2EWVvMlJ0y2u+97APqFvBOQbW40zTDhm9Z5lEiQTXKxuvgeJh3xiy5ghV115FBbatBBbKjR6rV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725163651; c=relaxed/simple;
	bh=aHxbXooyxcUO5JwBCTNyqni3GmuKJP5ay9S/7oeiMaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UHW4GmmgFkbpX47J00nRXTLnHXHX/SPuhls8fpaaVxCmFfzTx9K5N372CROdBFd5YX9NiPgoEQSvQTWpy27W7RWoIZXjfu6fCfAXr7pMCcaKDZBN43I1y6SIHh4hMkLRX7BU+Tj2COrUniI5D9j4ngZnxNWfaPksPPg0ykyq8ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CZmAv6vH; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CZmAv6vH"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-39d47a9ffd5so12044395ab.2
        for <chrome-platform@lists.linux.dev>; Sat, 31 Aug 2024 21:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725163648; x=1725768448; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVAbaFTBXgnW+fAYVEBW9D2cgqLAHsvQgjfJBzfAY3s=;
        b=CZmAv6vHlaepzKshLLEuOdr2tBUhjq/M8JnRY8pxnXEZIz+VD49TjY493IouYm1fxJ
         7XsPYktd0M/IQGeiHann51TaYPvDYEU1FVT+BZrhab7SC8sQN5UfMWSMib0BSLaOtaGP
         0+3G4z2tD7X6tvVCg2Tld0lIB3Y7eaURQq09s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725163648; x=1725768448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lVAbaFTBXgnW+fAYVEBW9D2cgqLAHsvQgjfJBzfAY3s=;
        b=BiyS/FxHoJas76BSa7aQPR5JtubgZmQkzyjF/Q1oeE+XWwHPM2o62eOVNbC+U3pX7D
         6k+4RHnRUnwmu+P7JhwFPksMpClDNvuXhZ2SFcmLP8ZoZvJEuz4jR9jvUOwbLALF1HW8
         ZvV6oxn0wr4iPQAzoupvl84Ywfv8GTnR0xU+ig9J6q8NWYjdjtYAcHFwj4dgj8D9dG0H
         SyiKbT8508maR+AYShkXF+ZmL5pwef6ySPUt0Mbfk/UV+EdIQ33XjF0ATUYQ+UJVhsia
         AZfgj1hXkaw/a/Pkp7i8JLO/3ULtl73cWtZKBwWXLZKc3Msczw5tWWv0j6jSiPN2+7jc
         +E7Q==
X-Gm-Message-State: AOJu0YzC54h2qrWYYxsy59POE+7We7dypqp+0jIZobITITPjZH6rQtML
	1UeWaMS9komziEkXZd1Qu0uK5LTLmsalh4kSzBfZTCIU8pu7Ikw0ikuYQflX0oR8wjF/TMTjunQ
	=
X-Google-Smtp-Source: AGHT+IFsOTewMNJ0BJt0tAvMG/AJBfDBb9as9o8BHiOu5PQfrktxWGnHk+Ahlp9K/S8f1Bq4n28w/g==
X-Received: by 2002:a05:6e02:1c42:b0:39f:5646:97da with SMTP id e9e14a558f8ab-39f56469978mr14867835ab.20.1725163647832;
        Sat, 31 Aug 2024 21:07:27 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-7d22e9d77f2sm5333884a12.89.2024.08.31.21.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Aug 2024 21:07:27 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	devicetree@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Benson Leung <bleung@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org,
	Guenter Roeck <groeck@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Lee Jones <lee@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Prashant Malani <pmalani@chromium.org>,
	Robert Foss <rfoss@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	linux-acpi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v4 12/18] dt-bindings: usb-switch: Extract endpoints to defs
Date: Sat, 31 Aug 2024 21:06:50 -0700
Message-ID: <20240901040658.157425-13-swboyd@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240901040658.157425-1-swboyd@chromium.org>
References: <20240901040658.157425-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the usb-switch endpoint bindings to defs so that they can be reused
by other bindings. Future users of this binding will have more than one
type-c output node when they're muxing a single DP signal to more than
one usb-c-connector. Add an example to show how this binding can be used
and accelerate binding checks.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: Prashant Malani <pmalani@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <devicetree@vger.kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../devicetree/bindings/usb/usb-switch.yaml   | 74 +++++++++++++++----
 1 file changed, 61 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-switch.yaml b/Documentation/devicetree/bindings/usb/usb-switch.yaml
index da76118e73a5..f5dc7e23b134 100644
--- a/Documentation/devicetree/bindings/usb/usb-switch.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-switch.yaml
@@ -35,9 +35,12 @@ properties:
     $ref: /schemas/graph.yaml#/properties/ports
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/properties/port
-        description:
-          Super Speed (SS) Output endpoint to the Type-C connector
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+
+        properties:
+          endpoint:
+            $ref: '#/$defs/usbc-out-endpoint'
 
       port@1:
         $ref: /schemas/graph.yaml#/$defs/port-base
@@ -47,16 +50,7 @@ properties:
 
         properties:
           endpoint:
-            $ref: /schemas/graph.yaml#/$defs/endpoint-base
-            unevaluatedProperties: false
-            properties:
-              data-lanes:
-                $ref: /schemas/types.yaml#/definitions/uint32-array
-                minItems: 1
-                maxItems: 8
-                uniqueItems: true
-                items:
-                  maximum: 8
+            $ref: '#/$defs/usbc-in-endpoint'
 
 oneOf:
   - required:
@@ -65,3 +59,57 @@ oneOf:
       - ports
 
 additionalProperties: true
+
+$defs:
+  usbc-out-endpoint:
+    $ref: /schemas/graph.yaml#/$defs/endpoint-base
+    description: Super Speed (SS) output endpoint to a type-c connector
+    unevaluatedProperties: false
+
+  usbc-in-endpoint:
+    $ref: /schemas/graph.yaml#/$defs/endpoint-base
+    description: Super Speed (SS) input endpoint from the Super Speed PHY
+    unevaluatedProperties: false
+    properties:
+      data-lanes:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 1
+        maxItems: 8
+        uniqueItems: true
+        items:
+          maximum: 8
+
+examples:
+  # A USB orientation switch which flips the pin orientation
+  # for a usb-c-connector node.
+  - |
+    device {
+      orientation-switch;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          endpoint {
+            remote-endpoint = <&usb_c_connector>;
+          };
+        };
+
+        port@1 {
+          reg = <1>;
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          endpoint {
+            remote-endpoint = <&usb_ss_phy>;
+          };
+        };
+      };
+    };
+
+...
-- 
https://chromeos.dev

