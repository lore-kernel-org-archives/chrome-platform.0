Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F646AA9
	for <chrome-platform@lists.linux.dev>; Tue, 16 Aug 2022 21:51:28 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id c2so2025690plo.3
        for <chrome-platform@lists.linux.dev>; Tue, 16 Aug 2022 14:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=V/HBLUGtbrafHDulaBOAprTvFvaFzo8t7Aw95pdiRo4=;
        b=FR1I6kqyyzfgEPe7rWRaKSh18xY/1LGfk3cjVcbvWKfPteUhAaHpUJbC008d/iCqZx
         Nb8O+c25QOEO989XAH3yS7KXALbBav/48cXQZATiHgypiOh36KlcpgQPtO8m6bIcFSaX
         dVdAzk8Qku5a5AZ+6K2eneVmQqTpi8evjyquI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=V/HBLUGtbrafHDulaBOAprTvFvaFzo8t7Aw95pdiRo4=;
        b=WQUqr54ScNtvJKwBw3oVfmIu5RcO8rCDsAOdKPUbxE7UmB1sxfcWPz19F8178y5rn5
         HglwT5++Div1qvDHpB6EWI71+9icCtATZUatGThxanoYludwX3H3F9KD/rqWONMWM8HK
         myqq9bETkhCUvZkPnrJzKB5exEho/muRcdlsWGB6ZdlJ7W6Q/z5k3u2/a1MgSWjwiLLw
         YVyCdynrrAlUp0pCgcCvweI7nsaIaWd0MdUD7G5kXxcxs8P6C2c7k//gfGCbQKCGi2+Y
         Sl9EkZVJeWmUNYAOLtG5PZm287VMQFNf1Pp/7Q7rixi+EDlFQm/5zGHIXYy5xyxospkc
         UDrw==
X-Gm-Message-State: ACgBeo3+Jb3kpm0j25xs47/sa7XV56oSuYsfHRIrIbJGJbDULdMcgc9c
	+iuHx+IZrD2MMvuH728+hpcwgw==
X-Google-Smtp-Source: AA6agR7zQmHstsMNN6y95CEPVGXA2copp9QkGVlEg4zN3irJ5gdVFcpG71l1MNHoPClicMycG1svag==
X-Received: by 2002:a17:902:aa87:b0:172:689f:106b with SMTP id d7-20020a170902aa8700b00172689f106bmr14026659plr.127.1660686688000;
        Tue, 16 Aug 2022 14:51:28 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (137.22.168.34.bc.googleusercontent.com. [34.168.22.137])
        by smtp.gmail.com with ESMTPSA id z5-20020a623305000000b005323a1a9fecsm8916650pfz.101.2022.08.16.14.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 14:51:27 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: bleung@chromium.org,
	Prashant Malani <pmalani@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: [PATCH v6 5/7] platform/chrome: cros_typec_switch: Register mode switches
Date: Tue, 16 Aug 2022 21:48:33 +0000
Message-Id: <20220816214857.2088914-6-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
In-Reply-To: <20220816214857.2088914-1-pmalani@chromium.org>
References: <20220816214857.2088914-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register mode switch devices for Type-C connectors, when they are
specified by firmware. These control Type-C configuration for any USB
Type-C mode switches (sometimes known as "muxes") which are controlled
by the ChromeOS EC.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v5:
- Change "Chrome OS" -> "ChromeOS".
- Change "Type C" -> "Type-C".
- Use device_property_present instead of fwnode_property_read_bool.

Changes since v4:
- No changes.

Changes since v3:
- No changes.

Changes since v2:
- Fixed missing "static" identifier.

Changes since v1:
- No changes.

 drivers/platform/chrome/cros_typec_switch.c | 40 +++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/platform/chrome/cros_typec_switch.c b/drivers/platform/chrome/cros_typec_switch.c
index dc84cdec8f7f..f85687adb594 100644
--- a/drivers/platform/chrome/cros_typec_switch.c
+++ b/drivers/platform/chrome/cros_typec_switch.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/usb/typec_altmode.h>
 #include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_mux.h>
 #include <linux/usb/typec_retimer.h>
 
 #define DRV_NAME "cros-typec-switch"
@@ -22,6 +23,7 @@
 /* Handles and other relevant data required for each port's switches. */
 struct cros_typec_port {
 	int port_num;
+	struct typec_mux_dev *mode_switch;
 	struct typec_retimer *retimer;
 	struct cros_typec_switch_data *sdata;
 };
@@ -143,6 +145,15 @@ static int cros_typec_configure_mux(struct cros_typec_switch_data *sdata, int po
 	return -ETIMEDOUT;
 }
 
+static int cros_typec_mode_switch_set(struct typec_mux_dev *mode_switch,
+				      struct typec_mux_state *state)
+{
+	struct cros_typec_port *port = typec_mux_get_drvdata(mode_switch);
+
+	/* Mode switches have index 0. */
+	return cros_typec_configure_mux(port->sdata, port->port_num, 0, state->mode, state->alt);
+}
+
 static int cros_typec_retimer_set(struct typec_retimer *retimer, struct typec_retimer_state *state)
 {
 	struct cros_typec_port *port = typec_retimer_get_drvdata(retimer);
@@ -159,9 +170,27 @@ static void cros_typec_unregister_switches(struct cros_typec_switch_data *sdata)
 		if (!sdata->ports[i])
 			continue;
 		typec_retimer_unregister(sdata->ports[i]->retimer);
+		typec_mux_unregister(sdata->ports[i]->mode_switch);
 	}
 }
 
+static int cros_typec_register_mode_switch(struct cros_typec_port *port,
+					   struct fwnode_handle *fwnode)
+{
+	struct typec_mux_desc mode_switch_desc = {
+		.fwnode = fwnode,
+		.drvdata = port,
+		.name = fwnode_get_name(fwnode),
+		.set = cros_typec_mode_switch_set,
+	};
+
+	port->mode_switch = typec_mux_register(port->sdata->dev, &mode_switch_desc);
+	if (IS_ERR(port->mode_switch))
+		return PTR_ERR(port->mode_switch);
+
+	return 0;
+}
+
 static int cros_typec_register_retimer(struct cros_typec_port *port, struct fwnode_handle *fwnode)
 {
 	struct typec_retimer_desc retimer_desc = {
@@ -230,6 +259,17 @@ static int cros_typec_register_switches(struct cros_typec_switch_data *sdata)
 		}
 
 		dev_dbg(dev, "Retimer switch registered for index %llu\n", index);
+
+		if (!device_property_present(fwnode->dev, "mode-switch"))
+			continue;
+
+		ret = cros_typec_register_mode_switch(port, fwnode);
+		if (ret) {
+			dev_err(dev, "Mode switch register failed\n");
+			goto err_switch;
+		}
+
+		dev_dbg(dev, "Mode switch registered for index %llu\n", index);
 	}
 
 	return 0;
-- 
2.37.1.595.g718a3a8f04-goog

