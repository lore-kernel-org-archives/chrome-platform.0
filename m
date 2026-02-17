Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102FD2DF138
	for <chrome-platform@lists.linux.dev>; Tue, 17 Feb 2026 15:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771343954; cv=none; b=crvEJfYuxAMc0drFJ71V9vMhodzN7ovH0h9VblARKWNJjp5f+ND2g5JUMsnuFnc+4yuHMhnZQHR3F0vW3tY4dT9/9FWa9j/HHQkVa+Eu/WjJFoaJjtnhWwkn5XJHAJhMdqxHoQROWFxb0rxBGZqJC3ramMrpvdlVQ2ZN3noQDaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771343954; c=relaxed/simple;
	bh=UCaw9VbMk3T4UCdxnz/m467CagqHQYNNaXSQW6NAoIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dWBAbrDUPm5tNCd0r594zpNMr532bkkztIhhZPEGW3tSolVTsZDjnt6gIbYGp91jLG6oFgtVkdbCIDZn29MhYka3imcdOdvOIBIe8gihVNLbdhSyzTxmWhVDjF8PItVG3wDmkdAXn0D097o2kjjPPZTeaEeOAeNSCbk6aiOfGFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uTL8lYRV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SlSJYxKa; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uTL8lYRV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SlSJYxKa; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uTL8lYRV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SlSJYxKa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uTL8lYRV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SlSJYxKa"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BF90D3E7A4;
	Tue, 17 Feb 2026 15:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771343923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ExTemMncm5MNREj98gkbAh0WWc+sAT4FX3LuHshVjU=;
	b=uTL8lYRVKOJiBUHMULqa1QV9FM/Mu3bRh85duLOjMTJiFmKN/ZY/RDtbtJyXS3XqiNU1dQ
	WwEJvGnutOCsmmpN2ilY6196KhuyGeC3f5MhFqeUdEiQb7UBp0vbUew6kucuF//kkyv2FO
	GCKtSytIfNqZAHGofnV+AK9/TqCbVIw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771343923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ExTemMncm5MNREj98gkbAh0WWc+sAT4FX3LuHshVjU=;
	b=SlSJYxKaWDmeEx+STkAVCtQz1TvFH327RciDm7SzL4TJDIqOJxfA3GajGNf7lGvikOx+08
	oUEe4+xhkoNgSbBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771343923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ExTemMncm5MNREj98gkbAh0WWc+sAT4FX3LuHshVjU=;
	b=uTL8lYRVKOJiBUHMULqa1QV9FM/Mu3bRh85duLOjMTJiFmKN/ZY/RDtbtJyXS3XqiNU1dQ
	WwEJvGnutOCsmmpN2ilY6196KhuyGeC3f5MhFqeUdEiQb7UBp0vbUew6kucuF//kkyv2FO
	GCKtSytIfNqZAHGofnV+AK9/TqCbVIw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771343923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ExTemMncm5MNREj98gkbAh0WWc+sAT4FX3LuHshVjU=;
	b=SlSJYxKaWDmeEx+STkAVCtQz1TvFH327RciDm7SzL4TJDIqOJxfA3GajGNf7lGvikOx+08
	oUEe4+xhkoNgSbBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5FDAF3EA65;
	Tue, 17 Feb 2026 15:58:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gNwyFjOQlGk9PgAAD6G6ig
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
Subject: [PATCH v4 07/12] firmware: google: Clean up include statements in coreboot_table.h
Date: Tue, 17 Feb 2026 16:56:17 +0100
Message-ID: <20260217155836.96267-8-tzimmermann@suse.de>
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

