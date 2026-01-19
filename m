Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1975358D1B
	for <chrome-platform@lists.linux.dev>; Mon, 19 Jan 2026 13:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768828730; cv=none; b=bGna+vu+ejj44TzRPfum6kEn38/JKwwwPrYOZRhpaLJlwFkiUpJ4bFuXgm/yBBwHvJGQ9Nzth8gQebdByAcMsZRMnGXjXrkTTwiEGUFPQP3Nnezg7jLZyVLb7jVkRe0U5v2T8cu+Ct63N5HzF1ktYzYhIy3w3MIEKfWihgZL+G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768828730; c=relaxed/simple;
	bh=V1jmUzlQs0mqeDEI06ZenpYXU3urQAv3hO+yVPpB20c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aQUaDJN/Clte3WZq9HSLMkuId2bg4Vlt2jQqWvp2tWt6QYmxeq/aaS+jiqidTKHtfkhka1kJYrVOlJ5mVlz7wrajsr9UZLtChRYTWKSyuBlE8jEg2ITY2umJxjocyb2Py89yYz6VEib0Ak/52HL1/StyRB00+uC/YpW4pmwVRxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FxHoz/zD; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FxHoz/zD"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b874c00a39fso760555366b.0
        for <chrome-platform@lists.linux.dev>; Mon, 19 Jan 2026 05:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768828722; x=1769433522; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLqa5LSPMe82XqVLviPNjog13TrBNYmx2vAnL8Z9NGE=;
        b=FxHoz/zDkJXwjJBw+mBzQbDtu+YVw8Uam1zlBqiS/Ogjgv6/VLFz+hRuwme5F0HmZP
         aLGJj9pxpbo1tr5/nOR+mlOPM3arMy9zFrNjWuebHNrBobNkVmat3jGn4mOGl5o/zSl+
         FJQWkFMsf81DCtRpT92oEPvdec9ZsClMHiags=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768828722; x=1769433522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cLqa5LSPMe82XqVLviPNjog13TrBNYmx2vAnL8Z9NGE=;
        b=IWMASV9E+Y/gOVy18vPhEiOdAkHClbmjlph7m4zneJyrIW/OqhWyZy9HrI5sBfHHDK
         /99ZORdAdb1Kx6N+5MjDqefyInUfHNP3rH0QNsAryTK85SpHyk7IkxkGd0YI7/APr1wn
         agyt8DHOjgD6Nl+MFXYEz9q1EJqdsXwwXsdwasniMTqvG0qgB2/S11wN/Kz/2Fkn357J
         yJJTtV0TKHOOhyySdhs6Uddz2SYQd3Fk/fIUtevK0oX1ZXgjL+LaNJgZ+twnLQ/XZDLz
         NPOq2D6mTvEKLAzy6dsY4LwEk3Ewx4Sep4RE3RgcpqtNRw/oYZzrrnEN+iYQqre+FEGy
         vo1A==
X-Forwarded-Encrypted: i=1; AJvYcCUaNiD6yc18agyXhAMu2+18B+sGc/u9FZmvWCnOZ/VX3F4gD1XnjC9lUsHpwLWJBtLD6r/4gzE802X7QVFVxj8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzH4Nuyizq/yUatHzK4Z0abPU53bWWIakQo5uz/R/HjvnmGMrCG
	cn89/6bfkURHDOc9CoezkP/o/HQ5yPdygQiaxhGlPMpF2Z3CAu0a3TReXIv6IAPBmw==
