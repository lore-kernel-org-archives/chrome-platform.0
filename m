Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DA538FF1F
	for <chrome-platform@lists.linux.dev>; Tue, 13 Jan 2026 13:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768309561; cv=none; b=F2K8Eauz05wkH8Fmq0Ta8+qibtLsiSOmDPkX14dgDbIpTBhqcxHWEYyeVJ7a5eb2FNK+V/T0ECiUzE7BlbKnH5U6uXcQmzEiIJPG47PAigTpfKRj0Le2xPlMGasUDmm6Ek+0N9++BF8lUVxiRPi3YTE0JtmjGmNW3hBx69AhSPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768309561; c=relaxed/simple;
	bh=bVUhc7VpDUnDxfDtkHva6EQ2YfFZC4bpqm5zztp0T64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fT27pRvV39uT7Ae0y8lPRpwGEMDuULLUwsnTF2sEUIK5wZLQBv+gxT9+JHr+oCqb/nhxV7e0E4s5svQD9UbnyhNUc+DFWRgecA30B/wtYYJU5ypJnC7hcOSkzgtf4btNKIiiaVaS7lVxv0LC0LwypueX2fgvTY/SQ54QOvYWkjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GM4+Ot5o; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GM4+Ot5o"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8707005183so390144666b.0
        for <chrome-platform@lists.linux.dev>; Tue, 13 Jan 2026 05:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768309552; x=1768914352; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=afo50+aNolz/eyc+FXJYc+MI5yPdVLIkEoTPV8JfhIk=;
        b=GM4+Ot5oOYvXRhKP1MtWgZm/YNbDU74UkyyuOBOmqEsh42xwLbkoiSz994MMZJyja+
         5Ua40tCaPGkDhy3G6JliVjjMevZ/4UIbGXZce2kj/MTH0F45sfG5u9B+F1yEkAF4BQx2
         VPpmtk3G1Dhf+TvjL+pn3qJxiTnjWho7nVpQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768309552; x=1768914352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=afo50+aNolz/eyc+FXJYc+MI5yPdVLIkEoTPV8JfhIk=;
        b=RbulS115ddJqaYrb7LJ76AgVM2pLv2foSVe65sU2snQMxGUqkWFh0r9FUpTJ52F577
         E+3o177TpxAUVFDbp86eWUzKxUwOEnDc+eTy+lDSEvnLCilciDzwh7C/EfNmnSS0bF8x
         lqfO8nnuCoA3AK1iSRCwhkj46WjqweV2yUBAANoLR9G4gRdXHA4oZB+UDmOEbJF/oKW8
         /VbnasEyviqG24g31+YEb8BsMXeQAgIEpnAfQui5jtc3eNgB9esjnDcBU2BlQ0KZOkw7
         QwA17CF/VKUB/59GpDMzX8PlJI3uGSCt/5kurSjUuIZ0JeYeucDMRRkZ6GZida5ZPEUD
         P0EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw7Ekw69Rk1BqxEh01NkDLPJXwldMfoQW2pqKMFAQDpCbipW5/remsKlD5cFCAX6HKxohZoKECPyRVpgzNOo8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxSFTdCcvheT4D+Qt4TNABHhxcjxjj3wHTNCqoJoVTpyrJC7yb1
	tp/jtaIL1mDjq6n0eHplPNsMvV8uNzQKGGgqPQXN41/gSAzDeMOtISiUA96na+2WjQ==
