Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF192236FC
	for <chrome-platform@lists.linux.dev>; Mon, 10 Feb 2025 13:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739192687; cv=none; b=Tfl8q/9Vz8yOWJoc132XyUY9SdGjgTYEpgclPJFZU/Es+YVADbmEe9Cc6pErXEmVOMdGM+suKV41bbbmUxMpQlyesinXvJYJcVXuH1QKumQAU7joVJYS5Ia7XmPTd/7kkWQSPT88re305er8BY3E2E1lRUQfGLeA7SKiwq04T0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739192687; c=relaxed/simple;
	bh=yKTOzHvjtUJZ30ThdYOqib27UhbmSihpmMZ6uLIRUrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mzdh+DiFx9uUnT/vVHVqBPg43mF4x9wFKcy/S7/kDEk8n2tWcCGIX0/B2ErR6Le/E+8EP4nhBQoYwoO9T/3TUESN2N3w/ZK/hWcZ92sSu66WD+jMRjd9pmiwIIHEdQk1ktZ9R9VinbAfMPOyepQCojMUZ2R3mFitpr7CdG1I550=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jcbGB9Yl; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jcbGB9Yl"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab7c14b880dso183532766b.1
        for <chrome-platform@lists.linux.dev>; Mon, 10 Feb 2025 05:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739192683; x=1739797483; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HaW26J7mtZirTrALfRYZJBUEjaYSL5x2uLwPDfHyOao=;
        b=jcbGB9YloY2lGEe2SNf7lKBOyAEkIrQITZM9BKptJuepJ1fSwz0dKaVEqhHQHSOJSF
         tZBU4ZQ4KOUFdNHxao43hvPGkt+ouwEBlfUFuze/pOj16mSj9Ttfk0DsJq0jyGInKHSn
         4B/4kGh+0qbzFnUUgaiMvrYFnj3Cy27/1XujE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739192683; x=1739797483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HaW26J7mtZirTrALfRYZJBUEjaYSL5x2uLwPDfHyOao=;
        b=RieHtTQ277wsFmWAw3sGxujHbDu+3PdGEDWWzTGKo2UbdmCZVOI9iySNMOFkMnh98c
         7UKz28HnSr148NvOXrEhC0tuKSlhQYZ+/A/FREsc040qH0nN7dNRPu/smaiShvzhub+j
         OWZ9C9YJWXTIBH4xbzGNwx2VdlQz5mMpNGr7TFKJE5BiEpGopBS6BVW8mO1Q71JZ0vx5
         orjEuvp+xRr1BJn/83J/5hGQPy8t2FfFdrRKqL2wYvVGaX8CWnDWWARVblGhojdQeU23
         3SmfIA07VwZdV4yDXCGmfXsDNrDqe+wO+DkmyJUxS6TpbySnVbetgxacSDWJVH7Pid3x
         SwuA==
X-Forwarded-Encrypted: i=1; AJvYcCUNbbCH6g9PiRi3Cz+O/Ba36lbR5BuVG3LOUGjUVucg1FLFY/Igz0eW0oDLGIur2WbWqjb8C4mlBAavHIg+624=@lists.linux.dev
X-Gm-Message-State: AOJu0YxUq/pvtrbuxJ64H6dHjpQLP5u+MS4CNT0/I2YgGk7gwASTCp/J
	kTJRZwr4H8X0ecb8VB43wZEg8uRim2NLriu/CeLEJxERlf1M2/Ud+vGxMHtDxA==
X-Gm-Gg: ASbGncteq2S3+/UyU1pBEWkoSXuFL5Jqj4ZPWpPLXTVPMeFnXgXMqqoWmHlZ4B/mVAR
	dHG3Z4KTUpNnIX5pjvNK3P5ljMeiiAvfKXCa4XVTVBEJRFrFOC8yOBCKa+FI2uStDz+SjWcIfhn
	/mr9q3K8a9HMb0WaKACcWysPuWLP5Z6e9VhpIM9hnCkb80FFEMVYQq5aBThFG2lCqC0SfHERpeq
	O9ZcArnalxpvIndUmf+R7yG+TXOjosDFjwbpaCB/tzIP7SYgBd4tEOLqgDjAiANdciXO29y1G/W
	35Sy9+RSF25YtkFTmB1+XJsivrrhThPGuv4EANByKFfyVDLhwFuidvxokWCGP3jCaabep9AMz3w
	PHeASyg==
