Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA16371EAE
	for <chrome-platform@lists.linux.dev>; Fri,  5 Sep 2025 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082147; cv=none; b=bqYYxVfKUmf2qi902JunWxC6Xk/4ZlT2q3xZwhgrWOhwaj+TkWyFBock5HHAwXBHS+zOxUi2CaxlwBnzZZF8NjoXGtBAmlkBjvq5lQnY3F0GqmzGCZoVjJFSp/bxLR0EQEtb/Y3ceR3fLOrmAbNKb3Jhq4Zgo/SE3MRqXQsGD64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082147; c=relaxed/simple;
	bh=N70arxT/iGReacj90zjbg0gjuZvRPUxNf9AQDKl2eMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QNFMbDdAnQBx0f/KkuCxv+ykIRWtbzlg0lY2S9d+BY3BOURGplQn6rBrfsxM9TZm6p29sMHfLus7JbDybdEGX4gR64yOiu9crWjk3MATYlO3tpFSl9PTyGzQ4CZROfM6j0SzL6kQCBBbsh+n2pcQNRld6UyCcgl4n2z/aGuQTHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ikPVJhtC; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ikPVJhtC"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b04271cfc3eso292585166b.3
        for <chrome-platform@lists.linux.dev>; Fri, 05 Sep 2025 07:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757082143; x=1757686943; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aM2EplsdBpHriECPVCPtShoqnRN3L2lkTWP4nBkA3tY=;
        b=ikPVJhtC2Q12ZIdt3FGheYAQRfgKmA/+iHW8OM12hS+k3P+Xyt9Veb3pdjhzvBkccd
         pUgRXPogVE7TdHE+7jWpjSXulS2LzCfDtg/KGR/QazQIbjMpX+T1av4jGtgxrP1GcfMC
         sDNfM23IVa8099Tjgfegj9pPfmq+FQkop1L+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757082143; x=1757686943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aM2EplsdBpHriECPVCPtShoqnRN3L2lkTWP4nBkA3tY=;
        b=Oz/K31/WcRPCO7XetdT1rmsxecyZHe3GK2uP+tuQ0lsoJSKJoBEHXDYIfJRXgnX8b/
         RrRqDZ+AkM7RKPHRhj3yHm4KhmbvycNv+/hGr6aQYKeLKZ0ZRZFlYuWcm0P/RNRlSi4v
         x8IH6RLUOk6+TVW6cR5l6/74iCIP3n6gHtSzyHuSdHBMng2lalumtzdMVu280iue6jsU
         2rMf4bQG7eu0oC2hINnDKtsTXZDKOUFMXIcZ1NEIhGTPhr0IDfSvYfRCq00vVkfpV8W+
         GhS0n6woqgtU+m4wPeRXYgzH4mCdWuAdHt6n/rcS49DslXD70zZA2s6PhHQF4wuW8/0A
         88Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWxbXkDuhIIqFdBUqozdELqFY2xI3G4cW5Fe9OEsXw1nhPxhnlEmqtshAg5UZ21nJmvDKtxVOtXHNqkw+bS+jE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzso1WKHXRQgCl0YpWIL9b+yQPG2DlljuTFkeN5YB2O3XuNjTm7
	zh+lZCNT12NUOWBoGkXu3gmCPXka3QVX84cZxvYw0lJAnITIqKJ0wVMVHOLwJHtUGA==
X-Gm-Gg: ASbGncv63PPQwHK/eHkUx2DYILiW1WR/UdllJpQtex6jcAb1ozMYXEMIfjAkOVP6ORU
	2Xg0mQG+W6w5MRSaC06BEdj36nyjpRpcbeEkGBxoWpKaafOC7y46IhX/loM9HWc05ugT4OvuBly
	gzyqOa9wbTD8eS2fS2zAsZKIKMMGU5FcHA30Mg7RYwhen/7fvw62ABzkqPD6xGbEcOJgWSkMBAk
	fa9gZUOFxwDAzPB1BWALCZI0t0JcdyxOok8T+trtSRGY9n+up+xKvt38g5Mf68BEK80xieIi0aP
	16CnZFgHePWy3TEEaJ9+9pno1LJQN6Bb7MECb6qbpmxwgGNam21l+gE0jd3LuleTbALOarXxPx0
	H9LUeUaUqeM7pjD1L3sz2LHdKp5Snp/gEndKYw087oZD8FVHaQDL2cuoypLl3OF4TWlLYOK6Y0s
	Hmjz5epvpdBV7g+yc=
X-Google-Smtp-Source: AGHT+IEUW8qkOHgjidxoy4ZII7ZAuk//jICzXdqIhvcSNPCu7yDo3dIGYIsHRdwcsjy825w3RSPySA==
X-Received: by 2002:a17:907:94d2:b0:af9:5ca0:e4fe with SMTP id a640c23a62f3a-b01d97bd1b7mr2225391066b.56.1757082143434;
        Fri, 05 Sep 2025 07:22:23 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0476e0d61esm502141066b.53.2025.09.05.07.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 07:22:22 -0700 (PDT)
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
Subject: [PATCH v3 5/5] usb: typec: Expose alternate mode priority via sysfs
Date: Fri,  5 Sep 2025 14:22:06 +0000
Message-ID: <20250905142206.4105351-6-akuchynski@chromium.org>
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

This patch introduces a priority sysfs attribute to the USB Type-C
alternate mode port interface. This new attribute allows user-space to
configure the numeric priority of alternate modes managing their preferred
order of operation.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 Documentation/ABI/testing/sysfs-class-typec | 11 +++++++
 drivers/usb/typec/class.c                   | 32 ++++++++++++++++++++-
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
index 38e101c17a00..dab3e4e727b6 100644
--- a/Documentation/ABI/testing/sysfs-class-typec
+++ b/Documentation/ABI/testing/sysfs-class-typec
@@ -162,6 +162,17 @@ Description:	Lists the supported USB Modes. The default USB mode that is used
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
+
 USB Type-C partner devices (eg. /sys/class/typec/port0-partner/)
 
 What:		/sys/class/typec/<port>-partner/accessory_mode
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 9f86605ce125..aaab2e1e98b4 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -19,6 +19,7 @@
 #include "bus.h"
 #include "class.h"
 #include "pd.h"
+#include "mode_selection.h"
 
 static DEFINE_IDA(typec_index_ida);
 
@@ -445,11 +446,34 @@ svid_show(struct device *dev, struct device_attribute *attr, char *buf)
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
+		typec_mode_set_priority(to_typec_altmode(dev), val);
+		return size;
+	}
+
+	return err;
+}
+
+static ssize_t priority_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%u\n", to_typec_altmode(dev)->priority);
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
 
@@ -459,11 +483,15 @@ static umode_t typec_altmode_attr_is_visible(struct kobject *kobj,
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
@@ -2491,6 +2519,8 @@ typec_port_register_altmode(struct typec_port *port,
 		to_altmode(adev)->retimer = retimer;
 	}
 
+	typec_mode_set_priority(adev, 0);
+
 	return adev;
 }
 EXPORT_SYMBOL_GPL(typec_port_register_altmode);
-- 
2.51.0.355.g5224444f11-goog

