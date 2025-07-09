Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E066BE4A
	for <chrome-platform@lists.linux.dev>; Wed,  9 Jul 2025 13:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752067359; cv=none; b=B0DXl6pZDywlIDnqJeR7qBLeZ9Fen1hRLWV3G/SD6z2KodDW+w32YezcA6rNUpYRLhSWXiTMQcVUoPWBn/apYhJYnT1PDqwKMQQ8l4jFKuQ/qAP5voH+AgxySAixyU7T53CJp1ruUqJvIuXVKzBOrDvCTICaCH0qVT0euEoQyqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752067359; c=relaxed/simple;
	bh=P4NNh24Uubem3+5FD8u976ML2Q+JAb1DIESveJSn2Sg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ELWWp0yohAn+dX92aI6Z3ZqewB0jbj5A0WQo85m9W/pcLQt07JHLOaCTsGOIEQ8dhSchvpkXZd3AItyHjAr//gA5dqp+2LIxIb3sW/N0En3+CNrcFZhEImuLX6lA3XYFd03tSw5wIkCeBSFxsc/zEoatft50Q1m6OHIAFvI0Goo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--raduvele.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nxfnqtOv; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--raduvele.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nxfnqtOv"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-6105794dbf6so1335337a12.0
        for <chrome-platform@lists.linux.dev>; Wed, 09 Jul 2025 06:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752067356; x=1752672156; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JVdeqDRdF6ZLtzy+wRZhrpbW4oRIUx8OwK+HIqHAMuc=;
        b=nxfnqtOvfc3s5DONpRenv2o3dOsTL6itdGsN0LOfsAGjG5efDi8EaOhTtsH1eTh73u
         WXFlduv9sM6RZwevgoFtVtvakQOxTB8+8nLhJCm5lQaAY3B94YNRCpOyRAx3SU1+bIb9
         8kqcjn6EmB5Ze9/s2TTN1DfiLJMTUZUBvyRMbUKa7GS5EEhHb3NJ1ozsdPGcnCWKfb64
         c43gUblr76ndF19VhB9CyRmNeSKMdzrkyijhky3GGTaZXvSpq0pMILjmqMnqQCC76R8J
         6T/TbsBsxfCaGiPJ69FSVwX0c5BjvrD0b7hMa6dCjN+5dNnvXPfl8qRS/c8EHVlmaQPg
         jyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752067356; x=1752672156;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JVdeqDRdF6ZLtzy+wRZhrpbW4oRIUx8OwK+HIqHAMuc=;
        b=jHvJY5mnEFEo9L3uwERSR3LlPNlvrhTxMh0WPFq0OcRGZaCWbl+Fd3Gkhiqr+MmKZk
         OT9/8YTn0OVxhHPME/HfPqgeZAoM+mu4V29zi0BNUIjDoIpc+EyZiLoFxcgnZha1EqYL
         ny20bA6peCJRumWRnuJcGx7aZP5fbTTLLp7pgmvLm9XtCCBFKrlvLU9HwLM3lxEqaDbR
         sk8cUL0XkRyCkO4S25zRlukAV2vGJpxDVYEZUOwypevqwHUAHjESDWk5wdOInNlsgZat
         Lh7oxIOHAfbLohYXNAlNBbK7/uxcCXbpmFkIPFCd/l/Z1OlnyVIxFGyirTbAOqgpqKAL
         k99Q==
X-Gm-Message-State: AOJu0YzqZvG67iSyDUe0JmGVvRqQHHbulnfYKBQID/vvPFy2fFQTJp//
	2Za/BP8RVZhxsZR215PQ5DbQ8Lrw5zvfBH6rcWzT+HsDI2iuxvOhVE+9wgRQTy4785BKS1KPwfk
	1OoL/NQtccISasA==