X-Gm-Gg: AY/fxX4OcBf5/BgFVIEP7ck4Y2KlVvBApG0fUSmoY6XkzKSkn4P26Rw97tEhTUoFJkA
	jENb7Yt1LWIg75SLPxm57n2ZTlQDvGBDm0UBOV7NWm6bH5YjG+oCD6enrJQbVExZQAsKzoZKdfV
	zrl7f4rZ32xP0kpog+YdgsBtF++8mk5lXf/TqPQ4TqcTy92snfijMrXXdQPPFIqt2kVZQkgAq9y
	iTFGWd7ZlM9E1RHvFFfEmW70AfhFuv5Z8ja676+nWdqZRjo6sHr7SRfkHY42dcqtBYvUiq9ct3i
	w+X/WVo/9JzsMiy2mn6HqmWCMrq4rcM0eyTQ4zO08pWWKnEfHRrVu1gLeHbhKXdhklt08zgcPRo
	hM6uGtCAEGC/OIJFfHT5VYi1Jkc+mU2VyUGEq31ektRJ9s7YRPUCVBtRdxCcRgG631C88ed0l5Q
	1uFKPAeivXmjENgZ7vT0HgnPKpZPJSNCT6ved4e6OuFUJCDPxpVXDe3DoZmzRPbikb6wwGnG7SJ
	8gYdC6V
X-Google-Smtp-Source: AGHT+IGIDWcZoX/igewBnXumY61TFpoC2nj6Rw8tc/gyULQtX23Kl7iOBicSZMG61hMYbEOewkNWZw==
X-Received: by 2002:a17:907:6e92:b0:b87:1a26:3672 with SMTP id a640c23a62f3a-b871a265b10mr652150866b.57.1768309551621;
        Tue, 13 Jan 2026 05:05:51 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b871b5e60dasm586217266b.63.2026.01.13.05.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 05:05:51 -0800 (PST)
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
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v4 4/8] usb: typec: Expose alternate mode priority via sysfs
Date: Tue, 13 Jan 2026 13:05:32 +0000
Message-ID: <20260113130536.3068311-5-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260113130536.3068311-1-akuchynski@chromium.org>
References: <20260113130536.3068311-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces a priority sysfs attribute to the USB Type-C
alternate mode port interface. This new attribute allows user-space to
configure the numeric priority of alternate modes managing their preferred
order of operation. If a new priority value conflicts with an existing
mode's priority, the priorities of the conflicting mode and all subsequent
modes are automatically incremented to ensure uniqueness.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
Reviewed-by: Benson Leung <bleung@chromium.org>
---
 Documentation/ABI/testing/sysfs-class-typec | 11 +++
 drivers/usb/typec/class.c                   | 90 ++++++++++++++++++++-
 include/linux/usb/typec_altmode.h           |  1 +
 3 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
index 38e101c17a004..737b76828b509 100644
--- a/Documentation/ABI/testing/sysfs-class-typec
+++ b/Documentation/ABI/testing/sysfs-class-typec
@@ -162,6 +162,17 @@ Description:	Lists the supported USB Modes. The default USB mode that is used
 		- usb3 (USB 3.2)
 		- usb4 (USB4)
 
+What:		/sys/class/typec/<port>/<alt-mode>/priority
+Date:		July 2025
+Contact:	Andrei Kuchynski <akuchynski@chromium.org>
+Description:
+		Displays and allows setting the priority for a specific alternate mode.
+		The priority is an integer in the range 0-255. A lower numerical value
+		indicates a higher priority (0 is the highest).
+		If the new value is already in use by another mode, the priority of the
+		conflicting mode and any subsequent modes will be incremented until they
+		are all unique.
+
 USB Type-C partner devices (eg. /sys/class/typec/port0-partner/)
 
 What:		/sys/class/typec/<port>-partner/accessory_mode
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 0f12d6120511b..1fb5450c0a2f2 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -445,11 +445,88 @@ svid_show(struct device *dev, struct device_attribute *attr, char *buf)
 }
 static DEVICE_ATTR_RO(svid);
 
