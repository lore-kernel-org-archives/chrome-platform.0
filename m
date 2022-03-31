Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078D0813
	for <chrome-platform@lists.linux.dev>; Thu, 31 Mar 2022 12:58:25 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id n63-20020a1c2742000000b0038d0c31db6eso2002836wmn.1
        for <chrome-platform@lists.linux.dev>; Thu, 31 Mar 2022 05:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PHj2yaKnS2M1KOdUTGiqnQ+9k0gkJHuJpJKOczjT4Hs=;
        b=Xbgbh+foEr2rAHw4Sr8Bfq8UUS3ZEb3koEM0QHWGI43FMcZA1mNn5JZofdILiXh921
         K41glotjEMpNwjS5ZjNMMdenGPwCBArY50eHWgD1Xc0jQbSXmf77g6irM1O6EfR6klgW
         nmHCF9hWbrtqOXjDQcH/5UGdrNwCYKrnavE94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PHj2yaKnS2M1KOdUTGiqnQ+9k0gkJHuJpJKOczjT4Hs=;
        b=gc9uM6eo8nckD8Z2mjAln1CMF5nwN1zdy+lRz5iBvO8j7hWDlPWKY16U/B2LD839WR
         WLglbUOvuJ4nNeepPmEcVA+Z4d8/Ib+clIh40MZZ59hYk/A1C76CVc0dwz+6hjyD03eC
         Z4navPY6Hlc2dgkCnBmhWURRBjQXT18rzK975pwEHNAsEhEeaulehvhigSh+b/sjqJzn
         MhUnGQYUWOVraGyu7vd7K1PUVKsUfFxCvJR2MJo3o5KYZkU41rYi0ZPQRB/nEhfwu/Lp
         uqvUWQU1uRLIbhxqzwvyqMymruPoghIq8p0+LTjeLcEruDxfx0qxSlaxSJseL6KV2fWg
         +yFg==
X-Gm-Message-State: AOAM532MLV+p/4wYJXaNDyD++GuuYkwcHZ5AjD2yNaRRmi4WaFh4tQf7
	9LW9YaCUOouy4Nw+74Gie3ALoQ==
X-Google-Smtp-Source: ABdhPJwXdAAL6wD9Ov1Hgzxy94Cl3sK1TvG300imQA6EIlQwLYDqW2ZbdNO+fZgCDkDLbW04xnRPmw==
X-Received: by 2002:a05:600c:3009:b0:381:194a:8cb5 with SMTP id j9-20020a05600c300900b00381194a8cb5mr4746639wmh.43.1648731504409;
        Thu, 31 Mar 2022 05:58:24 -0700 (PDT)
Received: from fabiobaltieri-linux.lan ([37.228.205.1])
        by smtp.gmail.com with ESMTPSA id j16-20020a05600c191000b0038c9249ffdesm8230695wmq.9.2022.03.31.05.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 05:58:24 -0700 (PDT)
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
Subject: [PATCH v2 3/4] dt-bindings: update google,cros-ec-pwm documentation
Date: Thu, 31 Mar 2022 12:58:17 +0000
Message-Id: <20220331125818.3776912-4-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.35.1.1021.g381101b075-goog
In-Reply-To: <20220331125818.3776912-1-fabiobaltieri@chromium.org>
References: <20220331125818.3776912-1-fabiobaltieri@chromium.org>
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
index 4cfbffd8414a..9c895c990ed8 100644
--- a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
@@ -19,6 +19,12 @@ description: |
 properties:
   compatible:
     const: google,cros-ec-pwm
+
+  google,use-pwm-type:
+    description:
+      Use PWM types (CROS_EC_PWM_DT_<...>) instead of generic channels.
+    type: boolean
+
   "#pwm-cells":
     description: The cell specifies the PWM index.
     const: 1
-- 
2.35.1.1021.g381101b075-goog

