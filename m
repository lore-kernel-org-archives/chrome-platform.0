Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8AD2C0269
	for <chrome-platform@lists.linux.dev>; Mon,  2 Feb 2026 20:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770063724; cv=none; b=O8lovEivRomMGTkDbGSGQqsKvrfcEuh9ONintlDc9wRoR0wv8YaHUMeN8YpbDe/JYvDAg4SrlpwVYRtzPFz2quCvDsvnEap7ejFgu3YajdQSYXLU0P+ZcIh87U0hhbvC81QnN95AQ2rFf/UnxQevUDyzC7RhwQ82qnDEjkm4Ucs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770063724; c=relaxed/simple;
	bh=VYCp0c/iSZQ/5YQ3R1Ep4eo8ZNL0+2C+K4Jtnck7yGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TwhSQHmZjxUIdWC+ZK4QHjw3R+4mnKj8nLch6+Nt2Yjzl8sPMIb3ctpOR1UNnQv7jtl86glRXhz+7kYjZnMpprLpR5eP1zMxFX/mQkzRJDk+V24YBsgvU/70nUuPq1Jo6Ncx8RvQ90qle0WJ7Wfai+Ira3MH02GpI12ssF563hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aGJEcGJh; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aGJEcGJh"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12339e2e2c1so72440c88.1
        for <chrome-platform@lists.linux.dev>; Mon, 02 Feb 2026 12:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770063722; x=1770668522; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jIfeimcPgL7UZYzctleKTM/1IMbcI2Hx8AB22svUAkc=;
        b=aGJEcGJhDj0uqBzgMn69KCpSz9RdO4s8AZGWt+lc7CI4fe+NLR5ZfvJkz8hEHEdHuX
         qFKadV0qLK/18dsJMWvtFNjzS6Us3n9PzhSJ5izNN7+AoJQZHsZaQkhRPXJAnjtcGQmr
         cxec0SLP29BHQrZMHtqAZgNVP7cYsQWqQRHnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770063722; x=1770668522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIfeimcPgL7UZYzctleKTM/1IMbcI2Hx8AB22svUAkc=;
        b=JNsyg4Rt64IXE8uaYhoDW7YLKMKLZQ7lZKXgTz85+Qpcse1VHD7IpFxUEa7/ssRCJr
         QSVyVf1Ctn31SSckcYzVyd+FD1dvzsMoJgC3Jpq3ysABjZejUDkybW81UBLhvJyS46ND
         naKpDPNTvvUu5d7eUoifT1HIgY5wu6cl4zzQLYUcuUBKESNriM98Ul7cIOxZ5Op57xoE
         7DD+bIt6JzEwuCmDSHDplsOe8xe1IiI+fBabv6/063qCXNACk5/BUY8gFvbrdeRHR3d8
         PTzUa5/wdIxT7rXOM1LI//jmz8QiW13NK3I0xzLQNERqclvQUkipdKQbAfYxgHdukm3I
         UVdA==
X-Gm-Message-State: AOJu0YwnnICBFgO/bkAjzm5xIOxGYpJn+vSGtI46Lw4muoAFneqNtnVc
	wcI8GBtzucVjQBPVZlIZO+Wby5lnymvbetWGN1dWGE7Qz8YhiDZ4ZM4/PYiFPy7Gvg==
X-Gm-Gg: AZuq6aKZQBBbseTcGlWhugYoATMDUMkk3i78AhcjdRFi4Kxqv7h1Mt2iq0CDfUSOE4Y
	UOiYvaBV3MteR+T49WO0JdfhZmLactpkuGr9m8x6CjUH33/jmpJvTciXJ4bzvacL5MFOfSNga5x
	6GkOohh1WuGvHzNlZpazicwFQlaL+JX6AZuPt9npvn+OAfi2s8SWsCWNDooGSArk56+Xsq+ZAUh
	VbQFkWiJ3pwNzSXXTFkROjdRomKDC9qE8Zp7typ9N8GbzyAQI5reEikB7IN9Qk+j9HNUOhz456b
	GFYK1GYg3sXMJzccTl80R428oMyj1g8QOj6J+rPGrwuVbN2buLWcaMR+zs7cdX9bn9M6Ql5t5Ng
	ZC9DFrkKUL8CjCFXmQGAAHm5YzAxwuoyDM46lbjdtNsDYBwd5HMfZdt75XTjdTqpjHIFEVhfWaz
	wnrRRRLckG91s3THpyhVvnVfJ9n91sAUOUzyhlapDEvujh
X-Received: by 2002:a05:7022:45aa:b0:122:154:7826 with SMTP id a92af1059eb24-126ea8dcd19mr302935c88.3.1770063722476;
        Mon, 02 Feb 2026 12:22:02 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:9490:d769:4ba5:c044])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-124a9debe5dsm20226911c88.11.2026.02.02.12.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 12:22:02 -0800 (PST)
From: Gwendal Grignou <gwendal@chromium.org>
X-Google-Original-From: Gwendal Grignou <gwendal@google.com>
To: tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev,
	Gwendal Grignou <gwendal@google.com>
Subject: [PATCH v2] platform/chrome: lightbar: Fix lightbar_program_ex alignment
Date: Mon,  2 Feb 2026 12:21:57 -0800
Message-ID: <20260202202157.529680-1-gwendal@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure sub-command of lightbar command starts with a 8bit
parameter to ensure alignment.

Fixes: 9600b8bdbfe4 ("platform/chrome: lightbar: Add support for large sequence")

Signed-off-by: Gwendal Grignou <gwendal@google.com>
---
Changes in v2:
- Update attribute to `__ec_todo_packed` to fix a clang warning.

 include/linux/platform_data/cros_ec_commands.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 144243143034..bddc7568158e 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -2026,10 +2026,10 @@ struct lightbar_program {
  * EC RAM.
  */
 struct lightbar_program_ex {
-	uint16_t offset;
 	uint8_t size;
+	uint16_t offset;
 	uint8_t data[0];
-} __ec_todo_unpacked;
+} __ec_todo_packed;
 
 struct ec_params_lightbar {
 	uint8_t cmd;		      /* Command (see enum lightbar_command) */
-- 
2.53.0.rc1.225.gd81095ad13-goog

