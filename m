Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C62DBE4E
	for <chrome-platform@lists.linux.dev>; Fri, 11 Jul 2025 00:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752194108; cv=none; b=jLziM6J5Ajt5kfk2J4Vhk6Ls3RNcf6K6Wcfwu0peKenrlItHAN5zH9FR+UiW1tEIrQMEGaS758QR8NoLs36eXQRCxOdKwdRX0T4MHi7cDLBnQ7YIhlBp3DrrehSvT2k55AO1Wvs4dTleioheMOnZpyprqqQ/QogbKhWFJ/VWp1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752194108; c=relaxed/simple;
	bh=9ffrvIK5jaQ6HiA0P7odbBJIoQ9cftfXdnMC0msSa6Q=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=lpQ+4plllt9SeVdRC9lvuzCJJ5AhvyGm2H8WxhlxUKTLwsEUpxB6+Mj4k9+TlGAnVRcwSuBulErArpwnmV3oBkC4hNyBGUTxC+VWZVeCPHq9vwf32Kg9DeyQSi5TE/qOuv2oMOX4MV41ZeBk60mStTBYmHpnM3XJov8q5mAmvIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--raduvele.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QAClla0q; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--raduvele.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QAClla0q"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-6097b1faec9so1289719a12.3
        for <chrome-platform@lists.linux.dev>; Thu, 10 Jul 2025 17:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752194105; x=1752798905; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KfAdX2MqONc3umr8BiQV/VWYcu9IN89E1XmpZSpBvuM=;
        b=QAClla0qeAaie7o75GeQYNAfelJB+/hOpRwOGn2rkmFuchGj6738UxRi0EGj9EjskX
         olLIdBD+fuFqLEkkcD9z1Tujjki28qNVFI2/d+zNiP84avMnR6XDbSUe6E3MwVIXtdHk
         OM/3vH15pkeZJkbemvZPSoCB2Wo9/X3aCDZxX70vyH8peOiFAHu06ra5tNRr56mhna1j
         G1xJig1LCiewBZuTuSOvtuPIjj12wMqf8HtModQHKFb3qyKUgZfi9FvLFtoWaeFjpCd1
         a4yuEKbpokhQqdjNEzhY1FbiP5ouG6L+Kw4eOTqn8BspckBbKgvGteM131fqXzNjAY3b
         hZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752194105; x=1752798905;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KfAdX2MqONc3umr8BiQV/VWYcu9IN89E1XmpZSpBvuM=;
        b=Zt6o83YuwmSLouCVD0BIUdlAWl68vZhzOF9dU1f+tp6RDLmJsE1WoQsetttPBZEgAd
         L/gjFFiwjSVndkeAM9WjYfxfbUsBY+PFTynEfCa9XUqIzpzHkraPboV1wqInEeRjd71y
         XpqwhcINn5u3Zvrrtpwv1YBSC7EXsQ0uemybHqe36xMLFAUCMXJTsAZRjMwmr8+nfk8G
         GORLrMnK+03bruc5ZwFPEwA1A9DOk0tMZldtQGcbHOK3YgpIp4UlQxflTT7AmR+kk8Bc
         33GUzIWpGGKpn37nSSL/ce6uBDdnmPGfS3C0ISbKfTr/yPpQV7juRKkZtAzRIJ8rGGhd
         dojA==
X-Gm-Message-State: AOJu0YwdAe4Mm7UOLxWGVN+5xrj6yjCbvB4IHsZ/Gk1cB0XmILamwTMB
	FkWUiyGdzPgKHU97DZzI/ldlWMVs3xyiN+GI1EuRjoJXPUbCDHeVJYSTs/FYDZ6Zflq6ryYO3Hc
	vpOVFo7I/P1O5jg==
X-Google-Smtp-Source: AGHT+IEY5l2MjG3wbFjOsXTF7b0MS6bi8janbGCzV2kVEfsPPF284wBY7MoFRHUcb8hDxM7iInYsgpL8vQyVEQ==
X-Received: from edbet3.prod.google.com ([2002:a05:6402:3783:b0:608:806a:7dbf])
 (user=raduvele job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:210e:b0:601:fcc7:4520 with SMTP id 4fb4d7f45d1cf-611e7608d27mr752920a12.4.1752194104914;
 Thu, 10 Jul 2025 17:35:04 -0700 (PDT)
Date: Fri, 11 Jul 2025 00:35:01 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250711003502.857536-1-raduvele@google.com>
Subject: [PATCH v2 1/2] platform/chrome: cros_ec_typec: Add role swap ops
From: Radu Vele <raduvele@google.com>
To: Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Andrei Kuchynski <akuchynski@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

Add the pr_set and dr_set typec_operations to registered typec ports.
This enables sysfs to control power and data role when the port is
capable of doing so.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Co-developed-by: Radu Vele <raduvele@google.com>
Signed-off-by: Radu Vele <raduvele@google.com>

---
  Changes in v2:
    - addressed comments from Tzung-Bi
    - after EC command to swap role is issued we check if the returned
      role in the response matches the target role. While testing this
      I observed that for power role swap the ec returns >0 but the
      returned role doesn't ever match the target role (but the role
      swap happens as expected). This may be an EC bug, I am
      investigating.
