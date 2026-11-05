Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894354;
	b=iYOnbywXY/84rLEdQkQfHyyh5qN31Qv7/qwaUZgEewR0RKEmFbo0CtGfJRqXJa3ORScX
	 +flfQbopLdK1sVIHQpeBMvOTNTyXhafYDs4BLD7kx7f2aG0YPQM/x2JYBExSRXIRsVHwt
	 vSYxer4OBc7Z3uHzW3UuzqfGp9bVhAjt5fFX8H0oBYmvNlSi5i0IvKyJzqF4fevvp0bR5
	 X+1adjcwHXpX/iv1RXzRYtDy595H31sopg1pS3CKeLb5avzoAmOTfPcTSy8iwFlqYHZdc
	 3nHEV2s6Bdjj3ykgxrUoIcpO1Yw9EoM9eOF4lerawzMXru/9dCnf4nWRRNQyihNxwGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ElH8bN6JTjuLqWVWYbW1NkF46LhanKZAURkkBZLJQj4=;
	b=RyFxCcWedJRDdHnhW5mkvWkgEJo6HjqzylVLRB5HFvY64Ous8c2EqJFBfiO+wtZZ2Uwf
	 gXcUajp0IxP/T+os0QA+rjxaen6Exsz2rxEhpheGVlnV0Bk34d3Uj3e228VYXKVhktw9I
	 Ozjt1lr9Ze62ZkZLxZi5QjvInrwZBygTc5uMLf2tqreQRmmtAGmsNujGJTWcvEi95p9mM
	 zOTdGqDNGQRSGX8kiaCAyNieHfSE0e8kZHUjlo4muDgS7ecZDGWyO1N52VkEwlyOl1ArO
	 oJNd4wCiY49y5uus56xR0gKZMHm6WME1g8qhJvqszFeC6KXTpgdn5k+dWqqbGmqt8wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Wy5jb11f;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F978606B45D
	for <chrome-platform@lists.linux.dev>; Thu,  5 Nov 2026 15:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F978606B45D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Wy5jb11f
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4ceaee6770so303420366b.0
        for <chrome-platform@lists.linux.dev>; Thu, 05 Nov 2026 07:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793894353; x=1794499153; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElH8bN6JTjuLqWVWYbW1NkF46LhanKZAURkkBZLJQj4=;
        b=Wy5jb11fyQBsCg6EVOvSMuJ0CKZCZVZXTMgMRMotZN+OhXgcUfitrePJGaskpgMMKD
         zKEP/Y7L80hokX40pgaFWjzwiQcnU4qEYKM6vu5+Ky7qPjTvJYj1tU9SKRyjV+YPlQfx
         Rz/cneTE+1oICPqt9yUIGArtXEA0L2z9RQrzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894353; x=1794499153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ElH8bN6JTjuLqWVWYbW1NkF46LhanKZAURkkBZLJQj4=;
        b=W1+Z2l46sXdK/n908FYAS96HJRZ8vYL8G4eTrfNn/4bdZnNubuKWSUbc+ZPihFFqiv
         Dn/pkRzDtoJDF0OWvjGSeK9e3Ltoi+wYcPyAOu4/N5Sl8WVY3zw0zkB6gpkOBwodWwg3
         A+njVRi7YizpTfNOkUqgoVDC9p2LRwkhFl7FUu9RefX2vbJOjtsTPgQTmh0TlCW+r/d7
         Mxkf86Kefy0A1dVHFCZS/hwtpyeKfxmRd1SFsH6U20IUYCJVLUN+0uNiZJQINR50B5ys
         +/aUZ0GaLAlmZCdPCiJ3N7pi9H7yjYp4/IMOcmeW8Jw+bwVrNe4bMPKoDHocc4NmeXlM
         ayHw==
X-Forwarded-Encrypted: i=1; AKwUvBxv+7XEG/HXwYFMspBzX6KNCs6BXAlQuCW/03rngk53JQyQfL8ihPFCMmuepYje9e48imYdqXXvymTcHZ3rC/U=@lists.linux.dev
X-Gm-Message-State: APuU4Z+QZVUtxUddcFAiXVLdlRtn5Ol/0gE0nFOd/gYU0gQh0BBGCHwD
	xmaDNFH6tdWN+aonKEZGYWnYaAahJClPQbLzdeTmm422Z+lm3iLqvhXurjTWPSjQ9HM896p//cR
	v/lJZBw==
