Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0D335CB98
	for <chrome-platform@lists.linux.dev>; Mon, 19 Jan 2026 13:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768828734; cv=none; b=jjIAJ8v9AFkxa3aavYDXDlqxAaan8EarGpFXuvJrA1/B8uggHfa8XbN9f7e+mbCFDWSUgccWjeLnOF1rGtEFB4W3K8qe1p7V8lilC8zLjdxdxWqHy7j0DfeZnlj3v3uh8nxeUnBYlRCmFN2xyK1ExMGl8VkVwVwK/CNQD/6X5qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768828734; c=relaxed/simple;
	bh=DfrSPWYURzwp3WwkWbtpXKx1iOauYrzcxYjkJqvZmck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mw+fzqt2Cp2GVfrYbcfUYDrlnLIjOKLQYYcpdI6QQxi1RHlT0mhPt5RV7/vhMk9AInc9U/HFnFqxkUqp9wjDYzmbUE38548u2rgIcEbxg0FI3Wi8ndH8cJJNYvxi02cyNUYoZqPG92KtiuF9v1vHiB7HPAx6jq55zwPURmZDznM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IctBUB4c; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IctBUB4c"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-65063a95558so6582029a12.0
        for <chrome-platform@lists.linux.dev>; Mon, 19 Jan 2026 05:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768828727; x=1769433527; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVZyoDBgCg278jS1vSrSjkeNL7wqN0touFgdWqJTr8k=;
        b=IctBUB4cq/vFdIthSSyYiD68GjG++3/TBImsmV0JXG7HkuFxav35ol2vprPkSQxoiz
         9bygTq2nlWVIpYQbTqiZMGN5xlfFCGvxFvCBaeePSe071biNKZCUibHRyKERHSNu2w2/
         kFoeKIpwn48IZj3Sqb3b3eeMy4RobRbR+SHco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768828727; x=1769433527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JVZyoDBgCg278jS1vSrSjkeNL7wqN0touFgdWqJTr8k=;
        b=rAapJQq2RQcSljqGyZlSk1XCVslXmM/FiHY4LIOhLvX7WB5iUatLmPkJKFRdnIsmuE
         frvp8UJYBJeb573tlCsbhbL+KQmGgkrX1DtDx6e7+GiLs0okKsIRh7l1cGSOviBe5DmB
         7Z9o0IFxJa35PuAs6Hw7AdiIs7IqZXACFpyXlLXtjApOOKQiNaY2KgLaHQUQV6CEpaxb
         leGN4ZE0ZWmo7BczJJ3+eXuFH7PmSZdAOpJnQTF3PaL2qTk0tMMyeM/0wLFBMwl+f+VY
         c0oAPpTYTkyv4Av5twNmy4UrJ3/Y6oyLGyxEUdpSqpYa/mgoV9i555m5z4Hy2glL4ch5
         sElA==
X-Forwarded-Encrypted: i=1; AJvYcCWkD3uQe0f5cyGLRV9YhP7czcprHXxwBzwwrFJPkVQJTT7u7M7Uj5QlpHGO5O7YdNWv1nM4mC7pvJDFCCuRhWI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw29zwrbcaGJ9KjKZn1LvQarnZg2pt3PYflclKVQ6Cgolbbo/eJ
	BAQW6bx4/X/COsrMSAtU4EJIsLswRnrJ7M+675BvCpwjZxakpWoN2pGyFNYh9CerLQ==
X-Gm-Gg: AY/fxX7pQiuiaXqIsOUUGiTRfG20OjSmMhY4Fsynbss6xzNMqytH7snnnoNv+lOdPNw
	umL96cR8sbHDCqr52WUiPj4Jsr9RIYk0bCefKUi7Dzlmc1Rj0KiJlIZTBnzr2CvrEhOV0dQ6su6
	dqIR9Aay7SQwtrxGQhQHceu7pdJR5+frkOBP/xBpbD/RzSUSO/3+LHM+XS/QXZlk43/fKOjEpXy
	WYNvp+oX1Et+0q7fpjJHkT6wkIKIwRBqL92rYTYPa5UsdAgNJU8X1+lvq+2uNszXIaRRbHQOFRJ
	NrphCRZFlaWzSAbstRqzaXlDokS33HuCwXxkunuHHJGse7rzn3i+9Rq63rHNKP0y7GyLYPEqci7
	aK9t9NHg1mlbZ0oV+I9gM+maRPuIghZxbWLRlTf//uH+l4fC+B70bQAWfg0vQS9AuMaVaBZSA1Y
	VyI8AS8CLMb6LvEaWwkDrSKPXKsTJpESwahlVMBC/0gsGNxIQM9OUxa4P8Riw7QHMaPdLJm65du
	47SG5L4xTJjzpvPoDk=
X-Received: by 2002:a17:906:7305:b0:b86:fd46:724 with SMTP id a640c23a62f3a-b8792d489b0mr1082509366b.13.1768828726748;
        Mon, 19 Jan 2026 05:18:46 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9a14sm1078801866b.45.2026.01.19.05.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 05:18:46 -0800 (PST)
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
Subject: [PATCH v5 3/7] usb: typec: Expose alternate mode priority via sysfs
Date: Mon, 19 Jan 2026 13:18:20 +0000
Message-ID: <20260119131824.2529334-4-akuchynski@chromium.org>
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

This patch introduces a priority sysfs attribute to the USB Type-C
alternate mode port interface. This new attribute allows user-space to
configure the numeric priority of alternate modes managing their preferred
order of operation. If a new priority value conflicts with an existing
mode's priority, the priorities of the conflicting mode and all subsequent
modes are automatically incremented to ensure uniqueness.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
Reviewed-by: Benson Leung <bleung@chromium.org>
---
Changes in V5:
- Clean up code style and alignment issues

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
index 0f12d6120511b..a48c447125184 100644
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
+					    increment_duplicated_priority);
+
+	return 0;
+}
+
+static ssize_t priority_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t size)
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
+			     struct device_attribute *attr, char *buf)
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

