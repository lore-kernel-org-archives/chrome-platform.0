Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E188215CD7E
	for <chrome-platform@lists.linux.dev>; Sun, 22 Feb 2026 00:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771720649; cv=none; b=KnGTGXSEd49ZC9V+g4TsemMUfwjwTJ5+tZLQr4O8z2OWA/1D1QjSfimHmmoNdEYblNs47S1Z4PlRwM3L4UzqEBTN3qo0tS9XsQmv5ecBgXwHEZZTl8LyIn4/Xqr/4tYO6hSUWgVW4oWTqCAj/hAuypXTEKpz5bfBVYoc06W7Bm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771720649; c=relaxed/simple;
	bh=r0A2ny7fUmzrQIcNfjZ7JLTjyjv9jTD2LYXdPbqdGN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fKiOTGq9uULpzSu1oyFUP0IzcLowEbdb9nry/mPs92d0xxcdLnig843EXAV2vF5wiJVRNRx4pjMCmM088yueo2yDVXK45RgJu+5YuoTZwK0u3oqGIbxVcM7nHHR3izS6ezOK6/kssN/opdaJBy0RkfWfMzFugysHAiYw0gCGnrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ntvOlMbB; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ntvOlMbB"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2baa098ffc6so2987211eec.0
        for <chrome-platform@lists.linux.dev>; Sat, 21 Feb 2026 16:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771720647; x=1772325447; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HiffRHsDZVfAH6A/NkIUz5txjzfoEADk0TaeYHBIaa0=;
        b=ntvOlMbB//jd5OJ1tww5hwxusi9/sX9GVNxYqi3091zs0A0V24gF5i2NVNmL+vEnZd
         8HJ4dVPOPaokIM3Dz/x3ikMRzgip30d41IIBZ6qJmkINKDNpfdr2J17aSwfDDDh8l5fY
         v5tb9QQS2VwzGyCJ6BCB1SC/cYDjlAbVIb5nObK/G/Euq2yUgdTA81v9nXUVQVYjV4VR
         ZZ1OJy11nQHNkDhs0NSawQnup4Pj/xZ/6ibFhrpEnb7tnbnfhXo500zBKtTEFxcbIArz
         VoEuuXr6ZS1WMIgvu87d61cHC7SBo6hv+xuZqLcA1iE5HRgE/7Bl9XUN0abvnJnWchj/
         /EGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771720647; x=1772325447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HiffRHsDZVfAH6A/NkIUz5txjzfoEADk0TaeYHBIaa0=;
        b=ZHYmKYvrCpS2AK9yO6ZlhfGZQ8FIYM3i9xer4AjuUBPuf0Bh2s8VQgl05UZHnMjze+
         HrRJMVicfxPkN2jUCjAUklW2uzcPiyPU9SdibruxpsgZzf0nIse7xlstr2KLexInKFm4
         pqXRzoaLOAMMgeSzmaoS39ndOUd0FYR8jXH8T6ee0290gkgqQFL1dHSLhIXdx8bIaDix
         Ku2Cr+pz9cq/xNqFdnYImAHxp8fxy+5tK65t+sqdP6qEZjgidcBSgacFpK0NxPKzaB0v
         YG/bMIMisOsGY0nUDfhkDwE2FrI0/ttis798ns4esNJEU2iCGNdFxOjSY4U78E140ukK
         XwuA==
X-Forwarded-Encrypted: i=1; AJvYcCWjhlRWBSCrBRVlGZphWsQZjogenrJXiqHBAeyi6tzdvAz5ssUFE0hH1LGLr2zt2b+jSkDlxuRsmz26QW/LOhY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHvKSbn9v6nUrUcxMy4Cu+qS0diLlq59nNo4rR5qa5qPV94ClN
	JEc1pFDQE7C8GNRikZ0Biyg+N99qxXs6Vd5q9qIyPb+yUea7fFoLuWKj
