Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0BDECB
	for <chrome-platform@lists.linux.dev>; Thu, 28 Apr 2022 10:04:34 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id j15so6067605wrb.2
        for <chrome-platform@lists.linux.dev>; Thu, 28 Apr 2022 03:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e3gOCTIIDp+zo/s2ci9K8aggty1O76+cuFFTSEagk90=;
        b=YaOedmJnA8pY2cyQ24b0YKt7sRDTe+kV9929GThrJYh9OCqHH5tqbhRVkE8iUUaZFT
         02GfBaHh6ze/FLcdR8qSIwcWO0UP6SsHPjAo1ZbRkXvcljpk7CtsN05YDr1MVBtFAruB
         RN0oxGbwbuEH/o4ajSCTBwo6ewZw8D1IyNQnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e3gOCTIIDp+zo/s2ci9K8aggty1O76+cuFFTSEagk90=;
        b=uZoQyWLsOGSg59zFTxM61HVmfPAplH7Iix5ycM8JTRlbIk6oZZpm0SCkuQ+ZTqKKBK
         cYHEs90NwgQ0nT3qHkMoYgt6OklDS4HWoh5jvP3Q1Jp1nf/bRiO23QnJlNyG+pNkTM/d
         OZ4l8WKISQucn7U0p5DJ1Cdpz3ypQc1V3dcL1JAIAJQtCLRpwO29o2+yudZ/F47qecUI
         V4JthyEriQq37GnfdsCcibia8NyhKJmzkXHKChZOLU1F5cZoYy9hMDkPmSUDCtVk5pci
         26X7dO+AMn/Gvu1mKTjMWCCgR1h0BQ67IFZy1vfku4oqBzo/gqSuJUvxG4xxNwIC2XRC
         OGBA==
X-Gm-Message-State: AOAM533CmUPOYrDqh22yzWnCP10WUWC0tROD0Pem4gEU6WIuQT9g6E23
	5qEihvdByfg2hBmQuHaAoQ+TLg==
X-Google-Smtp-Source: ABdhPJwFHT5999/FCNS998YMaSCMGhbKS8KtT1+JqembRRJyw3StMCJIcMEH0bHB3M9aYi1zeefucA==
X-Received: by 2002:adf:fe84:0:b0:20a:dc0b:4f2d with SMTP id l4-20020adffe84000000b0020adc0b4f2dmr15695694wrr.229.1651140273120;
        Thu, 28 Apr 2022 03:04:33 -0700 (PDT)
Received: from fabiobaltieri-linux.lan ([37.228.205.1])
        by smtp.gmail.com with ESMTPSA id v5-20020a5d6785000000b0020a792848eesm15080449wru.82.2022.04.28.03.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 03:04:32 -0700 (PDT)
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Lee Jones <lee.jones@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	chrome-platform@lists.linux.dev,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabio Baltieri <fabiobaltieri@chromium.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v6 3/4] dt-bindings: google,cros-ec-pwm: add the new -type compatible
Date: Thu, 28 Apr 2022 10:04:20 +0000
Message-Id: <20220428100421.247471-4-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
In-Reply-To: <20220428100421.247471-1-fabiobaltieri@chromium.org>
References: <20220428100421.247471-1-fabiobaltieri@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update google,cros-ec-pwm node documentation to mention the
google,cros-ec-pwm-type compatible as a valid alternative.

Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pwm/google,cros-ec-pwm.yaml      | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
index 7ab6912a845f..c8577bdf6c94 100644
--- a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
@@ -21,7 +21,14 @@ allOf:
 
 properties:
   compatible:
-    const: google,cros-ec-pwm
+    oneOf:
+      - description: PWM controlled using EC_PWM_TYPE_GENERIC channels.
+        items:
+          - const: google,cros-ec-pwm
+      - description: PWM controlled using CROS_EC_PWM_DT_<...> types.
+        items:
+          - const: google,cros-ec-pwm-type
+
   "#pwm-cells":
     description: The cell specifies the PWM index.
     const: 1
-- 
2.36.0.rc2.479.g8af0fa9b8e-goog

