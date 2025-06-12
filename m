Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD7A24DCED
	for <chrome-platform@lists.linux.dev>; Thu, 12 Jun 2025 14:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749737193; cv=none; b=Vbwp3xzUg6EmKmBApHI3v+C8g3R2jFGKscHQZWspAhjOUarejPbwahaCrl6z8WhwdWLV3yePwjRPpYYnPufemkElIcwViP65T1ipU7Kn3mnvSnr0BkqaMNG019Nkn2bvTCw68V2rZaKXO9QvafTglJROHd/02WaBFZ4mnNf/sME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749737193; c=relaxed/simple;
	bh=ISjEXdBvNbTD5hi9yBqTGZRlg/doEfn4IjaexdEVwoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RKC3C3xxloWbH7ex2NGf/r9/nEKrhW3XwIPG4AxXQDwigeJWtVQO9dILeadf0mIWozNggYaqJt7F0MOzMmbzRCMx9hXlsYLdSvSqe8Ky0WmAT74wfz/4146xY4Te2XpDYLrVyCg2o2G9AxvubgtOAGeq4CpX1QbrUGrhM+u8fsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=B7sPYFrh; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="B7sPYFrh"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a51481a598so640256f8f.3
        for <chrome-platform@lists.linux.dev>; Thu, 12 Jun 2025 07:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1749737189; x=1750341989; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUgqA1Jc2xYoZNZTuzlLkXS4uHvCEdWe1k/c6jbnK/M=;
        b=B7sPYFrhiLdI1NRzgVdXQcuLalF2pJxuRoRQrohopWcq2+xwlp8xng21C8Elq4PeXs
         qmHnW7Buu4f6o0yNHDagdL8u6W7SVUdU8Ss7r1kPw4N5ozAK8vGVSCUzxZBzk1GGCGdq
         Hi0IQ3LDGfgJKApF1ld/C4Inqclr2zWzoc+0PQ5E/Asf/VZvkgUTlXbSS5cpl39Kg4nq
         ebqW17idRKDJWw4/YcAgdPlRNu2Xo1/IRhmIfuyaPfzvG0DX6SCkVpJIluOa9vX+93uf
         ZGQWBFxdcapRnTBxVqJtnVwy8Pgqr57zTaWtZjNWhna+YgrTHNf9WA4iMUe3D9K3q1u8
         Apzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749737189; x=1750341989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KUgqA1Jc2xYoZNZTuzlLkXS4uHvCEdWe1k/c6jbnK/M=;
        b=MB0+L9/Q2jM6HYC27X3Im+8e/9PP0KfGiq19IMq1SQlxtFH4rcbdI6/QsXFJepyFi8
         2sHSZzlwVGIYyDxBqak/ioBHMLctzOMF0qO/Lu4O/msFkCKWNrsNSpvHfpOXgcW1i1UN
         WENbvlSoV5o8csLEMbUKeWsoLcQwgdubCLmA6RKdqy1uMBlncKbOJYydfZYRQl0OIo7L
         bQELWlAK2XxAldQx8AqPgWgNru/umPAC2mEWfQPID06TZ7l9xi14NJSOzfwSBSTXjj46
         ENfthXVCs/++3mN2sweujouRlTSihkAFrLlcT9y5MP9Z5CybZDTa1zJEGXaqlTMbvuGn
         qspg==
X-Forwarded-Encrypted: i=1; AJvYcCWeM1W2I/lSJwk2laKO1uT5D8L1VqsDWZb0R/AQEqBMBrGCU96+A1/+4EXPlZD7DgbvZmq100evR77U800pz9E=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywa523irOZlJspsPnwb792pQR95VomLQwkXHQtDlYd7ifzOT4Hv
	3XkN6lMObXBK3rTIRCxzXkfigPz9zRd1nEy2nuerikuAD3JWxO4LJo6O+wmjozJJyg==
