Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B042B538F
	for <chrome-platform@lists.linux.dev>; Wed,  6 Jul 2022 17:22:57 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id i190so1918804pge.7
        for <chrome-platform@lists.linux.dev>; Wed, 06 Jul 2022 10:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2YAt0+gf7y4LMncYGHgbbPO7WyHGY2DL6V5a7Qyl00Y=;
        b=cgDAxibNWiGm3t4131O6MlXdohP4fAvhgMGhYdssbVYiURMGpIe1n91oSnu0L6hcD2
         cXbw+k9n6evV3tB5J8raBzAlHrUtUz72vuTpxzAWZDZPl684CRu2ZuXFRra7M9cdDexf
         OGmmETEyPZe0a83VvQ+kf6kdx8UiPD7l/NbKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2YAt0+gf7y4LMncYGHgbbPO7WyHGY2DL6V5a7Qyl00Y=;
        b=V3LaYQZbFEXa/VBh1RlE6s1zF33YhTODVZMKEuf2tYAoBwgLR6sfSDRWIZ78F1hN9F
         V++eflhQ28WNHYifKs1LAYlPVhgU/Kpko8WIz5wQ/7bM1/C1fvO+h90Pl72dbMtWRWxd
         th0q9iiTffBSlldRPyzVQzhjjJZYqjrc6XQ6D17Q2MDM9rO0m99dBbh6LLk+WhDHAB8D
         cFUgxAMYDVLhGcShH/BrFEqGF1ajj+5S4nJVj2QyeR+eTJMenHccaRYgkNio5yb4Fk1k
         ZISNpTELr2fH+RtPGSWeVNKtm/xjyxWHQdo4EqTJvRqlfT+DkSwJfr84z8dhT7oYzJ5a
         2O1g==
X-Gm-Message-State: AJIora8ywtoTqstZHVcHyL1NB8wtdohJR+TSIVfd6xnCr4+BrqrlmwYx
	nSROmdT8N2o5d18zaBWOp8JarA==
X-Google-Smtp-Source: AGRyM1sa+6OTXjIz2uN//xTGPLZ1Z0MVBL592m/2vJz72SaDd4PTgR09XDBlMC1z6C/fC/Sz57SPlw==
X-Received: by 2002:a05:6a02:30d:b0:412:9de2:eb48 with SMTP id bn13-20020a056a02030d00b004129de2eb48mr2929248pgb.47.1657128177257;
        Wed, 06 Jul 2022 10:22:57 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id h14-20020a170902f7ce00b0016be0d5483asm7514953plw.252.2022.07.06.10.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 10:22:56 -0700 (PDT)
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
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v2 7/9] platform/chrome: cros_typec_switch: Register mode switches
Date: Wed,  6 Jul 2022 17:15:11 +0000
Message-Id: <20220706171601.807042-8-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220706171601.807042-1-pmalani@chromium.org>
References: <20220706171601.807042-1-pmalani@chromium.org>
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

Changes since v1:
- No changes.

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

