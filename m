Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A56534DCE0
	for <chrome-platform@lists.linux.dev>; Wed, 11 Feb 2026 17:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770831270; cv=none; b=meGBbSMx9iYYx65vCu4rHg0jv8UXOtmYOS/XHYeLDfkt9cPyFjzlTnvrNPufOEoprdWM2NcjQZmg2+rh81Ki8ueP6+9vyxtq9uzdQAfAr0+RMtaJFb+hC/sLFK6tiATHYlPouQP5JiJxNS/brLPa8XI5zzk4Ilh8oOMSq0UgBTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770831270; c=relaxed/simple;
	bh=BOtqzINSJkvVF3BJ+I9/SEpyPvXjE1wD/Pgxwmr4TOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bU2FG2DkTfBnSXtOw1h2SKVGDz5ntc1dA+gw0AfnkERZiw+FI/FJmPcIwDZ9sBlrtM9i6HWOnGfCUPRV4Jmetg32Zz1QmtSCpnyP1XrsXlbi5/AiOVTWSll2SHdGubLfoBPLWBHY7WpJBfrAhjA1OcyhZb9eTLELfSZg4S3Nob0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Xb1J6vRf; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Xb1J6vRf"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48327b8350dso49664925e9.1
        for <chrome-platform@lists.linux.dev>; Wed, 11 Feb 2026 09:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770831266; x=1771436066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NRnArFJ4FK2jOO4FMkxgZZsssccfLs2sPAF2qNLKg8=;
        b=Xb1J6vRfVcRDin7K08tVdLrfeo+cl+UEFiUYUx/FaHCZY/bUcDB1mlT92NuPy5pqMV
         kXu+eJ0PIKzNfMYDWNIMe8uI+h38kTDl5clwc+kJztLSyQQ3kqG6SdWNZKu8AOkYBJmF
         TtcbiAIcALglPtWNpofl+y+oNmOIda63n8WCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770831266; x=1771436066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4NRnArFJ4FK2jOO4FMkxgZZsssccfLs2sPAF2qNLKg8=;
        b=ex1kLB0prEIUe698r9Y2D7Kd3aruwt6vRKuJ1F/suMFaD1ix3wJRfK4Rd0FvYW61s6
         hBjlPLBUeSskDRIn6d42Dw6Ozv0gJpxp4cc6fPwJnYZmxJJjfdrvQqv1Xm31hvcAzEPJ
         oeLSf5USQmFN5+morLuG76G6+SK7W2K5dMGJfHxgp/Qib8W4tiJJVlWPWlYh1Q1iGq3+
         z391eaD2XgmjwXjWS9jBAqhj3WJpJDSGoEvZd16ldZ+M1XcYU2QHfQ9IzuByHDWDjhNo
         ST8gYNhU6WwVwLPPD3jhcCqMP9ihcFlk1rM9IsAR26vQJAPXbBjEhb+3jxOng0hZxq1r
         4k3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUi/WKe11VFQBDvXGJn7mWNRnJF+fG1kX2rlIZfpiPi+kPFYLI9oU98onYWxDbyKoEo4/jgk/OKhRzrEeIiDaY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyf4Y1M98pbiCDpI3gw//w/R6waNU71WMYv0ouT/U6tQ9xcqukZ
	kPrh9OT6dnC+BaGyDViCp0fd6B4ic84NK4tYE1KvpRHjM4SIBJYzH6DPWPWIURn36w==
X-Gm-Gg: AZuq6aLVYHmFFNBK06k1XkF26cPwo0DMAQ0+2L6eTQWSAqgodE/kFJoEec7hm3MZ5yN
	BksfRdKjMGBF+3SE2GntzVQuMmMxpRCUzSmBqMz8TkVqJTQ8zzko8eLLMI0MWVrXyakGnEZEMBA
	MKjEfrS7DVj34+wvIr816eY3WMIeeK2wmbQnsOgBnsNkEpQdZGZ7UVKpe9tE9WQybvmC1OphsxE
	eKzeqBUY3XwE7wTgIcPHjsH/8780GuiH8Z+n3nbh/15KrZ6WbDhwWl4/SVjR5gNL2ylE7L/VnvC
	SvQE3lgcbom4oNgktcr6ENsH7q/j3E1UScijbU6iI7c7ircN6q7CZR4b5k110rut+SzJ1/7vBuI
	DMg51PPV4Mcw1OW/T2ETf/Vdgl2gCQ0gAawsGlJl9eP1HrYAy8Kk/bp2G1it8R95+mCTxbJgok3
	ZI2QGAQGWVRLMn/Ot7ScrMPABhNq8=
