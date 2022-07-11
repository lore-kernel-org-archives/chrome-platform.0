Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522101FB7
	for <chrome-platform@lists.linux.dev>; Mon, 11 Jul 2022 07:28:45 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id m14so3736510plg.5
        for <chrome-platform@lists.linux.dev>; Mon, 11 Jul 2022 00:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+189CxxcoXTJww1vvNRT20TPCnm9kCVhx1btF3TMXi8=;
        b=k74DOFzNKkceSWgme9B9za4lw91QGrG2qroaIHb8gns+t7uTeteRvn4NBHF6QGCAz7
         3PaEWSWLS9kbrum42fuA4GA6Tko9EfKdNPyTKFyn1UXvXVfw6Abh+Wyp9v/uWQbAAfjC
         HHnYXgeP+D9JEx0OYFvlogJ2vUNGnqXtBqEUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+189CxxcoXTJww1vvNRT20TPCnm9kCVhx1btF3TMXi8=;
        b=hyTxJdCpzKH+FSz5cy011Vcuabugxhh5UCJI7eg4Zc+lo2VnNhxaQhHZsRWNE2nN4j
         6A/Xf/sEOU1Zrp7ir2xTFS/Yv19CYOWLBFggOZfpUot7xSAwHHCK7PNoJDtHQobXteXx
         usxSMuI6sPkFvw3lSPxWTJ67YO7iJIDOfuG9tyXzqOoXLlKTn74nSuqkUJbUIm9qzVEz
         OnEQxUYTV0fOFj+4iBaCbM7ZmqAZUs0MfMWwo8LLLwVtnTiUIuj3uAGT94Tq59y9tXHN
         FmsUfujdBX5EY8y3UpabuSNsfOHzpV0Z04cBd25zyPohz981Z2FhcR/IPVp7SsGW9cp2
         owEg==
X-Gm-Message-State: AJIora+vH3bzVjmYO/fcIwbAeDQ2+v+f8H48ge2ZGFEKr3zQAx8afY5Z
	7k3NICpE5wafa6okjibvd4x+Vg==
X-Google-Smtp-Source: AGRyM1vvlzYjpioNK7owzTp0M9LAaXsvaxsc/kYBhI2lIuqlMsmMz4iD3WVH7/La8w+rtVzCIakaMw==
X-Received: by 2002:a17:90b:4f85:b0:1f0:95d:c02b with SMTP id qe5-20020a17090b4f8500b001f0095dc02bmr14519392pjb.89.1657524524861;
        Mon, 11 Jul 2022 00:28:44 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id z8-20020aa79e48000000b0051bc5f4df1csm4012839pfq.154.2022.07.11.00.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 00:28:44 -0700 (PDT)
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
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v4 7/9] platform/chrome: cros_typec_switch: Register mode switches
Date: Mon, 11 Jul 2022 07:23:01 +0000
Message-Id: <20220711072333.2064341-8-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
In-Reply-To: <20220711072333.2064341-1-pmalani@chromium.org>
References: <20220711072333.2064341-1-pmalani@chromium.org>
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

Changes since v3:
- No changes.

Changes since v2:
- Fixed missing "static" identifier.

Changes since v1:
- No changes.

 drivers/platform/chrome/cros_typec_switch.c | 40 +++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/platform/chrome/cros_typec_switch.c b/drivers/platform/chrome/cros_typec_switch.c
index 7c01957a032d..024a2bb146b2 100644
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
2.37.0.144.g8ac04bfd2-goog

