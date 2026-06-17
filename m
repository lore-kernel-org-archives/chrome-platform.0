Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41044C77C3
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 16:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781715012; cv=pass; b=cxIeOosIkr2WFY+WgkeYC7/ulQLuOcmw3zQs+7oJp71GmxIMXi1Q0+tds1vyyd6EmXbo2Ya8WwXmQow9vsk23aitwhg+5sL06v7w067ML3ZUUG23bFSy32hsaI//eL0kVlx8zBePbO04bijwkQo/1guEvYoxQo34pkBgJel1cWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781715012; c=relaxed/simple;
	bh=06VMN2PhtZ+7gVI8RDCXYXGtY9U4MCrSGTTb7mJDYUA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ly6b7ndFU7e0mgsry19Cdlr/VyXR9djenzkMnT5OESWeX6V6VdMwRpfng0DkdwCyudtQajuGissqCnytb0foIVPsMAdlUoK4mkPKBOaws/M4KFhflUmK/D83oPGFPkL8w75nIwJs5MY44QSm/HT5JW1kLlkBYus4tVLbRU24nQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=WuzxqkWJ; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="WuzxqkWJ"
ARC-Seal: i=1; a=rsa-sha256; t=1781715005; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nIkXzu4Wk5D4iWFPg3B/osGTUJyFfv3OgDUXRt8P+xWnDFIawntPzcF+zkMUtM09U9/thfAkng/aBUogGkNCyjC2fcQHdnV8xYhUJQr/NEAnm2xTmHTnEOKQi6Ugq00B2yp/B09bOVHNGXVoZ1RDuwrhiukFx0edr7XjWnGmDW8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781715005; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2tRFVu+rBmZK3DxliKEQUjew735Bbo/o9TjXiQMv7ow=; 
	b=Aez4hnIT9IvfFEk00u3yTaWYci34rJQyAZnbUhhtTWTxay+HRaTKp8G7ZKloIbe177BpgU88CAUnqs8grzkD5fFXJbutYcJoia5RPjhG7JytXjHtZCSWZB+n+BP135iXtB4tM+O8ozkM0b35qb4mD3C+HKEv+JcCgKSOTDeBlcI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781715005;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=2tRFVu+rBmZK3DxliKEQUjew735Bbo/o9TjXiQMv7ow=;
	b=WuzxqkWJtMEzYG7vCQXhFHeVyGmVbEySwVLZdvZVVGUJlR1ONZrotUpkoc/5vRF9
	GPElhOmtDa3qp1nIKTld7uUEk71PzwNcjnPgstToLxxx1EUj0qCfNIo7aaThDmIElrH
	wMMb40/3jVrNmZZU2FnTM8/R7q/eNOkEI5gWU0DG/WvryhzXsHpP7Cl7B6tgvdrvYOh
	1CH53Eeuk7mWon7+zuyOjwRehPCUlI6++UiFjnzLrxvgCbbyeywRuNFJfuzzqU0IwjI
	JZza2Idoix5qia1lkahHfkr5IjpzBhUcxymCBPSyF/izocywGgNkyVigzSym3WrdaWb
	HkZaIBI1gg==
Received: by mx.zohomail.com with SMTPS id 1781715004659447.50463106660675;
	Wed, 17 Jun 2026 09:50:04 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Thu, 18 Jun 2026 00:48:03 +0800
Subject: [PATCH RFC v2 9/9] platform/x86: ideapad-laptop: Fully support
 auto keyboard backlight
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-leds-trigger-hw-changed-v2-9-c28c44053cf3@rong.moe>
References: <20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3@rong.moe>
In-Reply-To: <20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3@rong.moe>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Ike Panhc <ikepanhc@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
 Vishnu Sankar <vishnuocv@gmail.com>, Vishnu Sankar <vsankar@lenovo.com>, 
 linux-leds@vger.kernel.org, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-d5d98
X-ZohoMailClient: External

Currently, the auto brightness mode of keyboard backlight maps to
brightness=0 in LED classdev. The only method to switch to such a mode
is by pressing the manufacturer-defined shortcut (Fn+Space). However, 0
is a multiplexed brightness value; writing 0 simply results in the
backlight being turned off.

With brightness processing code decoupled from LED classdev, we can now
fully support the auto brightness mode. In this mode, the keyboard
backlight is controlled by the EC according to the ambient light sensor
(ALS).

To utilize this, a private hardware control trigger "ideapad-auto" is
added, with the event handling procedure calling the
led_trigger_notify_hw_control_changed() interface to activate/deactivate
the private trigger according to the current LED trigger state.

