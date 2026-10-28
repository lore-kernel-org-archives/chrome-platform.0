Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793178582;
	b=f+lHJC77RVm3ear1pZg3sMLluaOUNwuh71Tf7CNDZf2dljCPtZIwLC3gncV7i5MDSnCr
	 GIgG5CoGIPn0cGJx3C3ZdtV97o0IhHr4NftBZhAfgc2J7qveMxbfAj6/Cb8NsSFZ1cLTS
	 ZW5qHoWHV0v+6ATgM7ZrbUjRzeYmtkIj9ACAzSYsyr7CEEKeqVdw2o1LZLNgJOQ58ZR2X
	 WtpuhIebCf0JFXKombnCxn2RJVc4kyz27dDnhgfVFo8KfGOdXZZo02wBBtvBYmeVLombm
	 jtE5CFuKx5rZ731HL3Q0wOsl5df58OcmVTRzSeTFEmo2tHbwydYCi7SirEeLbH3HBIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=J9x+PRrcVltVfpkTQNZRX5xz8D7o9ObLUDqYS0LHH94=;
	b=OYsDk05xMZ7bVmARQfDHorVPnPmE35S05IJE0qrEfe7FhvHDhvv0tzsMA9PYB2L7YCAQ
	 BvTF8khf7JfgyObhnU+RIXoyiujFGL9qVYo76OQFtEiKDLTeF8v99Pe56IZo6QSQUAzn+
	 YCavp9fv0A7xhngdutMvyabdGe8pjegdf2X93J+eRBR8Oz5wlWXrd0aZcbgUBXrybpZC3
	 pNZoPvgFdyjioVa9Lbk4c9ats/1fQh5MDCt5OxGHnE/1vFOdj2m93A1/AeIc4PyI0u6VK
	 ubaQqEbmmkJLwxvvHRIkhsOM55P8OITRRuitsp72gDGsK/uq7HOVwVvgr9ruAa/KJlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BDBlXBDl;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93364606A31A
	for <chrome-platform@lists.linux.dev>; Wed, 28 Oct 2026 09:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93364606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BDBlXBDl
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b21cf1a580so1023169a12.1
        for <chrome-platform@lists.linux.dev>; Wed, 28 Oct 2026 02:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793178580; x=1793783380; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J9x+PRrcVltVfpkTQNZRX5xz8D7o9ObLUDqYS0LHH94=;
        b=BDBlXBDlILSTSi1Kv1vNm1P5CumW6vEFLjc4XUGeKhXHBW31VKbIAalMTjn5BvGMJv
         lsKxkfqmaH8I7iAWeFMmwdPS08wy4KMlXcK6h35oq8ylgS40ImnJqEsPMdIVfgoWH+l5
         RkV+y/cCOIyXQAGoDhW4i6HeKnOxPh2Nisip0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793178580; x=1793783380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J9x+PRrcVltVfpkTQNZRX5xz8D7o9ObLUDqYS0LHH94=;
        b=Eh41q0Y9xnQo5557Kk6XbGZKpMdF/NhiYewr16wL5rXZDWwdIiuKQMBthc58WnfCGk
         EORt/Prlq0N8tlHmTaN/DAokBrvhpUbfNT5RPqHq3PFSieukT1S5Q11DU3x6NYWc+Zcb
         sWETet/yuedUPZgn/hYGAQxp/udW/5fuKRfEau+678G7aDzq7O16lqhZU3VACleXiR8l
         jypa355muF/XYWo2jaRv5bJ+Q/lRMLOq8JKahTueB3VdPZapi1cc6hwXyomZ52F53Tzk
         rA3QkBHWmSqtW+fX6VBO4wHhkwIONzSprVtCchq6sClWMFqIcrhBTcolOFJmhosQAFG+
         eEsw==
X-Forwarded-Encrypted: i=1; AKwUvBy9NXxzD+BKAcxJFG7gx5y9lljMp9JHXClPUTugpx2fUwmZF53OauR/ACoAGTcWJT/ZuK7jtaNc2TYRXobLju4=@lists.linux.dev
X-Gm-Message-State: AFq9FYLLbCWcn4Ol/D4ZOrbMgQRwOxV7IKVrxPkzLtk9mNkIGyhH9Kk+
	QcWZPw/3Hwz8HYCRPcKdox+/HZl+wsTia2XQVR5tH/Pp/wMpuzguKg815FY2a6cZow==
