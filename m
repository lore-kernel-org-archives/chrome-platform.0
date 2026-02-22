Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098AB2F872
	for <chrome-platform@lists.linux.dev>; Sun, 22 Feb 2026 00:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771720648; cv=none; b=ON89JCOx2isKII6axqHdGw+7j2h/mZOsBzIJrMbwK8+XGkflDjQxRBFd5uAHrm+/UuPjB88epD4A6d1fYBEltadwh/sUKtFzpqWHHSBl7DBqFSghO4veMWUHCb3iBuf/eeEdZJHtENoQYdvlDIiF5qFDbI5jLWTzwmaR2tkncEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771720648; c=relaxed/simple;
	bh=RjgCz53FUSV7HP/cF2bEAdVK/kU9rXidWruaDkdCbk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QC2HhpbLnawA/EEtxPhcoOftJwsGzwSkJCiJO+tHZDHKKKzVjUdcV5TZNawsnoyEIyeaGTHa5NfmzN84YqnPUuozxT81an5rzyUIYJl+SNzLOplbaVJ4E4xrUkXQf7F4IIC7R1ts8OM/ZJEt3aOcmFTdfQcW+T6SkUH50xqnov0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLgGxdV9; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLgGxdV9"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2baab3137bcso2721687eec.0
        for <chrome-platform@lists.linux.dev>; Sat, 21 Feb 2026 16:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771720646; x=1772325446; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W0rQ7ex4h2z+8N7dHVq8qvk2wg1mn2OyvK9whQnScvY=;
        b=iLgGxdV9wj7KaOWG1WQnXKj2v3Dxxapb8JI42Uuvxqs+Asm2LNaC731/GNLqW9Utoi
         E8dJ82cvkSW/9tUNCXkT9nuyxnR+Jpky6EaV2jmKKlNF0+GrBliUh0jFn0FNUO0JWMGC
         b5Csg8/BVGsqvg98tBxrN3uSXSsbSki30GyhIkqji26smvvkcB5xDdYQxvcMuLPQJ+Kx
         KxyTh7WVsmKVkNv36zQ7R6QocXvTJ7Pa7aC1AdYCk+LCWx5xBSVOBb1dFcXGjojlM6Tq
         IP0X+gVsJG8bfEZMVZD69bL2HkNrKcntRuOH7aI6v0yQQx/gR/VtqeCPFnnvMNaAd5qs
         eZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771720646; x=1772325446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W0rQ7ex4h2z+8N7dHVq8qvk2wg1mn2OyvK9whQnScvY=;
        b=Fr0zrlztHvgoYorbsHvcMa4lYLA6vYefT68XLjrhWwKm/ruOlmxpKW9Uk+ylFfMuAf
         CCpdK5ueapbWJNsqKtfp5faY6swO4oQcsSL1lkkwU84J/g0irqbAd2SW3Orr5FxjOTQo
         CBm/osKxXPAhW3B+qwJ8Z2NBo1Wu9OxzcOTopKpGV+ARk/QaqfLnbVYXcc++ZBt3kzvB
         7ZYkbZDru0Gp3DdOn4RGt4XmEc3rm2M+2gPXcRzmnzKy3sRee51+Al0AmYyBuM3soMfU
         wOBnH16J6/SrjUfGIaeFj6MHwHeLlhItibO3gzZDQuJjb5X5jm6Jj19U+8cwM336dzQC
         pOYw==
X-Forwarded-Encrypted: i=1; AJvYcCUGUV1yz1TlqWDdyA1MWRZuNsecJoQGynOfjW6VOXBTH/8+YNoSguiLzkHMFn7G1SrsfWRRczUsH6BUhq0qpXs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwC7yBwKuWkpGqPEKdt00RI4aNOeK0gICuZSW1LxqFhalpazWnQ
	BMgJLM3MYxH+GAQOhl09drlXakbLfRWq4gqQzSJMpj0yJ9qF47mjagWd
