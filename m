Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8BA1102
	for <chrome-platform@lists.linux.dev>; Mon, 15 Aug 2022 06:41:53 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id q7-20020a17090a7a8700b001f300db8677so5986403pjf.5
        for <chrome-platform@lists.linux.dev>; Sun, 14 Aug 2022 23:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=DmjHhmRYRQK+znnXE5rwgH9w/NTCsFJdGvq/FsVg4CY=;
        b=D7yaJFBWtQefZHhd2ltWvHiYWaMGjLKMMDACtsG3+unG6sLpKHAF+q5A8NbJAYQ3Fo
         xTf3B3Q6gY6SiF/AGBYDEC2Vm7oqyD1Twfu0MxQemY0MUJPIiYcarJlE+naRRXxxWEap
         tvTiqt/AaQWfiKCibzqsDq6Fq6GOcwLCNlcuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=DmjHhmRYRQK+znnXE5rwgH9w/NTCsFJdGvq/FsVg4CY=;
        b=F+DpsMw3UJ2/hzuCSrem8fEa4Pb4WCKLhM43bSd2T+F82yzY6pr0oPDUsi6j0pRQrW
         Uuiiws80XUdVg5EeTI0ekMfd8NQQ2cA+V4UtpQjqJbup7lTpb5v7mFhuyJeb7MbIqhFh
         C05SWYfyJkgOAF2V0ib1nCsRDZe8aJY1xouLudZE3ONsE9x4vwrPdtYOdbGeC8p2sd6w
         qyG3rX7A8/Eg5gGeep0NHQLIFP7GvP/bAhVTp6jk1mTFyhVUE1+O/Ml14aTE5hfZA1mp
         aE4NgSLl8h16Tp820MmQ1hYo3XIHxxMpNC8hqX9FgbGYHcBZlWoeaByl3pUqO3hrkwX7
         cpHw==
X-Gm-Message-State: ACgBeo0VP3c9CR7f/yhU9NqNjCsZlB7HiKLx51E+O7O1QPZvkXU3ZoZO
	qRtG1rSFQIMd7oF9NBZBOmR66sCT4/pt/Q==
X-Google-Smtp-Source: AA6agR7XLpaaoz0vscLb0qVgOD0YXAg4+wEejefnfT+bIw9qXQSoGhPji6Vm0B7HJ0y5ioWu74Xmyw==
X-Received: by 2002:a17:90b:164d:b0:1f6:a38b:91e9 with SMTP id il13-20020a17090b164d00b001f6a38b91e9mr17004297pjb.211.1660545712941;
        Sun, 14 Aug 2022 23:41:52 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (137.22.168.34.bc.googleusercontent.com. [34.168.22.137])
        by smtp.gmail.com with ESMTPSA id 200-20020a6214d1000000b0052db82ad8b2sm5988233pfu.123.2022.08.14.23.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 23:41:52 -0700 (PDT)
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
Subject: [PATCH v5 3/7] platform/chrome: cros_typec_switch: Set EC retimer
Date: Mon, 15 Aug 2022 06:34:21 +0000
Message-Id: <20220815063555.1384505-4-pmalani@chromium.org>
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

Invoke Chrome EC host commands to set EC-controlled retimer switches to
the state the Type-C framework instructs.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v4:
- Update cros_ec_command() to cros_ec_cmd().

Changes since v3:
- No changes.

Changes since v2:
- No changes.

Changes since v1:
- No changes.

 drivers/platform/chrome/cros_typec_switch.c | 56 ++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_typec_switch.c b/drivers/platform/chrome/cros_typec_switch.c
index 0d319e315d57..befe35655a9a 100644
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
@@ -28,9 +31,60 @@ struct cros_typec_switch_data {
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
+	return cros_ec_cmd(sdata->ec, 0, EC_CMD_TYPEC_CONTROL, &req,
+			   sizeof(req), NULL, 0);
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

