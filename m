Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC022750FB
	for <chrome-platform@lists.linux.dev>; Wed, 31 Dec 2025 14:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767191749; cv=none; b=qMEBKpUfj9uGc/hXaVMqRBhQBVzKLR0XHpu82l1gSi2Hx7hiFMKKP73l0otLuxnlnOcD6mXB5HZz0OQ+DIxHD6P/Q1dDo+Ytj+43dDS50j2kfXxjVPNrjU4fYh98BYSO9XjKUflzOo1MrDpWVQgaQVY8+axAqxe5j49dnPGx4lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767191749; c=relaxed/simple;
	bh=O9+tUzr9uyN79tAtBKwl7ESmge84gPW0hNkQZxKq8CY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uwFOyEADiZo97HRxPhjXYOuezp7zVTy5c6L8CVMiwKPCnegruAKwra6jbOdDHD3ORmxRk0M8RSlFWXDhhfC0A3OMgcbcnYYYHlHpCJnl6tjNW4PZpFc9GzuSjarypBzt5geiRcwLGY0g4zz/4nDuRMqeAKlbytWgMA08jrD4Zpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e8UDfAcs; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e8UDfAcs"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso67807175e9.1
        for <chrome-platform@lists.linux.dev>; Wed, 31 Dec 2025 06:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767191746; x=1767796546; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvGLfgzU/Nu7QjgFI0e6yZbyhUHf+uCJkmxPNiQDL2c=;
        b=e8UDfAcsrJ6ldbCJR2fgJOjNxufk0CJnc9sCDPadjDmaqrOx+EEvc/FQX1ugHCMByp
         XwhmqbEIBI2nXmZsa+jXA1YxrS3fjHkJZiyUPr2OtJFYpAwfbemVI5zmiCYxdqbuESyN
         cQiQYC6UKiEmdrz4ilWEZf8QWIo+WpEh7dhFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767191746; x=1767796546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XvGLfgzU/Nu7QjgFI0e6yZbyhUHf+uCJkmxPNiQDL2c=;
        b=SzQzFO/Iofkz2X17mWIKxp7qWUpvgvIDJFgfHBM4qressy4G5eF+b82fWQW+bQQZlY
         +NBSkMFk7CpXCriBQYC2eIL1fRMnFaYz8ywoAJ+l4LwiWeEOyVLCf1Dub8jSNUq8FJvS
         WEsGf9qHvT95Z3Kljv9ScVgJklYtdqHsonVKeWyu90XOQwHF6c1Z/lodnpi9u1pRVUc2
         VhB3k+U39EBMJGuAGYIOfEw93hRN3mcHb5dLZl1NI/nRCsRPq7BMPsPvOwOal3VVS9T+
         plOwfoiDcWS4fo6kykzY88jK5k1YjNLui2+y0BI1AvmQbA3YyQzpCvV5ZhY0gzpmwUFO
         XLEg==
X-Forwarded-Encrypted: i=1; AJvYcCVYjwC8Aa8EqAkSaX81jgUG3iRVYdWNF+Zk1zFKobNM65UodFa9bV+Tb5lCbG4F7loICDHx4NwYGyOFoDTJjV0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSqw6XERUVEeQGI+1hcMIueTSfpD12cNL64F81WJEsjSSNpF9i
	1yIky7NMXfeqMlwcE+LNfOQ1qwrAKGQWuAj0YNb9wRu1ohQbo3lQRHTCb9nIVRokgQ==
X-Gm-Gg: AY/fxX5bIKmLeSs9qBP67p4mDgygm4b2f5YTSPQM5VU4jIR0FrYM6NuuA5YBdYYlzOW
	Ho1rqItkl5MhkLw2b7ZZZmzvdjetHJ97S8sL0DTKeKYcc1Zk+HrSEso5u2Q4Zpc+9gf4by4fyZr
	1LKXSi0QYy1KAMm8H1M/GDAelgkfJ5WlTgxJwgU8QEVFlS4rVmnfELvIBVJ+8BoEFregoZh918q
	ifrTM9raEdNGF0EGuxos+i8m18NQdkSmvMI9M5mrqiAn3sPwl8pguxhfrVBXsGSeFteN76aIUA2
	BPcjl2Dw6tU3YnQCIHvTfoQqnlIcEmlhWQPJ/EbK5bOcgiWyqZsTZlNQeC0souu+A5YUzy8q6sU
	izT/cMrw928Fl4Lt/BUmLnYo5Cfso+0fV0oVdetHlBktwTaPAFERQEanXD+h11ycXfSUKm+QE/M
	AvgUx+5PZCBwaGrcs=
