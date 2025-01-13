Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583CD25760
	for <chrome-platform@lists.linux.dev>; Mon, 13 Jan 2025 16:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736785545; cv=none; b=XLEurBvaRFOJE+/9zwnwkx+ZA4q1NmXpO44v81Cywt1VNqCBg+CQwCSByB5A4JzL/ItP368Mksk4Cb9TXw6tr1i1oPYNbHeiwzyfz9BRJHk1AHJ4ogyZb/q/3oMddL/cKJrpv3L7u7VwIpd3yc52psDWG9+3MhEui03zbcuxsHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736785545; c=relaxed/simple;
	bh=kv7H/2Fmdq5NzjHdH9WlL1ylasJJ18efPHXVIQWM2Hk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GzFbSy93sr8XJqpC3+eHg91dQ2po+hXKrgJ5qONPpbUxt573Ae5nQUKVvJmyckEqDnkfDTc+Za5VcrDoCi14BngUCWjfXvo7ZfXZEIr0HM9imPwVBgJiSv9rsfpjnrH+/6L2TF9+WJF9LZejw+Zn4Il09Ru7vbJiB3pqI9P8hGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXNFs-0000JM-8B; Mon, 13 Jan 2025 17:25:32 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXNFp-000HzN-2s;
	Mon, 13 Jan 2025 17:25:30 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXNFq-007FQL-32;
	Mon, 13 Jan 2025 17:25:30 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Mon, 13 Jan 2025 17:25:34 +0100
Subject: [PATCH v2 09/12] platform/chrome: cros_ec_lpc: prepare for
 hw_protection_shutdown removal
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-hw_protection-reboot-v2-9-161d3fc734f0@pengutronix.de>
References: <20250113-hw_protection-reboot-v2-0-161d3fc734f0@pengutronix.de>
In-Reply-To: <20250113-hw_protection-reboot-v2-0-161d3fc734f0@pengutronix.de>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Fabio Estevam <festevam@denx.de>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Serge Hallyn <serge@hallyn.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org, 
 chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
 kernel@pengutronix.de, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: chrome-platform@lists.linux.dev

In the general case, a driver doesn't know which of system shutdown or
reboot is the better action to take to protect hardware in an emergency
situation. For this reason, hw_protection_shutdown is going to be
removed in favor of hw_protection_trigger, which defaults to shutdown,
but may be configured at kernel runtime to be a reboot instead.

The ChromeOS EC situation is different as we do know that shutdown is
the correct action as the EC is programmed to force reset after the
short period, thus replace hw_protection_shutdown with
__hw_protection_trigger with HWPROT_ACT_SHUTDOWN as argument to
maintain the same behavior.

No functional change.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 drivers/platform/chrome/cros_ec_lpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 924bf4d3cc77b9f27d415a10c61ae06886fa7f80..068781b75529d80b51b3773845bcf457fa958710 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -414,7 +414,7 @@ static void cros_ec_lpc_acpi_notify(acpi_handle device, u32 value, void *data)
 		blocking_notifier_call_chain(&ec_dev->panic_notifier, 0, ec_dev);
 		kobject_uevent_env(&ec_dev->dev->kobj, KOBJ_CHANGE, (char **)env);
 		/* Begin orderly shutdown. EC will force reset after a short period. */
-		hw_protection_shutdown("CrOS EC Panic", -1);
+		__hw_protection_trigger("CrOS EC Panic", -1, HWPROT_ACT_SHUTDOWN);
 		/* Do not query for other events after a panic is reported */
 		return;
 	}

-- 
2.39.5

