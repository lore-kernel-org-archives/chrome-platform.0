Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBBC8826
	for <chrome-platform@lists.linux.dev>; Wed, 30 Aug 2023 22:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693435191; x=1724971191;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=llUl9HwBkxVND4lDmEvVjbUM+OpS0iP7RqKwfjwTBFQ=;
  b=Dv6IzWDixai/WnRu3okJnETEHH/ibtAWMil7vD1pevNy1zNP3xYgb9lC
   9aSgWHAe5dGivQOniP8dymrbi4R2Xe6zj7w2rXHK1OXOfwrDu9mKPK55a
   sqbiXl7DMzTGO3C1zHcihZ26wwbPzw3KZ2Gk16mGhXyyx/+VoyiDamBKm
   ywg5kErLmtm8P5D8NeHM+SmzdgGnP1lpJ7XL2r+3ebgxoE3FNpqO5FdHb
   e5uya2qWKPHTrY8szvGPd/4jqpRY+mpee2cr3/gF9e75iXQzT+qImmFEX
   vjN9ObChKuMd6YEm+axohEbmrkx0l3bkkA6jzbeCneHfiCQwpXpU55Lsp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="374677350"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="374677350"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 15:39:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="774259655"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="774259655"
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
Subject: [PATCH v2 4/5] platform/chrome: cros_ec_typec: Add Displayport Alternatemode 2.1 Support
Date: Wed, 30 Aug 2023 15:39:49 -0700
Message-Id: <20230830223950.1360865-5-utkarsh.h.patel@intel.com>
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

Displayport Alternatemode 2.1 requires cable capabilities such as cable
signalling, cable type, DPAM version which then will be used by mux
driver for displayport configuration. These capabilities can be derived
from the Cable VDO.

Signed-off-by: Utkarsh Patel <utkarsh.h.patel@intel.com>
---
Changes in v2:
- Remvoed feature flag specifice to DP2.1.
- Remvoed seperate function for DP2.1.
- Removed use of EC host coammnd to get cable details.
- TBT cable VDO is used to get cable details.
- Using VDO_CABLE_SPEED macro to get passive cable speed. 

 drivers/platform/chrome/cros_ec_typec.c | 31 +++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index d0b4d3fc40ed..8372f13052a8 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -492,6 +492,8 @@ static int cros_typec_enable_dp(struct cros_typec_data *typec,
 {
 	struct cros_typec_port *port = typec->ports[port_num];
 	struct typec_displayport_data dp_data;
+	u32 cable_tbt_vdo;
+	u32 cable_dp_vdo;
 	int ret;
 
 	if (typec->pd_ctrl_ver < 2) {
@@ -524,6 +526,35 @@ static int cros_typec_enable_dp(struct cros_typec_data *typec,
 	port->state.data = &dp_data;
 	port->state.mode = TYPEC_MODAL_STATE(ffs(pd_ctrl->dp_mode));
 
+	/* Get cable VDO for cables with DPSID to check DPAM2.1 is supported */
+	cable_dp_vdo = cros_typec_get_cable_vdo(port, USB_TYPEC_DP_SID);
+
+	/**
+	 * Get cable VDO for thunderbolt cables and cables with DPSID but does not
+	 * support DPAM2.1.
+	 */
+	cable_tbt_vdo = cros_typec_get_cable_vdo(port, USB_TYPEC_TBT_SID);
+
+	if (cable_dp_vdo & DP_CAP_DPAM_VERSION) {
+		dp_data.conf |= cable_dp_vdo;
+	} else if (cable_tbt_vdo) {
+		u8 cable_speed = TBT_CABLE_SPEED(cable_tbt_vdo);
+
+		dp_data.conf |= cable_speed << DP_CONF_SIGNALLING_SHIFT;
+
+		/* Cable Type */
+		if (cable_tbt_vdo & TBT_CABLE_OPTICAL)
+			dp_data.conf |= DP_CONF_CABLE_TYPE_OPTICAL << DP_CONF_CABLE_TYPE_SHIFT;
+		else if (cable_tbt_vdo & TBT_CABLE_RETIMER)
+			dp_data.conf |= DP_CONF_CABLE_TYPE_RE_TIMER << DP_CONF_CABLE_TYPE_SHIFT;
+		else if (cable_tbt_vdo & TBT_CABLE_ACTIVE_PASSIVE)
+			dp_data.conf |= DP_CONF_CABLE_TYPE_RE_DRIVER << DP_CONF_CABLE_TYPE_SHIFT;
+	} else if (PD_IDH_PTYPE(port->c_identity.id_header) == IDH_PTYPE_PCABLE) {
+		u8 cable_speed = VDO_CABLE_SPEED(port->c_identity.vdo[0]);
+
+		dp_data.conf |= cable_speed << DP_CONF_SIGNALLING_SHIFT;
+	}
+
 	ret = cros_typec_retimer_set(port->retimer, port->state);
 	if (!ret)
 		ret = typec_mux_set(port->mux, &port->state);
-- 
2.25.1

