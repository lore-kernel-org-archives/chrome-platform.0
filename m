Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E6C4266B8
	for <chrome-platform@lists.linux.dev>; Tue, 20 Jan 2026 13:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768914860; cv=none; b=hxSDz33e/YvKMBFZl+5lO+kB7VtbqRcUl3B0Zy+T0aO6XVeCKdEjgrMQ7L7QckpCEzRIQSgpD8tzTox6Ntg87m4/WAk3GcCHGs8s6ANZnELEef39RPlFRxpu3nPuVBgbj87Jv4SkLIygUmTTlj6gYhESBcHaF0SahEBU0EB2GjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768914860; c=relaxed/simple;
	bh=qlO5XfWXnBzJcQd1vjQxtksLXcIn0rWQJR5IyEU/5Lw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KOOglBi1xoV4unWaEVYWt66557Zd1Jn0JZ++sxBbDSVUbIPWm/UmLHzMrkeY6Kd1f4E9hZ7rUiZNODCHhoYuh7Ic7CesDPQ/7BMdGq0ezW6BdXXSdUSe0uDXZ5j4lBmO/sN4sGtTZFvDDoAxxkRlH0+S+hNWlTGMwGgi6J5OkIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VQY+fux0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VQY+fux0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768914859; x=1800450859;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qlO5XfWXnBzJcQd1vjQxtksLXcIn0rWQJR5IyEU/5Lw=;
  b=VQY+fux0yJwHy3DeGEc2OGCSTusc8g3Cq+MkmDPiXhckpojYIwLsPa2V
   LKpRbk3gT+h5eTU7smYGitKSGSIE61PeJCr5ER8Jo9aD9L7Lwr0btMSe7
   cOp3lDXNx9a7+LrxDgIXfK1lgIrZT8Thoezpmw/cQqZr+noR9cXCE0bl1
   uY/co6oNxaGeQFoQfvNMIQ1N7pGXo5PFs92neEI863kf1dzBLGkWoQ+LO
   JXRHD6wnBVhAil+xBB0T2nZmeaqNOSTcerZi8mFzAHbQjLfgXmUfTGRHh
   GxjoV54c6vr/YCX04UwlHo3Z20/mrpC67ksArtob0mEKk7qI+THCzk4s7
   A==;
X-CSE-ConnectionGUID: Z8BoeD7zRA6n9d3p2l8R0w==
X-CSE-MsgGUID: YeY87580Sl+rLKCNNZHuHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="95595347"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="95595347"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 05:14:18 -0800
X-CSE-ConnectionGUID: JEhwR5sATU+/E//kCvgCbg==
X-CSE-MsgGUID: jcstx3p3SRmTMz0Vnkj29w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="243707587"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 20 Jan 2026 05:14:16 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 159E798; Tue, 20 Jan 2026 14:14:15 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v1 0/2] platform/chrome: cros_typec_switch: Fix fwnode and _ADR handling
Date: Tue, 20 Jan 2026 14:12:29 +0100
Message-ID: <20260120131413.1697891-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While looking for something else, I have noticed a nasty use of the private
field of struct fwnode_handle in basically the only driver. So, hence the
fix and one following cleanup.

Andy Shevchenko (2):
  platform/chrome: cros_typec_switch: Don't touch  struct
    fwnode_handle::dev
  platform/chrome: cros_typec_switch: simplify code with
    acpi_get_local_u64_address()

 drivers/platform/chrome/cros_typec_switch.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

-- 
2.50.1

