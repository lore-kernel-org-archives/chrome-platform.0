Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9FD1D61BC
	for <chrome-platform@lists.linux.dev>; Sun, 22 Feb 2026 00:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771720652; cv=none; b=ovK4yCIwiEkCIFzbSuhM3xsfATSPRXm1Mw+Qowba0/rShLpk6pKdLTWCS3W6wovDzzEgvygo8j6r1cTmvjqWXH+y/BiJ82EWs2+f3wzxVWUnru4HeivDgZu+FI/5BUJQlRuGr24NflBkY66teWAKTVlvpA8B5AWoICY0wbgrro4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771720652; c=relaxed/simple;
	bh=/oWe9TBcbfGVgvA3YAwcI++qilYUs5G6I0MwqlEyTXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RU6sJoPFLWUCo5iCJwGRdV9D6anws3tNPcGlxfNyTr2JXaY7noaJjDIWUO5ch24xYzf9RP0cSQMntr7/ZtAYVGgIwusRQIyr1pBQvNGvw5+Yaj0uocUS0a2LzqMvjrLUzHC8/enirhkdkhWHgvSgLgqxFwLmDGFByYceqbpXKe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AsQyuuxs; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AsQyuuxs"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1271257ae53so3015913c88.1
        for <chrome-platform@lists.linux.dev>; Sat, 21 Feb 2026 16:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771720650; x=1772325450; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCOB+xu4HpFhupd2ul95dO/R/350Wo1NOuKyLRfUoGY=;
        b=AsQyuuxs8onB/sEasDQK7kxeskcTgWEByAblTDlk5XxyKkpbemmHPocjzJOhqEJ/U+
         mIZvzEfqpsEeConFe5IBE6EkFYspHs4ztWQSXxBdPYCc90AKYmDh/XJqX2wVf6CFBQRW
         cOawpax1bAwPt8oikOuk1XkE3PTE7R3Z8BtrpgYsg4iLk+ar1HUJCUfWT2UjntNChVOv
         mRkmEktPmtAShV/J/C1KUZ58V62MSF2vmTbG783ysV9ZiXlU+P1RyNcFgrN4KQJu3K8k
         LG2C9l+e2sRwxGrBFcxQkaQJJ96ChwfNGpHlNPJrjyDTBrySR/FmO0WlWq0QvWWLGV0M
         y2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771720650; x=1772325450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NCOB+xu4HpFhupd2ul95dO/R/350Wo1NOuKyLRfUoGY=;
        b=V1h7T5gnwv3P2LcEj3jqKtUpEyucc61snmZBoYis4e7biiGJodU4kl0RM9N8AIZcvo
         +MIZaPHytF00t2xCDQmvbtvykvq/39CxOrq26Obf5mOaPvSgIf3F8d8ojByKJRP3qqDR
         S+dG07zxJyutgGkv1N9tj0Pb7ouYZV7zM65C1Z94mmtxZfSbLSIoXKMRGFjW0Q4PKvUj
         XFeKUsg3/56tzzMTkHZqP2WkKYuA+2lK29ZpPrL2Ibf2XBy8W8Z/vI3mZakTE3xC7dzC
         hUd211g6409BXuTukFB7XC+8BpuTJQGS6MKDVHjWK5xTcBbEuwcIRO8MvZ2jOydfAKLj
         3riw==
X-Forwarded-Encrypted: i=1; AJvYcCV/642JU5sTT32Pr7C4x85JoEeXMjKu+ODSqzlZT9yr2nmJDPaTOToDCzF+pakdxI5WzOWi3KBkL4MdpFKLBnI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxlGPryUoYsn3ANxIBMHgP9egIrrp/JzTX13UI+aGTf/CWc+Fkc
	/XB0JgqdVuBP7eXOgU5M8AwFpGOydlPcNajZs10ehbqBF2Fyq0CZZ6Y2
