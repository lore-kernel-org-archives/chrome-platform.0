Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D762BDC0C
	for <chrome-platform@lists.linux.dev>; Thu,  5 Feb 2026 10:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770285871; cv=none; b=dOzO7NGuJgVR75jPVqQf73qWNIEv/Idv1788EtRuSS/t6/1UPCq05Vb2N1xmw4F7S/IEvublQ8i5prAXvHQSeYD4oQ+UoiY0a09eQd+o/zLVVxEsogjIQ256WFB5FxvyvDwi6y04nbDbr9eD5Lbj8N6LQ6WOnEEiIcmEQyAzAUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770285871; c=relaxed/simple;
	bh=ckYo0CE7QR8sRAvNGOZvlZQJSM3XHolf4tq1HV3qQhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=g6u/7eW3HDEfG8arQdnzbiyxLH148HgaLWezNke80ZW3fUvLvoF8cs5SrPl5O9/VNaKGO8+GiVaXh9AQ+37M+SPstCm8cvn1g2onqd435gDULQl47RqJMa0CbnmNX3YYeT3l8bEWsv9NzIIAKU5cRt0wWMcXI82rCsXZh5pkY4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=Y7gtmchU; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="Y7gtmchU"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 8F86E600085A;
	Thu,  5 Feb 2026 10:04:21 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id 6epsxUExVwbP; Thu,  5 Feb 2026 10:04:19 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id E50536002433;
	Thu,  5 Feb 2026 10:04:18 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1770285859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Kbj6yfKDQ4DHguiz/tuvFbFlksZY/4nPK+uO+vaL8pE=;
	b=Y7gtmchUpk+HzJsP22ovExTd4FSrTvSx+pg0K/QQ2I+AUaBMqBBRdFcyBi8p64ozbZb/2B
	NxjgWB6d4RNAjdxT/9oz+71aJdStJIRGjgrg9FUlE/8jcuTJ+Essw6m8G6I0aON0lxBBzk
	SjVTxfgatil8ils6SZ/BKHP+5+Km4bPyge6lKKmtfWBqMP/sLlTZDAxVcDZeKhz3HI+9Wc
	MxyYeWcK+NKdnzQL3PurOq2vjBFVUgAGhjmJjKWxKpHMMVUQ8gBZ0Zdsz2tVn4v1yGcOZo
	ySAhBVY5JEQE6At2lx7h550l0HLGLHLmBIIs7IXxfvOpWiZoRKbGRj52L642wQ==
Received: from [10.39.152.230] (unknown [87.58.94.208])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 61438360134;
	Thu,  5 Feb 2026 10:04:17 +0000 (WET)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Thu, 05 Feb 2026 10:04:09 +0000
Subject: [PATCH] platform/chrome: cros_ec_typec: Skip Type-C mux handling
 in EC-driven devices
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-smaug-type_c-v1-1-d6e556bf6640@tecnico.ulisboa.pt>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyML3eLcxNJ03ZLKgtT4ZN0UY5MkS1NDg7Qk01QloJaCotS0zAqwcdG
 xtbUAsgb78V4AAAA=
X-Change-ID: 20260128-smaug-type_c-d34b9510fb5e
To: Benson Leung <bleung@chromium.org>, 
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
 Jameson Thies <jthies@google.com>, 
 Andrei Kuchynski <akuchynski@chromium.org>, 
 Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770285857; l=5758;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=ckYo0CE7QR8sRAvNGOZvlZQJSM3XHolf4tq1HV3qQhU=;
 b=cSzGWU3ewoF6Piel3E5hCe1zIAc16qzac7Jqr641Wc1fgq5D+PR1pe7CYxpPaOQpWztgfmM6o
 rm8t2nPmUvWCL0fgn1eX2cXWJvET+273FjgtP0viFtsgAy8qfNxm/4b
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

Currently the code assumes that the EC firmware will leave Type-C mux
handling logic to the AP, exposing an interface to query and change the
mux state via a request from the AP. However, in devices such as Smaug
the EC automatically takes care of mux configuration and only USB role
switching needs to be handled by the AP. In fact, in such devices this
interface is not exposed by the EC making the whole process fail,
including role switching.

Fix this by first separating Type-C mux handling and USB role switching,
explicitly querying the behaviour of the EC and execute each part
conditionally according to what the EC reported.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/platform/chrome/cros_ec_typec.c | 49 +++++++++++++++++++++++----------
 drivers/platform/chrome/cros_ec_typec.h |  2 +-
 2 files changed, 35 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index b712bcff6fb2..bd7e6c365cab 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -751,11 +751,10 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 	}
 
 	/* No change needs to be made, let's exit early. */
-	if (port->mux_flags == resp.flags && port->role == pd_ctrl->role)
+	if (port->mux_flags == resp.flags)
 		return 0;
 
 	port->mux_flags = resp.flags;
