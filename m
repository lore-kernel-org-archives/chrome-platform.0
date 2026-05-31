Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70A238BF9C
	for <chrome-platform@lists.linux.dev>; Sun, 31 May 2026 13:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780233628; cv=none; b=cZCqM1UfvQSr67dJPh/Yia2ZdiXZ55gkCB4VcjK5K4kfTOwo8XsrMEGqvNzjMWI3nGAM8JMeAG9mcUzR7DQVIHYNpdxPm7XkzMUeckSgLX0MbXhDctwFxjjOo0KLVPEDxHYKBaxKTNpVAcFn/1IL975zOxp884zXEjG1WmYXVms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780233628; c=relaxed/simple;
	bh=qQhIk8c+anh5pUvgK11psDu3XWJ3lKMSQsSNr4AvGFo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DvcZWFtlQpD0ZNeHrGYS60xx8pcTJoNkcC3eZT9OWe0xJ6ojNGCtARDlJ1KiE0SzcEeuU/Im8CpqdHyxEu61NVyN9Z9OWMybbXbW8VymLXpxGFCDbqoA69llQStz9BY8xPrkr07nR21Nbh22XtJO4LskQgyqv9zWIOBuDsMzkZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=KjT1hA0n; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="KjT1hA0n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1780233617;
	bh=qQhIk8c+anh5pUvgK11psDu3XWJ3lKMSQsSNr4AvGFo=;
	h=From:Subject:Date:To:Cc:From;
	b=KjT1hA0n39vNQzHPeEragkp/DOhiZp8TAU/amgMIkef0DpueeTLYE/mRO5qZbEBhD
	 YS1bvwZENXhr76+/CZ9/5XPUpP05qCwCWnpcKGTuVYoM/3Q/nHUIrokOvy3IH6yXiY
	 n53Dcu0y54NV3xAry6NlDfb3lyGUlxL9vEDYxhbw=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/2] platform/chrome: Prevent build for big-endian systems
Date: Sun, 31 May 2026 15:20:14 +0200
Message-Id: <20260531-cros-big-endian-v1-0-0cc90f39c636@weissschuh.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrB2IEdPQqxQX+ZnY6SJKppaCe
 HejLr/FexsIFSaBZ7NBoR8Lz7miaxsIb5cnQo7VoJU2augVhjILep6QcmSX0ZpkY9LRm4eFWi2
 FEv+v42u8Lav/UPieG9j3A/YaCQVzAAAA
X-Change-ID: 20260530-cros-big-endian-86f8df2db678
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780233616; l=829;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=qQhIk8c+anh5pUvgK11psDu3XWJ3lKMSQsSNr4AvGFo=;
 b=X6Dwry/UCVjzmXbwKNxsYxkRjnAM3hwWXnAi5Rh7OvPxskfRJ0x5ZEhf/j6Pt5Ls7abU4RAwg
 trOaJmFQxjvDhFSr+pUsCsMybBM8xff7EfN0RbZkI2GEehyqg6mzcCL
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Both ARM and ARM64 which are a dependency for CHROME_PLATFORMS have
seldomly used big-endian variants.

The ChromeOS EC framework and drivers are written under the assumption
that they will be running on a little-endian systems. Code which would
be broken on big-endian can be found trivially.

Prevent the build for big-endian systems.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (2):
      platform/chrome: Remove superfluous dependencies from CROS_EC
      platform/chrome: Prevent build for big-endian systems

 drivers/platform/chrome/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
---
base-commit: 4178de898c341e6c259851a2be1c7649ac4f40ad
change-id: 20260530-cros-big-endian-86f8df2db678

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

