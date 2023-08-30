Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5C86FA1
	for <chrome-platform@lists.linux.dev>; Wed, 30 Aug 2023 22:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693435187; x=1724971187;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ozlbKs9/8vuWngnkgsE28HofCYoMHPiBVL2sCuWw5e4=;
  b=lgJZhf8C0epGr3IpgSVhleYvOnIA6QIOa3ubHREakZLH/+aGtSoqDz1W
   OX5fyJ2vDt131TlPXIOxropNE+Rc+2GE+wHIseEX69brAeWXvj8fd0+34
   cSkHvfo3KmGl5kYK57cIi8y4twQGkLyoTT7WBLb6zid7IojiQcChvdl4I
   GYzgTzdottQIwnwT9JMTlZXRelumCUbecLki7T6b72oJ1rb/K311neqrc
   14ELnRhK2eUaAKQsihaFl0t8eNAZxBGSTD6TXNExx3XH6DueWrQN04hdS
   Oj4GZ1f/t0vxKD6l93fq/ikhGLDTFZN+ekwYo0IMkQzOKMA4Aydfv+LjR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="374677337"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="374677337"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 15:39:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="774259643"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="774259643"
Received: from uhpatel-desk4.jf.intel.com ([10.23.15.97])
  by orsmga001.jf.intel.com with ESMTP; 30 Aug 2023 15:39:46 -0700
From: Utkarsh Patel <utkarsh.h.patel@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	heikki.krogerus@linux.intel.com,
	pmalani@chromium.org,
	chrome-platform@lists.linux.dev
Cc: andriy.shevchenko@linux.intel.com,
	bleung@chromium.org,
	Utkarsh Patel <utkarsh.h.patel@intel.com>
Subject: [PATCH v2 0/5] Displayport Alternate Mode 2.1 Support
Date: Wed, 30 Aug 2023 15:39:45 -0700
Message-Id: <20230830223950.1360865-1-utkarsh.h.patel@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series enabels cable identification flow required for Displayport
Alternate Mode 2.1 support.

Please add this series to usb-next. 

Changes in v2:
- Added two new patches [PATCH 2/5] and [PATCH 3/5] in to this series.
- Removed [PATCH 2/4]  platform/chrome: cros_ec: Add Displayport
  Alternatemode 2.1 feature flag
- In [PATCH 4/5] Removed feature flag and separate function for DP2.1.
- In [PATCH 4/5] used cable vdos instead of host commands to get cable
  details.

Utkarsh Patel (5):
  usb: typec: Add Displayport Alternate Mode 2.1 Support
  usb: typec: Add Active or Passive cable defination to cable discover
    mode VDO
  usb: pd: Add helper macro to get Type C cable speed
  platform/chrome: cros_ec_typec: Add Displayport Alternatemode 2.1
    Support
  usb: typec: intel_pmc_mux: Configure Displayport Alternate mode 2.1

 drivers/platform/chrome/cros_ec_typec.c  | 31 ++++++++++++++++++++++++
 drivers/usb/typec/altmodes/displayport.c |  5 +++-
 drivers/usb/typec/mux/intel_pmc_mux.c    | 24 ++++++++++++++++++
 drivers/usb/typec/ucsi/displayport.c     |  2 +-
 drivers/usb/typec/ucsi/ucsi_ccg.c        |  4 +--
 include/linux/usb/pd_vdo.h               |  1 +
 include/linux/usb/typec_dp.h             | 28 ++++++++++++++++++---
 include/linux/usb/typec_tbt.h            |  1 +
 8 files changed, 88 insertions(+), 8 deletions(-)

-- 
2.25.1

