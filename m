Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB632FF65D
	for <chrome-platform@lists.linux.dev>; Mon, 25 Aug 2025 14:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756133886; cv=none; b=WVsTg5AOWatA0y6suLu8JnKATIdN6zI6cU0OgEg+KtXNPQhCFkvHQ1+blQK5sBjQWOcSnVWinBSfC+0mKNKh5D/B/+wcElYsBwDRgHEpqBH6+G+SQLGCH4AivgyhY00Xgg4AWLG3cHZMs5SXSx4EjaXEZshtckntLI6Bl+f2Ax4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756133886; c=relaxed/simple;
	bh=ZCOA1dM21DunNLDV0WZf6KhjFBCppPrsp5+Kx8CnzlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dwwkvhyPTLSmYgO6s8u8VcM3hDMOqqeHf4LMxAbRIcnBKCJKhm/1pQ62Rid5MNaTIfrlMurAf5yoJf64Jo+gUo3i9jod8Jce6St1Eg7/8ruBxCcVG+Vg6npnrgPboqG0cnpYqRXIcBDcYOKzS+Aueql0T5NVEtZzdHs5rCp6MbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a4jB/xG/; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a4jB/xG/"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb7a0442bso738977466b.2
        for <chrome-platform@lists.linux.dev>; Mon, 25 Aug 2025 07:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756133883; x=1756738683; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTzQ3AFf99voNBq9nE295ufzA7UoytsbpCDnPP4k4Ho=;
        b=a4jB/xG/KUXlnytDUbPV7fCjexfZs6+gf+GEr3zrUYZGh+ALLQl2MRUNOVKjbe5OOR
         p4swKx/B0LaF0Ie8kkI4S2duKRxsgxLe/JGfh8duRoW1DzSo/reS7NXVRQ2yyPcrjsNx
         eZ/cmoafW6tMfgD96oj2GdXnEENDg0QD2roOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756133883; x=1756738683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTzQ3AFf99voNBq9nE295ufzA7UoytsbpCDnPP4k4Ho=;
        b=aLl5tQeOY+6hQ0eiRsAf1OJmxZkuDRtHRzSG/SCLIMAHsoBX1mvXvXNQRe7C8EoAsT
         g5qEesNi78lyISFxNeI9b4P966xfV+gfsPrVYYKCaeWcUrfkdEoH8y6eesNaCtr0aKJ7
         WZ3W2gN9YsEPs7xMju+tym3j3bNECBAsBiNAu0+sHbS8UI1W/8pIy+YYKHGcpmV9VWi+
         mPsOsfV4hPIdJjxYjLXW0jwuNCTry5X58rTBDTHHG96JB+KEgaHMRx1HHCE6R7Nw1owX
         ++UnvhOffg7UvXZG9/WfPBX/oijFTPSJX+jWgXw1rZx+R+aPlyxlGtD722Ub+E8+ovr9
         aPQA==
X-Forwarded-Encrypted: i=1; AJvYcCXIpDe2No/XBKXOscf10MxdlRNLGnWxWFfI8XSRV2JHiUJHz4n3ZBzl+yACg25Zrcp7XHRf7ZRd2rkAouHs4qA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHEsehjt9pzt2x3lpP5guxCvpVfKfo+62dIW52PVsKWuPdnx1V
	Z1wWoIUwZ1aKClRjnQMZzKs51aUhi3WSlmfqVdVN+fErSSqu2ctVxbpwB+Nau1meyw==
X-Gm-Gg: ASbGncuOXtE8nQqlx95QlK07p6w1jwDTEJ4oYdcQla2LuUE/EjhDA43szFcIBKUux0r
	ffjP1T0ztgmPKx3GZttTcZuchrOIQZEa3jgAGYwJWcsMgFHWAXeQwe32SVbFP6/3HGfrkY/OqQ9
	XTcHu+xc4xdOsHPyHYGoWpKIBKWf91p8nv5ieRNju825S+SjQIwkwwHkzCheFmIQrcNzkQjKNQ6
	FTNOtpSZJA99Lcs4whKfn5RvNPAslZNL6SwaGPOeNxAfcWPyJHCDveFbDXMajzbnCE9RJ1rqBv7
	4q2WrcYVj16G15tP5CS1a+DAbHyskxxGfAjie/jaJ/s2yHjpPQs9lkxhg53WFaHDmuHhoS5+zxA
	JDquDDIqjEYRFBU4CtTc3aCbGtKvORfHWcUTEym87eZxPFzj7B2K9DUAE7ZV+gi6PIv0yfbmy05
	bcDwmsy0pwnwy8
X-Google-Smtp-Source: AGHT+IFBnjzL8FuKILHR8m1mMoFjA8Jca/gOoCCUsOrFaj7AmltK/a12XxOh8THN9ShkNgEj13D5rg==
X-Received: by 2002:a17:906:6a04:b0:ae6:f564:18b5 with SMTP id a640c23a62f3a-afe29047b49mr1141748466b.19.1756133882714;
        Mon, 25 Aug 2025 07:58:02 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (168.23.91.34.bc.googleusercontent.com. [34.91.23.168])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe8d03f981sm117294166b.60.2025.08.25.07.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:58:02 -0700 (PDT)
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
Subject: [PATCH v2 1/5] usb: typec: Add alt_mode_override field to port property
Date: Mon, 25 Aug 2025 14:57:46 +0000
Message-ID: <20250825145750.58820-2-akuchynski@chromium.org>
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

This new field in the port properties dictates whether the Platform Policy
Manager (PPM) allows the OS Policy Manager (OPM) to change the currently
active, negotiated alternate mode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/class.c | 9 ++++++---
 drivers/usb/typec/class.h | 2 ++
 include/linux/usb/typec.h | 1 +
 3 files changed, 9 insertions(+), 3 deletions(-)

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
index 252af3f77039..cbc94282e45e 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -304,6 +304,7 @@ struct typec_capability {
 	enum typec_accessory	accessory[TYPEC_MAX_ACCESSORY];
 	unsigned int		orientation_aware:1;
 	u8			usb_capability;
+	bool			no_mode_control;
 
 	struct fwnode_handle	*fwnode;
 	void			*driver_data;
-- 
2.51.0.rc2.233.g662b1ed5c5-goog

