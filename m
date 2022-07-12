Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C9E6AAC
	for <chrome-platform@lists.linux.dev>; Tue, 12 Jul 2022 21:03:28 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id x18-20020a17090a8a9200b001ef83b332f5so382803pjn.0
        for <chrome-platform@lists.linux.dev>; Tue, 12 Jul 2022 14:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oXKjVT7u/Vdw6OQapcARzJ8tfeoIWiT56vDmOkl6F3I=;
        b=OjqqmVzsv0YolRrIIZLjhjdZCq1rmYEBkn8DRiK6Wk0S2y5Ir4mr4pL/27LxVLDmQe
         aWl1whRFV+vPO/nyLDG9vb6DyCXlGyMboZjjSOMxHQxu6SSTOxqJxPuiMUF5fcOIqBRP
         4TdCdMZIwKJ6EV9qhTaoX79MbML24W6P0A1MI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oXKjVT7u/Vdw6OQapcARzJ8tfeoIWiT56vDmOkl6F3I=;
        b=wxdyc1gZF49BaXS+8J/fa6rVhqFrYMV2kzJKDB3VRbnv2gSRd93CsV5nAzn/uuVQNF
         hEMwbQ4lqPixYrDBO7CNsA3qLyEi9ODwXfjWl3dyr2eol4OFQ2N2Id5dg8IbZm2ra0VP
         27nbihvpBxq8RnQPWHcIoEBzv6H/x4/oOuRzV5zhH2GhvWSuYHOiRAPgSOn3TsMXNMBM
         lr6jypw8yLJ+ss+1OoEokKk6vZr2cRy4JO5YNYr140OLEqDbGi676CBBApGOHv756w6T
         w8BdC+s1mgDyV+Oa8Gv0W5iRicN+vQ1WYEFNxSsyLxzrO7Ied72wWcmgobASV3zA7hjT
         FRfQ==
X-Gm-Message-State: AJIora//V/gY2eZOJqkNJRFV1rMkuHGP2bSnaF0O2boB0VF4Xrww3Yr1
	J0JHYV4WJrEp5+Kmp3uFr3JpT/E++Fud/w==
X-Google-Smtp-Source: AGRyM1t3A2NeYZ46IZn1+5Gsngitu30LooC617kS/EU05ggoSiWAACIwHprl6NLuRAJwQgmOn5AP2A==
X-Received: by 2002:a17:90a:eacd:b0:1ef:84c2:418d with SMTP id ev13-20020a17090aeacd00b001ef84c2418dmr6323006pjb.101.1657659808270;
        Tue, 12 Jul 2022 14:03:28 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id a15-20020a170902eccf00b0016bf8048bd2sm7284130plh.175.2022.07.12.14.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 14:03:27 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: bleung@chromium.org,
	heikki.krogerus@linux.intel.com,
	Prashant Malani <pmalani@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Subject: [PATCH 1/2] platform/chrome: cros_ec_typec: Rename port altmode array
Date: Tue, 12 Jul 2022 21:03:17 +0000
Message-Id: <20220712210318.2671292-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename "p_altmode" to "port_altmode" which is a less ambiguous name for
the port_altmode struct array.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index d6088ba447af..b9848e80f372 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -60,8 +60,7 @@ struct cros_typec_port {
 	uint8_t mux_flags;
 	uint8_t role;
 
-	/* Port alt modes. */
-	struct typec_altmode p_altmode[CROS_EC_ALTMODE_MAX];
+	struct typec_altmode port_altmode[CROS_EC_ALTMODE_MAX];
 
 	/* Flag indicating that PD partner discovery data parsing is completed. */
 	bool sop_disc_done;
@@ -282,16 +281,16 @@ static void cros_typec_register_port_altmodes(struct cros_typec_data *typec,
 	struct cros_typec_port *port = typec->ports[port_num];
 
 	/* All PD capable CrOS devices are assumed to support DP altmode. */
-	port->p_altmode[CROS_EC_ALTMODE_DP].svid = USB_TYPEC_DP_SID;
-	port->p_altmode[CROS_EC_ALTMODE_DP].mode = USB_TYPEC_DP_MODE;
+	port->port_altmode[CROS_EC_ALTMODE_DP].svid = USB_TYPEC_DP_SID;
+	port->port_altmode[CROS_EC_ALTMODE_DP].mode = USB_TYPEC_DP_MODE;
 
 	/*
 	 * Register TBT compatibility alt mode. The EC will not enter the mode
 	 * if it doesn't support it, so it's safe to register it unconditionally
 	 * here for now.
 	 */
-	port->p_altmode[CROS_EC_ALTMODE_TBT].svid = USB_TYPEC_TBT_SID;
-	port->p_altmode[CROS_EC_ALTMODE_TBT].mode = TYPEC_ANY_MODE;
+	port->port_altmode[CROS_EC_ALTMODE_TBT].svid = USB_TYPEC_TBT_SID;
+	port->port_altmode[CROS_EC_ALTMODE_TBT].mode = TYPEC_ANY_MODE;
 
 	port->state.alt = NULL;
 	port->state.mode = TYPEC_STATE_USB;
@@ -431,7 +430,7 @@ static int cros_typec_enable_tbt(struct cros_typec_data *typec,
 		data.enter_vdo |= TBT_ENTER_MODE_ACTIVE_CABLE;
 
 	if (!port->state.alt) {
-		port->state.alt = &port->p_altmode[CROS_EC_ALTMODE_TBT];
+		port->state.alt = &port->port_altmode[CROS_EC_ALTMODE_TBT];
 		ret = cros_typec_usb_safe_state(port);
 		if (ret)
 			return ret;
@@ -473,7 +472,7 @@ static int cros_typec_enable_dp(struct cros_typec_data *typec,
 	/* Configuration VDO. */
 	dp_data.conf = DP_CONF_SET_PIN_ASSIGN(pd_ctrl->dp_mode);
 	if (!port->state.alt) {
-		port->state.alt = &port->p_altmode[CROS_EC_ALTMODE_DP];
+		port->state.alt = &port->port_altmode[CROS_EC_ALTMODE_DP];
 		ret = cros_typec_usb_safe_state(port);
 		if (ret)
 			return ret;
-- 
2.37.0.144.g8ac04bfd2-goog

