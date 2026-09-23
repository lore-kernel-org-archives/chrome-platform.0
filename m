Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2F93AD513
	for <chrome-platform@lists.linux.dev>; Wed, 23 Sep 2026 17:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185480; cv=none; b=pLGON+1tKiq0258Gad3ps2iS6d/xDYnPt4krca5r83XD54/t3AC3SGJqv3ch1oZJEQ/zeFajYGYWOvujpcWY33ghQopR5Gcu5BQLz0BajmEkNO6H6M+CMPpsIB8EgXfpNr2B+5TRZFjKH2ea8Ccp1gOgcBlxNJhTzur8gT8HtXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185480; c=relaxed/simple;
	bh=5yZjf9aWV7RXgQK9ktGV1SjO8oVFTs48qTQLILiKNIo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=uiahN96cusu6B9oMJ8+/diH8jU1PKcbO0X7MkaqyJfF8XMJ+R6cYSZSYgUD7jg2TqHw2PGMlY1ALrApUIFcmVhs/5DTSGKq3n3tm6spIMqfrginofdOhMTucQHZ2WYZ1fFskChUdgCbQ7ua0VG2cbygTLivW2ne9rBb3yjoYRCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uic+r8pe; arc=none smtp.client-ip=209.85.208.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uic+r8pe"
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6a1188c8948so1360396a12.0
        for <chrome-platform@lists.linux.dev>; Wed, 23 Sep 2026 10:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790185477; x=1790790277; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bk6SbIP9vnrSui/2kvsRPPc+GVPC3yW13beKBqucCfg=;
        b=uic+r8peAic6yjztIPu50y2ZhGKUc3V/CXbYDjQfWl5DaeBnLbI5XqmbPxcBmfJll3
         WVxNrkYp6lG+bjufjlk7nLAYFamfNYsVZ5o/iNpLiZAANfoMv5qvystAwu6uJfEYvhdo
         ZZPXoJF7sP0syglCMwwMkHOmNTNUgUFC9UxwCfbV2uBtpTkiXylrmSrjeQra4Lp7Iit5
         GcU5wWRU3KdBJmZstxEdQm1xKyEvjKfmgQSpj37tF1w1eU5c//pjPlxbFzWEdDqKBbno
         T2ZnrjB1uao0swVV9686weRuTNRhXP0eIn/6G1cV7iOsr0/KWquNaA/sb17img1+BshQ
         tFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790185477; x=1790790277;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bk6SbIP9vnrSui/2kvsRPPc+GVPC3yW13beKBqucCfg=;
        b=K5W3dNVkNioBntoO4tfhjYMV+ogpykOpcI+dOQQqil3x3hsDvyzH+IqElP9emEg9hi
         MEARsfSx9Ufsgc0iMOgL4TTBLP8miO4wsxVAwB49iSGnCdD30BTVz3fUTpiy8HLBY0wO
         M6mHzfi1EObYyyvI1EUIz0LUa0Dh4fwHsr+6ip4sjkC6MJVVGZj0/o6Fo48zBK7wpHaw
         2+Kx+krENv0YcbVtcj02RqQupv74CaUuFEOVAf1OonYVZxYkhFZ/zT3egurGnHpGYezY
         9/AVxS44D7S+EAPZxI89d/6NDEGtowZnTTYgnpZUfTuIIMPbCKoDXFb5oQSYbCR6G/6+
         /xXg==
X-Forwarded-Encrypted: i=1; AKwUvByQfQTddueNSsHqyiElc8g4IWOny7C+4OS5KuqUf4ENK4vFfL4DPg5GISlQbyvwebZVHdfg2MedUhzfuNlhMe8=@lists.linux.dev
X-Gm-Message-State: AFuF++kQUmGdOmhW3vzMkveTAAAbl/uIfN7wvMem1LVwAIBJ/Ti1kWP1
	tY2bsw/x1i0DruvNDf8HKHdZAwlRuZo09FAC6zIWmSFATSdWkAwzCIZnvCAd/Y8maQy/kF7S+4D
	RglzuBBcuRktwQv474w==
X-Received: from edea18.prod.google.com ([2002:a05:6402:a192:b0:6aa:9381:b600])
 (user=mmaslanka job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:a0cc:b0:6aa:734b:1a1f with SMTP id 4fb4d7f45d1cf-6aab3b5bb34mr2924206a12.25.1790185476519;
 Wed, 23 Sep 2026 10:44:36 -0700 (PDT)
Date: Wed, 23 Sep 2026 19:44:19 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Message-ID: <20260923174420.2343724-1-mmaslanka@google.com>
Subject: [PATCH] platform/chrome: cros_ec_typec: Poll for role swap completion
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
 drivers/platform/chrome/cros_ec_typec.c | 95 +++++++++++++++++--------
 1 file changed, 66 insertions(+), 29 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index c0806c562bb9..b97026ae0454 100644
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
@@ -104,27 +127,41 @@ static int cros_typec_perform_role_swap(struct typec_port *tc_port, int target_r
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
+		if ((resp.enabled & PD_CTRL_RESP_ENABLED_CONNECTED) &&
+		    cros_typec_resp_to_role(&resp, swap_type) == target_role)
+			break;
+
+		if (time_after_eq(jiffies, end)) {
+			if (!(resp.enabled & PD_CTRL_RESP_ENABLED_CONNECTED)) {
+				dev_err(data->dev, "Port disconnected during role swap\n");
+				return -ENOTCONN;
+			}
+
+			dev_err(data->dev, "Timed out waiting for role swap to complete\n");
+			return -ETIMEDOUT;
 		}
+
+		msleep(ROLE_SWAP_DELAY_MS);
+		ret = cros_ec_cmd(data->ec, data->pd_ctrl_ver,
+				  EC_CMD_USB_PD_CONTROL, &req, sizeof(req),
+				  &resp, sizeof(resp));
+		if (ret < 0)
+			return ret;
+	}
+
+	if (swap_type == USB_PD_CTRL_SWAP_DATA)
 		typec_set_data_role(tc_port, target_role);
-		break;
-	case USB_PD_CTRL_SWAP_POWER:
-		role = resp.role & PD_CTRL_RESP_ROLE_POWER ? TYPEC_SOURCE : TYPEC_SINK;
-		if (role != target_role) {
-			dev_err(data->dev, "Power role swap failed despite EC returning success\n");
-			return -EIO;
-		}
+	else
 		typec_set_pwr_role(tc_port, target_role);
-		break;
-	default:
-		/* Should never execute */
-		break;
-	}
 
 	return 0;
 }
-- 
2.55.0.1082.g2b9226bbc0-goog

