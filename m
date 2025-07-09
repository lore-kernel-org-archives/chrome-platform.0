Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B44BE4A
	for <chrome-platform@lists.linux.dev>; Wed,  9 Jul 2025 13:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752067357; cv=none; b=E+qThhRVeZ7IZ2yw1E1bqZHUaX+CiAfJofrZfErE3oyJ0q8smbO7j9VmxsApjipIBe/zFlwkcdhvxVSkBkl4IQ6XjVLypbk718CIuH0Hu8EmGA5X4xDrz1hixzzDiTC7kufhfvn4iQGW39xHpvgUaF2qevtNTWC4FkCbXSiSgjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752067357; c=relaxed/simple;
	bh=A2DoetifgDt48zV1gVs51Ud+jL1vtv986xcqbQ9S0Dc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=jY7yhHYoYk+Gbp4wUDFHoWhW+5OA9TeEPE2rKNCB9usu8JPENVr4aVGTCYHLn33JZyihxQuUsAL8QfwmHKlzKJI1oCvCeLCtxeQrkaRsTMxxp03nWl8ATp0M7RSH45ukqJxeeaioI3VHhtKwUxMuhhuDL+40MfVJFRv8lFUBKF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--raduvele.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k31I68wZ; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--raduvele.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k31I68wZ"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a169cso6114679a12.0
        for <chrome-platform@lists.linux.dev>; Wed, 09 Jul 2025 06:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752067354; x=1752672154; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0POwGeVY/oBf03TkHrGLCHAo/NCqv2tLic3Xhhp3IR4=;
        b=k31I68wZZt05xnmq3IJmUGa5hTZh35PbDeSqj70YvSCd9EVMIrz2lV9BMxBpXdWSdI
         6RdgEhEMjXrd+IMWAz2Jdmj7wf0j2joC98nCrJ3BXFlfchg9/lNrpypM4xeClL4PZzjy
         kEej6S633rEZdQHm4KYBjmxcuoYJ1FSYLyG7phXKx4amLHsdg0T9Rln94H8nqV/yJzyJ
         i6sjFWwaUQvyBni+PekQsgKhFTFW1I+/uXMVJOZn/1L1hLokYDGk7I3EqkVgY8rN91k9
         sxCIqvegZGc50mjw7q+prD/4Ytao/oEtRGt2fqjC0jK0qPv26x48AO5E1gN/gRhcCf6J
         +OQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752067354; x=1752672154;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0POwGeVY/oBf03TkHrGLCHAo/NCqv2tLic3Xhhp3IR4=;
        b=v4EzHyZlP9epKmTURreHd2HTDTVjFX+UAJN09YgGU+zwVlbVVi0QUzXU5yoX585N+d
         APJEWm6XH54Wzz8w7xqfPamBBE9R7p37lp3gxkxecmvgGwb6PaL7Vo75Rtdvjz3VBzq0
         MxuzUU4XufDZPBfPAzCsnvA3gGskomHyMRQiSiQytdV+ea5ZcWWhG5mBvQTtZv7zbalE
         ziWBXrPDhWCFXRoEo1XqqQAMXgKwWlIbdVAVoH2WRkU4Dm/tIR1wEUeepR/rPE9dKpu9
         NX2eWiouoeSzt/MWPLKloXF/tzjgguK5KrACc05U8/sJQ+O1ARA1FjKF1Da8VIqpuR42
         ieXQ==
X-Gm-Message-State: AOJu0YwfSFOkJCgJyqklUYms68DmrT9qY4D2Xl2KnVMPheRxXLDS4f8+
	yZfvymIQumxRhk9k93T59kFD54uMIx2InrI19sFKgvq4qblJC28n9OW1BO0gL3kZCgJcF5YhbLA
	OlCuojr8X+jftLA==
X-Google-Smtp-Source: AGHT+IGZlrYoPqnzfB61mLqVQH6I9T9xqiZxhmKbJTnu8SwepKkIF9hCJoXZOBCPN7dspanLKivlSMfeN8QSIw==
X-Received: from edbdn22.prod.google.com ([2002:a05:6402:22f6:b0:60c:a42b:25c3])
 (user=raduvele job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:35d6:b0:608:f54b:5c81 with SMTP id 4fb4d7f45d1cf-611a65ab957mr2204701a12.1.1752067354375;
 Wed, 09 Jul 2025 06:22:34 -0700 (PDT)
Date: Wed,  9 Jul 2025 13:22:31 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250709132232.2475172-1-raduvele@google.com>
Subject: [PATCH v1 1/2] platform/chrome: cros_ec_typec: Add role swap ops
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
 drivers/platform/chrome/cros_ec_typec.c | 77 ++++++++++++++++++++++++-
 1 file changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 7678e3d05fd3..289429ef959f 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -58,8 +58,83 @@ static int cros_typec_enter_usb_mode(struct typec_port *tc_port, enum usb_mode m
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
+		dev_warn(data->dev, "Unsupported role swap type %d", swap_type);
+		return -EOPNOTSUPP;
+	}
+
+	if (role == target_role)
+		return 0;
+
+	req.swap = swap_type;
+	ret = cros_ec_cmd(data->ec, data->pd_ctrl_ver, EC_CMD_USB_PD_CONTROL,
+				&req, sizeof(req), &resp, sizeof(resp));
+
+	if (ret < 0)
+		return ret;
+
+	switch (swap_type) {
+	case USB_PD_CTRL_SWAP_DATA:
+		typec_set_data_role(tc_port, resp.role & PD_CTRL_RESP_ROLE_DATA ?
+									TYPEC_HOST :
+									TYPEC_DEVICE);
+		break;
+	case USB_PD_CTRL_SWAP_POWER:
+		typec_set_pwr_role(tc_port, resp.role & PD_CTRL_RESP_ROLE_POWER ?
+									TYPEC_SOURCE :
+									TYPEC_SINK);
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
+	.pr_set = cros_typec_pr_swap
 };
 
 static int cros_typec_parse_port_props(struct typec_capability *cap,
-- 
2.50.0.727.gbf7dc18ff4-goog