X-Received: by 2002:a05:600c:1389:b0:47e:e779:36d with SMTP id 5b1f17b1804b1-4835b92bd7dmr41041165e9.23.1770831266460;
        Wed, 11 Feb 2026 09:34:26 -0800 (PST)
Received: from balto-ws ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783d50f24sm5885498f8f.14.2026.02.11.09.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 09:34:26 -0800 (PST)
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
Subject: [PATCH v7 2/2] Input: cros_ec_keyb - add function key support
Date: Wed, 11 Feb 2026 17:34:21 +0000
Message-ID: <20260211173421.1206478-3-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.53.0.239.g8d8fc8a987-goog
In-Reply-To: <20260211173421.1206478-1-fabiobaltieri@chromium.org>
References: <20260211173421.1206478-1-fabiobaltieri@chromium.org>
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
 drivers/input/keyboard/cros_ec_keyb.c | 191 +++++++++++++++++++++++---
 1 file changed, 175 insertions(+), 16 deletions(-)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 1c6b0461dc35..67022f92533d 100644
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
@@ -166,16 +179,103 @@ static bool cros_ec_keyb_has_ghosting(struct cros_ec_keyb *ckdev, uint8_t *buf)
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
+		int fn_pos;
+		unsigned int fn_code = cros_ec_keyb_fn_code(ckdev, row, col, &fn_pos);
+
+		if (code == KEY_FN)
+			return cros_ec_keyb_process_fn_key(ckdev, row, col, state);
+
+		if (!state) {
+			if (test_bit(fn_code, idev->key)) {
+				code = fn_code;
+				pos = fn_pos;
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
+			pos = fn_pos;
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
@@ -582,6 +675,63 @@ static void cros_ec_keyb_parse_vivaldi_physmap(struct cros_ec_keyb *ckdev)
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
+/*
+ * Custom handler for the set keycode ioctl, calls the default handler and
+ * recomputes has_fn_map.
+ */
+static int cros_ec_keyb_setkeycode(struct input_dev *idev,
+				   const struct input_keymap_entry *ke,
+				   unsigned int *old_keycode)
+{
+	struct cros_ec_keyb *ckdev = input_get_drvdata(idev);
+	int ret;
+
+	ret = input_default_setkeycode(idev, ke, old_keycode);
+	if (ret)
+		return ret;
+
+	ckdev->has_fn_map = cros_ec_keyb_has_fn_map(ckdev);
+
+	return 0;
+}
+
 /**
  * cros_ec_keyb_register_matrix - Register matrix keys
  *
@@ -603,6 +753,12 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
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
@@ -631,11 +787,12 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	idev->id.version = 1;
 	idev->id.product = 0;
 	idev->dev.parent = dev;
+	idev->setkeycode = cros_ec_keyb_setkeycode;
 
 	ckdev->ghost_filter = device_property_read_bool(dev,
 					"google,needs-ghost-filter");
 
-	err = matrix_keypad_build_keymap(NULL, NULL, ckdev->rows, ckdev->cols,
+	err = matrix_keypad_build_keymap(NULL, NULL, ckdev->rows * 2, ckdev->cols,
 					 NULL, idev);
 	if (err) {
 		dev_err(dev, "cannot build key matrix\n");
@@ -650,6 +807,8 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	cros_ec_keyb_compute_valid_keys(ckdev);
 	cros_ec_keyb_parse_vivaldi_physmap(ckdev);
 
+	ckdev->has_fn_map = cros_ec_keyb_has_fn_map(ckdev);
+
 	err = input_register_device(ckdev->idev);
 	if (err) {
 		dev_err(dev, "cannot register input device\n");
-- 
2.53.0.239.g8d8fc8a987-goog