X-Gm-Gg: ASbGnctEdHXjDdGDxJYfHM4aeyKksvc6aKzzvn4+0KPQMrLznx0uZ4UYBqRbpdJXANw
	R0KsTqnmwPTYknuDDY+D9AsEH5Iv7OlmrOdw9jmjuqxG8YabI9ddE4iGw03ggB/ITa0HSrlSqgg
	FT9aHHBhn1APJ/vsSZnLcNd17QP/uluIUJ4BvIOb0eS5gaDlE3+FHK7QCTaEo/GzVUEbyCcDTqi
	yJGK5jAZi+rtwLKMCMVn2hEVd0VjfUNzAyTgz3jA2D8BVJ/wG9rj3rupxkp5bCwvMQSuGc+Ne7H
	5GiIYTjPorvy9aKu/wT7MHyMFLc8PRt4B2l+XYwDDe7yLdHA47LHzQpx8MJP+YGH6ZYq06rR6uF
	+d0gOHj9qrz9ostKB2bX98lAhLr7Zo/HLbwLTJelJtHH0ZmUcu4Prqp8euIHtt/DYstWTacfz
X-Google-Smtp-Source: AGHT+IEMmU+OYqOh2rsuirqXNprzlh+QwHNDiMIm/ZI5vCsQSWsOSemy/DSfB7Z5oVT8jFgyb+HdDw==
X-Received: by 2002:a05:6000:250e:b0:3a4:f66a:9d31 with SMTP id ffacd0b85a97d-3a56798747fmr45030f8f.16.1749737189462;
        Thu, 12 Jun 2025 07:06:29 -0700 (PDT)
Received: from cyber-t14sg4.sec.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561a3ce6bsm2078875f8f.49.2025.06.12.07.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 07:06:29 -0700 (PDT)
From: Michal Gorlas <michal.gorlas@9elements.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>
Cc: marcello.bauer@9elements.com,
	Michal Gorlas <michal.gorlas@9elements.com>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] firmware: coreboot: loader for Linux-owned SMI handler
Date: Thu, 12 Jun 2025 16:05:49 +0200
Message-ID: <6cfb5bae79c153c54da298c396adb8a28b5e785a.1749734094.git.michal.gorlas@9elements.com>
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

Places a blob with Linux-owned SMI handler in the lower 4GB of memory, calculates
entry points for the it and triggers SMI to coreboot's SMI handler
informing it where to look for Linux-owned SMI handler.

Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
---
 drivers/firmware/google/Makefile    |   9 ++
 drivers/firmware/google/mm_blob.S   |  20 +++
 drivers/firmware/google/mm_loader.c | 186 ++++++++++++++++++++++++++++
 3 files changed, 215 insertions(+)
 create mode 100644 drivers/firmware/google/mm_blob.S
 create mode 100644 drivers/firmware/google/mm_loader.c

diff --git a/drivers/firmware/google/Makefile b/drivers/firmware/google/Makefile
index d2a690e8379d..eab5a62d7500 100644
--- a/drivers/firmware/google/Makefile
+++ b/drivers/firmware/google/Makefile
@@ -15,3 +15,12 @@ obj-$(CONFIG_GOOGLE_VPD)		+= vpd-sysfs.o
 
 # LinuxBootSMM related.
 obj-$(CONFIG_COREBOOT_PAYLOAD_MM)		+= mm_info.o
