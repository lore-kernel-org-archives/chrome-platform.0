Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A0718A6AD
	for <chrome-platform@lists.linux.dev>; Thu, 12 Jun 2025 14:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749737192; cv=none; b=FqIYq3F+YHYqJCK1nQqB3+p/fhwPDD/0rH22TUpXPHbJeMzfStYFE3S7R9ImsoiD1N1Jk/P29kIkS21vx4KeFPUMuEBnBFVPztXHFvGO9NglPEY6qZx39vd9ALrg/QG19RC2lAH5lh8Fj6OUdiyqDKfTIP/4BDoUtpZH2EeafYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749737192; c=relaxed/simple;
	bh=FZoq1YD3TUV43K8H/bkJmTG+zygwAdPDC0bLGs1RiQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cZ+GUiHMDxMd+UiW6D+9i/2kaAkG3vDg9rOzmRyrzgwkXzZTOaKfsLkpgL4vvrJ3t+wiNiwJvfS2wF2VyZn7nWDeVRxONckkhD9ArG6wnv6KKjLHt+n10cs3i/Xil0adEaeJpffR99vdkXUCNSxkJ4ymDjf4my3hx/s1su9IR6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=ZZiN8jOA; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="ZZiN8jOA"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a53359dea5so693792f8f.0
        for <chrome-platform@lists.linux.dev>; Thu, 12 Jun 2025 07:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1749737188; x=1750341988; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTQZFYiB4NXt/ECryK4Vh1lbcJp1CEfXh3FvCrufPYY=;
        b=ZZiN8jOAY5xWaNUY2qjtVPIPDFzbgdrBwvstNNNZ6zIm57jHrqnBMUbMva4ZbMqyul
         o402u4EDl9a6YGlJXfI1gxY/8P94uoqaBiO/PEwzXSlwnAkqIUSUkBhLchwJ16hgiYKE
         b+pG3w+mBjOLa61A6+ivCrxPklJ5MTsAsLQH1fXM4E8Eiyj3ojMq1mx69dXmMHd8N7Vb
         giqPwUQXRuugDSBJUI1b9QxLvp14liZY87DtWz6t4gNME8dzPQAYOax9QPWz4NfAckhv
         nUzZnwjK4P04etYpI/5F4OdjlRW84QHXcTMv8nHyONax6EAxYzerW8fx03HLX5BEWTq2
         /h5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749737188; x=1750341988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTQZFYiB4NXt/ECryK4Vh1lbcJp1CEfXh3FvCrufPYY=;
        b=ZAhcHZGCfK45L038KsKryRrCj7IPEjOYos2F/y5+gyMOWjl/LXnZWtVG6s4s9GuOwh
         c4o11ufpUzs1JwR6ecZ3VosnWPru7dDT36gVfPuPMkT+eSX4SzUMJiuJ1ufr7TpeFX1L
         IG5NNQTNvJtj89yeqjdOyzIsvH0AWTBfdG9kdAuXYc2Dt2PWkh3eH04N/fKHWU0ABI4t
         QZQYY9xRutKEw3sC1eS0WKgy0cWqRc5fAmU+g3ZkHt/EYDcuLayxSpR0BRfr7Hz++l85
         r0EEYxpl//JOZKwWFKjUt3nvcKUpjqI4uy2aPAgw0bzdTPTCmWDDAojDwY865Ar6I+KZ
         2JgA==
X-Forwarded-Encrypted: i=1; AJvYcCX2r0wFP8TJz5E4aA8GzCxfv5nmUT8t6GMEyMPkQ14VuVvXcjl9XWv656mYCeWrkMNy2A+1pht1P5Tyqb1wqR0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGWBioAcCO9ZvKwGakg38//N4L+hHgBgncDrQvC0FEyyZJEdwE
	JgH0qZ2pAlqUvpYOzqjaXCilXxvRDCzXjyN2ZRd7wqZenLwJPaevjQWKoOZ+k+eX4w==
