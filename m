Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96EB30DEA2
	for <chrome-platform@lists.linux.dev>; Mon,  1 Dec 2025 12:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764591985; cv=none; b=u734TA7uNLD9T02CW/2ranCyHj9/eI2hYOUNud6D5Nj/9EjhevqWTwgvcJGdln0tRlW95v+EpE7NGhTjM1m6Hie6S5zQkRreJg/nhtKEmSfFeOe4LkEVUHn0lMdRs6QC1BlyW2/ZOsSpjJ/q5yJedvWxDlVPyEoSLnyOYCjFKPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764591985; c=relaxed/simple;
	bh=GLVgDEZR/yW+dPBnqZM2+KBG6I9egBK1BkHdtIV8Re0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ofnQ+KFR0DUWKLTvVqDY8mNecwD28iuYHnnFv6Qy2BujaYePSJ2TugAEPL+/5CYsLkzZEgTzjot32kaMEF2wXn9MuquDNjVAnP+a38nlEjQZO1apKVn3qvLuuC8AqQiAtPfK6/LvJ5Djrkuf/oU3CKJaSqQm6Nr1QYkvFEZ12WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=E3LSf6dq; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E3LSf6dq"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-640a0812658so528004a12.0
        for <chrome-platform@lists.linux.dev>; Mon, 01 Dec 2025 04:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764591981; x=1765196781; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5OrnZlcNOQDMQX5tOxuMnlnnAQiRlG+9PrDueeCn1s=;
        b=E3LSf6dqbYQ2P6qSRfiVkpq0TPwmUhEvxbC4LL1MwdcraaCoV/7rb4UpLyQ4c7LxT4
         2AMMRe4dg0zylGEnsEClVV7G6g+niCc9VQJ77gCPLHm5uLw2xg4aQFeAJTeYp2F9IsKC
         vdml8E38krtU4nfPLSR2vYdnXGSOBH59qrZNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764591981; x=1765196781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k5OrnZlcNOQDMQX5tOxuMnlnnAQiRlG+9PrDueeCn1s=;
        b=X5XazIfLgIiFwYNNqcqbcH3H6XBkH8NcIM0DsrsEiET4UEBUO4d+NR7Q09nehrRahr
         JnnPwlMKimZ9uF1URgRiEVb2G69HqXKLTO0hpPBdMHSlsdEA8i5iTlsAPBWbkwSAKT6p
         LT5rCe6Axbr+Q8MWIBuSAma4AtquEemAbnknJGhTPsDzm3MrN5RvTpcXv0U2c0TuWgDV
         DmhkimOcsxmp7+bDk7FpxTjQnx46Y2+atNel7UlDrFBOsP6Ld85TXwn/OkqnAziRL/4/
         wlBFy5PQDH1LSsY4lcfnCwgcCsqdnPCuEMHqTI/BW6EuCBJGY6ZJ/Lr+XCjh0ZFnyNSt
         kbdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCKDKk6MxGzAspM1/pPSaPhG7dz10iO/9TLIb1NTjFEIzy6BN9l+mesGmx4gGy879JWPRtYGATlKAwIFd+l30=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhnduRAyDM5fxa+zhGwlRCAdDVXMXbjs4ACX+9UrSbxgSRU8Kq
	RDG1nOP6RjCfnw00fq+go4IfDPMiPzyNzwV8zifxxPrk10QK/qxkzz0MFqfslhefvA==
X-Gm-Gg: ASbGncvvDfn1tkyNydzEE3kW2IgIl21iFz+tP/U8RmTKz9WzC0GtL6F1Cp80hSjv1hI
	YNniLMISjdfb1gOSOIV/lraEGNeqvlO6W6pLxgMrtkJmkKhkNSqEwoQBL2XTHPTj7CYtkO7Zf8G
	RUfLo3Zn+cLJm6GDioWzwUP4E0b5wuCPhWLc8QCJVTMre5fURDPZB/HvsLp8D7BGrzB67tvh9kI
	Gs4KtgFA5MqMOtm5JZtzJw9s7hLCAoTZXYq/SEcK4x8bnwbhg8s89yll5yj/4NqykqEXnz+PqBE
	lLBDzaL/BneoUO9nkbMDFFtPq9Lm7s6XaACwa0SRVfa2INoVF6Hp9U+WwwbaVD+YC+xfIUde3ZB
	vDNQg9YsDeCK9BdQb2fv5CT/cZokyB4nw2GUbJZGVIDQ8dwovkqYaJ5i9GXQgmMbAtIDL37ol4r
	+NzRnAbTThIB6Y0/JIFl3hAmimGS83L74EbM5aCWT4tYzMSUD0WCbzsDViFIbcRdBhvjN28ndZD
	qCxfPnEt+UH40yV8W5nhA==
