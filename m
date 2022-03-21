Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9371D369
	for <chrome-platform@lists.linux.dev>; Mon, 21 Mar 2022 14:32:32 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id q8so9604053wrc.0
        for <chrome-platform@lists.linux.dev>; Mon, 21 Mar 2022 07:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rz2kPyhob/Zn4b4eynOw/6UOyfstxjJm01L/htyIYCc=;
        b=J9iqLc21143U4IqrHGZbl43PU2GcDIexyXwwfNg978gKFJ++vuXmJOnT4lv/HRd0dA
         KhTJ0wFqyMYnKGSo+Arx6XL89qwnqi9YDs2QkCF+5rUz9Zcj2NNdqny+c19uCLiJ12S/
         BBYe8FQDOdmnbZHKvEmOoX2I+hnhW61pr2jZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rz2kPyhob/Zn4b4eynOw/6UOyfstxjJm01L/htyIYCc=;
        b=FYMKWpLX3xTcUPddlgsEDUX0xxQ5EhbFlkHCi/jynOHpFmkD2aqWMyNL5/DLf2wnyS
         S/WOC1A0P9O1lMY3feFKAoxPFf3ThSqvi3LfvejBG+ly7UXzMS74XOa2BCjLYYRKhANv
         ac/nGBQSPBoIsw5WQvp+gGkp9+oC0KlXVts0SowUqsFXLA0/Hte/KFXnHCeJNyEnIik/
         pxGUNz1QcsBz9RrlQKXezQP6CzxMpYbjbxOwpCxy48VYYZ4Qwx5Z7KslI79/UFK4slhT
         kl/lsxg7OS9wV0FPjNuwVLYPim0LjDpKHTOKBIB4Gym0Zxu7nsCbRnq5q6R+tM1eDztu
         HY3A==
X-Gm-Message-State: AOAM531FwG3KBUS42vQI01VZFS7AwHMfKvZo+EYEysXN2z/JM0uCmNy/
	bwanvkbIu9UAyjZ588T6Qe/Evw==
X-Google-Smtp-Source: ABdhPJwlF27a1NJ6xMacbGdjU1rd5N8lVS4V0IPQ+1pI4C3wPK4QyQWn/uHzsmotIgUqlAj4AnT7RQ==
X-Received: by 2002:adf:f281:0:b0:203:e3a2:de5d with SMTP id k1-20020adff281000000b00203e3a2de5dmr18548830wro.598.1647873150811;
        Mon, 21 Mar 2022 07:32:30 -0700 (PDT)
Received: from fabiobaltieri-linux.lan ([37.228.205.1])
        by smtp.gmail.com with ESMTPSA id u11-20020a05600c19cb00b00389efe9c512sm19092793wmq.23.2022.03.21.07.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 07:32:30 -0700 (PDT)
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
Subject: [PATCH 0/4] Add channel type support to pwm-cros-ec
Date: Mon, 21 Mar 2022 14:32:18 +0000
Message-Id: <20220321143222.2523373-1-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The ChromiumOS EC PWM host command protocol supports specifying the
requested PWM by type rather than channel. [1]

This series adds support for specifying PWM by type rather than channel
number in the pwm-cros-ec driver, which abstracts the node definitions
from the actual hardware configuration from the kernel perspective,
aligns the API with the one used by the bootloader, and allows removing
some dtsi overrides.

Tested on a sc7180-trogdor board, but on a version based on an older
kernel, so this exact series is build only tested.

[1] https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/ec/common/pwm.c;l=24
[2] https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/depthcharge/src/drivers/ec/cros/ec.c;l=1271-1273

Fabio Baltieri (4):
  dt-bindings: add mfd/cros_ec definitions
  drivers: pwm: pwm-cros-ec: add channel type support
  dt-bindings: update google,cros-ec-pwm documentation
  arm64: dts: address cros-ec-pwm channels by type

 .../bindings/pwm/google,cros-ec-pwm.yaml      |  6 ++
 .../mt8183-kukui-jacuzzi-fennel-sku1.dts      |  4 +-
 .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |  3 +-
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  1 +
 .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  |  4 -
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  8 +-
 .../arm64/boot/dts/qcom/sc7280-herobrine.dtsi |  6 +-
 .../arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi |  3 +-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    |  6 +-
 .../boot/dts/rockchip/rk3399-gru-bob.dts      |  4 -
 .../dts/rockchip/rk3399-gru-chromebook.dtsi   |  4 +-
 .../boot/dts/rockchip/rk3399-gru-kevin.dts    |  4 -
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi  |  1 +
 drivers/pwm/pwm-cros-ec.c                     | 80 +++++++++++++++----
 include/dt-bindings/mfd/cros_ec.h             | 18 +++++
 15 files changed, 113 insertions(+), 39 deletions(-)
 create mode 100644 include/dt-bindings/mfd/cros_ec.h

-- 
2.35.1.894.gb6a874cedc-goog

