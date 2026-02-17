Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B69336CE0E
	for <chrome-platform@lists.linux.dev>; Tue, 17 Feb 2026 15:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771343960; cv=none; b=MS0LbwGIv0hw5NaROQqCsguG0mzGor9SCPSYTBJhzxuXwBijoh9oKmwg7XYy8EBYegOXtQXUk98+rG/9M8QMl0xQ3TS/cwSlDXWozlynyigGDcPOA9EBOroD/YeSZnUpmLBC+YD7X9ikOeqq+x4krZwQWZf3leISCBJ9n1UP714=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771343960; c=relaxed/simple;
	bh=Jrts6IF2sTq1eUmj3qN0OF97d7AXmVclKH5q4FFwZFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V4FFa8aBRHW/Yy3ZFfIJGkJR3BteHGrHuNHA0f2/pyy+vX8KV41YROcsl/ZiW1TMO20kGbaiCwHjgHGZ70UG1oYSnlNH3sgC7gSIhkLoW79EZqem0qJayGI9wKWJfVb5NBdc+nMfYbZESWF7HtSshZhFybBnEUVaxjZMFfn5zFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pIETYSXR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lWxl58uU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pIETYSXR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lWxl58uU; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pIETYSXR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lWxl58uU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pIETYSXR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lWxl58uU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 274413E7A8;
	Tue, 17 Feb 2026 15:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771343924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hoP/xkcayTN3KE9mFVksJTkYvdxFxpTH+1afbqCoAuw=;
	b=pIETYSXRNkytQ+K3yRhOuhrE9V04MsXe/NZqCXY4BoNEevCatOfhO6PpYtUyutz7GshCi0
	3mKAraGGzAhFEORQyQ0izTWqifaZDQfWT8qb/2RabmZLqJrelVXvEDoQCvJKoUxrL/USv/
	RuxNxGdX1TyB6bfk2egQJQ8POBC6log=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771343924;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hoP/xkcayTN3KE9mFVksJTkYvdxFxpTH+1afbqCoAuw=;
	b=lWxl58uU9+xepOWlAY7b+d43qn01QKKMqUww6mOsBQG08kRWNR+X8DAlYF2FUYaiEDG88n
	Rk+dmaV34ebPaHCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pIETYSXR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lWxl58uU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771343924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hoP/xkcayTN3KE9mFVksJTkYvdxFxpTH+1afbqCoAuw=;
	b=pIETYSXRNkytQ+K3yRhOuhrE9V04MsXe/NZqCXY4BoNEevCatOfhO6PpYtUyutz7GshCi0
	3mKAraGGzAhFEORQyQ0izTWqifaZDQfWT8qb/2RabmZLqJrelVXvEDoQCvJKoUxrL/USv/
	RuxNxGdX1TyB6bfk2egQJQ8POBC6log=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771343924;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hoP/xkcayTN3KE9mFVksJTkYvdxFxpTH+1afbqCoAuw=;
	b=lWxl58uU9+xepOWlAY7b+d43qn01QKKMqUww6mOsBQG08kRWNR+X8DAlYF2FUYaiEDG88n
	Rk+dmaV34ebPaHCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BC9953EA66;
	Tue, 17 Feb 2026 15:58:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ODPbLDOQlGk9PgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 17 Feb 2026 15:58:43 +0000
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
Subject: [PATCH v4 08/12] firmware: google: Export coreboot table entries
Date: Tue, 17 Feb 2026 16:56:18 +0100
Message-ID: <20260217155836.96267-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260217155836.96267-1-tzimmermann@suse.de>
References: <20260217155836.96267-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[kernel.org,chromium.org,redhat.com,sholland.org,linux.intel.com,gmail.com,ffwll.ch];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,linaro.org:email];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLegosg57ubitsp1hzqd38n4uy)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Queue-Id: 274413E7A8
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

Move types for coreboot table entries to <linux/coreboot.h>. Allows
drivers in other subsystems to use these structures.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
Acked-by: Julius Werner <jwerner@chromium.org>
---
 MAINTAINERS                                   |  1 +
 drivers/firmware/google/coreboot_table.c      | 10 +++
 drivers/firmware/google/coreboot_table.h      | 60 +----------------
 .../firmware/google/framebuffer-coreboot.c    |  2 -
 include/linux/coreboot.h                      | 66 +++++++++++++++++++
 5 files changed, 78 insertions(+), 61 deletions(-)
 create mode 100644 include/linux/coreboot.h

diff --git a/MAINTAINERS b/MAINTAINERS
index f7b896cded67..3fb69425fe51 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10751,6 +10751,7 @@ L:	chrome-platform@lists.linux.dev
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
index 81aa522edb1e..fab3f28655d3 100644
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

