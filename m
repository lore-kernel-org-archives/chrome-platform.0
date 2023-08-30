Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3153F8821
	for <chrome-platform@lists.linux.dev>; Wed, 30 Aug 2023 22:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693435191; x=1724971191;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bvi/oisHOe9cHxLUzm0gVtHD94w7IdsGsLjbydiAZFY=;
  b=TF+NekSPOfObS5f9oGowaC/mzhvjtC9gLpNfIKps/km2Ppry1VeIpLaa
   tm+4oB0VfTAHNW3cQnUL4sCbHqB2RqJWWifTJtCLI2iff/Qnjn6DhyHNn
   iLCW/6gN/LPcMioWu5uCoRGV/lg3MQmrm+fwanToUWAcbu/yhYG7/TClj
   YcNlU/YnagLRegMW2kzJ73M1rQ51Mtoxgd2grwkdQxeO7EERAPm1AkrY+
   qPjYHpPu72p6QTl+aLchKRem1aAN6/pbZn3nvxmoJHluTOjI503OL4qan
   Bg+J2OLszMF6DddONDiEVAJu0GSIwX5b+Mur7RvU3tuvDJ23z4R21RU9P
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="374677347"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="374677347"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 15:39:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="774259652"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="774259652"
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
Subject: [PATCH v2 3/5] usb: pd: Add helper macro to get Type C cable speed
Date: Wed, 30 Aug 2023 15:39:48 -0700
Message-Id: <20230830223950.1360865-4-utkarsh.h.patel@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230830223950.1360865-1-utkarsh.h.patel@intel.com>
References: <20230830223950.1360865-1-utkarsh.h.patel@intel.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added a helper macro to get the Type C cable speed when provided the
cable VDO.

Signed-off-by: Utkarsh Patel <utkarsh.h.patel@intel.com>
---
Changes in v2:
- This change is being added as new patch in this series.

 include/linux/usb/pd_vdo.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/usb/pd_vdo.h b/include/linux/usb/pd_vdo.h
index b057250704e8..3a747938cdab 100644
--- a/include/linux/usb/pd_vdo.h
+++ b/include/linux/usb/pd_vdo.h
@@ -376,6 +376,7 @@
 	 | ((vbm) & 0x3) << 9 | (sbu) << 8 | (sbut) << 7 | ((cur) & 0x3) << 5	\
 	 | (vbt) << 4 | (sopp) << 3 | ((spd) & 0x7))
 
+#define VDO_TYPEC_CABLE_SPEED(vdo)	((vdo) & 0x7)
 #define VDO_TYPEC_CABLE_TYPE(vdo)	(((vdo) >> 18) & 0x3)
 
 /*
-- 
2.25.1

