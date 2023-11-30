Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90DD2D60A
	for <chrome-platform@lists.linux.dev>; Thu, 30 Nov 2023 08:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GMTk0pWe"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6d857f6f1c0so412448a34.0
        for <chrome-platform@lists.linux.dev>; Thu, 30 Nov 2023 00:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701333222; x=1701938022; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EyouFVwGEYxssEwFR57NReaaTx4QlR2tWMXVmiHfDAk=;
        b=GMTk0pWeKj/noa29UJqjs7Id4aftRHQK6f+Gb6Ds1SL9axpQyiPyAQ+ECa2e/WtT/j
         istpSq8D4mqDXlnyu0gwPglqRYB4vKJbKSiNZgayRQb1NUraIuKEazTlOowTMvQaNrFX
         H32v5peZx16Uqb7S9Miis4uz2qrdD98C5y93o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701333222; x=1701938022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EyouFVwGEYxssEwFR57NReaaTx4QlR2tWMXVmiHfDAk=;
        b=GJIHSucVLvFHci8eEe/inlIBvdCwi0jN0g9h+0v7d9lCkRq0l0pPWKNjUSl1hArBe/
         YG7eVahtWxuDfde2ocPJC4flTpZJOcrPTHN3IfzipSxNpX2ouB9begjn4tmk4xpGBlNa
         nC0BLozPsG7u6DWjDXIAArB3Z9dW6C6hlWkPQJeLzZ7toNG2WSSfkCBtVOau71Q+F+sw
         nn2m+OB2DN3dQvAf5lvZcF7F0Uz44k+S2s0PwxIlGx6xFV+iGeze5MaB8zC6YJ+bD8Mx
         J8hEifJA/AIjp/70H6woUYCCk/iGy4lNX86kQsHNQfzKYTAZatZ07X7NO6/ROuTmm9/Q
         g0MQ==
X-Gm-Message-State: AOJu0Yy6cYvrCc6rgMAATjYhkMfW6Vv5PKmJN+UOnGVBZEj6rH90JGXz
	Ce+QkaMnjKuPhaQXaZ5JzjrNgA==
X-Google-Smtp-Source: AGHT+IGWCAAHmgXLrSSPxognNtvv4rTt1aiPoIZHEqHwPAu/XCpwkjPbK21OntZ4MLW1NQrPkMEvbA==
X-Received: by 2002:a9d:7f0c:0:b0:6ce:37a2:a93e with SMTP id j12-20020a9d7f0c000000b006ce37a2a93emr25823140otq.3.1701333222791;
        Thu, 30 Nov 2023 00:33:42 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7c8f:dafd:65c3:2bcf])
        by smtp.gmail.com with ESMTPSA id b8-20020a63cf48000000b005c2967852c5sm712015pgj.30.2023.11.30.00.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 00:33:42 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mfd: cros-ec: Allow interrupts-extended property
Date: Thu, 30 Nov 2023 16:33:31 +0800
Message-ID: <20231130083333.932862-1-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"interrupts-extended" provides a more concise way of describing external
GPIO interrupts.

Allow using this instead of "interrupts" plus "interrupt-parent" for
cros-ec.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../devicetree/bindings/mfd/google,cros-ec.yaml          | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index e1ca4f297c6d..e514eac9f4fc 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -75,6 +75,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  interrupts-extended:
+    maxItems: 1
+
   reset-gpios:
     maxItems: 1
 
@@ -199,9 +202,13 @@ allOf:
                 - google,cros-ec-rpmsg
                 - google,cros-ec-uart
     then:
+      oneOf:
+        - required:
+            - interrupts
+        - required:
+            - interrupts-extended
       required:
         - reg
-        - interrupts
 
   - if:
       properties:
-- 
2.43.0.rc2.451.g8631bc7472-goog

