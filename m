Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECAC63C2
	for <chrome-platform@lists.linux.dev>; Fri,  9 Dec 2022 16:26:29 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id d14so127030ilq.11
        for <chrome-platform@lists.linux.dev>; Fri, 09 Dec 2022 08:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgG/TNRbidgEyJvAVaHHfxRU0Ng4OyfVihTTmLvE0JQ=;
        b=K2COfFDPnQsv126b/kS1Mvllrw3QIpmb9WDCa0cAUFybrJ8VpQtraDrw/XddNXS3hE
         CGUa7htqAGx3XqePpeRi597iv9RWO6TM8JJ7TLnEN80eCZmZTxPMay9cq7dJzDL1AqnF
         oS2lECZHiRtfUgaLT2+k0OKBqtzpeIlqzUgn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IgG/TNRbidgEyJvAVaHHfxRU0Ng4OyfVihTTmLvE0JQ=;
        b=ds77OUwg0bHOL1Hds1qNh+9npl34gNuNstvqlyzKz8tcporJ0n6J+6Ya8E5jYqegsD
         81bYnjq6i8uBiVycDAp1lwWLX/gv7idg3Qhes/4t4DWkJenKTZgXJSI4AbvuQHmLJ1o0
         Emh5bdIN/moJOXJmN1b/mCPuH1zcJ02UbxIyY67JaERICNAzdnYlRh6u84UjNarT7oze
         Fbfao5ScwgmLl4AyJYGYlDUFHPvuKc8ZVDQHX0GepWTasFOZixU+uonrMf0b0hzXpub3
         wMN8ONeocCzv5+9YDtvg+ywHhSzoFaGrWrbEOKLXIUY2O5GEsd3oJR+Pd56VyQcyMU6V
         LdGQ==
X-Gm-Message-State: ANoB5pnPgcRr1rXkc4G+KbSFQbQtXPBG74fVK8NdsYLqk5UWI4R0Vp+q
	CuFSp79Z4/GL3qdc9PH/OjmhVA==
X-Google-Smtp-Source: AA0mqf4GbUMG7eifsf2+6++ibfFG2nLQoNYrqF9HJv87Rh6ZMP3a/A2Al3nYNs4oILz+rW+bJjWRNA==
X-Received: by 2002:a92:d489:0:b0:303:8cff:9841 with SMTP id p9-20020a92d489000000b003038cff9841mr3381027ilg.26.1670603188775;
        Fri, 09 Dec 2022 08:26:28 -0800 (PST)
Received: from markhas1.roam.corp.google.com (63-225-246-100.hlrn.qwest.net. [63.225.246.100])
        by smtp.gmail.com with ESMTPSA id b2-20020a92dcc2000000b002e85e8b8d1dsm556531ilr.5.2022.12.09.08.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 08:26:28 -0800 (PST)
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
Subject: [PATCH v12 2/3] dt-bindings: mfd: cros-ec: Add UART compatible string
Date: Fri,  9 Dec 2022 09:26:23 -0700
Message-Id: <20221209092619.v12.2.I9e018ecb8bdf341648cb64417085978ff0d22a46@changeid>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
In-Reply-To: <20221209092619.v12.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
References: <20221209092619.v12.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
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

Changes in v12:
- No change

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

