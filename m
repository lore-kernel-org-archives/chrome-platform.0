Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA46D302CCD
	for <chrome-platform@lists.linux.dev>; Mon, 24 Nov 2025 12:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763988416; cv=none; b=JOCe/4nRZxLEw/uIGkMdobT6yb2YNniKwcpRKquxMwFryZPbK/ObgtRSWo3XiRr7j1YeQiS3okN4IGChlYbvr+laPOVu9oqkqe7ROA4+hZONIgteH7gsn5N6MYVI84PY1+VfEFpj4RCy2y3tCkqTwKnCJP4PqTrNQ6obd0NbVGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763988416; c=relaxed/simple;
	bh=ZcWRPSvnJY7j9sksuKnADdwDhkWT5l383JVkKi48Y4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gW12jrf1Ns+u6nUe3s+DmSRn7sjGdg4gqmaC70vPwsSFVZB3XqUh5gmXoV0kB9YYlap/nmyF+lklQ3uuGKT4eRmnUugjnJA2YMeLk3lzMYp7FwrPs/wbcB7d6G73xq/cZOFzLQb+qPI6M4cTZm433RPZKySXNsNSkmZOtDswmXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=A5DCLXrL; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A5DCLXrL"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-640ca678745so7075094a12.2
        for <chrome-platform@lists.linux.dev>; Mon, 24 Nov 2025 04:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763988413; x=1764593213; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tksLNCM9hMN6EA+LRxmgTQx4fghasKcuZYm2c3+N8w=;
        b=A5DCLXrL78HQx+A5aGKCu2uDAHTWX56C86+N2CakipTtvJDqMqQBFR1/nRvT4PiOtu
         88qEPYXpBbolYkq4gRFnXydTNwD7I7MbziCiCzhHn4GB5Dzjb4mBMo+HzWKTKMss3Tv0
         YRlNeMRyGZ99CK0aL2wqCUplkx/7LLGSuO9PQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763988413; x=1764593213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+tksLNCM9hMN6EA+LRxmgTQx4fghasKcuZYm2c3+N8w=;
        b=vThHzFMYxlRYSVCRYXj86LXcsClYZF6XR31rGpPxCOVPx3XuvkghhMUY3E6rRmv7e1
         yQQ6w0uhoj7oTLFuHtRa2gTHoFi1++CquXAu8gcXcJ+5hBfz4KZTknv12xBWTCNs2MxN
         Emm2ZC2CuVg05Mhy2fHTKCwGCr4/vglxe+7uHmQJcssJGTodFRDAl28PAi+mToDZxWqD
         8UtE0+Un5ZsZvZN8tH4R45g9mvoCblA131rLOwFl0GpdlAv/LvadfaHlE+QYNc93IRdZ
         4PAlFhmtHg67Jt5EsFnGiZ4jphGN4zImbcopPLAmQeuzAd/0KwPsa7W1sBkzrHDfetPk
         oYiA==
X-Forwarded-Encrypted: i=1; AJvYcCV8z15k6YYr9jdF+8FeRu3ouabWR9g6lYvFfqBm+uzmKIDcRR7Z778NDH+lGqnbfuaLqHoWsP02jffST2GBzfc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZniHMhGbV9u9p4xY1UWUYpsY73P71R5z6m2AOTfSUQmHPeKwG
	0NT0e9BZW8DtR5gOT7XwKHFdlyx/Zvtkqk2GzTtLBIeKdQTQ1/e/TSxpTbdXelIO1Q==
X-Gm-Gg: ASbGncuSshMewKSP8JH8Cyh8FdDXLk2CJGqKzCtF+gqlek4paw7GV5mK+hQRS/nfwcw
	tRMJuIHNlKyhnmaqNb15T+TtOeU9rMdIoiXH4D8aGMoABXkO94o/kAXKGjl0wwTHXR4h6w7snj8
	bhItnkOa6UxsrdROOa9Y0ieKDAMqyHPO5dpQ/FDxmGUOW/HQl1pAviNnwOsIDLVr9nyd1euMtKu
	hYUnsR+aSu1o3Gy1k/ZigyNGwbSoEHtMe3rDLmDB+xWyMW0s6dj/AtRZyvSD/ZYBWl2tpAIjk7x
	WDDCyq08/0+9hdfnno5eUFYAE3OcVCEZCMFzdc7hv0U6PftygyyvrmFO/KeDT2PZqb/neQ4qi0G
	zDRPUpBAe8/q7dZl2dE3VMX80CzVHzSgPwMUIzvCPzF90MCnKWrhhFgcQVJ6FSzbG7Z7NptU6Xy
	gzfUJx205S5bZm6mFNSeJ6qh3MNPG2Z+X3WL+SFNfJquv8APDEFe7Al616j1xqOuuNzeX0hLWKw
	/iPVplMNo4=
X-Google-Smtp-Source: AGHT+IEfcpbzsOCnT/x6NbrGmqhHYN1EwoeFU1i5kVHhF/kjyV0FZnqLTamKpVXxQGhmoo7XnU917g==
X-Received: by 2002:a05:6402:13ce:b0:640:947e:70ce with SMTP id 4fb4d7f45d1cf-64555b85acamr10495350a12.5.1763988413169;
        Mon, 24 Nov 2025 04:46:53 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536460ea9sm13342599a12.35.2025.11.24.04.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 04:46:52 -0800 (PST)
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
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v5 4/4] usb: typec: Expose alternate mode priority via sysfs
Date: Mon, 24 Nov 2025 12:46:39 +0000
Message-ID: <20251124124639.1101335-5-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
In-Reply-To: <20251124124639.1101335-1-akuchynski@chromium.org>
References: <20251124124639.1101335-1-akuchynski@chromium.org>
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
---
 Documentation/ABI/testing/sysfs-class-typec | 11 +++
 drivers/usb/typec/class.c                   | 90 ++++++++++++++++++++-
 include/linux/usb/typec_altmode.h           |  1 +
 3 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
index 38e101c17a00..737b76828b50 100644
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
index a5327e444265..049d1829be98 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -445,11 +445,88 @@ svid_show(struct device *dev, struct device_attribute *attr, char *buf)
 }
 static DEVICE_ATTR_RO(svid);
 
+static int increment_duplicated_priority(struct device *dev, void *data)
+{
+	if (is_typec_altmode(dev)) {
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
+	if (is_typec_altmode(dev)) {
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
@@ -2484,6 +2565,7 @@ typec_port_register_altmode(struct typec_port *port,
 	struct typec_altmode *adev;
 	struct typec_mux *mux;
 	struct typec_retimer *retimer;
+	int ret;
 
 	mux = typec_mux_get(&port->dev);
 	if (IS_ERR(mux))
@@ -2502,6 +2584,12 @@ typec_port_register_altmode(struct typec_port *port,
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
index f7db3bd4c90e..2c3b6bec2eca 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -28,6 +28,7 @@ struct typec_altmode {
 	int				mode;
 	u32				vdo;
 	unsigned int			active:1;
+	u8				priority;
 
 	char				*desc;
 	const struct typec_altmode_ops	*ops;
-- 
2.52.0.rc2.455.g230fcf2819-goog

