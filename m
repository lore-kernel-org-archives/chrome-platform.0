Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992305;
	b=xjVbkv47UIuRpupsC6YCem1wxWP3l+jK+GezfQudKPa1yL1jGR6sL/ezpiweAEueJ/9l
	 dJVYJYxIV1Wqdl188DRF1nVkiHe6Pci8vshcimQVeyY3d2xzz6WS6d9+dTNNM/q2EE2XJ
	 bPEkzfM3jKUg6/IjUGAT/ZbOHxbbhddH1zewmZ+SoiycTMHjoTOZnC46i8ncDKEn+txjL
	 h+aiKMzPOphD0bgOz7miJ3viflC6Y5F7cjwSogrHYu40LR2GZcD7QHzsXc5KF4tb5Xfih
	 Sqe/mxYyCJAbccAbJ+++pBdFhkLrQPHT1ro20xn1xNzmUOtRjm9mSvVjXKNa0itJApw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992305;
	h=DMARC-Filter:DKIM-Signature:To:Message-Id:X-Mailer:Content-Type:Date:
	 Mime-Version:In-Reply-To:Cc:Subject:Content-Transfer-Encoding:
	 X-Original-From:From:X-Lms-Return-Path:References:Received;
	bh=2VyhfTXkTaroHFBv8TOZc7YD5SyTk+wxbID6QQMvh+Q=;
	b=Bdb5VIbV10dafxjYochJzS0xJteun9DcmpYshDRebg8IDJyLp4ZRBKmd0wEFt+T6c2Xv
	 3Wf/Bnt1qsIlFfp9DIiVvB1dvm7JlG1Why3x/CCJoZtP+tuBFYNXABNrTtwKzYgkTMg/Z
	 beaHnwAjJq0addqyZgxuuKjplPx9bxc11iwApRFKt1MbhEnRFr/lBqh8iw2qnWE5rrABG
	 GwP85R7jpIgwhq9ncdVjsLG5Sao7uY1h7VKzf6PdFDOPCToQZzGp4bbM4XOQn4AC2D3rC
	 6jai0q61jcLQstmqbbojpUPOQY41y1I9/BePaTXwSBucEuFfx7Y0lhNdFbKwTHNRq+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=YW+7OmIm;
	arc=none smtp.remote-ip=209.127.231.57
Received: from va-2-57.ptr.blmpb.com (va-2-57.ptr.blmpb.com [209.127.231.57])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEB5606A32A
	for <chrome-platform@lists.linux.dev>; Wed, 18 Nov 2026 08:58:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFEB5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=YW+7OmIm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794992300;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=2VyhfTXkTaroHFBv8TOZc7YD5SyTk+wxbID6QQMvh+Q=;
 b=YW+7OmImX4Xm2itALj/aUzewKjrwOunBjx3qugvgZ8JyzXcqEUUeOFX/9kAgVJvKDMe6Kb
 DL+23zMmCrYZjH+3JuvlCAk7c84M1BUxLpj2oVvErHRGxn/M+/DH2LZFUf+PmOpABKV2+2
 00PTLeaJYbkZ2AvXbggFu26I+B+rBDi/szgxhr3TKJprgdifwNUIf4w+IRZYTfdO1Ysx+0
 5k/Bksbl3LMbWBuQfd1JtIl3+MOE4KrXze6w5W7ngJyz0IKjCCdLmR1PepItORJCqhZfVk
 krvbkYJ8PKE5JEVjuuX8eYXowvMl1HQJVBy9b6HKYybbexAMhzTjMm8NRmJ8Dg==
To: "Yixun Lan" <dlan@kernel.org>, "Benson Leung" <bleung@chromium.org>
Message-Id: <20261118085742.1817536-9-yang.wang@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 16:57:41 +0800
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
In-Reply-To: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Tzung-Bi Shih" <tzungbi@kernel.org>, 
	"Guenter Roeck" <groeck@chromium.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, <devicetree@vger.kernel.org>, 
	<chrome-platform@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 8/9] riscv: dts: spacemit: Enable the FML13V05 EC keyboard
Content-Transfer-Encoding: 7bit
X-Original-From: Wang Yang <yang.wang@deepcomputing.io>
From: "Wang Yang" <yang.wang@deepcomputing.io>
X-Lms-Return-Path: <lba+26afd68a9+2ecbd3+lists.linux.dev+yang.wang@deepcomputing.io>
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
Received: from ubuntu.. ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Wed, 18 Nov 2026 16:58:16 +0800

Connect the board EC to the eSPI peripheral window and GPIO43 rising-
edge interrupt. Describe the vendor 8 by 16 keyboard matrix and its Fn
mappings for the existing google,cros-ec-keyb driver.

Preserve the upstream model and compatible strings and keep the EC child
local to this board.

