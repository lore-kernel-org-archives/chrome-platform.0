Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F1D7B
	for <chrome-platform@lists.linux.dev>; Thu, 14 Apr 2022 09:28:35 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id b19so6048944wrh.11
        for <chrome-platform@lists.linux.dev>; Thu, 14 Apr 2022 02:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VQ1Ns6exvywbj5YVrqChmYabRv4bnzV6d00OZRotDxk=;
        b=hTP08ZMDNByzNE+rOxyiJkLh1x9yUlo716JKFvue1wfejnxuRwmCzb7ZFTk/YjVQ12
         o0vKMBgoU7iyS3t3bwVhu8mymoFVKPqcLc+2zW4wk+RKx8fYE1YrW8DF/2m6HL9s4cqc
         GuuuZMODv27K+4dioFQboC6aH4spw0V4bj74Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VQ1Ns6exvywbj5YVrqChmYabRv4bnzV6d00OZRotDxk=;
        b=CAJ91416vOxrJbvXvZDRwbJt5hI/1WpwZt2QPTK8mRSLWNy+LLEvcrw94pyzQesAIQ
         DgpDtqz0UfnT7m7Ak7uE44gD8979YW2qmmQ1pdWUPAWci6MbpQzmvrDjStNFbcp33DU5
         isZBHaVtkqO9PpisqMyucDt46M9Hx17YZQb9b1BsYXYBIAP3UutkE1jc0tL4S5MEWC3B
         hRK6EeSuPTE14c/hyFFejNUxqjYku+YTBIPIRFXl0UMSvb5B/CFVBRoXWDQuFNRG9J8/
         1VZBhn1IOMam9N8TxQL2LlnBELF5SQ3/TkasSkYxNcEGPnkQiEKAcm0HbTAUm/KG4YpZ
         megQ==
X-Gm-Message-State: AOAM530JWCI14hJ+RZwGU2HKff4uVr/cKSMjAQKo9D/1tf+Gkm3nsoGP
	MHBfLsCRLfL5thErEbURXD3ZeQ==
X-Google-Smtp-Source: ABdhPJxNm30rXQDMpWZpc08ebVbqvKPBKcHSxDG4T9G3LivzhKHgSKTkBAvQOg/b3BVjtkQeWuwuEA==
X-Received: by 2002:a05:6000:1202:b0:207:a5f6:fc0 with SMTP id e2-20020a056000120200b00207a5f60fc0mr1410782wrx.438.1649928513656;
        Thu, 14 Apr 2022 02:28:33 -0700 (PDT)
Received: from fabiobaltieri-linux.lan ([37.228.205.1])
        by smtp.gmail.com with ESMTPSA id bg8-20020a05600c3c8800b0038e4c5967besm1698099wmb.3.2022.04.14.02.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 02:28:33 -0700 (PDT)
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
Subject: [PATCH v4 0/4] Add channel type support to pwm-cros-ec
Date: Thu, 14 Apr 2022 09:28:27 +0000
Message-Id: <20220414092831.3717684-1-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
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

Tested on a sc7180-trogdor board, build tested on x86.

Changes from v3:
(https://patchwork.kernel.org/project/chrome-platform/list/?series=631131)
- actually reworded patch 2 commit description
- reworked patch 2 to use of_device_is_compatible() instead of compatible .data

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
  pwm: pwm-cros-ec: add channel type support
  dt-bindings: update google,cros-ec-pwm documentation
  arm64: dts: address cros-ec-pwm channels by type

 .../bindings/pwm/google,cros-ec-pwm.yaml      |  9 +-
 .../mt8183-kukui-jacuzzi-fennel-sku1.dts      |  4 +-
 .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |  4 +-
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  1 +
 .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  |  4 -
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  9 +-
 .../qcom/sc7280-herobrine-herobrine-r0.dts    |  7 +-
 .../arm64/boot/dts/qcom/sc7280-herobrine.dtsi |  7 +-
 .../arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi |  4 +-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    |  7 +-
 .../boot/dts/rockchip/rk3399-gru-bob.dts      |  4 -
 .../dts/rockchip/rk3399-gru-chromebook.dtsi   |  5 +-
 .../boot/dts/rockchip/rk3399-gru-kevin.dts    |  4 -
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi  |  1 +
 drivers/pwm/pwm-cros-ec.c                     | 82 +++++++++++++++----
 include/dt-bindings/mfd/cros_ec.h             | 18 ++++
 16 files changed, 121 insertions(+), 49 deletions(-)
 create mode 100644 include/dt-bindings/mfd/cros_ec.h

-- 
2.35.1.1178.g4f1659d476-goog

