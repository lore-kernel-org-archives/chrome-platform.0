Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E0E7B
	for <chrome-platform@lists.linux.dev>; Mon, 21 Mar 2022 08:56:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F89C340E8;
	Mon, 21 Mar 2022 08:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647852980;
	bh=pmZW5P7Lo7GARh0tReXLvQb6BFoVaU8rk3ddzNWmrQc=;
	h=From:To:Cc:Subject:Date:From;
	b=YR3U43v32icmnx3DBng8wpUuDxirR4Scp3y0txfxcvhMz6Ly0Kfb2F9Qc6EYWiC5J
	 EuRETTrpUCvvX4ojCCNrImbIx6T4hArLQegkL2oriB/h8UMPJMncvSP4U0SjsuVy+t
	 0s++j6SlehqbDI97cvmzX4XTSeF5qloclgIflQft6LWX5UG5Muxhgx0lvEd9n83VbQ
	 Sxb2ZOTRnwXYLsLxfg5vEvtJbN9RTG+Bdn4zpv4Lmtn7DYKq97rm2wwLagqm77JCt6
	 qRufjhrJ5jR7tcEVo95mdI7M7mFkxf1yHPZlHiuxaaYfHPLSbH/AguiyyfO6urPl90
	 GM2CszccLKO0g==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org,
	robh+dt@kernel.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] platform/chrome: cros_kbd_led_backlight: add EC PWM backend
Date: Mon, 21 Mar 2022 16:55:42 +0800
Message-Id: <20220321085547.1162312-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series adds EC PWM as an backend option for ChromeOS keyboard LED
backlight.

The 1st patch reorder the headers alphabetically.

The 2nd patch separates the ACPI backend as an independent option.

The 3rd patch is the DT binding document for the proposed compatible string.

The 4th patch supports OF match.

The 5th patch adds EC PWM as another backend option.

Changes from v2:
(https://patchwork.kernel.org/project/chrome-platform/cover/20220314090835.3822093-1-tzungbi@kernel.org/)
- Fix per review comments.

Changes from v1:
(https://patchwork.kernel.org/project/chrome-platform/cover/20220214053646.3088298-1-tzungbi@google.com/)
- Update email address accordingly.

Tzung-Bi Shih (5):
  platform/chrome: cros_kbd_led_backlight: sort headers alphabetically
  platform/chrome: cros_kbd_led_backlight: separate ACPI backend
  dt-bindings: add google,cros-kbd-led-backlight
  platform/chrome: cros_kbd_led_backlight: support OF match
  platform/chrome: cros_kbd_led_backlight: support EC PWM backend

 .../chrome/google,cros-kbd-led-backlight.yaml |  35 +++
 .../bindings/mfd/google,cros-ec.yaml          |   3 +
 drivers/platform/chrome/Kconfig               |  14 +-
 .../platform/chrome/cros_kbd_led_backlight.c  | 220 ++++++++++++++++--
 4 files changed, 249 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/chrome/google,cros-kbd-led-backlight.yaml

-- 
2.35.1.894.gb6a874cedc-goog

