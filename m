Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C44157D0
	for <chrome-platform@lists.linux.dev>; Mon, 21 Mar 2022 14:32:38 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 123-20020a1c1981000000b0038b3616a71aso8495953wmz.4
        for <chrome-platform@lists.linux.dev>; Mon, 21 Mar 2022 07:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XM3tuLIOLKuoFOGCnY9ldxq/B57btEuYeuN4M8XmqsQ=;
        b=k3TzaFkW2ITtzM+ipWQmPH7EIvZpjfq8tQXSnSYfYtORSg9E1JlqkSn52OEEY+PrGJ
         eJ51kHd9HhC8ydWL2YRSl6myblzxJc11I8wWFookSRr6345W6G4DRfORu+06YiMWO7x4
         q0tK2xPNaw9DlfxE1j10+xFxC8SHLabyQDjXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XM3tuLIOLKuoFOGCnY9ldxq/B57btEuYeuN4M8XmqsQ=;
        b=5Jxsm9uTfiv2Kc5sJucF/0760Qv8lMS5hSDayLZYrkskB1L/z1fA1CKUdECTUFk3HH
         O5nCyG9C7ZzBZkceCvm/UWjaPsvkPiGOD2bJJd4zgo6kZoHc6Ji/q3RNgWO+ZbN6vKFU
         oSWmAfl8/+CZh6HdVddKR+znSLsv+dHHezgUEBfEFq67BkvgGidUQ1OpOH/Er/sN635c
         Llr65HfVy1BwLUp9NrwkdiLTJZJwaLuGDhG6Sz+6LiCCGCKOxayoW0WXAOwGvkQGGLMP
         wOjM6dAMTRtp9X/jvY/CgxGYYVSTVycZu1NbIwEe0U11DJyz9cBbaP5kiqUGWaM58Grh
         xh/w==
X-Gm-Message-State: AOAM530p9ZU15gG823oL2ETaSER+hWiDFJp5L4R5C0p/W06rzPWzzQwq
	QxlKJsIrznWGOF53ovwITLx/9w==
X-Google-Smtp-Source: ABdhPJzW2HXM8hROOAKovH/CzhxqdjaB32lrjzpcegwTpr9JvugZ7L0ibXz6TMnHAH/T+i8p9t2LsA==
X-Received: by 2002:a05:600c:5029:b0:38c:9768:b4c with SMTP id n41-20020a05600c502900b0038c97680b4cmr9940150wmr.123.1647873156559;
        Mon, 21 Mar 2022 07:32:36 -0700 (PDT)
Received: from fabiobaltieri-linux.lan ([37.228.205.1])
        by smtp.gmail.com with ESMTPSA id u11-20020a05600c19cb00b00389efe9c512sm19092793wmq.23.2022.03.21.07.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 07:32:36 -0700 (PDT)
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
Subject: [PATCH 3/4] dt-bindings: update google,cros-ec-pwm documentation
Date: Mon, 21 Mar 2022 14:32:21 +0000
Message-Id: <20220321143222.2523373-4-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
In-Reply-To: <20220321143222.2523373-1-fabiobaltieri@chromium.org>
References: <20220321143222.2523373-1-fabiobaltieri@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update google,cros-ec-pwm node documentation to mention the
google,use_pwm_type property.

Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
---
 .../devicetree/bindings/pwm/google,cros-ec-pwm.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
index 4cfbffd8414a..2224e8e07029 100644
--- a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
@@ -19,6 +19,12 @@ description: |
 properties:
   compatible:
     const: google,cros-ec-pwm
+
+  google,use_pwm_type:
+    description:
+      Use PWM types (CROS_EC_PWM_DT_<...>) instead of generic channels.
+    type: boolean
+
   "#pwm-cells":
     description: The cell specifies the PWM index.
     const: 1
-- 
2.35.1.894.gb6a874cedc-goog

