Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE5D3E51CB
	for <chrome-platform@lists.linux.dev>; Wed, 15 Apr 2026 17:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776275459; cv=none; b=HbJkaDmv0UrFqzod+sHUamFngMyobAeHbuIMib4T9AXCLTyMrHOVQtCqx8P9gPtpOwpSI+WJbjnUgZBJn74bVKFItLOS0M7ugKUNxuBpqsqcHBvz72pSGVP3+zEOjldudhBJNFbNamdbKfWBSwowRvC5+ZpESN8kTAxj0c7f+iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776275459; c=relaxed/simple;
	bh=q9TGLRe1UVqxWGYdLDq7YnNCc4SCxzhTB9OScxICR6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U7jX+x7ZmD6h1+kkZ9+dW16jrp35X0uFZ3DWzitbinFOTp5/PTg3usv9XZHM+l9X5vuMRkevvRPRz2bBGNlUomsAb5mYa8e7UgHP5s8vrz8mPdn7D3fpbvT98tqTiiAErBPLNOykTRmA9Sn6PCLpM/2NnjzywqTAy9cHtNpu1NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W87F+ZaT; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W87F+ZaT"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b461310af5so15355165ad.1
        for <chrome-platform@lists.linux.dev>; Wed, 15 Apr 2026 10:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776275456; x=1776880256; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gjx41/oJzSzCxjCOcBWOIoSBA7KLlVfstVe2P4xKOAc=;
        b=W87F+ZaT2NcGzCUT7HuiXZcIPVbaL+gnc7k3b/RqD3F/XmKs0Bk4yI0kIdp3CZJHPs
         AG8r1ezy9Bdwyv7T99io6P8osc3PdJ+9kyQ9bqUIFuK9aNvBvcy8/iQVhjW/pO9lSLjW
         NZ0NylQvfSwCp7T1GwpG4VUFWPUiDolVk56uiTluBDACkF9knJ9Ouz0/le8P0Pme52IU
         2g7OMQOr66zeBkX01mSkpqP9nMMnn5DfS7nRk5JoEiXjASetSLkbQ/zLHWDmAcVQh40Z
         4Whf/5hgOlIv4kr6yIcCQrz1fzrrZZ5oEZoUYf1POj/Ew2nrSLsi25irv6sLJTB3KYCn
         swqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776275456; x=1776880256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjx41/oJzSzCxjCOcBWOIoSBA7KLlVfstVe2P4xKOAc=;
        b=YqDankvo5+IFKBRXxENE2fnvtHjI/ZAVffsP864OH++uO7BD2hEyCXcVIFMdgZynce
         GR8UHNx8bt+YM3zJ+8V+o5Jx2kchzkUp16iHdXeuHvRp7fS4hI3SErDVUAarz2hscNHf
         JtSSFhq1H7uQVD0B6nh0/iiVTfdgk1F8PHxlE/wIGiPX1ciCsm7+WjXtBZd+qcqe52hy
         Y5ICc7wYoeb+h9evKyDOccpZvcHwxdoJyyiYE/S/ewn/jL81JuFNYEC6qoQcYbV3KD05
         eWQd39nHeDUHrM1QzAcZUH0JoW8vaWjJMvRQAl2X1QJXaWUmABkbQ5BLgjkwKCaawxfD
         4S5w==
X-Forwarded-Encrypted: i=1; AFNElJ+Z4VHrBvWxZryaG+ryxA0kOKkBgi9FSKWY+jC6Zit0cGjoYQ2ZVqrCyQXk/6qoDXCMjvtqgv93UGiQBfHNSuY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4vvgoiDhPLlCyq3HGGrkDrH9KHDVRNMYwpA7XUAQMyH2laiqo
	EEiZ/wWeFFxvniy9BjXDrrqK6deH9sG/DZ2s6VYR52LpmpuMm53CNYK3
X-Gm-Gg: AeBDieuGpGeIXxhbIEdA8BNhPO4TlMsL9IoUP4ahpLOCcNIc3bQFGQf/daF5WRWJUr3
	Iy83gSNsqtyv3QvVqK0tG9pwqUojR6jl5byiMyiQMNpDuyAjQo1HbksT8gefcDakxFBGJbSq+Nb
	Pi7sZcNdpP7e6FxbHibraV8AAM2DM9etUkJ1xfB7FTsGo2yUVP+cZqirSzvn23NEAc2by75U0TC
	28L1CeIQcDxqm15U8fk7ktV+XYqyFK/7fVBXAok7PsImyx3llBWzJf7CTEzAOYiS28Ng983eDmv
	zSQC89tiP/uJbsswB8cQF17n7LHV+VSlXBfvLHN245Hpak8AGudHqWKDtvj9VG7GPxpliRvM51c
	JZbTSi4wMKSMO2GhwVGgBeaCk1tHMGvdMT37W1OFj5H0D4syejiE8XnDmVe916PyDrsJitEUrRN
	uvTQhWF55W56oqUc9NQkpgGpeBKRzWAG0iGrDY
X-Received: by 2002:a17:903:3c6d:b0:2b2:4bbc:14b0 with SMTP id d9443c01a7336-2b5eab05edamr3733145ad.20.1776275456476;
        Wed, 15 Apr 2026 10:50:56 -0700 (PDT)
Received: from lgs.. ([2409:893d:1171:10e2:48dd:8f21:beaa:cec8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b47826e248sm26728185ad.47.2026.04.15.10.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 10:50:55 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Olof Johansson <olof@lixom.net>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] platform/chrome: fix reference leak on failed device registration
Date: Thu, 16 Apr 2026 01:50:38 +0800
Message-ID: <20260415175038.3633384-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When platform_device_register() fails in chromeos_pstore_init(), the
embedded struct device in chromeos_ramoops has already been initialized
by device_initialize(), but the failure path returns the error without
dropping the device reference for the current platform device:

  chromeos_pstore_init()
    -> platform_device_register(&chromeos_ramoops)
       -> device_initialize(&chromeos_ramoops.dev)
       -> setup_pdev_dma_masks(&chromeos_ramoops)
       -> platform_device_add(&chromeos_ramoops)

This leads to a reference leak when platform_device_register() fails.
Fix this by calling platform_device_put() before returning the error.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: 9742e127cd0dd ("platform/chrome: Add pstore platform_device")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/platform/chrome/chromeos_pstore.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/chromeos_pstore.c b/drivers/platform/chrome/chromeos_pstore.c
index a6eed99507d4..9e6d14dbb1c2 100644
--- a/drivers/platform/chrome/chromeos_pstore.c
+++ b/drivers/platform/chrome/chromeos_pstore.c
@@ -127,8 +127,13 @@ static int __init chromeos_pstore_init(void)
 	/* First check ACPI for non-hardcoded values from firmware. */
 	acpi_dev_found = chromeos_check_acpi();
 
-	if (acpi_dev_found || dmi_check_system(chromeos_pstore_dmi_table))
-		return platform_device_register(&chromeos_ramoops);
+	if (acpi_dev_found || dmi_check_system(chromeos_pstore_dmi_table)) {
+		ret = platform_device_register(&chromeos_ramoops);
+		if (ret)
+			platform_device_put(&chromeos_ramoops);
+
+		return ret;
+	}
 
 	return -ENODEV;
 }
-- 
2.43.0