X-Gm-Gg: AZuq6aJ3KL43UuTpeP7SXMxi8AalxTrEICD4fDWK3dJAbdg76TMPfQPnoBz/fk+gV9K
	4nHHF9hiDK4dGbxnr6LsS8Eog26jazhUQEV7WW9h2/m3qqbGd1bwzM24z0ZEeRFmNgb4AVhQf2W
	JgKd0Sl6e6xSD7EsOIDqsWCKas/jD6pwIVdnPB/24/FxVK4F5CLUyTuS+OfbfgM4c0LyHnaK3Qq
	74qDsykBmsj+7t0fqriTYWWVCgC7No+joGQWjqM8qrkfYzEVio7Jbr+74j7dGrd776f/FajcLpp
	YDfotVYkt2nkOq+MdZbWvLFWMs3fXHdRhfrB4tDMryQODTrzGXBrdqJ8LvSpnX2L37FbdSl/YqK
	nn5coFMRjxzuR1cTge23jbVa+koFi3mHiduxu14VlcnBhP3offKsMN+jX2Q+6tnsahw/0FrDlSQ
	0hhZSeSJla7Fj0Yq61z5JFOzc1f2mZ85bj+kekrwPDZ5UVGBUe8JYcHE99k2NICApsa9tC6VZO0
	nM9oXflyIQHlw==
X-Received: by 2002:a05:7300:3b03:b0:2ba:974c:4949 with SMTP id 5a478bee46e88-2bd7bd5e3c0mr1732505eec.34.1771720647138;
        Sat, 21 Feb 2026 16:37:27 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:73d:b075:516c:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dc167d3sm2383191eec.24.2026.02.21.16.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 16:37:26 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Fabio Baltieri <fabiobaltieri@chromium.org>,
	Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] Input: cros_ec_keyb - use BIT() macro instead of open-coding shifts
Date: Sat, 21 Feb 2026 16:37:12 -0800
Message-ID: <20260222003717.471977-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.53.0.345.g96ddfc5eaa-goog
In-Reply-To: <20260222003717.471977-1-dmitry.torokhov@gmail.com>
References: <20260222003717.471977-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using the macro clarifies the code.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/cros_ec_keyb.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 2f78a19521ab..fabbdbc22785 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -277,8 +277,8 @@ static void cros_ec_keyb_process(struct cros_ec_keyb *ckdev, u8 *kb_state, int l
 
 	for (col = 0; col < ckdev->cols; col++) {
 		for (row = 0; row < ckdev->rows; row++) {
-			new_state = kb_state[col] & (1 << row);
-			old_state = ckdev->old_kb_state[col] & (1 << row);
+			new_state = kb_state[col] & BIT(row);
+			old_state = ckdev->old_kb_state[col] & BIT(row);
 
 			if (new_state == old_state)
 				continue;
@@ -411,7 +411,7 @@ static void cros_ec_keyb_compute_valid_keys(struct cros_ec_keyb *ckdev)
 		for (row = 0; row < ckdev->rows; row++) {
 			code = keymap[MATRIX_SCAN_CODE(row, col, row_shift)];
 			if (code && (code != KEY_BATTERY))
-				ckdev->valid_keys[col] |= 1 << row;
+				ckdev->valid_keys[col] |= BIT(row);
 		}
 		dev_dbg(ckdev->dev, "valid_keys[%02d] = 0x%02x\n",
 			col, ckdev->valid_keys[col]);
@@ -780,8 +780,7 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	idev->dev.parent = dev;
 	idev->setkeycode = cros_ec_keyb_setkeycode;
 
-	ckdev->ghost_filter = device_property_read_bool(dev,
-					"google,needs-ghost-filter");
+	ckdev->ghost_filter = device_property_read_bool(dev, "google,needs-ghost-filter");
 
 	err = matrix_keypad_build_keymap(NULL, ckdev->rows * 2, ckdev->cols,
 					 NULL, idev);
-- 
2.53.0.345.g96ddfc5eaa-goog

