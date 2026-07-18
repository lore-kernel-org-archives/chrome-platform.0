Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F4717BB21
	for <chrome-platform@lists.linux.dev>; Sat, 18 Jul 2026 17:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784394685; cv=pass; b=EssicVi8mCcB2kviV9yAPz16uj/KvC6rIYzoUg/R54ue5PBBcBlYXPvjuVbKCl6b6Sxt/y9mMsvU5y7dg+MWtI3XtEoYxa7x1dZnGmc1BRLAdPV5kCSXNzh+keLlZjqUzkaky6dINOFCv+QvxFZxV1y9OuyxzyM4NR/2bPlaqUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784394685; c=relaxed/simple;
	bh=+Thp/jc9SIz/ZrGRmTtRkgQn7xFt5lFdfmT0WWrC0/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fF974tmMY45ElFLMvuIrQEzD7nPuPLYHsvoVxR/baFLGSOOanP2VkI0kTs+jtEb5ejS9+L/eVd1+F6bkuvl0ZBlPECW34L96kAh47SuZGVvS4cOCIlsuEm0rIT2e7RGAm/VSbU4uU2b1+mYQAXasD51VRxMwflvJUWj+ufhGX6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=QLB1Ay+w; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="QLB1Ay+w"
ARC-Seal: i=1; a=rsa-sha256; t=1784394565; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CmkdDJNu7ZXZIU56I99blKRzNvGpOZMwFq6lQtP3gttF49g/vzoX24/o6FhHLnKFHemG/GwDGtdpCE3+FvqWTAiA7enPmVcBuq+K3IAbRlpIS7e1jDgocA6ZoDY14LM3BJqaWDqbooF32WMimbdIoEeVYzIcVltWReI/uXTu8hs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784394565; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=H+EGsbKbUKh/mzUdXXdH0o7bUxq0TfxOnBDjf2XMh34=; 
	b=juuli9aWmc1CsPTY1iLgIc9Gmynzj+gAofxky4xWX/vtBhPLAnhaVk9hXKKc8RDNXKH4wiGgpXBKz0oQdO8jNtvyjLAijCD3LA6Lu5m+WI5t79jltPlDNdFpaiEhglI8X0JO5TZNnzA4Ml0ckS4SavMQorGkNKYDY6Qdvf9bfqo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784394565;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=H+EGsbKbUKh/mzUdXXdH0o7bUxq0TfxOnBDjf2XMh34=;
	b=QLB1Ay+wc6V4URfZeZcFlGrTcGERGK8sB1O3KRO9EV/ifnDmEjEs0llZJQFQr3Ha
	8afRdjea0mUaTdnGD7DMj8jaBbN1dsIZElhIxyeMp5jfnLVvNTmFsOaOHBkB22RxkEU
	O0U2cBlOwJ3RIzf2v+SYe/9zHgxIBkXF3Lq/+efYNuUS+9sPaSvypU98y3gzQWtQstT
	my30KlXBUzIZIck9kBFZL2xG3YiDs3X+ph0DPAE3nAK/f1uVLMzAXFoawAnRLrrYxpW
	m3wQJWLPQU8WIHQEukx10XlqrkXnXJLE5F9S35aQv09GCE43ylBjCB4VCNkqqMNeQVI
	GGCzP7l3DA==
Received: by mx.zohomail.com with SMTPS id 178439456248279.82387641494734;
	Sat, 18 Jul 2026 10:09:22 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 19 Jul 2026 01:05:24 +0800
Subject: [PATCH RFC v3 07/11] leds: trigger: Enforce strict checks in
 led_trigger_is_hw_controlled()
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260719-leds-trigger-hw-changed-v3-7-5fb55722e36e@rong.moe>
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

With all existing triggers adopting the new interface, strict checks
could be enforced to make the semantics of hardware control triggers
clearer.

In detail, a hardware control trigger should:

- Implement offloaded() callback to indicate hardware control
- Associate with the LED classdev's hw_control_trigger string

Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v3:
- New patch in the series, splitted from PATCH 3 (thanks Thomas
  Weißschuh)
---
 drivers/leds/led-triggers.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index c3c41ef40f01..726fa7bf88cf 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -42,9 +42,16 @@ static bool __led_trigger_is_hw_controlled(struct led_classdev *led_cdev)
 	if (!led_cdev->trigger)
 		return false;
 
+	if (!led_cdev->hw_control_trigger ||
+	    strcmp(led_cdev->hw_control_trigger, led_cdev->trigger->name))
+		return false;
+
 	if (led_cdev->trigger->offloaded)
 		return led_cdev->trigger->offloaded(led_cdev);
 
+	dev_warn_once(led_cdev->dev, "hw control trigger %s doesn't implement offloaded()\n",
+		      led_cdev->trigger->name);
+
 	return led_cdev->trigger->trigger_type;
 }
 

-- 
2.53.0

