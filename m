Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701482586EE
	for <chrome-platform@lists.linux.dev>; Sat, 28 Jun 2025 18:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751134541; cv=none; b=STCZ96lrxTwPUNX8CxNl/VPROtkj9o+M7YnyRa9See03zN6Oij3k0OG5y1sYVKUZ0y0XuAVYbeMC68fmuTdhiDchqC8C788CjJFFDeh6RTSCxil4o/pCVNdSfJ4tY/LmIp5xLLa1+E1T9Xkeb3sleQU79+7BnCbwTC3ZxxCbT4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751134541; c=relaxed/simple;
	bh=E4plUyCSI3k6l2mc6OVyIDEg2o/aLZqtXrmCeA+EOe8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ljrJN8iGGELZGCXVQ5DDyHpe38zTl6yedBEZZ1W4j5TzVjmpwWFKG+fSNLatBTMeSDXmCLAYNrTi4B25SihDm3AnteFw1xYg9xtyZNB3iWJR2N4wWEgaMTwaEUbCepsp4013UXuhigG/DJb9Mtc+9ehmRhqabi7ZZ+VBCqo2vuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VeVTTwFY; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VeVTTwFY"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6fd1b2a57a0so28589046d6.1
        for <chrome-platform@lists.linux.dev>; Sat, 28 Jun 2025 11:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751134536; x=1751739336; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3iwNAdFnvuqB0Dm2t3yhmssxKeJwx9Ii5rUOi2V7+AQ=;
        b=VeVTTwFYJ1jaaQTQJLPnmgwr++n+Hk/s7Xk7QuRLVg5izwrFEjtoyAIp159Pxxw0xG
         t6eN/yBvqraCw9B8llxrfXN491xSFyYjdT+kKC6Q0m35x03NInnx/msqEhImPVrjBUAt
         Frta0rWJNH1yv2GVfuSO7LqidibmVPzWT8scbzIYrTMA4okyCqdkn8gt6Lgt0wrdYgez
         UK6+vkl0HBK4OGQ9wvXKMx1V22jMYSdAz7JavjYGVpwBSipiP7VUNKo5zqgnt5aYTVzr
         fFB1aPi/ky01lRKewL3QLLBN7ZgQeBsQJJ9GZs8u8RsGwcg9DePn6tqe8vLMop0xMKBb
         KRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751134536; x=1751739336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3iwNAdFnvuqB0Dm2t3yhmssxKeJwx9Ii5rUOi2V7+AQ=;
        b=DmDuyPaGKTAEzrKazutU1zOmSSqIu71n4axmnr6UepITENTeW19oGTl6BmniDEjM6y
         3HI8PEJ19PQ/HSnSR3uHkY0n6f+3G2jqXJuJUcgcd+NuAhJ4edXWKYQZYCndZdqUyNfu
         GpzFC+HiQ0A13YmIvISrN9qZqFIxuGqee6p87mRaFH9j6slQIDY3vKiChmEfptYJW+ko
         CBlgxG5p3LQVjSOs0UtF6MWKkXQ7CngFdyDGVWxdZhtLvZk3WOdiqlQn3p5l1fdOmApu
         JDL6HlgMuAA9XRPE/eUhRua3DHL3MkqTHkRzeanjoBImm8MIypdUYTavNUYLqKci5FPO
         XMRw==
X-Forwarded-Encrypted: i=1; AJvYcCV/AXVbpexU/oqKtknL+EHdxTOMujM8ksDp+uocfwONZiDfpDndljff+StzwC+lpAmSuGETDszVyd8v1M00SxQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywxgnkq2aorLzHggvXv0jg+TbqpODLYJGvMgF/SL6wldQB82F1A
	mOqU251JA7A4DYK1Tdrjrh4jBllfCuuzuzbX79FM1RBiGuEpMLDCdiMWkpsKig==
