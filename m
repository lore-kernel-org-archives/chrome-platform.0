Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52502C9C
	for <chrome-platform@lists.linux.dev>; Tue,  8 Feb 2022 18:47:48 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d187so20419749pfa.10
        for <chrome-platform@lists.linux.dev>; Tue, 08 Feb 2022 10:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/3NuIwovuNz7GFfgDQq4eFqfd72S+Kgga4jDeLgjulM=;
        b=SzH2BGmudD3cz76o4hl70v9hFx3qos+SW+CF2fSdozabjfuEYin1BxdO3i1Sh3bz1k
         f0QnRL2Hg/FR+wrTeG2j/LIoVU+XsLkzJu1R0kwKk83N2TRU0H00ewQBTObfFOT07DKp
         b28EoLTtSO7N5TuA0VEV9OQpT/Dq7zIM1LSUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/3NuIwovuNz7GFfgDQq4eFqfd72S+Kgga4jDeLgjulM=;
        b=5A7UsBMDSVjLyHBJHiwHPr7ug8Vi90Q7DtgUxsTYVbqUqvYEaORntA55AI71g9SA/K
         e0r5uK2wb0gZ7af4Nyse60J3R17kqm/8R1JRG0yG/tkn5VZeRXzosUb/Qn8zzpfE6Ps9
         XsswFf67qpyy0IlQlMSeu9GIfQHbTIxVvTOAlBQvmi+Rck4SCRZRShAMb5M2FsHHWsZu
         Z9mw7iFJJQNiPHwI876p1CsDZ6Swwd4twLHAXQ3Shw0ehNELXXAH9Eza5G/nuBglKaW2
         A87RxQ83AjYldOTVEMO1SSUQ97Ka/On4tQsbEV7XaYrOO3zhXPv9kFchbRJ+fpPKeRKR
         nH+A==
X-Gm-Message-State: AOAM531SvL04enj1N5JaoU1M92YdzNXyfYb8hs/yElxxofDNU7J4KUHP
	bolIYVcpO1oA0mw+9a4HhW3PGQ==
X-Google-Smtp-Source: ABdhPJyo4hczEo4QVG0QQbOtNVE621++a+UKKID1yceuZbTeFSoguE2vzqnQAoU7XAW46pwWfXOsPw==
X-Received: by 2002:a63:8343:: with SMTP id h64mr4581287pge.566.1644346068314;
        Tue, 08 Feb 2022 10:47:48 -0800 (PST)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id gk15sm3594453pjb.3.2022.02.08.10.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 10:47:48 -0800 (PST)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	chrome-platform@lists.linux.dev (open list:CHROMEOS EC USB TYPE-C DRIVER),
	Guenter Roeck <groeck@chromium.org>
Subject: [PATCH v2 2/4] platform/chrome: cros_ec_typec: Get mux state inside configure_mux
Date: Tue,  8 Feb 2022 18:47:20 +0000
Message-Id: <20220208184721.1697194-3-pmalani@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208184721.1697194-1-pmalani@chromium.org>
References: <20220208184721.1697194-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the function which gets current mux state inside the
cros_typec_configure_mux() function. It is better to group those
bits of functionality together, and it makes it easier to move around
cros_typec_configure_mux() later.

While we are doing this, also inline the cros_typec_get_mux_info() inside
of cros_typec_configure_mux().

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes in v2:
- Changed "mux_resp" variable to "resp".

 drivers/platform/chrome/cros_ec_typec.c | 55 +++++++++++--------------
 1 file changed, 23 insertions(+), 32 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 58d08dd02f65..3d34ece7f790 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -513,27 +513,38 @@ static int cros_typec_enable_usb4(struct cros_typec_data *typec,
 }
 
 static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