X-Google-Smtp-Source: AGHT+IHvR+cy7a7pyZUdGh+DjWUEBxNKW4LqjmW8R2bBcuhZXgZlkJueqcwfNCjJuqSQO+WmZPKOQg==
X-Received: by 2002:a05:600c:4fc6:b0:477:333a:f71f with SMTP id 5b1f17b1804b1-47d19576cc6mr425787465e9.17.1767191745659;
        Wed, 31 Dec 2025 06:35:45 -0800 (PST)
Received: from balto-ws ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4e91sm630300935e9.13.2025.12.31.06.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 06:35:45 -0800 (PST)
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Fabio Baltieri <fabiobaltieri@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] Input: cros_ec_keyb - add function key support
Date: Wed, 31 Dec 2025 14:35:38 +0000
Message-ID: <20251231143538.37483-3-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
In-Reply-To: <20251231143538.37483-1-fabiobaltieri@chromium.org>
References: <20251231143538.37483-1-fabiobaltieri@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for handling an Fn button and sending separate keycodes for
a subset of keys in the matrix defined in the upper half of the keymap.

Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
Reviewed-by: Simon Glass <sjg@chromium.org>
---
 drivers/input/keyboard/cros_ec_keyb.c | 136 +++++++++++++++++++++++---
 1 file changed, 120 insertions(+), 16 deletions(-)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 1c6b0461dc35..bc76f61583c3 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -29,6 +29,11 @@
 
 #include <linux/unaligned.h>
 
