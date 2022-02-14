Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482A37FA
	for <chrome-platform@lists.linux.dev>; Mon, 14 Feb 2022 08:19:55 +0000 (UTC)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D46C740520
	for <chrome-platform@lists.linux.dev>; Mon, 14 Feb 2022 08:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644826793;
	bh=r/A1exu5teyjmoBiQRL2ADp+LBFLDHTow6yiZCZgmss=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=KjUiTDX19e3BrgHmreSs4Cs1goo9SD4zIEBHKunqpZKGShuvgi/Mjii8NKB00kKIq
	 3GVqkmKXsesYZc6vx0pghCpzX/jeCRM+EjWug4HBb5vI7JoggOoInUwOi97LggtY6i
	 4NYMP59Z73a0wzr3MsE7l9geBZi2yrRA0Wozg4lzJiTkX011+EhC9GQ+aEt9JlVMpE
	 nHy7eHo43b7pJPorNoHSRCTAf/0yhX641n47JVbbMHKAqwL9CGQyQnN/wfrWi2e424
	 k7AFgT7nzpZYB0ekjNlgwQkxvr5ZDn3hf3lDG3trdk3LL5LAS7Lrq9iJpqMuGHCGqU
	 IR/P1vhgYQl7w==
Received: by mail-ed1-f70.google.com with SMTP id f6-20020a0564021e8600b0040f662b99ffso9765919edf.7
        for <chrome-platform@lists.linux.dev>; Mon, 14 Feb 2022 00:19:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r/A1exu5teyjmoBiQRL2ADp+LBFLDHTow6yiZCZgmss=;
        b=zn7mT48sPCrRPHv6MLLazg1r8cwDBTTNw3tkglLY8sxPOOxfgCrIj/nBQt+hRkKw7r
         Brq12tXZuhh+8mmirskv2tnlQj4UEGWZw8vx3Mk0c6bqLZVg6TIORn9Y9yvaF2+cRn9H
         ruzLM9JNg7tGKqIpo8uhepHTemppPSVM3LKR81ZuIdVwcuOYW+rDlHuqVYtdjKDQ4MzA
         SUrHZSZ6MI1r3F41qUOWVn4xYy1FUk6IPS07DvRc+Nf2z0ctGK/Up3gdbX7AgI4iZ4qc
         Og1jxGoy3/llVx+fqA9zhAOdChkG4ILSdokB0JmG3BNAqVuk7dXzDRHtTzZpQMRx4TbD
         VIuA==
X-Gm-Message-State: AOAM532cVa6duMNuA+72oZMzrYbv3o3GwO0J6ZaIRekJvuRVm/rYjLPA
	rqaXx+zOPISR6nKmbDHH7Zzu4sxnrNVaDvNHHwL62XT46JPHcJOXu4P7tK9CHWlPkXpSnTGMveg
	OdMplE0sYBT4xlWkrN45+HklWR3QxT4uo01RNNomq2g/gag==
X-Received: by 2002:a05:6402:278c:: with SMTP id b12mr14039644ede.103.1644826793449;
        Mon, 14 Feb 2022 00:19:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdbYmf42KnCNX/mcVtFFEqTiPZLsd8EmrJGHsXn4X5T6VWqFxb6wiz0GiywYV8Bjax6MTWGA==
X-Received: by 2002:a05:6402:278c:: with SMTP id b12mr14039619ede.103.1644826793319;
        Mon, 14 Feb 2022 00:19:53 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id b20sm2022941ede.23.2022.02.14.00.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 00:19:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Lee Jones <lee.jones@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 1/4] dt-bindings: pwm: google,cros-ec: include generic pwm schema
Date: Mon, 14 Feb 2022 09:19:13 +0100
Message-Id: <20220214081916.162014-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Include generic pwm.yaml schema, which enforces PWM node naming.  Keep
the old name in bindings as deprecated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/mfd/google,cros-ec.yaml    | 4 ++++
 .../devicetree/bindings/pwm/google,cros-ec-pwm.yaml          | 5 ++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index d1f53bd449f7..0255b7028496 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -89,6 +89,10 @@ properties:
 
   ec-pwm:
     $ref: "/schemas/pwm/google,cros-ec-pwm.yaml#"
+    deprecated: true
+
+  pwm:
+    $ref: "/schemas/pwm/google,cros-ec-pwm.yaml#"
 
   keyboard-controller:
     $ref: "/schemas/input/google,cros-ec-keyb.yaml#"
diff --git a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
index 4cfbffd8414a..7ab6912a845f 100644
--- a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
@@ -16,6 +16,9 @@ description: |
   An EC PWM node should be only found as a sub-node of the EC node (see
   Documentation/devicetree/bindings/mfd/google,cros-ec.yaml).
 
+allOf:
+  - $ref: pwm.yaml#
+
 properties:
   compatible:
     const: google,cros-ec-pwm
@@ -39,7 +42,7 @@ examples:
             compatible = "google,cros-ec-spi";
             reg = <0>;
 
-            cros_ec_pwm: ec-pwm {
+            cros_ec_pwm: pwm {
                 compatible = "google,cros-ec-pwm";
                 #pwm-cells = <1>;
             };
-- 
2.32.0

