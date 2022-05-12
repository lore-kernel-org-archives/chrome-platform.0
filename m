Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A4D19F
	for <chrome-platform@lists.linux.dev>; Thu, 12 May 2022 01:39:25 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id r71so2940306pgr.0
        for <chrome-platform@lists.linux.dev>; Wed, 11 May 2022 18:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8zSnMogrcWQWE/BuKkywg38wliZCVpEBThDjWjcPWOM=;
        b=VtUFbwwa5/ZVmUeo8CaGLWIcDdTY2xAxytCChncda0yPaC9e9mDt8yzSz+ehaOeQK0
         hZGEVS9QRMY37sc00EMUzg6XHVfhP0S2QEqTzPV+KsmF/JV2YzXbNGjDORZDxsh/Qe+L
         Ja/impLhIi9fXS/4Lw9wrdFzuygfqeL/GFJ3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8zSnMogrcWQWE/BuKkywg38wliZCVpEBThDjWjcPWOM=;
        b=R2CpI/xRaMYTSQ7LCMxwf9/XSQYG9uU9C7zEDGqvkEerVHEzok7YTNsBrzy7MKbEY4
         q6I4syo+BsRh4Ha2JYQ0XkXYJnGOeEX9tV2szTgm231seVFTX2XM42hnCTBgUE5UaZDw
         LH8hRxLYEWfAWPPtxK2I0uAHe77YSjkKowr+UD8K+4MeNSKv+sUPY53diNAx2gqQkWFg
         k6halUotRAhvO2GHZcfJkT6INPBVa5OKNV5KZSK4Kvx8Yi4Bt8RuRjtid2T5uHybKUnU
         q9cFUFgzL8d0Sm0MuM8YG9yz59JY5KOjTjexXhVCwSUAVXPoLdMINoJSwWse5BgoiTLR
         y+jw==
X-Gm-Message-State: AOAM531vGOAZzwvV+IAZXEb3FZ0qvO8IZ2cJiZiZwJWjAQ1VUM3n6BVf
	h2Ix+2gSmN/p/1iyMyP7sdP8PQ==
X-Google-Smtp-Source: ABdhPJxtiZh2m0y02v4j2QxOoyQY+ZdeZXDWZV/CYYwyTocpEeBMbULAKws0Jzek6ic03DqmxVxQjQ==
X-Received: by 2002:a65:4807:0:b0:3aa:3050:e24 with SMTP id h7-20020a654807000000b003aa30500e24mr23119709pgs.299.1652319565441;
        Wed, 11 May 2022 18:39:25 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:193f:f17a:ab0d:1f83])
        by smtp.gmail.com with ESMTPSA id b7-20020a170902d50700b0015e8d4eb2cfsm2614766plg.281.2022.05.11.18.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 18:39:25 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	chrome-platform@lists.linux.dev,
	Guenter Roeck <groeck@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Craig Hesling <hesling@chromium.org>,
	Tom Hughes <tomhughes@chromium.org>,
	Alexandru M Stan <amstan@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v5 2/3] dt-bindings: cros-ec: Reorganize property availability
Date: Wed, 11 May 2022 18:39:20 -0700
Message-Id: <20220512013921.164637-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.36.0.512.ge40c2bad7a-goog
In-Reply-To: <20220512013921.164637-1-swboyd@chromium.org>
References: <20220512013921.164637-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Various properties in the cros-ec binding only apply to different
compatible strings. For example, the interrupts and reg property are
required for all cros-ec devices except for the rpmsg version. Add some
conditions to update the availability of properties so that they can't
be used with compatibles that don't support them.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: <devicetree@vger.kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Craig Hesling <hesling@chromium.org>
Cc: Tom Hughes <tomhughes@chromium.org>
Cc: Alexandru M Stan <amstan@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Matthias Kaehlcke <mka@chromium.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../bindings/mfd/google,cros-ec.yaml          | 39 +++++++++++++------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index 99eda9ab0651..409ecef967ce 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -148,18 +148,33 @@ patternProperties:
 required:
   - compatible
 
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - google,cros-ec-i2c
-          - google,cros-ec-rpmsg
-then:
-  properties:
-    google,cros-ec-spi-pre-delay: false
-    google,cros-ec-spi-msg-delay: false
-    spi-max-frequency: false
+allOf:
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: google,cros-ec-spi
+    then:
+      properties:
+        controller-data: false
+        google,cros-ec-spi-pre-delay: false
+        google,cros-ec-spi-msg-delay: false
+        spi-max-frequency: false
+
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: google,cros-ec-rpmsg
+    then:
+      properties:
+        mediatek,rpmsg-name: false
+
+      required:
+        - reg
+        - interrupts
 
 additionalProperties: false
 
-- 
https://chromeos.dev

