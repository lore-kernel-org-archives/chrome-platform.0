Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB68B16DEA3
	for <chrome-platform@lists.linux.dev>; Tue,  7 May 2024 16:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715099373; cv=none; b=bvcjMCVydCPfVsH+IeoBh6xMCXDkSMMSo2vcBiTlIBlIUVHkQI5DZc3Fuyzzvvnbdf8pRWEkoSrbmSIB3E8TZDnRiSsb7PPBt4f4j3M5cBACk8NO66g/Uk3WBjxGnawEkqOPok6p6bBa6+P23viqoSalEV6EhVi3FV8Vk2XaBKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715099373; c=relaxed/simple;
	bh=mbz66Nhq8rCEi0/koHdR2mvSb3h/Lz/Clxju/H9RWNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pb+QsDtt5ZrqMVMfzaw2/PkwESE2fdWCplfb5m0YYLqujp/QJzDVghF2vycz9fBNrPHwbicm81GQLLdiHf3b45IlpdAWjgjSMNthmFU6nh9DOjiv3EoXEVGoC5jcy/NWmp5KTXIs6gYFU+W00LGkHsOMfRjJ7nwz7zAcxk6SRdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=sPZqMW95; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="sPZqMW95"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1715099369;
	bh=mbz66Nhq8rCEi0/koHdR2mvSb3h/Lz/Clxju/H9RWNQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sPZqMW95k5a61Eg2dCQQXyZBHPLxVj6/Zg1TB6swbUwbkx85Ej21m2fu5W4AdXcc0
	 I7V3cdLC1KTRxbbIRqhnPR5xkebc17N2DundNej6N6B90yvLkt1Kk35LC16gGwBsqR
	 +Gffxl4/lvcgxwQPPDmAAgSjUyogLv18NB94xCrI=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 07 May 2024 18:29:23 +0200
Subject: [PATCH v2 2/2] mfd: cros_ec: Register hardware monitoring
 subdevice
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240507-cros_ec-hwmon-v2-2-1222c5fca0f7@weissschuh.net>
References: <20240507-cros_ec-hwmon-v2-0-1222c5fca0f7@weissschuh.net>
In-Reply-To: <20240507-cros_ec-hwmon-v2-0-1222c5fca0f7@weissschuh.net>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Benson Leung <bleung@chromium.org>, Lee Jones <lee@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, chrome-platform@lists.linux.dev, 
 Dustin Howett <dustin@howett.net>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Moritz Fischer <mdf@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715099369; l=662;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=mbz66Nhq8rCEi0/koHdR2mvSb3h/Lz/Clxju/H9RWNQ=;
 b=oOY8+Isi5vdyMkBL5hto0d4xqB1NScQ8oQWBldtlg2nYlqGFeDYtNOWTqsE4w1gO7we8O01Ti
 7cLu94oS/WdDdjLvpydYzrfGf4cfGkUvUuylXJFO9Y6AZKwQDSZmEQp
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Add ChromeOS EC-based hardware monitoring as EC subdevice.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/mfd/cros_ec_dev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index a52d59cc2b1e..ca30ca25fbf8 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -131,6 +131,7 @@ static const struct mfd_cell cros_ec_platform_cells[] = {
 	{ .name = "cros-ec-chardev", },
 	{ .name = "cros-ec-debugfs", },
 	{ .name = "cros-ec-sysfs", },
+	{ .name = "cros-ec-hwmon", },
 };
 
 static const struct mfd_cell cros_ec_pchg_cells[] = {

-- 
2.45.0

