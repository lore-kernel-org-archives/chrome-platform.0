Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446F42C0275
	for <chrome-platform@lists.linux.dev>; Fri, 12 Sep 2025 06:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757659690; cv=none; b=l2WO9g+IdUeINqkNb0lT2OrIEGi0CEopyhDJP0YF3MOTVssSL0FvNp0PW8+xUtBUoalrhOkpqg3i9xPuOi2Xt9sTMeqqIqRsh9Z280aWy4tnBhs3ChGkWXQj4gLMh1/uwrpKZgbRP+u4DZpnXEkLPgz0tIoEqpFEldc/nkCzALk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757659690; c=relaxed/simple;
	bh=UT/bION2zNpmXwBRk6uc/9Eat1ApMNYCZlITkT1NplQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NLgyKVv/bjpprUQF45SqdD6LvNcrQ9DnJjmFfl/pHD3szaCjkrTCQc6hAZwocC94vH/sIHqMRNP3bDsShJ40YNx4jRT1q7Woc08JWqZ5BawV3gSig/9hsh4PSa9K+g1GMMVZD99Hen0q2nPPNk7NWkCTFaVK94Qmf5+Vy9Y3au8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Pl0VSasy; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Pl0VSasy"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b04271cfc3eso188922366b.3
        for <chrome-platform@lists.linux.dev>; Thu, 11 Sep 2025 23:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757659687; x=1758264487; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0Xtud0TdVZ+DWagzGFvFsKpmqRiYDQ9VDWpfm1enwI=;
        b=Pl0VSasyanPOHhvopZ2VNzosh5J2vi6BhKi1VLlJcEUJPHjBRbBWYl+wW7MKkgQWGI
         Xv8EDDnR4UH4JKamkyg9tKG8vIbJv8vt8O3iBsp2YOi7xD2QLJiL5gMX+x5ANfq98LvG
         niotmF+S6sMM1uKT+nhD4IX57F/U61a3SDaZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757659687; x=1758264487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0Xtud0TdVZ+DWagzGFvFsKpmqRiYDQ9VDWpfm1enwI=;
        b=c6doyJ8YiV/tEusEE8wyRdH66U5R98QU2VsDb2TmkmopJJLv4h10L0AyJKItER8SlR
         lNqqOGNUV42gK+6hhvXj0b8I7ELK8cPvKboqdcYopLgWMDBA5B4kAM0H0pH++cNrwbSU
         RCOxjb2bFKvAaQv3SzO5/Erfpue/9HHxzL8h4v+m03fx64vt4CCRlMncAb0oI3IQGQVI
         i1brKVLqgKcjMDwAlcpWpxfQk4MhnPPz/hcOuPCLLHms1QHX6+3NUu4nfx3d7JVkzYTb
         B5LlgWB3O18fWbgFUXWhDAtBB9lih7rSiAv7pDkl2rUurUZRNPZv/bQovfVkGDmiyB9K
         26zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNMh813P5OKJoVecM2T1wCRM8cGQjdla7LoeWrpJCZiFiGMlsiJcWN5huJ+Y7RfXxZvz2TkC8Q2AuvXMUTY4Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YzFEri9syZgxD90xY9jbIlanxp8luesWxBft/Ss9TaAnZOyZK8D
	Ewc+RjyNvm99OAnBvMoWkWvSBSzHwrEuIPvHlLwDYoFponO04VJWtVfoUdtnWXrZiw==
X-Gm-Gg: ASbGncsAjTwWj5nXVbWfIqYKKRnk/qsTFSfNl6HHanLLGAH4r+6kpSKw0OAm99/gv4l
	k6p6a1+QRW/NXoryXPXQnFh1uuSLJU46mrhPHbU2TrLpUjBYnA8+lekpIJHxvmeeOC6YKpH19Wx
	8j/Skyh/XYQmZePTMtl+XjjgkFdgicOO15oR7VqlkIy204XC/IWDOROtxnzvn+HitAzdxCFfODb
	xNBa4zmsPPcnscpbW12/Q19MhMWwTrEIUShMAHbucUWuYmitS4qaqDUfOEzUfT/gaEFSmFE6Oc2
	fSczHLm7HQiTL9mF5ZPZG4UOMCHbs4koLaGPFrs6rCUQ/XhVb5o4L8zpBeHwkOibF8NgMMMUUnJ
	h1Q6MHTWRGGUqFEreP5iLogeHRYOPdW+kVSH1R01jbKCEoKOph61bXOmh7P+LXSCDN4+HUxclFN
	4+YOlXkMr43WYaj3TPjeG4EYTCbhfhEXjPz/cB
X-Google-Smtp-Source: AGHT+IFJXwxQzhGtmgTg6Wyltw4l/rkxAEpJ7pN6ZY/j+zLPCSWzQ8LLU+wbeQfpDvkIAniXPe0jLQ==
X-Received: by 2002:a17:907:9623:b0:b04:708e:7348 with SMTP id a640c23a62f3a-b07c37e0e05mr181292666b.30.1757659686414;
        Thu, 11 Sep 2025 23:48:06 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b3128a1esm295465366b.29.2025.09.11.23.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 23:48:06 -0700 (PDT)
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
Subject: [PATCH v4 4/4] usb: typec: Expose alternate mode priority via sysfs
Date: Fri, 12 Sep 2025 06:47:51 +0000
Message-ID: <20250912064751.1987850-5-akuchynski@chromium.org>
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

This patch introduces a priority sysfs attribute to the USB Type-C
alternate mode port interface. This new attribute allows user-space to
configure the numeric priority of alternate modes managing their preferred
order of operation.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 Documentation/ABI/testing/sysfs-class-typec | 11 ++++++
 drivers/usb/typec/class.c                   | 37 ++++++++++++++++++++-
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
index 38e101c17a00..0f6e6adb71c4 100644
--- a/Documentation/ABI/testing/sysfs-class-typec
+++ b/Documentation/ABI/testing/sysfs-class-typec
@@ -162,6 +162,17 @@ Description:	Lists the supported USB Modes. The default USB mode that is used
 		- usb3 (USB 3.2)
 		- usb4 (USB4)
 
+		What:		/sys/class/typec/<port>/<alt-mode>/priority
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
index 9f86605ce125..6191f7def91c 100644
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
@@ -2471,6 +2499,7 @@ typec_port_register_altmode(struct typec_port *port,
 	struct typec_altmode *adev;
 	struct typec_mux *mux;
 	struct typec_retimer *retimer;
+	int ret;
 
 	mux = typec_mux_get(&port->dev);
 	if (IS_ERR(mux))
@@ -2489,6 +2518,12 @@ typec_port_register_altmode(struct typec_port *port,
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
-- 
2.51.0.384.g4c02a37b29-goog

