Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992841DE8A4
	for <chrome-platform@lists.linux.dev>; Thu,  8 Jan 2026 14:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767883873; cv=none; b=a52k/9r6Qu8379lkxjJYLirFU3j/XVa32tv2ky9Wa2J0W0TyFJjImBLwe9w3V60xG0cB1jdj/xKewhvYX5KO0T/uy23K/NXYKNKOCF3lyNWPz7ovD67b8kkzIlG5R9tYeM2tdmrZD7+2LGjABl8ckbNPVrtr/ME8AUkdV2H0eZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767883873; c=relaxed/simple;
	bh=VH1KTZjH+43j9Uvx+z8fRm186NkVXKhBRoS2pUmZU1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SjN12N8Een/bVPZMwQgglRsy+cs4AiLotZXW2FJIEKTEm/pa6UZFW8OdEWn1T4RBwXrQaayuAfg1suiNWxQNwdof1dFnNQLsxwCudSe0OxT63YlnJ8HnjYJcm8FOnYv1BSmGCi1+0ldKXSmMbUJBsND/AMqXthyCrltObLWz1QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 70E725C7E3;
	Thu,  8 Jan 2026 14:51:02 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 273783EA65;
	Thu,  8 Jan 2026 14:51:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YDJCCFbEX2n0WQAAD6G6ig
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
Subject: [PATCH 1/8] firmware: google: Do sysfb test before creating coreboot framebuffer
Date: Thu,  8 Jan 2026 15:19:41 +0100
Message-ID: <20260108145058.56943-2-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 70E725C7E3
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO

Test sysfb before creating the coreboot framebuffer device. Skip
device creation if the test fails, as this framebuffer does not exist.

Depending on the system setup, the initial framebuffer can be provided
by the boot loader via screen_info boot parameters and handled by the
kernel's sysfb code in drivers/firmware/sysfb.c. With the sysfb test in
the coreboot-framebuffer probing, the coreboot device is present without
the framebuffer. Even after the sysfb device has been replaced with a
native PCI device, the coreboot device persists.

Skipping device creation early avoids all these inconsistencies. It
further prepares coreboot to support graphics drivers besides the one
in framebuffer-coreboot.c.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/firmware/google/coreboot_table.c       | 17 +++++++++++++++++
 drivers/firmware/google/coreboot_table.h       |  1 +
 drivers/firmware/google/framebuffer-coreboot.c | 16 ----------------
 3 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/firmware/google/coreboot_table.c b/drivers/firmware/google/coreboot_table.c
index 882db32e51be..c34426e5002d 100644
--- a/drivers/firmware/google/coreboot_table.c
+++ b/drivers/firmware/google/coreboot_table.c
@@ -18,6 +18,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/sysfb.h>
 
 #include "coreboot_table.h"
 
@@ -118,6 +119,22 @@ static int coreboot_table_populate(struct device *dev, void *ptr)
 			return -EINVAL;
 		}
 
+		switch (entry->tag) {
+		case CB_TAG_FRAMEBUFFER:
+			/*
+			 * On coreboot systems, the advertised CB_TAG_FRAMEBUFFER entry
+			 * in the coreboot table should only be used if the payload did
+			 * not pass a framebuffer information to the Linux kernel.
+			 *
+			 * If the global screen_info data has been filled, the generic
+			 * system framebuffers (sysfb) will already register a platform
+			 * device and pass that screen_info as platform_data to a driver
+			 * that can scan-out using the system-provided framebuffer.
+			 */
+			if (sysfb_handles_screen_info())
+				continue;
+		}
+
 		device = kzalloc(sizeof(device->dev) + entry->size, GFP_KERNEL);
 		if (!device)
 			return -ENOMEM;
diff --git a/drivers/firmware/google/coreboot_table.h b/drivers/firmware/google/coreboot_table.h
index bb6f0f7299b4..e3c353676940 100644
--- a/drivers/firmware/google/coreboot_table.h
+++ b/drivers/firmware/google/coreboot_table.h
@@ -40,6 +40,7 @@ struct lb_cbmem_ref {
 	u64 cbmem_addr;
 };
 
+#define CB_TAG_FRAMEBUFFER 0x12
 #define LB_TAG_CBMEM_ENTRY 0x31
 
 /* Corresponds to LB_TAG_CBMEM_ENTRY */
diff --git a/drivers/firmware/google/framebuffer-coreboot.c b/drivers/firmware/google/framebuffer-coreboot.c
index c68c9f56370f..bb53d1a47409 100644
--- a/drivers/firmware/google/framebuffer-coreboot.c
+++ b/drivers/firmware/google/framebuffer-coreboot.c
@@ -15,12 +15,9 @@
 #include <linux/module.h>
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
-#include <linux/sysfb.h>
 
 #include "coreboot_table.h"
 
-#define CB_TAG_FRAMEBUFFER 0x12
-
 static const struct simplefb_format formats[] = SIMPLEFB_FORMATS;
 
 static int framebuffer_probe(struct coreboot_device *dev)
@@ -37,19 +34,6 @@ static int framebuffer_probe(struct coreboot_device *dev)
 		.format = NULL,
 	};
 
-	/*
-	 * On coreboot systems, the advertised LB_TAG_FRAMEBUFFER entry
-	 * in the coreboot table should only be used if the payload did
-	 * not pass a framebuffer information to the Linux kernel.
-	 *
-	 * If the global screen_info data has been filled, the Generic
-	 * System Framebuffers (sysfb) will already register a platform
-	 * device and pass that screen_info as platform_data to a driver
-	 * that can scan-out using the system provided framebuffer.
-	 */
-	if (sysfb_handles_screen_info())
-		return -ENODEV;
-
 	if (!fb->physical_address)
 		return -ENODEV;
 
-- 
2.52.0

