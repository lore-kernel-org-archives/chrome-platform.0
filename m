Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C722936CE05
	for <chrome-platform@lists.linux.dev>; Fri,  5 Sep 2025 14:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082138; cv=none; b=eZZxBWD2Glga59p9Nrvro865mV4RjwzDVN1HqKWYMW3jaGsmivq5S95lwG88JSQuwMzCK47nVXrpmGM2++ViwwGgCzrjtUPeaG1AKuybxKiRwmKJTBh+u2QPd9AsGubAK3m3/hEzbOy1tEVj2WVHRHRSKAJwUL+W1XNaBsgTUZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082138; c=relaxed/simple;
	bh=Hc11dQRZZPHY3rRj8sQC49olD9NpE7/7qRqZ+w5XAn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OVp0gaN0vUeW7FXGhe7ay/d+sduw8d5KSPLvBJNEUr/S6Kvl3e111l9pbeiRzP5mHZfMtPIrtWGmm6UT8Q6lPa5i3LRarv7an2+/1AywGZiCLv+IW9yOevjLgErPZrFFyAU8Azr+zpU07qK/3IMVK4MKdu+o+za7oHWDQwm293I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=l9/EW2/X; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l9/EW2/X"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb78ead12so346910366b.1
        for <chrome-platform@lists.linux.dev>; Fri, 05 Sep 2025 07:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757082135; x=1757686935; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OV1LDwfiuLJ9IBiJAs7IEkPWomukwV1rFx4+Ev+/eEE=;
        b=l9/EW2/XiYS/qBLcXZKfpZ/JljFeJglAOsxDnCAxQwCEGD91UUQnZWSQvyhxyjyNUl
         4NEjrz8ldaq4cQ5YQGg636qzl7sU+NqTtfj5Yq5DbMgwaWnAhzAiRTkO+7VlIGeJc6er
         u8j+cb/B8jARTM0AeqpIugW32TScJ9wI1tQmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757082135; x=1757686935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OV1LDwfiuLJ9IBiJAs7IEkPWomukwV1rFx4+Ev+/eEE=;
        b=c6+TeH63FBPEbO9cCEa/96GTaULOzrKePm5ZaEO74xel0fnVF8m9L+iP8aiIU8hG4e
         x0k8KZ7xj76PxyM+P9vCFnHavAf1YmrxbEMKF4yhJFeduZAyZyFBUoDi718TD2pT9Mmo
         jZIiBkbc7JMIPOGx++i7YQjydf4T7iu7tNjEi5WBRDYFp2+5vj4wk+SAHJyMPBsftCCz
         zGnb8OqJUDw/gFxtO0Eb+I12REX+EYBxbrjmyIUjTF5LHH4OzkrrVS+2MdQaphvFQaO3
         Gis8h6WkXw4dHgWf+KRf8de62B9MzhHwGzVjeeA5oJaX4NHN/DanSEwa7bKcrokZJmLr
         uxjA==
X-Forwarded-Encrypted: i=1; AJvYcCUc+bhvta5984temcwOSpV/3FdHwE7Yt9eI21xMP2G3L0H1Rn7rfnut8mntsOmPzPaxd59Id8nXY8Wqwtib3Rs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwA+mZFtO+RC02F/rF6wrqmg444pXwPJTEcNuev9kyUjCxgUyA3
	x/jqkuHSQ5A1WhzGnenNltwCem7gNME2eoyJLglqY3S4Ouq1ITWpLtVDeSMGq+P1yA==
X-Gm-Gg: ASbGnctNKdHhP21X6OnRlH9oE/DY2362k+D6khSnYghjy/5mqYQGNjypIBzsNqPWzyk
	ybd2agXc2kRqimSCEQx9Q+uNCe3Dc+IlbkE8CblJB4wQ2luzN0zToS/8kmCUxt3QsKiaojQh++j
	9DTLRwe1hIW6iHT3cxqyZDWwAdN9O4w/GRkms2rUyEQk33IMra6ysrJk19QhHhXBkkX9Z6Chq8X
	V0KbiQnj51gVxWqAIaPLgVkIGdlgGFCUCqD0Ym4w105P2imJYFX2g5rQ1forcMK0mg7NxwE3duN
	FYq4dzB8qzVmzCpTUPvuqG2me5QeiQVwxWn3OayfG7ErLz+pSkRor4aQ9joGKrPRwjJddihzEXJ
	3hlNo8uB8XPzZQ6o/90AmYKW6hNkevmswrZ51MXB+xlFotpuw2B08n3RFSa0JAQhuII5ekJ1brr
	un+tLjyyrwdAx9yD3XyLRZLswcpQ==
X-Google-Smtp-Source: AGHT+IFCvd3VJRlMQTN63ZbgjjAhsrShJNCJ07Shx+1GenFVnJohKqUi4MazUtwYOIyKPWi7eRjrKA==
X-Received: by 2002:a17:907:1c8c:b0:b04:8ed3:9e81 with SMTP id a640c23a62f3a-b048ed3d358mr431118866b.31.1757082134828;
        Fri, 05 Sep 2025 07:22:14 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0476e0d61esm502141066b.53.2025.09.05.07.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 07:22:14 -0700 (PDT)
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
Subject: [PATCH v3 1/5] usb: typec: Add mode_control field to port property
Date: Fri,  5 Sep 2025 14:22:02 +0000
Message-ID: <20250905142206.4105351-2-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
In-Reply-To: <20250905142206.4105351-1-akuchynski@chromium.org>
References: <20250905142206.4105351-1-akuchynski@chromium.org>
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
 drivers/usb/typec/class.c | 9 ++++++---
 drivers/usb/typec/class.h | 2 ++
 include/linux/usb/typec.h | 2 ++
 3 files changed, 10 insertions(+), 3 deletions(-)

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
index db2fe96c48ff..c53a04b9dc75 100644
--- a/drivers/usb/typec/class.h
+++ b/drivers/usb/typec/class.h
@@ -80,6 +80,8 @@ struct typec_port {
 	 */
 	struct device			*usb2_dev;
 	struct device			*usb3_dev;
+
+	bool				mode_control;
 };
 
 #define to_typec_port(_dev_) container_of(_dev_, struct typec_port, dev)
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
2.51.0.355.g5224444f11-goog

