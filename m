Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6285028EF
	for <chrome-platform@lists.linux.dev>; Tue, 14 Mar 2023 09:06:12 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id e15-20020a17090ac20f00b0023d1b009f52so4357089pjt.2
        for <chrome-platform@lists.linux.dev>; Tue, 14 Mar 2023 02:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678784772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VvVKKTfClzDHbKr25iX73V342HR8rTZ6C7kPvWX0aBY=;
        b=ta4LarLUW8GVYewL3V7G52f2PnqeptY/XG+Xj++LeAYExfggHPOU6rG3/4/3rQXG+n
         AzvmQ2wQl0ABLmLB+j8uqP96pHc5Kxv0AojIqlYpcGB1hUHvyyK276Yy6PoiJmTkGYcu
         zGJWJSkXkAHoByUCG6b1z7gylywfPo1un+ivuW9QzU19dOPVUL+TdFCv2jh27+uFdlUv
         7c7ZUWQY8PPanuRhSoHepXGS5nc7Tm/aIJfcWW/45typlJNAf25mejQ/TUovv4vr0E7i
         ZjaKWWdJFJ1ZCo3L2LxQbfB4xP8RlcaiME0yAjDtKQXdfMsvfTAldgKplyZxAWY1yeil
         yyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678784772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VvVKKTfClzDHbKr25iX73V342HR8rTZ6C7kPvWX0aBY=;
        b=ECgv7A2nFSsnMtTA2e3LbNOQA0Ou0n7nOEkPIq7iNBp7JKwgK8Hs7Wsa2IhGYpjKjM
         V3itlLFEhlHB0Qz0tcfKb7R/rt+rYFKjtjlar0KiTB44kwdgf8a+AmF+KQlgqYN0D6g8
         X1X7Q5UN6wbO+O/umE0wythXS28zIE9wgrKsrbLR4sPskMZy91xwngr/rGysokCtmuZi
         pI2gOwy11Lz2WukePyeHtwzUAxEQsvUlbTZi4q/mZocq0alnZlqmTLAS7AckH8x+GtGE
         qwNyZZZbsVEX477HOnzsRkND3kQQiExJvTIIVEKiUFH++6M8ujlO5OGXRn4weOfP4Vz8
         V7JA==
X-Gm-Message-State: AO0yUKVI07ytBIZHc0QRlT/6sumSjW71O28hAQHeUitUjNdrkwclxs/p
	PVZXaTYtRdX7Sin11nKA3PaAfg==
X-Google-Smtp-Source: AK7set/XpT6XzJflkOougYbJXIWlZCBg7D1MY8N+0OWLt8IZY2LG8a7E83HVnkqfAtO3xcf+IpKViQ==
X-Received: by 2002:a17:902:d4cc:b0:19a:b033:2bb0 with SMTP id o12-20020a170902d4cc00b0019ab0332bb0mr43699652plg.46.1678784771688;
        Tue, 14 Mar 2023 02:06:11 -0700 (PDT)
Received: from localhost.localdomain ([49.206.34.126])
        by smtp.gmail.com with ESMTPSA id kv3-20020a17090328c300b0019c919bccf8sm1254131plb.86.2023.03.14.02.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 02:06:10 -0700 (PDT)
From: Naresh Kamboju <naresh.kamboju@linaro.org>
To: u.kleine-koenig@pengutronix.de
Cc: a.zummo@towertech.it,
	alexandre.belloni@bootlin.com,
	alexandre.torgue@foss.st.com,
	angelogioacchino.delregno@collabora.com,
	bcm-kernel-feedback-list@broadcom.com,
	bleung@chromium.org,
	chrome-platform@lists.linux.dev,
	claudiu.beznea@microchip.com,
	conor.dooley@microchip.com,
	cw00.choi@samsung.com,
	daire.mcnamara@microchip.com,
	eddie.huang@mediatek.com,
	f.fainelli@gmail.com,
	groeck@chromium.org,
	jonathanh@nvidia.com,
	kernel@pengutronix.de,
	krzysztof.kozlowski@linaro.org,
	kumba@gentoo.org,
	linus.walleij@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org,
	matthias.bgg@gmail.com,
	mcoquelin.stm32@gmail.com,
	michal.simek@xilinx.com,
	miquel.raynal@bootlin.com,
	nicolas.ferre@microchip.com,
	patches@opensource.cirrus.com,
	sean.wang@mediatek.com,
	thierry.reding@gmail.com,
	ulli.kroll@googlemail.com,
	vincent.sunplus@gmail.com,
	vz@mleia.com,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH 00/41] rtc: Convert to platform remove callback returning void
Date: Tue, 14 Mar 2023 14:35:57 +0530
Message-Id: <20230314090557.41960-1-naresh.kamboju@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Hello,
> 
> this patch series adapts the platform drivers below drivers/rtc to use the
> .remove_new() callback. Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver core
> doesn't (and cannot) cope for errors during remove. The only effect of a
> non-zero return value in .remove() is that the driver core emits a warning. The
> device is removed anyhow and an early return from .remove() usually yields a
> resource leak.

This patch set applied on top of Linux next.

Build tested with gcc-12, clang-16 and clang nightly.
Boot and LTP smoketests performed on
 - qemu-x86_64
 - qemu-arm64
 - fvp-aemva
 - qemu-armv7
 - qemu-i386

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

Link,
https://qa-reports.linaro.org/~anders.roxell/linux-mainline-patches/build/lore_kernel_org_linux-arm-kernel_20230304133028_2135435-1-u_kleine-koenig_pengutronix_de/?failures_only=false#!#test-results

--
Linaro LKFT
https://lkft.linaro.org
