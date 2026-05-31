Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24D33845C1
	for <chrome-platform@lists.linux.dev>; Sun, 31 May 2026 13:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780233629; cv=none; b=k0LEXc3DQBH8wt4wR1sdMKLKtPjf9nharZVenvn/LfZ5qNW750NQicKRhY+1q+CC0kGj37/2JeILDAmiQUEpRQusgCVdn8WOPwQ7WI3uw2zghs7DbgA3J0NRBpjWQPgQHZ0KB0BtB/Mbz36SZpsEhUqtllmsKex9JLF8HCF4apM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780233629; c=relaxed/simple;
	bh=eNN3E2vJNyJaz8mGSJLFVu5okKHyAqnnzMO0RcrqBik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M2OqzdyGOkuFMTj1j6NH7cfHvSsg5qWz/7JsZ3LG2uS/ag6Ifreu24tx1gAjXz1dNxfp7eY/mwhrraiB2m7rFIA+ag8o5k9ZO4E+thwGCPHzeZE0wWxTw6uQzyRN0OdR8SbQifikiPeJgxjZt9FF9/CQV3+33eSpPlqIoEXTVv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=jZ17q/sZ; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="jZ17q/sZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1780233617;
	bh=eNN3E2vJNyJaz8mGSJLFVu5okKHyAqnnzMO0RcrqBik=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jZ17q/sZWFjzXwFyuPCd68zuD1Pc3GIHUhEFHLsEBYTY9a74n/aaJFU8W4/FoHbWu
	 r4xuxEUv2z+SctJaz8sb2l2RzsKPZc++lfN61L5W6JAq83b6QWkcWdrHjfGwk2SDRz
	 oaIUZ7ztA7Ov0XKrE+hpXKlh+6W04upfuLZv6cAQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 31 May 2026 15:20:15 +0200
Subject: [PATCH 1/2] platform/chrome: Remove superfluous dependencies from
 CROS_EC
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260531-cros-big-endian-v1-1-0cc90f39c636@weissschuh.net>
References: <20260531-cros-big-endian-v1-0-0cc90f39c636@weissschuh.net>
In-Reply-To: <20260531-cros-big-endian-v1-0-0cc90f39c636@weissschuh.net>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780233616; l=784;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=eNN3E2vJNyJaz8mGSJLFVu5okKHyAqnnzMO0RcrqBik=;
 b=+nrJdgm2OEte9PuWe6RJYBcSmY62ou7rcF6JXHIJLj7VzC0PSwhaxXfCJk5Ca6wGT8f+oeKeQ
 hFSeCsVjSn+CWOH7VHf/d57OtxEl+bAJfboXNXsLfW1HKCJQOWpAgwB
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

CROS_EC depends on CHROME_PLATFORMS which already declares these
dependencies.

Remove the duplication.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/platform/chrome/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
index 2281d6dacc9b..78acc052377b 100644
--- a/drivers/platform/chrome/Kconfig
+++ b/drivers/platform/chrome/Kconfig
@@ -75,7 +75,6 @@ config CHROMEOS_OF_HW_PROBER
 config CROS_EC
 	tristate "ChromeOS Embedded Controller"
 	select CROS_EC_PROTO
-	depends on X86 || ARM || ARM64 || COMPILE_TEST
 	help
 	  If you say Y here you get support for the ChromeOS Embedded
 	  Controller (EC) providing keyboard, battery and power services.

-- 
2.54.0

