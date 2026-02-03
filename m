Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F983A1A43
	for <chrome-platform@lists.linux.dev>; Tue,  3 Feb 2026 13:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770126956; cv=none; b=dB2BCYz10brUM68LvLS7+cK+jKaNqi99TYlaTBuy3m1oKe/HnZ9j/EMsciOYrPttCA9sq+Fv6AEJTtFPDIqP0//3avneMLVYO2IXic4N0zHnhHvUgi7p9/Ln9Vzi59wlscycOpFmB6nL/9tqHOe7K64+qejdxKQX+BgT82+jZhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770126956; c=relaxed/simple;
	bh=UCaw9VbMk3T4UCdxnz/m467CagqHQYNNaXSQW6NAoIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=boBDQMrTgrIWOLPCS1A7eKrBKmo1ShVFrEvn0cvNJn4Y7myjs0pOtAAssAuB9lMW6T2xViZc49vVoCsmqiMm7R6CF+8cxSeHUR/UGSuRxftl5onU5bipHeoM+xsfCQsLHtj6H+z6G6Z6pMQTntH8PkFRp6qy9kyRr2Skl9REUPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0BqRZtWV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zVoPj4CI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0BqRZtWV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zVoPj4CI; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0BqRZtWV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zVoPj4CI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0BqRZtWV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zVoPj4CI"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 26C845BCCD;
	Tue,  3 Feb 2026 13:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770126929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ExTemMncm5MNREj98gkbAh0WWc+sAT4FX3LuHshVjU=;
	b=0BqRZtWVlF8vBo73ZfZLPfC7QqKCDVB2AXDO35F4hkw78j4ZRgd26E3KYIfC+RrPdxQoxg
	LBE6pbHrGx4brkcSoOrEdSRL+3bwEylj7mlpMWq917Tq9d9Z8aZfVEqV5QpOsYv8NDorWQ
	aqIRwDTuLoesff5wo8YYzD5b9fNvFI8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770126929;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ExTemMncm5MNREj98gkbAh0WWc+sAT4FX3LuHshVjU=;
	b=zVoPj4CItq4d6yCxjkjY89U79ueopuI0Fp9xb/z0LFTbnWtZSzxs3OsQ+S91ig0aJno4P5
	0NO7FXwHdbsA1eCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770126929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ExTemMncm5MNREj98gkbAh0WWc+sAT4FX3LuHshVjU=;
	b=0BqRZtWVlF8vBo73ZfZLPfC7QqKCDVB2AXDO35F4hkw78j4ZRgd26E3KYIfC+RrPdxQoxg
	LBE6pbHrGx4brkcSoOrEdSRL+3bwEylj7mlpMWq917Tq9d9Z8aZfVEqV5QpOsYv8NDorWQ
	aqIRwDTuLoesff5wo8YYzD5b9fNvFI8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770126929;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ExTemMncm5MNREj98gkbAh0WWc+sAT4FX3LuHshVjU=;
	b=zVoPj4CItq4d6yCxjkjY89U79ueopuI0Fp9xb/z0LFTbnWtZSzxs3OsQ+S91ig0aJno4P5
	0NO7FXwHdbsA1eCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C108C3EA62;
	Tue,  3 Feb 2026 13:55:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GOGrLVD+gWlGDwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 03 Feb 2026 13:55:28 +0000
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
Subject: [PATCH v3 07/12] firmware: google: Clean up include statements in coreboot_table.h
Date: Tue,  3 Feb 2026 14:52:26 +0100
Message-ID: <20260203135519.417931-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203135519.417931-1-tzimmermann@suse.de>
References: <20260203135519.417931-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Include <linux/mod_devicetable.h> from source files and only forward-
declare struct coreboot_device_id in coreboot_table.h.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
Acked-by: Julius Werner <jwerner@chromium.org>
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
index 26d93781e64a..a031d6fe6bc5 100644
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
index bb6f0f7299b4..17e9e5c3f6e1 100644
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
index 07e9c7be94fa..81aa522edb1e 100644
--- a/drivers/firmware/google/framebuffer-coreboot.c
+++ b/drivers/firmware/google/framebuffer-coreboot.c
@@ -12,6 +12,7 @@
 #include <linux/device.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/platform_data/simplefb.h>
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