X-Gm-Gg: ASbGncvPC4iD65zdGxV1LR442zeZA6JbY5mZvZaT/lIvkWtfiLCh4PHwDObPqqoW77L
	+lEyzWB5jSNq+/XGPQyu2VjSQplc9a4NbDZ5Z2qQz917stGIq+kHLIeXB49tTZQZ8KwEuJfIBAh
	nZIaJWF99eOqQAjlrrF+m9nMpovD4BqLnRq0UNc4KeTyv2lyVkB2yQ1tn5Ao/6TP1uIc+YGGZir
	6iXNCp+VHCd2CKlrZyxkuEg08jKGoz/Eu+rLyreQBKc1il6ijtbFLyecVXHS+xbq3Bc+DA0ACzb
	lZ1azSP6YAY2RpiwmG5Gp3DtTu2L7+sgzV0C0r77XhV5Y2e9mwUz
X-Google-Smtp-Source: AGHT+IFT9kgIoKGKayFfluhf0Ok4oPV7tBtPpLjbQW6DZ52MHbabScaVf1BJD+RsC+tfTb5+8lApbg==
X-Received: by 2002:a05:6214:490a:b0:6fa:be7e:c0be with SMTP id 6a1803df08f44-700036ae7c2mr135067566d6.34.1751134535980;
        Sat, 28 Jun 2025 11:15:35 -0700 (PDT)
Received: from fushigibana ([2601:405:4a00:186f::cc2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7718dd53sm40117486d6.16.2025.06.28.11.15.35
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 11:15:35 -0700 (PDT)
Received: from pnariyoshi (uid 1000)
	(envelope-from pedro.nariyoshi@gmail.com)
	id c5f94
	by fushigibana (DragonFly Mail Agent v0.14 on fushigibana);
	Sat, 28 Jun 2025 14:15:34 -0400
From: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-media@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mr Chromebox <mrchromebox@gmail.com>
Cc: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>
Subject: [PATCH] media: cros-ec-cec: Add Fizz board variants, so driver can detect them
Date: Sat, 28 Jun 2025 14:14:35 -0400
Message-ID: <20250628181530.873795-1-pedro.nariyoshi@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I recently reflashed a Chromebox (Wukong variant of the Fizz board) with
coreboot and I noticed that the cec driver refused to load with a bit of
tinkering, I realized that the dmi_match_table was expecting the product
name to be Fizz, but `dmidecode` reports `Wukong` as the product name. I
am not sure if this is the best approach, but adding this patch lets me
load the driver and it works properly.

Alternatively, we could instead match the DMI_PRODUCT_FAMILY, instead of
DMI_SYS_VENDOR and DMI_PRODUCT_NAME. In my board at least, that says
"Google_Fizz".

I am open to suggestions for alternative solutions and I hope I did't
break any rules (this is my first kernel patch). (And sorry for the
previous submissions with errors in the subject line)

Signed-off-by: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>
---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 419b9a7abcce..a26473c3cd84 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -302,8 +302,15 @@ static const char *const port_ab_conns[] = { "Port A", "Port B", NULL };
 static const char *const port_d_conns[] = { "Port D", NULL };
 
 static const struct cec_dmi_match cec_dmi_match_table[] = {
-	/* Google Fizz */
+	/* Google Fizz and variants*/
 	{ "Google", "Fizz", "0000:00:02.0", port_b_conns },
+	{ "Google", "Bleemo", "0000:00:02.0", port_b_conns },
+	{ "Google", "Excelsior", "0000:00:02.0", port_b_conns },
+	{ "Google", "Jax", "0000:00:02.0", port_b_conns },
+	{ "Google", "Kench", "0000:00:02.0", port_b_conns },
+	{ "Google", "Sion", "0000:00:02.0", port_b_conns },
+	{ "Google", "Teemo", "0000:00:02.0", port_b_conns },
+	{ "Google", "Wukong", "0000:00:02.0", port_b_conns },
 	/* Google Brask */
 	{ "Google", "Brask", "0000:00:02.0", port_b_conns },
 	/* Google Moli */
-- 
2.49.0

