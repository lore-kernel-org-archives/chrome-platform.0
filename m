Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCA51FBCB8
	for <chrome-platform@lists.linux.dev>; Thu, 19 Dec 2024 07:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734593502; cv=none; b=PHIIwIA8/U9mJl+45ZBS79CkbcJhgnbyb8Y+J18VQK1jNcp+2VCF3EIqWvfMFklAIor7A5vF03dahp0eMzUwcMxeGSD5GsKbZ4dRD+jwYzIP1xfsrc4TYuE5iNGMLeosi1sv4YozH+SiU3aKdXvCMZf6irzYzYtce45a51VXL4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734593502; c=relaxed/simple;
	bh=Dbh2Kpv3bXLQD+GsqfTMp3KLQ2xI6YShyiyhisXZNj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hhsfDhDzrouCXY3J0R6Zep/91URsU3iKwFIL9XsRRfD3uS35z9K//BysGfjZVw+yS8tDbWTA/32P7C0147Nge2YdrxxYEZDuCdobGEzR1eqik1MGa/5hNVZpGu8iz4VxzZW/48OUgA9S6XK+uK6Bh98Wj1pfsoBuI2x3pBaQDT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOB0O-00088U-1U; Thu, 19 Dec 2024 08:31:32 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOB0L-004APs-23;
	Thu, 19 Dec 2024 08:31:30 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOB0M-00GkbH-0o;
	Thu, 19 Dec 2024 08:31:30 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Thu, 19 Dec 2024 08:31:26 +0100
Subject: [PATCH 05/11] reboot: indicate whether it is a HARDWARE PROTECTION
 reboot or shutdown
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-hw_protection-reboot-v1-5-263a0c1df802@pengutronix.de>
References: <20241219-hw_protection-reboot-v1-0-263a0c1df802@pengutronix.de>
In-Reply-To: <20241219-hw_protection-reboot-v1-0-263a0c1df802@pengutronix.de>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
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

It currently depends on the caller, whether we attempt a hardware
protection shutdown (poweroff) or a reboot. A follow-up commit will make
this partially user-configurable, so it's a good idea to have the
emergency message clearly state whether the kernel is going for a reboot
or a shutdown.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 kernel/reboot.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index da6c8bdeeefe627a76c7ec6e8926138ebbe3ae4e..aa6317939af41c9730ec5a74b7faf03f7c0f25a7 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -1023,7 +1023,8 @@ void __hw_protection_trigger(const char *reason, int ms_until_forced,
 {
 	static atomic_t allow_proceed = ATOMIC_INIT(1);
 
-	pr_emerg("HARDWARE PROTECTION shutdown (%s)\n", reason);
+	pr_emerg("HARDWARE PROTECTION %s (%s)\n",
+		 hw_protection_action_str(action), reason);
 
 	/* Shutdown should be initiated only once. */
 	if (!atomic_dec_and_test(&allow_proceed))

-- 
2.39.5