X-Google-Smtp-Source: AGHT+IHuDeWepv9LWawTITsPd16QmZhryU1yphj02BJkEjCvATWc0zUlF0EQCYEgyNLLZg8vP5nGcA==
X-Received: by 2002:a17:906:ef0d:b0:ab7:a4b1:99f with SMTP id a640c23a62f3a-ab7a4b10a32mr741267866b.30.1739192683289;
        Mon, 10 Feb 2025 05:04:43 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7732e71f1sm870928466b.92.2025.02.10.05.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 05:04:42 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	chrome-platform@lists.linux.dev,
	Jameson Thies <jthies@google.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
Cc: linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH] platform/chrome: cros_ec_typec: Add support for setting USB mode via sysfs
Date: Mon, 10 Feb 2025 13:04:19 +0000
Message-ID: <20250210130419.4110130-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch implements USB mode setting via a sysfs interface in
cros_ec_typec driver. User-space applications can now change the current
USB mode by writing to "usb_mode" sysfs entry, replacing the previous
ioctl-based method.
The embedded controller (EC) currently supports only entering USB4 mode
and exiting all modes (including altmodes). Both of these operations
trigger Data Reset Message, even if no USB Mode is active.
Additionally, the patch exposes the USB modes supported by the port via
"usb_capability" sysfs attribute.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 28 +++++++++++++++++++++++++
 drivers/platform/chrome/cros_ec_typec.h |  1 +
 2 files changed, 29 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 6ee182101bc9..d2228720991f 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -42,6 +42,24 @@ static void cros_typec_role_switch_quirk(struct fwnode_handle *fwnode)
 #endif
 }
 
+static int cros_typec_enter_usb_mode(struct typec_port *tc_port, enum usb_mode mode)
+{
+	struct cros_typec_port *port = typec_get_drvdata(tc_port);
+	struct ec_params_typec_control req = {
+		.port = port->port_num,
+		.command = (mode == USB_MODE_USB4) ?
+			TYPEC_CONTROL_COMMAND_ENTER_MODE : TYPEC_CONTROL_COMMAND_EXIT_MODES,
+		.mode_to_enter = CROS_EC_ALTMODE_USB4
+	};
+
+	return cros_ec_cmd(port->typec_data->ec, 0, EC_CMD_TYPEC_CONTROL,
+			  &req, sizeof(req), NULL, 0);
+}
+
+static const struct typec_operations cros_typec_usb_mode_ops = {
+	.enter_usb_mode = cros_typec_enter_usb_mode
+};
+
 static int cros_typec_parse_port_props(struct typec_capability *cap,
 				       struct fwnode_handle *fwnode,
 				       struct device *dev)
@@ -84,6 +102,13 @@ static int cros_typec_parse_port_props(struct typec_capability *cap,
 		cap->prefer_role = ret;
 	}
 
+	if (fwnode_property_present(fwnode, "usb2-port"))
+		cap->usb_capability |= USB_CAPABILITY_USB2;
+	if (fwnode_property_present(fwnode, "usb3-port"))
+		cap->usb_capability |= USB_CAPABILITY_USB3;
+	if (fwnode_property_present(fwnode, "usb4-port"))
+		cap->usb_capability |= USB_CAPABILITY_USB4;
+
 	cros_typec_role_switch_quirk(fwnode);
 
 	cap->fwnode = fwnode;
@@ -379,6 +404,9 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 		if (ret < 0)
 			goto unregister_ports;
 
+		cap->driver_data = cros_port;
+		cap->ops = &cros_typec_usb_mode_ops;
+
 		cros_port->port = typec_register_port(dev, cap);
 		if (IS_ERR(cros_port->port)) {
 			ret = PTR_ERR(cros_port->port);
diff --git a/drivers/platform/chrome/cros_ec_typec.h b/drivers/platform/chrome/cros_ec_typec.h
index 9fd5342bb0ad..f9c31f04c102 100644
--- a/drivers/platform/chrome/cros_ec_typec.h
+++ b/drivers/platform/chrome/cros_ec_typec.h
@@ -18,6 +18,7 @@
 enum {
 	CROS_EC_ALTMODE_DP = 0,
 	CROS_EC_ALTMODE_TBT,
+	CROS_EC_ALTMODE_USB4,
 	CROS_EC_ALTMODE_MAX,
 };
 
-- 
2.48.1.502.g6dc24dfdaf-goog