X-Gm-Gg: ASbGnctb39AcsRFxfk4ls4oyS7gRbJkvqJZlbubG5xvbmVVaTUa8fZ0IspbpPKmhj1j
	wYhXg2ZRr3F0R+qSs44ZpD9zRmbwktcgdsz5lc7N7ojGnQKu23Hld7p0yfvjuFpH5VXZRG5CIQg
	e805ugZq4RfrhZRHi3WRboPl541ZDSsAjEa8QzlG72drCFKFi5Qpbn33QUOa3KBeMrT4SBbYdjP
	ljg5xip1eeVD3yXf2vY8MocT/qfSgE3f/ryLJ5MNoyHWVkKWg/taAZM047oiVyphC/PFmwCQBBP
	TCxzVYRu3HL00nH6VVaUAQsN+ZFFq9HYKdZ/ikojiR/Hhy7gI8KGPXJSQ8J+hJL1ajd1ealiOE9
	j2M57ZzE8WiotcFrTN4Bo8PWvkM5M44zY74xU8AgKSE/Pqno5cFlaSKoiZThbDw==
X-Google-Smtp-Source: AGHT+IGI00Q6YIMHbSANMSDLS5LglERhtsWYB9gZJltWUzVNiYCfyWZ6zBltyt3gAZHRC+E6Vgy1RA==
X-Received: by 2002:a5d:64c8:0:b0:3a4:d0ed:257b with SMTP id ffacd0b85a97d-3a567987728mr33280f8f.22.1749737188086;
        Thu, 12 Jun 2025 07:06:28 -0700 (PDT)
Received: from cyber-t14sg4.sec.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561a3ce6bsm2078875f8f.49.2025.06.12.07.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 07:06:27 -0700 (PDT)
From: Michal Gorlas <michal.gorlas@9elements.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>
Cc: marcello.bauer@9elements.com,
	Michal Gorlas <michal.gorlas@9elements.com>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] firmware: coreboot: support for parsing SMM related informations from coreboot tables
Date: Thu, 12 Jun 2025 16:05:48 +0200
Message-ID: <815080fae73a4e879bae4851367ac7c0ad2cd551.1749734094.git.michal.gorlas@9elements.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749734094.git.michal.gorlas@9elements.com>
References: <cover.1749734094.git.michal.gorlas@9elements.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

coreboot exposes (S)MM related data in the coreboot table. Extends existing interface,
with structure corresponding to (S)MM data, and adds parser. Parser exposes this data
to the modules executed later.

Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
---
 drivers/firmware/google/Kconfig          | 12 +++++
 drivers/firmware/google/Makefile         |  3 ++
 drivers/firmware/google/coreboot_table.h | 34 ++++++++-----
 drivers/firmware/google/mm_info.c        | 63 ++++++++++++++++++++++++
 drivers/firmware/google/mm_payload.h     | 58 ++++++++++++++++++++++
 5 files changed, 158 insertions(+), 12 deletions(-)
 create mode 100644 drivers/firmware/google/mm_info.c
 create mode 100644 drivers/firmware/google/mm_payload.h

diff --git a/drivers/firmware/google/Kconfig b/drivers/firmware/google/Kconfig
index 41b78f5cb735..5d918c076f25 100644
--- a/drivers/firmware/google/Kconfig
+++ b/drivers/firmware/google/Kconfig
@@ -81,4 +81,16 @@ config GOOGLE_VPD
 	  This option enables the kernel to expose the content of Google VPD
 	  under /sys/firmware/vpd.
 
+config COREBOOT_PAYLOAD_MM
+	tristate "SMI handling in Linux (LinuxBootSMM)"
+	depends on GOOGLE_COREBOOT_TABLE
+	help
+	  Enables support for SMI handling by Linux-owned code.
+	  coreboot reserves region for payload-owned SMI handler, the Linux
+	  driver prepares its SMI handler outside of SMRAM, and lets coreboot
+	  know where the handler is placed by issuing an SMI. On this SMI, the
+	  handler is being placed in SMRAM and all supported SMIs from that point
+	  on are handled by Linux-owned SMI handler.
+	  If in doubt, say N.
+
 endif # GOOGLE_FIRMWARE
