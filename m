Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06802750ED
	for <chrome-platform@lists.linux.dev>; Tue,  9 Dec 2025 15:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765295237; cv=none; b=gR9+i/99yGtYPgVYmT6/helNC1z9bondICacL/AahpQxgGEqbLZggeBE9eLONpMDG7TUU8C5Dixcx+IoOU91GfXbXEQJTdwThQnLBPuhGekO/QZsCxDYvNRNHMyTBO0LY5s/dy8E+Ov1wLfQpBgDtNsbBGklIxdZKegLfTqA/oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765295237; c=relaxed/simple;
	bh=hgzVzKAMYRcdkqAluouV3Ym6Xx3BoMj8TISOh1mWfbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hRsMxz+AO0c409HP9Qq0GekTidlVDSGKvPS+v7wjwz/uKrGaN25ZIMUINRNZJ97gafVrIpQt+nydNafKd1bB7vBTNs9hWnOyU8x/EdeowsnlXoV/3nvSLT+XBFB0bMZ1we0kbZ8rDGyUl/yw6ZKVSk2ETZv7YLrQFIdfgPjwK3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T6ZLgKWZ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T6ZLgKWZ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b47f662a0so3419218f8f.0
        for <chrome-platform@lists.linux.dev>; Tue, 09 Dec 2025 07:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765295234; x=1765900034; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJMnXT5zTISBnmPgpMYxDw5LE4PfhLo8OBPJ9ftEAUE=;
        b=T6ZLgKWZx8hT1OUHaU4K3jzRUGJNG7b5mTgj31k4XPc7GagnGE6zNYFVNGmzqYUMDo
         kmCaoIT9i2XrwJi2vlAAEnJ3t7o/y0DK/IVdo3Y9LyMCNQuCXP+z8r3S6U1ri8syI1QD
         +Up2m6Ai29+jl7z2/TCT3bIHDpwaacpoTQs9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765295234; x=1765900034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GJMnXT5zTISBnmPgpMYxDw5LE4PfhLo8OBPJ9ftEAUE=;
        b=HOXmh48KUOJBU2iWbu1GBO9eyIlAFPmC3GM67vZOfeUabywefrd8QQRqIofIsdbN0w
         q4G7igUWmd0StyfxvG3B+VuUv4GKvjfVcx4VH/3uYmyxn2pfEZEpAR1n5mRQEW43Za7d
         n7fgp3Os9ZiRQVlw8/myVmVC0iFThtt8htZO5oFm5LTCStB6Ee4iqJAdZ7+pom/ctxVz
         YG5Y/C+9SBA3A6RPrOQCnACI9qh6FwvPCfZem2hvvJ4jKdQzmeflmG8V/TLQ9rywPT4K
         UYVMS466Dt6Me3ipcTuWxDpwrxU5TmZQmyh2y24biNIbqdbgTbwlg5Wy0O8KnmZzF3XR
         x5xQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6GMCjoCeTNwkfKS+pZbRRoSCwwnh78Qo9ioxKAwApntWi1gVBS3VAhE8TgV3yxRDdoL0QHYhpoDQQMU9A/i8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOkY3pGX0zSCIgputTV8jQmwpYSJHd7MZyWJVbnSlvd0llhQKT
	vMRj+bHhNrp/kp3cX2GrUaFJtt/WAtzJjz9TOoZhY3lZoobZxwjyEhkzmWyhVzGkdQ==
X-Gm-Gg: AY/fxX6ZDUIzvg5uVWmgdmk+Ed9wjb4ZlOEZfqU5osRE6ZfZswE+EVl8TyHd1KsiA3g
	/mqG8RQ49+SvF8q6QuxVLR58Ix+Z8z0eIzBuB6Hu6PEzdcf5DYySN1M3qbbS5KvgutckE9HgRsr
	472aEUIJ3IuXyPLbfvDAZh3Lr0hBIo0RBSCb0U9+pfMOxbG7Lk6gRuJ6iE6S0OeKZsqcgcGxuJ6
	J1dQeMERCAnKeodWSJ52fuvdAwfMkXjGHlCgkoRHJgUJoPmZG5PhJUb4C9PLtY8Sg1uZW4W9qTt
	2Mpd0fGcSL07/gCdxDeVquDTu3CTZe1UUUYkizFPwSafFjuSkho2fMpwn/pxGqw/y6ugaK/WB2H
	BBMyE6wkks4gT1/8FpbDWJxcLPP35U2PdAqnm3ryZBy4PbkGEjJUTsIVjgykWFowVUPWDuUuPwN
	H2Fa6QLPu65fAPd3c=
