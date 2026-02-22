Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F366D347C7
	for <chrome-platform@lists.linux.dev>; Sun, 22 Feb 2026 00:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771720647; cv=none; b=FBSjbQJS/EtDdivXfF1ZBVOQBELZ8cFBEfL4hbmCvQ6pyVo0Tw5dTDAnBUtK35ZjmHITaUtz92ZiSm8JpZJk8ktUUStNfaphvGZ+G5HoP6wAiwGwE80xH0uITXHBV7X9BS5qjyAQktjzUWqDvabcMIPz4KPDh5pZ3i8o7diuKb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771720647; c=relaxed/simple;
	bh=hLvjMkh6hXEkiLWKyvozmQcSnbRn+eBjFoiwAf52Zm8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SIB7DlQ/xRtVfVn7H7rYX6GWRby3OdF94/rNDk4gS9YQW2cHsbZZyMUHagKxdIIR+DzuHAaAytJmuCPUzLqJ2FypPdQsrBPYS6LQQFGvnNYWst9zsXuJv+8wfBfQc6z3CbN6hysYkdqYOjm0/8gH1ZQaCiCgpUY/GEGKYWEkNGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8ha2Izr; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8ha2Izr"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b6b0500e06so3953233eec.1
        for <chrome-platform@lists.linux.dev>; Sat, 21 Feb 2026 16:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771720644; x=1772325444; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D9VQyZPUVBKtquLyDlkewfzJ1/s13aoNaQBA0/wQfDo=;
        b=k8ha2IzrtZvmlE1XCq0blIDQTfy9auzI09VeDz32hht8Inr1HReawb/Z1O6FEA3yCk
         9enVaViAzB7aZreNiD+vKiJ20tqcCSfM4VgeYgdiscHY6MUu33B6HVH6ff8z+/OYHqUQ
         sPr+kSi7Cvs2jlKh/FuI8y9Pyp9AB/R3OCs8zM9wLM/nd8zgadwHU8878GtXbTWqM0x8
         PXG5RBRiqIAqBQkMgGxidXZRyxO28PHDx4sbBDFWKojgjP9LtSX/XOD9P60E4xHWfyog
         StM1ryzIDZHlhRSYRqZ0atzDv9nRcvQxg4p1ghqrYnka+z5tZnyXycYwfzBinzbxCcZq
         lT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771720644; x=1772325444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9VQyZPUVBKtquLyDlkewfzJ1/s13aoNaQBA0/wQfDo=;
        b=rWXJhMXewDuYl5e5uH2q4PNMlZ+KK1RXJdJAxjb0bK6Pui+7nnIp8Y4yYzHEDsp9tu
         2Qv4e1NHzZBvy4jp4yqNWIKanwymm1VTO77NVnGTXnEhmi1wRrbgjy3UFsqc5FM8YhpJ
         vJFVI9D9noM1/ggA35W/1CLnkllUduFTx4pTrMG83GT0eHCCrwm+GoLFXo8uGg0tNYWb
         bnJznnuma4dTbSbaEdrHlu4K4hBvoydntHesABlLtRz0xFe534aND5ODOQm0TI4pidP5
         bq8bKUbRFG1GtGRrBN3Ygk1TmDWRIpJeB/vm0V+01lHbKniRoP0ZpNM6ff+Six5nZw0h
         0EeA==
X-Forwarded-Encrypted: i=1; AJvYcCXT+CXpGDHxgX7XnQcFNFhU8tCyszhY4CxQsbYj21O5khKk1ai5TzvWRUD5MwurBxbr0rD5Xbg2k/vim0Vb+7M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0eR//wLfyXs/laBBB7Wru8skKzpGd20JsH73q5mQMqt2/tqv/
	HtuEP6+Z1QP4Gnq1MVsSWkY6cM6Vmx3aCiMIGfTboownvG/Y3Qd1Hz0C
