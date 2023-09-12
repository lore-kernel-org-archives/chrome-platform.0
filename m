Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7EE63E
	for <chrome-platform@lists.linux.dev>; Tue, 12 Sep 2023 00:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694480289; x=1726016289;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9LhfAq2q3BUbfDKBgwcZ7LGfRN2/Wz59hW9/3Tb5yq0=;
  b=dbv8a0l5Xr4AJ3UOjAw9lh9k8kilJovByQl5bOgeJUVRoh+y0lVB7Xap
   0RT9AHgrwsS2S2BZ8Q3gzrlyK5KNiPAVJBe4/o77qREgukiCj/VQ7++fc
   850+pVCl9rubT3n6y8H2x8l/UFCCqlV2gTe82WbJdHvjG+UuHA2fAeYD0
   8HJlBqB30WNo6SrIQqmXRJRl84si7qXXK5RkwJa+zkRPSfr0qo3CQy1xp
   87OYi78DW4C+FNtSgbjs3LkN1KkaG0BPIM8aE+xgdF0+tB8rzirWBSb5f
   spJIzkCl6z0VEtp8o8p7Hkshf+jUzrgjNwNK+jB16/8oKMqYOv8d62h1O
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="382057882"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="382057882"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 17:58:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="858570578"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="858570578"
Received: from uhpatel-desk4.jf.intel.com ([10.23.15.200])
  by fmsmga002.fm.intel.com with ESMTP; 11 Sep 2023 17:58:07 -0700
From: Utkarsh Patel <utkarsh.h.patel@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	heikki.krogerus@linux.intel.com,
	pmalani@chromium.org
Cc: chrome-platform@lists.linux.dev,
	andriy.shevchenko@linux.intel.com,
	bleung@chromium.org,
	Utkarsh Patel <utkarsh.h.patel@intel.com>
Subject: [PATCH v3 0/4] Displayport Alternate Mode 2.1 Support
Date: Mon, 11 Sep 2023 17:57:48 -0700
Message-Id: <20230912005752.1532888-1-utkarsh.h.patel@intel.com>
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

Changes in v3:
- Removed [PATCH 3/5] usb: pd: Add helper macro to get Type C cable speed
  instead added the helper function in [PATCH 3/4].
- In [PATCH 3/4] Removed use of variable cable_speed. 

Changes in v2:
- Added two new patches [PATCH 2/5] and [PATCH 3/5] in to this series.
- Removed [PATCH 2/4]  platform/chrome: cros_ec: Add Displayport
  Alternatemode 2.1 feature flag
- In [PATCH 4/5] Removed feature flag and separate function for DP2.1.
- In [PATCH 4/5] used cable vdos instead of host commands to get cable
  details.


Utkarsh Patel (4):
  usb: typec: Add Displayport Alternate Mode 2.1 Support
  usb: typec: Add Active or Passive cable defination to cable discover
    mode VDO
  platform/chrome: cros_ec_typec: Add Displayport Alternatemode 2.1
    Support
  usb: typec: intel_pmc_mux: Configure Displayport Alternate mode 2.1

 drivers/platform/chrome/cros_ec_typec.c  | 28 ++++++++++++++++++++++++
 drivers/usb/typec/altmodes/displayport.c |  5 ++++-
 drivers/usb/typec/mux/intel_pmc_mux.c    | 24 ++++++++++++++++++++
 drivers/usb/typec/ucsi/displayport.c     |  2 +-
 drivers/usb/typec/ucsi/ucsi_ccg.c        |  4 ++--
 include/linux/usb/pd_vdo.h               |  1 +
 include/linux/usb/typec_dp.h             | 28 ++++++++++++++++++++----
 include/linux/usb/typec_tbt.h            |  1 +
 8 files changed, 85 insertions(+), 8 deletions(-)

-- 
2.25.1

