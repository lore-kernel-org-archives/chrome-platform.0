Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88ADE185A
	for <chrome-platform@lists.linux.dev>; Wed, 20 Apr 2022 14:16:03 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id b19so2436002wrh.11
        for <chrome-platform@lists.linux.dev>; Wed, 20 Apr 2022 07:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/VyFi3RjbNFKUo3ZLxTfgMzz806nFEyIt4P5XIW1sGc=;
        b=IwG4NwUNCPEDcMyIiQGUNlp6AiG5pqO+Qg27bSMpYfTT5GzQRyvAlaqbje61DHmBlk
         gjp4eCEGuyoZrFZufrMBb5lWs4IaehRzLg4Vz0O0swGOimwQKFQIcvvB53q9estyVu61
         YlwViewlGuBDgDQVlnKZ89Y+i5ziTz+fk6yC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/VyFi3RjbNFKUo3ZLxTfgMzz806nFEyIt4P5XIW1sGc=;
        b=FmksFvYuBc9KzsMFwVVV7LuDfm1gWh5jX3P3ifDu31LDKpFl3WcFFRjHAaP6zafj7I
         02RG3WscCQut6UsGYHmbMfwpoyfNCEbuzNUU2U+PLekQiQWlD1kvAmL1BXjxKRwAi3fq
         bbaysrXZ5cX8rsg3+XdzzNkXtz4B7YiqmtKRuq/68t2EFTNMPE1xhclamxOi+0ppfhIT
         l9xSvTf5t2BMk/EeCL/12/9BY3gzPip+jGAr4z7osMq5n7FtjPGmMlRVuVB77hpTGd6k
         3zPyi9fZ+I0HnpahfiLAowzNTYEE7Vz/QagWQCaW5f/uCZ+9bm/vwdtShewbeFYwQPnd
         AZoA==
X-Gm-Message-State: AOAM533lXV4aBZJW26YG7u5Y2iI9Va62Tc1dXnJ7iRrpooov980FR4Jx
	W1HVMGg3v4xtxAHLeXIxyM61sm9nd8W4PQ==
X-Google-Smtp-Source: ABdhPJwCPpU4h5O7ryUiZqPZo8a1m5XhV46nhkBy6UgMYfIAySWynMQVolOrMBh4C5OnIPP4ylpAtg==
X-Received: by 2002:a05:6000:1863:b0:20a:988f:e0ad with SMTP id d3-20020a056000186300b0020a988fe0admr11529721wri.572.1650464161908;
        Wed, 20 Apr 2022 07:16:01 -0700 (PDT)
Received: from localhost.localdomain ([37.228.205.1])
        by smtp.gmail.com with ESMTPSA id v2-20020adf8b42000000b0020aa790a258sm12447wra.8.2022.04.20.07.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:16:01 -0700 (PDT)
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
Subject: [PATCH v5 3/4] dt-bindings: update google,cros-ec-pwm documentation
Date: Wed, 20 Apr 2022 14:15:55 +0000
Message-Id: <20220420141556.681212-4-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
In-Reply-To: <20220420141556.681212-1-fabiobaltieri@chromium.org>
References: <20220420141556.681212-1-fabiobaltieri@chromium.org>
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
2.36.0.rc0.470.gd361397f0d-goog

