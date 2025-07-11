Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9F0C2E0
	for <chrome-platform@lists.linux.dev>; Fri, 11 Jul 2025 00:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752194110; cv=none; b=ikrT3Xa2mA5a+epHPSV3mEeK0IB6VywFuXUhOQGyxwROEnCijN7t+FUtdu9xhTHRsjU7LnWlTHX/exhUdbd6zLdKEVVXgGKvlva+beF6mQYASXNbuMkLLgMMqossvAIlg3F7hnAlf0STwToEBt7iLkTxopj6iP6Gd4Ay2njLrXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752194110; c=relaxed/simple;
	bh=e6+DZi1JgBpr17kx0CjWTVQ9OCnXGT8vSxIPwoHZdf8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Rd4s70flybK/WzUndYuHQvjbOYtqHWpPxMxmlLQN75lkTL+jg4czx6e+ND0cXnt0MUo9dwW+quMg5icU7GpBixNHm4Rp4+A1XZHUiyTvUod9JIYI7GXvBSFEg8CeZcZVO0iV+hriTuJpnqWESA6VeCOL1mB2V28/ZvKcyT8Qjb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--raduvele.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ChMGTWTa; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--raduvele.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ChMGTWTa"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-6085b0265c5so1459611a12.2
        for <chrome-platform@lists.linux.dev>; Thu, 10 Jul 2025 17:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752194107; x=1752798907; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wSHKjcKKvYgRHJeFbbOrV5zha/qrZ8dMntIj30OJ+ao=;
        b=ChMGTWTaiHyIHeZErlrI7AsBmDo+wgIFEZegKiQm25rQg3Ixx2sqXqivZPerAWtAys
         FLgKk2zk4F5pZXWtSbbcq4R+wKgw1WJvSx5QiDpkexwSAiX5CjCMxcZ/mo72KYniUspq
         VsM+ZGEoP8d5xgH2ZqoQAhNbztp6P7ujwUN6W8XVY0a1MZvw2lGaVLWsbqltIQGFLt0P
         xQzbH+2WcHCpDK3sZNDFoL9sTCKdFIQUPqhe4R2LQ9OAWK3Y7A4oR0BTF4lbRlDuFeie
         kZFS4KRfcsJIBIM6aE4tDpBpVvbAM3oKaYFTyO1c4eWJucnXETedmnMudgiFWoP4asVk
         DJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752194107; x=1752798907;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wSHKjcKKvYgRHJeFbbOrV5zha/qrZ8dMntIj30OJ+ao=;
        b=lh7o6lgGyv5USUuS7KN5vTz1Gz/3/7JZSWcv27qyeqiUhWffWx89/RVAvGNmj3bmRx
         0v/l+bSIRMz9uNAl+cSGoDBksicYdNzcIv7wbDcycWcXX4XKO3uGQY6PxspT/XC7o17S
         pVwS9UIUG6SvzzeAWk5dg3CJb7DZqTgLdXq1sP0EPIzwbLN4IQiVftQfmpnisp0NeDQ8
         LCucx7nwpTb4u2cTeBgIDEyPheWYkag2yWpRT22v2RcjNcFTLWQ6V+tb+s+zp2SLEwei
         XJ709vpbhDUirmP6i8V4/UeEHW6iN1mdrOATiPmVBCX0zp7OGMWQEETHyq5Mr/3YMoQT
         00Gw==
X-Gm-Message-State: AOJu0YyWNkJGxusONnpRjpgbPyPgBUIog6y+7xN8dBF0kgQXDLhyCP3T
	gxw7effVBuWFw/WQVenVqP5ib7Ai7oAcIoLB3QQ9ENGahLmYsumjgW8bVazOKWrPOFRex4VyXhS
	4WRY0iqN2Us+eLg==
X-Google-Smtp-Source: AGHT+IF5x6/2oYvOsXOIupQ8KAQZV10RrodN3KzeY1zC+GHgSI/M0WxEiGUgw7kvT3FI7WC1cHMA9KmoqxlMXA==
X-Received: from edsk12.prod.google.com ([2002:aa7:d8cc:0:b0:608:f54a:3f91])
 (user=raduvele job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:13cb:b0:607:20b1:7485 with SMTP id 4fb4d7f45d1cf-611ecaa2e30mr386190a12.2.1752194107049;
 Thu, 10 Jul 2025 17:35:07 -0700 (PDT)
Date: Fri, 11 Jul 2025 00:35:02 +0000
In-Reply-To: <20250711003502.857536-1-raduvele@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250711003502.857536-1-raduvele@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250711003502.857536-2-raduvele@google.com>
Subject: [PATCH v2 2/2] platform/chrome: cros_ec_typec: Add lock per-port
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
  Changes in v2:
    - Followed Tzung-Bi's suggestion to use the guard mechanism for
      managing mutexes. This also removes the declaration of `ret`
      in the middle of the function that Benson pointed out.
---
 drivers/platform/chrome/cros_ec_typec.c | 10 ++++++++++
 drivers/platform/chrome/cros_ec_typec.h |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index e689bfaf95dc..f6a3d73a967f 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -7,7 +7,9 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_usbpd_notify.h>
@@ -54,6 +56,7 @@ static int cros_typec_enter_usb_mode(struct typec_port *tc_port, enum usb_mode m
 		.mode_to_enter = CROS_EC_ALTMODE_USB4
 	};
 
+	guard(mutex)(&port->lock);
 	return cros_ec_cmd(port->typec_data->ec, 0, EC_CMD_TYPEC_CONTROL,
 			  &req, sizeof(req), NULL, 0);
 }
@@ -70,6 +73,8 @@ static int cros_typec_perform_role_swap(struct typec_port *tc_port, int target_r
 	if (!data->pd_ctrl_ver)
 		return -EOPNOTSUPP;
 
+	guard(mutex)(&port->lock);
+
 	/* First query the state */
 	req.port = port->port_num;
 	req.role = USB_PD_CTRL_ROLE_NO_CHANGE;
@@ -378,6 +383,7 @@ static void cros_unregister_ports(struct cros_typec_data *typec)
 		if (!typec->ports[i])
 			continue;
 
+		mutex_lock(&typec->ports[i]->lock);
 		cros_typec_remove_partner(typec, i);
 		cros_typec_remove_cable(typec, i);
 
@@ -386,6 +392,8 @@ static void cros_unregister_ports(struct cros_typec_data *typec)
 		typec_mux_put(typec->ports[i]->mux);
 		cros_typec_unregister_port_altmodes(typec->ports[i]);
 		typec_unregister_port(typec->ports[i]->port);
+		mutex_unlock(&typec->ports[i]->lock);
+		mutex_destroy(&typec->ports[i]->lock);
 	}
 }
 
@@ -480,6 +488,7 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 			goto unregister_ports;
 		}
 
+		mutex_init(&cros_port->lock);
 		cros_port->port_num = port_num;
 		cros_port->typec_data = typec;
 		typec->ports[port_num] = cros_port;
@@ -1240,6 +1249,7 @@ static int cros_typec_port_update(struct cros_typec_data *typec, int port_num)
 		return -EINVAL;
 	}
 
+	guard(mutex)(&typec->ports[port_num]->lock);
 	req.port = port_num;
 	req.role = USB_PD_CTRL_ROLE_NO_CHANGE;
 	req.mux = USB_PD_CTRL_MUX_NO_CHANGE;
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

