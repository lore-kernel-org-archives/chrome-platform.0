Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E732DB7BD
	for <chrome-platform@lists.linux.dev>; Tue, 14 Jul 2026 09:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784020766; cv=none; b=nHOjvPf1ULckny9ONDmqbD4qNgWXvQCckMSa09pPpR54K2LVfyCPy/lwClgX2OoYCuDUzNGTaclV13g8A4lhU3VzY+kQt+vW1HBFG/N8WO/CFLGHMFgABaiV4TnVpPRxzh1UHS8oE3ALqjx/RxGgGEx37WgUvSFSEEcoeiaTmg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784020766; c=relaxed/simple;
	bh=4jrN4P13mnn3ohZ9RMlkaFWzGzgHgbyOmXepF1NqVeg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FnNq6uKC3OOuaMuowimxEFyFa4ehQl0zbZ3RFKeN41bTtGHrDVyMUXhV1nmbmRQdITJfpS8zYxTjolewgFvIJMmyVcgCF/av58BwVFnEhvYevcFSGiUQtQGKZpIXtWMnYI2inm+W/hnlpNyy2ZfRJteIvN0ADmTnBuhBY9rIeMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LVZJpq/d; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LVZJpq/d"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso6649535ad.2
        for <chrome-platform@lists.linux.dev>; Tue, 14 Jul 2026 02:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784020764; x=1784625564; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Rrqy/2ZORFonPZQa3sYu9CDFkysvk9r9jieKWYMCoxU=;
        b=LVZJpq/d6giFQ1Nw/Z3/JmP7vWyZMRF6kP0+3HBRp8j/mrzyivx7Ku3ku4YfVgxRHi
         T0YCN/HwDHZklzql8qTDQUS5cnmGQofGccI5iW2HeJ3wYM9w7QJKq2yAWlviTmB/ikYs
         ZL7h4LkEfqFYHDYJwPEhn7cm8GzBBS4ddugBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784020764; x=1784625564;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Rrqy/2ZORFonPZQa3sYu9CDFkysvk9r9jieKWYMCoxU=;
        b=pK4ZXuUrsvEMaLHa3vQvKNCLHA+KWt+f0YO7smOxQC9hRrNROROm167PEYnOfmG4CV
         e2ReB/n5gJcK1jXy41wQ+YeoUTViRbtwgKhslXXYwksXtzDFMO8OAvTo0WI9O1OKNt+y
         WqlSvVa4xbELmaMjUTCQo/8g0LVlYKRPYWLuIPtBIfJ48dCH+NZZsd8/gz3WxXiyN8KE
         VOuqxStMqJOzysAnPu7KzlGc0TY91lurn23WlsxMqGIFiIiiTg1YDUEhRwjUgvKgop17
         mCld1NuoGJBElrsSKry7R5sTxNdfCY4tT85JsYwFNTSowvoYl9bPQrRPrM/P2VTio1y8
         SGVw==
X-Gm-Message-State: AOJu0YzwJVHWUPNBVxdILkK55AKxtC5UARVVZi1Vsro/xpt1b8t4DkOB
	UVyqAmgFMtpraVNajNr58N8Nbn16hUQImObgQYP8Apu9MsboLIfktX9GtttGmLSFuI7kvbFGHFj
	qjHa6oQ==
X-Gm-Gg: AfdE7ckB5vrsOaLY60HuM6MbLH3LtnmPPUPIgu6Qbr3/1OswgrQTchKjhVYqhRdxa/2
	qg9qf+gvMBqiIBzStAbG2s+FXWhThpeO4Lt+BFbyWBHCU9PdioDFehjVN0fQIlHJYjm8D3rx3Mv
	3J/Ez3BXZ2FX1Cduu5eBqKb6e7DOJrgmZC36SPTyaUmMDEVMwmkIwJPjzAxSQA+wHAzPXL2DQer
	oRXB+iO0be9E5FfPuXuhienqNQGu+Jaq24V+vNzx/rT5h5LS+gZ8LGQUcEiv3ZnCXEK9sC/OoCB
	baYKs55XCraeQbx/LEzdD9O5UZMvpA2C3ZJpD2NhzsE+KGZdJ5LYfjSGHm1ysMpYKk9Ln7kj1gF
	W02P0I2Q9TQQYVh1/H45A11xkh6UAegf/qnpOkRsjIZazhyYSUTWkrzXwZwMkmya0sl1VhIhuTa
	U2xkcQGTvrtZ9QjQDECyzIPOqXQw/XmJze2xH9TDC9QkfDTQl8bElEfzU/kLHB9hqrul0E+LLI+
	/ip8hs=