X-Gm-Gg: AZuq6aIVXky6h3FfHO6Lyx/oeTNky3oZKUN4Fd8V6olwVS/RO3ePMSw4W7vxXl2Bv8d
	UuKiV05ULQ9E080x//FKBkQuFFEJF5xQNXj4AB9IzRTtrVuDdk0mTi22A5gjcuV2kI9xEprZjKs
	hKFMat0dru5Nd0+hN9PScC03bt/4bl02AN972TULaTzrQ0ZykNydfWV7TEP1ZhSol822ht605f3
	qZjfc5bISbM20+4hKpnmcUGZy7Lz99Mhg9sdHoWv5ZLFBmlPgFltugzWpLEt4ks89CLGkXn5z1P
	s4r3i6X4ygBr4GEy+cQ0rbzazcYI94DsdHF2rgJwv8TjeCnZ22MzFM/zzAp3oFfIkAGbtZBeypL
	g4geWQNLq8fOiYw7WZkI0glvELkzjKSj1Aw4cu+jw5uEIlcr9hn3aUMe/N+OfA6xm8lqv+AghXO
	Ld3iPctLoeJSuExnXdIuFGyXr7Tp+gI30iwCJC+fJZX37kEsasXAvx1Ue573pW4287hFRj8hito
	xm2rp7jW4IwN9KbLa1tQsIL
X-Received: by 2002:a05:7022:2482:b0:127:35af:143c with SMTP id a92af1059eb24-1276ad39a83mr1667574c88.37.1771720650227;
        Sat, 21 Feb 2026 16:37:30 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:73d:b075:516c:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dc167d3sm2383191eec.24.2026.02.21.16.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 16:37:29 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Fabio Baltieri <fabiobaltieri@chromium.org>,
	Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] Input: cros_ec_keyb - factor out column processing
Date: Sat, 21 Feb 2026 16:37:15 -0800
Message-ID: <20260222003717.471977-7-dmitry.torokhov@gmail.com>
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

Factor out column processing and eagerly skip processing columns that do
not have any changes in them.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/cros_ec_keyb.c | 47 +++++++++++++++------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 02176aee0530..8cf9129f6198 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -254,6 +254,26 @@ static void cros_ec_keyb_process_key_fn_map(struct cros_ec_keyb *ckdev,
 	input_report_key(idev, code, state);
 }
 
+static void cros_ec_keyy_process_col(struct cros_ec_keyb *ckdev, int col,
+				     u8 col_state, u8 changed)
+{
+	for (int row = 0; row < ckdev->rows; row++) {
+		if (changed & BIT(row)) {
+			u8 key_state = col_state & BIT(row);
+
+			dev_dbg(ckdev->dev, "changed: [r%d c%d]: byte %02x\n",
+				row, col, key_state);
+
+			if (ckdev->has_fn_map)
+				cros_ec_keyb_process_key_fn_map(ckdev, row, col,
+								key_state);
+			else
+				cros_ec_keyb_process_key_plain(ckdev, row, col,
+							       key_state);
+		}
+	}
+}
+
 /*
  * Compares the new keyboard state to the old one and produces key
  * press/release events accordingly.  The keyboard state is one byte
@@ -261,10 +281,6 @@ static void cros_ec_keyb_process_key_fn_map(struct cros_ec_keyb *ckdev,
  */
 static void cros_ec_keyb_process(struct cros_ec_keyb *ckdev, u8 *kb_state, int len)
 {
-	int col, row;
-	int new_state;
-	int old_state;
-
 	if (ckdev->ghost_filter && cros_ec_keyb_has_ghosting(ckdev, kb_state)) {
 		/*
 		 * Simple-minded solution: ignore this state. The obvious
@@ -275,24 +291,15 @@ static void cros_ec_keyb_process(struct cros_ec_keyb *ckdev, u8 *kb_state, int l
 		return;
 	}
 
-	for (col = 0; col < ckdev->cols; col++) {
-		for (row = 0; row < ckdev->rows; row++) {
-			new_state = kb_state[col] & BIT(row);
-			old_state = ckdev->old_kb_state[col] & BIT(row);
-
-			if (new_state == old_state)
-				continue;
-
-			dev_dbg(ckdev->dev, "changed: [r%d c%d]: byte %02x\n",
-				row, col, new_state);
+	for (int col = 0; col < ckdev->cols; col++) {
+		u8 changed = kb_state[col] ^ ckdev->old_kb_state[col];
 
-			if (ckdev->has_fn_map)
-				cros_ec_keyb_process_key_fn_map(ckdev, row, col, new_state);
-			else
-				cros_ec_keyb_process_key_plain(ckdev, row, col, new_state);
-		}
-		ckdev->old_kb_state[col] = kb_state[col];
+		if (changed)
+			cros_ec_keyy_process_col(ckdev, col, kb_state[col],
+						 changed);
 	}
+
+	memcpy(ckdev->old_kb_state, kb_state, sizeof(ckdev->old_kb_state));
 	input_sync(ckdev->idev);
 }
 
-- 
2.53.0.345.g96ddfc5eaa-goog

