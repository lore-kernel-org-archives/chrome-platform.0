Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0225925E44B
	for <chrome-platform@lists.linux.dev>; Tue, 10 Jun 2025 05:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749531909; cv=none; b=uNnG/5kPgoY5icQBhooIglravu3YT/FN7tx9IMKQbzmOfeRbhtJKHb3zqm2pjC+67P5tnAbG5xeKFHbwffNWzmRR3USXmMFpgRQbeHqN9E3Ia71nKIpcdLODOpx1HErJP5GJGI2J9H1jAtoRfa4J25svnrNETy+ccsdgpAzJ638=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749531909; c=relaxed/simple;
	bh=uyNqLoXucwkytiJ5G6V3n8mW9G9aw8BXAUcbIVRwFtg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P6yuFniRQp6hGUKP+n0tTRnJdhyjJsGRlvUhoIojAsvEa98oY8fMPriika2IQcXY3/7WnY58aycxuc6f8Fw0PiHzfthT4Laeah3/p7aJ0RKNvRLEfDjq7zldee93VtQVxzRa5rH7kt5Z+Nd3C+6HS5DTwk4aHtYRjCSrzi4EeGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dQoy53Eb; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dQoy53Eb"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so5232208b3a.0
        for <chrome-platform@lists.linux.dev>; Mon, 09 Jun 2025 22:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749531907; x=1750136707; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=imqHtGt/tO66pE6iWFuD1X2tjs5P6qkLBbewDhpPIyg=;
        b=dQoy53EbPW7nSbF11L/1Q+iej0X7r7uARCKyUBK5NWQSsSBivEg5eDhInSsz3aXV9w
         /fJ4TvwepR1jCOHUgXM68e1M8LB24Y/PWWfDzjJhIvmaQReDxvPhZ+9OggLW+fu5BldB
         VFUqeWf8Zu0IyXCyLsvJEJEH+HDRETfS68qXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749531907; x=1750136707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=imqHtGt/tO66pE6iWFuD1X2tjs5P6qkLBbewDhpPIyg=;
        b=krAIfIGkbOk3I7tUVpLlndeFHCmHYcdQZRZ2Y3cnlPspmhkwpuG+eT8ULect8NeMUg
         zJN625uwTEpUc7u7jVhOFx7WXZCeA38E+cEIvtq3U3TnHKY5xTI/3wb5L941Vf1GPmig
         B9AIQfQEgPGTMu32lktcM3C1V+G74fSchGXnOx5Om2Q0nSSMKHZl+x2/OrDVhdVn8m8M
         ndnsVRQ2w7QOmdRzb3hqXA5QXkewUi5GDg7J1bsGpqfOSFZfi1lq0/+RocV7KRItOk3z
         cTlYIQoJNT+Vckca3Jcv8uFqf3qHutL+ctKG6X1eLC4IC4oHj6Whn2lM7xI1siCG2KBq
         vIFQ==
X-Gm-Message-State: AOJu0YzzuwZlUol9My1lbzU5jx+2y0DUgWl31oMvFdWFmnzcKMTrG5nf
	Z3femu1GlYKkgDIWNkSTQrROkGMjhAlPD1tdHcGlz/HexWrxdZ7tp1iuWtoKKLENSA==
X-Gm-Gg: ASbGnctowpSrk/JVLDBvRtWEukfGtLSkkQ6AMgV87RCMJ4yfGq52asJTcTmusjc4aq/
	9N6FeFzg1IryG5e9vN91eZBNBSBjBA0KZDZgDtBGrfyL5VdVSwV2JavIWuDfYbhLu7WXvvBNwBR
	fIJxNJcfCokzC78Fj7gkjVS6fkuWAbjd6l279jn2EF4SNbU0MNjRan+WKgXs2ih4QHDd+9jUUXq
	dGU4IdOrfFwY4T/slIjSyqdMt05FrPh6Y2R2BBBG614FyBaUmgFC1BupOL4+rdhxJncENgLnyPK
	EwFrajfKY+SSvLtCpQtJw7nKPZtVwE4a1zfO3/mwR4U0phRTmnhP71PvY65w4yZd0vxjfZt1xRV
	v0UyWoK5hRhX+1/+hcJg=
X-Google-Smtp-Source: AGHT+IEyvsBr6E/EX/tDQzT9qF/aIlLCH2bHJIt9wooBRZ+wpVSA3bPnKk7bwrMsUrtCyl1lykQxqw==
X-Received: by 2002:a05:6a20:4303:b0:218:11d6:b66 with SMTP id adf61e73a8af0-21f768bb26cmr3591721637.5.1749531907301;
        Mon, 09 Jun 2025 22:05:07 -0700 (PDT)
Received: from naoyatezuka1.tok.corp.google.com ([2401:fa00:8f:203:4173:c66c:ee04:82a8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ee6f6desm5222359a12.26.2025.06.09.22.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 22:05:06 -0700 (PDT)
From: Naoya Tezuka <naoyatezuka@chromium.org>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Naoya Tezuka <naoyatezuka@chromium.org>
Subject: [PATCH v2] platform/chrome: chromeos_pstore: Add ecc_size module parameter
Date: Tue, 10 Jun 2025 14:04:58 +0900
Message-ID: <20250610050458.4014083-1-naoyatezuka@chromium.org>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On ChromiumOS devices, the ecc_size is set to 0 (check dmesg | grep ecc 
to see `ecc: 0`): this disables ECC for ramoops region, even when 
ramoops.ecc=1 is given to kernel command line parameter.

This patch introduces ecc_size module parameter to provide an method to 
turn on ECC for ramoops and set different values of ecc_size per devices.

Signed-off-by: Naoya Tezuka <naoyatezuka@chromium.org>
---
v2:
- Remove an unnecessary blank line

v1: https://lore.kernel.org/lkml/20250610025152.3844404-1-naoyatezuka@chromium.org/ 
---
 drivers/platform/chrome/chromeos_pstore.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/chrome/chromeos_pstore.c b/drivers/platform/chrome/chromeos_pstore.c
index f37c0ef4af1f..28e26aa99cdf 100644
--- a/drivers/platform/chrome/chromeos_pstore.c
+++ b/drivers/platform/chrome/chromeos_pstore.c
@@ -9,6 +9,10 @@
 #include <linux/platform_device.h>
 #include <linux/pstore_ram.h>
 
+static int ecc_size;
+module_param(ecc_size, int, 0444);
+MODULE_PARM_DESC(ecc_size, "ECC parity data size in bytes. A positive value enables ECC for the ramoops region.");
+
 static const struct dmi_system_id chromeos_pstore_dmi_table[] __initconst = {
 	{
 		/*
@@ -117,6 +121,9 @@ static int __init chromeos_pstore_init(void)
 {
 	bool acpi_dev_found;
 
+	if (ecc_size > 0)
+		chromeos_ramoops_data.ecc_info.ecc_size = ecc_size;
+
 	/* First check ACPI for non-hardcoded values from firmware. */
 	acpi_dev_found = chromeos_check_acpi();
 
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

