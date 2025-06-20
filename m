Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AB030E837
	for <chrome-platform@lists.linux.dev>; Fri, 20 Jun 2025 06:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750400911; cv=none; b=k7hBgi42LkReU1Lrq92tHh4TvDS0wpY/T2JIPMzcY/xNgKtgygNWoPKuzqLwYBRtz62+E+oqKe+Pkj4BfZSwohwQFqrxr6nSwr8stxtI0rMkZCPexDiLg4PdoQUzmbN8uQ5hTPOz09fKQ1KBo0ZgXomdy49m7MtBJiL7FC7/nVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750400911; c=relaxed/simple;
	bh=2AFaIWPZRedx7Q5HzhCbs3yuRCcoDXHqvr3dS0cGcPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aJ5chFCgR10YG6RVqb1V6BNPb/mR3+Hulvkv+axpYcmywKNggiMGNVbrEoVNvUD3uxqB9E8uRDVPBQ1v2c1hOHghCBaFRV6W69phtj7zQXO3hLzZxhEBqYoHkQfqfATfOKQZFxxP1xyaw/2fKrhKSVGipvvs2xlPMLSURKilA+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GL/+Qkm/; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GL/+Qkm/"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-311c95ddfb5so1040942a91.2
        for <chrome-platform@lists.linux.dev>; Thu, 19 Jun 2025 23:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750400909; x=1751005709; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r/E/aBc2e2AT3yv8e3js9rgirBkY/kk3mnts5DHmam8=;
        b=GL/+Qkm//qoQ8LgKGigm8s/gHFZLaUmP2frFgIl0NAF2rdyrk97NrFL8aGUrAbLfrt
         vJA231W1RjIkclUBS3Pd1lsDEALCvqjW2MTkxDuY+SHGLs4C71FciAqYbAKjBjDUDfdc
         4SXFVb8U+aR7UmygjqJAMc1vmmozhFDpoZDCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750400909; x=1751005709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/E/aBc2e2AT3yv8e3js9rgirBkY/kk3mnts5DHmam8=;
        b=i+G9maWlNfKttftbkUJuqyo3I2kNCnMbQz96U3nKL1i2dlaWShM6ueps0fGiPcocWR
         Y3pgJMPEzZy/sH3/WpAoT6vorqkZi32K8t68ZBhRVOUyuk7gCe15jCi9xbTmbcr0o3hN
         hfFrfu/X0HUWihRNcOmN0idA6d8ct4v9hH+XNCxnA2AHe7zYtTb1+v7S0b8+d3U1NtIa
         0Z2z70KQAXjrKc4u3KRvPx2PdnGFApUESUpO/BSvnqNQwdk9lzcTkj3T6bWKoaKPEARP
         hNsUboT6+xDX9CGZYXTS9BJZ03bkyJ+wimDO0tZuIEXwGJ/+XzNqEWYGxMZV4RW5R5pr
         UiMQ==
X-Gm-Message-State: AOJu0YykAiy20uEXb9INzKvkrvK1MkbziDCpbPOTIVxceBomZwEvkZ2L
	sOzqiH+haFatq9DZhfBGgtL8r7Eos34V4SDHzjTA2jjyKSA53Yfp1oPUzXWfHfZZNQ==
X-Gm-Gg: ASbGncsq3Q12H+jb4tjxMItwQxZHhJYmUMCkX7e4H10ILoUFXaB9WUVgSMv5+pwCK67
	VYgP6zYcssfnxycA4gOfm48lrRScQVoaDFGSuT0Q54NqCBBVhthu2zyuzP5sb4GUWHFoyi9eEZT
	oJVfcbDKFpeCCO74PbjmnjzyAHMM1s6ZyQPMLvZvuvSym4SORHkk8jqKLf1o52uK5L6LlZcKzMo
	pQuKLTN5gMmEKXG50KyyltPTmtHhlyozCuJyvieoDMk5c5mX7n+uuXqobYUwZe0mF9zDnuony9y
	mXtKGn7vqyYJbSCkU4uFgmJi5NQ+/wlb34p1uSRhQqmYB6J2CALO44VGzR1DpFb82DNGAaUGfjL
	MuiS+M7kcj24ItcHFoY0=
X-Google-Smtp-Source: AGHT+IGJPjXCxdFLKuGzej0hDCk3j8Q7GWXqQaXGEqJxWf+SYDAYvQaOgTuet4/X8KEARycL0FftIQ==
X-Received: by 2002:a17:90b:5148:b0:313:b78:dc14 with SMTP id 98e67ed59e1d1-3159d57b142mr3859178a91.0.1750400908881;
        Thu, 19 Jun 2025 23:28:28 -0700 (PDT)
Received: from naoyatezuka1.tok.corp.google.com ([2401:fa00:8f:203:8f2b:74f7:bc26:564e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f118eebdsm772427a12.6.2025.06.19.23.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 23:28:28 -0700 (PDT)
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
Subject: [PATCH v3] platform/chrome: chromeos_pstore: Add ecc_size module parameter
Date: Fri, 20 Jun 2025 15:28:22 +0900
Message-ID: <20250620062822.1018798-1-naoyatezuka@chromium.org>
X-Mailer: git-send-email 2.50.0.rc2.701.gf1e915cc24-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On ChromiumOS devices, the `ecc_size` is set to 0 (check dmesg | grep ecc 
to see `ecc: 0`): this disables ECC for ramoops region, even when 
`ramoops.ecc=1` is given to kernel command line parameter.

Introduce `ecc_size` module parameter to provide an method to turn on ECC
for ramoops and set different values of ecc_size per devices.

A large `ecc_size` value can cause a kernel panic due to a constraint in
Reed-Solomon code library. The validation for this constraint should 
belong to the common pstore RAM layer, not in each individual driver. So
this check is handled by a separate patch [1].

[1] https://lore.kernel.org/lkml/20250620054757.1006729-1-naoyatezuka@chromium.org

Signed-off-by: Naoya Tezuka <naoyatezuka@chromium.org>
---
Changes in v3:
- Update commit message to use imperative mood as suggested.
- Change module parameter permissions for `ecc_size` to 0400 as suggested.
- State in commit message that the `ecc_size` upper bound issue is 
  addressed in a separte patch instead of validating in this driver.

- Link to v2: https://lore.kernel.org/lkml/20250610050458.4014083-1-naoyatezuka@chromium.org

Changes in v2:
- Remove an unnecessary blank line

- Link to v1: https://lore.kernel.org/lkml/20250610025152.3844404-1-naoyatezuka@chromium.org
---
 drivers/platform/chrome/chromeos_pstore.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/chrome/chromeos_pstore.c b/drivers/platform/chrome/chromeos_pstore.c
index f37c0ef4af1f..a6eed99507d4 100644
--- a/drivers/platform/chrome/chromeos_pstore.c
+++ b/drivers/platform/chrome/chromeos_pstore.c
@@ -9,6 +9,10 @@
 #include <linux/platform_device.h>
 #include <linux/pstore_ram.h>
 
+static int ecc_size;
+module_param(ecc_size, int, 0400);
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
2.50.0.rc2.701.gf1e915cc24-goog

