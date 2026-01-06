Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8F031AAAA
	for <chrome-platform@lists.linux.dev>; Tue,  6 Jan 2026 11:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767699000; cv=none; b=grQCMBrxmjAG61tf402KIllLb4Ce0KyMJj5kE4H5wCcGKUebhJc0GluFdpSbe5RGi76EjJcpQqxIq5/kyN7BHVplLIjG/u0kgfo9p+w5JzPZ74keItoAX89QxyvgVxPhP5y2wBi6GvleoR/Yj2fOJXbeUP4q0qRLhgaqT5Ztg88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767699000; c=relaxed/simple;
	bh=S7yjyKlCDH8q87cleFtLMuz9lywljZCqKLq+HLZ63IA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LV7uv8DFFZDNG93sPbQRusP25LUbGQL2vwfjNSYg+n0xHuaMp4JwxBLm2/SZz08/OGSjaaRsHFLIn0AGH0BOQlPOX2Iyn2VjTFA7VviKF1KGQ0KO9c2mLUnbPS0sCPTcLbd4Hg08udHxQnLs9AAyJJ/oaoxLp2KVtoAQVuQhlUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GKEiQFdf; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GKEiQFdf"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47d5e021a53so6278335e9.3
        for <chrome-platform@lists.linux.dev>; Tue, 06 Jan 2026 03:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767698997; x=1768303797; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hmZHVE8WQaJfR5ykW+zRucqvzo9/FyMacfU4JQkTmc=;
        b=GKEiQFdfvs6vhXRNcVaqBHR0R8IeNYuWV8NmVQ+0gzAOwq18gqVd8UKcagMOZvqd1P
         GzFHEYj3Q92B4ydBb9KXgm2iRvgrSdsT9vY0aKgs3nnn1Ud3YsO8antdfrIz90qw8CjT
         o08aYglpZsrB4twMFN7rGd0rh1cKyWtuQs86M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767698997; x=1768303797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+hmZHVE8WQaJfR5ykW+zRucqvzo9/FyMacfU4JQkTmc=;
        b=DpuYG4RH3dqHWDvNRQVNXOCDhAzTru/VSD7ftxIOyoKXamKP2MnIOXXNG2AyzeI4X/
         HoFokPy3rPgOFyOo++ZqRHD8n26BJNi8Si90vUHkAePQRLvD2xi7R9YRAlv7w13Cp/W6
         t8QORNKDrDbnUU3qazhkH1ADuUkW19J8w+p7D1pWwCzCVf3Tv29xTj7gqXepFjxZdyqv
         f5PeeCNUn7SMgIxPrJWIo+GI3dKlLGp+kqucuigsmd25Q8ywcsSD0tpv3gUIZ3MACN/Y
         i7JOcXO3S1HpT8eUOIvsSpUwyZU/sTkV+l5uT4PiaEnF2RT7dTJUsMGxcF2mbnraS2Qf
         E6MA==
X-Forwarded-Encrypted: i=1; AJvYcCUolkziRJPt7drWc9nBrJZ+iag3UyQSOtCby/VIH35Afp6utanXz9uGRmkLqXvF6fibRf8T0l9SdnOqTdBG0PU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1O63aQgq6FL6w1DuwU3xVadHJnBM2TWaMYbns2q4UmArDDfnd
	/T1mZZee0hRHy3SF7pLWupXthlcys10eDHYcNukO2InigiPjAh604ilT5U2w/h02Rg==
