Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F10C38C2B2
	for <chrome-platform@lists.linux.dev>; Sat,  4 Apr 2026 07:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775289345; cv=none; b=OmbK7IXWJ0hvHGpni6aKy1gRnVAytObstXBIuf/m6o18WXCmNGiuQVbHqGMmg0H047Mxm6q8oxW+NjwnUho+3cN9B4iwNzqRO9CM4eC5mo/EgvjHc5INoc3YJd1AbfzQ7aXjqhAFfiZilBWcRMlqpXd81u/UxvmI8hVa/CTrKv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775289345; c=relaxed/simple;
	bh=TwqEJi8pVirRVc+4hpOvriaxkUNZOsGUb+Guwu6J+e0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=phWdvJ7jSeFCRd55QQMT+EwR5MNBZ0NWY2c8JJMH+DVnhlcTE1nzTKtvYjXh8pmvKJYb1Iy3ZSwbOoY51uUmmAEK5a4d7Wi6SnwiHrwEe3aB4Of2y1+eSnZMR8fGoiWsOqQCabpwmyPZo4tLi/K4rAVPoNSk203u1gymH9DYjEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=LAARZvUX; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="LAARZvUX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775289337;
	bh=TwqEJi8pVirRVc+4hpOvriaxkUNZOsGUb+Guwu6J+e0=;
	h=From:Subject:Date:To:Cc:From;
	b=LAARZvUXJMtKMK3pXfogAJy3Hg/ayXcQ3/sVXspsl3yZgAazRI/3+51nmsQ36wHRv
	 nJwsqDWJhRUzTe2kDYReKn8VRi7Cl8Y0ZV1UFtIRAzDeAp2Vero3iYIjU8us5ORsxN
	 zJ2LPJxN3p0SpkFbfwedC5y9e6efdY44EgA7LL3I=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/5] platform/chrome: cros_kbd_led_backlight: Some cleanups
Date: Sat, 04 Apr 2026 09:55:25 +0200
Message-Id: <20260404-cros_kbd_led-cleanup-v1-0-0dc1100d54e3@weissschuh.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avErBNsopCuEhH+jDUkFkoRRHdPW
 n6L9x7IlJgyDNUDiS7OvMeCpq7ArjouJNgVA0rsJaISNu153oybAzlhA+l4HsJL3bSo0HTKQUm
 PRJ7vfztO7/sBVyuQX2YAAAA=
X-Change-ID: 20260228-cros_kbd_led-cleanup-f0a13282b58d
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Lee Jones <lee@kernel.org>, Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775289335; l=1048;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=TwqEJi8pVirRVc+4hpOvriaxkUNZOsGUb+Guwu6J+e0=;
 b=340Zn0bYLO3DbDhPS7l5V8gBlSdUGQhUKPgL5KCtN8dZzaJip5KNp7d2nQnhhpZvC3ssnapUX
 J1R8neSd+JBDdK7b7EpPbVADb6DxRatDeFe+7mVYVt60pbChfKfjdVa
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Some cleanups for the cros_kbd_led_backlight driver.

Patches 1-3 should go through platform-chrome.
Patch 4 and 5 should go either through platform-chrome or MFD.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (5):
      platform/chrome: cros_kbd_led_backlight: Drop max_brightness from driver data
      platform/chrome: cros_kbd_led_backlight: Pass keyboard_led as parameter
      platform/chrome: cros_kbd_led_backlight: Drop CONFIG_MFD_CROS_EC_DEV ifdeffery
      mfd: cros_ec: Add a helper to retrieve the EC device from the MFD parent
      platform/chrome: cros_kbd_led_backlight: Use cros_ec_mfd_get_ec_dev()

 drivers/platform/chrome/cros_kbd_led_backlight.c | 31 +++++++-----------------
 include/linux/mfd/cros_ec.h                      | 16 ++++++++++++
 2 files changed, 25 insertions(+), 22 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260228-cros_kbd_led-cleanup-f0a13282b58d

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

