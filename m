Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15EEA46
	for <chrome-platform@lists.linux.dev>; Mon, 18 Jul 2022 06:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 443D2C341C0;
	Mon, 18 Jul 2022 06:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658124978;
	bh=m6JrRBU83Orl/8FY1+qgd1rVEjWLTgGStSpPrHNLjPs=;
	h=From:To:Cc:Subject:Date:From;
	b=Gf3UxHIZ6sArrvyUTuUdYpRa8lHBbveWUTiKQnqQCRM775Ghnso11fqFv6VhzJn/f
	 9e2/pE0UEfTCRLUzAUsiBWrC/3sY1aTwR6TUj34kQ/2cALcqSFuqDfibwOCIrtP71z
	 ev3kRvTkpZZOLp41MtA7ksI0oZyK1DY4v1slsg8zgBGEUC1U2CnJo5iooNV6Kdns0K
	 pTilVV9eF7RAb/nkw18IvpoZVDi9zORuQb0n5uH9XGBKfxflExDeb6a4/3b6TTehBQ
	 gTV0XeeugtnWt7M98hp5KP3Vsno2fCmFgrC+eMJveDf6GQ1kbjrvsjuqUX2AaSQ9SD
	 FSFAg0VwFnhqg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] platform/chrome: cros_kbd_led_backlight: fix build warning
Date: Mon, 18 Jul 2022 06:16:08 +0000
Message-Id: <20220718061608.2303425-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drivers/platform/chrome/cros_kbd_led_backlight.c got a new build warning
when using the randconfig in [1]:
>>> warning: unused variable 'keyboard_led_drvdata_ec_pwm'

The warning happens when CONFIG_CROS_EC is set but CONFIG_OF is not set.
Reproduce:
- mkdir build_dir
- wget [1] -O build_dir/.config
- COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 \
  O=build_dir ARCH=s390 SHELL=/bin/bash drivers/platform/chrome/

Fix the warning by hardening the guard condition.  Also use IS_ENABLED()
because CROS_EC is a tristate.

[1]: https://download.01.org/0day-ci/archive/20220717/202207170538.MR39dw8m-lkp@intel.com/config

Fixes: 40f58143745e ("platform/chrome: cros_kbd_led_backlight: support EC PWM backend")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_kbd_led_backlight.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/chrome/cros_kbd_led_backlight.c b/drivers/platform/chrome/cros_kbd_led_backlight.c
index 5ad41c10412d..4a0b2bd004d5 100644
--- a/drivers/platform/chrome/cros_kbd_led_backlight.c
+++ b/drivers/platform/chrome/cros_kbd_led_backlight.c
@@ -119,7 +119,7 @@ static const struct keyboard_led_drvdata keyboard_led_drvdata_acpi = {
 
 #endif /* CONFIG_ACPI */
 
-#ifdef CONFIG_CROS_EC
+#if IS_ENABLED(CONFIG_CROS_EC) && defined(CONFIG_OF)
 
 static int
 keyboard_led_set_brightness_ec_pwm(struct led_classdev *cdev,
@@ -187,11 +187,7 @@ static const struct keyboard_led_drvdata keyboard_led_drvdata_ec_pwm = {
 	.max_brightness = KEYBOARD_BACKLIGHT_MAX,
 };
 
-#else /* CONFIG_CROS_EC */
-
-static const struct keyboard_led_drvdata keyboard_led_drvdata_ec_pwm = {};
-
-#endif /* CONFIG_CROS_EC */
+#endif /* IS_ENABLED(CONFIG_CROS_EC) && defined(CONFIG_OF) */
 
 static int keyboard_led_probe(struct platform_device *pdev)
 {
-- 
2.37.0.170.g444d1eabd0-goog