X-Gm-Gg: AYBFou0wtAdH/j/GTCkWm8JW2/u0t+TLfL4h8h3KOPpXE0FGOWO7RWewp1Cb0i6MvbN
	C+PKU/075JlbYfC2BQfg3+nlhDQGr22bIpHgnew/Fu+qBIqiaG8TLsOFzxnlseJaclp0KvI5DVj
	rnrLtatQ7+k+amL0YryaXY033hLeSMECMl/V71kd+5nnKrOEKoJfpGGMnHcJNrTTFxqKOBeMybR
	R+ZSObVXPgMtzl2yEDFeZJuI0AxTJoZlhG0ewNCXVpEGmYWWLp+4Q40CkEWoEyINvAk2Xs5gWVg
	rkKxCj4aG1sYKJurWrZUjjF+2NknXTrlGL/58ni9JJOZEg8AbE+H+FGCZwWHb5Y5iYuQdN/tb81
	8FbUUOt0TQyDWQiBamOvmevS1AQH+7KtDgyu2BaFysV7TCL4exvBS0XX8ZfDUospZAL7D/zlE//
	XoCtKSIjPSa1e5AG6lgP7jhebAbXfInDxESXrRlaEsAKcP8wDJEiplDFH0kLCERO2zX7YxMKFjN
	uGQgEcPBYCun8j/ebGC8zZJ1t8m9TX7KQpSbfdPYVqgLXyOYjXA9Bh0VDjTURy6+MENZJwJOS5U
	aZgnpIAHxpqNRjinI6VBzPPhuh66z65a+YwiH+mSEcDdj67KKFyo5d03lP8dBjjP6VE+/T7A
X-Received: by 2002:a17:907:7707:b0:c4d:2888:f373 with SMTP id a640c23a62f3a-c4d2888fc8cmr120685666b.41.1793894352761;
        Thu, 05 Nov 2026 07:59:12 -0800 (PST)
Received: from localhost (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c4d0e4693d7sm189182366b.60.2026.11.05.07.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:59:12 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v4 1/2] platform/chrome: cros_ec_typec: Enforce priority-based mode selection
Date: Thu,  5 Nov 2026 15:59:05 +0000
Message-ID: <20261105155906.2670094-2-akuchynski@chromium.org>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105155906.2670094-1-akuchynski@chromium.org>
References: <20261105155906.2670094-1-akuchynski@chromium.org>
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
 drivers/platform/chrome/cros_ec_typec.c | 42 ++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 5871fe031f14d..aeb3de4f09934 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -39,6 +39,11 @@
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
@@ -363,6 +368,7 @@ static void cros_typec_remove_partner(struct cros_typec_data *typec,
 	if (!port->partner)
 		return;
 
+	typec_mode_selection_delete(port->partner);
 	cros_typec_unregister_altmodes(typec, port_num, true);
 
 	typec_partner_set_usb_power_delivery(port->partner, NULL);
@@ -459,7 +465,6 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
 		memset(&desc, 0, sizeof(desc));
 		desc.svid = USB_TYPEC_TBT_SID;
 		desc.mode = TBT_MODE;
-		desc.inactive = true;
 		amode = cros_typec_register_thunderbolt(port, &desc);
 		if (IS_ERR(amode))
 			return PTR_ERR(amode);
@@ -780,6 +785,7 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 	enum typec_orientation orientation;
 	struct cros_typec_altmode_node *node;
 	int ret;
+	u16 active_svid = 0;
 
 	ret = cros_ec_cmd(typec->ec, 0, EC_CMD_USB_PD_MUX_INFO,
 			  &req, sizeof(req), &resp, sizeof(resp));
@@ -818,10 +824,14 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 
 	if (port->mux_flags & USB_PD_MUX_USB4_ENABLED) {
 		ret = cros_typec_enable_usb4(typec, port_num, pd_ctrl);
+		if (!ret)
+			typec_partner_set_usb_mode(port->partner, USB_MODE_USB4);
 	} else if (port->mux_flags & USB_PD_MUX_TBT_COMPAT_ENABLED) {
 		ret = cros_typec_enable_tbt(typec, port_num, pd_ctrl);
+		active_svid = USB_TYPEC_TBT_SID;
 	} else if (port->mux_flags & USB_PD_MUX_DP_ENABLED) {
 		ret = cros_typec_enable_dp(typec, port_num, pd_ctrl);
+		active_svid = USB_TYPEC_DP_SID;
 	} else if (port->mux_flags & USB_PD_MUX_SAFE_MODE) {
 		ret = cros_typec_usb_safe_state(port);
 	} else if (port->mux_flags & USB_PD_MUX_USB_ENABLED) {
@@ -837,6 +847,9 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 			port->mux_flags);
 	}
 
+	if (port->partner)
+		typec_altmode_state_update(port->partner, active_svid, ret);
+
 	/* Iterate all partner alt-modes and set the active alternate mode. */
 	list_for_each_entry(node, &port->partner_mode_list, list) {
 		typec_altmode_update_active(
@@ -946,6 +959,7 @@ static int cros_typec_register_altmodes(struct cros_typec_data *typec, int port_
 			desc.svid = sop_disc->svids[i].svid;
 			desc.mode = j + 1;
 			desc.vdo = sop_disc->svids[i].mode_vdo[j];
+			desc.mode_selection = typec->ap_driven_altmode;
 
 			if (is_partner)
 				amode = typec_partner_register_altmode(port->partner, &desc);
@@ -986,6 +1000,32 @@ static int cros_typec_register_altmodes(struct cros_typec_data *typec, int port_
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
-- 
2.56.0.398.g882cbad275-goog

