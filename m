Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24171102
	for <chrome-platform@lists.linux.dev>; Mon, 15 Aug 2022 06:45:55 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id h28so5968009pfq.11
        for <chrome-platform@lists.linux.dev>; Sun, 14 Aug 2022 23:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=gDBcg0wiSt3vt58MkrYOdJVnzrhs/iuSr5KaWkfmmJs=;
        b=Rpg2cHfn9geuKVw2PWXcGPrGGPdoOcCuc2mzQtFYXHUc1NFqJoHD+Q65LeIDlTAkZh
         Ho+BCTnrV1FW7s+DXLxQ86XaSgG7uTc0Kbtduz27bdUQ1Z+6tQ/JEgkYxGBgyePQESfo
         VyQ4VUkp78/Jr5UqUfUJ2o7oIlrxzC6oSoZeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=gDBcg0wiSt3vt58MkrYOdJVnzrhs/iuSr5KaWkfmmJs=;
        b=mW3oLd+EelFGXnA+2HvUb+gXQ7hl/WG3erZPU6xcTI3rmPg9tnqQaOKlnO+0QLVK3t
         JEMb3IXXsV96GTj+D2ArQaWm/lMQl6jufqeZqT/ziJvaYVy7e08RHPDd2/HYE0EmcHwZ
         n74RZGPpgr+FVqbjb7RIerOy7WpRiu1gJmCldp4rmc0BYgDIDwFXa5MTrD/c7oqxQ00e
         TvEZp2vUZshAx+W3j5MBxhgnQavQGEPZvLnG/7gfjXOOq+hxYSOV+W2BE1Urp/+A4WSR
         yykG6HqAWL4bMa3kvSBr4nSwbg+SjRhgy8Zlvz7r8IiDfRM1Zhvcu6ITzr96c00p9Htq
         R1Kg==
X-Gm-Message-State: ACgBeo1FChSz3JUa/MQKAMMtIm1URtIIoLN5W/y6vCtwEQma+ToONXK4
	b4QnIU45vVDaLkEi6TKmU1wXCA==
X-Google-Smtp-Source: AA6agR6+QNzJvVOPc6SO6E5AvT3N2Uy4ByBUAkDC38sn+9xFIB7EdYtQAcgRJhYAz/madR1QwA0M7w==
X-Received: by 2002:a65:57c8:0:b0:41c:fa29:ae1d with SMTP id q8-20020a6557c8000000b0041cfa29ae1dmr13125889pgr.136.1660545955347;
        Sun, 14 Aug 2022 23:45:55 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (137.22.168.34.bc.googleusercontent.com. [34.168.22.137])
        by smtp.gmail.com with ESMTPSA id 200-20020a6214d1000000b0052db82ad8b2sm5988233pfu.123.2022.08.14.23.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 23:45:54 -0700 (PDT)
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
	Kees Cook <keescook@chromium.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: [PATCH v5 5/7] platform/chrome: cros_typec_switch: Register mode switches
Date: Mon, 15 Aug 2022 06:34:26 +0000
Message-Id: <20220815063555.1384505-6-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
In-Reply-To: <20220815063555.1384505-1-pmalani@chromium.org>
References: <20220815063555.1384505-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register mode switch devices for Type C connectors, when they are
specified by firmware. These control Type C configuration for any USB
Type-C mode switches (sometimes known as "muxes") which are controlled
by the Chrome EC.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

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
index a9e114391321..9eb37b3b754f 100644
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
@@ -147,6 +149,15 @@ static int cros_typec_configure_mux(struct cros_typec_switch_data *sdata, int po
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
@@ -163,9 +174,27 @@ static void cros_typec_unregister_switches(struct cros_typec_switch_data *sdata)
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
@@ -235,6 +264,17 @@ static int cros_typec_register_switches(struct cros_typec_switch_data *sdata)
 		}
 
 		dev_dbg(dev, "Retimer switch registered for index %llu\n", index);
+
+		if (!fwnode_property_read_bool(fwnode, "mode-switch"))
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