X-Google-Smtp-Source: AGHT+IHo6BcWEO8aAB6UKpwKa3lU4iaGYTslO6xLm3i1HGiV97D5oGlqLdkkc3mN0VhnSOUSh5Hb2g==
X-Received: by 2002:a17:907:980a:b0:b71:ea7c:e4ff with SMTP id a640c23a62f3a-b76c546d949mr2614872766b.6.1764591981126;
        Mon, 01 Dec 2025 04:26:21 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (218.127.147.34.bc.googleusercontent.com. [34.147.127.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f519e331sm1229049266b.24.2025.12.01.04.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:26:20 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Pavan Holla <pholla@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH RFC 4/8] usb: typec: ucsi: Support mode selection to activate altmodes
Date: Mon,  1 Dec 2025 12:26:00 +0000
Message-ID: <20251201122604.1268071-5-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.158.g65b55ccf14-goog
In-Reply-To: <20251201122604.1268071-1-akuchynski@chromium.org>
References: <20251201122604.1268071-1-akuchynski@chromium.org>
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
 drivers/usb/typec/ucsi/ucsi.c | 17 +++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.h |  4 ++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 82c3efd72639..ee96c42e9e27 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -331,6 +331,7 @@ void ucsi_altmode_update_active(struct ucsi_connector *con)
 {
 	const struct typec_altmode *altmode = NULL;
 	u64 command;
+	u16 svid = 0;
 	int ret;
 	u8 cur;
 	int i;
@@ -355,6 +356,15 @@ void ucsi_altmode_update_active(struct ucsi_connector *con)
 	for (i = 0; con->partner_altmode[i]; i++)
 		typec_altmode_update_active(con->partner_altmode[i],
 					    con->partner_altmode[i] == altmode);
+
+	if ((con->ucsi->version >= UCSI_VERSION_3_0 &&
+		 UCSI_CONSTAT(con, PARTNER_FLAG_USB4_GEN4)) ||
+		(con->ucsi->version >= UCSI_VERSION_2_0 &&
+		 UCSI_CONSTAT(con, PARTNER_FLAG_USB4_GEN3)))
+		svid = USB_TYPEC_USB4_SID;
+	else if (altmode)
+		svid = altmode->svid;
+	typec_altmode_state_update(con->partner, svid, 0);
 }
 
 static int ucsi_altmode_next_mode(struct typec_altmode **alt, u16 svid)
@@ -635,6 +645,8 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 			desc.vdo = alt[j].mid;
 			desc.svid = alt[j].svid;
 			desc.roles = TYPEC_PORT_DRD;
+			desc.mode_selection = con->ucsi->ops->add_partner_altmodes &&
+					con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE;
 
 			ret = ucsi_register_altmode(con, &desc, recipient);
 			if (ret)
@@ -858,6 +870,9 @@ static int ucsi_check_altmodes(struct ucsi_connector *con)
 			"con%d: failed to register partner alt modes (%d)\n",
 			con->num, ret);
 
+	if (con->ucsi->ops->add_partner_altmodes)
+		con->ucsi->ops->add_partner_altmodes(con);
+
 	/* Ignoring the errors in this case. */
 	if (con->partner_altmode[0]) {
 		num_partner_am = ucsi_get_num_altmode(con->partner_altmode);
@@ -1154,6 +1169,8 @@ static void ucsi_unregister_partner(struct ucsi_connector *con)
 		return;
 
 	typec_set_mode(con->port, TYPEC_STATE_SAFE);
+	if (con->ucsi->ops->remove_partner_altmodes)
+		con->ucsi->ops->remove_partner_altmodes(con);
 
 	typec_partner_set_usb_power_delivery(con->partner, NULL);
 	ucsi_unregister_partner_pdos(con);
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index f946b728c373..6e77bdbdaeae 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -75,6 +75,8 @@ struct dentry;
  * @update_altmodes: Squashes duplicate DP altmodes
  * @update_connector: Update connector capabilities before registering
  * @connector_status: Updates connector status, called holding connector lock
+ * @add_partner_altmodes: Start mode selection
+ * @remove_partner_altmodes: Clean mode selection
  *
  * Read and write routines for UCSI interface. @sync_write must wait for the
  * Command Completion Event from the PPM before returning, and @async_write must
@@ -93,6 +95,8 @@ struct ucsi_operations {
 				struct ucsi_altmode *updated);
 	void (*update_connector)(struct ucsi_connector *con);
 	void (*connector_status)(struct ucsi_connector *con);
+	void (*add_partner_altmodes)(struct ucsi_connector *con);
+	void (*remove_partner_altmodes)(struct ucsi_connector *con);
 };
 
 struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops);
-- 
2.52.0.158.g65b55ccf14-goog

