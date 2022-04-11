Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66DA7B
	for <chrome-platform@lists.linux.dev>; Mon, 11 Apr 2022 15:21:18 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 123-20020a1c1981000000b0038b3616a71aso10264078wmz.4
        for <chrome-platform@lists.linux.dev>; Mon, 11 Apr 2022 08:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/VFG6EulH67RRWPIE71JJK8AZq6cWf3+aNSyjdrV2C8=;
        b=f8FW30h1HbOZrWHAWLe1L6knIAO0lJCzBwigFR02VS5ig3PismUohmyDbYry74u0YC
         UV5H7kw4tET6yKSP4M+ROchJBxSEI4tPWRE+9dUf4NNKvRls9SfSV+pJDH9H5jo177AX
         S3p2Tb1K2+rBEP6VzhnsL5P5Oz4zNM4yZM/Ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/VFG6EulH67RRWPIE71JJK8AZq6cWf3+aNSyjdrV2C8=;
        b=25ydEFR1FFoMY6AIU2iO+hsXnw9acGJLvpZ7BoV6wCSdBORk7DaocrManlFzK7jHPI
         F9qBGpnlQ7t3xpXTZpQaiUU2HCP/Oi5o0LmgorfZE6eUXsN2/tMT7oqXcKhoQmbS36Vb
         pdy5EnuelFii+BKftVO8oIdA++URRHwlt+u7Q75JamVyoiy4FUPSQmbLhIunItsuyRLT
         4nFLbIlpAo+buJjWkVqsyYiUSnw0X+ylDeJI/alpgvNU5xLUGEdkufz4iw1/8xuKGcT8
         MBxZp1VKp6JEVyjQvky2WVCXg8Qc9lj9WuCOUawI5v6dxop9QCnsw+cDVqkX2pc2lawa
         eh5A==
X-Gm-Message-State: AOAM532X+DSzwioLsTyEGYecbErpsfgegb6QSrtAxtl4IVk9SZIe4enI
	yxoX618origQ+Fbs1EhmzpcwSQ==
X-Google-Smtp-Source: ABdhPJwbqNlCfR4VhfhDPHHdmhTKyU7+ZvArbU48oZz50iRIBTjWcOKUrdfpPb01ZRfsKygY1pculg==
X-Received: by 2002:a7b:c5cd:0:b0:38c:8b1b:d220 with SMTP id n13-20020a7bc5cd000000b0038c8b1bd220mr28977405wmk.118.1649690476941;
        Mon, 11 Apr 2022 08:21:16 -0700 (PDT)
Received: from fabiobaltieri-linux.lan ([37.228.205.1])
        by smtp.gmail.com with ESMTPSA id bk1-20020a0560001d8100b002061d6bdfd0sm19512832wrb.63.2022.04.11.08.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 08:21:16 -0700 (PDT)
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
Subject: [PATCH v3 0/4] Add channel type support to pwm-cros-ec
Date: Mon, 11 Apr 2022 15:21:10 +0000
Message-Id: <20220411152114.2165933-1-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
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

Tested on a sc7180-trogdor board.

Changes from v2:
(https://patchwork.kernel.org/project/chrome-platform/list/?series=627837)
- reworded patch 2 commit description
- reworked the driver and dt documentation to use a new compatible rather than
  boolean property
- dropped the comment about build test only, tested on actual hardware
  (trogdor), build test on x86 (with CONFIG_OF=n).

Changes from v1:
(https://patchwork.kernel.org/project/chrome-platform/list/?series=625182)
- fixed the dt include file license
- fixed the property name (s/_/-/)
- rebased on current linus tree (few dts files changed from a soc tree
  pull, so patch 4 needs a recent base to apply correctly)

[1] https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/ec/common/pwm.c;l=24
[2] https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/depthcharge/src/drivers/ec/cros/ec.c;l=1271-1273

Fabio Baltieri (4):
  dt-bindings: add mfd/cros_ec definitions
  drivers: pwm: pwm-cros-ec: add channel type support
  dt-bindings: update google,cros-ec-pwm documentation
  arm64: dts: address cros-ec-pwm channels by type

 .../bindings/pwm/google,cros-ec-pwm.yaml      |   9 +-
 .../mt8183-kukui-jacuzzi-fennel-sku1.dts      |   4 +-
 .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |   4 +-
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   1 +
 .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  |   4 -
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |   9 +-
 .../qcom/sc7280-herobrine-herobrine-r0.dts    |   7 +-
 .../arm64/boot/dts/qcom/sc7280-herobrine.dtsi |   7 +-
 .../arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi |   4 +-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    |   7 +-
 .../boot/dts/rockchip/rk3399-gru-bob.dts      |   4 -
 .../dts/rockchip/rk3399-gru-chromebook.dtsi   |   5 +-
 .../boot/dts/rockchip/rk3399-gru-kevin.dts    |   4 -
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi  |   1 +
 drivers/pwm/pwm-cros-ec.c                     | 109 ++++++++++++++----
 include/dt-bindings/mfd/cros_ec.h             |  18 +++
 16 files changed, 140 insertions(+), 57 deletions(-)
 create mode 100644 include/dt-bindings/mfd/cros_ec.h

-- 
2.35.1.1178.g4f1659d476-goog

