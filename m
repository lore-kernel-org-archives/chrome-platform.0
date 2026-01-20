Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A2C4266B6
	for <chrome-platform@lists.linux.dev>; Tue, 20 Jan 2026 13:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768914860; cv=none; b=GkBi25tHF0pbFd8RrcZNzNPnIXZd2eNwDul09WcN020D1qmH3tEZ4luMt2pfK9XJSgj8RO0S9ReHli24gZau5cBZ+bRS0UCFPDjSQei0+Y97g0yT2x+de6zbUmV+D64ZyJCiIJVKm0K55qhDL5iLSYVZM3FRX0XGkzGvbkiL9hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768914860; c=relaxed/simple;
	bh=IsVAU4KfzrnB2HrF7PabY9ogQ5sJ8ttV9gteU16eWPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eP3PiqH7pbPjxAFrZ9WOTdBBxAjOTAXD+6zTYdADEzcxR7tswcWvQXCq5S4BbfXFKACPcosEIk1vTAaTgREIm+NkDXW28FVbG3QU0XE18csZT/9Xa2iEMBqPCLVTXkROlR1kMPJxohWS7b6OFm7+xVUQAGFwh2n8hsyRvNRxqUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FpgBCiUs; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FpgBCiUs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768914859; x=1800450859;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IsVAU4KfzrnB2HrF7PabY9ogQ5sJ8ttV9gteU16eWPE=;
  b=FpgBCiUsa0wc6a9QiMEr2STCeTOfxK2fUx1V12KqrNVw+22fPNQp/7EN
   WUupdo4UjtLmC0rPQxVUpykjtsznKI+6YOs67YWZomw87GQm4Y6CONxqe
   NziDLaMBfM5J5UgoPo/8kM2/eh1hmEfC0qRmUycFyY78yb72M5ufc7RgQ
   vcAqy1Y2/ciB4pk+QVspDYnvrCZBsq8hsGJBbRPH0k6oDVNK0SxC6bF/U
   lDGMYYoWy6H0QsLygwi+ZbkkQLKTMza2saQ250ibnIAbeIeniOP8+he/P
   dQOo8oQrPodM/Q+gNWGvNDia/XnHB6Ii8R+UHd0vpdTp+MO2DJLVsYFMK
   Q==;
X-CSE-ConnectionGUID: E4RlteUCT66auZ+too7KsQ==
X-CSE-MsgGUID: d90DqZcaS66AEvYStQp4Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70174841"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="70174841"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 05:14:18 -0800
X-CSE-ConnectionGUID: r/EcAOvaT5CA0Z3jStTdmg==
X-CSE-MsgGUID: l5VcyZs4RHys7l8V5TAccg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="210967673"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 20 Jan 2026 05:14:16 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 1C4A89B; Tue, 20 Jan 2026 14:14:15 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v1 2/2] platform/chrome: cros_typec_switch: simplify code with acpi_get_local_u64_address()
Date: Tue, 20 Jan 2026 14:12:31 +0100
Message-ID: <20260120131413.1697891-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260120131413.1697891-1-andriy.shevchenko@linux.intel.com>
References: <20260120131413.1697891-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now we have a helper so there's no need to open-code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/chrome/cros_typec_switch.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/chrome/cros_typec_switch.c b/drivers/platform/chrome/cros_typec_switch.c
index d8a28d4e51a8..fe0eddd2cf45 100644
--- a/drivers/platform/chrome/cros_typec_switch.c
+++ b/drivers/platform/chrome/cros_typec_switch.c
@@ -211,9 +211,8 @@ static int cros_typec_register_switches(struct cros_typec_switch_data *sdata)
 	struct cros_typec_port *port;
 	struct device *dev = sdata->dev;
 	struct fwnode_handle *fwnode;
-	struct acpi_device *adev;
-	unsigned long long index;
 	int nports, ret;
+	u64 index;
 
 	nports = device_get_child_node_count(dev);
 	if (nports == 0) {
@@ -228,17 +227,9 @@ static int cros_typec_register_switches(struct cros_typec_switch_data *sdata)
 			goto err_switch;
 		}
 
-		adev = to_acpi_device_node(fwnode);
-		if (!adev) {
-			dev_err(dev, "Couldn't get ACPI device handle for %pfwP\n", fwnode);
-			ret = -ENODEV;
-			goto err_switch;
-		}
-
-		ret = acpi_evaluate_integer(adev->handle, "_ADR", NULL, &index);
-		if (ACPI_FAILURE(ret)) {
+		ret = acpi_get_local_u64_address(ACPI_HANDLE_FWNODE(fwnode), &index);
+		if (ret) {
 			dev_err(dev, "_ADR wasn't evaluated for %pfwP\n", fwnode);
-			ret = -ENODATA;
 			goto err_switch;
 		}
 
-- 
2.50.1

