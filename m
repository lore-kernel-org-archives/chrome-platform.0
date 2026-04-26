Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D235B21D590
	for <chrome-platform@lists.linux.dev>; Sun, 26 Apr 2026 22:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777240936; cv=none; b=kyCjGH7ZYBthEM0N4b9Fty44pabXHs5mmBtIaT0tscPoCK+iuSeW8kX9RHbyq4Khl8wsWvP/M7nRGBzZ4AJ90f0nt+GBnMo5zp2MZmXY2It4co63wAJ7OYoJ4FmEYRVXM5bPyP++kOOBa4bFrNMqPFPSFfgFUwP15lekdHt2fbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777240936; c=relaxed/simple;
	bh=61AByAzdyXxdXcjubOg+g6KLsE5j7msf7Vxat0e/c2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eczCfcqj9f1NKQnI7NQ1Z+TEOQ9BSbr7ahhZl4zKSsDspRY7qBcCocIoe++TKnx3puPjOacyRQ25Wot/EqsTsnrY0Lx3RLgKn17j0dd9IzfS5Iv3ouZDq91kjhAvdH3/4Pi0z4tmw65qfXvnxJp/DwDzpWrUwBVR0Vlj1+nnipw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hfbcxXjs; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hfbcxXjs"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso68472755e9.0
        for <chrome-platform@lists.linux.dev>; Sun, 26 Apr 2026 15:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777240933; x=1777845733; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/enPYJp1PIF5WBCrf4Mz0OhaMTY9ptocz//j8JgOEs=;
        b=hfbcxXjscH573jZ13B8utmGjcT9RBbYQiCNLZlGiJ5IjMBjn0K6rYfV0JoW8Btcl+0
         4jaicnwFuqfusdqpvqS0MuJwriz22ol/QhmUGRTWTnfCtR9yrNgqYMpjdnLWJzpnzMjw
         CcnhZ4nt8oC5FKVhMcM7IXMsTbBbwxUj3aclwx0F1889FCV3lIMlbzmWPl+BoYDByMXn
         T/laqHhz1SxPra1ddgiqROX7VdmpFv4hSrhMN3/vb7N9GMlIH2rlswRzoVqRtFnFSh8y
         Ws4sJ2ty+VLJw2fUOckgKeP5Xh5zH1DQv4G3SGNiZHqx0UPicR344gKwvCwqEkGcyAVv
         FNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777240933; x=1777845733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/enPYJp1PIF5WBCrf4Mz0OhaMTY9ptocz//j8JgOEs=;
        b=OnV+9f1v3SFle1CJmrcnk64JoLv6uJCIg/zTJ+SOLkAr2XRet8t6xIrKX8DsRsWT2j
         +CLtpL+qT0lCUkY76SzqRbKd4E9eePu4GpmJSlpEoMu/oImTbZg37/ZQvFmbZEoNsfsa
         J9Hj9477nrbUoihWpQ/U6QHseXCqZ+wXTXIDabrsfad0tqTnvidQHkhYFFVk6jPbPZcm
         MaE/Bf09N61fEvmyyeWkalyYQs2ULF77X5//yUmPw9eVLFOK7Vq54n+D3FS1dNnq9BoT
         OhJINhvMXZlh+jC9A7ZbbPdvM2Abm3GthJ5Nunry50R19DZDtCVZmPJONB4xnjh312wQ
         Q3vQ==
X-Forwarded-Encrypted: i=1; AFNElJ9xJsIlJqpcV5pvcMtfCPv1kzlYw7DHuqJeWUbllalmfQxzdRjUKe/EB0NQAdZSi1uzVwVKAJ9soAZbU1kFPf0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxzS3pBU/OmrlHpk+tSgVVqL6CdUfDwH8h+/qYIeu71di2EH3Kt
	f8RTR9s4xZMhAjvDbAmiJ4B+OVg2BYlC98TXSTKwDlQvP1ARHzS1/Kkr
