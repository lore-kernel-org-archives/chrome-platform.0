Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D43F238142
	for <chrome-platform@lists.linux.dev>; Thu, 14 Aug 2025 18:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755197105; cv=none; b=cQUgvTbEiN5agdMQokV+DaQNmRjV/Y4LUiGtsyPWXcfLJgFRDTTtx/PnqF1G1xywy1OD1oq7PEElXm9xoL0EMt7OGRZt3nZsHgquDBzyxDs/OzLd/bQVSiiWNJI/pubUUekSuYYSyDPnzsoAfi8KbvYSjtJJa5ua394ok3BrCPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755197105; c=relaxed/simple;
	bh=eUBNjC8QE0qeN7YbjDptuSSINLe1oW6vNYbL6Ks8GS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QxRBgk5mzNguoaTMpQHzZ3f2QYSG+182PxRSwzb236s/01S6cFwmTgFlRITJazLQEj+PnkIzZwc17NhhPRrwD+rzsUUpPW+ynQs2GtqSDcNqHoftwzeD8AB0QwoM1a7tteo+WqROFKF5ROYekSRkI/1FIQDdsr8pqzBMedOnSP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UhH5AItt; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UhH5AItt"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb78e70c5so206279966b.1
        for <chrome-platform@lists.linux.dev>; Thu, 14 Aug 2025 11:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755197102; x=1755801902; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RR3Vo6gytGVX7qnZsp8KSoWCmMGj6HFPr8g7tZMKrMk=;
        b=UhH5AIttKxwafkXtCNVDwS9C9BX2DTkDoL5DBmJSFatsjc5Znt6TEvv5+cE0nxuI9U
         BHwO6WBBLzCHY7w3XTwNAGItgXOt7aaThZPR+DcDLyQWSbKqe9M0waTOL65pvNRqpPR+
         DXnUw7lzsiKN/4w47zgImhjqtmpOgZcOndPoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755197102; x=1755801902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RR3Vo6gytGVX7qnZsp8KSoWCmMGj6HFPr8g7tZMKrMk=;
        b=MdHZqOSh1gAbXLIQ5n46p2EXuCZGbZ/bg3G6fAJ/ChEMN9buqsaM9v5Zu9Kd+poSel
         5wmLpzIqFc7aWlImNB8tlIPBk+nqEWMS7W7GgTL0ysG+kToJ3oHx8UX5YhdzLAwT822U
         5+l1UKdJlgLVmo3Hxvq3KRud2TfYxFgEDBZDM09MCRPAJkqbNj+koCJ42Is9HLkOpXAZ
         VwKvyWVCguSptand9e0sBxK6ZRaaTkX/bLTtyQMnTf7a7AqKfeH0l371x9/NvgpwGcph
         OYi4SlVUsDX8ZIXm2MWfd+Ig7mcvv/SiF8kesfoBt43+qNHspsRSZ9ljJe6lt4q2Jwcu
         slkA==
X-Forwarded-Encrypted: i=1; AJvYcCWHKE+fAh/i1emCqoTGZJ84+JdsEzAT5bkHahOibZDMphAhf+aThheGBNeqAAMBi/Z/qLrXg6SWD5mMQO2v67U=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywpry0MHyRRweK3fIXnwAf0Qm/hY2dfbzVBraTbcm04IUmpVtIS
	5qUJch6vEK0sNwfBYqpARsXJMTPiLf9mM+ZGRHsEi3SCmjQYzfWHW1WUDMQCtwwpGw==