Meanwhile, block brightness changes on exit to prevent the side effect
of LED device unregistration when the private trigger is active from
resetting the brightness to zero, so that we can retain the state of
auto mode among boots.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/ideapad-laptop.c | 63 ++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 97949094ead4..a83af9bf843c 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -1714,9 +1714,56 @@ static int ideapad_kbd_bl_led_cdev_brightness_set(struct led_classdev *led_cdev,
 {
 	struct ideapad_private *priv = container_of(led_cdev, struct ideapad_private, kbd_bl.led);
 
+	/*
+	 * When deinitializing: It must be the side effect of led_cdev
+	 * unregistration when our private trigger is active. We've set
+	 * LED_RETAIN_AT_SHUTDOWN to retain led_cdev brightness level.
+	 * To do the same for auto mode, gate changes and return early.
+	 */
+	if (unlikely(!priv->kbd_bl.initialized))
+		return 0;
+
 	return ideapad_kbd_bl_brightness_set(priv, brightness);
 }
 
+static bool ideapad_kbd_bl_auto_trigger_offloaded(struct led_classdev *led_cdev)
+{
+	struct ideapad_private *priv = container_of(led_cdev, struct ideapad_private, kbd_bl.led);
+
+	return atomic_read(&priv->kbd_bl.last_hw_brightness) == KBD_BL_AUTO_MODE_HW_BRIGHTNESS;
+}
+
+static int ideapad_kbd_bl_auto_trigger_activate(struct led_classdev *led_cdev)
+{
+	struct ideapad_private *priv = container_of(led_cdev, struct ideapad_private, kbd_bl.led);
+
+	return ideapad_kbd_bl_hw_brightness_set(priv, KBD_BL_AUTO_MODE_HW_BRIGHTNESS);
+}
+
+static struct led_hw_trigger_type ideapad_kbd_bl_auto_trigger_type;
+
+static struct led_trigger ideapad_kbd_bl_auto_trigger = {
+	.name = "ideapad-auto",
+	.trigger_type = &ideapad_kbd_bl_auto_trigger_type,
+	.activate = ideapad_kbd_bl_auto_trigger_activate,
+	.offloaded = ideapad_kbd_bl_auto_trigger_offloaded,
+};
+
+static void ideapad_kbd_bl_notify_hw_control(struct ideapad_private *priv,
+					     int hw_brightness, int last_hw_brightness)
+{
+	bool hw_control, last_hw_control;
+
+	if (priv->kbd_bl.type != KBD_BL_TRISTATE_AUTO)
+		return;
+
+	hw_control = hw_brightness == KBD_BL_AUTO_MODE_HW_BRIGHTNESS;
+	last_hw_control = last_hw_brightness == KBD_BL_AUTO_MODE_HW_BRIGHTNESS;
+
+	if (hw_control != last_hw_control)
+		led_trigger_notify_hw_control_changed(&priv->kbd_bl.led, hw_control);
+}
+
 static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
 {
 	int hw_brightness, brightness, last_brightness, last_hw_brightness;
@@ -1738,6 +1785,8 @@ static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
 	if (hw_brightness == last_hw_brightness)
 		return;
 
+	ideapad_kbd_bl_notify_hw_control(priv, hw_brightness, last_hw_brightness);
+
 	last_brightness = ideapad_kbd_bl_brightness_parse(priv, last_hw_brightness);
 	if (last_brightness < 0 || brightness != last_brightness)
 		led_classdev_notify_brightness_hw_changed(&priv->kbd_bl.led, brightness);
@@ -1770,6 +1819,20 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
 
 	switch (priv->kbd_bl.type) {
 	case KBD_BL_TRISTATE_AUTO:
+		err = devm_led_trigger_register(&priv->platform_device->dev,
+						&ideapad_kbd_bl_auto_trigger);
+		if (err)
+			return err;
+
+		priv->kbd_bl.led.flags             |= LED_TRIG_HW_CHANGED;
+		priv->kbd_bl.led.hw_control_trigger = ideapad_kbd_bl_auto_trigger.name;
+		priv->kbd_bl.led.trigger_type       = &ideapad_kbd_bl_auto_trigger_type;
+
+		/* Hardware remembers the last brightness level, including auto mode. */
+		if (hw_brightness == KBD_BL_AUTO_MODE_HW_BRIGHTNESS)
+			priv->kbd_bl.led.default_trigger = ideapad_kbd_bl_auto_trigger.name;
+
+		fallthrough;
 	case KBD_BL_TRISTATE:
 		priv->kbd_bl.led.max_brightness = 2;
 		break;

-- 
2.53.0

