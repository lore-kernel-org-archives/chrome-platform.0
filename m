Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5DB217F49
	for <chrome-platform@lists.linux.dev>; Thu,  7 Nov 2024 19:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731007907; cv=none; b=r/+MGuoSuZdTp3GuDKQtPelEhRtORq/Kgxhd/scVTSc+RJPWRSf4gKIzSNE7C2VT0AK911jpL0NCtiW1Q2csHtsYLhtOKGReq0OcCd/gd52pzXMV55UWn5CS1nQcG4c0gLXi5Bz/PTZAoyblNBeDfcNWiKiYQbJ5z1sMM7w531k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731007907; c=relaxed/simple;
	bh=Wg/zBVFa4tGz8VOCaxh6a+i+WqdrvN3SJxMoDY3tJdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DzSDGVNo8EsMkGbIwVxYborc3D//TCSIPuk7Dvoe/t38SA2G8IBN2IF+PGl4ON2xIoFxzZZxhGbQ3DhcswWt5hoAXhOCnYZ66LqMQjx/oo2E94J9O0u/7Y+lRt9v0Daly1zKQdP/W3CtY8212ODWrW4cdl3vEau/TYlBZqItmMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Kgv7x5kb; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Kgv7x5kb"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3e602994635so1038310b6e.0
        for <chrome-platform@lists.linux.dev>; Thu, 07 Nov 2024 11:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731007905; x=1731612705; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0CqREGwh6IVDq65gpD5flYOXg4XbjfkPAiJB5bPZJk=;
        b=Kgv7x5kbg1Dx5QSEv1A/TY1VDeMkNFXwqhrReovt8DP+C0pTlFpmIMZU6TSL0aS6s1
         w4ZoftIa0pAq1qFKb+y9KbCnfSrZQw7cqQyOqkEyCV0ImB3I0CgnOKTYrAWSQ9t1BSrc
         Uy/OEQnc6hmYJ9IwodFqqQTTrrBOff9XOt8Hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731007905; x=1731612705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0CqREGwh6IVDq65gpD5flYOXg4XbjfkPAiJB5bPZJk=;
        b=BPKmi1fu7dPmOcREEygcGWae2MwiPAnYsQZd65uf8vpIUMxJLEebPXbkagmBkRNvIV
         8FecC+y8FHsw8gJZYzekjI5b7G4M1OPVDF8ujMwLK3XcvqeeIFFZaSsQbGuvQaUNfCfq
         t4FqjdbC46JCrcy5yECP6cOY5YIiPM0Q5tGFdtJCrDrskm55zykGvB8asw+XSqgapoZU
         2ElEEvJRRwYWTGe8koUV9fRwp9mHkP7BBYY7btCp+pGRU2eBOzLxzX9ryyoCuY2dinb6
         3T3RIqw+y8EZ3foZ2SNBtGPSdKJifPogmGq6zErQJAq4TCwEjQmCknU+eFt2N/5toSdx
         6E7Q==
X-Forwarded-Encrypted: i=1; AJvYcCULbjXgwpNagz+4KbWSWkb1xk70Xf7BdvbYZhDucqfJz3+dlgGdhRw0XLRIYomeGMwMYNrhqPCNKs4RVeMCgO4=@lists.linux.dev
X-Gm-Message-State: AOJu0YysYyzdNUOBHJDgBGJ+UVzvUGADJbqJU8CV8T1YbEEaGyhvUY88
	MwJcZmhqUMmNZCLiYWbrmJYvD7+UjV8rxK3qYq2q/EKN8CTpIYTbNzGnv+C6dg==
X-Google-Smtp-Source: AGHT+IFgcTmVRvr38xnLKX/v1C7i4XoxmAx6AzKMJtRI0ZbWE+Lp0wJnd9PeKHKFSh9kgaJYd9NuNA==
X-Received: by 2002:a05:6808:1791:b0:3e6:2471:4d10 with SMTP id 5614622812f47-3e794675446mr451938b6e.11.1731007904802;
        Thu, 07 Nov 2024 11:31:44 -0800 (PST)
Received: from localhost (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-7f41f65bf87sm1827097a12.70.2024.11.07.11.31.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 11:31:44 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: jthies@google.com,
	akuchynski@google.com,
	pmalani@chromium.org,
	dmitry.baryshkov@linaro.org,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/7] usb: typec: Check port is active before enter mode on probe
