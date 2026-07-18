Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3340B2F7F1E
	for <chrome-platform@lists.linux.dev>; Sat, 18 Jul 2026 17:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784394664; cv=pass; b=ocPVx5TBFEN4HNuI2bXD57BAUTicD1YgDUbJYkdMoC57xXSGmIILZAY9jGStj71zQ85bC5ZV7xuNSV8OUvqJvb2CjlHuhB23II6HNLgdwNqEN8DWPV9ehWblrTnpSEf0l0oWq4cBVKI/GaReS1VQ7xsugy1I9EGO8MxJOzfWDjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784394664; c=relaxed/simple;
	bh=4T2pGEXqjw1NmLQAnBSCJ61qYoJ5LDpeL5hLcljC0MI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dmMqaucPTh07br6IQRmScQKRot7ykAx7+y2hR17b62D636/dIW+9yvR5H6jUgIo4i6uUKIMDs5J3IxmxbktMOFgF6KOwATGXRThTSZGodPiLqTy41OyrsG18Az08w7JtWsaRGRZG2VEBDcClIflKQkpuCnkMd6t4uhkcuZlSYA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Lwve+T/M; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Lwve+T/M"
ARC-Seal: i=1; a=rsa-sha256; t=1784394559; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Im6qk9AQ4GiM3yDDhSq6xkvyxQsLy26KsLOQrQ94TivRsCt2DCILxOgWCjBP6Y/3YN2hfbATtFXd6apWqu45XT/JKTpw0DAPszPNtwxe5Azuo7eodqeZLV7YR0JE7NpFm31J1vPSG6Ccpk99/kEuqxMsC0oHmkI97J8HXI1BOLc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784394559; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=p2wKjKwxZJsRgFmU4Uh4/kREypsgmL6qSRMs+0v5GLo=; 
	b=hOGlVrmCmlY8hsj16X+RIVCq7mRJ7fL7341b5ulyFON+MNcV13cya7HpZlGY/SM7G31rWrb3Q8g3MQL2ZM8TLYJn2GgsNK/RLWm2+eZryBQeqt00iXwJJj7E199chud2tviwtR+cEEgblZe6Pd05ssDNXu+VxGjFNj1knxKw+8k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784394559;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=p2wKjKwxZJsRgFmU4Uh4/kREypsgmL6qSRMs+0v5GLo=;
	b=Lwve+T/MdAUCTHzXHa97dnaK3ykcOUu5TX+6ow5x7fF/2S/srVX6cJYjRLhj8g1a
	iVHfMD//kUe4FKfLy+MapmN1ysrKnvym8ymZiogDR+VFhL3u2d10L2R3DVailrbdEl9
	ftq8Zfsbeya3ug1vdv+Vib9+0KtgXrO7GmqTo+6TEvEyJURzMOHmLqwSvFkubKJcFQ4
	GqarcEDpf/BGIAO+AGXr0LJK1MnitpliyMEiuIqCxKznzqiqFM6XekB1qMDZWlxHh1U
	cYwqH7KawvJJbNuFoB8zohxQTYQg/bSkfcDtb35rhYkKN17t733rTijeRNZmrbH+3rG
	iZr/BnaLwg==
Received: by mx.zohomail.com with SMTPS id 1784394555064358.8195120922568;
	Sat, 18 Jul 2026 10:09:15 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 19 Jul 2026 01:05:23 +0800
Subject: [PATCH RFC v3 06/11] leds: trigger: netdev: Implement offloaded()
 callback
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260719-leds-trigger-hw-changed-v3-6-5fb55722e36e@rong.moe>
References: <20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe>
In-Reply-To: <20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe>
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
X-Mailer: b4 0.16-dev-4217c
X-ZohoMailClient: External

"netdev" can run in hardware control according to hardware capabilities
and trigger options.

Implement offloaded() callback to provide its hardware control state to
the LED core, and document the relation between the custom "offloaded"
attribute and the generic "trigger_may_offload" attribute.

Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v3:
- Do not deprecate netdev's "offloaded" attribute (thanks Thomas
  Weißschuh)
- Document the relation between the custom "offloaded" attribute and the
  generic "trigger_may_offload" attribute (ditto)
---
 Documentation/ABI/testing/sysfs-class-led                | 3 +++
 Documentation/ABI/testing/sysfs-class-led-trigger-netdev | 3 +++
 drivers/leds/trigger/ledtrig-netdev.c                    | 8 ++++++++
 3 files changed, 14 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
index b61fc2e71bd3..7dc95f7a3505 100644
--- a/Documentation/ABI/testing/sysfs-class-led
+++ b/Documentation/ABI/testing/sysfs-class-led
@@ -100,6 +100,9 @@ Description:
 		- `[foo_trigger]`: the trigger is selected and offloaded to
 		  hardware.
 
+		The "netdev" trigger also provides a custom attribute to
+		indicate its state, see `/sys/class/leds/<led>/offloaded`.
+
 What:		/sys/class/leds/<led>/inverted
 Date:		January 2011
 KernelVersion:	2.6.38
diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-netdev b/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
index ed46b37ab8a2..a5146ea1e3e6 100644
--- a/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
+++ b/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
@@ -75,6 +75,9 @@ Description:
 		If 1, the LED blinking in requested mode is offloaded to
 		hardware.
 
+		LED trigger core also provides a generic attribute for this
+		purpose, see `/sys/class/leds/<led>/trigger_may_offload`.
+
 What:		/sys/class/leds/<led>/link_10
 Date:		Jun 2023
 KernelVersion:	6.5
diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 64c078e997f2..a26109ca4b1c 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -754,10 +754,18 @@ static void netdev_trig_deactivate(struct led_classdev *led_cdev)
 	kfree(trigger_data);
 }
 
+static bool netdev_trig_offloaded(struct led_classdev *led_cdev)
+{
+	struct led_netdev_data *trigger_data = led_get_trigger_data(led_cdev);
+
+	return trigger_data->hw_control;
+}
+
 static struct led_trigger netdev_led_trigger = {
 	.name = "netdev",
 	.activate = netdev_trig_activate,
 	.deactivate = netdev_trig_deactivate,
+	.offloaded = netdev_trig_offloaded,
 	.groups = netdev_trig_groups,
 };
 

-- 
2.53.0

