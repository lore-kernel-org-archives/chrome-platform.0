Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42497C
	for <chrome-platform@lists.linux.dev>; Mon,  5 Dec 2022 07:20:19 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id v1so2384988ioe.4
        for <chrome-platform@lists.linux.dev>; Sun, 04 Dec 2022 23:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tmfIAFg5Gn6maLaUosoE4qK2kRKNnA216yinP3k8AE=;
        b=H+itvEoTRVUiX1FWmONFBFoKDIAL6a6uCF7h9yTs9BmKIxRT35H6ZMyXnDRtPID4bV
         XF2vZVkCtBEu4/FcueE6lH7ptBNrY9Q/82TsrtBoT7kmhF9SDOswU2MN6qe3BOgnzioG
         hO9QFIb5XTcSAx/ZASCU9TclLSwd4wsjnKGDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1tmfIAFg5Gn6maLaUosoE4qK2kRKNnA216yinP3k8AE=;
        b=tPOf5ZRueKD7MuKD/yA6PwVpx8lC6zvMtPhTPIAeHmwMC+8YAFdl2X1IQfXgxJ0m+y
         XoQymg2Vu/Y1+LVLaLPGXMahJmQy0ATEOdgxsQcusRc9RQcaGd2rgIzUSQoXyqBj0Ob3
         mdFgVo2jcqsq0wz5IN9VOhwfxnXKn8aml1WzhoskZXreXXvJyy+gg+GPUB17JbnCy2V8
         n9s0jXwcz/l0Qd7ZRMTxrurE85SgNDLgJ8HfraYYi8Uq4dFoavjKAXxRxhuMQ+8elae8
         i3aIPBtjpwOcEqH/WJ0ZGhRPDPKVjiQGA/Oxth9h+/pNsOMZqw52d+ubVRcCesrwVa4F
         E0Hg==
X-Gm-Message-State: ANoB5pmWlCbV7wHS4nkSF1SEQnY7jzAM3xzr4q1Et5ETi7yWE+59+ROU
	v9nHiE2t0lLXCleUGZKBFARh2g==
X-Google-Smtp-Source: AA0mqf5yl/hJSGq91vZq/GoSz5IGy4KgxRszruI1sS2TUorJyRD/x06on1xd6ywwsDaLDEE+VwDfAQ==
X-Received: by 2002:a6b:c343:0:b0:6df:aa48:aa04 with SMTP id t64-20020a6bc343000000b006dfaa48aa04mr11773662iof.161.1670224818991;
        Sun, 04 Dec 2022 23:20:18 -0800 (PST)
Received: from markhas1.roam.corp.google.com (63-225-246-100.hlrn.qwest.net. [63.225.246.100])
        by smtp.gmail.com with ESMTPSA id a8-20020a021608000000b003755aa71fffsm5581184jaa.105.2022.12.04.23.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 23:20:18 -0800 (PST)
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
Subject: [PATCH v9 2/3] dt-bindings: mfd: Add compatible string for UART support
Date: Mon,  5 Dec 2022 00:20:00 -0700
Message-Id: <20221205001932.v9.2.I9e018ecb8bdf341648cb64417085978ff0d22a46@changeid>
X-Mailer: git-send-email 2.39.0.rc0.267.gcb52ba06e7-goog
In-Reply-To: <20221205001932.v9.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
References: <20221205001932.v9.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
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
2.39.0.rc0.267.gcb52ba06e7-goog

