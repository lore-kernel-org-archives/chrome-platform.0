Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0CB14BF92
	for <chrome-platform@lists.linux.dev>; Thu, 15 Jan 2026 08:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768465334; cv=none; b=ACl3fqEuOtJfDZSxgKIURAmBRYXaBoVK7ypEw50Alk4kzXHAX6OrvNJXPQDWSzJYkp1CIFE3R9m0hiW9nO8QlUpuClW4szrCZxxV9+AbD2/ec6c7G+oAuIXV3oXRT4USvbcxrOqlR7LlCzCg6A7Z/s0oSVgFcK7Tdv3vQGXVRac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768465334; c=relaxed/simple;
	bh=6hq2x5UW9+jqFyy7ct+UgPSPayxR08SprU7MBuhPGno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rKqf2xw+d3inNvvCzndgIdhhchNth+GIWMgVNBakSIUHS82ziHZ7dvYViHz/sS70pH0dDT7BxftoU/43vrXrTyl/3rI9PEr4WKqM/TUY/GpmPIOdglwdpNm9O67b3Fk8VFDhX2ptpCYG9z7KaxLLfCnDaM7ezACtjtIesierXH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YBUOKlwR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7x+PRbkA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YBUOKlwR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7x+PRbkA; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YBUOKlwR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7x+PRbkA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YBUOKlwR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7x+PRbkA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CCFB93373B;
	Thu, 15 Jan 2026 08:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768465294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u+DKhQOallnoKdrJ1rYx3nsOYbRz7JXQtGUmUHBoJ2g=;
	b=YBUOKlwRbLNCaIVNBqTYbDn7Mrqck3JYJv4+y4t6Z71H8NnwbH1QeIblGV6I7bqErZyx+x
	f7Y4usd3A5OMXHppstwLaeCYrddW5lTy9iDZpUv5EkL/nbILptX9IB5b/ynFlf5uHKyf7C
	Ax++XC97Zxhf/bexkNWQJs1Mgksf5xk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768465294;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u+DKhQOallnoKdrJ1rYx3nsOYbRz7JXQtGUmUHBoJ2g=;
	b=7x+PRbkAvyalfPozXNP7Xpf6ogevnT/rBYNdwoktSRsQQdcM9CG5XqKymbaLv5Zrszf2Ih
	5bAAG28jwLjB/gAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768465294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u+DKhQOallnoKdrJ1rYx3nsOYbRz7JXQtGUmUHBoJ2g=;
	b=YBUOKlwRbLNCaIVNBqTYbDn7Mrqck3JYJv4+y4t6Z71H8NnwbH1QeIblGV6I7bqErZyx+x
	f7Y4usd3A5OMXHppstwLaeCYrddW5lTy9iDZpUv5EkL/nbILptX9IB5b/ynFlf5uHKyf7C
	Ax++XC97Zxhf/bexkNWQJs1Mgksf5xk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768465294;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u+DKhQOallnoKdrJ1rYx3nsOYbRz7JXQtGUmUHBoJ2g=;
	b=7x+PRbkAvyalfPozXNP7Xpf6ogevnT/rBYNdwoktSRsQQdcM9CG5XqKymbaLv5Zrszf2Ih
	5bAAG28jwLjB/gAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7D12D3EA63;
	Thu, 15 Jan 2026 08:21:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eLBVHY6jaGkjBQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 15 Jan 2026 08:21:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tzungbi@kernel.org,
	briannorris@chromium.org,
	jwerner@chromium.org,
	javierm@redhat.com,
	samuel@sholland.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 08/12] firmware: google: Export coreboot table entries
Date: Thu, 15 Jan 2026 08:57:18 +0100
Message-ID: <20260115082128.12460-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115082128.12460-1-tzimmermann@suse.de>
References: <20260115082128.12460-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[kernel.org,chromium.org,redhat.com,sholland.org,linux.intel.com,gmail.com,ffwll.ch];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLf8s8spogujn9h9roxabhn3pd)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Flag: NO

Move types for coreboot table entries to <linux/coreboot.h>. Allows
drivers in other subsystems to use these structures.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 MAINTAINERS                                   |  1 +
 drivers/firmware/google/coreboot_table.c      | 10 +++
 drivers/firmware/google/coreboot_table.h      | 60 +----------------
 .../firmware/google/framebuffer-coreboot.c    |  2 -
 include/linux/coreboot.h                      | 66 +++++++++++++++++++
 5 files changed, 78 insertions(+), 61 deletions(-)
 create mode 100644 include/linux/coreboot.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 0f244cf0b5c5..820d31fb8986 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10737,6 +10737,7 @@ L:	chrome-platform@lists.linux.dev
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
 F:	drivers/firmware/google/
+F:	include/linux/coreboot.h
 
 GOOGLE TENSOR SoC SUPPORT
 M:	Peter Griffin <peter.griffin@linaro.org>
diff --git a/drivers/firmware/google/coreboot_table.c b/drivers/firmware/google/coreboot_table.c
index a031d6fe6bc5..c769631ea15d 100644
--- a/drivers/firmware/google/coreboot_table.c
+++ b/drivers/firmware/google/coreboot_table.c
@@ -22,6 +22,16 @@
 
 #include "coreboot_table.h"
 
