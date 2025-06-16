Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D001E501C
	for <chrome-platform@lists.linux.dev>; Mon, 16 Jun 2025 13:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080794; cv=none; b=D85rUnCYXpKAeCU49YdMFNVkbmaeBuOEMakMhefZ+gBpum70qly1dmzhwzDw3py2OPSxCgH3V2eRUuKLfIpdNwu4OiBLkADCMdMAJJi4oZ4nk8qYaduHd7MZsNG92BP4UwSMupO8kQ1HCq8boREbKi9JVt2NjfljYUJIwP7WH3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080794; c=relaxed/simple;
	bh=DfWtOSkx84l5KOCfEGNRyyvx2K3TB+JWEySzWnCGZMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t5OHLXo5Q6zOLBavQFAoC3CDSmyyjKHtoDQ4/em4W6g2aJiyvQmum49fek6zRprysUvQAOYHRbp2HPxlGrEgrhD5HDmVROsoWd3X3e4TXGrxl6YbSDnG02uBEROb1dHqLmQMK3hZoiKOItMyFPT8l4EUq8RPEXmgYaFl3rgGyh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NKOtwa0R; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NKOtwa0R"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad93ff9f714so797681566b.2
        for <chrome-platform@lists.linux.dev>; Mon, 16 Jun 2025 06:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750080790; x=1750685590; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CrvRU9dPA3iyQCatW33yYrWOV+Y1tKJvNMOa8l/wSkM=;
        b=NKOtwa0RMlbkVsBSmS6aFERodkx+mEDH39OLrHXBO304LkDV2w/lv9E79lfML8CKQa
         v5+KO/Zm5b8h7P1UORiEiI87djLQrkn2OxbsJCMgvbqT0/7PQlpz+u/Bj0uxw9lAo2Lq
         eQ4dj25XTYib8gMTh51t/bNoMT4a6WQVQArOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080790; x=1750685590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CrvRU9dPA3iyQCatW33yYrWOV+Y1tKJvNMOa8l/wSkM=;
        b=G18yKgr7mIzcXrFnrEh3pnHMPPn0wDx0PXAdE3TjZ07OiB7nwwYeiKxE/5kfaXF0PX
         kuCCFzH6J/jcDdk3mPX6naU095wuVvj33N0qr9knCChtrm84pPuEtxAXvzwdc5Pms+3X
         +V8jLS6FOGGjLxy0PYhHyMnaBzGHvp3w7FG6U1ezLpxBh/8W1c6TI0G3VyGwp+8oDRlq
         wyPeof74JaKabICXEdZbLWz/A68SlZFEPBZAX/iIa2A7AUzzL+YrJosS3sHd+zvYEU6q
         8So5UdCf7lGcgnAEnhDaOOsR0G54h1NiwWOZqaCDfEHN6+9KkVNQp1BQAqmZfpy2aXfQ
         3YjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCBKZwzxEqvjtK+WNwDAU7XMdHi6gzhl7iyoxfEj3IOz7DYTYazHUoQBjrNlGqvsDd4fy1ZmHoURWaIQnNBf4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzN8anghq8IwibBj5Cy2fbWEOcWClj05nfTjvK80bJecqLCaf/M
	blNeHwEMktndGphdD+nvsbdu63InunFseypjDrUNpQ3CFDzlt2YZ9Sp5Is/1IQ1YuQ==
X-Gm-Gg: ASbGnctyTcuBgCnm+u44gAQ5dyFxLy3ZhPvFj7lfkA84avU8MUqGyJCjoftmGg7Wx9Y
	ftyigjz7wqbUDRhRnQ1L4syA/gHryYBVy5AjNPNp5aLttegQM6NUdMMkvavrFAnRHoTKgjmoNpD
	Djkf8wgOUFzw/Cq22JSfNWJzyVDiCl/v23jF9fj/ZEJV9Nw+aBQ+u8jwHCRkVU1BUqlVUI1wBkN
	EoRbUnPpbJSC+l6IlN1GY4C/91Y3i2Vo1+nBvCTzOqwz2iMHIfdm42KbGfC37it0mJd4E51EemZ
	asmUMRYb6sHOCZOrHYORc2u4Kx+izXQx8KhoZYWtM1sjVkyP3k4eTFQfLTButGY2ysnbXctPevz
	3O7bRk690t/CoEEiX9s6X9Q3FfMBtfFLr/SHYrvb2Fvm2ZJhFGvJgtfRA5A==
X-Google-Smtp-Source: AGHT+IHbDTcXrvlPhvHImcuxrvjv5KF3hnVki+pNJuztPFo+tXtICwF+2GhVHRAJEkGScMRhGJ4DLw==
X-Received: by 2002:a17:906:794a:b0:ad4:fd7f:a4 with SMTP id a640c23a62f3a-adfad4f42eemr816606366b.47.1750080790329;
        Mon, 16 Jun 2025 06:33:10 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a94ce7sm6036664a12.58.2025.06.16.06.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:33:09 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	RD Babiera <rdbabiera@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 01/10] usb: typec: Add alt_mode_override field to port property
Date: Mon, 16 Jun 2025 13:31:38 +0000
Message-ID: <20250616133147.1835939-2-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250616133147.1835939-1-akuchynski@chromium.org>
References: <20250616133147.1835939-1-akuchynski@chromium.org>
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
2.50.0.rc1.591.g9c95f17f64-goog

