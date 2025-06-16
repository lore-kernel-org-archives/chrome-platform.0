Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861501B6D08
	for <chrome-platform@lists.linux.dev>; Mon, 16 Jun 2025 14:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750082497; cv=none; b=gaSnrqE0dwSIy8cPKAzetS7frALPGxrrLfhm/SKma/Uwh6svYS/vpec8f1/3Oj3fHK1VYOqTQijzmUC3y624aQ6R32d/drt74U8DrWJyrJ2whK5pC5Rxwfgsi/3tL2quUusHrmyyQ/yieOjU7BcqBUdJEeHX/NwSIrH9rkZv8KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750082497; c=relaxed/simple;
	bh=CwNEm2c1yMybTDi2wpi4phfmWJ/6HSgbF3FZfUxeEzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZbyeUVCeZ6T1nubhkCAf/ueAQpTmKDngky33X/+qLeKod8oq1K5qkaEetVbMGVseMzyW12seYkmXhJkKLwCkOiQqbG9cJWEv8nGqHOLCmJ73WnCbxPBfiF70bPF+r3pn8HKIY1jyObqrmpIyI5vfLcleA2iEXU8E7t3M+fgcLEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=eYxO2TDz; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="eYxO2TDz"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso4470042f8f.1
        for <chrome-platform@lists.linux.dev>; Mon, 16 Jun 2025 07:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1750082494; x=1750687294; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwz4cKrypUvsL9siOm1Ko5J6ezOUtjF4iLnGLibT5ys=;
        b=eYxO2TDzF2I2YjqFP3QdCpEJTM++OPxyc4DwvDuyqm8HkRTbRmCcC39ZwfMjvD9pRO
         t+IKwAGDHTXxfZFyRcH5r1chm0gyxOtMSBNHuO5DwScztIyPmanmdM3Nj3bGcqY6Pdo7
         DPkiQH99EMA6o7xXRvb+AR97yn+75CupT3EMMBbqpdAJvhJHHxw4+C4VTu/bHwtbYx6z
         todMGxEJ/HTmzqcqTHXj15SZRttQm8NGO/0zHGTMz/w3kqVEh1DC3UYNnCcTHY8IbXUH
         bWK3mWPlWSKv02HUUQnQKgzPMzohpvtSRdWG+rXtvZoB/zaogOo9MZiRMqWCeLUm+LvF
         kS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750082494; x=1750687294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwz4cKrypUvsL9siOm1Ko5J6ezOUtjF4iLnGLibT5ys=;
        b=jDFwZzchTf0FOXVIiMYd2hhBXjeGcdlY1TY+B7e0bGoO0MHP1X5CeNRfms/VHNSdir
         PLkvsecWw1OYXhR11I6BhdnPJWWBY2wBAnL6KFj4srtMIa9jvC/7eEoWW6bONnol60W4
         fdTRBGGST7c70/lroNiulz8R89hqrIODQGQsyeI7JB5DrJ37nhub6QeIOPfOvYf805Ci
         4A1w3g2Z+RlbAKsx79hUgTkaO8S+AQejVLNGGdpJfOeiOE55EMl7Pryf4c9wHAoU7qsg
         9xoOEACcsVtGdjdXcfsO9BXAIZ83CarT0Ece2FDiAy/GTSOMGfPpnrIPGPq9YnW6D/As
         bXfw==
X-Forwarded-Encrypted: i=1; AJvYcCX6Lbqdv/Sry7rn39Dg4vruLbAe3NhCgLP5z5MaD96fA5lWlHBmlKlnRZBga8Hd9qo0eH+ZJ2YsQkbkz0tIPKg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwqbW/NHR4Q2z9qmsZA+JoYbDrlf6cc8UtjwDV6UgBp4Uc4UjZs
	u/0T283UjB1TCnM9DNlHeNWwe+U/E2MX0ng28Y8U212XXwbyoKb3X4JxpOK8K8N2hQ==
