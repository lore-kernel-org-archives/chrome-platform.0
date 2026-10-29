Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305813;
	b=chxijmymYKGMKJK4XwsG6RV98oVX9ndbDCFhnSMpAot1UnzDLbIUgy0IPYCXQhxTyCJQ
	 Z+2iG2EdpVDXCoup9IusDm2Fdi529s9Ou/ZxFcyAaLacTu7wyQkeJLIwdd+Z1mAEvrqGR
	 MjsbZoHqL6oraDk5+ZFu63zPl8iuShLucK8ZL3uAeVu6tTcCCqV1g51LUt4opQdyAgw9+
	 n+6QDlNAEUuUvBQTTFEUeihLAMpaaCNDgDuUtcIumm+b06o5BWjCDqDkDZ7R3Sf06giXJ
	 UIhxD/kn5o2oRFfEqhObKRgnmStXlM1lPmwIV5t2wbNKzdfbGBh4MgddBziH5POcCtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=uXSeg1mwXsdfU65lCvMy2yLqWgpkOlopYKKBWO91XDU=;
	b=eieKDZPXp9IMjvtx6AZv0jcz1K8N6tHcj2duz+V8dbOdOYg8jTnq4vP1Rv8KQErKtGJs
	 h5lojEm/8p4cbwVJSpzX2mHqazn+BeQpXPfpIkEB9sCNPSt6sOsxGJ6q37so3OxycBRzs
	 iDHhiiUjsHTRo6thgld4/3CctyldIUCZtyES3iF2CeS/F90EgOVX9tfAHLkTvpDArgRcS
	 1eY/llReMjwqrgO0UfEwgxQRGU35VWUew+Sn3udIL5+UPWeFsNIC9jd1xrqyDxn09cGu6
	 A7Jdb5iGOCzYRSXMPNnBgUV17BNstqnKf/knqircogN3Mvyc0Ge1PR+45ezhi7rneDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--scollyer.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FMBYIbfJ;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F7B606A31F
	for <chrome-platform@lists.linux.dev>; Thu, 29 Oct 2026 20:30:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93F7B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--scollyer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FMBYIbfJ
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-18eb2616974so2849396c88.1
        for <chrome-platform@lists.linux.dev>; Thu, 29 Oct 2026 13:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793305812; x=1793910612; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uXSeg1mwXsdfU65lCvMy2yLqWgpkOlopYKKBWO91XDU=;
        b=FMBYIbfJE1YlVRvcyHr33k2WiNJU4qTsANWWoPWRbOoCvWLZ/va83VJH4f28MFZNWR
         fb/7S0+du8JDLfFR7NqEO7236ajknx2Jch4fwmyOrVy4REw/GzSp75qC+cglC42VhcmI
         bE6TRafG0kk8Ys+kTTrjxOtaLjhzuGlcerRKE5jlfTLBqY5Fb601al4iBMS3n0Q5T3Vk
         LyWoRsRw37zkKUxFuUHtSIvKNulEcxFWwN4knF4a7Uwb+fFFi6EPNcpxTl+p/PrxakZJ
         tBVDp1qr5tQn0zBW89ncBHtgduvkfk4upCVguN8HTxvW48bnv/Qgl0Tiq6uxcjHXcHrS
         5E3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305812; x=1793910612;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uXSeg1mwXsdfU65lCvMy2yLqWgpkOlopYKKBWO91XDU=;
        b=Kc7yelv0Gdn8SjTWnpQI7fRw+hx7dQJSuQN/ADqQYUYb2y3qc1NINIOf9M9raQ6nxn
         cCGdvODN+CyGpZBwGBdAikezNSu/LgcVlg+R3gRRH+M2qPVg37GIl5xeiFDVRdxbqE0R
         Lnw+29uieP0MMOvIQKEMo++7GOYTKzmDmqnId3divDD9WQXAjW+xkXGsio4pcLhOHcb4
         e+315+VplXa1+HG19GtDwujIxj1/kf+I3qX7dIxIM8SxdHJZO8gPICwT5xefhWrBtyJD
         sLZtJyN7PPKgnAhhMq435DzqhifL33k1QLAGl5w9vx6iAbCodJP2+kXv803TaeDhHjxE
         k6bw==
X-Forwarded-Encrypted: i=1; AKwUvBxjvkQ+/arm8FpGDruULMEnORJIeoNjGib89UthrNKKIo1JDG1TBPacCy1s4kYGjBnp3sLtzJpqq5fUvEs0qcA=@lists.linux.dev
X-Gm-Message-State: AFq9FYItjvGAkJh7cRqpZiBLjGeppty9AKKLLKuGDW7FtHOoqCVH403G
	UO01S2rrg/l0eM9yrD2bD+Pqyac9m4/c2FtH2I5c/MhLU9qldCbOtJJvzJ+A57YiyqnDukPoxYn
	3S9mfoRhhIrw8EQ==