diff --git a/drivers/firmware/google/Makefile b/drivers/firmware/google/Makefile
index 8151e323cc43..d2a690e8379d 100644
--- a/drivers/firmware/google/Makefile
+++ b/drivers/firmware/google/Makefile
@@ -12,3 +12,6 @@ obj-$(CONFIG_GOOGLE_CBMEM)		+= cbmem.o
 
 vpd-sysfs-y := vpd.o vpd_decode.o
 obj-$(CONFIG_GOOGLE_VPD)		+= vpd-sysfs.o
+
+# LinuxBootSMM related.
+obj-$(CONFIG_COREBOOT_PAYLOAD_MM)		+= mm_info.o
diff --git a/drivers/firmware/google/coreboot_table.h b/drivers/firmware/google/coreboot_table.h
index bb6f0f7299b4..e0b087933c5a 100644
--- a/drivers/firmware/google/coreboot_table.h
+++ b/drivers/firmware/google/coreboot_table.h
@@ -41,7 +41,6 @@ struct lb_cbmem_ref {
 };
 
 #define LB_TAG_CBMEM_ENTRY 0x31
-
 /* Corresponds to LB_TAG_CBMEM_ENTRY */
 struct lb_cbmem_entry {
 	u32 tag;
@@ -52,6 +51,16 @@ struct lb_cbmem_entry {
 	u32 id;
 };
 
+/* Corresponds to LB_TAG_PLD_MM_INTERFACE_INFO */
+#define LB_TAG_PLD_MM_INTERFACE_INFO 0x3b
+struct lb_pld_mm_interface_info {
+	u32 tag;
+	u32 size;
+	u8 revision;
+	u8 requires_long_mode_call;
+	u8 register_mm_entry_command;
+};
+
 /* Describes framebuffer setup by coreboot */
 struct lb_framebuffer {
 	u32 tag;
@@ -61,15 +70,15 @@ struct lb_framebuffer {
 	u32 x_resolution;
 	u32 y_resolution;
 	u32 bytes_per_line;
-	u8  bits_per_pixel;
-	u8  red_mask_pos;
-	u8  red_mask_size;
-	u8  green_mask_pos;
-	u8  green_mask_size;
-	u8  blue_mask_pos;
-	u8  blue_mask_size;
-	u8  reserved_mask_pos;
-	u8  reserved_mask_size;
+	u8 bits_per_pixel;
+	u8 red_mask_pos;
+	u8 red_mask_size;
+	u8 green_mask_pos;
+	u8 green_mask_size;
+	u8 blue_mask_pos;
+	u8 blue_mask_size;
+	u8 reserved_mask_pos;
+	u8 reserved_mask_size;
 };
 
 /* A device, additionally with information from coreboot. */
@@ -80,6 +89,7 @@ struct coreboot_device {
 		struct lb_cbmem_ref cbmem_ref;
 		struct lb_cbmem_entry cbmem_entry;
 		struct lb_framebuffer framebuffer;
+		struct lb_pld_mm_interface_info mm_info;
 		DECLARE_FLEX_ARRAY(u8, raw);
 	};
 };
@@ -112,8 +122,8 @@ void coreboot_driver_unregister(struct coreboot_driver *driver);
  * boilerplate.  Each module may only use this macro once, and
  * calling it replaces module_init() and module_exit()
  */
-#define module_coreboot_driver(__coreboot_driver) \
+#define module_coreboot_driver(__coreboot_driver)                  \
 	module_driver(__coreboot_driver, coreboot_driver_register, \
-			coreboot_driver_unregister)
+		      coreboot_driver_unregister)
 
 #endif /* __COREBOOT_TABLE_H */
