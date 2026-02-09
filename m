Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA20837FF73
	for <chrome-platform@lists.linux.dev>; Mon,  9 Feb 2026 15:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770652293; cv=none; b=DtEgaMdUAyPMAq/hoQ7pBk2tkrIPe20oQYsJadAxOE9s5m6Zu6hiy80nIu7/ONCKzIVSeu38y5joSBic5B/Bpu3wr+X2yw37Oaq13XqZUtMOcnibGw2W2Gf4DoW//DE5cupMEHSGPCDa12xpec4wYb/X5iQG1iv/lisekT0h6ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770652293; c=relaxed/simple;
	bh=ZO9cUQryCpH6PJYir0nq665tykkoM1zKVnJWClAzMcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q42zfpiN1C1GK0AO/+c181Rdtxqq/NWcc8Y0DAgwjarMI7MjyO+vvALowVr2kYyhWaYG/9B/DQmLKkBlQ/f1vHapPo9RLCo6lWMm/Z/f4TlKCXFBpBb/UmtDnpaqn2KMWhI+mrkevh3XhjVXWoGbRVSDkJ1/qmtWFTiZyCSnrkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k2Dpv612; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k2Dpv612"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-483487335c2so5584445e9.2
        for <chrome-platform@lists.linux.dev>; Mon, 09 Feb 2026 07:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770652291; x=1771257091; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+icTVFVT5ydEiDM14pFQOsLqB2MXILYZm42sz+o1Ids=;
        b=k2Dpv612agCuBYPtI8n5YFAeJAqY9RGPnBN4HF+OsA6545lENxUtRHIxTsPjTUqPFB
         3FgUq7LzG5Q2Yjl1SOuEZh8bdiRPRzCZMZfI1ucQ2xVuR6skschcbJprvRHruxK3+aSF
         jNzE9x72qc+UHQyTcFdjMqoUnVSm3zc4voP9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770652291; x=1771257091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+icTVFVT5ydEiDM14pFQOsLqB2MXILYZm42sz+o1Ids=;
        b=GmmzGfLy9dOUDKM20wEDWaRlEDNWM75mxJBRtPcppn8W2gXECkULrRcbmWYl+U/VEe
         IiBO9RmDZLgMPXdZRljjz0I0PMPFsJSkFnAjqEPo5wtnnkmXF7H9PPgMKpxjQ4uZ4Ad2
         3ihv7o2ZU2mAlvWbGw/uyTTOSzPTskMD/Z20mB4LMu0FQchR+BN5ZjkaoCKzAQIDSZNr
         nTj2oo2ase3COMtyj4F4qEZWUddJKo+kfK/HJFhBayYG1o4pXBVoCkZca6zxkQXayZMf
         lC2ROrH0ZekQWKKPlY0EiLTQoPGSkvqw6vJ4zbsrT6DvokPoOC9dQ1rif4oIwI4coLQi
         wRSw==
X-Forwarded-Encrypted: i=1; AJvYcCUb2bXB6YekZG0R2ddxGpvn8PjJ+GLZrHQBmxJfR/rfCW9U3BV9jN72+B8ZZDjjDeI2UW0XLrlCwh89FPzKvaE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyKfkjTpBWcQtXwHRRTqmjuPihAs5v0VwN0Zsp1kbTapcxOtfFc
	qxuLZMc0ZXMBn5sB+4CrPVSfId9MkdFY1oaRhUiGO9CZ4/1cPUsmE5PKnlPgL7xd9w==
X-Gm-Gg: AZuq6aIuE6u1rK5Vi07d/sQb3f2OT+ZS9hBMruhePtKQIDA6FujzYxDtQ2j6AqGvBAm
	+DAdpR+uWIf77bjKXQJZ46c+qjzfcJIpNMMdcFmEfncNGEcpIngkN7AmiC5ITY/x/AXJCy6exIv
	AVAb/IhVSwxodvi1i6m9Srluj0RzzLewbZDdVqnU8XppI445scL118GyBR2Y1A8JW9PULi5mU3R
	+ZJTq0EaCva3Tt4qwzZ097xSBXfUJj2fEMusd9IxeiEYlFfQLx6rvFS18aJDv8kn93ZlHTbeByj
	LsdycnofKx2747TMUuAxJOr4apWEBv5ZglLmhAOFATWeHo69vi5oNRX/PAC8zm8D+KJHvz36eDr
	hD1J1lhePEPY2BnRUmOQjY5U3PvJamBs2T7KRPdAMVVZGAJRxCC1fQknnACrmX6DOHlhczbPuZp
	HeFYQ+mgo+ajjiiVw=
X-Received: by 2002:a05:600c:1388:b0:483:a21:774c with SMTP id 5b1f17b1804b1-4832097808dmr166958595e9.25.1770652291271;
        Mon, 09 Feb 2026 07:51:31 -0800 (PST)
Received: from balto-ws ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d7a924sm501929835e9.10.2026.02.09.07.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 07:51:30 -0800 (PST)
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Fabio Baltieri <fabiobaltieri@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/1] Input: cros_ec_keyb - add function key support
Date: Mon,  9 Feb 2026 15:51:27 +0000
Message-ID: <20260209155127.158813-2-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
In-Reply-To: <20260209155127.158813-1-fabiobaltieri@chromium.org>
References: <20260209155127.158813-1-fabiobaltieri@chromium.org>
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
 drivers/input/keyboard/cros_ec_keyb.c | 167 +++++++++++++++++++++++---
 1 file changed, 151 insertions(+), 16 deletions(-)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 1c6b0461dc35..cda56270cac8 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -29,6 +29,12 @@
 
 #include <linux/unaligned.h>
 
