Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94587629
	for <chrome-platform@lists.linux.dev>; Mon, 23 May 2022 09:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2FE9C385A9;
	Mon, 23 May 2022 09:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653296929;
	bh=OJA2a/BahveGs2QkXmqOi3SskFo5ktHSCxteR1+YNTo=;
	h=From:To:Cc:Subject:Date:From;
	b=e/MszXwhVSAoFjxeusSXYi9yg8zVTMtd6puHR94MMWZWd3a5BWdYbWTcTuybR49uV
	 JwjnZjA+cnnRHg7dlg3qhZ9XJdtWHuZ0M8Qwq+6353KA4KzSeLMO87htIUXS6ztsSC
	 4lrcRdBQyjdhv0nsZ5AreCSqFD4Kx7ZjE5Kw7y4QAQUXsNvecC9CnZ5q4tQo9tTKBm
	 HN1Hr17/pAy44fN301oBllHpOOZ/R3vYPVIQgOKW6pop+TWK1KhSLNlt/dlHwI4XLQ
	 7jQjE+fvTibca3nL6W4+icznWEJ0+wPjJNQETr5Zg29DSocp7GNbu6agkUOFRHlkIc
	 B1NR7gG8gGMog==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org,
	robh+dt@kernel.org
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mka@chromium.org,
	devicetree@vger.kernel.org,
	tzungbi@kernel.org
Subject: [PATCH v4 0/5] platform/chrome: cros_kbd_led_backlight: add EC PWM backend
Date: Mon, 23 May 2022 17:08:17 +0800
Message-Id: <20220523090822.3035189-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
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

The 2nd patch separates the ACPI backend.

The 3rd patch is the DT binding document for the proposed compatible string.

The 4th patch supports OF match.

The 5th patch adds EC PWM as another backend.

Changes from v3:
(https://patchwork.kernel.org/project/chrome-platform/cover/20220321085547.1162312-1-tzungbi@kernel.org/)
- Fix review comments on 5th patch.

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

 .../chrome/google,cros-kbd-led-backlight.yaml |  35 ++++
 .../bindings/mfd/google,cros-ec.yaml          |   3 +
 drivers/platform/chrome/Kconfig               |   2 +-
 .../platform/chrome/cros_kbd_led_backlight.c  | 196 ++++++++++++++++--
 4 files changed, 213 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/chrome/google,cros-kbd-led-backlight.yaml

-- 
2.36.1.124.g0e6072fb45-goog

