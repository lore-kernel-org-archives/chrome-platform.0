Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13FF267B02
	for <chrome-platform@lists.linux.dev>; Thu,  8 Jan 2026 14:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767883873; cv=none; b=S2C9ZSoYwyIc+O72Gvyd5CpMH6SD9MZlNc37VENEfv0AFuJS9nZQwsTmRt2vd814XG/iSrEy+DgrFdTXDtSW3CMmuARCnIoi5ICtWa4EJHXuKVf9m8dJYm0/ypEZGo6wZdr1kafVjoV861Zf4EA6ybT+jRexgjFg04QSwPaeSto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767883873; c=relaxed/simple;
	bh=yB31il+2rV1VowClleA9b509bRdgvzEYY4u4kamm8Xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JCpz1zmn35kV5cLYBlVoC7+ywJ8nV872WVa0/qowl8yyF9EERBYMm0QoFjkepN1BqURMz7Trq1uXQR6jxXEg1dwx4T5R1cI1tYAm4ycAsu6inPoFYT1Gv5Il45kaMJdXbUnpMFdRel0UF9bD8IvZAg2pqOyOcdUhpRaC+jRF3CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6D46B34307;
	Thu,  8 Jan 2026 14:51:03 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2764A3EA63;
	Thu,  8 Jan 2026 14:51:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4CFkCFfEX2n0WQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 08 Jan 2026 14:51:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tzungbi@kernel.org,
	briannorris@chromium.org,
	jwerner@chromium.org,
	javierm@redhat.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/8] firmware: google: Export coreboot driver and device interfaces
Date: Thu,  8 Jan 2026 15:19:44 +0100
Message-ID: <20260108145058.56943-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108145058.56943-1-tzimmermann@suse.de>
References: <20260108145058.56943-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 6D46B34307
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

Split coreboot_table.h: move struct coreboot_table_header into
coreboot_table.h and the rest of the header to include/linux/coreboot.h.

Prepares coreboot for allowing drivers in other subsystems.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/firmware/google/cbmem.c               |  3 +--
 drivers/firmware/google/coreboot_table.c      | 11 +++++++-
 .../firmware/google/framebuffer-coreboot.c    |  3 +--
 drivers/firmware/google/memconsole-coreboot.c |  2 +-
 drivers/firmware/google/vpd.c                 |  2 +-
 .../linux/coreboot.h                          | 27 +++++++------------
 6 files changed, 23 insertions(+), 25 deletions(-)
 rename drivers/firmware/google/coreboot_table.h => include/linux/coreboot.h (88%)

diff --git a/drivers/firmware/google/cbmem.c b/drivers/firmware/google/cbmem.c
index 3397bacdfdbe..b3e477d9ad4e 100644
--- a/drivers/firmware/google/cbmem.c
+++ b/drivers/firmware/google/cbmem.c
@@ -7,6 +7,7 @@
  * Copyright 2022 Google LLC
  */
 
+#include <linux/coreboot.h>
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -18,8 +19,6 @@
 #include <linux/slab.h>
 #include <linux/sysfs.h>
 
