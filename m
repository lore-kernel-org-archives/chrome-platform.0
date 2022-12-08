Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABB38F6F
	for <chrome-platform@lists.linux.dev>; Thu,  8 Dec 2022 19:39:59 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id d123so869363iof.6
        for <chrome-platform@lists.linux.dev>; Thu, 08 Dec 2022 11:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6knfdCbn21BCTb9mG6T6YdbL/IZU8aMeiwcDOSNAJo4=;
        b=gnTxgQ2YNwFnoPYgG4cIMS+LZ97bY5Yp0AHyoiPlrUT7G4ndzlsjZQoB2Gfq67kx88
         YiWicu4p4r1Zdr+9vpbO+5nEJZTqDOqwgKsxzmVAK537CbhlTySJfvrgonsJVt26ojyT
         pbJpSWBBpnn09OI6AweyatYOvcVUfVsBAhQaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6knfdCbn21BCTb9mG6T6YdbL/IZU8aMeiwcDOSNAJo4=;
        b=0VElMDQugXrqBkBsqHXF1Oj5Zcx+WHSnwpxX7JBAGxy0xAHnQ73hnrDxUTBc1gaJ5l
         WKB7Es6Tfe7n1H2YzXP0P9dbPeSrhDBQFWUODcxzPd/Ww/eG2oH/LgnUSCQqf63G7Gip
         c8HMGnN/OZz8VpXphB4Oa0bvapl0/MGFP2XHoQSh4s6EF0MGoA5sgSm8DYHm67bwHDD6
         LygRoQjDckYvyGmqafiKWCM2KC4S5Y5oO3+Sp2PPINsndok47uClLv2Px+UtXeJ9GQY4
         jamGMl8fRyCKHSFTvSBc9+FfCCRJ4cmc9NgUmD8FZlZDXBzJwSR16AntFFpvsL3Zkjf9
         FLhg==
X-Gm-Message-State: ANoB5pmy/fUqjCtHIjLfQ/g7732UK1EpMV31z516MS0m+g9PEaunszj/
	kuiWa0rrkQb6oN1LV445PnXozw==
X-Google-Smtp-Source: AA0mqf6htiQQBANxQtC64ij512XLq0BetgIsGBfEonOfV8+AaIxjPeGn0rvLwyBUCwAQtpNC3yxztA==
X-Received: by 2002:a05:6602:381b:b0:6bc:d715:b8f8 with SMTP id bb27-20020a056602381b00b006bcd715b8f8mr2455896iob.7.1670528398762;
        Thu, 08 Dec 2022 11:39:58 -0800 (PST)
Received: from markhas1.roam.corp.google.com (63-225-246-100.hlrn.qwest.net. [63.225.246.100])
        by smtp.gmail.com with ESMTPSA id b5-20020a05660214c500b006df13af1f16sm9245441iow.50.2022.12.08.11.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 11:39:58 -0800 (PST)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Raul Rangel <rrangel@chromium.org>,
	Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
	Mark Hasemeyer <markhas@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: [PATCH v11 2/3] dt-bindings: mfd: cros-ec: Add UART compatible string
Date: Thu,  8 Dec 2022 12:39:51 -0700
Message-Id: <20221208123944.v11.2.I9e018ecb8bdf341648cb64417085978ff0d22a46@changeid>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
In-Reply-To: <20221208123944.v11.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
References: <20221208123944.v11.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bhanu Prakash Maiya <bhanumaiya@chromium.org>

Add a compatible string to support the UART implementation of the cros
ec interface. The driver does not support the reg and interrupt
properties, so exempt them from being required for UART compatible nodes.

Signed-off-by: Bhanu Prakash Maiya <bhanumaiya@chromium.org>
Co-developed-by: Mark Hasemeyer <markhas@chromium.org>
Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v11:
- Update commit message to include device

Changes in v10:
- No change

Changes in v9:
- Rebase onto for-next
- Update node-name from uart0 to serial
- Remove reg and interrupt property requirement for UART compatible
  nodes.
- Update authorship

Changes in v8:
- Update commit message

Changes in v7:
- No change

Changes in v6:
- No change

Changes in v5:
- No change

Changes in v4:
- Changes in commit message.

Changes in v3:
- Rebased changes on google,cros-ec.yaml

Changes in v2:
- No change

---
 .../bindings/mfd/google,cros-ec.yaml          | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index 3d5efa5578d1b..cdf1d719efe9d 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -33,6 +33,9 @@ properties:
       - description:
           For implementations of the EC connected through RPMSG.
         const: google,cros-ec-rpmsg
+      - description:
+          For implementations of the EC connected through UART.
+        const: google,cros-ec-uart
 
   controller-data: true
 
@@ -187,6 +190,15 @@ allOf:
       properties:
         mediatek,rpmsg-name: false
 
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              enum:
+                - google,cros-ec-rpmsg
+                - google,cros-ec-uart
+    then:
       required:
         - reg
         - interrupts
@@ -299,4 +311,12 @@ examples:
         vdd-supply = <&pp3300_fp_mcu>;
       };
     };
+
+  # Example for UART
+  - |
+    serial {
+        cros-ec {
+            compatible = "google,cros-ec-uart";
+        };
+    };
 ...
-- 
2.39.0.rc1.256.g54fd8350bd-goog