-				uint8_t mux_flags,
 				struct ec_response_usb_pd_control_v2 *pd_ctrl)
 {
 	struct cros_typec_port *port = typec->ports[port_num];
+	struct ec_response_usb_pd_mux_info resp;
+	struct ec_params_usb_pd_mux_info req = {
+		.port = port_num,
+	};
 	struct ec_params_usb_pd_mux_ack mux_ack;
 	enum typec_orientation orientation;
 	int ret;
 
+	ret = cros_ec_command(typec->ec, 0, EC_CMD_USB_PD_MUX_INFO,
+			      &req, sizeof(req), &resp, sizeof(resp));
+	if (ret < 0) {
+		dev_warn(typec->dev, "Failed to get mux info for port: %d, err = %d\n",
+			 port_num, ret);
+		return ret;
+	}
+
 	/* No change needs to be made, let's exit early. */
-	if (port->mux_flags == mux_flags && port->role == pd_ctrl->role)
+	if (port->mux_flags == resp.flags && port->role == pd_ctrl->role)
 		return 0;
 
-	port->mux_flags = mux_flags;
+	port->mux_flags = resp.flags;
 	port->role = pd_ctrl->role;
 
-	if (mux_flags == USB_PD_MUX_NONE) {
+	if (port->mux_flags == USB_PD_MUX_NONE) {
 		ret = cros_typec_usb_disconnect_state(port);
 		goto mux_ack;
 	}
 
-	if (mux_flags & USB_PD_MUX_POLARITY_INVERTED)
+	if (port->mux_flags & USB_PD_MUX_POLARITY_INVERTED)
 		orientation = TYPEC_ORIENTATION_REVERSE;
 	else
 		orientation = TYPEC_ORIENTATION_NORMAL;
@@ -548,22 +559,22 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 	if (ret)
 		return ret;
 
-	if (mux_flags & USB_PD_MUX_USB4_ENABLED) {
+	if (port->mux_flags & USB_PD_MUX_USB4_ENABLED) {
 		ret = cros_typec_enable_usb4(typec, port_num, pd_ctrl);
-	} else if (mux_flags & USB_PD_MUX_TBT_COMPAT_ENABLED) {
+	} else if (port->mux_flags & USB_PD_MUX_TBT_COMPAT_ENABLED) {
 		ret = cros_typec_enable_tbt(typec, port_num, pd_ctrl);
-	} else if (mux_flags & USB_PD_MUX_DP_ENABLED) {
+	} else if (port->mux_flags & USB_PD_MUX_DP_ENABLED) {
 		ret = cros_typec_enable_dp(typec, port_num, pd_ctrl);
-	} else if (mux_flags & USB_PD_MUX_SAFE_MODE) {
+	} else if (port->mux_flags & USB_PD_MUX_SAFE_MODE) {
 		ret = cros_typec_usb_safe_state(port);
-	} else if (mux_flags & USB_PD_MUX_USB_ENABLED) {
+	} else if (port->mux_flags & USB_PD_MUX_USB_ENABLED) {
 		port->state.alt = NULL;
 		port->state.mode = TYPEC_STATE_USB;
 		ret = typec_mux_set(port->mux, &port->state);
 	} else {
 		dev_dbg(typec->dev,
 			"Unrecognized mode requested, mux flags: %x\n",
-			mux_flags);
+			port->mux_flags);
 	}
 
 mux_ack:
@@ -638,17 +649,6 @@ static void cros_typec_set_port_params_v1(struct cros_typec_data *typec,
 	}
 }
 
-static int cros_typec_get_mux_info(struct cros_typec_data *typec, int port_num,
-				   struct ec_response_usb_pd_mux_info *resp)
-{
-	struct ec_params_usb_pd_mux_info req = {
-		.port = port_num,
-	};
-
-	return cros_ec_command(typec->ec, 0, EC_CMD_USB_PD_MUX_INFO, &req,
-			       sizeof(req), resp, sizeof(*resp));
-}
-
 /*
  * Helper function to register partner/plug altmodes.
  */
@@ -946,7 +946,6 @@ static int cros_typec_port_update(struct cros_typec_data *typec, int port_num)
 {
 	struct ec_params_usb_pd_control req;
 	struct ec_response_usb_pd_control_v2 resp;
-	struct ec_response_usb_pd_mux_info mux_resp;
 	int ret;
 
 	if (port_num < 0 || port_num >= typec->num_ports) {
@@ -982,15 +981,7 @@ static int cros_typec_port_update(struct cros_typec_data *typec, int port_num)
 		cros_typec_handle_status(typec, port_num);
 
 	/* Update the switches if they exist, according to requested state */
-	ret = cros_typec_get_mux_info(typec, port_num, &mux_resp);
-	if (ret < 0) {
-		dev_warn(typec->dev,
-			 "Failed to get mux info for port: %d, err = %d\n",
-			 port_num, ret);
-		return 0;
-	}
-
-	ret = cros_typec_configure_mux(typec, port_num, mux_resp.flags, &resp);
+	ret = cros_typec_configure_mux(typec, port_num, &resp);
 	if (ret)
 		dev_warn(typec->dev, "Configure muxes failed, err = %d\n", ret);
 
-- 
2.35.0.263.gb82422642f-goog

