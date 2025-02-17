Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509B323F297
	for <chrome-platform@lists.linux.dev>; Mon, 17 Feb 2025 20:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739824855; cv=none; b=H7rGaoBcOi+L8JuWSCAd8Z7w4r57yHi2/U5Sbs5Xyrf7nbfV4HI+A/GHozYJPCsYD3u6gT/cWi0nrgZIwmwCFxwdkZw9wyETtH77iWpfYYZiKP3P+9tl4J4VATL+T1/WX2GlE64DkXr9E8zQKujTQvzGp3uw0pQ3EvmK8pt4H6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739824855; c=relaxed/simple;
	bh=zDIKCGmFawq4J0UKmtrX8pzoj6BuLW5GYA0ZehoiuqI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JEyxfUQi4Uv/WlMfVWeypYtr6OmMjXXvjYbGw0cuSnHA1DCuM6a2XnfupxgEUinJ+vKPfsvrkOxq1cfgQQyjrD6eB8CQb6FNvF2E2eHEIO1k9wuJxcQXYXL1kfLyS10lo97CbNj7Fuen7k7p21RGOEyCOARpQ221K5DIICE1zIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tk7uZ-0007oE-CW; Mon, 17 Feb 2025 21:40:15 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tk7uX-001TFt-2h;
	Mon, 17 Feb 2025 21:40:13 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tk7uX-000W9t-2N;
	Mon, 17 Feb 2025 21:40:13 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH v3 00/12] reboot: support runtime configuration of
 emergency hw_protection action
Date: Mon, 17 Feb 2025 21:39:40 +0100
Message-Id: <20250217-hw_protection-reboot-v3-0-e1c09b090c0c@pengutronix.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIyes2cC/3XNwQ6CMAyA4VchOzuzbjDEk+9hjMGtg10Y2ebEE
 N7dQcJJPf5N+3UmAb3FQM7FTDwmG6wbcohDQVTfDh1Sq3MTzngJHE60f91H7yKqmDepx4dzkTa
 yqUTZiJrLluTT0aOx08Zeb7l7G6Lz7+1LgnW6g81vMAFllEvRMgXanBi/jDh0z+jdYKejRrKqi
 e9SxQDEH4lnCSRoYVQtSsO+pGVZPpvROUQHAQAA
X-Change-ID: 20241218-hw_protection-reboot-96953493726a
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
 kernel@pengutronix.de, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Matteo Croce <mcroce@microsoft.com>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: chrome-platform@lists.linux.dev

We currently leave the decision of whether to shutdown or reboot to
protect hardware in an emergency situation to the individual drivers.

This works out in some cases, where the driver detecting the critical
failure has inside knowledge: It binds to the system management controller
for example or is guided by hardware description that defines what to do.

This is inadequate in the general case though as a driver reporting e.g.
an imminent power failure can't know whether a shutdown or a reboot would
be more appropriate for a given hardware platform.

To address this, this series adds a hw_protection kernel parameter and
sysfs toggle that can be used to change the action from the shutdown
default to reboot. A new hw_protection_trigger API then makes use of
this default action.

My particular use case is unattended embedded systems that don't
have support for shutdown and that power on automatically when power is
supplied:

  - A brief power cycle gets detected by the driver
  - The kernel powers down the system and SoC goes into shutdown mode
  - Power is restored
  - The system remains oblivious to the restored power
  - System needs to be manually power cycled for a duration long enough
    to drain the capacitors

With this series, such systems can configure the kernel with
hw_protection=reboot to have the boot firmware worry about critical
conditions.

---
Changes in v3:
- Added Tzung-Bi's Acked-by and Reviewed-by tags (Thanks!)
- Fix typo in documentation s/emergency restart()/emergency_restart()/
  (Tzung-Bi)
- Advance Date/KernelVersion tags for sysfs-kernel-reboot ABI documentation
  (Tzung-Bi)
- Added Matti's Reviewed-by tags (Thanks!)
- Link to v2: https://lore.kernel.org/r/20250113-hw_protection-reboot-v2-0-161d3fc734f0@pengutronix.de

Changes in v2:
- Added Rob's dt-bindings Acked-by
- Add kernel-doc for all newly introduced enums, functions and
  function parameters (lkp)
- Fix kernel-doc warning for do_kernel_restart even though it
  wasn't introduced in this series (lkp)
- Rename the work function and object in patch 2 already to align
  with the functional change
-
- Link to v1: https://lore.kernel.org/r/20241219-hw_protection-reboot-v1-0-263a0c1df802@pengutronix.de

---
Ahmad Fatoum (12):
      reboot: replace __hw_protection_shutdown bool action parameter with an enum
      reboot: reboot, not shutdown, on hw_protection_reboot timeout
      docs: thermal: sync hardware protection doc with code
      reboot: describe do_kernel_restart's cmd argument in kernel-doc
      reboot: rename now misleading __hw_protection_shutdown symbols
      reboot: indicate whether it is a HARDWARE PROTECTION reboot or shutdown
      reboot: add support for configuring emergency hardware protection action
      regulator: allow user configuration of hardware protection action
      platform/chrome: cros_ec_lpc: prepare for hw_protection_shutdown removal
      dt-bindings: thermal: give OS some leeway in absence of critical-action
      thermal: core: allow user configuration of hardware protection action
      reboot: retire hw_protection_reboot and hw_protection_shutdown helpers

 Documentation/ABI/testing/sysfs-kernel-reboot      |   8 ++
 Documentation/admin-guide/kernel-parameters.txt    |   6 +
 .../devicetree/bindings/thermal/thermal-zones.yaml |   5 +-
 Documentation/driver-api/thermal/sysfs-api.rst     |  25 ++--
 drivers/platform/chrome/cros_ec_lpc.c              |   2 +-
 drivers/regulator/core.c                           |   4 +-
 drivers/regulator/irq_helpers.c                    |  16 +--
 drivers/thermal/thermal_core.c                     |  17 +--
 drivers/thermal/thermal_core.h                     |   1 +
 drivers/thermal/thermal_of.c                       |   7 +-
 include/linux/reboot.h                             |  36 ++++--
 include/uapi/linux/capability.h                    |   1 +
 kernel/reboot.c                                    | 140 ++++++++++++++++-----
 13 files changed, 195 insertions(+), 73 deletions(-)
---
base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
change-id: 20241218-hw_protection-reboot-96953493726a

Best regards,
-- 
Ahmad Fatoum <a.fatoum@pengutronix.de>