+payload-mm-$(CONFIG_COREBOOT_PAYLOAD_MM)	:= mm_loader.o mm_blob.o
+
+subdir-						:= mm_handler
+obj-$(CONFIG_COREBOOT_PAYLOAD_MM)		+= payload-mm.o
+
+$(obj)/mm_blob.o: $(obj)/mm_handler/handler.bin
+
+$(obj)/mm_handler/handler.bin: FORCE
+	$(Q)$(MAKE) $(build)=$(obj)/mm_handler $@
diff --git a/drivers/firmware/google/mm_blob.S b/drivers/firmware/google/mm_blob.S
new file mode 100644
index 000000000000..87557d67c47b
--- /dev/null
+++ b/drivers/firmware/google/mm_blob.S
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Derived from rmpiggy.S.
+ *
+ * Wrapper script for the MM payload binary as a transport object
+ * before copying to SMRAM memory.
+ */
+#include <linux/linkage.h>
+#include <asm/page_types.h>
+
+	.section ".init.data","aw"
+
+	.balign PAGE_SIZE
+
+SYM_DATA_START(mm_blob)
+	.incbin	"drivers/firmware/google/mm_handler/handler.bin"
+SYM_DATA_END_LABEL(mm_blob, SYM_L_GLOBAL, mm_blob_end)
+
+SYM_DATA_START(mm_relocs)
+	.incbin	"drivers/firmware/google/mm_handler/handler.relocs"
+SYM_DATA_END(mm_relocs)
diff --git a/drivers/firmware/google/mm_loader.c b/drivers/firmware/google/mm_loader.c
new file mode 100644
index 000000000000..51fbfd07f525
--- /dev/null
+++ b/drivers/firmware/google/mm_loader.c
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for installing Linux-owned SMI handler
+ *
+ * Copyright (c) 2025 9elements GmbH
+ *
+ * Author: Michal Gorlas <michal.gorlas@9elements.com>
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/cpu.h>
+#include <linux/delay.h>
+#include <linux/gfp.h>
+#include <linux/mm.h>
+
+#include "mm_payload.h"
+
+#define DRIVER_NAME "mm_loader"
+
+struct mm_header *mm_header;
+
+static void *shared_buffer;
+static size_t blob_size;
+
+/*
+ * This is x86_64 specific, assuming that we want this to also work on i386,
+ * we either need to have "trigger_smi32" bounded by preprocessor guards(?)
+ * or mm_loader32 and then mm_loader$(BITS) in Makefile(?).
+ */
+static int trigger_smi(u64 cmd, u64 arg, u64 retry)
+{
+	u64 status;
+	u16 apmc_port = 0xb2;
+
+	asm volatile("movq	%[cmd],  %%rax\n\t"
+		     "movq   %%rax,	%%rcx\n\t"
+		     "movq	%[arg],  %%rbx\n\t"
+		     "movq   %[retry],  %%r8\n\t"
+		     ".trigger:\n\t"
+		     "mov	%[apmc_port], %%dx\n\t"
+		     "outb	%%al, %%dx\n\t"
+		     "cmpq	%%rcx, %%rax\n\t"
+		     "jne .return_changed\n\t"
+		     "pushq  %%rcx\n\t"
+		     "movq   $10000, %%rcx\n\t"
+		     "rep    nop\n\t"
+		     "popq   %%rcx\n\t"
+		     "cmpq   $0, %%r8\n\t"
+		     "je     .return_not_changed\n\t"
+		     "decq   %%r8\n\t"
+		     "jmp    .trigger\n\t"
+		     ".return_changed:\n\t"
+		     "movq	%%rax, %[status]\n\t"
+		     "jmp	.end\n\t"
+		     ".return_not_changed:"
+		     "movq	%%rcx, %[status]\n\t"
+		     ".end:\n\t"
+		     : [status] "=r"(status)
+		     : [cmd] "r"(cmd), [arg] "r"(arg), [retry] "r"(retry),
+		       [apmc_port] "r"(apmc_port)
+		     : "%rax", "%rbx", "%rdx", "%rcx", "%r8");
+
+	if (status == cmd || status == PAYLOAD_MM_RET_FAILURE)
+		status = PAYLOAD_MM_RET_FAILURE;
+	else
+		status = PAYLOAD_MM_RET_SUCCESS;
+
+	return status;
+}
+
+static int register_entry_point(struct mm_info *data, uint32_t entry_point)
+{
+	u64 cmd;
+	u8 status;
+
+	cmd = data->register_mm_entry_command |
+	      (PAYLOAD_MM_REGISTER_ENTRY << 8);
+	status = trigger_smi(cmd, entry_point, 5);
+	pr_info(DRIVER_NAME ": %s: SMI returned %x\n", __func__, status);
+
+	return status;
+}
+
+static u32 __init place_handler(void)
+{
+	/*
+	 * The handler (aka MM blob) has to be placed in low 4GB of the memory.
+	 * This is because we can not assume that coreboot will be in long mode
+	 * while trying to copy the blob to SMRAM. Even if so, (can be checked by
+	 * reading cb_data->mm_info.requires_long_mode_call), it would make our life
+	 * way too complicated (e.g. no need for shared page table).
+	 */
+	size_t entry32_offset;
+	size_t entry64_offset;
+	u16 real_mode_seg;
+	const u32 *rel;
+	u32 count;
+	unsigned long phys_base;
+
+	blob_size = mm_payload_size_needed();
+	shared_buffer = (void *)__get_free_pages(GFP_DMA32, get_order(blob_size));
+
+	memcpy(shared_buffer, mm_blob, blob_size);
+	wbinvd();
+
+	/*
+	 * Based on arch/x86/realmode/init.c
+	 * The sole purpose of doing relocations is to be able to calculate the offsets
+	 * for entry points. While the absolute addresses are not valid anymore after the
+	 * blob is copied to SMRAM, the distances between sections stay the same, so we
+	 * can still calculate the correct entry point based on coreboot's bitness.
+	 */
+	phys_base = __pa(shared_buffer);
+	real_mode_seg = phys_base >> 4;
+	rel = (u32 *)mm_relocs;
+
+	/* 16-bit segment relocations. */
+	count = *rel++;
+	while (count--) {
+		u16 *seg = (u16 *)(shared_buffer + *rel++);
+		*seg = real_mode_seg;
+	}
+
+	/* 32-bit linear relocations. */
+	count = *rel++;
+	while (count--) {
+		u32 *ptr = (u32 *)(shared_buffer + *rel++);
+		*ptr += phys_base;
+	}
+
+	mm_header =  (struct mm_header *)shared_buffer;
+
+	mm_header->mm_signature = REALMODE_END_SIGNATURE;
+	mm_header->mm_blob_size = mm_payload_size_needed();
+
+	/* At this point relocations are done and we can do some cool
+	 * pointer arithmetics to help coreboot determine correct entry
+	 * point based on offsets.
+	 */
+	entry32_offset = mm_header->mm_entry_32 - (unsigned long)shared_buffer;
+	entry64_offset = mm_header->mm_entry_64 - (unsigned long)shared_buffer;
+
+	mm_header->mm_entry_32 = entry32_offset;
+	mm_header->mm_entry_64 = entry64_offset;
+
+	return (unsigned long)shared_buffer;
+}
+
+static int __init mm_loader_init(void)
+{
+	u32 entry_point;
+
+	if (!mm_info)
+		return -ENOMEM;
+
+	entry_point = place_handler();
+
+	if (register_entry_point(mm_info, entry_point)) {
+		pr_warn(DRIVER_NAME ": registering entry point for MM payload failed.\n");
+		kfree(mm_info);
+		mm_info = NULL;
+		free_pages((unsigned long)shared_buffer, get_order(blob_size));
+		return -1;
+	}
+
+	mdelay(100);
+
+	kfree(mm_info);
+	mm_info = NULL;
+	free_pages((unsigned long)shared_buffer, get_order(blob_size));
+
+	return 0;
+}
+
+static void __exit mm_loader_exit(void)
+{
+	pr_info(DRIVER_NAME ": DONE\n");
+}
+
+module_init(mm_loader_init);
+module_exit(mm_loader_exit);
+
+MODULE_AUTHOR("Michal Gorlas <michal.gorlas@9elements.com>");
+MODULE_DESCRIPTION("MM Payload loader - installs Linux-owned SMI handler");
+MODULE_LICENSE("GPL v2");
-- 
2.49.0