+static int increment_duplicated_priority(struct device *dev, void *data)
+{
+	if (is_typec_port_altmode(dev)) {
+		struct typec_altmode **alt_target = (struct typec_altmode **)data;
+		struct typec_altmode *alt = to_typec_altmode(dev);
+
+		if (alt != *alt_target && alt->priority == (*alt_target)->priority) {
+			alt->priority++;
+			*alt_target = alt;
+			return 1;
+		}
+	}
+	return 0;
+}
+
+static int find_duplicated_priority(struct device *dev, void *data)
+{
+	if (is_typec_port_altmode(dev)) {
+		struct typec_altmode **alt_target = (struct typec_altmode **)data;
+		struct typec_altmode *alt = to_typec_altmode(dev);
+
+		if (alt != *alt_target && alt->priority == (*alt_target)->priority)
+			return 1;
+	}
+	return 0;
+}
+
+static int typec_mode_set_priority(struct typec_altmode *alt, const u8 priority)
+{
+	struct typec_port *port = to_typec_port(alt->dev.parent);
+	const u8 old_priority = alt->priority;
+	int res = 1;
+
+	alt->priority = priority;
+	while (res) {
+		res = device_for_each_child(&port->dev, &alt, find_duplicated_priority);
+		if (res) {
+			alt->priority++;
+			if (alt->priority == 0) {
+				alt->priority = old_priority;
+				return -EOVERFLOW;
+			}
+		}
+	}
+
+	res = 1;
+	alt->priority = priority;
+	while (res)
+		res = device_for_each_child(&port->dev, &alt,
+				increment_duplicated_priority);
+
+	return 0;
+}
+
+static ssize_t priority_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t size)
+{
+	u8 val;
+	int err = kstrtou8(buf, 10, &val);
+
+	if (!err)
+		err = typec_mode_set_priority(to_typec_altmode(dev), val);
+
+	if (!err)
+		return size;
+	return err;
+}
+
+static ssize_t priority_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%u\n", to_typec_altmode(dev)->priority);
+}
+static DEVICE_ATTR_RW(priority);
+
 static struct attribute *typec_altmode_attrs[] = {
 	&dev_attr_active.attr,
 	&dev_attr_mode.attr,
 	&dev_attr_svid.attr,
 	&dev_attr_vdo.attr,
+	&dev_attr_priority.attr,
 	NULL
 };
 
@@ -459,11 +536,15 @@ static umode_t typec_altmode_attr_is_visible(struct kobject *kobj,
 	struct typec_altmode *adev = to_typec_altmode(kobj_to_dev(kobj));
 	struct typec_port *port = typec_altmode2port(adev);
 
-	if (attr == &dev_attr_active.attr)
+	if (attr == &dev_attr_active.attr) {
 		if (!is_typec_port(adev->dev.parent)) {
 			if (!port->mode_control || !adev->ops || !adev->ops->activate)
 				return 0444;
 		}
+	} else if (attr == &dev_attr_priority.attr) {
+		if (!is_typec_port(adev->dev.parent) || !port->mode_control)
+			return 0;
+	}
 
 	return attr->mode;
 }
@@ -2498,6 +2579,7 @@ typec_port_register_altmode(struct typec_port *port,
 	struct typec_altmode *adev;
 	struct typec_mux *mux;
 	struct typec_retimer *retimer;
+	int ret;
 
 	mux = typec_mux_get(&port->dev);
 	if (IS_ERR(mux))
@@ -2516,6 +2598,12 @@ typec_port_register_altmode(struct typec_port *port,
 	} else {
 		to_altmode(adev)->mux = mux;
 		to_altmode(adev)->retimer = retimer;
+
+		ret = typec_mode_set_priority(adev, 0);
+		if (ret) {
+			typec_unregister_altmode(adev);
+			return ERR_PTR(ret);
+		}
 	}
 
 	return adev;
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index 9197a4637a938..7e6c02d74b54f 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -36,6 +36,7 @@ struct typec_altmode {
 	int				mode;
 	u32				vdo;
 	unsigned int			active:1;
+	u8				priority;
 
 	char				*desc;
 	const struct typec_altmode_ops	*ops;
-- 
2.52.0.457.g6b5491de43-goog