+/* Maximum size of the normal key matrix, this is limited by the host command
+ * key_matrix field defined in ec_response_get_next_data_v3
+ */
+#define CROS_EC_KEYBOARD_COLS_MAX 18
+
 /**
  * struct cros_ec_keyb - Structure representing EC keyboard device
  *
@@ -44,6 +49,11 @@
  * @bs_idev: The input device for non-matrix buttons and switches (or NULL).
  * @notifier: interrupt event notifier for transport devices
  * @vdata: vivaldi function row data
+ * @has_fn_map: whether the driver use an fn function map layer
+ * @normal_key_status: active normal keys map
+ * @fn_key_status: active function keys map
+ * @fn_key_pressed: tracks the function key status
+ * @fn_key_triggered: tracks where any function key fired
  */
 struct cros_ec_keyb {
 	unsigned int rows;
@@ -61,6 +71,12 @@ struct cros_ec_keyb {
 	struct notifier_block notifier;
 
 	struct vivaldi_data vdata;
+
+	bool has_fn_map;
+	u8 normal_key_status[CROS_EC_KEYBOARD_COLS_MAX];
+	u8 fn_key_status[CROS_EC_KEYBOARD_COLS_MAX];
+	bool fn_key_pressed;
+	bool fn_key_triggered;
 };
 
 /**
@@ -166,16 +182,100 @@ static bool cros_ec_keyb_has_ghosting(struct cros_ec_keyb *ckdev, uint8_t *buf)
 	return false;
 }
 
+/*
+ * Process a function key state change, send an event report if appropriate.
+ */
+static void cros_ec_keyb_process_fn_key(struct cros_ec_keyb *ckdev,
+					int row, int col, bool state)
+{
+	struct input_dev *idev = ckdev->idev;
+	int pos = MATRIX_SCAN_CODE(row, col, ckdev->row_shift);
+
+	ckdev->fn_key_pressed = state;
+
+	if (state) {
+		ckdev->fn_key_triggered = false;
+	} else if (!ckdev->fn_key_triggered) {
+		/*
+		 * Send the original code if nothing else has been pressed
+		 * together with Fn.
+		 */
+		input_event(idev, EV_MSC, MSC_SCAN, pos);
+		input_report_key(idev, KEY_FN, true);
+		input_sync(idev);
+
+		input_event(idev, EV_MSC, MSC_SCAN, pos);
+		input_report_key(idev, KEY_FN, false);
+	}
+}
+
+/*
+ * Return the Fn code for a normal key row, col combination.
+ */
+static unsigned int cros_ec_keyb_fn_code(struct cros_ec_keyb *ckdev,
+					 int row, int col)
+{
+	struct input_dev *idev = ckdev->idev;
+	const unsigned short *keycodes = idev->keycode;
+	int pos = MATRIX_SCAN_CODE(row + ckdev->rows, col, ckdev->row_shift);
+
+	return keycodes[pos];
+}
+
+/*
+ * Process the new state for a single key.
+ */
+static void cros_ec_keyb_process_one(struct cros_ec_keyb *ckdev,
+				     int row, int col, bool state)
+{
+	struct input_dev *idev = ckdev->idev;
+	const unsigned short *keycodes = idev->keycode;
+	int pos = MATRIX_SCAN_CODE(row, col, ckdev->row_shift);
+	unsigned int code = keycodes[pos];
+
+	dev_dbg(ckdev->dev, "changed: [r%d c%d]: byte %02x\n", row, col, state);
+
+	if (ckdev->has_fn_map) {
+		if (code == KEY_FN)
+			return cros_ec_keyb_process_fn_key(ckdev, row, col, state);
+
+		if (!state) {
+			if (ckdev->fn_key_status[col] & BIT(row)) {
+				code = cros_ec_keyb_fn_code(ckdev, row, col);
+
+				ckdev->fn_key_status[col] &= ~BIT(row);
+			} else if (ckdev->normal_key_status[col] & BIT(row)) {
+				ckdev->normal_key_status[col] &= ~BIT(row);
+			} else {
+				/* Discard, key press code was not sent */
+				return;
+			}
+		} else if (ckdev->fn_key_pressed) {
+			code = cros_ec_keyb_fn_code(ckdev, row, col);
+
+			ckdev->fn_key_triggered = true;
+
+			if (!code)
+				return;
+
+			ckdev->fn_key_status[col] |= BIT(row);
+		} else {
+			ckdev->normal_key_status[col] |= BIT(row);
+		}
+	}
+
+	input_event(idev, EV_MSC, MSC_SCAN, pos);
+	input_report_key(idev, code, state);
+}
 
 /*
  * Compares the new keyboard state to the old one and produces key
- * press/release events accordingly.  The keyboard state is 13 bytes (one byte
- * per column)
+ * press/release events accordingly.  The keyboard state is one byte
+ * per column.
  */
 static void cros_ec_keyb_process(struct cros_ec_keyb *ckdev,
 			 uint8_t *kb_state, int len)
 {
-	struct input_dev *idev = ckdev->idev;
 	int col, row;
 	int new_state;
 	int old_state;
@@ -192,20 +292,13 @@ static void cros_ec_keyb_process(struct cros_ec_keyb *ckdev,
 
 	for (col = 0; col < ckdev->cols; col++) {
 		for (row = 0; row < ckdev->rows; row++) {
-			int pos = MATRIX_SCAN_CODE(row, col, ckdev->row_shift);
-			const unsigned short *keycodes = idev->keycode;
-
 			new_state = kb_state[col] & (1 << row);
 			old_state = ckdev->old_kb_state[col] & (1 << row);
-			if (new_state != old_state) {
-				dev_dbg(ckdev->dev,
-					"changed: [r%d c%d]: byte %02x\n",
-					row, col, new_state);
-
-				input_event(idev, EV_MSC, MSC_SCAN, pos);
-				input_report_key(idev, keycodes[pos],
-						 new_state);
-			}
+
+			if (new_state == old_state)
+				continue;
+
+			cros_ec_keyb_process_one(ckdev, row, col, new_state);
 		}
 		ckdev->old_kb_state[col] = kb_state[col];
 	}
@@ -597,12 +690,19 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	struct device *dev = ckdev->dev;
 	struct input_dev *idev;
 	const char *phys;
+	unsigned int rows_keymap;
 	int err;
 
 	err = matrix_keypad_parse_properties(dev, &ckdev->rows, &ckdev->cols);
 	if (err)
 		return err;
 
+	if (ckdev->cols > CROS_EC_KEYBOARD_COLS_MAX) {
+		dev_err(dev, "keypad,num-columns too large: %d (max: %d)\n",
+			ckdev->cols, CROS_EC_KEYBOARD_COLS_MAX);
+		return -EINVAL;
+	}
+
 	ckdev->valid_keys = devm_kzalloc(dev, ckdev->cols, GFP_KERNEL);
 	if (!ckdev->valid_keys)
 		return -ENOMEM;
@@ -635,7 +735,11 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	ckdev->ghost_filter = device_property_read_bool(dev,
 					"google,needs-ghost-filter");
 
-	err = matrix_keypad_build_keymap(NULL, NULL, ckdev->rows, ckdev->cols,
+	ckdev->has_fn_map = device_property_read_bool(dev, "google,has-fn-map");
+
+	rows_keymap = ckdev->has_fn_map ? ckdev->rows * 2 : ckdev->rows;
+
+	err = matrix_keypad_build_keymap(NULL, NULL, rows_keymap, ckdev->cols,
 					 NULL, idev);
 	if (err) {
 		dev_err(dev, "cannot build key matrix\n");
-- 
2.52.0.351.gbe84eed79e-goog