Prepared with Codex assistance from the existing DC-linux EC support.

Signed-off-by: Wang Yang <yang.wang@deepcomputing.io>
---
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 137 ++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index b5d5112de..214c8bbb5 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -3,6 +3,8 @@
  * Copyright (C) 2026 DeepComputing (HK) Limited
  */
 
+#include <dt-bindings/input/input.h>
+
 #include "k3.dtsi"
 #include "k3-pinctrl.dtsi"
 
@@ -29,3 +31,138 @@ &uart0 {
 	pinctrl-0 = <&uart0_0_cfg>;
 	status = "okay";
 };
+
+&espi0 {
+	pinctrl-0 = <&espi0_2_cfg>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	ec: ec@0 {
+		compatible = "spacemit,k3-cros-ec";
+		reg = <0x0 0x1000>;
+		interrupt-parent = <&gpio>;
+		interrupts = <1 11 IRQ_TYPE_EDGE_RISING>;
+
+		keyboard-controller {
+			compatible = "google,cros-ec-keyb";
+			keypad,num-rows = <8>;
+			keypad,num-columns = <16>;
+			linux,keymap = <
+					/* Row 0 */
+					MATRIX_KEY(0x00, 0x00, KEY_C)
+					MATRIX_KEY(0x00, 0x01, KEY_DELETE)
+					MATRIX_KEY(0x00, 0x02, KEY_Q)
+					MATRIX_KEY(0x00, 0x03, KEY_RIGHTALT)
+					MATRIX_KEY(0x00, 0x05, KEY_X)
+					MATRIX_KEY(0x00, 0x06, KEY_V)
+					MATRIX_KEY(0x00, 0x07, KEY_M)
+					MATRIX_KEY(0x00, 0x08, KEY_DOT)
+					MATRIX_KEY(0x00, 0x09, KEY_RIGHTSHIFT)
+					MATRIX_KEY(0x00, 0x0a, KEY_COMMA)
+					MATRIX_KEY(0x00, 0x0c, KEY_RIGHTCTRL)
+					MATRIX_KEY(0x00, 0x0d, KEY_SLASH)
+					MATRIX_KEY(0x00, 0x0e, KEY_APOSTROPHE)
+
+					/* Row 1 */
+					MATRIX_KEY(0x01, 0x03, KEY_LEFTALT)
+					MATRIX_KEY(0x01, 0x04, KEY_SPACE)
+					MATRIX_KEY(0x01, 0x05, KEY_Z)
+					MATRIX_KEY(0x01, 0x06, KEY_B)
+					MATRIX_KEY(0x01, 0x07, KEY_N)
+					MATRIX_KEY(0x01, 0x08, KEY_DOWN)
+					MATRIX_KEY(0x01, 0x09, KEY_LEFTSHIFT)
+					MATRIX_KEY(0x01, 0x0c, KEY_LEFTCTRL)
+					MATRIX_KEY(0x01, 0x0d, KEY_UP)
+					MATRIX_KEY(0x01, 0x0e, KEY_ENTER)
+					MATRIX_KEY(0x01, 0x0f, KEY_F8)
+
+					/* Row 2 */
+					MATRIX_KEY(0x02, 0x02, KEY_FN)
+					MATRIX_KEY(0x02, 0x04, KEY_E)
+					MATRIX_KEY(0x02, 0x05, KEY_F2)
+					MATRIX_KEY(0x02, 0x06, KEY_G)
+					MATRIX_KEY(0x02, 0x07, KEY_H)
+					MATRIX_KEY(0x02, 0x08, KEY_BACKSLASH)
+					MATRIX_KEY(0x02, 0x0a, KEY_F7)
+					MATRIX_KEY(0x02, 0x0d, KEY_MINUS)
+					MATRIX_KEY(0x02, 0x0f, KEY_RIGHT)
+
+					/* Row 3 */
+					MATRIX_KEY(0x03, 0x01, KEY_LEFTMETA)
+					MATRIX_KEY(0x03, 0x02, KEY_TAB)
+					MATRIX_KEY(0x03, 0x04, KEY_F4)
+					MATRIX_KEY(0x03, 0x05, KEY_F1)
+					MATRIX_KEY(0x03, 0x06, KEY_T)
+					MATRIX_KEY(0x03, 0x07, KEY_Y)
+					MATRIX_KEY(0x03, 0x08, KEY_O)
+					MATRIX_KEY(0x03, 0x0a, KEY_F6)
+					MATRIX_KEY(0x03, 0x0b, KEY_F9)
+					MATRIX_KEY(0x03, 0x0d, KEY_F12)
+
+					/* Row 4 */
+					MATRIX_KEY(0x04, 0x02, KEY_GRAVE)
+					MATRIX_KEY(0x04, 0x04, KEY_CAPSLOCK)
+					MATRIX_KEY(0x04, 0x05, KEY_S)
+					MATRIX_KEY(0x04, 0x06, KEY_5)
+					MATRIX_KEY(0x04, 0x07, KEY_6)
+					MATRIX_KEY(0x04, 0x08, KEY_F10)
+					MATRIX_KEY(0x04, 0x0a, KEY_F5)
+					MATRIX_KEY(0x04, 0x0d, KEY_0)
+					MATRIX_KEY(0x04, 0x0e, KEY_EQUAL)
+
+					/* Row 5 */
+					MATRIX_KEY(0x05, 0x02, KEY_1)
+					MATRIX_KEY(0x05, 0x04, KEY_3)
+					MATRIX_KEY(0x05, 0x05, KEY_2)
+					MATRIX_KEY(0x05, 0x06, KEY_4)
+					MATRIX_KEY(0x05, 0x07, KEY_7)
+					MATRIX_KEY(0x05, 0x08, KEY_9)
+					MATRIX_KEY(0x05, 0x0a, KEY_8)
+					MATRIX_KEY(0x05, 0x0b, KEY_102ND)
+					MATRIX_KEY(0x05, 0x0d, KEY_P)
+					MATRIX_KEY(0x05, 0x0e, KEY_BACKSPACE)
+
+					/* Row 6 */
+					MATRIX_KEY(0x06, 0x04, KEY_F3)
+					MATRIX_KEY(0x06, 0x05, KEY_W)
+					MATRIX_KEY(0x06, 0x06, KEY_R)
+					MATRIX_KEY(0x06, 0x07, KEY_U)
+					MATRIX_KEY(0x06, 0x08, KEY_F11)
+					MATRIX_KEY(0x06, 0x0a, KEY_I)
+					MATRIX_KEY(0x06, 0x0b, KEY_LEFT)
+					MATRIX_KEY(0x06, 0x0d, KEY_LEFTBRACE)
+					MATRIX_KEY(0x06, 0x0e, KEY_RIGHTBRACE)
+
+					/* Row 7 */
+					MATRIX_KEY(0x07, 0x02, KEY_A)
+					MATRIX_KEY(0x07, 0x05, KEY_ESC)
+					MATRIX_KEY(0x07, 0x06, KEY_F)
+					MATRIX_KEY(0x07, 0x07, KEY_J)
+					MATRIX_KEY(0x07, 0x08, KEY_L)
+					MATRIX_KEY(0x07, 0x0a, KEY_K)
+					MATRIX_KEY(0x07, 0x0d, KEY_SEMICOLON)
+					MATRIX_KEY(0x07, 0x0e, KEY_D)
+
+					/* Fn layer (row + 8). */
+					MATRIX_KEY(0x08, 0x01, KEY_INSERT)        /* Fn+Delete */
+					MATRIX_KEY(0x09, 0x08, KEY_PAGEDOWN)      /* Fn+Down */
+					MATRIX_KEY(0x09, 0x0d, KEY_PAGEUP)        /* Fn+Up */
+					MATRIX_KEY(0x09, 0x0f, KEY_BRIGHTNESSUP)  /* Fn+F8 */
+					MATRIX_KEY(0x0a, 0x05, KEY_VOLUMEDOWN)    /* Fn+F2 */
+					MATRIX_KEY(0x0a, 0x0a, KEY_BRIGHTNESSDOWN) /* Fn+F7 */
+					MATRIX_KEY(0x0a, 0x0f, KEY_END)           /* Fn+Right */
+					MATRIX_KEY(0x0b, 0x04, KEY_PREVIOUSSONG)  /* Fn+F4 */
+					MATRIX_KEY(0x0b, 0x05, KEY_MUTE)          /* Fn+F1 */
+					MATRIX_KEY(0x0b, 0x0a, KEY_NEXTSONG)      /* Fn+F6 */
+					MATRIX_KEY(0x0b, 0x0b, KEY_SWITCHVIDEOMODE) /* Fn+F9 */
+					MATRIX_KEY(0x0b, 0x0d, KEY_CONFIG)        /* Fn+F12 */
+					MATRIX_KEY(0x0c, 0x08, KEY_RFKILL)        /* Fn+F10 */
+					MATRIX_KEY(0x0c, 0x0a, KEY_PLAYPAUSE)     /* Fn+F5 */
+					MATRIX_KEY(0x0e, 0x04, KEY_VOLUMEUP)      /* Fn+F3 */
+					MATRIX_KEY(0x0e, 0x08, KEY_SYSRQ)         /* Fn+F11 */
+					MATRIX_KEY(0x0e, 0x0b, KEY_HOME)          /* Fn+Left */
+					>;
+		};
+	};
+};
-- 
2.43.0
