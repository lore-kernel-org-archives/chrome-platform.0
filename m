Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5982570
	for <chrome-platform@lists.linux.dev>; Mon,  6 Feb 2023 07:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675668838; x=1707204838;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=X2WBQ9RJBzamhY9mmwq8nKykzM0EbKzq7klufUYGkLY=;
  b=ZvpIaHZAiEdcA3oi0n5+L7KK7RYOVJ2JAItyQ+4+SW929OtvZZ5Xy3b2
   q/qB+yng3tHFnMu55z2wXqVXOxaDyuBggi7x/vLHG98glRXU0HeU+ldZ9
   pWnSn2Q/ARwHpRfH7vxnRMMvoPskqopcfICy4fdkm20TPV53Q1Uxz5GTP
   y+b5t2bGZV/v65fPw6KLMmDZCiFuluWfFbWe+niNstrE9Au2nA9NNyAJ7
   GVmC75hG8Ka5eRf0tAjSwVRWqmtmwmDaqaHI+FveeZ1UgCSD59tEaJiLx
   QTDlc6W9q2JjEKL5WMAdOgRDnIPtisjVpu4SapvqMwAjvb00+C9arLjAM
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="309481424"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="309481424"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 23:33:57 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="698757186"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="698757186"
Received: from unknown (HELO rajath-NUC10i7FNH..) ([10.223.165.88])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 23:33:54 -0800
From: Rajat Khandelwal <rajat.khandelwal@linux.intel.com>
To: pmalani@chromium.org,
	bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	rajat.khandelwal@intel.com,
	Rajat Khandelwal <rajat.khandelwal@linux.intel.com>
Subject: [PATCH] platform/chrome: Avoid fetching the type-C parameters again
Date: Tue,  7 Feb 2023 13:06:10 +0530
Message-Id: <20230207073610.3290391-1-rajat.khandelwal@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct 'cros_typec_port' incorporates three type-C parameters,
'ori_sw', 'retimer', and 'mux'.
These parameters in the struct 'typec_port' are being already
configured when 'typec_register_port' is being called.

The bigger picture - 'typec_register_port' can return an error and
the type-C parameters could go unconfigured. However, the callback
will return EPROBE_DEFER and the driver will again be getting probed
trying to configure them again.
However, currently, they are again tried to get fetched for the
'cros_typec_port' struct, which sometimes could result in an error
and these parameters could go unconfigured (no provision of deferring
the probe in this case, so we are left with unconfigured parameters).

Hence, assign the parameters to the corresponding ones in the struct
'typec_port' after they are fetched in 'typec_register_port'.

Signed-off-by: Rajat Khandelwal <rajat.khandelwal@linux.intel.com>
---
 drivers/platform/chrome/cros_ec_typec.c | 58 ++++++++++---------------
 1 file changed, 22 insertions(+), 36 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 001b0de95a46..0265c0d38bd6 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -24,6 +24,8 @@
 #include <linux/usb/typec_tbt.h>
 #include <linux/usb/role.h>
 
+#include "../../usb/typec/class.h"
+
 #define DRV_NAME "cros-ec-typec"
 
 #define DP_PORT_VDO	(DP_CONF_SET_PIN_ASSIGN(BIT(DP_PIN_ASSIGN_C) | BIT(DP_PIN_ASSIGN_D)) | \
@@ -141,47 +143,17 @@ static int cros_typec_parse_port_props(struct typec_capability *cap,
 	return 0;
 }
 
-static int cros_typec_get_switch_handles(struct cros_typec_port *port,
-					 struct fwnode_handle *fwnode,
-					 struct device *dev)
+static int cros_typec_get_role_switch_handle(struct cros_typec_port *port,
+					     struct fwnode_handle *fwnode,
+					     struct device *dev)
 {
-	port->mux = fwnode_typec_mux_get(fwnode, NULL);
-	if (IS_ERR(port->mux)) {
-		dev_dbg(dev, "Mux handle not found.\n");
-		goto mux_err;
-	}
-
-	port->retimer = fwnode_typec_retimer_get(fwnode);
-	if (IS_ERR(port->retimer)) {
-		dev_dbg(dev, "Retimer handle not found.\n");
-		goto retimer_sw_err;
-	}
-
-	port->ori_sw = fwnode_typec_switch_get(fwnode);
-	if (IS_ERR(port->ori_sw)) {
-		dev_dbg(dev, "Orientation switch handle not found.\n");
-		goto ori_sw_err;
-	}
-
 	port->role_sw = fwnode_usb_role_switch_get(fwnode);
 	if (IS_ERR(port->role_sw)) {
 		dev_dbg(dev, "USB role switch handle not found.\n");
-		goto role_sw_err;
+		return -ENODEV;
 	}
 
 	return 0;
-
-role_sw_err:
-	typec_switch_put(port->ori_sw);
-	port->ori_sw = NULL;
-ori_sw_err:
-	typec_retimer_put(port->retimer);
-	port->retimer = NULL;
-retimer_sw_err:
-	typec_mux_put(port->mux);
-	port->mux = NULL;
-mux_err:
-	return -ENODEV;
 }
 
 static int cros_typec_add_partner(struct cros_typec_data *typec, int port_num,
@@ -363,6 +335,18 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
 	return 0;
 }
 
+static void cros_typec_copy_port_params(struct cros_typec_port *cros_port)
+{
+	struct typec_port *port = cros_port->port;
+
+	if (IS_ERR_OR_NULL(port))
+		return;
+
+	cros_port->mux = port->mux;
+	cros_port->retimer = port->retimer;
+	cros_port->ori_sw = port->sw;
+}
+
 static int cros_typec_init_ports(struct cros_typec_data *typec)
 {
 	struct device *dev = typec->dev;
@@ -422,9 +406,11 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 			goto unregister_ports;
 		}
 
-		ret = cros_typec_get_switch_handles(cros_port, fwnode, dev);
+		cros_typec_copy_port_params(cros_port);
+
+		ret = cros_typec_get_role_switch_handle(cros_port, fwnode, dev);
 		if (ret)
-			dev_dbg(dev, "No switch control for port %d\n",
+			dev_dbg(dev, "No role-switch control for port %d\n",
 				port_num);
 
 		ret = cros_typec_register_port_altmodes(typec, port_num);
-- 
2.34.1

