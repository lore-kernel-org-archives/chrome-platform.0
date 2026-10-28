Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793225058;
	b=AUSTmLLzvwA4n28jtfpoY308G/JTeomro0Bi3tPofOcL0qzoLS6E+BU2PkYuhJ5UN080
	 r+b9R3EZR3KEGDY9PooBGwOCJWwxGrxDVHO/syTZMJCMmBLqHYgFhvroSnTHvmwCbRNkK
	 GDixwNGQYk8DuAhpP2pNm4zGVyjElbkI3E8lKWfNTeHOWfE0klLyzf82jPf7EjyCJY+cs
	 eC6gXVcKUrz8n9aIUb92J1lLDa1klVw52SPtLXuFCOI62gtWSqIMfRDDO9G+Lx8oIhqDn
	 Nc91CwQL6hTE724NvslO85zxAQch00RR/CSv1RqAXdEVbGUel/2sbZo5wikYLQ1mqVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793225058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=VSCUoby7xP25HrykDh9HQieAyhcppxVPR0g487OArfo=;
	b=FpFqrOhiibKmADVYZxu1MULtXH0ap6polhy+1rpnALvc+J0ToI1SbmlBcKBQM3srd6mN
	 yxTY7a8rkXTjDyfGICHfgSMuxK7emUWBY2NjI6V87O4Ete8245GiLfSTttYvCmb6/h3Kn
	 pGfSnTri9NJhVIsioRXZ8IW+4gZXtcU2SJDVNyxPeBEgP5nD1AL4ElrWqRz8NaUC62JYy
	 oWQfQR8B763rINeJhBlIs4bO4Y7HBVAgPzCuWYqkVlb+VExwmzOkMYpZRMoN/gmg+Ckag
	 /zj7UlgvSmPmBH1ojD0qcFNtWXXi2ssg04o4HdK1jIO4/D4k9vqO3TlxhMyXS4jzeww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--scollyer.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ah71bDng;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1389606A31A
	for <chrome-platform@lists.linux.dev>; Wed, 28 Oct 2026 22:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1389606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--scollyer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ah71bDng
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso225800eec.0
        for <chrome-platform@lists.linux.dev>; Wed, 28 Oct 2026 15:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793225057; x=1793829857; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VSCUoby7xP25HrykDh9HQieAyhcppxVPR0g487OArfo=;
        b=Ah71bDngNTYh6lLxSIJDqJne4EMyMPCs+UoC1ld2TfAoIst7JNLVmH371JgrT/ST9e
         +1ugmPd4547HzyChA5ibc7S+CRZqKG10ymWGGuUMRwHUkpbnKVNAZMW128Zr0bERzNJP
         mn0qk6E9I89U32Sn00N5H4FKKg8iKtG2m0rjxn7HBMEZ8M38HUVhV2i+9FbQGKYLqept
         SzQZU2V40fb8Aht5PbtQs1x3yrNHlOYytdUUOOYpZ52qHpsSD6RZbsYv7FYci5FmolNr
         ypm/mPHV3DjISDlb8LuqtSlKX3DX8xNkiul+1DOdc3lBPnCZMYmrP49X2S+1dZ1Nbrsi
         YWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793225057; x=1793829857;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSCUoby7xP25HrykDh9HQieAyhcppxVPR0g487OArfo=;
        b=KB4ISvzIXBq2VcmOb3tQZySH/3iBMN1Ch8Ws8xTHh5PRPZpxA4/eTOmN/x2UDO1LlQ
         nWj0FrdcL2Okoct6wSwKYcgZoLYQM1naEWW7/+Fq5D4R00RwQQrbbi+277hoWCbW5YgX
         eyE72myUE8DBx1LL1F+ps/+iIHZnQmNopdjlrN0RhftL4vU6iM0S2M8ATZrk5Z+Tah6h
         8SkV8Ov+t1TYsbqNUrk8H3oeHlicoAdZpwfk3aYhmFPQg63pxazXy4n0rEzdaocpKZ5i
         X4bjuOVC0o2Khac3w8M/vl96HXXrcbjW+Ks7UKST8oVLUZcJn46naeU7vT2f9ZHB2Ew4
         l6Zg==