+/*
+ * Maximum size of the normal key matrix, this is limited by the host command
+ * key_matrix field defined in ec_response_get_next_data_v3
+ */
+#define CROS_EC_KEYBOARD_COLS_MAX 18
+
 /**
  * struct cros_ec_keyb - Structure representing EC keyboard device
  *
@@ -44,6 +50,9 @@
  * @bs_idev: The input device for non-matrix buttons and switches (or NULL).
  * @notifier: interrupt event notifier for transport devices
  * @vdata: vivaldi function row data
+ * @has_fn_map: whether the driver uses an fn function-map layer
+ * @fn_key_pressed: tracks the function key status
+ * @fn_event_pending: tracks where any function key fired
  */
 struct cros_ec_keyb {
 	unsigned int rows;
@@ -61,6 +70,10 @@ struct cros_ec_keyb {
 	struct notifier_block notifier;
 
 	struct vivaldi_data vdata;
+
+	bool has_fn_map;
+	bool fn_key_pressed;
+	bool fn_event_pending;
 };
 
 /**
@@ -166,16 +179,100 @@ static bool cros_ec_keyb_has_ghosting(struct cros_ec_keyb *ckdev, uint8_t *buf)
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
+		ckdev->fn_event_pending = false;
+	} else if (!ckdev->fn_event_pending) {
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
+ * Return the Fn code for a normal key row, col combination, optionally set a
+ * position code too.
+ */
+static unsigned int cros_ec_keyb_fn_code(struct cros_ec_keyb *ckdev,
+					 int row, int col, int *pos)
+{
+	struct input_dev *idev = ckdev->idev;
+	const unsigned short *keycodes = idev->keycode;
+	int fn_pos = MATRIX_SCAN_CODE(row + ckdev->rows, col, ckdev->row_shift);
+
+	if (pos)
+		*pos = fn_pos;
+
+	return keycodes[fn_pos];
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
+		unsigned int fn_code = cros_ec_keyb_fn_code(ckdev, row, col, &pos);
+
+		if (code == KEY_FN)
+			return cros_ec_keyb_process_fn_key(ckdev, row, col, state);
+
+		if (!state) {
+			if (test_bit(fn_code, idev->key)) {
+				code = fn_code;
+			} else if (test_bit(code, idev->key)) {
+				/* nothing to do */
+			} else {
+				/* Discard, key press code was not sent */
+				return;
+			}
+		} else if (ckdev->fn_key_pressed) {
+			ckdev->fn_event_pending = true;
+
+			if (!fn_code)
+				return;
+
+			code = fn_code;
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
@@ -192,20 +289,13 @@ static void cros_ec_keyb_process(struct cros_ec_keyb *ckdev,
 
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
@@ -582,6 +672,43 @@ static void cros_ec_keyb_parse_vivaldi_physmap(struct cros_ec_keyb *ckdev)
 	ckdev->vdata.num_function_row_keys = n_physmap;
 }
 
+/* Returns true if there is a KEY_FN code defined in the normal keymap */
+static bool cros_ec_keyb_has_fn_key(struct cros_ec_keyb *ckdev)
+{
+	struct input_dev *idev = ckdev->idev;
+	const unsigned short *keycodes = idev->keycode;
+
+	for (int row = 0; row < ckdev->rows; row++) {
+		for (int col = 0; col < ckdev->cols; col++) {
+			int pos = MATRIX_SCAN_CODE(row, col, ckdev->row_shift);
+
+			if (keycodes[pos] == KEY_FN)
+				return true;
+		}
+	}
+
+	return false;
+}
+
+/*
+ * Returns true if there is a KEY_FN defined and at least one key in the fn
+ * layer keymap
+ */
+static bool cros_ec_keyb_has_fn_map(struct cros_ec_keyb *ckdev)
+{
+	if (!cros_ec_keyb_has_fn_key(ckdev))
+		return false;
+
+	for (int row = 0; row < ckdev->rows; row++) {
+		for (int col = 0; col < ckdev->cols; col++) {
+			if (cros_ec_keyb_fn_code(ckdev, row, col, NULL) != 0)
+				return true;
+		}
+	}
+
+	return false;
+}
+
 /**
  * cros_ec_keyb_register_matrix - Register matrix keys
  *
@@ -603,6 +730,12 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
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
@@ -635,7 +768,7 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	ckdev->ghost_filter = device_property_read_bool(dev,
 					"google,needs-ghost-filter");
 
-	err = matrix_keypad_build_keymap(NULL, NULL, ckdev->rows, ckdev->cols,
+	err = matrix_keypad_build_keymap(NULL, NULL, ckdev->rows * 2, ckdev->cols,
 					 NULL, idev);
 	if (err) {
 		dev_err(dev, "cannot build key matrix\n");
@@ -650,6 +783,8 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	cros_ec_keyb_compute_valid_keys(ckdev);
 	cros_ec_keyb_parse_vivaldi_physmap(ckdev);
 
+	ckdev->has_fn_map = cros_ec_keyb_has_fn_map(ckdev);
+
 	err = input_register_device(ckdev->idev);
 	if (err) {
 		dev_err(dev, "cannot register input device\n");
-- 
2.53.0.rc2.204.g2597b5adb4-goog

