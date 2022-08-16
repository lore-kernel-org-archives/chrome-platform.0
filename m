Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386776AA9
	for <chrome-platform@lists.linux.dev>; Tue, 16 Aug 2022 21:50:27 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id 130so10454336pfv.13
        for <chrome-platform@lists.linux.dev>; Tue, 16 Aug 2022 14:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=r1II7vmAgVkCqHsiA8BbdVtUuQAByr0L3xNyWetJTpE=;
        b=O/ZBRTe61u5Oz7sNvPyYI7TTaIrXsEwKKNX1bKqWr6ullalsDhs5kczIi2aRXGXbWS
         CxvtjReZwDe6fjYymP/vkSYHlIDmH8p+nH03bwye8IOcur/r7Dhb3U9VhAt4UuUuFK2j
         6ZFmygU0Xsv7QCm7lhwa335fzKpScNBW1S1J4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=r1II7vmAgVkCqHsiA8BbdVtUuQAByr0L3xNyWetJTpE=;
        b=Ab5rv+xDZCRue5BkT7HSzC+CrWJ2spNPTexLMj+lTTmbBUspMCeQJ4Pg3GrEPFOXaJ
         IpeVfKPNLlAD31uChlZYiktQNv/o1dZEgMNAOi/bV92X9yQdnkngA3BykPKOkF6sIMJy
         PvpW5JtYUVeucUGaBcbXSZeHoZBg37Lro9Q+We7W+Gn13SBTp9W3m0E3CSG7hIioFRbE
         mQKWk8vrNzDQ3Ncds0MQW4AgACkIeWcYzB/hUNL9/NyT8QMvX4TJTXliTz9dV0fl55OF
         bUV5fxIBTylemwRbegY7FnKLP1Y0cddiMfmIkzGCtk01c6s12TbQM+jdFRLw2pKYZ2EI
         9XPA==
X-Gm-Message-State: ACgBeo3OKfnhQLMx9r7+tYyeswUIF7RZFjlQkqcbnTq6eodNvQ+d+Vfe
	JfEQaxyfKsGqrPAQU/nQ6BQdpw==
X-Google-Smtp-Source: AA6agR7VcJI3DTVNwl+sg+k3i2VZL+p7LlwDIvFYMAvYpquIXOFcgd3PbUS10cL22ypVfNaGMPm44w==
X-Received: by 2002:a63:6a41:0:b0:41c:86b0:596b with SMTP id f62-20020a636a41000000b0041c86b0596bmr19139791pgc.582.1660686626765;
        Tue, 16 Aug 2022 14:50:26 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (137.22.168.34.bc.googleusercontent.com. [34.168.22.137])
        by smtp.gmail.com with ESMTPSA id z5-20020a623305000000b005323a1a9fecsm8916650pfz.101.2022.08.16.14.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 14:50:26 -0700 (PDT)
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
Subject: [PATCH v6 3/7] platform/chrome: cros_typec_switch: Set EC retimer
Date: Tue, 16 Aug 2022 21:48:31 +0000
Message-Id: <20220816214857.2088914-4-pmalani@chromium.org>
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

Invoke ChromeOS EC host commands to set EC-controlled retimer switches
to the state the Type-C framework instructs.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v5:
- Change "Chrome OS" -> "ChromeOS".
- Change "Type C" -> "Type-C".
- Inline mux_params struct initialization.
- Make cros_ec_cmd() invocation fit on 1 line.

Changes since v4:
- Update cros_ec_command() to cros_ec_cmd().

Changes since v3:
- No changes.

Changes since v2:
- No changes.

Changes since v1:
- No changes.

 drivers/platform/chrome/cros_typec_switch.c | 53 ++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_typec_switch.c b/drivers/platform/chrome/cros_typec_switch.c
index db773bf57899..eae7d26416aa 100644
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
@@ -28,9 +31,57 @@ struct cros_typec_switch_data {
 	struct cros_typec_port *ports[EC_USB_PD_MAX_PORTS];
 };
 
+static int cros_typec_cmd_mux_set(struct cros_typec_switch_data *sdata, int port_num, u8 index,
+				  u8 state)
+{
+	struct ec_params_typec_control req = {
+		.port = port_num,
+		.command = TYPEC_CONTROL_COMMAND_USB_MUX_SET,
+		.mux_params = {
+			.mux_index = index,
+			.mux_flags = state,
+		},
+	};
+
+	return cros_ec_cmd(sdata->ec, 0, EC_CMD_TYPEC_CONTROL, &req, sizeof(req), NULL, 0);
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
+ * The ChromeOS EC treats both mode-switches and retimers as "muxes" for the purposes of the
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
 static int cros_typec_retimer_set(struct typec_retimer *retimer, struct typec_retimer_state *state)
 {
-	return 0;
+	struct cros_typec_port *port = typec_retimer_get_drvdata(retimer);
+
+	/* Retimers have index 1. */
+	return cros_typec_configure_mux(port->sdata, port->port_num, 1, state->mode, state->alt);
 }
 
 static void cros_typec_unregister_switches(struct cros_typec_switch_data *sdata)
-- 
2.37.1.595.g718a3a8f04-goog