X-Forwarded-Encrypted: i=1; AKwUvBwmvI4+q+1D/sYLVZc0G2VNlDZn4h4SOeXdjNjOqEJWNqJYWTjTGJbmoOxXqjQSFkdz/74q1lHFUMqOhJi3Y7g=@lists.linux.dev
X-Gm-Message-State: AFq9FYKbBhpvWRWeYsHJLbY4Aa69YRBfxpmwYiWu7/EBv+VBk7XO/BOP
	XVs28Ki9MbsfvwByFgPZLb8fyChikY2kJ2iHFfJ5UzuZwSz/dUGoS3hksGpXeKsLY+yhlhXSRzQ
	Q/WZJ3ibsF9eqIw==
X-Received: from dlf41.prod.google.com ([2002:a05:7022:429:b0:164:47f8:a96a])
 (user=scollyer job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:2083:10b0:17a:a3d4:8b17 with SMTP id a92af1059eb24-1a944179045mr1067825c88.12.1793225056530;
 Wed, 28 Oct 2026 15:04:16 -0700 (PDT)
Date: Wed, 28 Oct 2026 15:04:14 -0700
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261028220414.1414481-1-scollyer@google.com>
Subject: [PATCH v2] platform/chrome: cros_ec_ishtp: report EC_HOST_EVENT_PANIC
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
Changes in v2:
- Move EC_HOST_EVENT_PANIC handling from cros_ec.c into an event_notifier
  in cros_ec_ishtp.c as suggested by Tzung-Bi Shih.
- Drop kernel_restart() and instead invoke panic_notifier and emit an
  ERROR=PANIC uevent so userspace can collect the crash and handle
  recovery without forcing a kernel reboot.

 drivers/platform/chrome/cros_ec_ishtp.c | 43 ++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_ishtp.c b/drivers/platform/chrome/cros_ec_ishtp.c
index 3766cef81fe8..ea7d4c61ffc2 100644
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
@@ -538,10 +542,32 @@ static int cros_ec_pkt_xfer_ish(struct cros_ec_device *ec_dev,
 	return rv;
 }
 
+static int cros_ec_ishtp_event(struct notifier_block *nb,
+			       unsigned long queued_during_suspend,
+			       void *data)
+{
+	struct ishtp_cl_data *client_data =
+		container_of(nb, struct ishtp_cl_data, notifier);
+	struct cros_ec_device *ec_dev = data;
+	u32 host_event = cros_ec_get_host_event(ec_dev);
+
+	if (host_event & EC_HOST_EVENT_MASK(EC_HOST_EVENT_PANIC)) {
+		static const char * const panic_env[] = { "ERROR=PANIC", NULL };
+
+		dev_emerg(cl_data_to_dev(client_data), "CrOS ISH Panic Reported\n");
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
@@ -555,7 +581,20 @@ static int cros_ec_dev_init(struct ishtp_cl_data *client_data)
 	ec_dev->pkt_xfer = cros_ec_pkt_xfer_ish;
 	ec_dev->phys_name = dev_name(dev);
 
-	return cros_ec_register(ec_dev);
+	rv = cros_ec_register(ec_dev);
+	if (rv)
+		return rv;
+
+	client_data->notifier.notifier_call = cros_ec_ishtp_event;
+	rv = blocking_notifier_chain_register(&ec_dev->event_notifier,
+					      &client_data->notifier);
+	if (rv) {
+		dev_warn(dev, "failed to setup event notifier: %d\n", rv);
+		cros_ec_unregister(ec_dev);
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
2.56.0.313.g2479322e68-goog
