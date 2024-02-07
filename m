Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F431272B5
	for <chrome-platform@lists.linux.dev>; Wed,  7 Feb 2024 18:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707331404; cv=none; b=cY49CT6rMTyrcXqCRO3FDYTvWSPJTOe9u+KSKD9NGh18E+TJEj4I86HoUN+Zgdix9K37+kHsXlbsOl+uGMOhRgXkcrHpw+rTgFYh1AenMdpIKhYqtDLLxka6goup/qQ8wOAb9IkdqGvZwO31246Ml2fI4ScI8bHiW4nLCMbNGjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707331404; c=relaxed/simple;
	bh=82BqdfYVCWT3Ohz5KyeQLipnBnJA3+PJw9sXj8PFqAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cI1pBEWxErPXpoUNHJemVgvpWiik273hFjS7MuHE3+sGMuJbaNjXNjSuxitl3GKkaM6heqMauDlBcRrU4xBKXdFUz8IyEj4LC2Mm4J+Q9JcTO/VYx7MYF7okBcszPu6v32rmVgo4UrSYxkFiAzZURiinhxZGNpsYRnpv2iP+MNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rXmt7-0007eW-1z; Wed, 07 Feb 2024 19:43:13 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rXmt6-0054Xi-7q; Wed, 07 Feb 2024 19:43:12 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rXmt6-00HRsk-0V;
	Wed, 07 Feb 2024 19:43:12 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: kernel@pengutronix.de,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v3 15/32] platform/chrome: cros_ec_spi: Follow renaming of SPI "master" to "controller"
Date: Wed,  7 Feb 2024 19:40:29 +0100
Message-ID:  <cfbafd8a581a3ca37134cb84cef4370959012d9d.1707324794.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707324793.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707324793.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=82BqdfYVCWT3Ohz5KyeQLipnBnJA3+PJw9sXj8PFqAY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlw86nU9GnftRL96TAXX7wsHrdPDZV8of/reV7I lhz81IJPcCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcPOpwAKCRCPgPtYfRL+ TnzPB/9dGwqLUtwjxbKxr2hjwVfulj2JlwzRozoJEw1LRWZfdHqEColaRC+wCKhfTDuKxqQi11T pMUWzpekGpc/lZ6nyKmBAVkMsWblZCLeSumNRC6lV2CKO32ZuOsYyW0gi5czelg7sTjD83hUfqL mHY2Cz1TPs/zcurJRPYBiKVUrcRqItQVgmIT+Rp4xmjadVAL+1lNGHdws0zWb+/fUweCk2voMpz eq75Str5OqwdudEpGZHm+qz3n//dpjtHpwjsFfQgOjrerEfz9fJF7KC34ycUjb6UqaEYmdTF3+w TP+PPbBqPef/qtRTbjBhq63kpGnXPB3blR8wdzP03/KCtUn6
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: chrome-platform@lists.linux.dev

In commit 8caab75fd2c2 ("spi: Generalize SPI "master" to "controller"")
some functions and struct members were renamed. To not break all drivers
compatibility macros were provided.

To be able to remove these compatibility macros push the renaming into
this driver.

Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/platform/chrome/cros_ec_spi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_spi.c b/drivers/platform/chrome/cros_ec_spi.c
index 3e88cc92e819..86a3d32a7763 100644
--- a/drivers/platform/chrome/cros_ec_spi.c
+++ b/drivers/platform/chrome/cros_ec_spi.c
@@ -409,7 +409,7 @@ static int do_cros_ec_pkt_xfer_spi(struct cros_ec_device *ec_dev,
 	if (!rx_buf)
 		return -ENOMEM;
 
-	spi_bus_lock(ec_spi->spi->master);
+	spi_bus_lock(ec_spi->spi->controller);
 
 	/*
 	 * Leave a gap between CS assertion and clocking of data to allow the
@@ -469,7 +469,7 @@ static int do_cros_ec_pkt_xfer_spi(struct cros_ec_device *ec_dev,
 
 	final_ret = terminate_request(ec_dev);
 
-	spi_bus_unlock(ec_spi->spi->master);
+	spi_bus_unlock(ec_spi->spi->controller);
 
 	if (!ret)
 		ret = final_ret;
@@ -554,7 +554,7 @@ static int do_cros_ec_cmd_xfer_spi(struct cros_ec_device *ec_dev,
 	if (!rx_buf)
 		return -ENOMEM;
 
-	spi_bus_lock(ec_spi->spi->master);
+	spi_bus_lock(ec_spi->spi->controller);
 
 	/* Transmit phase - send our message */
 	debug_packet(ec_dev->dev, "out", ec_dev->dout, len);
@@ -590,7 +590,7 @@ static int do_cros_ec_cmd_xfer_spi(struct cros_ec_device *ec_dev,
 
 	final_ret = terminate_request(ec_dev);
 
-	spi_bus_unlock(ec_spi->spi->master);
+	spi_bus_unlock(ec_spi->spi->controller);
 
 	if (!ret)
 		ret = final_ret;
-- 
2.43.0