X-Gm-Gg: AeBDiet9qRl+aTOfBn9+JpTEvvgS8/ifKJcC6NDhVSzRgrj5RoEhsWnOvGWHAcbY8GZ
	pO/iH0w/nJLGeQYg29Z1Z4CJz1zFRiJw5zwL4TQUPrd6fyC2lPwehn0CtNpntbXMuqtZbjrFFCm
	Zwbm/k86580ubYQdgQHloUdXdAh30GyhZGkvuL5CQgEqlEKDfUP3VrQrsrzh9jsGIFKufFT+Lid
	MnSOCa9cAK+V8D+NTzWPyvvJO+QPQfWBgJYxFYQzzAW4nRBioUxzQZwGxUQ9JFGQs0fIiwKFTJw
	GtRfHybpQEeMys8FVeDSOhGLd1n0zaXqS/VRWK9c2Jv/f21OVO+FKxb6iqeDw42k4iBkrsR4wGr
	86Z14fZavRGjXFCJ/65fxrJeCttouOZB1xdFHy/YgY26cnq+BYU40ZhwXdMQQ1TkvltrD6ITiS/
	A0CmByDMKukBwqM416pLK26GZ+VgouduRkujTvxCpNLLF0PCpccYYsUSnL5G3fA7Pi2CFg
X-Received: by 2002:a05:600c:4e4c:b0:48a:58ae:9938 with SMTP id 5b1f17b1804b1-48a58ae9f69mr375668595e9.19.1777240933036;
        Sun, 26 Apr 2026 15:02:13 -0700 (PDT)
Received: from nixos.numericable.fr (38.42.3.89.rev.sfr.net. [89.3.42.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5c4b9e8dsm104272615e9.7.2026.04.26.15.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 15:02:12 -0700 (PDT)
From: Titouan Ameline de Cadeville <titouan.ameline@gmail.com>
To: tzungbi@kernel.org
Cc: briannorris@chromium.org,
	jwerner@chromium.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>
Subject: [PATCH] firmware: google: fix orphaned devices on partial populate failure
Date: Mon, 27 Apr 2026 00:02:04 +0200
Message-ID: <20260426220204.118399-1-titouan.ameline@gmail.com>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

coreboot_table_populate() registers devices one by one. If
device_register() fails mid-loop, the function returns an error to
coreboot_table_probe(), which returns it to the platform driver core.
The platform driver core does not call remove() on probe failure, so
devices registered before the failure are left orphaned on the coreboot
bus with no cleanup path.

Call bus_for_each_dev() to unregister all devices when populate fails.

Signed-off-by: Titouan Ameline de Cadeville <titouan.ameline@gmail.com>
---
 drivers/firmware/google/coreboot_table.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/google/coreboot_table.c b/drivers/firmware/google/coreboot_table.c
index 233939e548b4..2ebf1497f60c 100644
--- a/drivers/firmware/google/coreboot_table.c
+++ b/drivers/firmware/google/coreboot_table.c
@@ -167,6 +167,12 @@ static int coreboot_table_populate(struct device *dev, void *ptr, resource_size_
 	return 0;
 }
 
+static int __cb_dev_unregister(struct device *dev, void *dummy)
+{
+	device_unregister(dev);
+	return 0;
+}
+
 static int coreboot_table_probe(struct platform_device *pdev)
 {
 	resource_size_t len;
@@ -203,17 +209,14 @@ static int coreboot_table_probe(struct platform_device *pdev)
 
 	ret = coreboot_table_populate(dev, ptr, len);
 
+	if (ret)
+		bus_for_each_dev(&coreboot_bus_type, NULL, NULL,
+				 __cb_dev_unregister);
 	memunmap(ptr);
 
 	return ret;
 }
 
-static int __cb_dev_unregister(struct device *dev, void *dummy)
-{
-	device_unregister(dev);
-	return 0;
-}
-
 static void coreboot_table_remove(struct platform_device *pdev)
 {
 	bus_for_each_dev(&coreboot_bus_type, NULL, NULL, __cb_dev_unregister);
-- 
2.44.2

