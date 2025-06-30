Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C1628C01F
	for <chrome-platform@lists.linux.dev>; Mon, 30 Jun 2025 14:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292773; cv=none; b=MMN2Aaz83M6fbxgB3Jr+Y5FBqsNSNVcuO7LxgAYlJXIfi7cY74keV88EZSHSnDvD/jxR1x5uerDypSs4a9GTnqFe+2cSwbgWE3C5Jm62HKD2wvEEo4zuN3OtaY+UT1tr6ASkPi8WeN/W/nCJ90Gh80BSDvz9JIxN0jznO0jz1jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292773; c=relaxed/simple;
	bh=UbU7avGhiW9Nh0EyyPRGSkHu5w0s9/pYfAxGAYTBVT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WwZP8xlydtUiWsX/ltH1B0lK0tDYBPHqsCf8UlEKLm1EYbRu4tKVTNTyHXcwrM1KS265B2cP6LfHvYoIZlCvXLvLls1qZg0BPsEGzmzP+6QpX35RCHtkuFv9eQVTMLE/SwySBVW4MSMn0AdhLb25sdeRS20koZA+mPFZ8arjNds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dJo6QESZ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dJo6QESZ"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae0dd7ac1f5so758457666b.2
        for <chrome-platform@lists.linux.dev>; Mon, 30 Jun 2025 07:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751292770; x=1751897570; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3faCGZIUGXYM8A0hkVX0sik8je51spanXR3H0h+FTl8=;
        b=dJo6QESZdwbMFBJRkK/BVMO8jCXMYJ33CdMWXjm9KtBhulAGAbPev9Zzs3LrtxhQ6q
         Z8uxI0JK6W8B7bCyC+aX+n0dpAAO2tyPdkNR/U3Iq8K2Dy3YguIVlGAX/dinCsBPKj5/
         ZtnRHS8XrnBHSJ3ieUNjPCFRhhbnrMxggv0NI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751292770; x=1751897570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3faCGZIUGXYM8A0hkVX0sik8je51spanXR3H0h+FTl8=;
        b=tkx4gSa7abrWuTQ+aXSlNow34uz7va6Wiyrcny322nyyaFT38PSA8i3cb53v2spXK/
         bhi7XwQjgCpap9BbbVLuupFzp1x5VAac3HH/exXONwmL1ZW5AMqWRv8GClFyb17mCKKC
         ZD7MB5J3Cenp/pZFci6KWczcpNG39dkiVDTVnYUKX8d4O9K1EL4lz8JxphXKE7Rd3AH3
         ZWIx/JZ7KsXuKDnkYqTZ/NzGQ8uN7cbaxtl/eKQNGMRGnlt0BlpxALRiNGrFaae6Rzqg
         IkyTCin6rYkXhFtZ4QAUCauX3c61/ez2XiAQDaRFbaaHNfjvBgsjdtFiZ4NoV9kK8Goe
         7xhw==
X-Forwarded-Encrypted: i=1; AJvYcCUOWUW4/WFKcCOXE1BQy3OJusR+8KOSrQyi2FKdcl7F2Q6C8EREwCttuL0SBYHRQSfNfnjRwBiRYnCBG2oAT5Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4yoCaZlqYLcAUkoCUkuFOD++oZlr6CBYf0PSrYaQc9wzxaMAI
	j8kz0q2r4GZrccZ/4ackyKeB9RcNmSHnGCJiYJQ1VUGR2vyOGMmbXE0+mqcYqlFCLw==
X-Gm-Gg: ASbGncu5ZgQXx8DaQdEmC9nC6oU9Fk/8IcU+QsdUDiQrgASo6wjga5BZJOTp9EiQOZM
	bwyvneqvRX1tc7wYqR6ZM9DBmmHkUga71IEK/uNA1hmRWHOOS67ppchSaFqGakwZFZJTuvAPqi5
	tMT3N2Y6IW5WkCFrZOKZb8lghMQhveMWwa2h6DMCUJ42qn36W92pl6EGPvgfZbVd8WKn7UZZM/o
	qFkKmFixTfi6hu1fOgnIOp1B6FZEnm33pSUPJRbOHv8pQRSLvC3oikj5QTwXFtrVCiVmvhWvAnj
	7KmAnH1FXOKf/f2tSlNBk5ZYLv61ICckPzgRi6mljKS5YENaPL31ycVbjFx5jCUS3WGNq+3m63l
	86PKeMAgWM/3/BEtFlEn7KzOR8FNxtvG95MPoxKbS6XQ+DL8eFuuq
X-Google-Smtp-Source: AGHT+IGivi6cPTyaSHpxq+HEAQH9kp3ktVpVCImG4H7wtjZGGZZw4e2kZfR98cB5DDtCwjdDtwQmUw==
X-Received: by 2002:a17:907:3f1f:b0:ae3:6a82:e6a2 with SMTP id a640c23a62f3a-ae36a82f7b0mr1096335266b.29.1751292770281;
        Mon, 30 Jun 2025 07:12:50 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (72.144.91.34.bc.googleusercontent.com. [34.91.144.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b416sm670643866b.28.2025.06.30.07.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:12:48 -0700 (PDT)
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
	Dmitry Baryshkov <lumag@kernel.org>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 01/10] usb: typec: Add alt_mode_override field to port property
Date: Mon, 30 Jun 2025 14:12:30 +0000
Message-ID: <20250630141239.3174390-2-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250630141239.3174390-1-akuchynski@chromium.org>
References: <20250630141239.3174390-1-akuchynski@chromium.org>
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
2.50.0.727.gbf7dc18ff4-goog