X-Gm-Gg: AY/fxX7oPpfCZ3zre7mSzfjmXGkFr6N7zfdm+T/ra4xM6FFA8/2Y4tSYVERm6+0fO3m
	IwFQlWgWhoyid8TgumL+sQMktUMOikOZ89ON4cvRABSuehn3e85VAZIYSsuuIvMuO4TN915qsGt
	FN8vB0C3RKhDhnd+8jMq/uOhWnYUEGged7C8lUtFGuNvilH/eFGvffJDpjGb62Z1TnxShVhqyxN
	RGc2I+PXFewxmvk+4ExYrvq6jgkc0+MLA2LH6BRX53tnwEaT3TauHA4QsYM/NpocdcCpTFFJv3e
	BS4djQ5X5+6e7A1Yg9jF2ktnry45E+6XPKf6ET3uiWF67cYItDS4rO0b8LEDbctN3ZHF3ImDAj3
	NEGTHsPsjQER99L5rP/D0h+I/g42IUbql9L6yAYdUJgiDzXtx3apq9j7fzDsSdjZR3F6u2547Ed
	dAuR0u9vbVk4nbukRvPgrhPifAAw==
X-Google-Smtp-Source: AGHT+IGwdYiIO3f0W4orc8af84j7Uhz0ms1JygNr19XpIC2gifN7PrRb3cyEXCnsY9AusmwuehfLGg==
X-Received: by 2002:a05:600c:3115:b0:477:9f34:17b8 with SMTP id 5b1f17b1804b1-47d7f06cfd2mr33884765e9.1.1767698996863;
        Tue, 06 Jan 2026 03:29:56 -0800 (PST)
Received: from balto-ws ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm3757482f8f.31.2026.01.06.03.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 03:29:56 -0800 (PST)
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
Subject: [PATCH v4 1/1] Input: cros_ec_keyb - add function key support
Date: Tue,  6 Jan 2026 11:29:53 +0000
Message-ID: <20260106112953.692304-2-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
In-Reply-To: <20260106112953.692304-1-fabiobaltieri@chromium.org>
References: <20260106112953.692304-1-fabiobaltieri@chromium.org>
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
---
 drivers/input/keyboard/cros_ec_keyb.c | 174 +++++++++++++++++++++++---
 1 file changed, 158 insertions(+), 16 deletions(-)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 1c6b0461dc35..74ac1700b104 100644
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
@@ -166,16 +182,104 @@ static bool cros_ec_keyb_has_ghosting(struct cros_ec_keyb *ckdev, uint8_t *buf)
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
+		if (code == KEY_FN)
+			return cros_ec_keyb_process_fn_key(ckdev, row, col, state);
+
+		if (!state) {
+			if (ckdev->fn_key_status[col] & BIT(row)) {
+				code = cros_ec_keyb_fn_code(ckdev, row, col, &pos);
+
+				ckdev->fn_key_status[col] &= ~BIT(row);
+			} else if (ckdev->normal_key_status[col] & BIT(row)) {
+				ckdev->normal_key_status[col] &= ~BIT(row);
+			} else {
+				/* Discard, key press code was not sent */
+				return;
+			}
+		} else if (ckdev->fn_key_pressed) {
+			code = cros_ec_keyb_fn_code(ckdev, row, col, &pos);
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
@@ -192,20 +296,13 @@ static void cros_ec_keyb_process(struct cros_ec_keyb *ckdev,
 
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
@@ -582,6 +679,43 @@ static void cros_ec_keyb_parse_vivaldi_physmap(struct cros_ec_keyb *ckdev)
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
@@ -603,6 +737,12 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
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
@@ -635,7 +775,7 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	ckdev->ghost_filter = device_property_read_bool(dev,
 					"google,needs-ghost-filter");
 
-	err = matrix_keypad_build_keymap(NULL, NULL, ckdev->rows, ckdev->cols,
+	err = matrix_keypad_build_keymap(NULL, NULL, ckdev->rows * 2, ckdev->cols,
 					 NULL, idev);
 	if (err) {
 		dev_err(dev, "cannot build key matrix\n");
@@ -650,6 +790,8 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	cros_ec_keyb_compute_valid_keys(ckdev);
 	cros_ec_keyb_parse_vivaldi_physmap(ckdev);
 
+	ckdev->has_fn_map = cros_ec_keyb_has_fn_map(ckdev);
+
 	err = input_register_device(ckdev->idev);
 	if (err) {
 		dev_err(dev, "cannot register input device\n");
-- 
2.52.0.351.gbe84eed79e-goog

