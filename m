Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6BE182A2
	for <chrome-platform@lists.linux.dev>; Wed, 24 May 2023 12:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684931341; x=1716467341;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3klnhOKosPwBrT++R5pTUO9av0C/hZmrxntxsqOzxiU=;
  b=WEJav6oaj1cC0saDMyeFsOfZ3Ur6HSsTjNuZJhjZk6r4DfVf0LEyEEJx
   jwikuvAsrI9PenczRmNUEmZS2q9xDYHx/aG2yDub6AZQ1EZoje2yN+kAV
   ud781BgcWQ04a9Rw4/KwFDP6CCJUoH5LEpRAcGFt9Xoq2Ew4qxoXFAOwp
   n0SxzU4cIAXivGetnai0KleqZF/jC5eFo12VdAzNxycbT99iKolz2o5xt
   fgQt41qTbIbSaN/19WCrLeASEpcMkSi4siteQwbgqPTUbpaIcXOWF263d
   eoGtGtG7f54iytC5pXkdeFb1s2QCVxlWy0TTr4W4pLOVXV/iNpd90pE6S
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="333904882"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="333904882"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 05:29:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="848731372"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="848731372"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 24 May 2023 05:28:58 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	chrome-platform@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] usb: typec: mux: Remove the "svid" device property checks
Date: Wed, 24 May 2023 15:28:59 +0300
Message-Id: <20230524122901.53659-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The background for this change:
https://lore.kernel.org/lkml/20210726231351.655302-1-bjorn.andersson@linaro.org/

The idea with that device property was that it would allow us to
support separate mode specific switches behind a single port if
necessary.

Although, I guess it is still possible that we could have that kind of
separate mode switches, especially now that the mode switch represents
a kind of virtual aggregate device that can be build from multiple
physical muxes (so the modes could need different "combos" of the
muxes), but now no such systems exist.

We can look at how to handle that kind of switches when/if we actually
have them, but for now, keeping the functions as simple as possible.

thanks,

Heikki Krogerus (2):
  usb: typec: mux: Clean up mux_fwnode_match()
  usb: typec: mux: Remove alt mode parameters from the API

 drivers/platform/chrome/cros_ec_typec.c |  2 +-
 drivers/soc/qcom/pmic_glink_altmode.c   |  5 +-
 drivers/usb/typec/class.c               |  4 +-
 drivers/usb/typec/mux.c                 | 61 ++++---------------------
 include/linux/usb/typec_mux.h           | 11 ++---
 5 files changed, 17 insertions(+), 66 deletions(-)

-- 
2.39.2