X-Received: from dybmx2.prod.google.com ([2002:a05:7300:d402:b0:369:ff7f:6354])
 (user=scollyer job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:ea4b:b0:1a7:979f:ecc0 with SMTP id a92af1059eb24-1ac5b7e1074mr150741c88.27.1793305811259;
 Thu, 29 Oct 2026 13:30:11 -0700 (PDT)
Date: Thu, 29 Oct 2026 13:30:08 -0700
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261029203008.419808-1-scollyer@google.com>
Subject: [PATCH v3] platform/chrome: cros_ec_ishtp: report EC_HOST_EVENT_PANIC
 to userspace
From: Scott Collyer <scollyer@google.com>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Scott Collyer <scollyer@google.com>
Content-Type: text/plain; charset="UTF-8"

When the ISH firmware encounters a fatal exception, it resets and sends
EC_HOST_EVENT_PANIC over the ISHTP MKBP channel. Register an
event_notifier callback in cros_ec_ishtp to log the panic, invoke the
panic_notifier chain, and emit an ERROR=PANIC uevent so userspace crash
collectors can capture the panic dump and handle recovery.

Signed-off-by: Scott Collyer <scollyer@google.com>
---
Changes in v3:
- Use ec_dev->dev in cros_ec_ishtp_event() and drop the client_data lookup.
- Register the event_notifier before calling cros_ec_register() so pending
  events dispatched during registration are not missed.

Changes in v2:
- Move EC_HOST_EVENT_PANIC handling from cros_ec.c into an event_notifier
  in cros_ec_ishtp.c as suggested by Tzung-Bi Shih.
- Drop kernel_restart() and instead invoke panic_notifier and emit an
  ERROR=PANIC uevent so userspace can collect the crash and handle
  recovery without forcing a kernel reboot.

 drivers/platform/chrome/cros_ec_ishtp.c | 43 ++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_ishtp.c b/drivers/platform/chrome/cros_ec_ishtp.c
index 3766cef81fe8..d3a00dc6924e 100644
--- a/drivers/platform/chrome/cros_ec_ishtp.c
+++ b/drivers/platform/chrome/cros_ec_ishtp.c
@@ -8,7 +8,9 @@
 // (ISH-TP).
 
 #include <linux/delay.h>
+#include <linux/kobject.h>
 #include <linux/module.h>
+#include <linux/notifier.h>
 #include <linux/pci.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
@@ -117,6 +119,7 @@ struct response_info {
  * @work_ishtp_reset: Work queue reset handling.
  * @work_ec_evt: Work queue for EC events.
  * @ec_dev: CrOS EC MFD device.
+ * @notifier: Notifier block for CrOS EC events.
  *
  * This structure is used to store per client data.
  */
@@ -133,6 +136,7 @@ struct ishtp_cl_data {
 	struct work_struct work_ishtp_reset;
 	struct work_struct work_ec_evt;
 	struct cros_ec_device *ec_dev;
+	struct notifier_block notifier;
 };
 
 /**
@@ -538,10 +542,30 @@ static int cros_ec_pkt_xfer_ish(struct cros_ec_device *ec_dev,
 	return rv;
 }
 
+static int cros_ec_ishtp_event(struct notifier_block *nb,
+			       unsigned long queued_during_suspend,
+			       void *data)
+{
+	struct cros_ec_device *ec_dev = data;
+	u32 host_event = cros_ec_get_host_event(ec_dev);
+
+	if (host_event & EC_HOST_EVENT_MASK(EC_HOST_EVENT_PANIC)) {
+		static const char * const panic_env[] = { "ERROR=PANIC", NULL };
+
+		dev_emerg(ec_dev->dev, "CrOS ISH Panic Reported\n");
+		blocking_notifier_call_chain(&ec_dev->panic_notifier, 0, ec_dev);
+		kobject_uevent_env(&ec_dev->dev->kobj, KOBJ_CHANGE, (char **)panic_env);
+		return NOTIFY_OK;
+	}
+
+	return NOTIFY_DONE;
+}
+
 static int cros_ec_dev_init(struct ishtp_cl_data *client_data)
 {
 	struct cros_ec_device *ec_dev;
 	struct device *dev = cl_data_to_dev(client_data);
+	int rv;
 
 	ec_dev = cros_ec_device_alloc(dev);
 	if (!ec_dev)
@@ -555,7 +579,22 @@ static int cros_ec_dev_init(struct ishtp_cl_data *client_data)
 	ec_dev->pkt_xfer = cros_ec_pkt_xfer_ish;
 	ec_dev->phys_name = dev_name(dev);
 
-	return cros_ec_register(ec_dev);
+	client_data->notifier.notifier_call = cros_ec_ishtp_event;
+	rv = blocking_notifier_chain_register(&ec_dev->event_notifier,
+					      &client_data->notifier);
+	if (rv) {
+		dev_warn(dev, "failed to setup event notifier: %d\n", rv);
+		return rv;
+	}
+
+	rv = cros_ec_register(ec_dev);
+	if (rv) {
+		blocking_notifier_chain_unregister(&ec_dev->event_notifier,
+						   &client_data->notifier);
+		return rv;
+	}
+
+	return 0;
 }
 
 static void reset_handler(struct work_struct *work)
@@ -665,6 +704,8 @@ static void cros_ec_ishtp_remove(struct ishtp_cl_device *cl_device)
 	struct ishtp_cl	*cros_ish_cl = ishtp_get_drvdata(cl_device);
 	struct ishtp_cl_data *client_data = ishtp_get_client_data(cros_ish_cl);
 
+	blocking_notifier_chain_unregister(&client_data->ec_dev->event_notifier,
+					   &client_data->notifier);
 	cancel_work_sync(&client_data->work_ishtp_reset);
 	cancel_work_sync(&client_data->work_ec_evt);
 	cros_ec_unregister(client_data->ec_dev);
-- 
2.56.0.317.g454f8302e1-goog

