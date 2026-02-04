Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C00828BA95
	for <chrome-platform@lists.linux.dev>; Wed,  4 Feb 2026 03:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770176935; cv=none; b=fM67Ve41hYVVW8rhVw4UbezRDWKogcMev5n7BjBlHwVZf17jFqhjDRLMypFV0xua1DiDVDGgJ8QCFXARTWTgrwdANj6ssz96ozHOp/saR+M176klhTLzxqqWAkOqOiY4qD775OPNFbIr9QvcL48ifHiw1d0DWxjep2jAv4MVxyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770176935; c=relaxed/simple;
	bh=UTEu/hhov6kTfiR5DLh9JMFg4NP96DCLLgYRQOyS6E4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N6tTIt15ryYoe91xoFExWAwXRjgzFR+T+ALUBxTw8olmCycHdPHNTX4Pkh9h5e6bROvojZuyIvpWkCiXvgFdRBN8pTQgZsgId62GgVGBL26P5LErN5GtpQ2NzDFz9jy5/pc9HWcwnLXW8uiBLuMn0S2N78fDI7uIgPaj7hUeuxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PJlN4GQo; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PJlN4GQo"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1233bb90317so411460c88.1
        for <chrome-platform@lists.linux.dev>; Tue, 03 Feb 2026 19:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770176933; x=1770781733; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EpR6mUnl3ZtiluaVek+fSFgssF9GzB7lN+E8ezDh1H4=;
        b=PJlN4GQo/XUtayD55ZeTaHjCEgKSkB4XVNB0HPJnj5zX1N2lMp6AC7zfGM/YUKefCW
         F8xUrTWrL8doWKFV3TEfWoWKBfJoydTLyg7cQmxK3bwKN4lJZ0elCmSpNYislJul4r9/
         T65PO1SNWruLfvEQLKXYjpwy5FhohpAkmzbv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770176933; x=1770781733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpR6mUnl3ZtiluaVek+fSFgssF9GzB7lN+E8ezDh1H4=;
        b=a8BpR5V3+qWY/ehSvGMe1dLSBQhC/D0CAUhBTk5ERSKJUFjQJtvL0HEVd+EiTjSTCW
         UwUwqzE4YTeod2HSwuYOyzIfEFCGQ5MjyFYyGQadH4tLOHr+W3hlkoo74fWUQ7Vrn619
         6xYuDdiCaD3wh4JWNGut9Lj8ojy4zOPT+Shjf/MXWBPBPXxSjELPuk1sWnzo4BC55E3i
         97zK3UDTVu6hF2xVKHmK/ZxS/PdAF1Gz2o2OLvOdzNIgOUlK1Y6/pDvcNTxHehhy2Bnz
         o1aPZwWQfL9AaxcwawQOTVby3ROq60exG304hhra+f7fOwvNR8eKDGh7IRbE/gQ+h7qT
         SeDA==
X-Gm-Message-State: AOJu0YwKVoWzZo1JcykmKOdwKzy2N75GtHwMm01k4BZt4hBU4QKHOZ55
	tkdvOFXwWHpw/TBpwvyPgRpLhWC6dWdLhNm++sdwhmp/AomfE6OKEfjJX5a6DjCIE1oQuq0wuca
	gpMs=
X-Gm-Gg: AZuq6aJQq4RoXq727itoMXl2G4VjFrsrw9Zf2YQHa3QPw+cG2PDsM2Xpn91I5NVuZrH
	XB+bWT/lUYHwM9/sNUs13cBcq0IAUt0n9jaISQ2ifGXIEEc1EI5Bv9WQxHXw9a39/MH5btYpOHJ
	irYZP3wTLmmgCOiChEJziNfn6nyGQaUiFSBrkxTcbdG/BGJyCeA1gswKoArxRrPCsu0CNfvZQW0
	xVJk3Z6MUJNbCOKp3opQwJwOmDjPUGpzA9QZmG8fTne/qXPfl180fLYeZ65F5+DruCnWf6iaxUY
	L0S/9Xht8slDqXzyIELSkO7nsU++UDyhrlkuOxKLmtLW03ZZ23Tn4a9tPLPzPUuO9Rxx+CGhwHz
	0HhkBTnindoR3Qv81PEQEuFZoj35J5fI48Jn9r524XpI+TCWyoMJFyWGd2hYnZfmPS1IlGaklhK
	lOnczTa9IKD/AqF3bFpuhnKwI1nyyYoIRdgTIQ6FyrWvE=
X-Received: by 2002:a05:7022:2512:b0:11a:fb0a:ceca with SMTP id a92af1059eb24-126ea92ee34mr2125127c88.16.1770176933162;
        Tue, 03 Feb 2026 19:48:53 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:f344:7386:c61:daf2])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2b832fe43f6sm815101eec.33.2026.02.03.19.48.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 19:48:52 -0800 (PST)
From: Gwendal Grignou <gwendal@chromium.org>
X-Google-Original-From: Gwendal Grignou <gwendal@google.com>
To: tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev,
	Gwendal Grignou <gwendal@google.com>
Subject: [PATCH] platform/chrome: lightbar: Remove [0]
Date: Tue,  3 Feb 2026 19:48:48 -0800
Message-ID: <20260204034848.697033-1-gwendal@google.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Variable arrays should be defined as [], not [0], otherwise
the kernel complains:

memcpy  : detected field-spanning write (size 9) of single field "param->set_program_ex.data" at drivers/platform/chrome/cros_ec_lightbar.c:603 (size 0)

Fixes: d55493f6d2da ("platform/chrome: lightbar: Fix lightbar_program_ex alignment")
Signed-off-by: Gwendal Grignou <gwendal@google.com>
---
 include/linux/platform_data/cros_ec_commands.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index bddc7568158e..8080a6fc6c8c 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -2028,7 +2028,7 @@ struct lightbar_program {
 struct lightbar_program_ex {
 	uint8_t size;
 	uint16_t offset;
-	uint8_t data[0];
+	uint8_t data[];
 } __ec_todo_packed;
 
 struct ec_params_lightbar {
-- 
2.53.0.rc2.204.g2597b5adb4-goog

