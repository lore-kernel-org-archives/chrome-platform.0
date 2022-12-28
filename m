Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57691A2A
	for <chrome-platform@lists.linux.dev>; Wed, 28 Dec 2022 01:09:52 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id d10so9695562pgm.13
        for <chrome-platform@lists.linux.dev>; Tue, 27 Dec 2022 17:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oi/kOlETPyv2MAO1V2HCLkw/mua4WIbZ/Rd76axTkmw=;
        b=XPNNK/pdpQNeuytYJsaqiYwaemm2ickjJ1kbCPbCpJWFnmHwC6uAaZ28x8m+64qwaz
         FFUtco2Gwgngd8D+vIcoWIxYtQtyVLOwfdSWTCyUVqp55cjssGMrbyBnog5eY7EXtDe0
         RfbbXbxdQiJxzrOBANsD10JSlZIHMgGVzM1e0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oi/kOlETPyv2MAO1V2HCLkw/mua4WIbZ/Rd76axTkmw=;
        b=ENGITcYTQXYG/zOET6IjR5TBPuzzIK/aK6RxxHw2SIseS0aF3+ObTRoOIC8XsgKUYY
         J21Yz3DdKTmoLvi1dcBHIS87MtBEREZ5p3sQGmU5TB7uVgBo1Qtb2R1n3C2qzDo5y6dD
         ot7k+qgiIj01I7LROcNrx5kq3vw7vItyIgzFlm24r/dLj+23Lqf9HzlRBiLDONMhhkUO
         rJGW22iglojD4hbxXBsL7VYV2rI5vA0ybJIlIBRx1McQFPKCeRoRDm4JSTr8oHpSJdY9
         oeYdxw+978/iRXNKnh4v4fWj3MRRS+mkvOOpHa7m3yvvNsRqUmW05bfN8dhDiQLjZeGz
         5pxQ==
X-Gm-Message-State: AFqh2krMA6T6tdsfySZCBCNTXZ5OVI+zCgNpvc5gRjUtbbuK6L+rvjvh
	bMmelrOYH+ornUhDlBDcdVdM1w==
X-Google-Smtp-Source: AMrXdXuVBAPSSMLpM3oEwlDj1tsNz96oGf/u4MnYLpXIEQnfiMmpoI3CmcNWLbtoYAJyX+u2hvGGZg==
X-Received: by 2002:a62:a21e:0:b0:581:95a7:d2f4 with SMTP id m30-20020a62a21e000000b0058195a7d2f4mr757839pff.9.1672189791828;
        Tue, 27 Dec 2022 17:09:51 -0800 (PST)
Received: from pmalani.c.googlers.com.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id 68-20020a621947000000b00580e679dcf2sm6045566pfz.157.2022.12.27.17.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 17:09:51 -0800 (PST)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: heikki.krogerus@linux.intel.com,
	Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Evan Green <evgreen@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: [PATCH 08/10] platform/chrome: cros_ec_typec: Add initial VDM support
Date: Wed, 28 Dec 2022 00:45:11 +0000
Message-Id: <20221228004648.793339-9-pmalani@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20221228004648.793339-1-pmalani@chromium.org>
References: <20221228004648.793339-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ops to support USB PD VDM (Vendor Defined Message) from the port
driver. This enables the port driver to interface with alternate mode
drivers and communicate with connected peripherals.

The initial support just contains an implementation of the Enter
Mode command.

Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 MAINTAINERS                              |  1 +
 drivers/platform/chrome/Makefile         |  2 +-
 drivers/platform/chrome/cros_ec_typec.c  |  3 ++
 drivers/platform/chrome/cros_typec_vdm.c | 43 ++++++++++++++++++++++++
 drivers/platform/chrome/cros_typec_vdm.h | 10 ++++++
 5 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/chrome/cros_typec_vdm.c
 create mode 100644 drivers/platform/chrome/cros_typec_vdm.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8219b646ab50..cfccbbbb083f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5000,6 +5000,7 @@ L:	chrome-platform@lists.linux.dev
 S:	Maintained
 F:	drivers/platform/chrome/cros_ec_typec.*
 F:	drivers/platform/chrome/cros_typec_switch.c
+F:	drivers/platform/chrome/cros_typec_vdm.*
 
 CHROMEOS EC USB PD NOTIFY DRIVER
 M:	Prashant Malani <pmalani@chromium.org>
diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome/Makefile
index fd29fa74ba33..dae0ed3c8656 100644
--- a/drivers/platform/chrome/Makefile
+++ b/drivers/platform/chrome/Makefile
@@ -16,7 +16,7 @@ obj-$(CONFIG_CROS_TYPEC_SWITCH)		+= cros_typec_switch.o
 obj-$(CONFIG_CROS_EC_RPMSG)		+= cros_ec_rpmsg.o
 obj-$(CONFIG_CROS_EC_SPI)		+= cros_ec_spi.o
 cros_ec_lpcs-objs			:= cros_ec_lpc.o cros_ec_lpc_mec.o
-cros-ec-typec-objs			:= cros_ec_typec.o
+cros-ec-typec-objs			:= cros_ec_typec.o cros_typec_vdm.o
 obj-$(CONFIG_CROS_EC_TYPEC)		+= cros-ec-typec.o
 obj-$(CONFIG_CROS_EC_LPC)		+= cros_ec_lpcs.o
 obj-$(CONFIG_CROS_EC_PROTO)		+= cros_ec_proto.o cros_ec_trace.o
diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index a4eff590ca56..1e28d56b094d 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -17,6 +17,7 @@
 #include <linux/usb/typec_tbt.h>
 
 #include "cros_ec_typec.h"
+#include "cros_typec_vdm.h"
 
 #define DRV_NAME "cros-ec-typec"
 
@@ -272,6 +273,7 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
 		return PTR_ERR(amode);
 	port->port_altmode[CROS_EC_ALTMODE_DP] = amode;
 	typec_altmode_set_drvdata(amode, port);
+	amode->ops = &port_amode_ops;
 
 	/*
 	 * Register TBT compatibility alt mode. The EC will not enter the mode
@@ -286,6 +288,7 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
 		return PTR_ERR(amode);
 	port->port_altmode[CROS_EC_ALTMODE_TBT] = amode;
 	typec_altmode_set_drvdata(amode, port);
+	amode->ops = &port_amode_ops;
 
 	port->state.alt = NULL;
 	port->state.mode = TYPEC_STATE_USB;
diff --git a/drivers/platform/chrome/cros_typec_vdm.c b/drivers/platform/chrome/cros_typec_vdm.c
new file mode 100644
index 000000000000..df0102ca3a18
--- /dev/null
+++ b/drivers/platform/chrome/cros_typec_vdm.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * USB Power Delivery Vendor Defined Message (VDM) support code.
+ *
+ * Copyright 2023 Google LLC
+ * Author: Prashant Malani <pmalani@chromium.org>
+ */
+
+#include <linux/module.h>
+#include <linux/platform_data/cros_ec_commands.h>
+#include <linux/usb/pd_vdo.h>
+
+#include "cros_ec_typec.h"
+#include "cros_typec_vdm.h"
+
+static int cros_typec_port_amode_enter(struct typec_altmode *amode, u32 *vdo)
+{
+	struct cros_typec_port *port = typec_altmode_get_drvdata(amode);
+	struct ec_params_typec_control req = {
+		.port = port->port_num,
+		.command = TYPEC_CONTROL_COMMAND_SEND_VDM_REQ,
+	};
+	struct typec_vdm_req vdm_req = {};
+	u32 hdr;
+
+	hdr = VDO(amode->svid, 1, SVDM_VER_2_0, CMD_ENTER_MODE);
+	hdr |= VDO_OPOS(amode->mode);
+
+	vdm_req.vdm_data[0] = hdr;
+	vdm_req.vdm_data_objects = 1;
+	vdm_req.partner_type = TYPEC_PARTNER_SOP;
+	req.vdm_req_params = vdm_req;
+
+	dev_dbg(port->typec_data->dev, "Sending EnterMode VDM, hdr: %x, port: %d\n",
+		hdr, port->port_num);
+
+	return cros_ec_cmd(port->typec_data->ec, 0, EC_CMD_TYPEC_CONTROL, &req,
+			   sizeof(req), NULL, 0);
+}
+
+struct typec_altmode_ops port_amode_ops = {
+	.enter = cros_typec_port_amode_enter,
+};
diff --git a/drivers/platform/chrome/cros_typec_vdm.h b/drivers/platform/chrome/cros_typec_vdm.h
new file mode 100644
index 000000000000..7e282d168a98
--- /dev/null
+++ b/drivers/platform/chrome/cros_typec_vdm.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __CROS_TYPEC_VDM__
+#define __CROS_TYPEC_VDM__
+
+#include <linux/usb/typec_altmode.h>
+
+extern struct typec_altmode_ops port_amode_ops;
+
+#endif /*  __CROS_TYPEC_VDM__ */
-- 
2.39.0.314.g84b9a713c41-goog

