Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E764B23E358
	for <chrome-platform@lists.linux.dev>; Sun, 26 Apr 2026 21:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777240078; cv=none; b=pl9VOqKi+sBVMZPutuzpAsDdhQ3IbK9TZjtTihtvkU5NAkAZwepoewTp2YEB/t2O1Dq7miXy3hOO/q8er2kUlDTQjG3pNwTLJrTLaltHxqwJRT+KeTrQhTKK++wkwy7q7kqTHPV2kCU7rFakSgqOx+xPODb9HLOwWtaeIrXIudQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777240078; c=relaxed/simple;
	bh=bRpBkUi2fZEGvm35aCERZeH9TEX+Cnqi/MUtShZMwiU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HtXRC/mFCgNY+WRNuZ4YPmS3uAR9dCn4y6sr91qHwcbQaesApVZSB+a4JTjsjSsaimqV48euZ50YyiZclPj6VlFXjZiMzRiqE2ttNqEXQkXR9Lmx02z325UQ7qAleZ+1XMU5osXtNOGpM6faEQYb6gBCB1tcmuZpWC2JOV7FV5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TxSsXba4; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TxSsXba4"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso77436715e9.0
        for <chrome-platform@lists.linux.dev>; Sun, 26 Apr 2026 14:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777240075; x=1777844875; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bMgKhzoQmNwDIwRBK8My1XvNCN3myDASwlpKQVBQUIk=;
        b=TxSsXba4N2IhowgJ9TX+gwkM1EM4LMf3NAz8kHKzsas6aHUdAbSxmfcdURTe8LIRNH
         rDBk/1P28USgn58SmYzOFXbzgOdLh8qR+/QW8U6PJSPJJZZUHF2fbvYrod5i9RCCDW27
         fPjwsLNrRTcIfwzye66wVGQryK0VIvwgoL/6W+Lf9yPkAQwfLYApsmmfkOKLEBpt68cl
         WOjJFLN6hINhkq3vp4c26WyANdlH88Y8X+mvwuboOdhaY+kZU4/OzlJF/h5TVh5ACXqt
         WeGkuSrHKrMgItkTruw4VrCqrsJWyudqibgnbAqfp246ykKRn+gDl3sl498HbremrRAs
         sK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777240075; x=1777844875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMgKhzoQmNwDIwRBK8My1XvNCN3myDASwlpKQVBQUIk=;
        b=eLibx3ii2bTmSApCrZS98RgX/36h4pmWms0MIEP6cgCkTu7fXA1mpLjy4DEKFYTTsH
         2JHIk1OhEvYRr7QqZqgg9yoN1NyCNOD0lK+5wDpwVhY2meMyQ+1kMMaBMOkK+CKEvJI2
         Wdy+0WvS0VGjEyJOeKSqUpDWEufxuhDUbWmNpeyDdwO6HR3CU2Gk5x69xnAGk1UP9Kdu
         yEf98NWtV1ZWPSJkTlC/wh0NrbVmWVOozPkQRwd/xU2ZDHK86Yd5S029Or05xgxjuY/h
         eeNXHWYo2K2RsjfEzzwN9jUDfRmBlWBn6uWfW+Cz3VOyjer376fAboqQXIk8QMLOOOcM
         DSqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/jsBl5izEhGwk2cdNcWDVCdAjdZ9K52R/rC3RuwmZvWivki6XDeb9xdstl13yhShAdJ8NWkOOXZW8XgpTyOVk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3uz9lh7Mefs1D5EWWWb9OOSTOyjMHCFuoDNyXJ1fyiMCXqx99
	uG2BwDBfzgbNxqN+rglQwapyWTNBTzWx9ksEWoudD7Jvgwv0wV1aif/M
