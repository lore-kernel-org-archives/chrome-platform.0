Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4C37FA
	for <chrome-platform@lists.linux.dev>; Mon, 14 Feb 2022 08:19:56 +0000 (UTC)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7AFD0402DF
	for <chrome-platform@lists.linux.dev>; Mon, 14 Feb 2022 08:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644826795;
	bh=23CQAl/07AaN2dxN1TfTdDj5so/NCdWTbjb57ZtNLwo=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=Ah1UupAoINeRCa+UtdPXztTePkYfs2ooX5tQRF6YqDHLCj4fOsLrLszYyo1SzXCyq
	 axMRDOzHIudG+Pqc0ec6ebKh4zmyKcerOvHSWvpFsbPW1YBYwnjGWpY7zVcRZHWhNe
	 OaNIWiFdGgZPeE5n3cjNx1f3goxIl7Fp2KpN8B9BniBYhXMv4Ferp1VQhCznIrLVdy
	 LE2uktIzvLNe2G04mkiN0IDujzL7SkBspAqMUePvKEv2g0zqb9XiwMEpvmQDavRPyO
	 +4WpWvTRdL15qFsiBc1D+9I87h2YPFqisEBAeWqc7GlVwK6qDLc1rhee4/NHUBylnn
	 nRJ1FYkb1mKAg==
Received: by mail-ej1-f72.google.com with SMTP id h22-20020a1709060f5600b006b11a2d3dcfso5496101ejj.4
        for <chrome-platform@lists.linux.dev>; Mon, 14 Feb 2022 00:19:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=23CQAl/07AaN2dxN1TfTdDj5so/NCdWTbjb57ZtNLwo=;
        b=JbVY7xGtWxqmem2CfrfwWe7bDALx7qqSdHRNPN7ZS8fT06pTnrXEg0kTcskFi3S9zY
         RxAfts9ZLD6nqxY0ZboyzbwWCdLcSJzlDN6esLzoisttuFenmgihdyFOa72xhvTsvXaw
         Ywv1voxu50y7KC8zYeV3op6HmYDxKIPskJrSX26wpedMZy5fFd/55wOE5jB3nijIgZxk
         3uJPqdigptPSqC/8d/aj9u5GvSYlKHQ8tg867Qq2/M4HmiZZoKD8BmtAJpvXiQxXz1Sf
         /tqA4YQ7ui/6Y4aNEi2QzTPc6jWpze00vA+VT4+Oo0Q9bfybdGuMI15V8jtXFFyZhDqW
         RNGQ==
X-Gm-Message-State: AOAM532ay41tBuaUE5homkBjeunOu0oWFVgykVVBCH+vJawWWmV8IPBO
	3BkGwzTS+99LwrBVV1VzJ+Rp14Pz1ikOBjqBj1MBTv9Bdj/CqVztp+jniLNQ5Hv2DT2RZMWMxKR
	k8s/VUnD/OF/00DzujalUfbYj82jSMiXyZhIZhCSJSU/Isw==
X-Received: by 2002:a17:907:3d01:: with SMTP id gm1mr10671206ejc.695.1644826795046;
        Mon, 14 Feb 2022 00:19:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyduVMGZqiqcBn+5NbYVmKbo23S2Kx2GnaG0uOcebe1lzeD4dxVvKdv5SiQHDzJAeAj67dMnw==
X-Received: by 2002:a17:907:3d01:: with SMTP id gm1mr10671188ejc.695.1644826794896;
        Mon, 14 Feb 2022 00:19:54 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id b20sm2022941ede.23.2022.02.14.00.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 00:19:54 -0800 (PST)
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
Subject: [PATCH 2/4] arm64: dts: mt8183: align Google CROS EC PWM node name with dtschema
Date: Mon, 14 Feb 2022 09:19:14 +0100
Message-Id: <20220214081916.162014-3-krzysztof.kozlowski@canonical.com>
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

dtschema expects PWM node name to be a generic "pwm".  This also matches
Devicetree specification requirements about generic node names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
index 8f7bf33f607d..2d7a193272ae 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
@@ -92,7 +92,7 @@ volume_up {
 };
 
 &cros_ec {
-	cros_ec_pwm: ec-pwm {
+	cros_ec_pwm: pwm {
 		compatible = "google,cros-ec-pwm";
 		#pwm-cells = <1>;
 		status = "disabled";
-- 
2.32.0

