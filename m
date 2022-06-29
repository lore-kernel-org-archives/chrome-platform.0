Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47A46D17
	for <chrome-platform@lists.linux.dev>; Wed, 29 Jun 2022 23:38:35 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id jh14so15510481plb.1
        for <chrome-platform@lists.linux.dev>; Wed, 29 Jun 2022 16:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CuvWwcvHM3CjPq4zOn6t6Lokqjtv/6pY0DnLIhVk+yY=;
        b=iMi7r4EsH0aKZCwW/2qReJ1ynuqAASO6Ooya/u3xURCjcx9d5iAUaXuuhiRInBWHpL
         NYmtwmhO+GYkWo/mBuuHXJqIgD1dz7arR7eEF9rnY1dZ0RWIAk9YGfV52s9f4vzywnW7
         9+v1aP3vhp/TX80fV8NzFOP6IlsiBwvBSH3N4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CuvWwcvHM3CjPq4zOn6t6Lokqjtv/6pY0DnLIhVk+yY=;
        b=s3OH7YZ8TohcuGmhRshd7OaLzXXYYvVesF4sOX45yOqW3TjNUQUPAYohOWWhgSs+8/
         MYaHwK/TAu7ajiru0CW+PADhHNGQZP9/oVg9sT7lTHV0+vGzWee8bkxQ4goupVLd85ac
         pNDf11Hrxok+YK5cceEpzM4LUf5EAFeUQWzqSNpo2BrThrO9G8297WVaDX8R2Kz1cfWA
         J5x/oFdTeWNyQC28LohWU05GAeGySi2w+TkA6Np6qgNhlG5R+tx2UHue8NtbDiiSeKsF
         WHn+dphlOxwaeAY11LHftB1xx6hRi7KpsAAMiXfyK9weBSJwh326PaWo1ZSsf+BFNj7t
         qZow==
X-Gm-Message-State: AJIora/EVX1u5OeTuzw6iAOnMgYErQ/jEQlGzPAR/tSfh8FGKAlMunI4
	duvI2CntrM4Wel6Djgc6LpbUfQ==
X-Google-Smtp-Source: AGRyM1vmjCOToly6uuwaOrc3e6xRBiyAvrKgVV5jY+7oxKHWYI4IAYhvDtho/KTmV/c0V0TVzSon3g==
X-Received: by 2002:a17:902:ea04:b0:16a:1f33:cb0d with SMTP id s4-20020a170902ea0400b0016a1f33cb0dmr12887257plg.103.1656545915267;
        Wed, 29 Jun 2022 16:38:35 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id rm1-20020a17090b3ec100b001ed27d132c1sm127305pjb.2.2022.06.29.16.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 16:38:34 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: bleung@chromium.org,
	heikki.krogerus@linux.intel.com,
	Prashant Malani <pmalani@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH 7/9] platform/chrome: cros_typec_switch: Register mode switches
Date: Wed, 29 Jun 2022 23:32:25 +0000
Message-Id: <20220629233314.3540377-8-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220629233314.3540377-1-pmalani@chromium.org>
References: <20220629233314.3540377-1-pmalani@chromium.org>
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
 drivers/platform/chrome/cros_typec_switch.c | 39 +++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/platform/chrome/cros_typec_switch.c b/drivers/platform/chrome/cros_typec_switch.c
index a226f828514f..2ea42e6596b9 100644
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
 
+static int
+cros_typec_mode_switch_set(struct typec_mux_dev *mode_switch, struct typec_mux_state *state)
+{
+	struct cros_typec_port *port = typec_mux_get_drvdata(mode_switch);
+
+	/* Mode switches have index 0. */
+	return cros_typec_configure_mux(port->sdata, port->port_num, 0, state->mode, state->alt);
+}
+
 static int
 cros_typec_retimer_set(struct typec_retimer *retimer, struct typec_retimer_state *state)
 {
@@ -164,9 +175,26 @@ void cros_typec_unregister_switches(struct cros_typec_switch_data *sdata)
 		if (!sdata->ports[i])
 			continue;
 		typec_retimer_unregister(sdata->ports[i]->retimer);
+		typec_mux_unregister(sdata->ports[i]->mode_switch);
 	}
 }
 
+int cros_typec_register_mode_switch(struct cros_typec_port *port, struct fwnode_handle *fwnode)
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
 int cros_typec_register_retimer(struct cros_typec_port *port, struct fwnode_handle *fwnode)
 {
 	struct typec_retimer_desc retimer_desc = {
@@ -236,6 +264,17 @@ static int cros_typec_register_switches(struct cros_typec_switch_data *sdata)
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
2.37.0.rc0.161.g10f37bed90-goog

