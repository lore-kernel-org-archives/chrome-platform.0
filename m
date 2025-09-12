Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E557429993D
	for <chrome-platform@lists.linux.dev>; Fri, 12 Sep 2025 06:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757659683; cv=none; b=AL25tP2dP3yMaCrP9R9qvX23BPsI07cd41X3w1q4tAwKTUpTtzx1FyIR8arwRuO5rYNkEH8eigUW7BaIw10uxo2puLq3o+PYpI1+J2P2ixeMZSVojQ3Pdt7Pr2bv+60KflR7lP3XPpXFNiZUSs+uEa3gBk6qYw8cisqgi2iYMyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757659683; c=relaxed/simple;
	bh=9TpjhbJBttEeS1KmCJosi4Hh395qIeJ+0k53azp1Q0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hjTfUUfjQjXkugLnOIbAbSOt17bmgBYxSxYomcdE9UbW8SvQi9S+5mmvxO8x6a/8m9D2GjPlB0xAsm1JvkTjIgf+4ZynBzulF8PrizhoZG50AszHzoRWF/QPDMEtYcKxxlV8SQXr4B5g7v1veTi8lecxWhC86cwmedzpQ8cWaKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VmFld9Zv; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VmFld9Zv"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b043a33b060so228810766b.1
        for <chrome-platform@lists.linux.dev>; Thu, 11 Sep 2025 23:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757659679; x=1758264479; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faD29vPc8TtJSIlMGbZZx8zq4usFD6uCUoteS6fd/xA=;
        b=VmFld9Zv5HmfslYmnxSmb6j8+rfDP+TObJVoKBHsjRLIWOngouzQO3RQAHGMdZB8Pt
         KXbGgT4o/e9fGdArqk4dFzF97PqBwkJSWS3nDKyNTL+NHNzm2UXL6iRgr22sYZeHvMZZ
         krKuvQpxVxR1qFHBsHPH+Nx+iJjfFEoRmzO60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757659679; x=1758264479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=faD29vPc8TtJSIlMGbZZx8zq4usFD6uCUoteS6fd/xA=;
        b=nW4lxZ+6/n17Fw+Aprxo7NCmcirYT2oubjWbliy/2cifqixADGVZ55tsOSnhikLVyd
         JxUyHkph8rTdKSguUw1wH7M077S2DF4wvma2p4c8dx/yNAWEP7QZy5lVnFBRd6TQH/NG
         xsreWgIWtXKXkUEfnGKReZUhaf5onatg+HpwDmn3BtxlxrMUzyhcU8lMDGZ4GrEY2xqF
         GPa/KURyA+2+O+NLaWWVcuHls1MbuU6CmHGI29oTXiKNUejN51NH3xGrYTtrDdEO5V6t
         myt/pdYYPmxpX7BfQSlqTQNE8auHeDrEBW5CyUzwgUxbWiDWvzgHspws9Br2SKkvw7Nd
         wDRw==
X-Forwarded-Encrypted: i=1; AJvYcCXcDFDiXQvSI/o6hmaf/dwxd44AnBa5qL2O6ZnFnE7ku2wqkpbcfgwEzVGQx8jVAdscTzCGpjAXCMHLqfAkIms=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/n9za8rKfYtaQlqXJ+E7s+D04i1S64kWsnCVObrDa2wrv8w+9
	yFy36v4Mq9D4Ij8xFRsA5+hmXvuClrsQvKdyzlV8EkwjWmxiY2mqujjVK5ck9JYv5Q==
X-Gm-Gg: ASbGnctD/0clmVC7OJ52p1qsYQeDWAgLaN8B+IycU4vLbPZ1fd/NEm2klAqF47HrRQQ
	3Jl3ZBqlLNnazp1IlL7z3CwRKOyD27+KOACctijvBUgiBSrvtJJ39iTBa+oVVHWtWivKGinruDs
	lNo6lV292KhRSUaeI3M4eav8MIihzTdm/KGy50+BUyWkB48F31MGOVvSjwKp+xnHU8P+N4YZHvh
	BwW9NvHsWiNSPF0N93PnZjPdyXdVr3wdnCBCR9zk1bHoRHGf/fHTPbjs/L79obUifvcAjnxICq7
	4FXjSnUqjZqNoBaKljvyIKxP8U+8KYH6ZWNpy1nqGsttwftndHgHsOf5BlhNaSRznoxrtCkIC9j
	QR75myKOMj2iz3s7WVm2rnzB/XvI6M+k9qBkXiymmR7WY93Whno0F0NX47k9XyCsIYZ/JUjrsNj
	jYO2TFkndCxSx5qf6AjQQF7+w9ow==
X-Google-Smtp-Source: AGHT+IFx9ydYE5CesosJBDmvUWYyToOaRt9RCUyztzIS5eLFbP6lDhD0TsJXKbVlqYDJqGhNfxzUgg==
X-Received: by 2002:a17:907:6d21:b0:b04:bfda:e457 with SMTP id a640c23a62f3a-b07c3a7b8d8mr152607566b.63.1757659679234;
        Thu, 11 Sep 2025 23:47:59 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b3128a1esm295465366b.29.2025.09.11.23.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 23:47:58 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v4 1/4] usb: typec: Add mode_control field to port property
Date: Fri, 12 Sep 2025 06:47:48 +0000
Message-ID: <20250912064751.1987850-2-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
In-Reply-To: <20250912064751.1987850-1-akuchynski@chromium.org>
References: <20250912064751.1987850-1-akuchynski@chromium.org>
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
---
 drivers/usb/typec/class.c | 9 ++++++---
 drivers/usb/typec/class.h | 1 +
 include/linux/usb/typec.h | 2 ++
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 67a533e35150..9f86605ce125 100644
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
@@ -2681,6 +2683,7 @@ struct typec_port *typec_register_port(struct device *parent,
 	}
 
 	port->pd = cap->pd;
+	port->mode_control = !cap->no_mode_control;
 
 	ret = device_add(&port->dev);
 	if (ret) {
diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
index db2fe96c48ff..2e89a83c2eb7 100644
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
index 252af3f77039..8f51665d44ec 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -287,6 +287,7 @@ enum usb_pd_svdm_ver {
  * @prefer_role: Initial role preference (DRP ports).
  * @accessory: Supported Accessory Modes
  * @usb_capability: Supported USB Modes
+ * @no_mode_control: Ability to manage Alternate Modes
  * @fwnode: Optional fwnode of the port
  * @driver_data: Private pointer for driver specific info
  * @pd: Optional USB Power Delivery Support
@@ -304,6 +305,7 @@ struct typec_capability {
 	enum typec_accessory	accessory[TYPEC_MAX_ACCESSORY];
 	unsigned int		orientation_aware:1;
 	u8			usb_capability;
+	bool			no_mode_control;
 
 	struct fwnode_handle	*fwnode;
 	void			*driver_data;
-- 
2.51.0.384.g4c02a37b29-goog