X-Google-Smtp-Source: AGHT+IHsZ/E/z81cr0O/sX/RepowG050ifbMQoEwoNBbB8rT8yZBwTljnjCZXgKGGB9b/vjs//g9Ag==
X-Received: by 2002:a5d:528b:0:b0:42b:3383:bcf4 with SMTP id ffacd0b85a97d-42fa071b8b6mr2065396f8f.1.1765295234025;
        Tue, 09 Dec 2025 07:47:14 -0800 (PST)
Received: from balto-ws ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d353c9esm31097881f8f.40.2025.12.09.07.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 07:47:13 -0800 (PST)
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
	linux-kernel@vger.kernel.orga
Subject: [PATCH v1 2/3] Input: cros_ec_keyb: add function key support
Date: Tue,  9 Dec 2025 15:47:05 +0000
Message-ID: <20251209154706.529784-3-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
In-Reply-To: <20251209154706.529784-1-fabiobaltieri@chromium.org>
References: <20251209154706.529784-1-fabiobaltieri@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for handling an Fn button and sending separate keycodes for
a subset of keys in the matrix.

Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
---
 drivers/input/keyboard/cros_ec_keyb.c | 190 ++++++++++++++++++++++++--
 1 file changed, 176 insertions(+), 14 deletions(-)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 2822c592880b..b0965e5d20de 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -29,6 +29,14 @@
 
 #include <linux/unaligned.h>
 
+/* Maximum number of Fn keys, limited by the key status mask size. */
+#define CROS_EC_FN_KEYMAP_MAX 32
+
+/* Maximum size of the normal key matrix, this is limited by the host command
+ * key_matrix field defined in ec_response_get_next_data_v3
+ */
+#define CROS_EC_KEYBOARD_COLS_MAX 18
+
 /**
  * struct cros_ec_keyb - Structure representing EC keyboard device
  *
@@ -44,6 +52,13 @@
  * @bs_idev: The input device for non-matrix buttons and switches (or NULL).
  * @notifier: interrupt event notifier for transport devices
  * @vdata: vivaldi function row data
+ * @fn_key: coordinate of the function key
+ * @fn_keymap: array of coordinate and codes for the function keys
+ * @fn_keymap_len: number of entries in the fn_keymap array
+ * @fn_key_status: active function keys bitmap
+ * @normal_key_status: active normal keys bitmap
+ * @fn_key_pressed: tracks the function key status
+ * @fn_key_triggered: tracks where any function key fired
  */
 struct cros_ec_keyb {
 	unsigned int rows;
@@ -61,6 +76,14 @@ struct cros_ec_keyb {
 	struct notifier_block notifier;
 
 	struct vivaldi_data vdata;
+
+	uint32_t fn_key;
+	uint32_t *fn_keymap;
+	int fn_keymap_len;
+	uint32_t fn_key_status;
+	uint8_t normal_key_status[CROS_EC_KEYBOARD_COLS_MAX];
+	bool fn_key_pressed;
+	bool fn_key_triggered;
 };
 
 /**
@@ -166,16 +189,108 @@ static bool cros_ec_keyb_has_ghosting(struct cros_ec_keyb *ckdev, uint8_t *buf)
 	return false;
 }
 
+static bool cros_ec_key_is(int row, int col, uint32_t key)
+{
+	if (row == KEY_ROW(key) && col == KEY_COL(key))
+		return true;
+
+	return false;
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
+	if (ckdev->fn_keymap) {
+		if (cros_ec_key_is(row, col, ckdev->fn_key)) {
+			ckdev->fn_key_pressed = state;
+
+			if (state) {
+				ckdev->fn_key_triggered = false;
+			} else if (!ckdev->fn_key_triggered) {
+				/*
+				 * Send the original code if nothing else has
+				 * been pressed together with Fn.
+				 */
+				input_event(idev, EV_MSC, MSC_SCAN, pos);
+				input_report_key(idev, code, true);
+				input_sync(ckdev->idev);
+
+				input_event(idev, EV_MSC, MSC_SCAN, pos);
+				input_report_key(idev, code, false);
+			}
+
+			return;
+		}
+
+		if (!state) {
+			/* Key release, may need to release the Fn code */
+			for (int i = 0; i < ckdev->fn_keymap_len; i++) {
+				if (!cros_ec_key_is(row, col,
+						    ckdev->fn_keymap[i]))
+					continue;
+
+				if ((ckdev->fn_key_status & BIT(i)) == 0)
+					continue;
+
+				code = KEY_VAL(ckdev->fn_keymap[i]);
+				ckdev->fn_key_status &= ~BIT(i);
+
+				input_event(idev, EV_MSC, MSC_SCAN, pos);
+				input_report_key(idev, code, state);
+
+				return;
+			}
+
+			if ((ckdev->normal_key_status[col] & BIT(row)) == 0)
+				/* Discard, key press code was not sent */
+				return;
+		} else if (ckdev->fn_key_pressed) {
+			/* Key press while holding Fn */
+			ckdev->fn_key_triggered = true;
+
+			for (int i = 0; i < ckdev->fn_keymap_len; i++) {
+				if (!cros_ec_key_is(row, col,
+						    ckdev->fn_keymap[i]))
+					continue;
+
+				code = KEY_VAL(ckdev->fn_keymap[i]);
+				ckdev->fn_key_status |= BIT(i);
+
+				input_event(idev, EV_MSC, MSC_SCAN, pos);
+				input_report_key(idev, code, state);
+
+				return;
+			}
+
+			/* Do not emit a code if the key is not mapped */
+			return;
+		}
+	}
+
+	if (state)
+		ckdev->normal_key_status[col] |= BIT(row);
+	else
+		ckdev->normal_key_status[col] &= ~BIT(row);
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
@@ -192,20 +307,13 @@ static void cros_ec_keyb_process(struct cros_ec_keyb *ckdev,
 
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
 
-				input_event(idev, EV_MSC, MSC_SCAN, pos);
-				input_report_key(idev, keycodes[pos],
-						 new_state);
-			}
+			if (new_state == old_state)
+				continue;
+
+			cros_ec_keyb_process_one(ckdev, row, col, new_state);
 		}
 		ckdev->old_kb_state[col] = kb_state[col];
 	}
