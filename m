Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B3D6FA1
	for <chrome-platform@lists.linux.dev>; Wed, 30 Aug 2023 22:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693435189; x=1724971189;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Iyz4sar60FjU2iFbaIbTMzum/E5QGedIc3sn/3jPfuU=;
  b=ms6S4U6bQ4U0Wg4Tt0BYpSF6KqgGUClXmWV3hhfbXqZo9rDk3D/zu1X7
   pwmTQq4EF9kG6Q70zyqNHIjfcxjzawD1pAMuI/21jv93PGBWGVQsIJOKN
   mN5pFsOH+CgkftJTZcxZtm5INC+6a+v8uPD7uJY9wboB3gUu83gVzeFgf
   iUji3V2ize3w2ICYySx48ackauQgG9evH3CwJBBONIhIQUP4SCwFu/VUe
   /JTxFGctjnlGQ88Xk9kJ6AKqyWaXFkAClHmINDswiMlCMn+ZaYOyQQ3s1
   mOW5jjc6xny4w/CY9hVHNXL6SCn4A9JvhESld8S4/dP+n9JF1nh6dMMcy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="374677344"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="374677344"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 15:39:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="774259649"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="774259649"
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
Subject: [PATCH v2 2/5] usb: typec: Add Active or Passive cable defination to cable discover mode VDO
Date: Wed, 30 Aug 2023 15:39:47 -0700
Message-Id: <20230830223950.1360865-3-utkarsh.h.patel@intel.com>
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

As per USB Type-C Connector specification v2.2 section F.2.6, BIT25
represents Active or Passive cable. Added BIT25 defination to the
Thunderbolt 3 cable discover mode VDO.

Signed-off-by: Utkarsh Patel <utkarsh.h.patel@intel.com>
---
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