X-Received: by 2002:a17:902:e946:b0:2ca:281:27fd with SMTP id d9443c01a7336-2ce9ee11b49mr118440995ad.25.1784020763729;
        Tue, 14 Jul 2026 02:19:23 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf8e9csm114246105ad.24.2026.07.14.02.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 02:19:23 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Tue, 14 Jul 2026 09:19:18 +0000
Subject: [PATCH] firmware: google: coreboot_table: skip no-map CBMEM
 entries
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-coreboot-v1-1-f59754d71b55@chromium.org>
X-B4-Tracking: v=1; b=H4sIABb/VWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0MT3eT8otSk/PwSXRPDxOREk2RjC+OkZCWg8oKi1LTMCrBR0bG1tQB
 zVOfdWgAAAA==
X-Change-ID: 20260714-coreboot-41aca4c383bc
To: Tzung-Bi Shih <tzungbi@kernel.org>, 
 Brian Norris <briannorris@chromium.org>, 
 Julius Werner <jwerner@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yidi Lin <yidilin@google.com>, Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.14.3

From: Yidi Lin <yidilin@google.com>

On ARM64 platforms, certain reserved memory regions (like those used
by pKVM) are marked with the 'no-map' property. This indicates that
the host kernel is forbidden from creating a structural mapping for
these regions.

The coreboot table may describe CBMEM entries that overlap with or are
entirely contained within these no-map regions. Attempting to populate
these entries as devices and subsequently remapping them can lead to
system crashes or security violations.

Refine the coreboot table population logic to verify that each CBMEM
entry resides in 'Known Good' memory before creating a device. An
entry is only considered safe if it is entirely System RAM or entirely
standard Reserved memory (tagged with IORES_DESC_RESERVED).

This dual-check ensures that:
1. ARM64 no-map regions are correctly filtered out (as they are
   neither System RAM nor tagged with the x86 reserved descriptor).
2. Standard reserved regions on x86 Chromebooks remain supported.
3. Mixed regions containing holes are safely skipped.

Signed-off-by: Yidi Lin <yidilin@google.com>
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 drivers/firmware/google/coreboot_table.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/google/coreboot_table.c b/drivers/firmware/google/coreboot_table.c
index e63933ff6747..f7357ed047e4 100644
--- a/drivers/firmware/google/coreboot_table.c
+++ b/drivers/firmware/google/coreboot_table.c
@@ -13,8 +13,10 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/ioport.h>
 #include <linux/kernel.h>
 #include <linux/device-id/coreboot.h>
+#include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -123,7 +125,7 @@ static int coreboot_table_populate(struct device *dev, void *ptr, resource_size_
 
 	ptr_end = ptr + len;
 	ptr_entry = ptr + header->header_bytes;
-	for (i = 0; i < header->table_entries; i++) {
+	for (i = 0; i < header->table_entries; i++, ptr_entry += entry->size) {
 		if (ptr_entry + sizeof(*entry) > ptr_end)
 			return -EINVAL;
 		entry = ptr_entry;
@@ -147,6 +149,23 @@ static int coreboot_table_populate(struct device *dev, void *ptr, resource_size_
 
 		switch (device->entry.tag) {
 		case LB_TAG_CBMEM_ENTRY:
+			/*
+			 * Skip entries that are not exclusively System RAM or
+			 * Reserved memory.
+			 * On ARM, no-map reserved regions are not System RAM.
+			 * On x86, CBMEM often resides in IORES_DESC_RESERVED regions.
+			 */
+			if (region_intersects(device->cbmem_entry.address,
+					      device->cbmem_entry.entry_size,
+					      IORESOURCE_SYSTEM_RAM,
+					      IORES_DESC_NONE) != REGION_INTERSECTS &&
+			    region_intersects(device->cbmem_entry.address,
+					      device->cbmem_entry.entry_size,
+					      IORESOURCE_MEM,
+					      IORES_DESC_RESERVED) != REGION_INTERSECTS) {
+				kfree(device);
+				continue;
+			}
 			dev_set_name(&device->dev, "cbmem-%08x",
 				     device->cbmem_entry.id);
 			break;
@@ -155,8 +174,6 @@ static int coreboot_table_populate(struct device *dev, void *ptr, resource_size_
 			break;
 		}
 
-		ptr_entry += entry->size;
-
 		ret = device_register(&device->dev);
 		if (ret) {
 			dev_warn(dev, "failed to register coreboot device: %d\n", ret);

---
base-commit: 3b029c035b34bbc693405ddf759f0e9b920c27f1
change-id: 20260714-coreboot-41aca4c383bc

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>

