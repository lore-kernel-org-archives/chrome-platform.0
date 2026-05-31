Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86B238C2A0
	for <chrome-platform@lists.linux.dev>; Sun, 31 May 2026 13:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780233629; cv=none; b=pRG5EyXwf4ds4h1YR8wlBbIzFIFv5AnxR97+nDTkSiPtOyC9jwi/Ah6dR1QoZ2I1NYHxZArKF9rUhp76A1kvt+K6Oh2De2vkAj8iY5tNlTIVZdZn8WgNN7hHZI7Wg2HF7q+TQX4seNmYtxTU7d3YF0mPrMw7oNsNvsMAq/PPOQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780233629; c=relaxed/simple;
	bh=t5nUZjYgSkVKmSRq6mBtJWJ8P347BRiNys4rsUtgqQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IX1gSL/gGg9JGN5jERyJaXhVX+lM6Ek//z8l8gh1i5nwcdk6VNutp3dlMugEzzZu3DEMJxpptIvnZcswh1gRG8YdGV/ndzj/Osztn+VRr40z3ZAT6y4EQ/PGYMr2O6J/C+h8KZ9XGUCiqRcuM5EsvyU4RvK1cagi4+QNq/Uevx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=FjdaiOeL; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="FjdaiOeL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1780233617;
	bh=t5nUZjYgSkVKmSRq6mBtJWJ8P347BRiNys4rsUtgqQs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FjdaiOeLjW/3UuayJRmmUmK0oFgzynrPJYkDa6qJ/fxesYKiKSICHJ4mH1f+z7U/M
	 UrVX07M0bDeTyf0Ld12g3U7z+7e0njFnDl8Dvj467WFBLbn/7Qob43vvJpl37wMCai
	 G1OQ0+zqNKpCPad1yEqVU/k6pEtBX3k5OPgbHCA4=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 31 May 2026 15:20:16 +0200
Subject: [PATCH 2/2] platform/chrome: Prevent build for big-endian systems
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260531-cros-big-endian-v1-2-0cc90f39c636@weissschuh.net>
References: <20260531-cros-big-endian-v1-0-0cc90f39c636@weissschuh.net>
In-Reply-To: <20260531-cros-big-endian-v1-0-0cc90f39c636@weissschuh.net>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780233616; l=1221;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=t5nUZjYgSkVKmSRq6mBtJWJ8P347BRiNys4rsUtgqQs=;
 b=eYjP1MPSWdaFbdAffDH3PUIYcermqBYx7U7ibpKFFPrRaEakTcdECK4O9b3IeINYOQvzQHwVy
 WoI2HvzUXVMA7JjOhV+96OxCPotBmSJt0pMzcVPHo2zEZLaVrH+VQLd
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Both ARM and ARM64 which are a dependency for CHROME_PLATFORMS have
seldomly used big-endian variants.

The ChromeOS EC framework and drivers are written under the assumption
that they will be running on a little-endian systems. Code which would
be broken on big-endian can be found trivially.

Some examples:
cros_ec.c: suspend_params.sleep_timeout_ms = ec_dev->suspend_timeout_ms
cros_ec_debugfs.c: resp->time_since_ec_boot_ms
cros_ec_wdt.c: arg.req.reboot_timeout_sec = wdd->timeout

Prevent the build for big-endian systems.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/platform/chrome/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
index 78acc052377b..ca2e8442026e 100644
--- a/drivers/platform/chrome/Kconfig
+++ b/drivers/platform/chrome/Kconfig
@@ -6,6 +6,7 @@
 menuconfig CHROME_PLATFORMS
 	bool "Platform support for Chrome hardware"
 	depends on X86 || ARM || ARM64 || COMPILE_TEST
+	depends on !CPU_BIG_ENDIAN || COMPILE_TEST
 	help
 	  Say Y here to get to see options for platform support for
 	  various Chromebooks and Chromeboxes. This option alone does

-- 
2.54.0