X-Gm-Gg: ASbGncs7rT+TIOrNolP21eySlz+hpVWbE8U0VzyHR39Di9WqyP3bs0EPwvVWXyAeTWg
	i4eo09MRn+E6lljuEh/L4QU4z18lvVT8zeA2NeYvcLsBT0GRg+eBm2j1CVnkPpo6zXot/y2f9FK
	+uXtcXnDPfR2P5KJz2S2HHw5wiwX6QvOy0Rwibcd4U4wrwE0kiQToK2UQAzTFig5xyzycCMISWL
	1iNr5AX9QuRQEgAq/MyZOOfrZFKK0fXQQY6k5pEtuhIfe7KugY8awqF8D4ct0jdaiENqbmG+GWW
	kzONzqzjLaZ1CD7ODs9gVRdi6N3ZmpE3Pcqzq+rOEu7+zJ2lvPDdQQ4s3cO1B7TyvAWjVLlDvLo
	KTcuaBBGUAQBHjoQZ/hM9ZWKNMhWY4qkzw+E3HIwCvkmvEg==
X-Google-Smtp-Source: AGHT+IHfNqlkW+hwIU+9YPGHmtVitHx2ir6qBfj0k/M5cOlwiKyZyZh97IqroGO2vE2tCevQa24dBA==
X-Received: by 2002:a5d:64ee:0:b0:3a4:e1e1:7779 with SMTP id ffacd0b85a97d-3a5723a2be9mr7607298f8f.32.1750082492044;
        Mon, 16 Jun 2025 07:01:32 -0700 (PDT)
Received: from [10.93.128.132] (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a7e51esm11057004f8f.40.2025.06.16.07.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:01:31 -0700 (PDT)
From: Michal Gorlas <michal.gorlas@9elements.com>
Date: Mon, 16 Jun 2025 16:01:12 +0200
Subject: [PATCH v2 1/3] firmware: coreboot: support for parsing SMM related
 informations from coreboot tables
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-coreboot-payload-mm-v2-1-5d679b682e13@9elements.com>
References: <20250616-coreboot-payload-mm-v2-0-5d679b682e13@9elements.com>
In-Reply-To: <20250616-coreboot-payload-mm-v2-0-5d679b682e13@9elements.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>, 
 Brian Norris <briannorris@chromium.org>, 
 Julius Werner <jwerner@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 Marcello Sylvester Bauer <marcello.bauer@9elements.com>, 
 Michal Gorlas <michal.gorlas@9elements.com>
X-Mailer: b4 0.14.2

coreboot exposes (S)MM related data in the coreboot table. Extends existing interface
with structure corresponding to (S)MM data, and adds COREBOOT_PAYLOAD_MM config used by
follow-up patches.

Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
---
 drivers/firmware/google/Kconfig          | 12 +++++++
 drivers/firmware/google/coreboot_table.h | 11 ++++++
 drivers/firmware/google/mm_payload.h     | 58 ++++++++++++++++++++++++++++++++
 3 files changed, 81 insertions(+)

diff --git a/drivers/firmware/google/Kconfig b/drivers/firmware/google/Kconfig
index 41b78f5cb7351e512cbaeb6443634a4b97bf6255..ff443f0c4a9a990052d83903fb0f0b0795cc76bd 100644
--- a/drivers/firmware/google/Kconfig
+++ b/drivers/firmware/google/Kconfig
@@ -81,4 +81,16 @@ config GOOGLE_VPD
 	  This option enables the kernel to expose the content of Google VPD
 	  under /sys/firmware/vpd.
 
+config COREBOOT_PAYLOAD_MM
+	tristate "SMI handling in Linux (LinuxBootSMM)"
+	depends on X86 && GOOGLE_COREBOOT_TABLE
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
diff --git a/drivers/firmware/google/coreboot_table.h b/drivers/firmware/google/coreboot_table.h
index bb6f0f7299b4670d0b1f91bd7a3c038cdb412f7b..8a7934e679903e39ce1d86b4aecbc2b4e89363fd 100644
--- a/drivers/firmware/google/coreboot_table.h
+++ b/drivers/firmware/google/coreboot_table.h
@@ -52,6 +52,16 @@ struct lb_cbmem_entry {
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
@@ -80,6 +90,7 @@ struct coreboot_device {
 		struct lb_cbmem_ref cbmem_ref;
 		struct lb_cbmem_entry cbmem_entry;
 		struct lb_framebuffer framebuffer;
+		struct lb_pld_mm_interface_info mm_info;
 		DECLARE_FLEX_ARRAY(u8, raw);
 	};
 };
diff --git a/drivers/firmware/google/mm_payload.h b/drivers/firmware/google/mm_payload.h
new file mode 100644
index 0000000000000000000000000000000000000000..bb2f55c4f24096dfd526e281a937f100031d5315
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

