Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6341A3D6D
	for <chrome-platform@lists.linux.dev>; Thu, 17 Nov 2022 18:49:20 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id b2so2044055iof.12
        for <chrome-platform@lists.linux.dev>; Thu, 17 Nov 2022 10:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1Iy41MhZ3FqRDS+o4OCXIP3MAQhIgzbJl+JqnbSgTg=;
        b=NVAIjCoIr/gY3oZpSuV7SLL0QFcamToBZNGZFjyj8wdTwSUsNp+svdXfX1TbEXO3Ts
         ASj0kombCmsJtGIVLisb2N0pdbwKTtR7hHEwxwvccLERx+spTa+N+Q4ueHn2fuHahW1r
         NPkl04UJXnGnewPI5Py9iJ950jaEhDxY9Nafo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1Iy41MhZ3FqRDS+o4OCXIP3MAQhIgzbJl+JqnbSgTg=;
        b=63a0rRsHu1fXwMOcLGeSAp/CF3VnnmBXYT08/7G3Y///D2L1OCg0OsHjljK7UETV1K
         VIwcnV63NTFq2IqhkcUru34Iq/mzVsDdoxc1uuL3qlRRtA2gZQ/KvCtzAqm30N0pBIPH
         iBBVAJsHxZi+0Ki5xU3GSdJz5iRobxdm0hfMkfszVh9Ffxfgr0OB+Y94Qw40cuYG7bnd
         dqAbvIMpJQ2KzrsrG/KiK2LF3TTZOLbY91kyuPoysko9m7vdYAgttTyaYkpjZ2wzH7w4
         mqRqFifffycS5spv7My3QvnUP8+ATlbKzIawKdABNSxkN1n534ylUsIgWREuMIFZIQaB
         HOEQ==
X-Gm-Message-State: ANoB5pkkbFxqP0YkqxY2s+gEBnX65hrYwGKfn/EAzX1Xli/13mNWpNVA
	b6e0f3BIxVc5bBPj0zShW7k+hw==
X-Google-Smtp-Source: AA0mqf6vmCAIs3qAaXGbusGYJSfA0ySnQwbOahFjbsIcsmewZddLmRdMGLBKlzld0AnajTBv/k6z0w==
X-Received: by 2002:a02:7409:0:b0:375:4727:8625 with SMTP id o9-20020a027409000000b0037547278625mr1629567jac.300.1668710959492;
        Thu, 17 Nov 2022 10:49:19 -0800 (PST)
Received: from markhas1.corp.google.com ([100.107.108.223])
        by smtp.gmail.com with ESMTPSA id q6-20020a02a986000000b00363faa1ea9asm503282jam.15.2022.11.17.10.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 10:49:19 -0800 (PST)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Raul Rangel <rrangel@chromium.org>,
	Mark Hasemeyer <markhas@chromium.org>,
	Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: [PATCH v7 2/3] dt-bindings: mfd: Add DT compatible string "google,cros_ec_uart"
Date: Thu, 17 Nov 2022 11:48:47 -0700
Message-Id: <20221117114818.v7.2.I9e018ecb8bdf341648cb64417085978ff0d22a46@changeid>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
In-Reply-To: <20221117114818.v7.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
References: <20221117114818.v7.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT compatible string in
Documentation/devicetree/bindings/mfd/cros_ec.txt

Signed-off-by: Bhanu Prakash Maiya <bhanumaiya@chromium.org>
Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
---

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
 .../devicetree/bindings/mfd/google,cros-ec.yaml       | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index 04962bb29576e..26787e4574b8d 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -28,6 +28,9 @@ properties:
       - description:
           For implementations of the EC is connected through RPMSG.
         const: google,cros-ec-rpmsg
+      - description:
+          For implementations of the EC is connected through UART.
+        const: google,cros-ec-uart
 
   controller-data:
     description:
@@ -222,4 +225,12 @@ examples:
             compatible = "google,cros-ec-rpmsg";
         };
     };
+
+  # Example for UART
+  - |
+    uart0 {
+        cros-ec {
+            compatible = "google,cros-ec-uart";
+        };
+    };
 ...
-- 
2.38.1.584.g0f3c55d4c2-goog

