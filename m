Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BEF25E801
	for <chrome-platform@lists.linux.dev>; Tue, 10 Jun 2025 02:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749523935; cv=none; b=mwMez+ShaHgJTxSNrdFP/jWstF5p5bhRkypYfZPqq3Az8VZIz8SkH/tesOkav0qcMn4mBknq+WQ/1qSvadHjj+mtb6hEti1HuFimcWYQTi11FfPHyBivRzn17tizPlxi8cVTbKvzuQqOHgUKq0zHBmWioqR9XaIkkEZf+qLD64c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749523935; c=relaxed/simple;
	bh=BJSAuM/KEuH1gidHkhv+0rdYBs0sl4fswnQ67X/V5y8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Amotz9nkfdDtdsW1tfJk1EeRHVPmiQySMiv4/xoxVNT/zBd4KZPY/wGlnRpbU+P2gHfEs5NAuYOFWLOfgyFD4opmYd4X/JudIPN5QhHuRf74y2uouWrxNDg6w+zlw9k7/Xn9fXcBQ4AdPa889qgrx6+n96UX0oqPmqG1FDhE6QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Qt2iBpKs; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Qt2iBpKs"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2360ff7ac1bso20208955ad.3
        for <chrome-platform@lists.linux.dev>; Mon, 09 Jun 2025 19:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749523933; x=1750128733; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rm7rFkHvnvV5pN555kvAO+KRnM6aiD+6xk7uYMzjvLU=;
        b=Qt2iBpKsGRa/j4tQXywghvg8R+9jJSPx4iCy+Z443+Nd2Nm9cWHKLN/MOT7b9e5BSJ
         aqldGhiJ0y4s0ErpMLQxLRr7O+cg1/zL2H4+DGVODlkfj9wfm+TtBSZ1jccrnz+a9ofG
         GYASSnjSKaDe+Y+EjexX0Er9v3XGuKIgl6T6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749523933; x=1750128733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rm7rFkHvnvV5pN555kvAO+KRnM6aiD+6xk7uYMzjvLU=;
        b=jqdqzOxHa3L1Hvhx24HnMLS6mbkkRkFAMgokmhfRP1wFCOULYTqfGgkkyizM7WIbsT
         Jb3Q0FNRnlxm5MTabx/F1Ark8icpiu11DuCKmhjh4qTe4VJ3W8RPywg7Ky6ZfVHJF8xy
         KV+pF+rTMAl3JHxM+c2zehlHxJKzz0/YYSdHDlYRwSvnentwH6R3rozlu2SWKR30MNDT
         yAMDutA/RWUxlGo/LhB7PaiQUMVa83NDunBz1k+hEcIBR09F9d1ynrvIIAPCucDD+7eu
         Tv7g9Z9Z+EpPXk/YVV+MAODCF8tBjLElJ3+GbTQbkQcDAR5AGSsswqEwNlnS+QYBjO2T
         vWKA==
X-Gm-Message-State: AOJu0Yzh3yWYm2ISa10c8mpuk1W0jH8Cu1PQWPBEtfSbHikpTBkHW8vc
	7c6AA5uE39EqQS2fPcKVfCJfg19HFlUMzSBj/bHNfj0NVShsGUAgqFa8e/YgM1UxTA==
X-Gm-Gg: ASbGncsdXcvEjC0KNj1+MMnAIKG4mnwrHPrgSuML+lky8bc0oxcteaBEZJdyFTR91/1
	BtBqTRBPRpdNV7BHpteE3XOTFjvnTRA0ys0j1hypZjlflpUcd7WvCVbi8sfOsJ2GCmbZU8azXRA
	h6HUE5SOMcdmDl673YTg6bhPykTXqZKVKXYLCi1DTB9XU6qJbftFC+0GEbiucRwt35rjYoboorJ
	gFVKvJPP5sGBzOZTHeYxqX5X10lgYPgfvOxMt5DMUQ3ArMkS9It39OqAiB+FpydhmPSZNTQUbHp
	9zm1xQ9feKrjuoWGjXiLwowwH+kSVjcKCZilR1e6cOTM+4pPAkOEEdjwgkwuC5yxuFbZckHt/Pw
	CaGXsuWKzV7SnPjmIg84=
X-Google-Smtp-Source: AGHT+IGm82o58ZVjCAo3PybTPYdGDfXUbsMi8+8LjHbWtOpjdJXIBSCQJyWdYXNP2Z2kXvDi5YGUeg==
X-Received: by 2002:a17:902:cf03:b0:234:9375:e07c with SMTP id d9443c01a7336-23601dbd9fcmr242591495ad.46.1749523933313;
        Mon, 09 Jun 2025 19:52:13 -0700 (PDT)
Received: from naoyatezuka1.tok.corp.google.com ([2401:fa00:8f:203:4173:c66c:ee04:82a8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603514230sm61107305ad.245.2025.06.09.19.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 19:52:12 -0700 (PDT)
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
Subject: [PATCH] platform/chrome: chromeos_pstore: Add ecc_size module parameter
Date: Tue, 10 Jun 2025 11:51:37 +0900
Message-ID: <20250610025152.3844404-1-naoyatezuka@chromium.org>
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
 drivers/platform/chrome/chromeos_pstore.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/chrome/chromeos_pstore.c b/drivers/platform/chrome/chromeos_pstore.c
index f37c0ef4af1f..255818f24c2e 100644
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
@@ -115,8 +119,12 @@ static inline bool chromeos_check_acpi(void) { return false; }
 
 static int __init chromeos_pstore_init(void)
 {
+
 	bool acpi_dev_found;
 
+	if (ecc_size > 0)
+		chromeos_ramoops_data.ecc_info.ecc_size = ecc_size;
+
 	/* First check ACPI for non-hardcoded values from firmware. */
 	acpi_dev_found = chromeos_check_acpi();
 
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