@@ -604,6 +712,12 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
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
@@ -660,6 +774,47 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	return 0;
 }
 
+static int cros_ec_keyb_register_fn_keys(struct cros_ec_keyb *ckdev)
+{
+	struct device *dev = ckdev->dev;
+	uint32_t fn_key;
+	uint32_t *keymap;
+	int keymap_len;
+	int ret;
+
+	if (!(device_property_present(dev, "fn-key") &&
+	      device_property_present(dev, "fn-keymap")))
+		return 0;
+
+	device_property_read_u32(dev, "fn-key", &fn_key);
+
+	keymap_len = device_property_count_u32(ckdev->dev, "fn-keymap");
+	if (keymap_len > CROS_EC_FN_KEYMAP_MAX) {
+		dev_err(dev, "fn-keymap too large: %d limit=%d",
+			keymap_len, CROS_EC_FN_KEYMAP_MAX);
+		return -EINVAL;
+	}
+
+	keymap = devm_kcalloc(dev, keymap_len, sizeof(*keymap), GFP_KERNEL);
+	if (!keymap)
+		return -ENOMEM;
+
+	ret = device_property_read_u32_array(dev, "fn-keymap", keymap, keymap_len);
+	if (ret) {
+		dev_err(dev, "failed to read fn-keymap property: %d\n", ret);
+		return ret;
+	}
+
+	for (int i = 0; i < keymap_len; i++)
+		__set_bit(KEY_VAL(keymap[i]), ckdev->idev->keybit);
+
+	ckdev->fn_key = fn_key;
+	ckdev->fn_keymap = keymap;
+	ckdev->fn_keymap_len = keymap_len;
+
+	return 0;
+}
+
 static ssize_t function_row_physmap_show(struct device *dev,
 					 struct device_attribute *attr,
 					 char *buf)
@@ -734,6 +889,13 @@ static int cros_ec_keyb_probe(struct platform_device *pdev)
 				err);
 			return err;
 		}
+
+		err = cros_ec_keyb_register_fn_keys(ckdev);
+		if (err) {
+			dev_err(dev, "cannot register fn-keys inputs: %d\n",
+				err);
+			return err;
+		}
 	}
 
 	err = cros_ec_keyb_register_bs(ckdev, buttons_switches_only);
-- 
2.52.0.223.gf5cc29aaa4-goog