---
 drivers/platform/chrome/cros_ec_typec.c | 85 ++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 7678e3d05fd3..e689bfaf95dc 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -58,8 +58,91 @@ static int cros_typec_enter_usb_mode(struct typec_port *tc_port, enum usb_mode m
 			  &req, sizeof(req), NULL, 0);
 }
 
+static int cros_typec_perform_role_swap(struct typec_port *tc_port, int target_role, u8 swap_type)
+{
+	struct cros_typec_port *port = typec_get_drvdata(tc_port);
+	struct cros_typec_data *data = port->typec_data;
+	struct ec_response_usb_pd_control_v2 resp;
+	struct ec_params_usb_pd_control req;
+	int role, ret;
+
+	/* Must be at least v1 to support role swap. */
+	if (!data->pd_ctrl_ver)
+		return -EOPNOTSUPP;
+
+	/* First query the state */
+	req.port = port->port_num;
+	req.role = USB_PD_CTRL_ROLE_NO_CHANGE;
+	req.mux = USB_PD_CTRL_MUX_NO_CHANGE;
+	req.swap = USB_PD_CTRL_SWAP_NONE;
+
+	ret = cros_ec_cmd(data->ec, data->pd_ctrl_ver, EC_CMD_USB_PD_CONTROL,
+				&req, sizeof(req), &resp, sizeof(resp));
+	if (ret < 0)
+		return ret;
+
+	switch (swap_type) {
+	case USB_PD_CTRL_SWAP_DATA:
+		role = (resp.role & PD_CTRL_RESP_ROLE_DATA) ? TYPEC_HOST :
+						TYPEC_DEVICE;
+		break;
+	case USB_PD_CTRL_SWAP_POWER:
+		role = (resp.role & PD_CTRL_RESP_ROLE_POWER) ? TYPEC_SOURCE :
+						TYPEC_SINK;
+		break;
+	default:
+		dev_warn(data->dev, "Unsupported role swap type %d\n", swap_type);
+		return -EOPNOTSUPP;
+	}
+
+	if (role == target_role)
+		return 0;
+
+	req.swap = swap_type;
+	ret = cros_ec_cmd(data->ec, data->pd_ctrl_ver, EC_CMD_USB_PD_CONTROL,
+				&req, sizeof(req), &resp, sizeof(resp));
+	if (ret < 0)
+		return ret;
+
+	switch (swap_type) {
+	case USB_PD_CTRL_SWAP_DATA:
+		role = resp.role & PD_CTRL_RESP_ROLE_DATA ? TYPEC_HOST : TYPEC_DEVICE;
+		if (role != target_role) {
+			dev_err(data->dev, "Data role swap failed despite EC returning success\n");
+			return -EIO;
+		}
+		typec_set_data_role(tc_port, target_role);
+		break;
+	case USB_PD_CTRL_SWAP_POWER:
+		role = resp.role & PD_CTRL_RESP_ROLE_POWER ? TYPEC_SOURCE : TYPEC_SINK;
+		if (role != target_role) {
+			dev_err(data->dev, "Power role swap failed despite EC returning success\n");
+			return -EIO;
+		}
+		typec_set_pwr_role(tc_port, target_role);
+		break;
+	default:
+		/* Should never execute */
+		break;
+	}
+
+	return 0;
+}
+
+static int cros_typec_dr_swap(struct typec_port *port, enum typec_data_role role)
+{
+	return cros_typec_perform_role_swap(port, role, USB_PD_CTRL_SWAP_DATA);
+}
+
+static int cros_typec_pr_swap(struct typec_port *port, enum typec_role role)
+{
+	return cros_typec_perform_role_swap(port, role, USB_PD_CTRL_SWAP_POWER);
+}
+
 static const struct typec_operations cros_typec_usb_mode_ops = {
-	.enter_usb_mode = cros_typec_enter_usb_mode
+	.enter_usb_mode = cros_typec_enter_usb_mode,
+	.dr_set = cros_typec_dr_swap,
+	.pr_set = cros_typec_pr_swap,
 };
 
 static int cros_typec_parse_port_props(struct typec_capability *cap,
-- 
2.50.0.727.gbf7dc18ff4-goog

