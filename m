Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81CE2F38
	for <chrome-platform@lists.linux.dev>; Wed,  6 Jul 2022 17:21:32 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id i8-20020a17090a4b8800b001ef8a65bfbdso8869322pjh.1
        for <chrome-platform@lists.linux.dev>; Wed, 06 Jul 2022 10:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iKsWwpzQXwEVWxC4hA16xAKXLByt31Hz+Z1LHyl6odk=;
        b=OA2MFIvZ3ACYya3+5sy4cjFvSgoFnng2goQPIEYeRwDtH8JbMlJzdbK2rGIXZuTyns
         toWUjNuf7ovSDhd9371LGJpkFN7zkve+RQOcxyC0wJZdkHZ3/VBTH3ZYlMt0UAEBOnUz
         Ebd3OMWvkMpTNeLLX6hnmBEVKpTcbqQ8Iyzlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iKsWwpzQXwEVWxC4hA16xAKXLByt31Hz+Z1LHyl6odk=;
        b=IuDd1/GsjkFoPzGuum+HZGuQNWAuwMHj5SVfDv99Ivj1HLo6oDx2q6ETH/b8ATw3Os
         3THS1KtiR/mlZ+Ud8qSh+z458TPk4dwz6w9wNXRYyy3kyqIKJWK7LDKYImOmFsSZjqyU
         aY4S8bbz93mfzic5FeaTWzEXnwCrPnHGMb7yT/XPuSt5gpFxm/22wPuj8b/DS7x+cAf7
         ntB9duWtAcYntQ2y2IS1RCznt1iVsQ1nOWZvQYzdyaYftMPIrwOU56DFCSAk+BUWhyVd
         rSCiA1Nf7smXuh71PvPgN8jadMJLtvVxAnbu4zFhHNAfdItEr3EfEiaFcybSfjvkZCH1
         p5CQ==
X-Gm-Message-State: AJIora/G6xQL6IptLBBr+3TgTgbBDdQVYTnwiEEYHaYBgTsQJ3piK0YV
	p9Enma1TRPCp4f5XHyySzkzn3g==
X-Google-Smtp-Source: AGRyM1vPdmjyI8dTtqvwZMyk9GwZLf+KuO/p/zkeocnQ3DXNeHqvF1ymlXS6L92X4X8WSNQfBdSn2A==
X-Received: by 2002:a17:903:2347:b0:16a:33cd:5308 with SMTP id c7-20020a170903234700b0016a33cd5308mr47348306plh.122.1657128092414;
        Wed, 06 Jul 2022 10:21:32 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id h14-20020a170902f7ce00b0016be0d5483asm7514953plw.252.2022.07.06.10.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 10:21:32 -0700 (PDT)
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
Subject: [PATCH v2 5/9] platform/chrome: cros_typec_switch: Set EC retimer
Date: Wed,  6 Jul 2022 17:15:09 +0000
Message-Id: <20220706171601.807042-6-pmalani@chromium.org>
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

Invoke Chrome EC host commands to set EC-controlled retimer switches to
the state the Type-C framework instructs.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v1:
- No changes.

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

