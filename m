Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4875184A
	for <chrome-platform@lists.linux.dev>; Wed, 20 Apr 2022 14:16:00 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id m14so2472386wrb.6
        for <chrome-platform@lists.linux.dev>; Wed, 20 Apr 2022 07:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cTYoMHmRd8x2g8GH9Ji8JGhHbq82MUsWN/GB8tPt1yU=;
        b=n8mi8e7eEYzj/at3sY83ewAcZVoqenDD9PYYKJWyE+15q6pkMyzz5Hpi7FRz0qBxCN
         5zrG9je4/2Y1jvnu+WUp7vD0nk86sTnRGciDbCHXk7fStN7xvCERFy9W7lqomZAE7WF3
         3aMkn81BILnSO+oJ3aozsKRh2t5vVAngNjTR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cTYoMHmRd8x2g8GH9Ji8JGhHbq82MUsWN/GB8tPt1yU=;
        b=r++AehQkkTomd8Ycajg8KQjDCmdYmnbO93G5wAQbDcP//u9kOzJQUJ3i3P9Cs8ObSl
         C8XGoJYy/ZY7skQmo7GmK3tefoGAumxMRTKno9hHcUY6RwhsOUsm4yppkAemRDqW418Q
         DwWO1g/JLPX9ckYJqE/cfOqqEYlYL8wkfjOaG8R5BXOz/fkgtRSng9SApa3qklq+oBzK
         6GTqaHC9AAFT5SgCaNcP8VcqbjBs3IWdNoiJzwjI08brusjB5gNEUj49GLF7PC+0lU1R
         AckDOAICNb1oyPl9JFYOhPz+LfKYFtXE8xz0ojvE7wOYmFqWPuzY2ZV73izE6kfCYZos
         yQwA==
X-Gm-Message-State: AOAM530khA4bgqR3H/qoZlEYnm6w+tuGoMUHzUfgywJALi/u/9vgbOsO
	UrhqY9awcF5K4/DjQ6wTJqzRaw==
X-Google-Smtp-Source: ABdhPJzrC+wiN8Z4WSTVKPyrot7MeUxiYsCYgUc+BR8e7Wp2Gmf2AocqvfIHgXDNK2O8R53eI1B5Cg==
X-Received: by 2002:adf:db8b:0:b0:207:9a90:3819 with SMTP id u11-20020adfdb8b000000b002079a903819mr16431510wri.617.1650464159041;
        Wed, 20 Apr 2022 07:15:59 -0700 (PDT)
Received: from localhost.localdomain ([37.228.205.1])
        by smtp.gmail.com with ESMTPSA id v2-20020adf8b42000000b0020aa790a258sm12447wra.8.2022.04.20.07.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:15:58 -0700 (PDT)
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
Subject: [PATCH v5 0/4] Add channel type support to pwm-cros-ec
Date: Wed, 20 Apr 2022 14:15:52 +0000
Message-Id: <20220420141556.681212-1-fabiobaltieri@chromium.org>
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

Changes from v4:
(https://patchwork.kernel.org/project/chrome-platform/list/?series=632212)
- fixed wrong indentation in the devietree file on patch 3
- added review and ack tags from the previous run

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
2.36.0.rc0.470.gd361397f0d-goog