X-Gm-Gg: ASbGncsu2zp1r14ahiDH+ii/FEkRespAWKNWdDGqxkh01N+6Zaa1LjiprRTuQIy3NeQ
	PaD3MeWyZzAPv7qctPwd2gG2c79NZRQvqTcKtlht0NaxIa6beuqJZO9tM6jrQu/9SvrJcAk9kmw
	TqPCoQHv5Ufh3p/aEgZhx3hY8vp+Vtn6UZ6H/UFKcLUufjmUeA1FLOqa3FsWVLNWmiOLXpDUh+T
	UkEzsseCmq7XVzLNVoCC748YBI6jufupSV6zJxAqabfkxXoCrx5xCt4WLyBCLEVJTDPeQULWKxy
	pC5vDeOKEqoyYjzKP3zF11kxgoOeUjIIJUuY8/o7oKlhWhE/+N4iaABPcOHQX4JwBgYLtuiFlX0
	Re1us0y/DRHmx5gYi6qjyWiXxN1qFYRRLeRXKV4U0rplQikGRJzE3bBD5dZmByZE2+y3OToimVl
	E5G+ImiFtf5ntt
X-Google-Smtp-Source: AGHT+IF+BYCHuUTwdpdjVvLvUjz9fJvW2obdjNL293EGpVlweKHP0tzpD6mVfCW4djoRh1UoGciBdQ==
X-Received: by 2002:a17:907:7fa5:b0:ad5:8412:1c9 with SMTP id a640c23a62f3a-afcb996f1aamr380512666b.59.1755197101896;
        Thu, 14 Aug 2025 11:45:01 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (37.247.91.34.bc.googleusercontent.com. [34.91.247.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0f4sm2614772466b.106.2025.08.14.11.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 11:45:01 -0700 (PDT)
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
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v1 1/5] usb: typec: Add alt_mode_override field to port property
Date: Thu, 14 Aug 2025 18:44:51 +0000
Message-ID: <20250814184455.723170-2-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
In-Reply-To: <20250814184455.723170-1-akuchynski@chromium.org>
References: <20250814184455.723170-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This new field in the port properties dictates whether the Platform Policy
Manager (PPM) allows the OS Policy Manager (OPM) to change the currently
active, negotiated alternate mode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/class.c | 14 +++++++++++---
 drivers/usb/typec/class.h |  2 ++
 include/linux/usb/typec.h |  1 +
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 67a533e35150..a72325ff099a 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -459,9 +459,16 @@ static umode_t typec_altmode_attr_is_visible(struct kobject *kobj,
 	struct typec_altmode *adev = to_typec_altmode(kobj_to_dev(kobj));
 
 	if (attr == &dev_attr_active.attr)
-		if (!is_typec_port(adev->dev.parent) &&
-		    (!adev->ops || !adev->ops->activate))
-			return 0444;
+		if (!is_typec_port(adev->dev.parent)) {
+			struct typec_partner *partner =
+				to_typec_partner(adev->dev.parent);
+			struct typec_port *port =
+				to_typec_port(partner->dev.parent);
+
+			if (!port->alt_mode_override || !adev->ops ||
+				!adev->ops->activate)
+				return 0444;
+		}
 
 	return attr->mode;
 }
@@ -2681,6 +2688,7 @@ struct typec_port *typec_register_port(struct device *parent,
 	}
 
 	port->pd = cap->pd;
+	port->alt_mode_override = cap->alt_mode_override;
 
 	ret = device_add(&port->dev);
 	if (ret) {
diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
index db2fe96c48ff..f05d9201c233 100644
--- a/drivers/usb/typec/class.h
+++ b/drivers/usb/typec/class.h
@@ -80,6 +80,8 @@ struct typec_port {
 	 */
 	struct device			*usb2_dev;
 	struct device			*usb3_dev;
+
+	bool				alt_mode_override;
 };
 
 #define to_typec_port(_dev_) container_of(_dev_, struct typec_port, dev)
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 252af3f77039..6e09e68788dd 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -304,6 +304,7 @@ struct typec_capability {
 	enum typec_accessory	accessory[TYPEC_MAX_ACCESSORY];
 	unsigned int		orientation_aware:1;
 	u8			usb_capability;
+	bool			alt_mode_override;
 
 	struct fwnode_handle	*fwnode;
 	void			*driver_data;
-- 
2.51.0.rc0.215.g125493bb4a-goog