-	port->role = pd_ctrl->role;
 
 	if (port->mux_flags == USB_PD_MUX_NONE) {
 		ret = cros_typec_usb_disconnect_state(port);
@@ -771,12 +770,6 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 	if (ret)
 		return ret;
 
-	ret = usb_role_switch_set_role(typec->ports[port_num]->role_sw,
-					pd_ctrl->role & PD_CTRL_RESP_ROLE_DATA
-					? USB_ROLE_HOST : USB_ROLE_DEVICE);
-	if (ret)
-		return ret;
-
 	if (port->mux_flags & USB_PD_MUX_USB4_ENABLED) {
 		ret = cros_typec_enable_usb4(typec, port_num, pd_ctrl);
 	} else if (port->mux_flags & USB_PD_MUX_TBT_COMPAT_ENABLED) {
@@ -822,6 +815,25 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 	return ret;
 }
 
+static int cros_typec_set_role(struct cros_typec_data *typec, int port_num,
+			       struct ec_response_usb_pd_control_v1 *resp)
+{
+	enum usb_role cur_role = usb_role_switch_get_role(typec->ports[port_num]->role_sw);
+	enum usb_role role = resp->role & PD_CTRL_RESP_ROLE_DATA ? USB_ROLE_HOST :
+								   USB_ROLE_DEVICE;
+	bool connected = resp->enabled & PD_CTRL_RESP_ENABLED_CONNECTED;
+	int ret;
+
+	if (!connected || cur_role == role)
+		return 0;
+
+	ret = usb_role_switch_set_role(typec->ports[port_num]->role_sw, role);
+	if (ret)
+		dev_err(typec->dev, "Failed USB role switch, err = %d\n", ret);
+
+	return ret;
+}
+
 static void cros_typec_set_port_params_v0(struct cros_typec_data *typec,
 		int port_num, struct ec_response_usb_pd_control *resp)
 {
@@ -1251,27 +1263,32 @@ static int cros_typec_port_update(struct cros_typec_data *typec, int port_num)
 	if (ret < 0)
 		return ret;
 
-	/* Update the switches if they exist, according to requested state */
-	ret = cros_typec_configure_mux(typec, port_num, &resp);
-	if (ret)
-		dev_warn(typec->dev, "Configure muxes failed, err = %d\n", ret);
+	if (typec->ap_driven_mux) {
+		/* Update the switches if they exist, according to requested state */
+		ret = cros_typec_configure_mux(typec, port_num, &resp);
+		if (ret)
+			dev_warn(typec->dev, "Configure muxes failed, err = %d\n", ret);
+	}
 
 	dev_dbg(typec->dev, "Enabled %d: 0x%hhx\n", port_num, resp.enabled);
 	dev_dbg(typec->dev, "Role %d: 0x%hhx\n", port_num, resp.role);
 	dev_dbg(typec->dev, "Polarity %d: 0x%hhx\n", port_num, resp.polarity);
 	dev_dbg(typec->dev, "State %d: %s\n", port_num, resp.state);
 
-	if (typec->pd_ctrl_ver != 0)
+	if (typec->pd_ctrl_ver != 0) {
+		ret = cros_typec_set_role(typec, port_num,
+			(struct ec_response_usb_pd_control_v1 *)&resp);
 		cros_typec_set_port_params_v1(typec, port_num,
 			(struct ec_response_usb_pd_control_v1 *)&resp);
-	else
+	} else {
 		cros_typec_set_port_params_v0(typec, port_num,
 			(struct ec_response_usb_pd_control *) &resp);
+	}
 
 	if (typec->typec_cmd_supported)
 		cros_typec_handle_status(typec, port_num);
 
-	return 0;
+	return ret;
 }
 
 static int cros_typec_get_cmd_version(struct cros_typec_data *typec)
@@ -1375,6 +1392,8 @@ static int cros_typec_probe(struct platform_device *pdev)
 	typec->needs_mux_ack = cros_ec_check_features(ec_dev, EC_FEATURE_TYPEC_MUX_REQUIRE_AP_ACK);
 	typec->ap_driven_altmode = cros_ec_check_features(
 		ec_dev, EC_FEATURE_TYPEC_REQUIRE_AP_MODE_ENTRY);
+	typec->ap_driven_mux = cros_ec_check_features(
+		ec_dev, EC_FEATURE_USBC_SS_MUX_VIRTUAL);
 
 	ret = cros_ec_cmd(typec->ec, 0, EC_CMD_USB_PD_PORTS, NULL, 0,
 			  &resp, sizeof(resp));
diff --git a/drivers/platform/chrome/cros_ec_typec.h b/drivers/platform/chrome/cros_ec_typec.h
index f9c31f04c102..9698f27169c6 100644
--- a/drivers/platform/chrome/cros_ec_typec.h
+++ b/drivers/platform/chrome/cros_ec_typec.h
@@ -41,6 +41,7 @@ struct cros_typec_data {
 	bool typec_cmd_supported;
 	bool needs_mux_ack;
 	bool ap_driven_altmode;
+	bool ap_driven_mux;
 };
 
 /* Per port data. */
@@ -65,7 +66,6 @@ struct cros_typec_port {
 	/* Variables keeping track of switch state. */
 	struct typec_mux_state state;
 	uint8_t mux_flags;
-	uint8_t role;
 
 	struct typec_altmode *port_altmode[CROS_EC_ALTMODE_MAX];
 

---
base-commit: 1cf43b664b8b2f9cd04b9906193713e4b693dac7
change-id: 20260128-smaug-type_c-d34b9510fb5e

Best regards,
-- 
Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>

