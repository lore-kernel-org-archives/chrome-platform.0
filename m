Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DB54C77C0
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 16:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781715005; cv=pass; b=cLSuF2pad1uU5Frn11+L3BxFoSE5bLsfleF32IKvJAAYGe/A3Eo/q7mIN31erhOuWvgAFKquoFVohIg127sMwX7tPn4XFO9x47AOU9kuzxTFEVOdVyQxWuk33LVh3oVJRt0ZHiP+6WzrYxBD/WdfUV3W53EM+BGIHyF+Mdbduoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781715005; c=relaxed/simple;
	bh=46QMtMcuxnIZoL+xIhNwgGCMpv65BlQ4i4ySlqs4vz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MI/pPbJgkGGGiXW1cG6QzgcbhGcLrZKA/E+UhxUy7NkB+PGNdd3o1ioc0SG7ocGcHNTuKo7kbAXi8ZIg/WUoUZq0WBw3iW7sogddUwuoJwx+eZr4CE+u4mTCpx+hVhcvnvLQP6p3BGaa+GUiSEpD0EWB/y/kgzsAfLKet6HDNyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=k25gwzXa; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="k25gwzXa"
ARC-Seal: i=1; a=rsa-sha256; t=1781714999; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OcWWDEledolNhkJQ9TjvpM2qTnrOmFbg6leB8osTcCuApDDzT5Zeehu7oUzjcYe/Ae2aRvoT2hjxLEtWlmgNJxdOXGHvzDT/LuU7+0UjNHK7cGRNS57MY3Rrd+2YfTf0LVnVU6V+HLqvLZFNZXYxAxqgLLsPp/PU7CRHkAvNGdk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781714999; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GMrEHJIsNQKr3cdYhQRNVQX+p/Pau+HnEdKcTqiCkIQ=; 
	b=nLyzn3Jqd86hDdoPuRf2vI86YGPoJynRQTshqEs5pRK5xbS28OlYwh36icpGfahaUfHAgBLn03zpKOtabiwLYlhTu2BbKGMSIVzYH4m7iu0plxhY/04Ur8unjibX+MwCqS0ZnCCVCp73swaz/XJB2ryYBaOAJbL2Rw61Ymo2Bqw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781714999;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=GMrEHJIsNQKr3cdYhQRNVQX+p/Pau+HnEdKcTqiCkIQ=;
	b=k25gwzXakN9+nB/04xlV+RgOqoBIM+sj9MER+qwy2nBgGZ+SSakbr74Z4LiyP9U8
	hpNcC/5rqPHa4YtCrLox3KX4BPOZLQfg3OdCyMnI2xQhOqchLyAjLNVN3D4nMqLkygz
	aCs6a7by3el2Bwi7FzdXNKhvevL5afPradr9Rg9mJvd4JblYw0/HOqeDLQX23vIL3B+
	8U8JfCVGJfWfyd0Nvbetyz4Nh5BJ8LUSC27hkDc62I2dpRb/tkSd0run31EltyLx95R
	l8yBp3QQIkefSxfjxbZ4J3NbY55+Cik+2lkDs67N3V5gXLD6ZFugeQDL5Bqexrmxttt
	JdczBjYDUA==
Received: by mx.zohomail.com with SMTPS id 1781714996876469.22452862170087;
	Wed, 17 Jun 2026 09:49:56 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Thu, 18 Jun 2026 00:48:02 +0800
Subject: [PATCH RFC v2 8/9] platform/x86: ideapad-laptop: Serialize
 keyboard backlight notifications
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-leds-trigger-hw-changed-v2-8-c28c44053cf3@rong.moe>
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

ACPI notifications are delivered in dedicated work contexts and may
arrive simultaneously. In the following change, much work will be done
while handling the notification, which could lead to potential race
conditions.

Introduce a new mutex to serialize keyboard backlight notifications to
prevent potential race conditions.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/ideapad-laptop.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 40153dc9a5f2..97949094ead4 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -26,7 +26,9 @@
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/leds.h>
+#include <linux/lockdep.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
 #include <linux/power_supply.h>
@@ -228,6 +230,8 @@ struct ideapad_private {
 		int type;
 		struct led_classdev led;
 		atomic_t last_hw_brightness;
+
+		struct mutex notif_mutex; /* protects notifications */
 	} kbd_bl;
 	struct {
 		bool initialized;
@@ -1720,6 +1724,8 @@ static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
 	if (!priv->kbd_bl.initialized)
 		return;
 
+	guard(mutex)(&priv->kbd_bl.notif_mutex);
+
 	hw_brightness = ideapad_kbd_bl_hw_brightness_get(priv);
 	if (hw_brightness < 0)
 		return;
@@ -1747,6 +1753,10 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
 	if (WARN_ON(priv->kbd_bl.initialized))
 		return -EEXIST;
 
+	err = devm_mutex_init(&priv->platform_device->dev, &priv->kbd_bl.notif_mutex);
+	if (err)
+		return err;
+
 	hw_brightness = ideapad_kbd_bl_hw_brightness_get(priv);
 	if (hw_brightness < 0)
 		return hw_brightness;

-- 
2.53.0