+/* Coreboot table header structure */
+struct coreboot_table_header {
+	char signature[4];
+	u32 header_bytes;
+	u32 header_checksum;
+	u32 table_bytes;
+	u32 table_checksum;
+	u32 table_entries;
+};
+
 #define CB_DEV(d) container_of(d, struct coreboot_device, dev)
 #define CB_DRV(d) container_of_const(d, struct coreboot_driver, drv)
 
diff --git a/drivers/firmware/google/coreboot_table.h b/drivers/firmware/google/coreboot_table.h
index 17e9e5c3f6e1..616ca3903e5c 100644
--- a/drivers/firmware/google/coreboot_table.h
+++ b/drivers/firmware/google/coreboot_table.h
@@ -12,67 +12,9 @@
 #ifndef __COREBOOT_TABLE_H
 #define __COREBOOT_TABLE_H
 
+#include <linux/coreboot.h>
 #include <linux/device.h>
 
-struct coreboot_device_id;
-
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
-/* List of coreboot entry structures that is used */
-/* Generic */
-struct coreboot_table_entry {
-	u32 tag;
-	u32 size;
-};
-
-/* Points to a CBMEM entry */
-struct lb_cbmem_ref {
-	u32 tag;
-	u32 size;
-
-	u64 cbmem_addr;
-};
-
-#define LB_TAG_CBMEM_ENTRY 0x31
-
-/* Corresponds to LB_TAG_CBMEM_ENTRY */
-struct lb_cbmem_entry {
-	u32 tag;
-	u32 size;
-
-	u64 address;
-	u32 entry_size;
-	u32 id;
-};
-
-/* Describes framebuffer setup by coreboot */
-struct lb_framebuffer {
-	u32 tag;
-	u32 size;
-
-	u64 physical_address;
-	u32 x_resolution;
-	u32 y_resolution;
-	u32 bytes_per_line;
-	u8  bits_per_pixel;
-	u8  red_mask_pos;
-	u8  red_mask_size;
-	u8  green_mask_pos;
-	u8  green_mask_size;
-	u8  blue_mask_pos;
-	u8  blue_mask_size;
-	u8  reserved_mask_pos;
-	u8  reserved_mask_size;
-};
-
 /* A device, additionally with information from coreboot. */
 struct coreboot_device {
 	struct device dev;
diff --git a/drivers/firmware/google/framebuffer-coreboot.c b/drivers/firmware/google/framebuffer-coreboot.c
index 703dd4f5d930..2d468d055872 100644
--- a/drivers/firmware/google/framebuffer-coreboot.c
+++ b/drivers/firmware/google/framebuffer-coreboot.c
@@ -21,8 +21,6 @@
 
 #include "coreboot_table.h"
 
-#define CB_TAG_FRAMEBUFFER 0x12
-
 #if defined(CONFIG_PCI)
 static bool framebuffer_pci_dev_is_enabled(struct pci_dev *pdev)
 {
diff --git a/include/linux/coreboot.h b/include/linux/coreboot.h
new file mode 100644
index 000000000000..48705b439c6e
--- /dev/null
+++ b/include/linux/coreboot.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * coreboot.h
+ *
+ * Coreboot device and driver interfaces.
+ *
+ * Copyright 2014 Gerd Hoffmann <kraxel@redhat.com>
+ * Copyright 2017 Google Inc.
+ * Copyright 2017 Samuel Holland <samuel@sholland.org>
+ */
+
+#ifndef _LINUX_COREBOOT_H
+#define _LINUX_COREBOOT_H
+
+#include <linux/types.h>
+
+/* List of coreboot entry structures that is used */
+
+#define CB_TAG_FRAMEBUFFER 0x12
+#define LB_TAG_CBMEM_ENTRY 0x31
+
+/* Generic */
+struct coreboot_table_entry {
+	u32 tag;
+	u32 size;
+};
+
+/* Points to a CBMEM entry */
+struct lb_cbmem_ref {
+	u32 tag;
+	u32 size;
+
+	u64 cbmem_addr;
+};
+
+/* Corresponds to LB_TAG_CBMEM_ENTRY */
+struct lb_cbmem_entry {
+	u32 tag;
+	u32 size;
+
+	u64 address;
+	u32 entry_size;
+	u32 id;
+};
+
+/* Describes framebuffer setup by coreboot */
+struct lb_framebuffer {
+	u32 tag;
+	u32 size;
+
+	u64 physical_address;
+	u32 x_resolution;
+	u32 y_resolution;
+	u32 bytes_per_line;
+	u8  bits_per_pixel;
+	u8  red_mask_pos;
+	u8  red_mask_size;
+	u8  green_mask_pos;
+	u8  green_mask_size;
+	u8  blue_mask_pos;
+	u8  blue_mask_size;
+	u8  reserved_mask_pos;
+	u8  reserved_mask_size;
+};
+
+#endif /* _LINUX_COREBOOT_H */
-- 
2.52.0

