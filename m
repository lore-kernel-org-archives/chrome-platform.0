Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B53146A6E
	for <chrome-platform@lists.linux.dev>; Thu, 13 Jun 2024 14:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718290132; cv=none; b=KmsnjyvGWsW0mpPt55OnFrm+pmsDi0ucqBOYDOHtVrOrPxfRUbl9JSrJDwOmr1+FKva67fcYF1ImissUNe8izAfYLiZroF4wqWYLM9fVbCsHM29Rg0SeZ2SGXN2qQm4zgY59I0MIHjCP6h8WTHHx3Gb0Q29wJtpTRnUbMzF4lX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718290132; c=relaxed/simple;
	bh=yVxyVIwMRddgUEXhVZPY0twYDEXyBd/qRw3RPwi32Eg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lwMesW5KLI2UVHgwjjWcRypNpFrKoWVqZv5GAvinElGbNvayT7LozZ0nh9XSswcZQZvmSJjxAeybozXcMo2WLX+M4Ru5zZyikIcO8gsbICqnIVT9B9AdjjOu6BmF1hHcYLp42EJbOGo76CzFeZk8pR9sSjLURhNwkDwZ3EwJcGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=pLd4/VbA; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="pLd4/VbA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1718290120;
	bh=yVxyVIwMRddgUEXhVZPY0twYDEXyBd/qRw3RPwi32Eg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pLd4/VbAsVstarpEzFdot13IT4mpN+rMLEk92Hldp/KOBHZrEUNlt7h3LVQZDwrDf
	 STz3oQldRrJGpAL8HXEcJZGklrh3uTqfM1j2QC+f79i1fLLRMoX342pG1Jarg/pcOP
	 UV4n+hl0mWNy5HTJ59M2qCBDqTG3ipn8Tgh13JeI=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 13 Jun 2024 16:48:40 +0200
Subject: [PATCH v3 5/5] mfd: cros_ec: Register LED subdevice
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240613-cros_ec-led-v3-5-500b50f41e0f@weissschuh.net>
References: <20240613-cros_ec-led-v3-0-500b50f41e0f@weissschuh.net>
In-Reply-To: <20240613-cros_ec-led-v3-0-500b50f41e0f@weissschuh.net>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, Dustin Howett <dustin@howett.net>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718290119; l=1053;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=yVxyVIwMRddgUEXhVZPY0twYDEXyBd/qRw3RPwi32Eg=;
 b=N/ZDeeBVukUv4uGrxzH8013chzUsFpC2ISJK3xoUpLuH+svvdsuJuaVl8u+lAI3vDRmc+p8As
 a/mu6Gz3/4UB/mDhRXTvpg8sW1RvC7GWucN3XzW/7ltiWxe4AGV47YC
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Add ChromeOS EC-based LED control as EC subdevice.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/mfd/cros_ec_dev.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index a52d59cc2b1e..d8408054ba15 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -99,6 +99,10 @@ static const struct mfd_cell cros_ec_wdt_cells[] = {
 	{ .name = "cros-ec-wdt", }
 };
 
+static const struct mfd_cell cros_ec_led_cells[] = {
+	{ .name = "cros-ec-led", },
+};
+
 static const struct cros_feature_to_cells cros_subdevices[] = {
 	{
 		.id		= EC_FEATURE_CEC,
@@ -125,6 +129,11 @@ static const struct cros_feature_to_cells cros_subdevices[] = {
 		.mfd_cells	= cros_ec_wdt_cells,
 		.num_cells	= ARRAY_SIZE(cros_ec_wdt_cells),
 	},
+	{
+		.id		= EC_FEATURE_LED,
+		.mfd_cells	= cros_ec_led_cells,
+		.num_cells	= ARRAY_SIZE(cros_ec_led_cells),
+	},
 };
 
 static const struct mfd_cell cros_ec_platform_cells[] = {

-- 
2.45.2

