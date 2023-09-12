Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D28E10F7
	for <chrome-platform@lists.linux.dev>; Tue, 12 Sep 2023 00:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694480293; x=1726016293;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0KRQ31svCbbSmvCwD5cuPxIgP0RgOwqBzNkFj74VG44=;
  b=BaMN2nkwtIiYoZhZ62IfJaF5l+I0c4lCevz/wXB6F4iWaYGSWXf/Mt2x
   wdw5/oBqpGKEfe0iaz+rIBuBv4gEcYsYa6nJr6PlYj5yVuXP08jVDFT39
   5v2W74WzpgOMNSuXJJbyQjQQXEzg0Evjgq2ucTHOqWNjd8Ri8E0V7BclL
   XBNdvqViq2QAXexbQR9es/W192xz24A5yVXv+VZhp+vcLIQjNT4PUQWMZ
   7y7taq5UMBHiHKHMUcNwOV9ovumo7F+hA8/kRfnORtpzwjR66Nq3y+nYR
   tTwAgwxg1fZHHA5dGAvknsf4R/S1fKyDPwtLPS7q7NA5z+Whmj+gRoGCw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="382057910"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="382057910"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 17:58:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="858570620"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="858570620"
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
Subject: [PATCH v3 4/4] usb: typec: intel_pmc_mux: Configure Displayport Alternate mode 2.1
Date: Mon, 11 Sep 2023 17:57:52 -0700
Message-Id: <20230912005752.1532888-5-utkarsh.h.patel@intel.com>
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

Mux agent driver can configure cable details such as cable type and
cable speed received as a part of displayport configuration to support
Displayport Alternate mode 2.1.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Utkarsh Patel <utkarsh.h.patel@intel.com>
---
Changes in v3:
- No change.

Changes in v2:
- No change.

 drivers/usb/typec/mux/intel_pmc_mux.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index 60ed1f809130..233958084b43 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -191,6 +191,12 @@ static int hsl_orientation(struct pmc_usb_port *port)
 	return port->orientation - 1;
 }
 
+static bool is_pmc_mux_tbt(struct acpi_device *adev)
+{
+	return acpi_dev_hid_uid_match(adev, "INTC1072", NULL) ||
+	       acpi_dev_hid_uid_match(adev, "INTC1079", NULL);
+}
+
 static int pmc_usb_send_command(struct intel_scu_ipc_dev *ipc, u8 *msg, u32 len)
 {
 	u8 response[4];
@@ -293,6 +299,24 @@ pmc_usb_mux_dp(struct pmc_usb_port *port, struct typec_mux_state *state)
 	req.mode_data |= (state->mode - TYPEC_STATE_MODAL) <<
 			 PMC_USB_ALTMODE_DP_MODE_SHIFT;
 
+	if (!is_pmc_mux_tbt(port->pmc->iom_adev)) {
+		u8 cable_speed = (data->conf & DP_CONF_SIGNALLING_MASK) >>
+				  DP_CONF_SIGNALLING_SHIFT;
+
+		u8 cable_type = (data->conf & DP_CONF_CABLE_TYPE_MASK) >>
+				 DP_CONF_CABLE_TYPE_SHIFT;
+
+		req.mode_data |= PMC_USB_ALTMODE_CABLE_SPD(cable_speed);
+
+		if (cable_type == DP_CONF_CABLE_TYPE_OPTICAL)
+			req.mode_data |= PMC_USB_ALTMODE_CABLE_TYPE;
+		else if (cable_type == DP_CONF_CABLE_TYPE_RE_TIMER)
+			req.mode_data |= PMC_USB_ALTMODE_ACTIVE_CABLE |
+					 PMC_USB_ALTMODE_RETIMER_CABLE;
+		else if (cable_type == DP_CONF_CABLE_TYPE_RE_DRIVER)
+			req.mode_data |= PMC_USB_ALTMODE_ACTIVE_CABLE;
+	}
+
 	ret = pmc_usb_command(port, (void *)&req, sizeof(req));
 	if (ret)
 		return ret;
-- 
2.25.1

