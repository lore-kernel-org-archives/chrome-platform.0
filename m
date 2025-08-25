Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB75A301035
	for <chrome-platform@lists.linux.dev>; Mon, 25 Aug 2025 14:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756133899; cv=none; b=qbE/Kvgfup1VmA82NLJQGezDnOUfiPCfaCkRvM96uxXT5U8JEBw3Qd4mnIwDOBifSlgsS94riLb9QEpWwzFqgVKuc4LbvDT0b2Cf2kJw1Y6S4b44aZQ7xpWsdJue8ELR1wfuAWtOGNXj4mYnuZmmzOFF9zDQD5paW3p0mQalRiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756133899; c=relaxed/simple;
	bh=XF1HMt7dKr2pKHf61hV+dMVYlJL1q20sHlne9+/cMD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n/HDDU+2WdPuLsx9LcTsGqFEUrRyocamMIyqa2USbRYX7hNBOqB/CiEeVO7Ed9Oqj0wOLvPYe7WN36h9kSURMRPImkx1cqmZgG0JELF1F/LYuZzJbPvfejXlImgpIYYHbJSoxcpqf49CBGxCr9DSIYmrT4clnruzpDDONlue/Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AoKzbRiM; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AoKzbRiM"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afcb73621fcso601563466b.0
        for <chrome-platform@lists.linux.dev>; Mon, 25 Aug 2025 07:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756133895; x=1756738695; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q03fJibhKtDh3Ep473H06zamAbGTx2QJY+Jsovc71/Q=;
        b=AoKzbRiMzQMVlMfPc4Rjeiyx9Qj9Wmf/hsyXqjMYpGAY8xk7P7SqNx98eb2kjU3xNp
         63j4f1R6JjVGA4qCcwpdz0W4D0H8mEXGQgIn37Vrd2CrLDPbUfV5qzA5NOqGqvXiaC+G
         IF/0t6v/dwg1a1tgJRQBnLqnuFjDKT+ucmvow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756133895; x=1756738695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q03fJibhKtDh3Ep473H06zamAbGTx2QJY+Jsovc71/Q=;
        b=Lta9QJxh5M8lIvdMmQy7ixr4ED+aZtDUAAOexrRxcbHPrxf+xaRkl5R431IFvw7tvO
         3QyTQ94cMy41guYswmQ5r+beU5PGi67slSINzazb7MwMAMZ1z/JHXKBmiV1U744YjHTa
         t6fp6xNZQc7FypyodjcW9SvtfZ7k4q87yI+2dVV/J9IvHGeWGQ9l8O1ddSgJM6PiTVoD
         Us5tJ+uCzF0o6Fw0CIjpaz6tnLQKQe023TLo1AeMVsC3JW785krQDR5nJECWN5uXuwaE
         HbSzcygIHQYlaUGyTE4xDf4aTEFg2UYQD3gnY2Yy9Y/DsNsVgl10gjmTBg7hn56d6OvK
         N7zg==
X-Forwarded-Encrypted: i=1; AJvYcCWgV+wNQa9B1l27exG8jQfyPZ26SMo2fhD9kta++02gyFEb3P4oD2Kn0H4Ef3kpm0jAjXfmBOvi1wFc2F/cKYc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZEnWZ0qqyawiMHsqyRbPY5kOBoUz6ecRiubA5iFhR9b43UwgO
	Mk51hO6zjrknt41zxiMBKtPKqkSL+WBObPDeXkJq0i0M7HxjfO/MmKywpAxFPWzRNQ==
X-Gm-Gg: ASbGncvTp5gillR2Vn4+eYbE0TKN0Yz0fJoKYQkSBQyUlSURO4uHAGlR3RaScUrtavu
	s5iMgyMz5Oe+/ckpd6FKPMuBnnm7lO4Bym9yoGfspr0Hzl4FfSE+wUhp77nBf3EOG9hBI33O9Z3
	f8e84gx+uVWK0Mx6ZOZbwkYboRUkDxXWXyk7MkQhgtuA0JgNDN98D0tF+ostvJFyl5f+KYy8APk
	fGpNRHAqWE3Djyr+fnbeBaQSyCBpDgIAa9QwthQth2swvcHEhTCbbA4+Ef1NfZbH/bZkOqqri/8
	ZxeGYWyTUUtWoSyMgz/8liQ5Kl3ei5lIGdFfzGRHzvvajnJZM5QNJuBauQz9VPeY9vwdDN3ch6I
	nfjw46oYVRaQCrMbMYNyxHV/WQnAGcepBQkSTyhPcg9ZIrvww13QqBkTB8SQuC88QQMttlKjDi2
	lEtnRgc7LyOC1b0pW46f82xhlXw7aGuINBwA==
X-Google-Smtp-Source: AGHT+IFQk16CgrOBqQfmn0Kw8YzFpuW8oHF6Fa5HEls+UObeDgxxUHP9Lle73RVTSHFp8RT//Y03tg==
X-Received: by 2002:a17:907:9611:b0:afd:be7d:725 with SMTP id a640c23a62f3a-afe296e8771mr1244313266b.61.1756133895202;
        Mon, 25 Aug 2025 07:58:15 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (168.23.91.34.bc.googleusercontent.com. [34.91.23.168])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe8d03f981sm117294166b.60.2025.08.25.07.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:58:14 -0700 (PDT)
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
Subject: [PATCH v2 5/5] usb: typec: Expose alternate mode priority via sysfs
Date: Mon, 25 Aug 2025 14:57:50 +0000
Message-ID: <20250825145750.58820-6-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
In-Reply-To: <20250825145750.58820-1-akuchynski@chromium.org>
References: <20250825145750.58820-1-akuchynski@chromium.org>
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
2.51.0.rc2.233.g662b1ed5c5-goog