X-Gm-Gg: AY/fxX5Jj/RGRrdyUawZFRA3+szrxYTGTFLJfZy9czFaMnv8XdrserIslt6nJwOaqdO
	gqbhX9sO4/zouHIxFuP/kD+o4mNaJqMC3uQxvAf4fTWpcFEwPOwd6ARnMTQNA4cNJ/GRppZToAN
	kLIjh+jPSBLgqFTAbcTpk3ep4iEaeHV0R6XbN0lJjwFjfG8IULxeE+QF7mREAOC/7GF2Xd2iPXt
	m8uI7ju9kXrDcJfmqPjWV1NnmIkEknEsRSHK8YUm/gRjxY2NMQMD0rMqNdlOMzKGj+eOXOUTNkW
	qX2hhk3oKK6vd07dneSiSDLzM+NqmwRZOQOU+P4p6CplfCUF+6C5AeMN+YuqVTIY2RH/UpomRvv
	ifXG6rGunjDsd8+HJomRuB/39w670O6E4Zmxv91tvrv3mg8pzyzw0VoYFUyStldNISzedX2i7kr
	3HfXmSo4i96/Ff/1lKolcUWk3GKn5P60zMfDX877bbDOWfRoohbwaZTPWkSiojKB9PeVBqPJM5I
	dS1i5d7
X-Received: by 2002:a17:907:971e:b0:b7c:cc8d:14f4 with SMTP id a640c23a62f3a-b8777a09915mr1291724366b.4.1768828722003;
        Mon, 19 Jan 2026 05:18:42 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9a14sm1078801866b.45.2026.01.19.05.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 05:18:41 -0800 (PST)
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
Subject: [PATCH v5 1/7] usb: typec: Add mode_control field to port property
Date: Mon, 19 Jan 2026 13:18:18 +0000
Message-ID: <20260119131824.2529334-2-akuchynski@chromium.org>
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

This new field in the port properties dictates whether the Platform Policy
Manager (PPM) allows the OS Policy Manager (OPM) to change the currently
active, negotiated alternate mode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Benson Leung <bleung@chromium.org>
---
 drivers/usb/typec/class.c | 9 ++++++---
 drivers/usb/typec/class.h | 1 +
 include/linux/usb/typec.h | 2 ++
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index c4ff4310ff58a..0f12d6120511b 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -457,11 +457,13 @@ static umode_t typec_altmode_attr_is_visible(struct kobject *kobj,
 					     struct attribute *attr, int n)
 {
 	struct typec_altmode *adev = to_typec_altmode(kobj_to_dev(kobj));
+	struct typec_port *port = typec_altmode2port(adev);
 
 	if (attr == &dev_attr_active.attr)
-		if (!is_typec_port(adev->dev.parent) &&
-		    (!adev->ops || !adev->ops->activate))
-			return 0444;
+		if (!is_typec_port(adev->dev.parent)) {
+			if (!port->mode_control || !adev->ops || !adev->ops->activate)
+				return 0444;
+		}
 
 	return attr->mode;
 }
@@ -2708,6 +2710,7 @@ struct typec_port *typec_register_port(struct device *parent,
 	}
 
 	port->pd = cap->pd;
+	port->mode_control = !cap->no_mode_control;
 
 	ret = device_add(&port->dev);
 	if (ret) {
diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
index db2fe96c48ff0..2e89a83c2eb70 100644
--- a/drivers/usb/typec/class.h
+++ b/drivers/usb/typec/class.h
@@ -62,6 +62,7 @@ struct typec_port {
 	struct mutex			partner_link_lock;
 
 	enum typec_orientation		orientation;
+	bool				mode_control;
 	struct typec_switch		*sw;
 	struct typec_mux		*mux;
 	struct typec_retimer		*retimer;
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index c6fd46902fce7..dbb259d885266 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -290,6 +290,7 @@ enum usb_pd_svdm_ver {
  * @prefer_role: Initial role preference (DRP ports).
  * @accessory: Supported Accessory Modes
  * @usb_capability: Supported USB Modes
+ * @no_mode_control: Ability to manage Alternate Modes
  * @fwnode: Optional fwnode of the port
  * @driver_data: Private pointer for driver specific info
  * @pd: Optional USB Power Delivery Support
@@ -307,6 +308,7 @@ struct typec_capability {
 	enum typec_accessory	accessory[TYPEC_MAX_ACCESSORY];
 	unsigned int		orientation_aware:1;
 	u8			usb_capability;
+	bool			no_mode_control;
 
 	struct fwnode_handle	*fwnode;
 	void			*driver_data;
-- 
2.52.0.457.g6b5491de43-goog

