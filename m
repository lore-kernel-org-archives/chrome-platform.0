Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190D9A5E
	for <chrome-platform@lists.linux.dev>; Tue, 12 Sep 2023 00:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694480291; x=1726016291;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dAdtds6Wye5TOEf5GujwvorJsvSmst09i/Z17fEawCw=;
  b=aECOg+NssD3unMpz9H+fNcdd3PZw6tRG6HZkyoM9vUNgEmeE9yjqZGei
   tbEuKhAAjNcpfe6rqpRrxSjVAxiR8ylkx0lAdLg4jZEYF6mnfCKA58Q8w
   E0OsceFmGQmmxlSLE1/vt6xbCgkpP9EmQ+52vf0134j9+MvlPHSups8oS
   Q9QnV0yJIqfvXCON4uu7eK540Tmm75XwmjkOF+f8xs53/M04t0dplM+58
   6u24HZzBF1t1O35yRqYpXrSUTu3HrDt4zBGEuUniWCceDtmQuanNdtYKH
   1SdnqZyAkF6JxcxOafMHa0GVaS23/4NP1pTXH7sJSLpT/t0vIBuH5xZkZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="382057900"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="382057900"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 17:58:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="858570610"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="858570610"
Received: from uhpatel-desk4.jf.intel.com ([10.23.15.200])
  by fmsmga002.fm.intel.com with ESMTP; 11 Sep 2023 17:58:10 -0700
From: Utkarsh Patel <utkarsh.h.patel@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	heikki.krogerus@linux.intel.com,
	pmalani@chromium.org
Cc: chrome-platform@lists.linux.dev,
	andriy.shevchenko@linux.intel.com,
	bleung@chromium.org,
	Utkarsh Patel <utkarsh.h.patel@intel.com>
Subject: [PATCH v3 2/4] usb: typec: Add Active or Passive cable defination to cable discover mode VDO
Date: Mon, 11 Sep 2023 17:57:50 -0700
Message-Id: <20230912005752.1532888-3-utkarsh.h.patel@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230912005752.1532888-1-utkarsh.h.patel@intel.com>
References: <20230912005752.1532888-1-utkarsh.h.patel@intel.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per USB Type-C Connector specification v2.2 section F.2.6, BIT25
represents Active or Passive cable. Added BIT25 defination to the
Thunderbolt 3 cable discover mode VDO.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Utkarsh Patel <utkarsh.h.patel@intel.com>
---
Changes in v3:
- Reviewed-by tag from Heikki is added.

Changes in v2:
- This change is being added as new patch in this series.

 include/linux/usb/typec_tbt.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/usb/typec_tbt.h b/include/linux/usb/typec_tbt.h
index 63dd44b72e0c..c7a2153bd6f5 100644
--- a/include/linux/usb/typec_tbt.h
+++ b/include/linux/usb/typec_tbt.h
@@ -46,6 +46,7 @@ struct typec_thunderbolt_data {
 #define TBT_CABLE_OPTICAL		BIT(21)
 #define TBT_CABLE_RETIMER		BIT(22)
 #define TBT_CABLE_LINK_TRAINING		BIT(23)
+#define TBT_CABLE_ACTIVE_PASSIVE	BIT(25)
 
 #define TBT_SET_CABLE_SPEED(_s_)	(((_s_) & GENMASK(2, 0)) << 16)
 #define TBT_SET_CABLE_ROUNDED(_g_)	(((_g_) & GENMASK(1, 0)) << 19)
-- 
2.25.1