X-Gm-Gg: AYBFou2mtbtQe3iUnKIf5rqFTslmX5Xvlkm+Xw5yM9ILux7kH1ilzBPYwmO6zS/MYOd
	HPEpaClWIj7YvXTuuUEEWysqnn5cLjQt+hj63FTNaA5Rut3V4fxha1lkruXjRefBK6q7MSAdcG7
	BqpZn3xbJSmuTuGL1KFu2epGSeGVlplwDcXc6PVmbCXg9Bwv1TswoCO2M8ZKkW/ykN4CTwQr9Gu
	s/0OMDUtwI+uNjGxix+GcVm1rDSmEgC5tfBwj9Za4WdIegHZF+Bd5vzmdyf7HKwXwBy1NoN/si6
	0RRKZo/aPSTvoBO2CaJT4C11ZtL+tLRi1MeIJPMpuYMGLOlWnNVj8rgMOe8bscEIN2AfxHEqQxQ
	0Mfv4/m+0eEchs+t7R1hMzDuiGH28jDKuROVFh14Sq1gwMv3q2D9pLJsjjtS6K3qqxP057AJZhZ
	yu8mb/lwJ1qRG7FnNOYTSZ+rjymIdKHF/QjslD1EEJ/p/0Js2+GIRSc7lFVeUeBt+5xc9Dlozru
	tC2Y8GZAjrEbz/2bucyyIiEdiWwv5faWTN45+xuadHTKPBpUODTNBdz6qaztvg+PooQETRtDWtq
	2Zq2dU5RjDKjxB0ytabshHwUHcVdnawVpz0in6gQGjqu9RJ6a66e9xusfIVTYTEiuLljmgwa
X-Received: by 2002:a05:6402:13d6:b0:6ac:934e:a9ca with SMTP id 4fb4d7f45d1cf-6b49cabef38mr1100021a12.0.1793178580047;
        Wed, 28 Oct 2026 02:09:40 -0700 (PDT)
Received: from localhost (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6b49640ebadsm1193994a12.18.2026.10.28.02.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 02:09:39 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v3 1/2] platform/chrome: cros_ec_typec: Enforce priority-based mode selection
Date: Wed, 28 Oct 2026 09:09:31 +0000
Message-ID: <20261028090932.27053-2-akuchynski@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261028090932.27053-1-akuchynski@chromium.org>
References: <20261028090932.27053-1-akuchynski@chromium.org>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
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
 drivers/platform/chrome/cros_ec_typec.c      | 40 +++++++++++++++++++-
 drivers/platform/chrome/cros_typec_altmode.c |  8 +++-
 2 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 50a68819ceb7b..89d29ef040879 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -27,6 +27,11 @@
 						BIT(DP_PIN_ASSIGN_D) | \
 						BIT(DP_PIN_ASSIGN_E)))
 
+/* Delay between mode entry/exit attempts, ms */
+#define MODE_SELECTION_DELAY	1000
+/* Timeout for a mode entry attempt, ms */
+#define MODE_SELECTION_TIMEOUT	4000
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
@@ -940,6 +952,32 @@ static int cros_typec_register_altmodes(struct cros_typec_data *typec, int port_
 		goto err_cleanup;
 	}
 
+	/*
+	 * Once all partner alt-modes are added, we should also trigger
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
+				dev_warn(typec->dev,
+					 "Unable to activate USB4 mode, port: %d\n", port_num);
+			}
+		}
+		if (!usb4_mode) {
+			ret = typec_mode_selection_start(port->partner,
+							 MODE_SELECTION_DELAY,
+							 MODE_SELECTION_TIMEOUT);
+			if (ret < 0)
+				dev_warn(typec->dev,
+					 "Unable to run mode selection, port: %d\n", port_num);
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
2.56.0.385.gac671c819a-goog

