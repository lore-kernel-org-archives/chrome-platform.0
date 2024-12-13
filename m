Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1421E0DB0
	for <chrome-platform@lists.linux.dev>; Fri, 13 Dec 2024 23:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734132960; cv=none; b=c4UvmekqNVKsTFha9thQB/fmrYPp4KP1tB7ydkafMxrXxlm0wCDLUnCoBhNsTjJssxkZ2vWRDLgWr2wVEArmRa1o6eZOCHa1FTR9LLq3keUulPqDFY81s2ZT2xwSOYEJPHIUlDIlnuNDK1fczZRY05pNSwv2Tcca+par2HypmGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734132960; c=relaxed/simple;
	bh=9hMsPqdjwTDIkVnxhSULB0CiOHTJ/6C16w2i8yp2ayI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hoGERUuXJeAtfORGSqG5f2AHswNeACbg3NGURZHJHlExKjoU66MABYUceqegDkOPJlbAIdd8fjC0M89NbKt9rPJ+sm48pjk0nSYhVAjORrw3dN18vifccrkyZQd6rBdW8xeZ8v9DpM1Jz7D7xka5IW4HDs5+dMiKk+asruuHa10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=obeLffqi; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="obeLffqi"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21631789fcdso23128155ad.1
        for <chrome-platform@lists.linux.dev>; Fri, 13 Dec 2024 15:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734132957; x=1734737757; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBaLRXyqu9ANmWNoElcN8EfCavDwsorcYrnJ8qiOPQw=;
        b=obeLffqi8sFEJqqqzEbxaFfdUegrfN4Bx1er4lWga4mv4423cdeiFAjOMjqYuCwka6
         CfhIZ1t9gWPChctNyW7p9iO8dd/QnpVbUqmMQKceEy7VLLgcdXp3zyUclH3f29Ewuwt0
         cw2gwm7GkP2u8O606pcTx3cyFdS+HwHGg1+Ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734132957; x=1734737757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HBaLRXyqu9ANmWNoElcN8EfCavDwsorcYrnJ8qiOPQw=;
        b=VzOspAF+YpcDeIcaLTL1PXmfmiBlduMjAff92w9QKATMq/fy7pwTx2f11IlcaKrC14
         WZKT+p08DLYi9C/Y1TrP11KYrkDfj4qH93okPr1Bi5I7YpyZEEYPIfus/OLgyh99qYBc
         6oFxyYwQf83jGIYgt/QscU0b6HTR7hYLFFTfPIAtwhQVE9JpChC1YzXD7nygrhgMSxqt
         b9J6eAuTXqgD144IbpRm8xVkT9z3TKbKanocKpeGXGpwhgMzNHxGk/9e7twjX3GnFexw
         BDE0GkfWPJl2BQSo6+RGr0pe7qLr7IedLFIyueIODTsznrAUI6XK6Aw8U8xtD8s1GTL3
         Gfvg==
X-Forwarded-Encrypted: i=1; AJvYcCWfUw0Buz5tL0yNn9sI+RFnxTW4rtuzOeZwu28UvvBM7XcOG4nQ7lQAFemwFlGVlm6whjBjvR/0tXdtn9/Uzpw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZl5cwtCeoqk9BcJDNd65SdKT0++mLZEy/LMDexe27ERscLTwW
	rhAFkLGKQqg82zPn3FLz/XTrmHWWCmRz6j+2vyDubvcXdKrvO6EZWCLSYdBHyw==
X-Gm-Gg: ASbGncuSy6kJ7y670Rd55WeXA4B8okCK6sOIjt+xt4kdg3L/aKMGfrPLkD6URm5mPwz
	p9PTUBuUgaRyytDVyKCgoKQs7X7oVSyGC28PLNKYmCh5o1uQ1r6ydUrvdoKL14EYDH/Ooo6rtH8
	4rCtcGI/2wySs2m6a3y5bDJlsw8368gYg6qHZiDINeezi5VLEbsLD/38RD7R5e8tqTX9aC1XfJq
	J5OPbdmLqI9RSFoCYSlxerly/bxoRqb6OIIa/JGVTO4tk/0G4djpo2TRTkhv0dwuv84rReaSXe3
	IwRIBFqnY3y57jewI6aMOKNY3A4k0NA=
X-Google-Smtp-Source: AGHT+IFkLu8dhCI4lsuwjqZrtk2iI+9FAjgaYImUppnevu9yz/pPZYeDJmM8ec/4D1wBs+eOoc6eUw==
X-Received: by 2002:a17:902:db02:b0:216:3440:3d21 with SMTP id d9443c01a7336-2178c874e19mr135996475ad.26.1734132957686;
        Fri, 13 Dec 2024 15:35:57 -0800 (PST)
Received: from localhost (227.180.227.35.bc.googleusercontent.com. [35.227.180.227])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-218a1dd3ed1sm2974985ad.105.2024.12.13.15.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 15:35:57 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: akuchynski@google.com,
	sboyd@kernel.org,
	pmalani@chromium.org,
	badhri@google.com,
	rdbabiera@google.com,
	dmitry.baryshkov@linaro.org,
	jthies@google.com,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/8] usb: typec: Make active on port altmode writable
Date: Fri, 13 Dec 2024 15:35:44 -0800
Message-ID: <20241213153543.v5.3.I794566684ab2965e209f326b08232006eff333f8@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241213233552.451927-1-abhishekpandit@chromium.org>
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The active property of port altmode should be writable (to prevent or
allow partner altmodes from entering) and needs to be part of
typec_altmode_desc so we can initialize the port to an inactive state if
desired.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

Changes in v5:
- Extract port altmode ".active" changes to its own patch

 drivers/usb/typec/class.c | 5 +++--
 include/linux/usb/typec.h | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

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
index d616b8807000..252af3f77039 100644
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
+	bool			inactive;
 };
 
 void typec_partner_set_pd_revision(struct typec_partner *partner, u16 pd_revision);
-- 
2.47.1.613.gc27f4b7a9f-goog

