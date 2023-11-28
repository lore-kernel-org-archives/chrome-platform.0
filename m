Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15780199CA
	for <chrome-platform@lists.linux.dev>; Tue, 28 Nov 2023 08:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WlET2mcE"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1cfafe3d46bso28840345ad.0
        for <chrome-platform@lists.linux.dev>; Tue, 28 Nov 2023 00:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701161121; x=1701765921; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Y9ycKtKFTX/BTOyRnkXgZtClc28FDD42zjunKgTjuA=;
        b=WlET2mcEj9jsrC2rx6FmOlznKbM5MzhKrX6tNGYwaFU9oa7PGDDoZRsVgZ31oBGby0
         tRLWG42OinPJ6ihS22chFHfdGyCsIyN/+up9NjM9u/xg4WdSDPBeSwbrSxACrFIBtLzu
         gJ9P3JJn+2g3vjuqP3M7dTYS+YlBicdjinSrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701161121; x=1701765921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Y9ycKtKFTX/BTOyRnkXgZtClc28FDD42zjunKgTjuA=;
        b=kpD2r42VK6B0UCbFnKNiDi1HyIlxAWX4TPiIw6X11dMXRKT35/b7i47Ggn33/26XUK
         /jl7C8pqYzrdKZBQJrB14unqeg8rqMkZW58OlU0R6StuZY00jiNmT4wVm38/PJEVmnsT
         F1v1rbOnqra3cvdop0+KXLPOpOtjBTPhPtq2j2SnAMFxaqEKG6CYRTJJlTqDHL2ehsPs
         dNeEvsx5XxOOgrZTiduvKJu0BozSd6g2hm16sBWMhwR4TekODSZ/2PjuNL/eZDI0Ip3B
         dw/Fl8E4ctYJALyU9Of56JW9TkKm0qJsmzKy4fTPSxbZA68xHT7qDvL9oaAZoWcV6pgw
         OqlA==
X-Gm-Message-State: AOJu0YxHt6eiE+CiroLkCgGFn/eBoHAD8WGF1S1vx35L7NGk3ywU81Kz
	NDROU6rPWU9W7UAO4Qw2+ZLeMw==
X-Google-Smtp-Source: AGHT+IH69IcUw69JVhOmNdkKKnr/r6NBV02lgRCYBJhyyb9MW19+XXMSc7tXlITs3/tx986s7x1SPg==
X-Received: by 2002:a17:902:f54d:b0:1cf:b3d2:5f18 with SMTP id h13-20020a170902f54d00b001cfb3d25f18mr13659883plf.56.1701161121540;
        Tue, 28 Nov 2023 00:45:21 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:a990:1e95:a915:9c70])
        by smtp.gmail.com with ESMTPSA id j1-20020a170902c08100b001ab39cd875csm8358074pld.133.2023.11.28.00.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 00:45:21 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	andriy.shevchenko@linux.intel.com,
	Jiri Kosina <jikos@kernel.org>,
	linus.walleij@linaro.org,
	broonie@kernel.org,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	james.clark@arm.com,
	james@equiv.tech,
	keescook@chromium.org,
	rafael@kernel.org,
	tglx@linutronix.de,
	Jeff LaBundy <jeff@labundy.com>,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [RFC PATCH v3 4/5] arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads as fail
Date: Tue, 28 Nov 2023 16:42:33 +0800
Message-ID: <20231128084236.157152-5-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231128084236.157152-1-wenst@chromium.org>
References: <20231128084236.157152-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of having them all available, mark them all as "fail-needs-probe"
and have the implementation try to probe which one is present.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Drop class from status
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index bdcd35cecad9..1d68bc6834e4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -15,6 +15,7 @@ touchscreen2: touchscreen@34 {
 		reg = <0x34>;
 		interrupt-parent = <&pio>;
 		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
+		status = "fail-needs-probe";
 	};
 
 	/*
@@ -28,6 +29,7 @@ touchscreen3: touchscreen@20 {
 		hid-descr-addr = <0x0020>;
 		interrupt-parent = <&pio>;
 		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
+		status = "fail-needs-probe";
 	};
 };
 
@@ -44,6 +46,7 @@ trackpad2: trackpad@2c {
 		reg = <0x2c>;
 		hid-descr-addr = <0x0020>;
 		wakeup-source;
+		status = "fail-needs-probe";
 	};
 };
 
@@ -68,3 +71,11 @@ pins_wp {
 		};
 	};
 };
+
+&touchscreen {
+	status = "fail-needs-probe";
+};
+
+&trackpad {
+	status = "fail-needs-probe";
+};
-- 
2.43.0.rc1.413.gea7ed67945-goog

