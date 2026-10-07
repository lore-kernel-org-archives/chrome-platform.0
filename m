Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7870E2AD35
	for <chrome-platform@lists.linux.dev>; Wed,  7 Oct 2026 03:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791344322; cv=none; b=cbK4zriYs5UxvemS3SAVApAghZjLqHOSGmG5fcpCdM2OOBvADV67RSPeeSJQUN4jvfTg+8ZYl29TdZXVUbKtQp/CIWnItfLzzA0eb5hoBHC66NxIQKUmwQMnLL3YsA+CZAZs26MunDd/ndr9ynCK+YT0n9ZCj2HQwfugsXFVWZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791344322; c=relaxed/simple;
	bh=8hD0fGxiblq14EYWxIMYfwJOOb/tCLl+EmAEZSf3/NE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Tv2SiErsDyLc58oyuQYSiJYfR1xM/OSa+Mjfp8kp9hmwCgNqrkmpH4bOLduiM/LMBlHj6yW0cvJU0bYBWGsLiKlKjC95xA+p3/awkFkpa9+gSYPeuHgKkbuhvKzkytBlxYqZpRqeeJh2/w2pSokVFnIVMpU79nwA3Ibm5/8OkgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ipgoqtyr; arc=none smtp.client-ip=209.85.208.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ipgoqtyr"
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6a98570af94so1484058a12.1
        for <chrome-platform@lists.linux.dev>; Tue, 06 Oct 2026 20:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791344319; x=1791949119; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XnBm9HRZVtBiwOoRqt9XUwCrohQCxPilT75YPZPRctY=;
        b=Ipgoqtyroa8J7QDDYUXivT0kf6Z3R7bjYpHLhAu6U3C/w+wgdqCc8cHAf+KP9C5inX
         9QRLOJxI/DBXkUubObb3LLkH8PZ9Xm9eaN67RpmdJVKWz2ESknKCUtS8j7NG5GHkY/Oa
         mYS5gVD+Heb6Qhntw3B8wCX3o8Z07fqiFNzkkwJfWEnp5qXyOAFy8eKsG/bW7s7JTo7i
         XdWoqMLOg2fhyuxFuC/PZm7Dfbecg6um9OQllkyIiQ9u8l+o6AqvxguUfzTLFNJhtnaS
         ftBPzfHfP+rf0157uQG3Znkz4XiUX+WHAFlfSlPYZOXQC9LqT2wrKapFAfNnGyA825m5
         oa7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791344319; x=1791949119;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XnBm9HRZVtBiwOoRqt9XUwCrohQCxPilT75YPZPRctY=;
        b=tmTtEi8d8/DGGLFLeSZYpP6UOX3q5ldsPmMZfpbadp0TOYGRZfoEMJg5eVNwfvbGOK
         REIrgPRSBbsVruoESOzlDDF55T0+dbLH8U8ugCvJOLaZrcCDvLuXNIVm+8wb9nKwEHDS
         DdO9ug3QBKCeF1QIVCBEsZMZo0hvksB1Mo1tjEv4cDwuXaE21XMrqNb26NYKCVvnqb+3
         FOLK0kpFeR7EC5oB+T8Obo/JHmnIOkpzPWW0Af6eanvMLigkJ9PxdYNI+UU80a+L7yew
         t+BbTrFaFq3ErhSce4GdskNqPR0oMVOha77zsvqCl9Ix6JNyPLg/ZntR51ubg146/iCr
         9DDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOM8uBOlwG2quZdKrxOO2z9VMkkB5+LJ4epSi27sQdDDOheV0c7f5yOagEeSZDbDkVdMoY1VBDcd0ADEy4n3g=@lists.linux.dev
X-Gm-Message-State: AFq9FYLrseBV5KAH12UopGoAU4FddrSYb7FJdE1uW3byArV1qxDMwV/0
	0ambSGNrkYNB0yaGHXpq6hxTKPfmoCKCltMYxGk/ixdWJm3Q0KM/TNHIuqShxPl67Kxd6NiKOa0
	hsXBN4FKYEYH6IkyaKw==
