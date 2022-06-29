Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB6D6D17
	for <chrome-platform@lists.linux.dev>; Wed, 29 Jun 2022 23:36:34 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id i8-20020a17090aee8800b001ecc929d14dso2141249pjz.0
        for <chrome-platform@lists.linux.dev>; Wed, 29 Jun 2022 16:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0+vvOVFfU8uFzQawpdSqHer9f8bP2F/YEZu8I7Rg7Ys=;
        b=Hsx4uyO6Tu8d1qkUz87tehFJnYFEFwfbLDWpyERC4QzZKwmDRdCaBNJT0XQai56BI2
         XOIETp9qqPz0fiJPpbqaSnz5L0ChQCrUP61uGKamb28EkZ/TT/HNlZHEIBP8f/sfhzKb
         QACpp1wGtG5FUkfqBDsnsTkWY3sLEjSLnGUn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0+vvOVFfU8uFzQawpdSqHer9f8bP2F/YEZu8I7Rg7Ys=;
        b=MvBs1XfkEezf+wEN/0XTRDXwOeK+CaOIlwcorIA2SlOXRldkbC7tSqd+3j02/gZHcw
         wCpgoutdkvFlvcnh9+OvPmZfNE2Txnzw3sExF3OaSxlZ8gDcKN5Rf5llcyUjpLrES+nH
         DLQSdhoS6lLWfzm+5pWz10IrsiEFBLWtb7FHd5dutA+qHJfl5k0XqMZdf/QExcFyrvQ/
         TwX8XMQLVSBP1uudRbsjXRtG6bQohYRw+ShWqYC/lZAmOVzhprc6ggv+h3b97Q/7QkaX
         G879xTX26J6W25KUTn0D6hmddWYdw/s/7u+n52veDis+DRpfCVh6UvsYxRXpaM3VpCRu
         f0QQ==
X-Gm-Message-State: AJIora8S81DHIhX7thNx5jbo8SDhbel6xdhY2VwZpERHx0APTVBh2C7f
	2b/FWswrvaNZEw2bZGUhPdD0Sw==
X-Google-Smtp-Source: AGRyM1tMl81u3qj7l08Q5QHb4umX3T3yLJEnR7ouqJeY+P4T3j1/UV6EFuqv1Gvm5cQoy0RILlPVXg==
X-Received: by 2002:a17:902:d583:b0:16a:29de:9dfb with SMTP id k3-20020a170902d58300b0016a29de9dfbmr11374975plh.44.1656545794430;
        Wed, 29 Jun 2022 16:36:34 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id rm1-20020a17090b3ec100b001ed27d132c1sm127305pjb.2.2022.06.29.16.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 16:36:33 -0700 (PDT)
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
Subject: [PATCH 5/9] platform/chrome: cros_typec_switch: Set EC retimer
Date: Wed, 29 Jun 2022 23:32:23 +0000
Message-Id: <20220629233314.3540377-6-pmalani@chromium.org>
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

Invoke Chrome EC host commands to set EC-controlled retimer switches to
the state the Type-C framework instructs.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/platform/chrome/cros_typec_switch.c | 56 ++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_typec_switch.c b/drivers/platform/chrome/cros_typec_switch.c
index 1a795f613543..9faa442dd81a 100644
--- a/drivers/platform/chrome/cros_typec_switch.c
+++ b/drivers/platform/chrome/cros_typec_switch.c
@@ -9,7 +9,10 @@
 #include <linux/acpi.h>
 #include <linux/module.h>
 #include <linux/platform_data/cros_ec_commands.h>
+#include <linux/platform_data/cros_ec_proto.h>
 #include <linux/platform_device.h>
+#include <linux/usb/typec_altmode.h>
+#include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_retimer.h>
 
 #define DRV_NAME "cros-typec-switch"
@@ -28,10 +31,61 @@ struct cros_typec_switch_data {
 	struct cros_typec_port *ports[EC_USB_PD_MAX_PORTS];
 };
 
+static int cros_typec_cmd_mux_set(struct cros_typec_switch_data *sdata, int port_num, u8 index,
+				  u8 state)
+{
+	struct typec_usb_mux_set params = {
+		.mux_index = index,
+		.mux_flags = state,
+	};
+
+	struct ec_params_typec_control req = {
+		.port = port_num,
+		.command = TYPEC_CONTROL_COMMAND_USB_MUX_SET,
+		.mux_params = params,
+	};
+
+	return cros_ec_command(sdata->ec, 0, EC_CMD_TYPEC_CONTROL, &req,
+			       sizeof(req), NULL, 0);
+}
+
+static int cros_typec_get_mux_state(unsigned long mode, struct typec_altmode *alt)
+{
+	int ret = -EOPNOTSUPP;
+
+	if (mode == TYPEC_STATE_SAFE)
+		ret = USB_PD_MUX_SAFE_MODE;
+	else if (mode == TYPEC_STATE_USB)
+		ret = USB_PD_MUX_USB_ENABLED;
+	else if (alt && alt->svid == USB_TYPEC_DP_SID)
+		ret = USB_PD_MUX_DP_ENABLED;
+
+	return ret;
+}
+
+/*
+ * The Chrome EC treats both mode-switches and retimers as "muxes" for the purposes of the
+ * host command API. This common function configures and verifies the retimer/mode-switch
+ * according to the provided setting.
+ */
+static int cros_typec_configure_mux(struct cros_typec_switch_data *sdata, int port_num, int index,
+				    unsigned long mode, struct typec_altmode *alt)
+{
+	int ret = cros_typec_get_mux_state(mode, alt);
+
+	if (ret < 0)
+		return ret;
+
+	return cros_typec_cmd_mux_set(sdata, port_num, index, (u8)ret);
+}
+
 static int
 cros_typec_retimer_set(struct typec_retimer *retimer, struct typec_retimer_state *state)
 {
-	return 0;
+	struct cros_typec_port *port = typec_retimer_get_drvdata(retimer);
+
+	/* Retimers have index 1. */
+	return cros_typec_configure_mux(port->sdata, port->port_num, 1, state->mode, state->alt);
 }
 
 void cros_typec_unregister_switches(struct cros_typec_switch_data *sdata)
-- 
2.37.0.rc0.161.g10f37bed90-goog

