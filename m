Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239311E32D6
	for <chrome-platform@lists.linux.dev>; Tue, 13 Jan 2026 13:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768309563; cv=none; b=cBWOzi9ZizG+n49d11pFVPfymjo5jpTzxzOxUXXmwoyxpn9WNymfUZjdZlHgzL3ENvbTUXsUB67XH9g6rvMztXoNCX5eqg4IalcFQf0jIOzxyXyPgleeS3nPFpwQ7c/Iq7Qoc/0OJtE4zPsDl+7+NYxMgOA6V4UusrxTI66zIw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768309563; c=relaxed/simple;
	bh=6hB4iSeTY2hzXYn/hNKQEX6mOmgcsDLZ9qXbHlBnfpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OIo2b4IY6C5vogevb1PhmrXtDwuWVoJqqYTV9FBylGG1QLQEFIFDs22wTBAFp0dhR3dlWKTGontS7m+m8vtlLgGzdW1RHyxzVRPMahs+TrK4DCZ9sLK9Q5sAM++IrN/QLPjj5+YYlA/ytp14srS3pHYsENSdF6ar/7qxwlT+gPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G7NDE6qw; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G7NDE6qw"
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so1268428566b.2
        for <chrome-platform@lists.linux.dev>; Tue, 13 Jan 2026 05:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768309558; x=1768914358; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eS7Tohll2AatkB2QR0zQdrnu+HLuQcgbP0c4r4Qs4pE=;
        b=G7NDE6qwzCeRDv4wRdvrV9gLvU+KHApt6KyTkaQLz6ETndnbQsMkFLZj0aTye1qQK5
         xKZEU8CV8bpdlCZw4JnwrwdkuVni0E+hM8mDAHlC6unikPTH98rw7RawxgCWQeSnF/sV
         U5/gMyU9mbYINc0HUUbNZWidEpjqJW+zULEUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768309558; x=1768914358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eS7Tohll2AatkB2QR0zQdrnu+HLuQcgbP0c4r4Qs4pE=;
        b=grSJG314iXa/Lj88aJBtLGlUeJKpd16Hj5UNcErbs15Xl8AYCLKYXHg3LRClTwoUPT
         iTZVtydg0/o/ah98JqmTSYJKxlMK/uRSJfPVuAPsQ2djZP50MN1MpsMvZRRInk9+pe/r
         fOe5UXucXpjMG3gAamBJ97u6Np4PIkqKq+daxIT24Gd20r37hs2v+T+pf+M1DcPEbNaR
         yeBdur/TyMgk0yuqlFgh7J6ZiEWCl7W9NyYBpMtnqMMISGQPutU5W3gQHzh/A9uvS/3L
         8pE+SWKcFMC0fnqiFltqjSHCprI+xxBLzBkIreKjhl4TcPFcHwjaxYzXrfkmDUC9TVCQ
         NpCA==
X-Forwarded-Encrypted: i=1; AJvYcCUk1VVzfBI+aoLOrASOclhBzDrlCivYDgFbYoBV9rWYu/0QYGeelwKtFFrX50IRuy0lsZ382+dPEvY3RLa2P3I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyh12i/hz5ttLolubJuLBoWkTTNowbv7o/+1It9QistgReKfIY+
	HzV5o+su0QI4q9eQ4WdKHAc06qXjRjiWeydH8eqZNDcgBBeEe5V0jAABz+Fy6b9kPg==
X-Gm-Gg: AY/fxX5BQpBzw34KZ9B6OJHK4v/s1Kgr0Awrf5QYcPtY+B0gG9XXITaMgZnxBjXOOiH
	Q2foppb1TnADqscUes9hDXPV1nuF1LzygopcWLumOFZbSjWcVnXDDr1RSOl9U29H9wWCRwZF8JX
	3pmPZCdO1lgYpVQCYScWs3sEQQ8p2O1a+iaHUlh1CoxIO1QKssNUP1e9f/dHPQmxjNoPhDhzdNQ
	G4zSok84D9xtFXWjANwIbRlniFyQ7gucRx2Q2CnF+DW9zjz2PmdmwPlLcjGcpgtRbbamxgGxEyT
	8OGjzyFioxu5gdGheVw6wTgrbnMYbgd6ngE7i0oM9hwoGIbwBBCpgy2RMlaosU5XyQlfYZPS2Me
	52PoTeDI+ipuNMuAheeIKqTEKMd2x+s6zfrN+ahFKf7QojHZMe7+wUxtdd6PPdNJb53cD3vX1OA
	RXt1Ary0p8nmRI7JRReAqGqcThp7+gGNuecIPfd4TnZrursfoRiQ8XDa2iR1DSGhYN8tpfHrGKH
	YuBfFkQ
