Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF7D427A11
	for <chrome-platform@lists.linux.dev>; Tue, 20 Jan 2026 13:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768914863; cv=none; b=iRSsc3M8vkDRGTiEtp/n0Mh+Yt3kudaXvvACERR+HDEzyCEn7SKWNZx6VlRgZAc9rOIat5BWFVHur2C9zdYmHiLxIDmU/VYqn13sbwHz1+S+D9QuNe2h9qIAWVCBWNkw/1kH3jjMIuG0oX7PjVdWH82SRJ9cOs74Gnz9ps0kyTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768914863; c=relaxed/simple;
	bh=bNzuToZL7oP976VTBihDPM3cRjrXvvsC0pdVBKfsRrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hlf6NCwsCTwVHRUUesfi0u//M96eqCQ7NUABpWZYLCUC8pz5IbqpsPbBcqgSVKIEnQduC03cQGtfTGibZhzGB9L302VK7JruNFmB445BiUELhTY/E1bD6dVb5mKe9i4PwVqBTGIwGz7W58UGGrTLUHHp03GPzp9awcS5JYbbD/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HDu9nDAl; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDu9nDAl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768914861; x=1800450861;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bNzuToZL7oP976VTBihDPM3cRjrXvvsC0pdVBKfsRrE=;
  b=HDu9nDAlDgiAJTNJ01AVtpgMp2K0Qk/9y3jra8atN2Uj9xN6FLRnJZUq
   /Z47w7LpC6qm++VadkSVv5uDDk4XOq14OeZmbTK0p42Uncp71wNm1GiWl
   Sq8C07wQGZrHCTGi39is+VbbUMdqrhJ1FK/bhgGe70qkgS+p5tlA8b9+1
   yI8W+enbcT5P708x1PyT+tV6+1LuKBkRE8UdLPtPvNTqn18OulEInBhbS
   gv6wUwquiSlTbwtJu29dnQC1wSUKmC6K7MMRzehEWGCdF0mdbTrzXxYjT
   sMxO6MVWS7ri6oGo5Yvd/tDwdZyD7FOTJ2F3MiJN9VZgRE9HYM1+afTex
   Q==;
X-CSE-ConnectionGUID: 2gXxjsIPRcinymIJkJsXTA==
X-CSE-MsgGUID: Y+iK3jgkTaCx/Z3BZAnb8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="95595349"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="95595349"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 05:14:18 -0800
X-CSE-ConnectionGUID: rIKrCRFIS3W8H+2A3noWuw==
X-CSE-MsgGUID: BKcjTNniTmyVQQZIHwtcaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="243707589"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 20 Jan 2026 05:14:16 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 1842199; Tue, 20 Jan 2026 14:14:15 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v1 1/2] platform/chrome: cros_typec_switch: Don't touch  struct fwnode_handle::dev
Date: Tue, 20 Jan 2026 14:12:30 +0100
Message-ID: <20260120131413.1697891-2-andriy.shevchenko@linux.intel.com>
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

The 'dev' field in struct fwnode is special and related to device links,
There no driver should use it for printing messages. Fix incorrect use
of private field.

Fixes: affc804c44c8 ("platform/chrome: cros_typec_switch: Add switch driver")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/chrome/cros_typec_switch.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_typec_switch.c b/drivers/platform/chrome/cros_typec_switch.c
index 8d7c34abb0a1..d8a28d4e51a8 100644
--- a/drivers/platform/chrome/cros_typec_switch.c
+++ b/drivers/platform/chrome/cros_typec_switch.c
@@ -230,20 +230,20 @@ static int cros_typec_register_switches(struct cros_typec_switch_data *sdata)
 
 		adev = to_acpi_device_node(fwnode);
 		if (!adev) {
-			dev_err(fwnode->dev, "Couldn't get ACPI device handle\n");
+			dev_err(dev, "Couldn't get ACPI device handle for %pfwP\n", fwnode);
 			ret = -ENODEV;
 			goto err_switch;
 		}
 
 		ret = acpi_evaluate_integer(adev->handle, "_ADR", NULL, &index);
 		if (ACPI_FAILURE(ret)) {
-			dev_err(fwnode->dev, "_ADR wasn't evaluated\n");
+			dev_err(dev, "_ADR wasn't evaluated for %pfwP\n", fwnode);
 			ret = -ENODATA;
 			goto err_switch;
 		}
 
 		if (index >= EC_USB_PD_MAX_PORTS) {
-			dev_err(fwnode->dev, "Invalid port index number: %llu\n", index);
+			dev_err(dev, "%pfwP: Invalid port index number: %llu\n", fwnode, index);
 			ret = -EINVAL;
 			goto err_switch;
 		}
-- 
2.50.1