X-Gm-Gg: AeBDiescscuNEZ7Gx3wx83crpWukFQbueKu+6RQnw/uOHJiVLfbIPTg7+JjoDhWK4ji
	peujvvTDWg5FGKw3fymFpqBbYJzrgUn57jMr/zitTF2/3qII1o+Zl0ZdEJfLT22Z2J4jQE4evAR
	s9PZYZPxSAU846wjkC9iXahEiDJ0fw8mKn9YOF0oS2SntDsuCn1xo2E7mcuE6gk+wVNTEFTyJTI
	39V10M53XoC/P+ULh6s9aujc+OFtiMvXmh3QsYruI0AOGhBW40AVF1WwFfDZpJbjCgaWW/XwbHU
	ty+n/nsK7kVvNpyOGxcaP9XI5ybkxWCT0niF624/AqZRIOTVBOZ6dGlyuKZ4vJZjzSuy7YYl+X2
	cCX1W+s0g/tXNtU+nEDwlmaTQIjiVYEN9utdjXyl3Ggsozn96B/OsdpfUMLgzOvdttsU8V7j0zg
	R0dgKzV587k4+1GSqIRVTiz3J2tqtZlefbfUiCy6mWHI+lCYBUDLZRoOVB2+TUMx9bj1EY
X-Received: by 2002:a05:600c:8b8c:b0:489:1d74:56d with SMTP id 5b1f17b1804b1-4891d7406famr475297685e9.29.1777240075254;
        Sun, 26 Apr 2026 14:47:55 -0700 (PDT)
Received: from nixos.numericable.fr (38.42.3.89.rev.sfr.net. [89.3.42.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4412e36ff8bsm27056244f8f.26.2026.04.26.14.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 14:47:53 -0700 (PDT)
From: Titouan Ameline de Cadeville <titouan.ameline@gmail.com>
To: tzungbi@kernel.org
Cc: briannorris@chromium.org,
	jwerner@chromium.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>
Subject: [PATCH] firmware: google: add bounds checks in coreboot_table_populate()
Date: Sun, 26 Apr 2026 23:47:39 +0200
Message-ID: <20260426214739.117131-1-titouan.ameline@gmail.com>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

coreboot_table_populate() iterates over firmware-provided table entries
with no validation that the entries stay within the mapped memory region.
A corrupt table with a large entry->size advances ptr_entry past the
mapped region, causing an out-of-bounds read on the next iteration.

Add a check before dereferencing ptr_entry to ensure the entry header
is readable, and a second check after reading entry->size to ensure the
full entry stays within the mapped region.

Pass len from coreboot_table_probe() into coreboot_table_populate() to
make the mapped region size available for validation.

Signed-off-by: Titouan Ameline de Cadeville <titouan.ameline@gmail.com>
---
 drivers/firmware/google/coreboot_table.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/google/coreboot_table.c b/drivers/firmware/google/coreboot_table.c
index c769631ea15d..233939e548b4 100644
--- a/drivers/firmware/google/coreboot_table.c
+++ b/drivers/firmware/google/coreboot_table.c
@@ -112,16 +112,20 @@ void coreboot_driver_unregister(struct coreboot_driver *driver)
 }
 EXPORT_SYMBOL(coreboot_driver_unregister);
 
-static int coreboot_table_populate(struct device *dev, void *ptr)
+static int coreboot_table_populate(struct device *dev, void *ptr, resource_size_t len)
 {
 	int i, ret;
 	void *ptr_entry;
 	struct coreboot_device *device;
 	struct coreboot_table_entry *entry;
 	struct coreboot_table_header *header = ptr;
+	void *ptr_end;
 
+	ptr_end = ptr + len;
 	ptr_entry = ptr + header->header_bytes;
 	for (i = 0; i < header->table_entries; i++) {
+		if (ptr_entry + sizeof(*entry) > ptr_end)
+			return -EINVAL;
 		entry = ptr_entry;
 
 		if (entry->size < sizeof(*entry)) {
@@ -129,6 +133,9 @@ static int coreboot_table_populate(struct device *dev, void *ptr)
 			return -EINVAL;
 		}
 
+		if (ptr_entry + entry->size > ptr_end)
+			return -EINVAL;
+
 		device = kzalloc(sizeof(device->dev) + entry->size, GFP_KERNEL);
 		if (!device)
 			return -ENOMEM;
@@ -194,7 +201,7 @@ static int coreboot_table_probe(struct platform_device *pdev)
 	if (!ptr)
 		return -ENOMEM;
 
-	ret = coreboot_table_populate(dev, ptr);
+	ret = coreboot_table_populate(dev, ptr, len);
 
 	memunmap(ptr);
 
-- 
2.44.2

