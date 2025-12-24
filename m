Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E8E340A57
	for <chrome-platform@lists.linux.dev>; Wed, 24 Dec 2025 15:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766589769; cv=none; b=H8cqPHGMn8UlSrzt+15Cm+Gj9GVecFXKTOB7Y1R03WH9Ubr+LmvwinssZZWzfJKRXD2LJua1ZfmCuViUkGJxhqIyj/bqGo36uM2ML1aEMLGeYZ2Xza1sl5CRKKkiPr63Fo5pZXOZlGx7N5jmygrOxWR2lzYDlcIB+DPhGFCL0VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766589769; c=relaxed/simple;
	bh=WTyMTbSMQzIIk8c/zE5eemB8w2d2eo13RjTPG4hAHpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=juRAvuXVfXlJUDyVGw+1/2kY671VH47ongT307afzOyusWqxw+QvmBNRD7nmQPELqSQds9uhJbo7jSvd1iJLx9Og4/nOReDEAURLokEI5xmDuhWRGKvjtUH+nuGiK19i4HyEYVAeb4MkOI3dbuzceT+SRfblJ6SSvfil5ttA4SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lOGl15nv; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lOGl15nv"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42e2d02a3c9so3856697f8f.3
        for <chrome-platform@lists.linux.dev>; Wed, 24 Dec 2025 07:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766589762; x=1767194562; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyefeZtkA984opS3wh2QxIpFCcn7cjIx25blSwfv61M=;
        b=lOGl15nv683JBS7jBKCZpaJuRefMdVI32ST5mbHLAq51D6+7eSauSW6P9SrSZdXAS7
         zlFgejN6zdPFMATYqzly+NuIIxedNbxv++2R188lFIyMd6UcZGzDEnM2igr5xYu8/qBf
         PkgAy5+gVxGwfnW9pD4fhf8VKfjnS4JDR8f+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766589762; x=1767194562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RyefeZtkA984opS3wh2QxIpFCcn7cjIx25blSwfv61M=;
        b=wJ8HFvzE3owbwOgDO40wddhcqRrxepw8HdV+ACpqLE7D7OmYz+gptA9fx8xkh9hiGa
         ZrI2eNyRfr8gNFA0tEdi0FHMV5Bn1NrxkcJwMW40drN8CPSXdtB2J470CtIPb0VsW5i1
         PQM2AIr554M7/XmvPY1AT+CguZt93qAcHMOdpAw9jUcb6tLQ4F7gB0nBVkRWr3LAFLwX
         29CQpzSfXxft1ns3PYcwqcPNd41Z1dwaDfVvI2gNz9/hX++G5fIwiqpzvMl/eI60hdD9
         7Utzx4CX0nmkonRq1170oyIWZt3QlmXkKX3WrJINWTTG+5IBvKwVkxJ3HBgv4WuYj8Jt
         qcrw==
X-Forwarded-Encrypted: i=1; AJvYcCXNEj0X0TbHoTHJ80pFpq4+of2m8pmDtypbTnGrTZTcZDlpAD6g2IMFSoixNazzuYOJs8fQCNFpGpTdtYRM21g=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8g8owDL2QJJ/iKUtJ0dRhJDshj61o2bCNfRdSiNLdni+egx0J
	4lBoCskPKzxD3EEeUiZItvoPULw2hBHiWtx4i4KbZqUSSK8YBlT3tIWFU1eBBCjIDg==
X-Gm-Gg: AY/fxX6Hb+LbFmPjg3xvqye/Q7Im9BUdb9EFHFlWzit4CIZFKaFVjaVmq3IHcQYTYjf
	EpXV5k7Dlnxev1Qff3L/jbpEp3FSUGQi8hyj/CKDECT/MGAL8W8OYyBKPbXfUE1Xh0Pva4ni7Qt
	BfXibHSBw0P4p+sk22iT23IqFPZ1r/G4oBgmLmnWdQPBOIuRJD7TBe72zL48fC7FkNBuD6CNfOP
	zFNewStcxk0BPcS+HFu+dqY1T7Hb2Knhayq4zjTxBldj0zfgn5wxQGEbhC+CQORxEtSOjdtzhvr
	UHkOm+qDbivtY3V9OqNTc00iph2wOQjkQxGhygNO3NoYA5NvB3N2Y4HHlQKTiWqdkzmgMbrnRgt
	5UqHk2l1W2pMEEcYK7QxiWy1fJdLk1mDrlRw8JPTV17Rw2D0J2kff78UteuINgIq0dqkAaANxfy
	vYJsiXSgFb75zh20w=
