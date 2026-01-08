Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25F927FB21
	for <chrome-platform@lists.linux.dev>; Thu,  8 Jan 2026 14:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767883867; cv=none; b=rOLHhWGZ1b3GVBHkTSm7Cwa386hsvJqx2qKwf7ns/OidY2idzCVFsWEt6qYF9c+YcqQD7yScVnDURCKIHCCUieB3vXKQWk8tYwBFRF//xjx1qUwxL29wi/9wq7suOofxcJg9sFNKIARukF3NcaKYcE/ExY8MqDWf4oYiiFovraU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767883867; c=relaxed/simple;
	bh=dNSjKVpGZ0n9VCqG6jZlH2+SF7Dpdut6l3mzZVU1Ve4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GKu2dmHwp38xJrOR0KJjaht+eGNN50XdGtD3L2RqRweYcuOZ9kyvtAg3WlwhjtdO1dGgeU4KU1mLq7h6MITd3476KELlJ8FzmwmZvmrmeuMJtFhs3SzqAQwQChCGcfFk7hWDzOdRJlw4Md4obmvsqPhnxwKm8Ii+UvmuaVZtwg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2D89D3430C;
	Thu,  8 Jan 2026 14:51:03 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C47443EA65;
	Thu,  8 Jan 2026 14:51:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YJLFLlbEX2n0WQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 08 Jan 2026 14:51:02 +0000
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
Subject: [PATCH 3/8] firmware: google: Clean up include statements in coreboot_table.h
Date: Thu,  8 Jan 2026 15:19:43 +0100
Message-ID: <20260108145058.56943-4-tzimmermann@suse.de>
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
X-Spam-Score: -4.00
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 2D89D3430C
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO

Include <linux/mod_devicetable.h> from source files and only forward-
declare struct coreboot_device_id in coreboot_table.h.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/firmware/google/cbmem.c                | 1 +
 drivers/firmware/google/coreboot_table.c       | 1 +
 drivers/firmware/google/coreboot_table.h       | 3 ++-
 drivers/firmware/google/framebuffer-coreboot.c | 1 +
 drivers/firmware/google/memconsole-coreboot.c  | 1 +
 drivers/firmware/google/vpd.c                  | 1 +
 6 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/google/cbmem.c b/drivers/firmware/google/cbmem.c
index 54c3b8b05e5d..3397bacdfdbe 100644
--- a/drivers/firmware/google/cbmem.c
+++ b/drivers/firmware/google/cbmem.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/kobject.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
diff --git a/drivers/firmware/google/coreboot_table.c b/drivers/firmware/google/coreboot_table.c
index 3bee22d2a7b3..ae20c0527032 100644
--- a/drivers/firmware/google/coreboot_table.c
+++ b/drivers/firmware/google/coreboot_table.c
@@ -14,6 +14,7 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
diff --git a/drivers/firmware/google/coreboot_table.h b/drivers/firmware/google/coreboot_table.h
index e3c353676940..4c71830c98ca 100644
--- a/drivers/firmware/google/coreboot_table.h
+++ b/drivers/firmware/google/coreboot_table.h
@@ -13,7 +13,8 @@
 #define __COREBOOT_TABLE_H
 
 #include <linux/device.h>
-#include <linux/mod_devicetable.h>
+
+struct coreboot_device_id;
 
 /* Coreboot table header structure */
 struct coreboot_table_header {
diff --git a/drivers/firmware/google/framebuffer-coreboot.c b/drivers/firmware/google/framebuffer-coreboot.c
index bb53d1a47409..7ac9dc4f5392 100644
--- a/drivers/firmware/google/framebuffer-coreboot.c
+++ b/drivers/firmware/google/framebuffer-coreboot.c
@@ -12,6 +12,7 @@
 #include <linux/device.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
diff --git a/drivers/firmware/google/memconsole-coreboot.c b/drivers/firmware/google/memconsole-coreboot.c
index c5f08617aa8d..4aa9b1cad3c3 100644
--- a/drivers/firmware/google/memconsole-coreboot.c
+++ b/drivers/firmware/google/memconsole-coreboot.c
@@ -10,6 +10,7 @@
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 
 #include "memconsole.h"
diff --git a/drivers/firmware/google/vpd.c b/drivers/firmware/google/vpd.c
index 339a3f74b247..8d7f123f96f4 100644
--- a/drivers/firmware/google/vpd.c
+++ b/drivers/firmware/google/vpd.c
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/kobject.h>
 #include <linux/list.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
-- 
2.52.0

