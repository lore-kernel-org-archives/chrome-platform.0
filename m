Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6213C29D291
	for <chrome-platform@lists.linux.dev>; Thu, 14 Aug 2025 18:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755197111; cv=none; b=im5Ni7CRoIcML5hjCM3bh7nSJ/w26FIn7HiwrbXZ6scalReKRypPoBDwq3yKauW3jIoLaLkUiGglEINTI4d4tcrAgbRXhj0uwgDhP1Tsk8BpyjrhRxjBjJHc89CQcZ+gfq9lcLqm1SEEuOHwpmuacG2eO4UbCab2isspHoCPbq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755197111; c=relaxed/simple;
	bh=JYJuJJtKbSbwoGNn2vGBU0HeE/q6/qLRN8ZG3a0DukM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WITY5e6WI2q2aFDftJmc6yW/w6ppp/jivDbEswiHd+Ma3KUHgy3FrqyNc9EOvMerdDIJyWbfSUQ8li2FIEi3kTFzQ8E5OlLBEeydtc7y29ZR/quvyZvWsJOTKcnb2QZ2prRVIsKAfjXOcHJNKxv85Oxp2rr+xVzFLvoT65QIfo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Je04+a+h; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Je04+a+h"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afcb7347e09so209577666b.0
        for <chrome-platform@lists.linux.dev>; Thu, 14 Aug 2025 11:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755197107; x=1755801907; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qG0lIEyNnJu30xpAJGFwUH4NJAVmrpYlXCdXMGkL4NE=;
        b=Je04+a+hiHMFuYFbCYF2YyUb1RXPz4Ln9NP1w+QFLMlA86Xs6VqBFZQlbDxNQCmsgG
         4R3QKD2Ss6LsDYeMO/bcOUeaxQ+0CuRN6A+Qa7f/cAvfXYVLAaiMBb2tGn0N0YkNwANp
         dIQ8ShvT+l4FGZrIUuJHsZxNdN2yHv3MuNvr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755197107; x=1755801907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qG0lIEyNnJu30xpAJGFwUH4NJAVmrpYlXCdXMGkL4NE=;
        b=WVtAx5aUVmdSvL1jfxyFXLtjSpvb67iX4WhTItoBfq2sCrshiLhbIp5jiUnkcrkvUw
         90h4fDsEcUPKnomy80kPRfASWaSt6Coey9i2bCQA+lfhxo7XnRA2trjwr/S4bcZnswt5
         ALi4waEtogTIS89SJOQYReJDCh4p3mQTDB4pS/g2+IG+OPjU9PL2/x79a5WNGKlBpb4B
         5Wv3E8cKPFYsO3km0j1WoNuKQeH4jE+tH09yQn1DdHnt3NowSpU1XKpuYsb8G3PETi8x
         1rfWgjDrCE0xccK1sOEZYI/PUoiVGyz7hn4EOhpDgtAv1rvH9mz7P5wUTlpAMUhV7U4E
         VEHg==
X-Forwarded-Encrypted: i=1; AJvYcCW7NP/8iOlXE2LaVSIYeb1+AJnNGFjwMMOkr/RaLXTn6eKHqSFB8Av2Mn8FYubucIldWRX1c9uEdv4xN+w09Tc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyLx76Ay/8jr6zPR9oA9Id7D2Az/8RPT961cLArZQdrHUfi1FxQ
	8A5v6qQniSpfoDHboEGU+HqjwVYxBuCoGkDm4/wwyAhzK9mqWaeqc6RrmYQ8NkFQMA==
X-Gm-Gg: ASbGncsiecx++2m7/KoHYXfNCbJaXkgmFWVaxpVelFMuzPNK6qDXbd0cAcE0J4taAZ8
	n0PlZyXE+M/tNZ7T5XQKHE60/3e0qXHzwG24ww+kMEFMU/8kgOr0gyzTClpgeDXR+CGF3nnKn/1
	WEeShrxjqcpRNSQ4uLhBgaYYJxg03SEXaqnuA5ADs1Ffu9LQVEkGpwfKpJEEvHnhH7N7GyW7zZM
	Jwtcj0skqcuvE5fgfTaOfKLz87IVYBiyV8yeAQZ2QNBQ2xVbxo0spuccpwGDOXmhnbPtalLz2f1
	ZeL8VtSUNYcBuJxAfZOt1esmlCT+UdCrnDP5iNZHwqLd96hpfder1DHQJSqKByp8Ym4h1Gw0r5Z
	L0eaqV4SJgYrP1Sdn1hwaEWMfvT+lmvWtS9dnrSBnRI5gyF4GtUl8CRdFXzgRQ3vVmAyrt+Y3Yq
	DJThwdWGUKL4l+gEJvH4SjM2ZRsE3wIViyFw==