X-Gm-Gg: AZuq6aJI+o8ywnMuOahqXmJrM2Rvb8PYdZpFl8w9KBkdNN3vm/tHppa+792k8z3l5Fr
	+IF445EcztCG4BDTIg/u/wwHe9HUSheFtx4I8eS2ce3WXqukpLYPOeBB8+N8aNRv1cWFyXe31nE
	7fQ/HcpjZvKRi4K1xlI4rQxP0hVCWj8bD0Cd5TzT+LarvObjoHWQr4RtmiP52TyEl3GiGeV8NBn
	OwUynDXZkBJ/v6nB5rATukMCy64yftAH0Ljd0lp/KjH6jihk5BnkXQ2UaCoPOADkhhRrrCd7vNn
	PPgWgY3D+jNT8393OMyWkqeJHLAKF+KpL+1NQJZitT+fDmvpsqIDMdj0Vm82lo2qg5VA1/lCBkj
	Rz1GF0XUXUVjWeG3PGlguPhhA+EyDZ9Q5LiKd0v1e9BFHv1ZZkUQtPfuMPZH8jVMQTMJ73x7qwV
	syDQj5yuoW0xqkpwOR5QT743qnwo9+FfC9kZpta6BWVRZtYWWoacaW3+295ku/nDfnoIedkRM9x
	gE2IJ8L3fb/+g==
X-Received: by 2002:a05:7301:608c:b0:2b7:13f5:43ac with SMTP id 5a478bee46e88-2bd7bae9fbfmr1697542eec.15.1771720646135;
        Sat, 21 Feb 2026 16:37:26 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:73d:b075:516c:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dc167d3sm2383191eec.24.2026.02.21.16.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 16:37:25 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Fabio Baltieri <fabiobaltieri@chromium.org>,
	Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] Input: cros_ec_keyb - use u8 instead of uint8_t
Date: Sat, 21 Feb 2026 16:37:11 -0800
Message-ID: <20260222003717.471977-3-dmitry.torokhov@gmail.com>
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

In the kernel u8/u16/u32 are preferred to the uint*_t variants.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/cros_ec_keyb.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index bdbfd219f2e8..2f78a19521ab 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -59,8 +59,8 @@ struct cros_ec_keyb {
 	unsigned int cols;
 	int row_shift;
 	bool ghost_filter;
-	uint8_t *valid_keys;
-	uint8_t *old_kb_state;
+	u8 *valid_keys;
+	u8 *old_kb_state;
 
 	struct device *dev;
 	struct cros_ec_device *ec;
@@ -145,11 +145,11 @@ static const struct cros_ec_bs_map cros_ec_keyb_bs[] = {
  * Returns true when there is at least one combination of pressed keys that
  * results in ghosting.
  */
-static bool cros_ec_keyb_has_ghosting(struct cros_ec_keyb *ckdev, uint8_t *buf)
+static bool cros_ec_keyb_has_ghosting(struct cros_ec_keyb *ckdev, u8 *buf)
 {
 	int col1, col2, buf1, buf2;
 	struct device *dev = ckdev->dev;
-	uint8_t *valid_keys = ckdev->valid_keys;
+	u8 *valid_keys = ckdev->valid_keys;
 
 	/*
 	 * Ghosting happens if for any pressed key X there are other keys
@@ -259,8 +259,7 @@ static void cros_ec_keyb_process_key_fn_map(struct cros_ec_keyb *ckdev,
  * press/release events accordingly.  The keyboard state is one byte
  * per column.
  */
-static void cros_ec_keyb_process(struct cros_ec_keyb *ckdev,
-			 uint8_t *kb_state, int len)
+static void cros_ec_keyb_process(struct cros_ec_keyb *ckdev, u8 *kb_state, int len)
 {
 	int col, row;
 	int new_state;
-- 
2.53.0.345.g96ddfc5eaa-goog