X-Google-Smtp-Source: AGHT+IEzhtmx7B/YgjG7IPSjUb5Fjb72PWnzr64AjzD+3FsHwgw5UML4dhc5sj7PIJMUpUGd5SDRTw==
X-Received: by 2002:a05:6000:2386:b0:431:1ae:a3ca with SMTP id ffacd0b85a97d-4324e4c1207mr21162355f8f.11.1766589762212;
        Wed, 24 Dec 2025 07:22:42 -0800 (PST)
Received: from balto-ws ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324e9ba877sm34307363f8f.0.2025.12.24.07.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:22:41 -0800 (PST)
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
Subject: [PATCH v2 1/2] Input: cros_ec_keyb - add function key support
Date: Wed, 24 Dec 2025 15:22:37 +0000
Message-ID: <20251224152238.485415-2-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
In-Reply-To: <20251224152238.485415-1-fabiobaltieri@chromium.org>
References: <20251224152238.485415-1-fabiobaltieri@chromium.org>
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
 drivers/input/keyboard/cros_ec_keyb.c | 120 ++++++++++++++++++++++----
 1 file changed, 104 insertions(+), 16 deletions(-)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 1c6b0461dc35..8b95b4f8a37d 100644
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
+ * @use_fn_overlay: whether the driver use an fn function overlay
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
+	bool use_fn_overlay;
+	u8 normal_key_status[CROS_EC_KEYBOARD_COLS_MAX];
+	u8 fn_key_status[CROS_EC_KEYBOARD_COLS_MAX];
+	bool fn_key_pressed;
+	bool fn_key_triggered;
 };
 
 /**
@@ -166,16 +182,83 @@ static bool cros_ec_keyb_has_ghosting(struct cros_ec_keyb *ckdev, uint8_t *buf)
 	return false;
 }
 
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
+	if (ckdev->use_fn_overlay) {
+		if (code == KEY_FN)
+			return cros_ec_keyb_process_fn_key(ckdev, row, col, state);
+
+		if (!state) {
+			if (ckdev->fn_key_status[col] & BIT(row)) {
+				pos = MATRIX_SCAN_CODE(row + ckdev->rows, col, ckdev->row_shift);
+				code = keycodes[pos];
+
+				ckdev->fn_key_status[col] &= ~BIT(row);
+			} else if (ckdev->normal_key_status[col] & BIT(row)) {
+				ckdev->normal_key_status[col] &= ~BIT(row);
+			} else {
+				/* Discard, key press code was not sent */
+				return;
+			}
+		} else if (ckdev->fn_key_pressed) {
+			pos = MATRIX_SCAN_CODE(row + ckdev->rows, col, ckdev->row_shift);
+			code = keycodes[pos];
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
@@ -192,20 +275,13 @@ static void cros_ec_keyb_process(struct cros_ec_keyb *ckdev,
 
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
@@ -597,12 +673,19 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
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
@@ -635,7 +718,12 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	ckdev->ghost_filter = device_property_read_bool(dev,
 					"google,needs-ghost-filter");
 
-	err = matrix_keypad_build_keymap(NULL, NULL, ckdev->rows, ckdev->cols,
+	ckdev->use_fn_overlay = device_property_read_bool(dev,
+					"google,use-fn-overlay");
+
+	rows_keymap = ckdev->use_fn_overlay ? ckdev->rows * 2 : ckdev->rows;
+
+	err = matrix_keypad_build_keymap(NULL, NULL, rows_keymap, ckdev->cols,
 					 NULL, idev);
 	if (err) {
 		dev_err(dev, "cannot build key matrix\n");
-- 
2.52.0.351.gbe84eed79e-goog

