Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325A138BF6A
	for <chrome-platform@lists.linux.dev>; Tue, 13 Jan 2026 13:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768309549; cv=none; b=GFPBFxPaGxEv+KSmL7wDZsSDV1TIRMaaKs1f2aZunJrYgr++TNQnmss0KZjx1jR92BFSPM6sZsgZqu34IMc7ekjBFFqeNuWK6d/dOAU+YwZlFgu82WLlaZRXud8ROo++jStMxO2CxKkC9pkG6171KTruzHv5j/T27sqChqyouwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768309549; c=relaxed/simple;
	bh=V1jmUzlQs0mqeDEI06ZenpYXU3urQAv3hO+yVPpB20c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZjunvKx2vc9prhCpMomNDX2mx0mX3NshiUaQ3bJHSTJfuaGd4sjU3ZSqvrNF7OR7clA9CmXOHO91cZg98/wiwZByRPMP0yCMZrEQLlNcv5HCDWRaTGLO48jNGcSeg7/WYCTLNSce51g04kB6iDc/sYjmKnp5AocoYoBAtxfl4sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=d+28VlRy; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d+28VlRy"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b86f3e88d4dso389268766b.0
        for <chrome-platform@lists.linux.dev>; Tue, 13 Jan 2026 05:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768309544; x=1768914344; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLqa5LSPMe82XqVLviPNjog13TrBNYmx2vAnL8Z9NGE=;
        b=d+28VlRyemd7DaXrPbNhM+NkW6aTVsScS86E4khiF5mnou9l/Ss4p+PQNdCSAdoqXM
         4JT2OYcoUdy4Qr4cmyERW+/rD0giF6JjQEXFDnOvwwe9c1q9cf2dHws2MhbDm3FukGj6
         wCWEb2gt38hCxCTgzRbY17KwfeajtZjml21bo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768309544; x=1768914344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cLqa5LSPMe82XqVLviPNjog13TrBNYmx2vAnL8Z9NGE=;
        b=KEF9J5E4VDfnqu5o/g2Gi+ByVk8I2fyIojzZ5+GIUAlOx7NDYrAb1Ec4GOgF5HArup
         UgO1cnLjgFa/S8U4qlUB2B3MUSYum0Y1acCs5+JgsQKdgvhunPGn81/URLhw1E6+aNit
         yS2B/NhQhK3v//HDCk5tX3X0xRHRJtezqZB+O5DfEWxlFO8ECM1U2cAsmO+3i3Qw0+65
         B+YqtIF0ftEPBaLSw46NixlYl4d2sNft09c1vMeyoUZX8Cp10LIxifLUDPa7EBt0G7O2
         zNbKn2z7SpGBIKps1CwJ/grLuJXZPORk9tTb+nSvrmcpFlk7w3iVY+VcoMoJDdBA0OkP
         3fTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsExN6OdPJhbWGerv8AvTU1NNWaF8ym65AYgQZK0u1Q+2e2Esr16NaNAW00IhjqnVUdmexSqXYDPQAU8TNDds=@lists.linux.dev
X-Gm-Message-State: AOJu0YxLU8r854SYphgK29ML89ADgpB2jInhCL3L2XHbyb+jzmrjG/Sy
	nSVdcc6M+anMt/wbJJ1bYGrDgF8OpzAyWaVde9SUWgIjmDmxgXkTKVwEPrtb+iQytA==
X-Gm-Gg: AY/fxX5Teypl1bCOwkhsIOqW6Ck8kgYazqgmlGSxXb5BvchrUS/98hayMOEJ8pkpiqM
	5JYsZc+XS3tGPQffasJ24/IPYh+bp2rTeSx/ZOmaRQddNtnwaZcn7Cfv0mSMwysIlKlQmCbAbXX
	mFT/WZsfGLmaW5RXo7K8ff+eta8L0tYxmoxZDc9/jnYGSQ3mjhKr2SJ9XLEYoDcb5Gm5rLLGFUY
	e6/W0Db9M124epwS/yWX053oXElixIGWgjHd+xRxMovg6nHasnaFYeNdfFsQ9Z4cVNdwNfX9pgk
	i3GEhK21LrvWxPMfFsAibI8vs5T3CxrkewCR4n0hCiMff5vBUafAyMqlUJV4gVIi5ss289X61RY
	1HFar74DexHk5jW2avLNtLEc3BcV4a2REgLnrpv0tfhKpCrxby3b3WQ3peSDE2uXYsRdYv+yPZN
	iVUTronNMF25s9GlEhWxRW82q0BEzoP8F81rRttwkM+WVAl5hW66tsKWRPc4NWB0W18F3INCagc
	Zr+kTFzB0VgYXHWx1I=
X-Google-Smtp-Source: AGHT+IH9fdlAcsYdBhHsm3MzZdhegh+CqE1dU7+aUp1J6imJDfwNUKifMVZoBAGXlrQ1du/vBUGWRQ==
X-Received: by 2002:a17:907:9691:b0:b87:51d6:22fd with SMTP id a640c23a62f3a-b8751d62cacmr45371966b.4.1768309544446;
        Tue, 13 Jan 2026 05:05:44 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b871b5e60dasm586217266b.63.2026.01.13.05.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 05:05:43 -0800 (PST)
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
Subject: [PATCH v4 1/8] usb: typec: Add mode_control field to port property
Date: Tue, 13 Jan 2026 13:05:29 +0000
Message-ID: <20260113130536.3068311-2-akuchynski@chromium.org>
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

This new field in the port properties dictates whether the Platform Policy
Manager (PPM) allows the OS Policy Manager (OPM) to change the currently
active, negotiated alternate mode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Benson Leung <bleung@chromium.org>
---
 drivers/usb/typec/class.c | 9 ++++++---
 drivers/usb/typec/class.h | 1 +
 include/linux/usb/typec.h | 2 ++
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index c4ff4310ff58a..0f12d6120511b 100644
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
@@ -2708,6 +2710,7 @@ struct typec_port *typec_register_port(struct device *parent,
 	}
 
 	port->pd = cap->pd;
+	port->mode_control = !cap->no_mode_control;
 
 	ret = device_add(&port->dev);
 	if (ret) {
diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
index db2fe96c48ff0..2e89a83c2eb70 100644
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
index c6fd46902fce7..dbb259d885266 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -290,6 +290,7 @@ enum usb_pd_svdm_ver {
  * @prefer_role: Initial role preference (DRP ports).
  * @accessory: Supported Accessory Modes
  * @usb_capability: Supported USB Modes
+ * @no_mode_control: Ability to manage Alternate Modes
  * @fwnode: Optional fwnode of the port
  * @driver_data: Private pointer for driver specific info
  * @pd: Optional USB Power Delivery Support
@@ -307,6 +308,7 @@ struct typec_capability {
 	enum typec_accessory	accessory[TYPEC_MAX_ACCESSORY];
 	unsigned int		orientation_aware:1;
 	u8			usb_capability;
+	bool			no_mode_control;
 
 	struct fwnode_handle	*fwnode;
 	void			*driver_data;
-- 
2.52.0.457.g6b5491de43-goog

