Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736161C5D5E
	for <chrome-platform@lists.linux.dev>; Thu, 29 Jan 2026 13:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769692778; cv=none; b=saxOr27yOASffbd2he8EPTf6w5oClY3CGUH2qgcVzDsDXEJY3nCcECnjXlFRcuJo9n8KsjKp38jAbWtRrjQeMMF+78RUGsSgUiTqKkpQqFZs7yiIspbkW8Pluqcn+0cWQtL3DWQbq4XH/wNzNo05c2krfrCSHqSJ173/U3xy1II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769692778; c=relaxed/simple;
	bh=Bf7Yvu/POsAWzKY1L8pdvUlvmkJ1cHJNyMTBkkbDDag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hX1Vcnuxfkf3kYZh6CsIO9qJfi5xKWsWT0LRLFBb91wJmNX1AbDnU+6ldG9DC16awPk2bexSzwf8K74Ar1LRcC0zGW2dJR7nh6/IFdIIcUpw8FRioOGIJibpbhTf2gudr/3LM5VpJ9bzJsAw7NbaxKwpdRaVl+oftq9ME7lYOXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IM48mpME; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IM48mpME"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so131688866b.2
        for <chrome-platform@lists.linux.dev>; Thu, 29 Jan 2026 05:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769692774; x=1770297574; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gGvZX6nfZgmy3Vj2ElSTYgn1DWRFSxvOFrP+JagB/oo=;
        b=IM48mpMEWBTsA4PHGtIt1X1z4kJ+Dep72Z61d+YVPkTiz6e2furQia8RoqCuOTXzSF
         bt9+SanV5C2VaiXdNtBBBgbderf9fRrwj5BkYEYd+nepVJMp5YPRzZAjmxFixDFpBtzD
         Q2p/jWXIxFYQNiQDdMFdA3Gbm3dywrbgXvxME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769692774; x=1770297574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGvZX6nfZgmy3Vj2ElSTYgn1DWRFSxvOFrP+JagB/oo=;
        b=lCWBv4TfrDW6bPFVmgfpgpgYDijmemcxTHf7cZychEHO1SQ6ktf7QPrYCcRdDAVAh6
         +6T0N6IfsKvIc2LhZlfB0phDsmHlp67eeXOP6HAQyIlSBDBopxl4b8uaB0tvM3TkPkyD
         rsVS6caaPvyujqKNb7DMp/Gt0X5c4FPDy7sDqM5eMtTSmFK652D2MYblwB7dJ8nxsdzt
         +SujmHDoHWC0iLRTK96OC/sioOiMHYBUCmnstCqQKq7wNo4HN2+wHH9o3bKqr3ScYqK5
         1Rq4L+nrInTEb0WJN+MFoJHvtDYZnhGojcPBg4LpCLMtC92+O73Dwa8jpitYZuwkcmza
         445Q==
X-Gm-Message-State: AOJu0YwP4wDySzrkTR5515YwP+bixYyeELR75q8REVzASnH1Sura0I+P
	/wI9Ha//H6Wtcz+h1yAGT9e9Q9khYh+xfzlnqVNdW8lufcgdxTvOErtJEleWRsa9Jg==
X-Gm-Gg: AZuq6aLXYkbE/B9bhFIADI9aNrhWgvOyfCtnSboDJ9sZOPyOr80Nqj5Dnv40MYriDhn
	8lTYFQHWj1NU9SntvT8e3w/ljTpwop0xTMUW303bePoC6+0i+RhxhuXiaZcbjO3Fe70v9u+tdtY
	hONgSvRI5emZufLDrokWjcSJapZjVn/HTcJggi18jHGhEYDzJAMp7/fcJ3d3vw72nWqq++4gx1w
	IdhqQMLdgdTCIXDKlqduKhEiPddMnfCSX7nizcirc+j2sOB/CZY+VK0aNExDIQJ5ZcQWkt8jDy8
	6Pry3pAwEumi0Y/x+SOr/V587IVZr90j6ybRludwpJqKGuPGbB4OboVmvWzR7ES9O9p7oxd1Z2f
	bla24hNGUsDMEGCump8h4AU3E8vS41WY/JI3pWNAm3ihX7W1JUp8eUjWcR7PUZBspgUEzP8NhVH
	L0Ek/g+O4Ef1ySKDpf0qjSw+0gNiiO3sMbARO1/sfXBNW/A5UfB285k00ijr0Dk3hWtpr4IuDiO
	M3xH2Vm
X-Received: by 2002:a17:907:3d02:b0:b88:31c1:c76e with SMTP id a640c23a62f3a-b8dab304ff5mr552866066b.16.1769692773645;
        Thu, 29 Jan 2026 05:19:33 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1baa42sm262666666b.46.2026.01.29.05.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 05:19:32 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 1/2] platform/chrome: cros_ec_typec: Enforce priority-based mode selection
Date: Thu, 29 Jan 2026 13:19:27 +0000
Message-ID: <20260129131928.794768-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver sets mode_selection bit for each Alternate mode, thereby
preventing individual altmode drivers from activating their respective
modes.
Once the registration of all Alternate Modes is complete, the driver
verifies if USB4 mode is supported by both the port and the partner and
activates USB4 mode. In cases where USB4 is not supported, the driver
invokes typec_mode_selection_start to initiate the mode selection process
based on mode priorities.
The driver communicates the current Type-C mode to the mode selection
process via typec_altmode_state_update.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c      | 39 +++++++++++++++++++-
 drivers/platform/chrome/cros_typec_altmode.c |  8 +++-
 2 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index c0806c562bb93..d14bc90a62e6b 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -27,6 +27,11 @@
 						BIT(DP_PIN_ASSIGN_D) | \
 						BIT(DP_PIN_ASSIGN_E)))
 
