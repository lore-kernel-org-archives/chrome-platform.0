Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993F21102
	for <chrome-platform@lists.linux.dev>; Mon, 15 Aug 2022 06:48:19 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id o3-20020a17090a0a0300b001f7649cd317so13684963pjo.0
        for <chrome-platform@lists.linux.dev>; Sun, 14 Aug 2022 23:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=r7FHO3XSuRcskZp9JaJ6GVlL/Z/2G05O5vC3OEP7QDc=;
        b=Skn62wd5hBqRH3K5HWiW94KGZmlsT3eBTTRKk3eQNYRMDJJhQh+HkXW5WcHd2TWd5Y
         you7kkNVhWXzXmMj5OLpOIPadbrrf4+C2XabfCPLnyo/LNh/LlahIpWUZaXvIZdxkoDu
         lo5RwLnwtZ0ySIWZPxsDd89uehq21KSiaxj+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=r7FHO3XSuRcskZp9JaJ6GVlL/Z/2G05O5vC3OEP7QDc=;
        b=y0HmTwPaJaxf/Dzr76ZCMb5vRdqITD/i4mfLvEnDr2Ps5zjy3c074HscGtPpSZP9w6
         ejLAzyu5YrCc6BZtmCR9bruP0vMqUZMOewPac9CQfXxk7KoxIordOZYONEeOR6jU0J6y
         6bF48mrEBGNrj6dgrSIC58WYlxkQFKgZAl/avfn03d7af3pP9ND5L6k8YDr0ncJDVbXI
         8vKWw7v4A4Etv0xVhW02GsE9axKDs2TTw62/BIgEdbY0JR35QNQOfEFEtKAJTEsb2Te8
         uXQHVrSKSyp+K2XSRgkOubIyVEAwd5q4LO1BZfeod8LJBbr+qWIYYpCNLbLmVFbADAFT
         916Q==
X-Gm-Message-State: ACgBeo1E5hZa+yNjsCpFVKmDQlvY2XpAoaY0Ox9QlCc059gfm/YvmQbm
	YMJjAAt1gOtmF2a/ELMtYY4BG2zBzqX7SA==
X-Google-Smtp-Source: AA6agR5fy9u+V+Zan5Q6cd+Rp1a+74ywHxOVM8U2haZGSKhWMngCa/oPeFKR/lJ+uXJRZ0dAliu8Bw==
X-Received: by 2002:a17:90b:4ccb:b0:1f5:20b4:fc9e with SMTP id nd11-20020a17090b4ccb00b001f520b4fc9emr17006992pjb.69.1660546099182;
        Sun, 14 Aug 2022 23:48:19 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (137.22.168.34.bc.googleusercontent.com. [34.168.22.137])
        by smtp.gmail.com with ESMTPSA id 200-20020a6214d1000000b0052db82ad8b2sm5988233pfu.123.2022.08.14.23.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 23:48:18 -0700 (PDT)
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
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: [PATCH v5 7/7] platform/chrome: cros_ec_typec: Get retimer handle
Date: Mon, 15 Aug 2022 06:34:30 +0000
Message-Id: <20220815063555.1384505-8-pmalani@chromium.org>
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

Where available, obtain the handle to retimer switch specified via
firmware, and update the mux configuration callsites to add retimer
support for supported modes.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v4:
- No changes.

Changes since v3:
- No changes.

Changes since v2:
- No changes.

Changes since v1:
- No changes.

 drivers/platform/chrome/cros_ec_typec.c | 44 +++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index ee54add992db..a1f804ba9dca 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -20,6 +20,7 @@
 #include <linux/usb/typec_altmode.h>
 #include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
+#include <linux/usb/typec_retimer.h>
 #include <linux/usb/typec_tbt.h>
 #include <linux/usb/role.h>
 