X-Google-Smtp-Source: AGHT+IF5+9Rm5CQWAnwcUIzR8+1SMRvn/532XJx42aw5G3W3xEpn8yRTB8aPidZXpklreIMFUWH/CA==
X-Received: by 2002:a17:907:6d12:b0:af9:3ad2:6930 with SMTP id a640c23a62f3a-afcb97cb1f3mr385072666b.24.1755197106660;
        Thu, 14 Aug 2025 11:45:06 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (37.247.91.34.bc.googleusercontent.com. [34.91.247.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0f4sm2614772466b.106.2025.08.14.11.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 11:45:06 -0700 (PDT)
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
Subject: [PATCH v1 5/5] usb: typec: Expose alternate mode priority via sysfs
Date: Thu, 14 Aug 2025 18:44:55 +0000
Message-ID: <20250814184455.723170-6-akuchynski@chromium.org>
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

This patch introduces a priority sysfs attribute to the USB Type-C
alternate mode port interface. This new attribute allows user-space to
configure the numeric priority of alternate modes managing their preferred
order of operation.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 Documentation/ABI/testing/sysfs-class-typec | 12 ++++++
 drivers/usb/typec/class.c                   | 47 ++++++++++++++++++++-
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
index 38e101c17a00..001202d651fa 100644
--- a/Documentation/ABI/testing/sysfs-class-typec
+++ b/Documentation/ABI/testing/sysfs-class-typec
@@ -162,6 +162,18 @@ Description:	Lists the supported USB Modes. The default USB mode that is used
 		- usb3 (USB 3.2)
 		- usb4 (USB4)
 
+		What:		/sys/class/typec/<port>/<alt-mode>/priority
+Date:		July 2025
+Contact:	Andrei Kuchynski <akuchynski@chromium.org>
+Description:
+		Displays and allows setting the priority for a specific alt-mode.
+		When read, it shows the current integer priority value. Lower numerical
+		values indicate higher priority (0 is the highest priority).
+		If the new value is already in use by another mode, the priority of the
+		conflicting mode and any subsequent modes will be incremented until they
+		are all unique.
+		This attribute is visible only if the kernel supports mode selection.
+
 USB Type-C partner devices (eg. /sys/class/typec/port0-partner/)
 
 What:		/sys/class/typec/<port>-partner/accessory_mode
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index a72325ff099a..708f3487222a 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -19,6 +19,7 @@
 #include "bus.h"
 #include "class.h"
 #include "pd.h"
+#include "mode_selection.h"
 
 static DEFINE_IDA(typec_index_ida);
 
@@ -445,11 +446,41 @@ svid_show(struct device *dev, struct device_attribute *attr, char *buf)
 }
 static DEVICE_ATTR_RO(svid);
 
+static ssize_t priority_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t size)
+{
+	unsigned int val;
+	int err = kstrtouint(buf, 10, &val);
+
+	if (!err) {
+		err = typec_mode_set_priority(to_typec_altmode(dev), val);
+		if (!err)
+			return size;
+	}
+
+	return err;
+}
+
+static ssize_t priority_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	int val;
+	const int err = typec_mode_get_priority(to_typec_altmode(dev), &val);
+
+	if (err)
+		return err;
+
+	return sprintf(buf, "%d\n", val);
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
 
@@ -458,7 +489,7 @@ static umode_t typec_altmode_attr_is_visible(struct kobject *kobj,
 {
 	struct typec_altmode *adev = to_typec_altmode(kobj_to_dev(kobj));
 
-	if (attr == &dev_attr_active.attr)
+	if (attr == &dev_attr_active.attr) {
 		if (!is_typec_port(adev->dev.parent)) {
 			struct typec_partner *partner =
 				to_typec_partner(adev->dev.parent);
@@ -469,6 +500,15 @@ static umode_t typec_altmode_attr_is_visible(struct kobject *kobj,
 				!adev->ops->activate)
 				return 0444;
 		}
+	} else if (attr == &dev_attr_priority.attr) {
+		if (is_typec_port(adev->dev.parent))  {
+			struct typec_port *port = to_typec_port(adev->dev.parent);
+
+			if (!port->alt_mode_override)
+				return 0;
+		} else
+			return 0;
+	}
 
 	return attr->mode;
 }
@@ -2029,6 +2069,7 @@ static void typec_release(struct device *dev)
 	typec_mux_put(port->mux);
 	typec_retimer_put(port->retimer);
 	kfree(port->cap);
+	typec_mode_selection_destroy(port);
 	kfree(port);
 }
 
@@ -2496,6 +2537,8 @@ typec_port_register_altmode(struct typec_port *port,
 		to_altmode(adev)->retimer = retimer;
 	}
 
+	typec_mode_set_priority(adev, -1);
+
 	return adev;
 }
 EXPORT_SYMBOL_GPL(typec_port_register_altmode);
@@ -2645,6 +2688,8 @@ struct typec_port *typec_register_port(struct device *parent,
 	port->con.attach = typec_partner_attach;
 	port->con.deattach = typec_partner_deattach;
 
+	INIT_LIST_HEAD(&port->mode_list);
+
 	if (cap->usb_capability & USB_CAPABILITY_USB4)
 		port->usb_mode = USB_MODE_USB4;
 	else if (cap->usb_capability & USB_CAPABILITY_USB3)
-- 
2.51.0.rc0.215.g125493bb4a-goog

