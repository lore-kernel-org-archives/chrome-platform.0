Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF04029AC
	for <chrome-platform@lists.linux.dev>; Wed,  7 Dec 2022 17:40:25 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id p6so3159698iod.13
        for <chrome-platform@lists.linux.dev>; Wed, 07 Dec 2022 09:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQHZD5UNbZreX1XKl32tTP9ac2aVItlytgfwhZVebO8=;
        b=nfMziSmw5P+4LBSK8oTS4a1Ei4qOzUCAycEf4tw+5EKwugQb5WMaVK7RgNTBMBFeop
         BS6NtYrAbd9kBacwGq7qBk0QZ1sNHfGBByf8Nvim+JThNEVQs1aodka41eaK0K2cQl6R
         UGUYF6kSEkla0mvtqN2svnmz8Bk/SpTqp6BV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wQHZD5UNbZreX1XKl32tTP9ac2aVItlytgfwhZVebO8=;
        b=DYotfsP7BY+6+mGW0q4x53bg5JXQP71JAlMxTZK99XyGgBrOpBZnNtBiKCEeUV9fP6
         oX4KbdYsig2EEKWhocDN/vBoDgWpcMk/D9R2ONBEXe9XJIe7muaVYYyM5DuCkuRw4Rfi
         QYeYP44DCFCQYV3wYoPsi3gVbqCQnXxaH3qvEhiUbYEIY7rXNTFIgWNzV573eDimbohG
         zxlvZ+Tg3tLgG9+nw9Nzumx5tr/oG8b3TcGli3MrLcXVzPo8V2ZDX4Gutysm1wH/LUUq
         WowPecrTpsWK2Q6cH79cfY9LDk7FaGpSa0uM5ZyWnTCJI5vZUJcGdjogc6eNRSE8DZXK
         4g0Q==
X-Gm-Message-State: ANoB5pnJH5sHjG8rS8lDjLJwHgZiU1/lopoGcqyPDby0wVrQzktAgO+k
	rnRAj+xNFj/pIhy4Eiqsua3B5Q==
X-Google-Smtp-Source: AA0mqf4BFKioHmQbnG4b6d2mroUY4mwbnMNsX5Gol4XINR/ZBKfI8kxEU8tlpQycPyQnGALey79vXQ==
X-Received: by 2002:a5d:8492:0:b0:6df:bdc1:2421 with SMTP id t18-20020a5d8492000000b006dfbdc12421mr16403038iom.116.1670434824777;
        Wed, 07 Dec 2022 09:40:24 -0800 (PST)
Received: from markhas1.roam.corp.google.com (63-225-246-100.hlrn.qwest.net. [63.225.246.100])
        by smtp.gmail.com with ESMTPSA id q18-20020a920512000000b0030341bffab8sm32782ile.31.2022.12.07.09.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 09:40:24 -0800 (PST)
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
Subject: [PATCH v10 2/3] dt-bindings: mfd: Add compatible string for UART support
Date: Wed,  7 Dec 2022 10:40:12 -0700
Message-Id: <20221207104005.v10.2.I9e018ecb8bdf341648cb64417085978ff0d22a46@changeid>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
In-Reply-To: <20221207104005.v10.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
References: <20221207104005.v10.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
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