X-Received: from edew13-n2.prod.google.com ([2002:a05:6402:a20d:20b0:6ac:b3cf:2b80])
 (user=mmaslanka job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2546:b0:6aa:e251:ecb4 with SMTP id 4fb4d7f45d1cf-6aff3745871mr900193a12.2.1791344318296;
 Tue, 06 Oct 2026 20:38:38 -0700 (PDT)
Date: Wed,  7 Oct 2026 05:38:37 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261007033837.708119-1-mmaslanka@google.com>
Subject: [PATCH v2] platform/chrome: cros_ec_typec: Poll for role swap completion
From: Marek Maslanka <mmaslanka@google.com>
To: Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Andrei Kuchynski <akuchynski@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, Radu Vele <raduvele@google.com>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Marek Maslanka <mmaslanka@google.com>
Content-Type: text/plain; charset="UTF-8"

Depending on the EC USB-C stack (TCPMv2 vs PDC), EC_CMD_USB_PD_CONTROL
with a role swap request may either block until the swap completes or
queue the request asynchronously for the EC PD task and return the
current (pre-swap) role in the immediate response. On platforms where
the EC handles the swap asynchronously, checking resp.role right after
issuing the swap command sees the old role and fails with -EIO before
the USB PD handshake completes.

If the immediate response does not yet reflect the target role, poll
EC_CMD_USB_PD_CONTROL with USB_PD_CTRL_SWAP_NONE until the target role
is reached while connected, or until ROLE_SWAP_TIMEOUT_MS expires. The
timeout mirrors PD_ROLE_SWAP_TIMEOUT used by the TCPM port manager,
since a PR_Swap may legitimately take seconds when the partner answers
with Wait and the initiator retries.

While at it, report the failure modes the same way tcpm.c does, so that
userspace can tell a rejected swap from a disconnect: -ETIMEDOUT when
the partner never completes the swap, and -ENOTCONN when the port goes
away while waiting. Decoding of the swapped role is factored out into
cros_typec_resp_to_role() instead of being open coded for each swap
type, which also keeps an unhandled swap type from being misread as a
power role swap.

Fixes: ab229c2b72c3 ("platform/chrome: cros_ec_typec: Add role swap ops")
Signed-off-by: Marek Maslanka <mmaslanka@google.com>
---
Changes in v2:
- Check PD_CTRL_RESP_ENABLED_CONNECTED at the start of each poll
  iteration and return -ENOTCONN immediately if the port disconnects,
  instead of waiting for the timeout to expire (Tzung-Bi Shih).
- Link to v1: https://lore.kernel.org/chrome-platform/20260923174420.2343724-1-mmaslanka@google.com/

 drivers/platform/chrome/cros_ec_typec.c | 94 +++++++++++++++++--------
 1 file changed, 65 insertions(+), 29 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index c0806c562bb9..cda65e094c62 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -7,6 +7,8 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/delay.h>
+#include <linux/jiffies.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_data/cros_ec_commands.h>
@@ -22,6 +24,14 @@
 
 #define DRV_NAME "cros-ec-typec"
 
+/*
+ * Mirrors PD_ROLE_SWAP_TIMEOUT used by the TCPM port manager: a PR_Swap may
+ * legitimately take seconds when the partner answers with Wait and the
+ * initiator retries.
+ */
+#define ROLE_SWAP_TIMEOUT_MS	10000
+#define ROLE_SWAP_DELAY_MS	20
+
 #define DP_PORT_VDO	(DP_CAP_DFP_D | DP_CAP_RECEPTACLE | \
 			 DP_CONF_SET_PIN_ASSIGN(BIT(DP_PIN_ASSIGN_C) | \
 						BIT(DP_PIN_ASSIGN_D) | \
@@ -58,12 +68,33 @@ static int cros_typec_enter_usb_mode(struct typec_port *tc_port, enum usb_mode m
 			  &req, sizeof(req), NULL, 0);
 }
 
+/*
+ * Decode the role relevant to @swap_type out of an EC_CMD_USB_PD_CONTROL
+ * response.
+ *
+ * Returns a value comparable against the typec class target role
+ * (TYPEC_DEVICE/TYPEC_HOST or TYPEC_SINK/TYPEC_SOURCE), or -EOPNOTSUPP if
+ * @swap_type is not a role swap this driver knows how to track.
+ */
+static int cros_typec_resp_to_role(struct ec_response_usb_pd_control_v2 *resp, u8 swap_type)
+{
+	switch (swap_type) {
+	case USB_PD_CTRL_SWAP_DATA:
+		return (resp->role & PD_CTRL_RESP_ROLE_DATA) ? TYPEC_HOST : TYPEC_DEVICE;
+	case USB_PD_CTRL_SWAP_POWER:
+		return (resp->role & PD_CTRL_RESP_ROLE_POWER) ? TYPEC_SOURCE : TYPEC_SINK;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static int cros_typec_perform_role_swap(struct typec_port *tc_port, int target_role, u8 swap_type)
 {
 	struct cros_typec_port *port = typec_get_drvdata(tc_port);
 	struct cros_typec_data *data = port->typec_data;
 	struct ec_response_usb_pd_control_v2 resp;
 	struct ec_params_usb_pd_control req;
+	unsigned long end;
 	int role, ret;
 
 	/* Must be at least v1 to support role swap. */
@@ -81,18 +112,10 @@ static int cros_typec_perform_role_swap(struct typec_port *tc_port, int target_r
 	if (ret < 0)
 		return ret;
 
-	switch (swap_type) {
-	case USB_PD_CTRL_SWAP_DATA:
-		role = (resp.role & PD_CTRL_RESP_ROLE_DATA) ? TYPEC_HOST :
-						TYPEC_DEVICE;
-		break;
-	case USB_PD_CTRL_SWAP_POWER:
-		role = (resp.role & PD_CTRL_RESP_ROLE_POWER) ? TYPEC_SOURCE :
-						TYPEC_SINK;
-		break;
-	default:
+	role = cros_typec_resp_to_role(&resp, swap_type);
+	if (role < 0) {
 		dev_warn(data->dev, "Unsupported role swap type %d\n", swap_type);
-		return -EOPNOTSUPP;
+		return role;
 	}
 
 	if (role == target_role)
@@ -104,28 +127,41 @@ static int cros_typec_perform_role_swap(struct typec_port *tc_port, int target_r
 	if (ret < 0)
 		return ret;
 
-	switch (swap_type) {
-	case USB_PD_CTRL_SWAP_DATA:
-		role = resp.role & PD_CTRL_RESP_ROLE_DATA ? TYPEC_HOST : TYPEC_DEVICE;
-		if (role != target_role) {
-			dev_err(data->dev, "Data role swap failed despite EC returning success\n");
-			return -EIO;
+	/*
+	 * Depending on the EC USB-C stack (TCPMv2 vs PDC), EC_CMD_USB_PD_CONTROL
+	 * may either block until the swap completes or queue the request
+	 * asynchronously and return the pre-swap role. Poll until the target
+	 * role is reached while connected, or until the timeout expires.
+	 */
+	req.swap = USB_PD_CTRL_SWAP_NONE;
+	end = jiffies + msecs_to_jiffies(ROLE_SWAP_TIMEOUT_MS);
+	for (;;) {
+		if (!(resp.enabled & PD_CTRL_RESP_ENABLED_CONNECTED)) {
+			dev_err(data->dev, "Port disconnected during role swap\n");
+			return -ENOTCONN;
 		}
-		typec_set_data_role(tc_port, target_role);
-		break;
-	case USB_PD_CTRL_SWAP_POWER:
-		role = resp.role & PD_CTRL_RESP_ROLE_POWER ? TYPEC_SOURCE : TYPEC_SINK;
-		if (role != target_role) {
-			dev_err(data->dev, "Power role swap failed despite EC returning success\n");
-			return -EIO;
+
+		if (cros_typec_resp_to_role(&resp, swap_type) == target_role)
+			break;
+
+		if (time_after_eq(jiffies, end)) {
+			dev_err(data->dev, "Timed out waiting for role swap to complete\n");
+			return -ETIMEDOUT;
 		}
-		typec_set_pwr_role(tc_port, target_role);
-		break;
-	default:
-		/* Should never execute */
-		break;
+
+		msleep(ROLE_SWAP_DELAY_MS);
+		ret = cros_ec_cmd(data->ec, data->pd_ctrl_ver,
+				  EC_CMD_USB_PD_CONTROL, &req, sizeof(req),
+				  &resp, sizeof(resp));
+		if (ret < 0)
+			return ret;
 	}
 
+	if (swap_type == USB_PD_CTRL_SWAP_DATA)
+		typec_set_data_role(tc_port, target_role);
+	else
+		typec_set_pwr_role(tc_port, target_role);
+
 	return 0;
 }
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

