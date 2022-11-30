Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590738460
	for <chrome-platform@lists.linux.dev>; Wed, 30 Nov 2022 20:13:39 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id d14so6080309ilq.11
        for <chrome-platform@lists.linux.dev>; Wed, 30 Nov 2022 12:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5D9QgKvXJDSs69W719kOBsxIgJ1yqINQsNXR6y+ypg=;
        b=PPaNJJ4BLUfwX1mQEBI+QDJAYRQmqRb4iG7M33xvC3iB/PTrpApOpWJuDXe/Zx+AFY
         HKm7ba+4GF3xyclbIX7mpmX4wrP+yq6EMSjV35dIhSiQ2sFiWA+STIggI5WTt8Nm41n3
         VYhlWv+veee5m6oQcf4sLDVY7osh0e4eePoV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5D9QgKvXJDSs69W719kOBsxIgJ1yqINQsNXR6y+ypg=;
        b=ueTzJMidRLfICkfAd9Bq5g2844EE6CwCEnYQJnOziNnmtbB6X/0cRdwT/pQVu7csm/
         OxtBnWz1ktXxzD/5yfMmYlW3aBsAUVtW89dsqFvGjNBF5MUIrS9LK7xKlbrlW6Ll2XO0
         5K++bzbLq1hLndM/cvwu940qMIMkYmAzvez48G9kXnLd5boNLVWBJCNt8h7YBIp3kkM8
         k/Oiq1t0rG/1bMtLHOZfFp0LbRWYQkOwCIfqY4m5az3qng4/xAXx1QCRBt+m54hIE/be
         Fk8KySoLaok66oavLXe2WTqvPOat8QPwwrI+GipUY6NARrphQoEO5Py4DimcQtmSU2Ti
         pmbw==
X-Gm-Message-State: ANoB5pn+kBCypbTVvEASyTewlZykT/m84mc/5yjZswJIkrlLcFFoRIci
	rb/OYs/W6UEtZGo1yIyrO+qcsw==
X-Google-Smtp-Source: AA0mqf6b492EKnEpYiEcgyaTQ8cIRPquT7Nfs9N61Dnynobe1sPfOduEfXXY45N6Q4TWv88NBbMNiw==
X-Received: by 2002:a92:d607:0:b0:2fb:6601:80f2 with SMTP id w7-20020a92d607000000b002fb660180f2mr24147849ilm.208.1669839218517;
        Wed, 30 Nov 2022 12:13:38 -0800 (PST)
Received: from markhas1.lan (184-96-172-159.hlrn.qwest.net. [184.96.172.159])
        by smtp.gmail.com with ESMTPSA id r2-20020a02b102000000b00363e61908bfsm902158jah.10.2022.11.30.12.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 12:13:38 -0800 (PST)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Raul Rangel <rrangel@chromium.org>,
	Mark Hasemeyer <markhas@chromium.org>,
	Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: [PATCH v8 2/3] dt-bindings: mfd: Add compatible string for UART support
Date: Wed, 30 Nov 2022 13:12:55 -0700
Message-Id: <20221130131245.v8.2.I9e018ecb8bdf341648cb64417085978ff0d22a46@changeid>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
In-Reply-To: <20221130131245.v8.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
References: <20221130131245.v8.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible string to support the UART implementation of the cros
ec interface.

Signed-off-by: Bhanu Prakash Maiya <bhanumaiya@chromium.org>
Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

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