@@ -55,6 +56,7 @@ struct cros_typec_port {
 	struct usb_pd_identity c_identity;
 	struct typec_switch *ori_sw;
 	struct typec_mux *mux;
+	struct typec_retimer *retimer;
 	struct usb_role_switch *role_sw;
 
 	/* Variables keeping track of switch state. */
@@ -143,6 +145,12 @@ static int cros_typec_get_switch_handles(struct cros_typec_port *port,
 		goto mux_err;
 	}
 
+	port->retimer = fwnode_typec_retimer_get(fwnode);
+	if (IS_ERR(port->retimer)) {
+		dev_dbg(dev, "Retimer handle not found.\n");
+		goto retimer_sw_err;
+	}
+
 	port->ori_sw = fwnode_typec_switch_get(fwnode);
 	if (IS_ERR(port->ori_sw)) {
 		dev_dbg(dev, "Orientation switch handle not found.\n");
@@ -160,6 +168,8 @@ static int cros_typec_get_switch_handles(struct cros_typec_port *port,
 role_sw_err:
 	typec_switch_put(port->ori_sw);
 ori_sw_err:
+	typec_retimer_put(port->retimer);
+retimer_sw_err:
 	typec_mux_put(port->mux);
 mux_err:
 	return -ENODEV;
@@ -204,6 +214,21 @@ static void cros_typec_unregister_altmodes(struct cros_typec_data *typec, int po
 	}
 }
 
+/*
+ * Map the Type-C Mux state to retimer state and call the retimer set function. We need this
+ * because we re-use the Type-C mux state for retimers.
+ */
+static int cros_typec_retimer_set(struct typec_retimer  *retimer, struct typec_mux_state state)
+{
+	struct typec_retimer_state rstate = {
+		.alt = state.alt,
+		.mode = state.mode,
+		.data = state.data,
+	};
+
+	return typec_retimer_set(retimer, &rstate);
+}
+
 static int cros_typec_usb_disconnect_state(struct cros_typec_port *port)
 {
 	port->state.alt = NULL;
@@ -212,6 +237,7 @@ static int cros_typec_usb_disconnect_state(struct cros_typec_port *port)
 
 	usb_role_switch_set_role(port->role_sw, USB_ROLE_NONE);
 	typec_switch_set(port->ori_sw, TYPEC_ORIENTATION_NONE);
+	cros_typec_retimer_set(port->retimer, port->state);
 
 	return typec_mux_set(port->mux, &port->state);
 }
@@ -409,9 +435,14 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 
 static int cros_typec_usb_safe_state(struct cros_typec_port *port)
 {
+	int ret;
 	port->state.mode = TYPEC_STATE_SAFE;
 
-	return typec_mux_set(port->mux, &port->state);
+	ret = cros_typec_retimer_set(port->retimer, port->state);
+	if (!ret)
+		ret = typec_mux_set(port->mux, &port->state);
+
+	return ret;
 }
 
 /*
@@ -508,7 +539,11 @@ static int cros_typec_enable_dp(struct cros_typec_data *typec,
 	port->state.data = &dp_data;
 	port->state.mode = TYPEC_MODAL_STATE(ffs(pd_ctrl->dp_mode));
 
-	return typec_mux_set(port->mux, &port->state);
+	ret = cros_typec_retimer_set(port->retimer, port->state);
+	if (!ret)
+		ret = typec_mux_set(port->mux, &port->state);
+
+	return ret;
 }
 
 static int cros_typec_enable_usb4(struct cros_typec_data *typec,
@@ -597,7 +632,10 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 	} else if (port->mux_flags & USB_PD_MUX_USB_ENABLED) {
 		port->state.alt = NULL;
 		port->state.mode = TYPEC_STATE_USB;
-		ret = typec_mux_set(port->mux, &port->state);
+
+		ret = cros_typec_retimer_set(port->retimer, port->state);
+		if (!ret)
+			ret = typec_mux_set(port->mux, &port->state);
 	} else {
 		dev_dbg(typec->dev,
 			"Unrecognized mode requested, mux flags: %x\n",
-- 
2.37.1.595.g718a3a8f04-goog