+/* Delay between mode entry/exit attempts, ms */
+static const unsigned int mode_selection_delay = 1000;
+/* Timeout for a mode entry attempt, ms */
+static const unsigned int mode_selection_timeout = 4000;
+
 static void cros_typec_role_switch_quirk(struct fwnode_handle *fwnode)
 {
 #ifdef CONFIG_ACPI
@@ -325,6 +330,7 @@ static void cros_typec_remove_partner(struct cros_typec_data *typec,
 	if (!port->partner)
 		return;
 
+	typec_mode_selection_delete(port->partner);
 	cros_typec_unregister_altmodes(typec, port_num, true);
 
 	typec_partner_set_usb_power_delivery(port->partner, NULL);
@@ -421,7 +427,6 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
 		memset(&desc, 0, sizeof(desc));
 		desc.svid = USB_TYPEC_TBT_SID;
 		desc.mode = TBT_MODE;
-		desc.inactive = true;
 		amode = cros_typec_register_thunderbolt(port, &desc);
 		if (IS_ERR(amode))
 			return PTR_ERR(amode);
@@ -742,6 +747,7 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 	enum typec_orientation orientation;
 	struct cros_typec_altmode_node *node;
 	int ret;
+	u16 active_svid = 0;
 
 	ret = cros_ec_cmd(typec->ec, 0, EC_CMD_USB_PD_MUX_INFO,
 			  &req, sizeof(req), &resp, sizeof(resp));
@@ -782,8 +788,10 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 		ret = cros_typec_enable_usb4(typec, port_num, pd_ctrl);
 	} else if (port->mux_flags & USB_PD_MUX_TBT_COMPAT_ENABLED) {
 		ret = cros_typec_enable_tbt(typec, port_num, pd_ctrl);
+		active_svid = USB_TYPEC_TBT_SID;
 	} else if (port->mux_flags & USB_PD_MUX_DP_ENABLED) {
 		ret = cros_typec_enable_dp(typec, port_num, pd_ctrl);
+		active_svid = USB_TYPEC_DP_SID;
 	} else if (port->mux_flags & USB_PD_MUX_SAFE_MODE) {
 		ret = cros_typec_usb_safe_state(port);
 	} else if (port->mux_flags & USB_PD_MUX_USB_ENABLED) {
@@ -799,6 +807,9 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 			port->mux_flags);
 	}
 
+	if (port->partner)
+		typec_altmode_state_update(port->partner, active_svid, ret);
+
 	/* Iterate all partner alt-modes and set the active alternate mode. */
 	list_for_each_entry(node, &port->partner_mode_list, list) {
 		typec_altmode_update_active(
@@ -900,6 +911,7 @@ static int cros_typec_register_altmodes(struct cros_typec_data *typec, int port_
 			desc.svid = sop_disc->svids[i].svid;
 			desc.mode = j + 1;
 			desc.vdo = sop_disc->svids[i].mode_vdo[j];
+			desc.mode_selection = typec->ap_driven_altmode;
 
 			if (is_partner)
 				amode = typec_partner_register_altmode(port->partner, &desc);
@@ -940,6 +952,31 @@ static int cros_typec_register_altmodes(struct cros_typec_data *typec, int port_
 		goto err_cleanup;
 	}
 
+	/* Once all partner alt-modes are added, we should also trigger
+	 * mode selection.
+	 */
+	if (is_partner && typec->ap_driven_altmode) {
+		bool usb4_mode = (port->caps.usb_capability & USB_CAPABILITY_USB4) &&
+			(PD_VDO_UFP_DEVCAP(port->p_identity.vdo[0]) & DEV_USB4_CAPABLE);
+
+		if (usb4_mode) {
+			ret = cros_typec_enter_usb_mode(port->port, USB_MODE_USB4);
+			if (ret < 0) {
+				usb4_mode = false;
+				dev_err(typec->dev,
+					"Unable to activate USB4 mode, port: %d\n", port_num);
+			}
+		}
+		if (!usb4_mode) {
+			ret = typec_mode_selection_start(port->partner,
+							 mode_selection_delay,
+							 mode_selection_timeout);
+			if (ret < 0)
+				dev_err(typec->dev,
+					"Unable to run mode selection, port: %d\n", port_num);
+		}
+	}
+
 	return 0;
 
 err_cleanup:
diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platform/chrome/cros_typec_altmode.c
index 557340b53af03..42360945b374f 100644
--- a/drivers/platform/chrome/cros_typec_altmode.c
+++ b/drivers/platform/chrome/cros_typec_altmode.c
@@ -41,12 +41,16 @@ static void cros_typec_altmode_work(struct work_struct *work)
 {
 	struct cros_typec_altmode_data *data =
 		container_of(work, struct cros_typec_altmode_data, work);
+	int ret;
 
 	mutex_lock(&data->lock);
 
-	if (typec_altmode_vdm(data->alt, data->header, data->vdo_data,
-			      data->vdo_size))
+	ret = typec_altmode_vdm(data->alt, data->header, data->vdo_data,
+				data->vdo_size);
+	if (ret) {
 		dev_err(&data->alt->dev, "VDM 0x%x failed\n", data->header);
+		typec_altmode_state_update(data->port->partner, data->sid, ret);
+	}
 
 	data->header = 0;
 	data->vdo_data = NULL;
-- 
2.53.0.rc1.217.geba53bf80e-goog

