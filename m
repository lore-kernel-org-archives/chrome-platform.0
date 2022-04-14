Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B9517C2
	for <chrome-platform@lists.linux.dev>; Thu, 14 Apr 2022 09:28:37 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id k22so6089966wrd.2
        for <chrome-platform@lists.linux.dev>; Thu, 14 Apr 2022 02:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nO+ziw2+OwYKXZ9RD5bVom+jjKT6xZaKn0PGeE1P/J8=;
        b=QteKmChnkWb6oz4KhPGH8vunhcx6Vua8eilRI3R5J+5q+5LzJcdL1d3CiIenp+CYcc
         LFzSNQD6OaXrAJZ6kiN+C3eJwN1SfTOiFuEfkwMxrFvH5lbnSZmYkQ17wf7UCv5uFIUV
         pRaQMDW/nq0Z+IbluT23aHqsZCjGjoVOgmcDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nO+ziw2+OwYKXZ9RD5bVom+jjKT6xZaKn0PGeE1P/J8=;
        b=n+TYISbAqQqjCFBksq8hpyitWsf3RpuvqTJat8tcZ8tx/em4RFe1gspIqZP2U2E/UQ
         GTYzc7ijdJRxBCSgsCiEy2T2CLN23cl1OscfoeJ+C+fBy+0DxvU79M09MbWRpcxuMsuY
         ZzD//qOPfaSusn5D9Kv22kCJKZSvH7HRPck0QHZZz/KT1PtWdOvfiszUnyf/vSHCFvb0
         vuS3bbk0vtxVeb8pL2s2EkoeQH++504EA6/7VoVzkQiyCFv53shzbpJSvhy/a4S4I4r0
         Ddf9wrb6lCDL0KRyxyC1s7m0NQIp/nmp5rvnw3aKaOkx2kUv6eAMPrXsQaHNWyQQyidq
         D7cg==
X-Gm-Message-State: AOAM532vkmPZTgLlqU6nTYS0rv1TANzpmtRpdfulfJuNwW7HPHZPBOxZ
	xN/aPQaoWecrDjTPBO2/EXdJQA==
X-Google-Smtp-Source: ABdhPJzaZFOkCNktJtaToekzPivMcuvQGu/MUEAC5mRmWLOWlbpLQSlFQg9jMeOJjlO0Xq/PSZoQQg==
X-Received: by 2002:a05:6000:1883:b0:205:c0cb:33c6 with SMTP id a3-20020a056000188300b00205c0cb33c6mr1431223wri.39.1649928516125;
        Thu, 14 Apr 2022 02:28:36 -0700 (PDT)
Received: from fabiobaltieri-linux.lan ([37.228.205.1])
        by smtp.gmail.com with ESMTPSA id bg8-20020a05600c3c8800b0038e4c5967besm1698099wmb.3.2022.04.14.02.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 02:28:35 -0700 (PDT)
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
Subject: [PATCH v4 3/4] dt-bindings: update google,cros-ec-pwm documentation
Date: Thu, 14 Apr 2022 09:28:30 +0000
Message-Id: <20220414092831.3717684-4-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
In-Reply-To: <20220414092831.3717684-1-fabiobaltieri@chromium.org>
References: <20220414092831.3717684-1-fabiobaltieri@chromium.org>
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