diff --git a/drivers/firmware/google/mm_info.c b/drivers/firmware/google/mm_info.c
new file mode 100644
index 000000000000..55bcdc8b8d53
--- /dev/null
+++ b/drivers/firmware/google/mm_info.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * mm_info.c
+ *
+ * Driver for exporting MM payload information from coreboot table.
+ *
+ * Copyright 2025 9elements gmbh
+ * Copyright 2025 Michal Gorlas <michal.gorlas@9elements.com>
+ */
+
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+
+#include "coreboot_table.h"
+#include "mm_payload.h"
+
+static struct lb_pld_mm_interface_info *mm_cbtable_info;
+struct mm_info *mm_info;
+
+static int mm_driver_probe(struct coreboot_device *dev)
+{
+	mm_cbtable_info = &dev->mm_info;
+	if (mm_cbtable_info->tag != LB_TAG_PLD_MM_INTERFACE_INFO)
+		return -ENXIO;
+
+	mm_info = kmalloc(sizeof(*mm_info), GFP_KERNEL);
+	mm_info->revision = mm_cbtable_info->revision;
+	mm_info->requires_long_mode_call =
+		mm_cbtable_info->requires_long_mode_call;
+	mm_info->register_mm_entry_command =
+		mm_cbtable_info->register_mm_entry_command;
+	return 0;
+}
+EXPORT_SYMBOL(mm_info);
+
+static void mm_driver_remove(struct coreboot_device *dev)
+{
+	if (mm_info)
+		kfree(mm_info);
+}
+
+static const struct coreboot_device_id mm_info_ids[] = {
+	{ .tag = LB_TAG_PLD_MM_INTERFACE_INFO },
+	{ /* sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(coreboot, mm_info_ids);
+
+static struct coreboot_driver mm_driver = {
+	.probe = mm_driver_probe,
+	.remove = mm_driver_remove,
+	.drv = {
+		.name = "mm_info",
+	},
+	.id_table = mm_info_ids,
+};
+
+module_coreboot_driver(mm_driver);
+
+MODULE_AUTHOR("Michal Gorlas <michal.gorlas@9elements.com>");
+MODULE_DESCRIPTION("Driver for exporting MM info from coreboot table");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/firmware/google/mm_payload.h b/drivers/firmware/google/mm_payload.h
new file mode 100644
index 000000000000..bb2f55c4f240
--- /dev/null
+++ b/drivers/firmware/google/mm_payload.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * mm_payload.h
+ *
+ * Internal header for MM payload driver.
+ *
+ * Copyright 2025 9elements gmbh
+ * Copyright 2025 Michal Gorlas <michal.gorlas@9elements.com>
+ */
+
+#ifndef __MM_PAYLOAD_H
+#define __MM_PAYLOAD_H
+
+#define PAYLOAD_MM_RET_SUCCESS 0
+#define PAYLOAD_MM_RET_FAILURE 1
+#define PAYLOAD_MM_REGISTER_ENTRY 2
+
+#define REALMODE_END_SIGNATURE	0x65a22c82
+
+struct mm_info {
+	u8 revision;
+	u8 requires_long_mode_call;
+	u8 register_mm_entry_command;
+};
+
+extern struct mm_info *mm_info;
+
+#ifndef __ASSEMBLY__
+
+#include <linux/types.h>
+
+/* This must match data at mm_handler/mm_header.S */
+struct mm_header {
+	u32	text_start;
+	u32	mm_entry_32;
+	u32	mm_entry_64;
+	u32	mm_signature;
+	u32	mm_blob_size;
+};
+
+extern struct mm_header *mm_header;
+extern unsigned char mm_blob_end[];
+
+extern unsigned char mm_blob[];
+extern unsigned char mm_relocs[];
+
+/*
+ * This has to be under 1MB (see tseg_region.c in coreboot source tree).
+ * The actual check for this is made in coreboot after we fill the header
+ * (see above) with the blob size.
+ */
+static inline size_t mm_payload_size_needed(void)
+{
+	return mm_blob_end - mm_blob;
+}
+
+#endif /* __ASSEMBLER__ */
+#endif /* __MM_PAYLOAD_H */
-- 
2.49.0