X-Gm-Gg: AZuq6aJV6/xkWo59OVkLGt0A1dK5nX874PJ90gZTyybLX1eNLwzL3IkF5B8Syp4r4eg
	vavu9kiLidPdost64miSOuhW0369+f23gaxmRW2rBQ29Qwd44uaR7S/V6bGaGGb7I2sAX/kndMX
	o7dU7LuU7L5h3pEo8OeIsbUVdTWMQureW1lDbt0DOLDKPN/laYsGHBssbGVgfV2MbjBf38vLRXs
	OyTgmxoGiqVxC6ajVu6OVRR6O2pcWEnBeeWNXd+hwdAwfkMple1YGyNFGwug+6W0WoOnYT72JHE
	Nv3yEnRt7NDHjcFYZKWUh7cEWK/GNei2bAkzy/yy0M5jSbzwHbemH3DiFzg7adJe9z/gXiIp73I
	ZNjwTSloOQ01hN/+WS7ag/9NZaHJbFqSswVmeJmGncGg2Y2xzxTxLsPVvKKvdPfsUHtB1awChta
	OQeG6Jx63ClfYCne/3tk4k13Rl4KaAqsnwgXx9ZyTzWkUeD+W3x5/QO+JRFT+HCqQ/Xip64hi2S
	jI4nq86PwqKqw==
X-Received: by 2002:a05:7300:fb81:b0:2b8:2910:dc9b with SMTP id 5a478bee46e88-2bd7b9f2a6dmr1800752eec.3.1771720643913;
        Sat, 21 Feb 2026 16:37:23 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:73d:b075:516c:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dc167d3sm2383191eec.24.2026.02.21.16.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 16:37:23 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Fabio Baltieri <fabiobaltieri@chromium.org>,
	Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] Input: export input_default_setkeycode
Date: Sat, 21 Feb 2026 16:37:09 -0800
Message-ID: <20260222003717.471977-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.53.0.345.g96ddfc5eaa-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Baltieri <fabiobaltieri@chromium.org>

Export input_default_setkeycode so that a driver can set a custom
setkeycode handler to take some driver specific action but still call
the default handler at some point.

Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
Link: https://patch.msgid.link/20260211173421.1206478-2-fabiobaltieri@chromium.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/input.c | 23 ++++++++++++++++++++---
 include/linux/input.h |  4 ++++
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index ceb134044175..9336980ee320 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -861,14 +861,30 @@ static int input_default_getkeycode(struct input_dev *dev,
 	return 0;
 }
 
-static int input_default_setkeycode(struct input_dev *dev,
-				    const struct input_keymap_entry *ke,
-				    unsigned int *old_keycode)
+/**
+ * input_default_setkeycode - default setkeycode method
+ * @dev: input device which keymap is being updated.
+ * @ke: new keymap entry.
+ * @old_keycode: pointer to the location where old keycode should be stored.
+ *
+ * This function is the default implementation of &input_dev.setkeycode()
+ * method. It is typically used when a driver does not provide its own
+ * implementation, but it is also exported so drivers can extend it.
+ *
+ * The function must be called with &input_dev.event_lock held.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int input_default_setkeycode(struct input_dev *dev,
+			     const struct input_keymap_entry *ke,
+			     unsigned int *old_keycode)
 {
 	unsigned int index;
 	int error;
 	int i;
 
+	lockdep_assert_held(&dev->event_lock);
+
 	if (!dev->keycodesize)
 		return -EINVAL;
 
@@ -922,6 +938,7 @@ static int input_default_setkeycode(struct input_dev *dev,
 	__set_bit(ke->keycode, dev->keybit);
 	return 0;
 }
+EXPORT_SYMBOL(input_default_setkeycode);
 
 /**
  * input_get_keycode - retrieve keycode currently mapped to a given scancode
diff --git a/include/linux/input.h b/include/linux/input.h
index 7d7cb0593a63..06ca62328db1 100644
--- a/include/linux/input.h
+++ b/include/linux/input.h
@@ -517,6 +517,10 @@ INPUT_GENERATE_ABS_ACCESSORS(res, resolution)
 int input_scancode_to_scalar(const struct input_keymap_entry *ke,
 			     unsigned int *scancode);
 
+int input_default_setkeycode(struct input_dev *dev,
+			     const struct input_keymap_entry *ke,
+			     unsigned int *old_keycode);
+
 int input_get_keycode(struct input_dev *dev, struct input_keymap_entry *ke);
 int input_set_keycode(struct input_dev *dev,
 		      const struct input_keymap_entry *ke);
-- 
2.53.0.345.g96ddfc5eaa-goog

