Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD1B1860
	for <chrome-platform@lists.linux.dev>; Mon, 11 Apr 2022 15:21:21 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id k22so4990825wrd.2
        for <chrome-platform@lists.linux.dev>; Mon, 11 Apr 2022 08:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nO+ziw2+OwYKXZ9RD5bVom+jjKT6xZaKn0PGeE1P/J8=;
        b=X10M8i6LqgkLpnirkFuFhbGWDEdgC6SKSLtESuIZawzrbGK3IDi546aieNd097BY2z
         ay+i5c19JkFEsDx2AbdtprOjDQ0AEpDVdiNfXTuAyrem2TmGeMfY1L482Da59y67A6Us
         0ti9J5oHo+26Eahn4ebySPoEQsoQR8nfqcDQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nO+ziw2+OwYKXZ9RD5bVom+jjKT6xZaKn0PGeE1P/J8=;
        b=4IKJZVPsllUhYPwXIXFvO3UIWrzxp+1jrfV59UOGmtdafH3Uzc19+O3abaZQVad1Au
         ez6MFKcg5RFze43sXj+k1XNMFA1WGHmV6MXvqCgiK04Q5XqaOXf1enKH3BhHIuo+RCWL
         NrR+AWxORC+5Yle9E2yhr2rlRxPExY6vvDtZwWB1SioN00PDtLJL9vcCifc8eIqePZsr
         7SovWhEDW3rYYQYx5ChFzpH7CXu1okH1SnWxx2XTvVGLV7SL1MC4xAi9W5gf/Sj8/3y4
         tgzvmpi1wwLqDAPIaeDI4LpTJL3WVEAS9UU1RzLvBp+p2M6XVnOFz+C3Kev8GpzPliQ2
         bFgg==
X-Gm-Message-State: AOAM530usY0/AX8wSxGt4YNcOd4S1KNvHTnCCrdmgP4M8VwyslaqgoA7
	Rg8uriLgVXGLG2WtvhNZ0F7y3A==
X-Google-Smtp-Source: ABdhPJyRgPtc/mqqSqMNepmVZKr82ZTqK/aUu8qj5by+Cy6OCHkYZF3ZdUnVzvPcFirBMDbg7iJKuw==
X-Received: by 2002:a05:6000:1848:b0:204:e92:5af6 with SMTP id c8-20020a056000184800b002040e925af6mr24963556wri.180.1649690479797;
        Mon, 11 Apr 2022 08:21:19 -0700 (PDT)
Received: from fabiobaltieri-linux.lan ([37.228.205.1])
        by smtp.gmail.com with ESMTPSA id bk1-20020a0560001d8100b002061d6bdfd0sm19512832wrb.63.2022.04.11.08.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 08:21:19 -0700 (PDT)
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
	Fabio Baltieri <fabiobaltieri@chromium.org>
Subject: [PATCH v3 3/4] dt-bindings: update google,cros-ec-pwm documentation
Date: Mon, 11 Apr 2022 15:21:13 +0000
Message-Id: <20220411152114.2165933-4-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
In-Reply-To: <20220411152114.2165933-1-fabiobaltieri@chromium.org>
References: <20220411152114.2165933-1-fabiobaltieri@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update google,cros-ec-pwm node documentation to mention the
google,cros-ec-pwm-type compatible.

Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
---
 .../devicetree/bindings/pwm/google,cros-ec-pwm.yaml      | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
index 7ab6912a845f..deb9e4488773 100644
--- a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
@@ -21,7 +21,14 @@ allOf:
 
 properties:
   compatible:
-    const: google,cros-ec-pwm
+    oneOf:
+      - description: PWM controlled using EC_PWM_TYPE_GENERIC channels.
+        items:
+        - const: google,cros-ec-pwm
+      - description: PWM controlled using CROS_EC_PWM_DT_<...> types.
+        items:
+        - const: google,cros-ec-pwm-type
+
   "#pwm-cells":
     description: The cell specifies the PWM index.
     const: 1
-- 
2.35.1.1178.g4f1659d476-goog