-#include "coreboot_table.h"
-
 struct cbmem_entry {
 	char *mem_file_buf;
 	u32 size;
diff --git a/drivers/firmware/google/coreboot_table.c b/drivers/firmware/google/coreboot_table.c
index ae20c0527032..3b07e1d60255 100644
--- a/drivers/firmware/google/coreboot_table.c
+++ b/drivers/firmware/google/coreboot_table.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/coreboot.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -21,7 +22,15 @@
 #include <linux/slab.h>
 #include <linux/sysfb.h>
 
-#include "coreboot_table.h"
+/* Coreboot table header structure */
+struct coreboot_table_header {
+	char signature[4];
+	u32 header_bytes;
+	u32 header_checksum;
+	u32 table_bytes;
+	u32 table_checksum;
+	u32 table_entries;
+};
 
 #define CB_DEV(d) container_of(d, struct coreboot_device, dev)
 #define CB_DRV(d) container_of_const(d, struct coreboot_driver, drv)
diff --git a/drivers/firmware/google/framebuffer-coreboot.c b/drivers/firmware/google/framebuffer-coreboot.c
index 7ac9dc4f5392..88815e0abb3f 100644
--- a/drivers/firmware/google/framebuffer-coreboot.c
+++ b/drivers/firmware/google/framebuffer-coreboot.c
@@ -9,6 +9,7 @@
  * Copyright 2017 Samuel Holland <samuel@sholland.org>
  */
 
+#include <linux/coreboot.h>
 #include <linux/device.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
@@ -17,8 +18,6 @@
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
 
-#include "coreboot_table.h"
-
 static const struct simplefb_format formats[] = SIMPLEFB_FORMATS;
 
 static int framebuffer_probe(struct coreboot_device *dev)
diff --git a/drivers/firmware/google/memconsole-coreboot.c b/drivers/firmware/google/memconsole-coreboot.c
index 4aa9b1cad3c3..bc7e4bfb2d08 100644
--- a/drivers/firmware/google/memconsole-coreboot.c
+++ b/drivers/firmware/google/memconsole-coreboot.c
@@ -7,6 +7,7 @@
  * Copyright 2017 Google Inc.
  */
 
+#include <linux/coreboot.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
@@ -14,7 +15,6 @@
 #include <linux/module.h>
 
 #include "memconsole.h"
-#include "coreboot_table.h"
 
 #define CB_TAG_CBMEM_CONSOLE	0x17
 
diff --git a/drivers/firmware/google/vpd.c b/drivers/firmware/google/vpd.c
index 8d7f123f96f4..f75008b956d5 100644
--- a/drivers/firmware/google/vpd.c
+++ b/drivers/firmware/google/vpd.c
@@ -7,6 +7,7 @@
  * Copyright 2017 Google Inc.
  */
 
+#include <linux/coreboot.h>
 #include <linux/ctype.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -20,7 +21,6 @@
 #include <linux/slab.h>
 #include <linux/sysfs.h>
 
-#include "coreboot_table.h"
 #include "vpd_decode.h"
 
 #define CB_TAG_VPD      0x2c
diff --git a/drivers/firmware/google/coreboot_table.h b/include/linux/coreboot.h
similarity index 88%
rename from drivers/firmware/google/coreboot_table.h
rename to include/linux/coreboot.h
index 4c71830c98ca..26ea5eecac52 100644
--- a/drivers/firmware/google/coreboot_table.h
+++ b/include/linux/coreboot.h
@@ -1,32 +1,26 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * coreboot_table.h
+ * coreboot.h
  *
- * Internal header for coreboot table access.
+ * Coreboot device and driver interfaces.
  *
  * Copyright 2014 Gerd Hoffmann <kraxel@redhat.com>
  * Copyright 2017 Google Inc.
  * Copyright 2017 Samuel Holland <samuel@sholland.org>
  */
 
-#ifndef __COREBOOT_TABLE_H
-#define __COREBOOT_TABLE_H
+#ifndef _LINUX_COREBOOT_H
+#define _LINUX_COREBOOT_H
 
 #include <linux/device.h>
 
 struct coreboot_device_id;
 
-/* Coreboot table header structure */
-struct coreboot_table_header {
-	char signature[4];
-	u32 header_bytes;
-	u32 header_checksum;
-	u32 table_bytes;
-	u32 table_checksum;
-	u32 table_entries;
-};
-
 /* List of coreboot entry structures that is used */
+
+#define CB_TAG_FRAMEBUFFER 0x12
+#define LB_TAG_CBMEM_ENTRY 0x31
+
 /* Generic */
 struct coreboot_table_entry {
 	u32 tag;
@@ -41,9 +35,6 @@ struct lb_cbmem_ref {
 	u64 cbmem_addr;
 };
 
-#define CB_TAG_FRAMEBUFFER 0x12
-#define LB_TAG_CBMEM_ENTRY 0x31
-
 /* Corresponds to LB_TAG_CBMEM_ENTRY */
 struct lb_cbmem_entry {
 	u32 tag;
@@ -118,4 +109,4 @@ void coreboot_driver_unregister(struct coreboot_driver *driver);
 	module_driver(__coreboot_driver, coreboot_driver_register, \
 			coreboot_driver_unregister)
 
-#endif /* __COREBOOT_TABLE_H */
+#endif /* _LINUX_COREBOOT_H */
-- 
2.52.0

