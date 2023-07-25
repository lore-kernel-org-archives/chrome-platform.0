Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5176B1ED32
	for <chrome-platform@lists.linux.dev>; Tue, 25 Jul 2023 10:23:31 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-991f956fb5aso791400466b.0
        for <chrome-platform@lists.linux.dev>; Tue, 25 Jul 2023 03:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690280609; x=1690885409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ja4+MqHfl9X0tKSYm800u8KwnOGZLdpwubmp8VoMlQQ=;
        b=O+18cz9q0RR58TDgOKYgTYov+m+0R9fEuoRTb6OKJoK/JGW+YcI61YlQXhZeL8biQ0
         hjUeozP4G0k7EXRCF17f9p+lMPNvY65hgqBjWzvS+v8yFLQ7ZIwKzB9mBh/zcVrcw58G
         ct8ilL7SjMYd8PL+cl/3sh6HAMag3kGAmuMbDkwjzG/1eeODZxzrS8ixlkEfVha6HlQ4
         HEU7vujNoVLlk0xRdEpCFowLT0lNwMj192ZwOvAPto93q5y/HjPskn4unYEVzpcFTkt0
         upP4RTpxzxX6ZlM/o+C/bn68fQmHNDvshFHy+TPTPkzVn8icoNXAJoArG4epe3jnzFF+
         jGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690280609; x=1690885409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ja4+MqHfl9X0tKSYm800u8KwnOGZLdpwubmp8VoMlQQ=;
        b=aDlt+7kv01giL9d4T2Dy0Eym0oKsBwP2HEMuR6vLnjUgn5QreEL75r2StwtGCbdsLV
         BFtKeXLRfmT3cc6kYg9uPgYa0CKlF7QkVwm59SHVSB0+J4nbXbOWe2etgOG2IoWDcZwh
         m+Bg+NCKLiUb7fRA/90DuqrKpkzgrioKfo8D0KyMjBKBWjrpM/1E0//l3WH1z8asFldc
         rUKkS1z5F2GyPm41rEoNu7SNluPDSMWDhqi3pqHLGuQ48prZyJbnW2X/K6OffyuOa7aD
         0yMLhUnObD7BxVg2FHzunEo4rFbmAvK1QVRjXUajujGSgau/Gq0jveTrAXH3SjMHe3iV
         6amA==
X-Gm-Message-State: ABy/qLahVVpvyhW1NJhbmoPHgILSfdf6J6u0c1ZT2Fwcqe3w3AB/bprr
	fEAZ0pKIl9/fJUMb7TG/E6yD4A==
X-Google-Smtp-Source: APBJJlEnJZpNRqox/mI/F+UVFWcjxKilSCWS+31W6pOEKBcwwQ2PZ/TVSqbTP/NQeP//kD5YeBtq2A==
X-Received: by 2002:a17:906:300d:b0:973:d06d:545f with SMTP id 13-20020a170906300d00b00973d06d545fmr11568811ejz.24.1690280609327;
        Tue, 25 Jul 2023 03:23:29 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id m26-20020a170906849a00b00982a352f078sm7832471ejx.124.2023.07.25.03.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 03:23:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Prashant Malani <pmalani@chromium.org>,
	Wayne Chang <waynec@nvidia.com>,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] dt-bindings: usb: connector: disallow additional properties
Date: Tue, 25 Jul 2023 12:23:25 +0200
Message-Id: <20230725102325.76336-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

USB connector bindings is complete, thus no additional properties should
be allowed.  Add missing 'reg' property and change additionalProperties
to false, so the schema will check for anything not unexpected.  This
also allows to drop the 'reg' from other bindings referencing the
usb-connector.yaml and make it required.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Make usb-connector.yaml additionalProperties:false (Rob)

v1:
https://lore.kernel.org/all/20230723071105.40157-1-krzysztof.kozlowski@linaro.org/
---
 .../devicetree/bindings/chrome/google,cros-ec-typec.yaml    | 6 ++----
 .../devicetree/bindings/connector/usb-connector.yaml        | 5 ++++-
 .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml       | 6 ------
 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml | 6 ++----
 4 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
index 3b0548c34791..9f9816fbecbc 100644
--- a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
+++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
@@ -29,10 +29,8 @@ properties:
 patternProperties:
   '^connector@[0-9a-f]+$':
     $ref: /schemas/connector/usb-connector.yaml#
-    unevaluatedProperties: false
-    properties:
-      reg:
-        maxItems: 1
+    required:
+      - reg
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 1c4d3eb87763..e1b8b8b63120 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -30,6 +30,9 @@ properties:
           - const: samsung,usb-connector-11pin
           - const: usb-b-connector
 
+  reg:
+    maxItems: 1
+
   label:
     description: Symbolic name for the connector.
 
@@ -264,7 +267,7 @@ anyOf:
         - typec-power-opmode
         - new-source-frs-typec-current
 
-additionalProperties: true
+additionalProperties: false
 
 examples:
   # Micro-USB connector with HS lines routed via controller (MUIC).
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 6440dc801387..bceb479f74c5 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -38,15 +38,9 @@ properties:
 patternProperties:
   '^connector@\d$':
     $ref: /schemas/connector/usb-connector.yaml#
-
-    properties:
-      reg: true
-
     required:
       - reg
 
-    unevaluatedProperties: false
-
 required:
   - compatible
 
diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
index 75eec4a9a020..89fc9a434d05 100644
--- a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
+++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
@@ -43,10 +43,8 @@ properties:
 patternProperties:
   '^connector@[01]$':
     $ref: /schemas/connector/usb-connector.yaml#
-    unevaluatedProperties: false
-    properties:
-      reg:
-        maxItems: 1
+    required:
+      - reg
 
 required:
   - compatible
-- 
2.34.1

