Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F90D3009ED
	for <chrome-platform@lists.linux.dev>; Mon, 24 Nov 2025 12:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763988410; cv=none; b=H0jrG7Bbja3PTIpx718zo5T7M91YsLPeOI+oaYwEosOMXLM2ZtzpLzxd23AdkovXXLA3tdARn1hQafVe8k09QeZBeKaPojbciMCv1RKaeOIl8czwpEmO/NZiwJGotYmwZSxzPX8tQt/yfRzFdU62iTMiFlQAfGR0mabHBud9rJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763988410; c=relaxed/simple;
	bh=fxEbaz6w0uMCGJivWLfG+scyIrw8SEt71KrJ1bqrzW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qw5YGZE1Tw6ndjOmBfdGrf5ZRNbcoYaQV5HWoCNfAqKNGYnoKS25cB/cRtHrVY0KAW+eJu3uAsqtIAia4PNyKC/iZ2rHtM8uzRVjr+pQJdrgXm3VEi64f9w6Bj8kFU0D/XANNIYeFI6VGH65aiXnE6ffJDp4GawEFBVbM/cplNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QUDkNafd; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QUDkNafd"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b736cd741c1so734088466b.0
        for <chrome-platform@lists.linux.dev>; Mon, 24 Nov 2025 04:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763988406; x=1764593206; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnwvCDgrr4841IDmxQlulqzHQNtUVlEwFIhs0bIly3A=;
        b=QUDkNafdQkrczcn+TnfK293NI4UXLVSRWJbyRVrLNJZYljShDD+YKDxvoJEpf1BKad
         fbc6cv6+uiU+PcfJrJpz65JWv9gdrVb1uRxeYHpz6tGOweofkVCLpSuBH/YzzNvhYxIK
         b7SxrNUYjnm2mAwOTNRCi87RdROpkKbUx2bKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763988406; x=1764593206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MnwvCDgrr4841IDmxQlulqzHQNtUVlEwFIhs0bIly3A=;
        b=gMwkJ1UBcJmjd2N13qVp9xts7eYg10qS/FLQqMoYWXKASV4ijxyaq8D3WFZwICd0XY
         hwirnSOUWahSOEi8UN9Xak9zuArjZLsB3XQc7i9oJbvXfq8LkV2YpakKQbJMmHf9iFqn
         Dfg2J4M6pth4fWRnQyY4CBaaSJWDm2jqaHJ+VtxSphB9XMxu1+DT13Sm7P5f6uE/QjO6
         AlxTBJiAyjiNi3uddXw0X5WmRPnmnyGE5owSXkn2lzF/njPFhCVKmM0rUW9Ax847uDG/
         jJSxWv+quPSUE17QyBoqKLhORHhgcEguGnUyLOG3qggEzx8ak0fNz1r9qFarWgIK9R8i
         QinQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFoba+N05qpDj1EWyAnVMpUj5I0VNt1Y7ADa9wRlXiVS811AZc3NoxGI0TbKyx6pEJQhQpgnILjev3p4tfthk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3eHghtdE+NotCVSxYqGMpBRoezD2hzdV+DfoFP6AD7fooDkUu
	URIMzvCHQ8x/GMswlHebhBifVNlLAZML2ZsWrXAXSPTJ3QWFfuRyoEHdofXq0TyDdA==
X-Gm-Gg: ASbGncvE10jzr/aB8TzBKB2B1zPWqgbGaZKeYEqgZmT+f+GealvtRVqdaU+2yu99PWk
	SMF5hBAc3xDKiBHoV+R+2VqV93P1sK2xvR+egpx13Xq/azpLzWWSf6R2cN0MAjIc8HeUYQnZ4SH
	0VJGvUCWCSECd8WlTADfW4HLBtf8Bi3pDxMiPgq8TxV4B76VKev5qtu0grRZ8DjDH6Ci3scURDr
	FLScPSrUTQ04M/acx5DfVYieKcjuMd3uF7j+tK2axhdGYKqNpHzgpuf+u8GXM8IAlqe4HVjlovw
	x1k2bhd/NAI8Cu7chwZprKy2TSyC4hdFK/56EmivogWcXjmieyLLgtBKpCpGRDny5g77HBrcJSa
	X2DcIPAVPb9sQsuz4p9/NMqa24+AMc9EeyOcbpTK4KWLuIssEzyrpQXacsiNja0XTiXJOG4NoqA
	oiN3WPCBOGgwtMiE6y7VfOePIuWywm8wZ05U/dJlf9x7Ra1CmXUj/laIOJkGHjbnzIUkAq24bAT
	hO/MYHp3R4=
X-Google-Smtp-Source: AGHT+IEBkgh8AVlO5hu3L84i66IimEV3HBFW93RnnCjQGKAdtwiKbIMtcj0XYTbEpogMfTr251MMCA==
X-Received: by 2002:a17:907:3cc5:b0:b71:51b:bd4c with SMTP id a640c23a62f3a-b767170c7dbmr1109856466b.50.1763988406487;
        Mon, 24 Nov 2025 04:46:46 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536460ea9sm13342599a12.35.2025.11.24.04.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 04:46:45 -0800 (PST)
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
Subject: [PATCH v5 1/4] usb: typec: Add mode_control field to port property
Date: Mon, 24 Nov 2025 12:46:36 +0000
Message-ID: <20251124124639.1101335-2-akuchynski@chromium.org>
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

This new field in the port properties dictates whether the Platform Policy
Manager (PPM) allows the OS Policy Manager (OPM) to change the currently
active, negotiated alternate mode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/class.c | 9 ++++++---
 drivers/usb/typec/class.h | 1 +
 include/linux/usb/typec.h | 2 ++
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 9b2647cb199b..a5327e444265 100644
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
@@ -2694,6 +2696,7 @@ struct typec_port *typec_register_port(struct device *parent,
 	}
 
 	port->pd = cap->pd;
+	port->mode_control = !cap->no_mode_control;
 
 	ret = device_add(&port->dev);
 	if (ret) {
diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
index db2fe96c48ff..2e89a83c2eb7 100644
--- a/drivers/usb/typec/class.h
+++ b/drivers/usb/typec/class.h
@@ -62,6 +62,7 @@ struct typec_port {
 	struct mutex			partner_link_lock;
 
 	enum typec_orientation		orientation;
+	bool				mode_control;
 	struct typec_switch		*sw;
 	struct typec_mux		*mux;
 	struct typec_retimer		*retimer;
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 309251572e2e..59d5fd7e4ff4 100644
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
2.52.0.rc2.455.g230fcf2819-goog

