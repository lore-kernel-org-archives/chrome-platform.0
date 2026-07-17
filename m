Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0E632B111
	for <chrome-platform@lists.linux.dev>; Fri, 17 Jul 2026 08:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277695; cv=none; b=lwPkCmJxDGXlracyM7MVgwJmWKLqR7h9nSs1EqWqOf3fFItEpMjfOb3eu2qtanMEo3Hi8oQ3Qu9poTJ67T/aelBQH1a0ZjxlMkARQfLeKXXsczEH2i9N3EFQ2uds+MAyq+0Kf4KWKLLRu16w/eX3GPl2BPGs1GiJNUU6np6/pVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277695; c=relaxed/simple;
	bh=+Y0DPYgOfaOq6dcvAzljIgj50g51fmyPo3avfZjr9HE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NzD8t56Lp97XlunMl/hQp9qm5Bz0ZnKGxmdZzSmkbIIpCy64I+Ep9RmLkCNQqJCVFswDY1njl1T1/TwDHZz5WeEqIUw4VuXthewYS5O83jZWsYsCtuIRS4A2LpB7HIrFblv/DEASmYHm09ttfsi7dWorlu8uKns2h3lq/hDgnQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NV+GSSpj; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NV+GSSpj"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-381ed661712so7777272a91.2
        for <chrome-platform@lists.linux.dev>; Fri, 17 Jul 2026 01:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784277694; x=1784882494; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EZ++5xMf9iDqzcnoRt0uMWlO+MkeMOVJyMXYGmGQ8Is=;
        b=NV+GSSpjIHLXAmr9Ns1xMM+tfOhULo2+N9XMnxHTy6mDK3NcSSi246iPE/Y7JDzmHn
         gvhr09XNB/HV+tnvc5auJq8nEbwC5Dt7rmgQZsdHdv4CAWzYuA0bALXfnG3UZElMbK42
         anhU/g7ddlf2JyXOwYgdhfyjLKsJRsGtxIt90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277694; x=1784882494;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EZ++5xMf9iDqzcnoRt0uMWlO+MkeMOVJyMXYGmGQ8Is=;
        b=sE+gkrEbsfHnn2lhSkSNDrIcbJDyqJkdCb5sMyAuOqLcegrIsekRb++N5Hiu0iDqPk
         EIkNl0o7NSLylrKC4OTpPaRyWRYDByMOxsG8xZV5Av44ZcFV7zE89r64Pvu1oBntR7dk
         J81+vwVkIMi52cdd8SNq7KbPDjXEI5KLTwLGdeRv9yxZmXzKSoV1qr5wc8taCqYhGpeu
         PtrSpsE/v2YS8GEC/LbIal2Vb+mKTC0vhkIUiL1lY9rzt0q3VH/qtgwj7wJfvVov+MFg
         QCW0KsRgdvODlAbVv1UtNUJplVUMOtyaRRD3JuB1RkWrp1vjNeTRYICMpx3w7hrFNnmW
         3N1g==
X-Gm-Message-State: AOJu0YwFVhkLi+nSS/jKgS7Ondz9fIbxCiTQIvXO3XQL4OfmhEnd4Trz
	sEhChnz2J6ILJxHLKGgHKbI0v02EVBmbihV0uG3VPGV72bJv2Jxtvv16mOl8NgFVyhKHC2YLuj3
	tpj6spg==
X-Gm-Gg: AfdE7cnbT17BoqvvTnK7DlRpUwsjBzoMYPtJMwVrEhA404DlZM9UsSwkmUdE0ScI/Cu
	uDp72LfUqt6ZdADsYpFPC4h71305frZC1Ls1L0avpdVr9EYhrQspiDEf0rekx6vRewMhRn8qXAc
	n296dNscAy69o2laIOLxJvZtxKgtBPU/3XVNIwl7Ad1DCrpzxw4F+vTSf9eLAhyxf4OO/WIGP+5
	QwO9r04CRR8zAk6tpkAOG/o2NPrVrZ0yK2QzJ3b3IYaEL63zENZct7eOKhnmLpWvyL4An6UdZsx
	7e55sDAVu7Go3kI4f5yxoPQDebrYDAmd12hxWp1m93UUYSlnw5akJVt1LcxJZUCybBn/7aEuyct
	h+rM5f3vzAK2v5ztU+S288QZLDTpK2qQhBImde8Dnn2nx4dulLM4sBM2Q+6A0SXmxWCcTBdyRJ/
	HjVyOL6DsLQegFSV70mObTvkecu+Wd/HeVC3AIfaAQE7mMRTClZueLr424my70YAA+olQ1
X-Received: by 2002:a17:90b:2692:b0:380:a568:cc4e with SMTP id 98e67ed59e1d1-38e4b3e11c8mr1622698a91.9.1784277693562;
        Fri, 17 Jul 2026 01:41:33 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bb8a4sm5100856eec.14.2026.07.17.01.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:41:33 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Fri, 17 Jul 2026 08:41:26 +0000
Subject: [PATCH v2] firmware: google: coreboot_table: skip no-map CBMEM
 entries
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-coreboot-v2-1-8f8b389e3758@chromium.org>
X-B4-Tracking: v=1; b=H4sIALbqWWoC/23MQQ6CMBCF4auQWVtDSyvqynsYFjAUOgsYMsVGQ
 7i7lbXL/+Xl2yB6IR/hXmwgPlEknnOYUwEY2nn0ivrcYEpzKWttFbL4jnlVVrfYWqyuVYeQ74v
 4gd4H9WxyB4ory+eQk/6tf5CklVaDu9XO9rXunHtgEJ7oNZ1ZRmj2ff8CMHQeJqMAAAA=
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
1. On ARM64, no-map regions are filtered out as they are IORESOURCE_MEM
   (see request_standard_resources() in arch/arm64/kernel/setup.c).
2. On x86, standard reserved regions (IORES_DESC_RESERVED) remain
   supported.

Signed-off-by: Yidi Lin <yidilin@google.com>
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Changes in v2:
- Rephrase the commit message and code comment to be clear.
- Link to v1: https://lore.kernel.org/r/20260714-coreboot-v1-1-f59754d71b55@chromium.org
---
 drivers/firmware/google/coreboot_table.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/google/coreboot_table.c b/drivers/firmware/google/coreboot_table.c
index e63933ff6747..993056a739ad 100644
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
@@ -147,6 +149,26 @@ static int coreboot_table_populate(struct device *dev, void *ptr, resource_size_
 
 		switch (device->entry.tag) {
 		case LB_TAG_CBMEM_ENTRY:
+			/*
+			 * Skip entries that are not exclusively System RAM or
+			 * Reserved memory.
+			 * On ARM64, no-map regions are filtered out as they are
+			 * IORESOURCE_MEM (see request_standard_resources() in
+			 * arch/arm64/kernel/setup.c).
+			 * On x86, CBMEM often resides in standard reserved regions
+			 * (IORES_DESC_RESERVED).
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
@@ -155,8 +177,6 @@ static int coreboot_table_populate(struct device *dev, void *ptr, resource_size_
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

