Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753B723C4
	for <chrome-platform@lists.linux.dev>; Wed, 20 Sep 2023 02:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695177200; x=1726713200;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=05rQzQtWh1KxSddzDm2SyX+I+MTWSmmYvmusQJy6lOA=;
  b=V7oDfG2yS5T7MrJNiRzZQxX4FSHh8g951Vn87YQq9uVNqmlLc2+zGKHz
   govWfchTCpxYv2bJYV91hEGfYbAQrHAZEeE8qNuREQwQP/aHQG575ND+W
   CqbXBBeeoUa5aea8bdgClxwp9T1RFzF2+zcjz6DcvR4rZKNeB4P298k2D
   JacvN+X4fLUqnz6XiSLTkuQ4Acqb8mLZRkg8AA6p3iqE75Ui5h1TdPgRq
   bKEILWevyvuikweOVhplfynUj6T+GxRhHhjHqxrhpZ02ApgpjMKIeao6j
   8j78M1cf3eOlzDe9YEGcRGXg8lHculsFvifi6D4MG7v4Fp4qiEVt0OQ7D
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="466422443"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="466422443"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 19:33:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="816690729"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="816690729"
Received: from uhpatel-desk4.jf.intel.com ([10.23.15.215])
  by fmsmga004.fm.intel.com with ESMTP; 19 Sep 2023 19:33:13 -0700
From: Utkarsh Patel <utkarsh.h.patel@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: heikki.krogerus@linux.intel.com,
	pmalani@chromium.org,
	chrome-platform@lists.linux.dev,
	andriy.shevchenko@linux.intel.com,
	bleung@chromium.org,
	Utkarsh Patel <utkarsh.h.patel@intel.com>
Subject: [PATCH v4 4/5] platform/chrome: cros_ec_typec: Add Displayport Alternatemode 2.1 Support
Date: Tue, 19 Sep 2023 19:32:42 -0700
Message-Id: <20230920023243.2494410-5-utkarsh.h.patel@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230920023243.2494410-1-utkarsh.h.patel@intel.com>
References: <20230920023243.2494410-1-utkarsh.h.patel@intel.com>
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

Acked-by: Prashant Malani <pmalani@chromium.org>
Signed-off-by: Utkarsh Patel <utkarsh.h.patel@intel.com>
---
Changes in v4:
- Removed helper macro changes from this patch as [PATCH 3/5] is added back.
- Added Acked-by tag from Prashant.

Changes in v3:
- Removed use of variable cable_seepd.
- Added helper macro of pd_vdo.h in this patch as cros_ec_typec is the user.

Changes in v2:
- Remvoed feature flag specifice to DP2.1.
- Remvoed seperate function for DP2.1.
- Removed use of EC host coammnd to get cable details.
- TBT cable VDO is used to get cable details.
- Using VDO_CABLE_SPEED macro to get passive cable speed. 

 drivers/platform/chrome/cros_ec_typec.c | 28 +++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index d0b4d3fc40ed..cca913400b39 100644
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
@@ -524,6 +526,32 @@ static int cros_typec_enable_dp(struct cros_typec_data *typec,
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
+		dp_data.conf |=  TBT_CABLE_SPEED(cable_tbt_vdo) << DP_CONF_SIGNALLING_SHIFT;
+
+		/* Cable Type */
+		if (cable_tbt_vdo & TBT_CABLE_OPTICAL)
+			dp_data.conf |= DP_CONF_CABLE_TYPE_OPTICAL << DP_CONF_CABLE_TYPE_SHIFT;
+		else if (cable_tbt_vdo & TBT_CABLE_RETIMER)
+			dp_data.conf |= DP_CONF_CABLE_TYPE_RE_TIMER << DP_CONF_CABLE_TYPE_SHIFT;
+		else if (cable_tbt_vdo & TBT_CABLE_ACTIVE_PASSIVE)
+			dp_data.conf |= DP_CONF_CABLE_TYPE_RE_DRIVER << DP_CONF_CABLE_TYPE_SHIFT;
+	} else if (PD_IDH_PTYPE(port->c_identity.id_header) == IDH_PTYPE_PCABLE) {
+		dp_data.conf |= VDO_TYPEC_CABLE_SPEED(port->c_identity.vdo[0]) <<
+				DP_CONF_SIGNALLING_SHIFT;
+	}
+
 	ret = cros_typec_retimer_set(port->retimer, port->state);
 	if (!ret)
 		ret = typec_mux_set(port->mux, &port->state);
-- 
2.25.1

