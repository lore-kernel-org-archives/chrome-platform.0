Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76B84A5C4C
	for <chrome-platform@lists.linux.dev>; Thu,  8 Oct 2026 13:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791466867; cv=none; b=CIiP6K7KW1rzGfoc7qWVZNcHqFkU81v96fSqDeWPXzq4hP1k8g9lBD+931UMsszHwHQzHJ1FQJuErOVfMAi/T9q0a7lyAlC840pbTZVexDdfArF/07myjnhO7PN/YDauWhnuX1gkVZOAah+bEIaSatFvQRyaNZQ8iF8x5g0G0Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791466867; c=relaxed/simple;
	bh=OkmbdjllVJ09hxRLCcdjDYmv3ytvVrVwErt1QzjeAuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hij2n4Jk303YNrWPyjJ1Nc+iaAQIBa9DyFMeNWOGq4+Usu2km4/WdWyenUP3Qb081DynzMSIoM53XZvwzhqYWEHkJwCFUgIWqo+LRaFG5LSVphSM5c8m9nqFREkpfJsESQnB7Im+iZpIJm9WHf9f0FtC4wDm7cl9MCp1+q8xdYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lIBMhTiU; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lIBMhTiU"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2e43f3d1fdso720527766b.3
        for <chrome-platform@lists.linux.dev>; Thu, 08 Oct 2026 06:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791466863; x=1792071663; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2pYmZqPJ22KPbrJa3Ej6igDX2C7LId5rL2UWN0e7yKE=;
        b=lIBMhTiUuBzbBlj1AsCXcYlwLvK7op52zOkc2T6cRXd28b0HdXTJdtDXxV/9E7ZsSR
         1z1It+QthkGlw6He2Uw86Uv0ha/mXvWD46UPrLCL8J1LNpckfYefUj6ilnB9PJValZFM
         DylSTZFdBQi2MPuht+JfJyFCB6ayhPXK9d22c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791466863; x=1792071663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2pYmZqPJ22KPbrJa3Ej6igDX2C7LId5rL2UWN0e7yKE=;
        b=n024F/MjBRel/1OVCDUjOQoTcvNVba2LzAAaLhdP6+Y3WffQLj5uicNsHMM7n3S7hd
         5TDErPDUPIH41zDry/UVFbioUOr+vHudiDRUDED4P5sexFWEr0UbIgEohP02Kel/UiPR
         AdpV15KFiHdwAAU3BAus1jyFAjC+G0iG64BhbaU4eJ9ULPFxdxmrO/zgh4WLyPyShSQs
         6HJwKQt9uNjCpK5RcWYT/qmeqCMk1wdgGp3PlwZSgOLZFCsMw8xzzdn+S8kqR/5zn/6T
         aTAmsZkLJCTpUPZBgmUB3QV8VoGYhRUGpEVE2Op6y4JsIHjBI4FT37qfsWqI68G3+16R
         aYAA==
X-Gm-Message-State: AFuF++nLqTfDabt3XsXIxM9UBRmr4CeFUSZblleJiNes/Ng8rxLbh06K
	RTqqWk3JDJFtzHIurOcqudvyiDfK00cYrBB3DesTKLL5mqhD/yxPF5CAX8dhnVlx8g==
X-Gm-Gg: AYBFou1QOZhtMv8teo1RX5S3rKV5b+9nida2higumV7KnVeWZ+OH0BAwH0qv1vPSlwZ
	uowZ77odYSMqZIVoDQKcp4iyOCb3W9Y/WKYCABzReedoW5RPouudsYfwQAm3i4D10SaOyBGxruy
	VZvJoR9ud8VSjUYq2aIfOn+cSfV86IkfJVVlWwHA3T3jLHiLR2qZI6Eg19AiZipbAhJdBJ+yxUq
	9/0Pvq+GHVoVtPc+fhoM5B2MUCrsqUDEy2W62HdHwYKf8KRJv+GmlZh+M8hVmWZgLVN9+WtazVe
	QRsiAamSycqfbtkY3TOgkUdSFmfnpRVeLLc8balSIRIhLQLnDTJxwIayICza9u/X/69lAbhTXn0
	HJW2SQ1InzTwzfiVKLEqKjxURxlUqQNr7eZhSxbN0itH5R/55AqfRG/FUrKe/dHQnMhRMwqQRp4
	wMWgSr8ypWpEiheKHjtSr4D9rhDxb5S756cm6ZzSfEMKbMxQ95fkcJ28iJ60eQc0PqiL5pXTgfl
	7ctjAkg9sD8wPQQ2CHylB8Zyay0sHb/AwatBWgJFg==
X-Received: by 2002:a17:907:9618:b0:c31:6929:b25a with SMTP id a640c23a62f3a-c317c171f72mr531431266b.46.1791466862884;
        Thu, 08 Oct 2026 06:41:02 -0700 (PDT)
Received: from localhost (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c31a100e771sm452566b.83.2026.10.08.06.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 06:41:02 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 1/2] platform/chrome: cros_ec_typec: Enforce priority-based mode selection
Date: Thu,  8 Oct 2026 13:40:55 +0000
Message-ID: <20261008134056.3816556-2-akuchynski@chromium.org>
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
In-Reply-To: <20261008134056.3816556-1-akuchynski@chromium.org>
References: <20261008134056.3816556-1-akuchynski@chromium.org>
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
index 50a68819ceb7b..718d06fa24132 100644
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
index 66c546bf89b53..116329dd113f8 100644
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
2.56.0.360.g66cac248cb-goog