X-Google-Smtp-Source: AGHT+IEWEpGJiEQBgSnQWIA4jUcOfUJbtgXrpOmBZHg9hM//JfV9vU4aw1fOZirNoGXoiYkOTCOCwg==
X-Received: by 2002:a17:907:e110:b0:b87:5433:9067 with SMTP id a640c23a62f3a-b8754339594mr23487366b.29.1768309558272;
        Tue, 13 Jan 2026 05:05:58 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b871b5e60dasm586217266b.63.2026.01.13.05.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 05:05:57 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v4 7/8] usb: typec: ucsi: Support mode selection to activate altmodes
Date: Tue, 13 Jan 2026 13:05:35 +0000
Message-ID: <20260113130536.3068311-8-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260113130536.3068311-1-akuchynski@chromium.org>
References: <20260113130536.3068311-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the ucsi port driver supports modes selection, it should implement
`add_partner_altmodes` and `remove_partner_altmodes` ucsi operations. With
these operations the driver can manage the mode selection process.
Once partner altmodes are registered, `add_partner_altmodes` is called to
start the mode selection. When the partner is unregistered,
`remove_partner_altmodes` is supposed to stop any ongoing processes and
clean up the resources.

`typec_altmode_state_update` informes mode selection about the current mode
of the Type-C connector.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 11 +++++++++++
 drivers/usb/typec/ucsi/ucsi.h |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index deb210c066cb5..4a6e23b55b10c 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -314,6 +314,7 @@ void ucsi_altmode_update_active(struct ucsi_connector *con)
 {
 	const struct typec_altmode *altmode = NULL;
 	u64 command;
+	u16 svid = 0;
 	int ret;
 	u8 cur;
 	int i;
@@ -335,6 +336,10 @@ void ucsi_altmode_update_active(struct ucsi_connector *con)
 	for (i = 0; con->partner_altmode[i]; i++)
 		typec_altmode_update_active(con->partner_altmode[i],
 					    con->partner_altmode[i] == altmode);
+
+	if (altmode)
+		svid = altmode->svid;
+	typec_altmode_state_update(con->partner, svid, 0);
 }
 
 static int ucsi_altmode_next_mode(struct typec_altmode **alt, u16 svid)
@@ -609,6 +614,8 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 			desc.vdo = alt[j].mid;
 			desc.svid = alt[j].svid;
 			desc.roles = TYPEC_PORT_DRD;
+			desc.mode_selection = con->ucsi->ops->add_partner_altmodes &&
+					con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE;
 
 			ret = ucsi_register_altmode(con, &desc, recipient);
 			if (ret)
@@ -831,6 +838,8 @@ static int ucsi_check_altmodes(struct ucsi_connector *con)
 	if (con->partner_altmode[0]) {
 		num_partner_am = ucsi_get_num_altmode(con->partner_altmode);
 		typec_partner_set_num_altmodes(con->partner, num_partner_am);
+		if (con->ucsi->ops->add_partner_altmodes)
+			con->ucsi->ops->add_partner_altmodes(con);
 		ucsi_altmode_update_active(con);
 		return 0;
 	} else {
@@ -1119,6 +1128,8 @@ static void ucsi_unregister_partner(struct ucsi_connector *con)
 		return;
 
 	typec_set_mode(con->port, TYPEC_STATE_SAFE);
+	if (con->ucsi->ops->remove_partner_altmodes)
+		con->ucsi->ops->remove_partner_altmodes(con);
 
 	typec_partner_set_usb_power_delivery(con->partner, NULL);
 	ucsi_unregister_partner_pdos(con);
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 410389ef173ab..4797b4aa1e35b 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -70,6 +70,8 @@ struct dentry;
  * @update_altmodes: Squashes duplicate DP altmodes
  * @update_connector: Update connector capabilities before registering
  * @connector_status: Updates connector status, called holding connector lock
+ * @add_partner_altmodes: Start mode selection
+ * @remove_partner_altmodes: Clean mode selection
  *
  * Read and write routines for UCSI interface. @sync_write must wait for the
  * Command Completion Event from the PPM before returning, and @async_write must
@@ -88,6 +90,8 @@ struct ucsi_operations {
 				struct ucsi_altmode *updated);
 	void (*update_connector)(struct ucsi_connector *con);
 	void (*connector_status)(struct ucsi_connector *con);
+	void (*add_partner_altmodes)(struct ucsi_connector *con);
+	void (*remove_partner_altmodes)(struct ucsi_connector *con);
 };
 
 struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops);
-- 
2.52.0.457.g6b5491de43-goog