Date: Thu,  7 Nov 2024 11:29:56 -0800
Message-ID: <20241107112955.v3.3.I439cffc7bf76d94f5850eb85980f1197c4f9154c@changeid>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
In-Reply-To: <20241107193021.2690050-1-abhishekpandit@chromium.org>
References: <20241107193021.2690050-1-abhishekpandit@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enforce the same requirement as when we attempt to activate altmode via
sysfs (do not enter partner mode if port mode is not active). In order
to set a default value for this field, also introduce the inactive field
in struct typec_altmode_desc.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

Changes in v3:
- Use port.active instead of introducing auto-enter field
- Introduce inactive field to typec_altmode_desc to set default value
  for active.
- Always make port 'active' field writable

 drivers/usb/typec/altmodes/displayport.c | 7 +++++--
 drivers/usb/typec/altmodes/thunderbolt.c | 6 +++++-
 drivers/usb/typec/class.c                | 5 +++--
 include/linux/usb/typec.h                | 2 ++
 4 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 3245e03d59e6..f4116e96f6a1 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -767,8 +767,11 @@ int dp_altmode_probe(struct typec_altmode *alt)
 	if (plug)
 		typec_altmode_set_drvdata(plug, dp);
 
-	dp->state = plug ? DP_STATE_ENTER_PRIME : DP_STATE_ENTER;
-	schedule_work(&dp->work);
+	/* Only attempt to enter altmode if port is active. */
+	if (port->active) {
+		dp->state = plug ? DP_STATE_ENTER_PRIME : DP_STATE_ENTER;
+		schedule_work(&dp->work);
+	}
 
 	return 0;
 }
diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typec/altmodes/thunderbolt.c
index a945b9d35a1d..45567abc3bb8 100644
--- a/drivers/usb/typec/altmodes/thunderbolt.c
+++ b/drivers/usb/typec/altmodes/thunderbolt.c
@@ -212,6 +212,7 @@ static const struct typec_altmode_ops tbt_altmode_ops = {
 
 static int tbt_altmode_probe(struct typec_altmode *alt)
 {
+	const struct typec_altmode *port = typec_altmode_get_partner(alt);
 	struct tbt_altmode *tbt;
 
 	tbt = devm_kzalloc(&alt->dev, sizeof(*tbt), GFP_KERNEL);
@@ -226,7 +227,10 @@ static int tbt_altmode_probe(struct typec_altmode *alt)
 	typec_altmode_set_drvdata(alt, tbt);
 	typec_altmode_set_ops(alt, &tbt_altmode_ops);
 
-	if (tbt_ready(alt)) {
+	/* Only attempt to enter altmode if port is active and cable/plug
+	 * information is ready.
+	 */
+	if (port->active && tbt_ready(alt)) {
 		if (tbt->plug[TYPEC_PLUG_SOP_PP])
 			tbt->state = TBT_STATE_SOP_PP_ENTER;
 		else if (tbt->plug[TYPEC_PLUG_SOP_P])
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index febe453b96be..b5e67a57762c 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -458,7 +458,8 @@ static umode_t typec_altmode_attr_is_visible(struct kobject *kobj,
 	struct typec_altmode *adev = to_typec_altmode(kobj_to_dev(kobj));
 
 	if (attr == &dev_attr_active.attr)
-		if (!adev->ops || !adev->ops->activate)
+		if (!is_typec_port(adev->dev.parent) &&
+		    (!adev->ops || !adev->ops->activate))
 			return 0444;
 
 	return attr->mode;
@@ -563,7 +564,7 @@ typec_register_altmode(struct device *parent,
 
 	if (is_port) {
 		alt->attrs[3] = &dev_attr_supported_roles.attr;
-		alt->adev.active = true; /* Enabled by default */
+		alt->adev.active = !desc->inactive; /* Enabled by default */
 	}
 
 	sprintf(alt->group_name, "mode%d", desc->mode);
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index d616b8807000..56c01771c190 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -140,6 +140,7 @@ int typec_cable_set_identity(struct typec_cable *cable);
  * @mode: Index of the Mode
  * @vdo: VDO returned by Discover Modes USB PD command
  * @roles: Only for ports. DRP if the mode is available in both roles
+ * @inactive: Only for ports. Make this port inactive (default is active).
  *
  * Description of an Alternate Mode which a connector, cable plug or partner
  * supports.
@@ -150,6 +151,7 @@ struct typec_altmode_desc {
 	u32			vdo;
 	/* Only used with ports */
 	enum typec_port_data	roles;
+	bool			inactive : 1;
 };
 
 void typec_partner_set_pd_revision(struct typec_partner *partner, u16 pd_revision);
-- 
2.47.0.277.g8800431eea-goog

