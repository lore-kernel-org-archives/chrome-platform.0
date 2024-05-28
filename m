Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DDD17838E
	for <chrome-platform@lists.linux.dev>; Tue, 28 May 2024 20:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716926717; cv=none; b=DL+X/09KtQvgvicZY3r4yeEiOhXiG1z38H3xSD6/2rNLsBZz4twjwG5eJqVlGZl3vrqZuzXGzMnjXvgg0ORJCrz+5pqqbEn8iv+KH0slMkLaMJDpgbcUvHSoZ0bf96TAxhBnu8aLmeLtcLuyCZZ4aO4fQwNrqN/yN+6R2egN+ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716926717; c=relaxed/simple;
	bh=QGClvnWyRt6Z5l3HwVZJ+J+CE2jOyvBkkV1qVUSgp/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IBUqScLyUvjpZpexVfpcLJn+LsanBTcIc9EuOycPWn/gUyduvJYCqfsvqtYS/v2+zpC+fVOgwE+xqgNGX0HrWR9Zt6Wys7XFc60d+S/iSGUW2KHPX77uyjtqY1PyHruZBZSGAZBDNmOf43kqf3acjJosI4fDlwiBWo6ZNwBfuSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=DTRI5pjO; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="DTRI5pjO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1716926707;
	bh=QGClvnWyRt6Z5l3HwVZJ+J+CE2jOyvBkkV1qVUSgp/w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DTRI5pjO5zRfFd/DBEiue5VFoOGeyoTFdJ6NqG89d4d54qp2TCGvB1V++ZdgEsh7l
	 WZLNymt5hhb0ZC+tVXKE9p97zrW0o66yVQkE+7kR1pdgBOQUKeTVqwAfyfB3Kj2wV7
	 5jxyNy/N3suBab1v6ipNwb0RvzxoWPIY4rUT3pLo=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 28 May 2024 22:04:12 +0200
Subject: [PATCH v2 3/3] mfd: cros_ec: Register charge control subdevice
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240528-cros_ec-charge-control-v2-3-81fb27e1cff4@weissschuh.net>
References: <20240528-cros_ec-charge-control-v2-0-81fb27e1cff4@weissschuh.net>
In-Reply-To: <20240528-cros_ec-charge-control-v2-0-81fb27e1cff4@weissschuh.net>
To: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>, 
 Dustin Howett <dustin@howett.net>, 
 Stephen Horvath <s.horvath@outlook.com.au>, 
 Rajas Paranjpe <paranjperajas@gmail.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716926707; l=645;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=QGClvnWyRt6Z5l3HwVZJ+J+CE2jOyvBkkV1qVUSgp/w=;
 b=cMubD7FX6aKWHXlIcGRZlCmI3fX7A4Y3afA3lFL79I6hTx78IjO9QMEz4XaTL9FOgg2tRwC7N
 LUnVCS4e7LoAkUlTkRbgHz1XgEhRInOroBaz6qf7753Q1v8bWqDapCZ
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Add ChromeOS EC-based charge control as EC subdevice.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/mfd/cros_ec_dev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index a52d59cc2b1e..dab2bec39dcd 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -87,6 +87,7 @@ static const struct mfd_cell cros_ec_sensorhub_cells[] = {
 };
 
 static const struct mfd_cell cros_usbpd_charger_cells[] = {
+	{ .name = "cros-charge-control", },
 	{ .name = "cros-usbpd-charger", },
 	{ .name = "cros-usbpd-logger", },
 };

-- 
2.45.1

