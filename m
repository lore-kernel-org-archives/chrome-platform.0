Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697B3368283
	for <chrome-platform@lists.linux.dev>; Mon, 19 Jan 2026 13:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768828743; cv=none; b=WhipN8GS03ukUtz0tWvqqb4GMgMoUZuQ3jYc+na7jp4/qG9PQ3hjQZMPLhNxQ2kSeWygmT7Jd0t03cRWy9kdXs9dtOJo33faXocDn/Ux2h226uw0SydXiiKFcm+USjpkAYqn1nmmuTse4G0z1EETYBkbSmj8WcNb3A7RRern9bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768828743; c=relaxed/simple;
	bh=frUPC546TbZHzSgYQ2uN6oeGYjK8P6K8ZiFxPhwwtAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I3PnYt8tHloDIMScH1igf3IOfriALPVzrPTGn8I0Ae2yjCTHATLgy5g87T+/2kjRrGX0HhvupEV8G6RgLk89Vqkp0wYP9DIGaAnNT4oStFA5tYMIW+69CmGbMSwJMxMpcV2tJTx2Hywdh3xSD7uIrY2biH8tXNZ2bdgcjomB+aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LqPejgWq; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LqPejgWq"
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-64d4d8b3ad7so6892716a12.2
        for <chrome-platform@lists.linux.dev>; Mon, 19 Jan 2026 05:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768828735; x=1769433535; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjQjxmFvS2FQRrIuJW4DNjfu1H/SHcaCjJwkwuXOThw=;
        b=LqPejgWqrfF/fSX52Ak4YD/hIJ0daxW4hpPzLeAVVScji/0OOfQnyR4+sA+wjdUIf7
         1Iydp0U0cji/r9gIBfGzBZMpUET6epnU0mY+r3faTSF6L2Y6wWszuo+DuP/kGvpLC3e3
         sRZBCKmx01StFRZqqMRqDOr7xzKZqJsJucJk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768828735; x=1769433535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IjQjxmFvS2FQRrIuJW4DNjfu1H/SHcaCjJwkwuXOThw=;
        b=wDZDjPVn118Q9IbpYr4XLwlBCXLXEiu7Atgmqxah8wMUJqsy+hAf/xKJmh27on2Pb8
         VSOmEgEv41/n2pQFtzk3eQt/wJR1A5owyb/SNxD3r/WnI/c23+9PZQr9Efy8qKFvoM77
         6mrnGbJvkZEpr/elAJkON/j5S2LXOqC7NBt3nN+afiSq8XHwSKLHEQuKJZwRlYibt5KN
         RO0Z7aOTXxkX/m/I4G3yh+06Upv0uKXJVDckE7BJigmENEG9f9tptaV2n8cksZXfs390
         mz43Va3DcNLrFOArCr+mBikj3qIoTrileUCJ1qCnR8tjfUpMZDDh9nXMCusJ1rDxMpsv
         tcdw==
X-Forwarded-Encrypted: i=1; AJvYcCUMNtkzsag2hmZBL5IJdjYg0PGu2u6jFHWJejRE+JaGmPMUw5vdqxoVGzGtjh0xdGDHJM/3AhBL5fssxKUEUnI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxrrOE9Qqk4pNON/Ypz3/ZJz2zMPI/hJXJLOIgHwfziZNXYwLVY
	H2wMMfiQG0zqNbdXEieFzrwjp+hNikhNZW2H6byVdapJjiSNh0rVPky+rQWZ6ZzEIA==
X-Gm-Gg: AY/fxX4gbd1IoFnUGW/X1ypnU/LHwKEPfqOWUjzqvowNe4sI37yWjDiv5p2G8yl4oPv
	OGy+PunUL7bCZ9ezkPOwaIIRbGrDySieTyz5xAMFNfhHhN9CBoi3xbM5nh+q8nxFzVSAkdbiHIJ
	ii9ZSu5N2V+sNr6U+AwERukq8cop1VRsgmCnTj9v2gN0ert15i2+uVZ91aZCLsqIlIlRk9VkN5+
	LnfJFk1933mhA+2mwc+zik1v0BZszoaAEOQSF8vBsLUSCjtyqI8i9bf7+fDIj058XtFfqPnuYoJ
	5z+WXKXMe/B5av0MiQATVXWjsxlVQ9GijqmEsN/e3Dky30QkYVoQgyu8SyU4DRaqD2Y1jCjQnHn
	M1PEvSAj2t8kZnD3Rp21fUOI0Afm8exzKEDDsl/Ba0MY0AH/yk/6PbVn9nRzyLUleVZ1UuqloF6
	bDIybsNy0nQ/H5ceeUGFxWNhdpp3N6SWFwQ0zbFHoo4bwILtuA0UvQ4JIErc99tlIWeNQsmS4mb
	kiX+FeP
X-Received: by 2002:a17:906:f584:b0:b73:278a:a499 with SMTP id a640c23a62f3a-b879690c3ccmr870116566b.15.1768828734746;
        Mon, 19 Jan 2026 05:18:54 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9a14sm1078801866b.45.2026.01.19.05.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 05:18:54 -0800 (PST)
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
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v5 6/7] usb: typec: ucsi: Support mode selection to activate altmodes
Date: Mon, 19 Jan 2026 13:18:23 +0000
Message-ID: <20260119131824.2529334-7-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260119131824.2529334-1-akuchynski@chromium.org>
References: <20260119131824.2529334-1-akuchynski@chromium.org>
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
Changes in V5:
- Use the no_mode_control field instead of
  con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE
- Squash previous V4 patches 3/8 and 7/8 into a single patch

 drivers/usb/typec/ucsi/ucsi.c | 12 ++++++++++++
 drivers/usb/typec/ucsi/ucsi.h |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index a7b388dc7fa0f..251990475faa7 100644
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
+					!con->typec_cap.no_mode_control;
 
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
@@ -1659,6 +1670,7 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 
 	cap->driver_data = con;
 	cap->ops = &ucsi_ops;
+	cap->no_mode_control = !(con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE);
 
 	if (ucsi->version >= UCSI_VERSION_2_0)
 		con->typec_cap.orientation_aware = true;
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