X-Google-Smtp-Source: AGHT+IES0Q1sgjW+61NY3L9U4CpfzOSPoPQsy+CX2JuVDMyWKfQl2YC02Tx3GzAP3ymg1Lfc5BIF/XUz2ysVGw==
X-Received: from edc20.prod.google.com ([2002:a05:6402:4614:b0:608:f54a:3f91])
 (user=raduvele job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:26c6:b0:606:a77b:cca3 with SMTP id 4fb4d7f45d1cf-611a6599762mr2394898a12.7.1752067356562;
 Wed, 09 Jul 2025 06:22:36 -0700 (PDT)
Date: Wed,  9 Jul 2025 13:22:32 +0000
In-Reply-To: <20250709132232.2475172-1-raduvele@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250709132232.2475172-1-raduvele@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250709132232.2475172-2-raduvele@google.com>
Subject: [PATCH v1 2/2] platform/chrome: cros_ec_typec: Add lock per-port
From: Radu Vele <raduvele@google.com>
To: Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Andrei Kuchynski <akuchynski@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add a lock associated to each port to protect port data against
concurrent access. Concurrency may result from sysfs commands
and ec events.

Signed-off-by: Radu Vele <raduvele@google.com>
---
 drivers/platform/chrome/cros_ec_typec.c | 38 +++++++++++++++++++------
 drivers/platform/chrome/cros_ec_typec.h |  3 ++
 2 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 289429ef959f..bbb9e02624b8 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -8,6 +8,7 @@
 
 #include <linux/acpi.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_usbpd_notify.h>
@@ -54,8 +55,11 @@ static int cros_typec_enter_usb_mode(struct typec_port *tc_port, enum usb_mode m
 		.mode_to_enter = CROS_EC_ALTMODE_USB4
 	};
 
-	return cros_ec_cmd(port->typec_data->ec, 0, EC_CMD_TYPEC_CONTROL,
+	mutex_lock(&port->lock);
+	int ret = cros_ec_cmd(port->typec_data->ec, 0, EC_CMD_TYPEC_CONTROL,
 			  &req, sizeof(req), NULL, 0);
+	mutex_unlock(&port->lock);
+	return ret;
 }
 
 static int cros_typec_perform_role_swap(struct typec_port *tc_port, int target_role, u8 swap_type)
@@ -70,6 +74,8 @@ static int cros_typec_perform_role_swap(struct typec_port *tc_port, int target_r
 	if (!data->pd_ctrl_ver)
 		return -EOPNOTSUPP;
 
+	mutex_lock(&port->lock);
+
 	/* First query the state */
 	req.port = port->port_num;
 	req.role = USB_PD_CTRL_ROLE_NO_CHANGE;
@@ -79,7 +85,7 @@ static int cros_typec_perform_role_swap(struct typec_port *tc_port, int target_r
 	ret = cros_ec_cmd(data->ec, data->pd_ctrl_ver, EC_CMD_USB_PD_CONTROL,
 				&req, sizeof(req), &resp, sizeof(resp));
 	if (ret < 0)
-		return ret;
+		goto unlock;
 
 	switch (swap_type) {
 	case USB_PD_CTRL_SWAP_DATA:
@@ -92,18 +98,21 @@ static int cros_typec_perform_role_swap(struct typec_port *tc_port, int target_r
 		break;
 	default:
 		dev_warn(data->dev, "Unsupported role swap type %d", swap_type);
-		return -EOPNOTSUPP;
+		ret = -EOPNOTSUPP;
+		goto unlock;
 	}
 
-	if (role == target_role)
-		return 0;
+	if (role == target_role) {
+		ret = 0;
+		goto unlock;
+	}
 
 	req.swap = swap_type;
 	ret = cros_ec_cmd(data->ec, data->pd_ctrl_ver, EC_CMD_USB_PD_CONTROL,
 				&req, sizeof(req), &resp, sizeof(resp));
 
 	if (ret < 0)
-		return ret;
+		goto unlock;
 
 	switch (swap_type) {
 	case USB_PD_CTRL_SWAP_DATA:
@@ -117,8 +126,11 @@ static int cros_typec_perform_role_swap(struct typec_port *tc_port, int target_r
 									TYPEC_SINK);
 		break;
 	}
+	ret = 0;
 
-	return 0;
+unlock:
+	mutex_unlock(&port->lock);
+	return ret;
 }
 
 static int cros_typec_dr_swap(struct typec_port *port, enum typec_data_role role)
@@ -370,6 +382,7 @@ static void cros_unregister_ports(struct cros_typec_data *typec)
 		if (!typec->ports[i])
 			continue;
 
+		mutex_lock(&typec->ports[i]->lock);
 		cros_typec_remove_partner(typec, i);
 		cros_typec_remove_cable(typec, i);
 
@@ -378,6 +391,8 @@ static void cros_unregister_ports(struct cros_typec_data *typec)
 		typec_mux_put(typec->ports[i]->mux);
 		cros_typec_unregister_port_altmodes(typec->ports[i]);
 		typec_unregister_port(typec->ports[i]->port);
+		mutex_unlock(&typec->ports[i]->lock);
+		mutex_destroy(&typec->ports[i]->lock);
 	}
 }
 
@@ -472,6 +487,7 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 			goto unregister_ports;
 		}
 
+		mutex_init(&cros_port->lock);
 		cros_port->port_num = port_num;
 		cros_port->typec_data = typec;
 		typec->ports[port_num] = cros_port;
@@ -1232,6 +1248,7 @@ static int cros_typec_port_update(struct cros_typec_data *typec, int port_num)
 		return -EINVAL;
 	}
 
+	mutex_lock(&typec->ports[port_num]->lock);
 	req.port = port_num;
 	req.role = USB_PD_CTRL_ROLE_NO_CHANGE;
 	req.mux = USB_PD_CTRL_MUX_NO_CHANGE;
@@ -1241,7 +1258,7 @@ static int cros_typec_port_update(struct cros_typec_data *typec, int port_num)
 			  EC_CMD_USB_PD_CONTROL, &req, sizeof(req),
 			  &resp, sizeof(resp));
 	if (ret < 0)
-		return ret;
+		goto unlock;
 
 	/* Update the switches if they exist, according to requested state */
 	ret = cros_typec_configure_mux(typec, port_num, &resp);
@@ -1263,7 +1280,10 @@ static int cros_typec_port_update(struct cros_typec_data *typec, int port_num)
 	if (typec->typec_cmd_supported)
 		cros_typec_handle_status(typec, port_num);
 
-	return 0;
+	ret = 0;
+unlock:
+	mutex_unlock(&typec->ports[port_num]->lock);
+	return ret;
 }
 
 static int cros_typec_get_cmd_version(struct cros_typec_data *typec)
diff --git a/drivers/platform/chrome/cros_ec_typec.h b/drivers/platform/chrome/cros_ec_typec.h
index f9c31f04c102..d0a8a12ec91a 100644
--- a/drivers/platform/chrome/cros_ec_typec.h
+++ b/drivers/platform/chrome/cros_ec_typec.h
@@ -82,6 +82,9 @@ struct cros_typec_port {
 	struct usb_power_delivery_capabilities *partner_sink_caps;
 
 	struct cros_typec_data *typec_data;
+
+	/* Mutex to protect port data against concurrent access */
+	struct mutex lock;
 };
 
 #endif /*  __CROS_EC_TYPEC__ */
-- 
2.50.0.727.gbf7dc18ff4-goog

