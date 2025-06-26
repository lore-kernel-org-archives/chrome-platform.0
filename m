Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CB920487E
	for <chrome-platform@lists.linux.dev>; Thu, 26 Jun 2025 16:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750955005; cv=none; b=SqsfrMmURDju3z6IJ0ay+aPC74bQ30/+k/q3dHB+GLFcCWa72P8VH3Wjs8YzPvSYzk4iPscyG28URfm33qO/sDAgoW5Pt8hwbp44d7olayrAHaqFP9eUJ6dgSsjRafFKvCyXmQvr4tromxmVYDiVUCGemu1oTYelN1Ek0AcOacY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750955005; c=relaxed/simple;
	bh=oHxJu3J1I3/pWQoPXHgh9afJCpFm5sCTLU1HKlRrQY8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=srBQqSMr9D0v0mDKRITlSv+7X1c4D6EDv9lrAosRgZUOVR4s8HLOTDjCyWIFpJbh5wQSNgGjQe26Vo9F0ECbh2eFwRDM8sqUw41l66aWz+C7q6Nt8/5SF1fkgn6RwPQqoMgu4NbgiO0DH3AU29KDGG5nQ3aHVuiNHxQlE0/I+1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uiz8zdeh; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uiz8zdeh"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7d41b04bf6fso122149785a.0
        for <chrome-platform@lists.linux.dev>; Thu, 26 Jun 2025 09:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750955002; x=1751559802; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I6Y+w9GjzC4NkgAs20WBoFAeBxQI03y6T8/aweQBwbw=;
        b=Uiz8zdehuwNmul3cfRIG/RgYKgH479BMjtbe/aLdJszwJL93mE2XgI1k+ujwsaT6y+
         KfQWbwGl98Y0DupY4V7Hxqmew2PLh+xJ4s9AEb7bPjJ6zyYL5tpUJF6BzbFOh9TwLmah
         IdU6DbRBvEX++D2AYsJ4p8s9CV8ADLfC2mp/t59S7pTZJf2vxUTLJjMj/pb9m/jcNsAw
         Sn7qwnq2n4C38lYILPhg5f3ZkRcRrGqyI51bfWvHlU0Bem+FlFVjIngsJOkqIplluKft
         IhHhUBwr2h1rqnhSJCUHpapsyyfpUg6CQzDlwnKCLlPCS2JNGqDparP1d8/SuRAO8dz3
         PgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750955002; x=1751559802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6Y+w9GjzC4NkgAs20WBoFAeBxQI03y6T8/aweQBwbw=;
        b=kraVlNA7h7STbqTSvPkdXFFKjEeg0AVDcdPDsiPM1CEUURQMx7jRQzpC2eyAFYPh1u
         wBVOvZFhrB6G8xgZe9JJ4N8Jk9Etgug1ibc3Vj0mbUVHUULdJAGO102gXIrnCuY0ZvwD
         ImOw+CU5iyABgtA3T2yp42cJc3VnCaoVK3uD/w1NXNlpO7xisKD/dZ5bmRyfFkcF/BNH
         lwCoy79H/M9DMC4SvUo7CYQViQD4u1tvdrOqN4HnOIjBvP9FFtk0G9bs7yzOj6J2vmic
         A4kVsF7jZiJWgMv3zV/S80ejBoql6wHQePxt8wUH6KTYR2OcJTtDgf/uBoFKx8TD6y/G
         fTkw==
X-Forwarded-Encrypted: i=1; AJvYcCUvL83hQiBY3gjL5uI1QaadNjbttX2S2MVzYSpts8Apwixs5VI7CTXNkoBXagO4xx8Qpm0ugbjJsBI5RJf/NPs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwAcZELB/d/cwEvYv0j9/EJ2Z5IxvI1/1b3qrXjaBnnRudKhaqN
	fHVN/J5tbDvPYgvWkGTmMUuDn8k0G/aZXGowJe21xH9iCwFOKJ1lrEOUMRQ0ag==
X-Gm-Gg: ASbGncuPC92zSy/fiKAnT6ph1bW/iAp39FbOMUeaf2kBr9NzW4fJyj3ZxRQhfarbu60
	OUCsBkJXOkiKcERCfN957w+YRKU5ltway6Vpz++mss+mnkCVF5EQOo4Ha9zT4QnB08QEG93SmP/
	lvQD24IMKndFwN162iKD9nHEm/tZ+5E179HzIjLmH34SHalyK8y4qj9uRTgpP623QSglyiswylu
	RkOyhiXv7fFddwc/2iXu0vKYhBEIf6pAeiBBbxS5PnosCNG3Hr6NCf/qYds2bV/yiHSvktFq/eA
	LJlpPpKjkqpq6SKrLHmgtuhFqyQRfedm2gt/LaM4RIk704FxnN2/
X-Google-Smtp-Source: AGHT+IE9zACx0AwFT+GrnMgI0SPYW6doa2YuHjYHKD247V4V7t/kTCVYjshQS8JriKsTpIkZKmNrJw==
X-Received: by 2002:a05:620a:c47:b0:7cd:4c58:7589 with SMTP id af79cd13be357-7d44398ff0bmr18414685a.56.1750955001887;
        Thu, 26 Jun 2025 09:23:21 -0700 (PDT)
Received: from fushigibana ([2601:405:4a00:186f::50e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44317e671sm20310285a.41.2025.06.26.09.23.20
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 09:23:21 -0700 (PDT)
Received: from pnariyoshi (uid 1000)
	(envelope-from pedro.nariyoshi@gmail.com)
	id c5deb
	by fushigibana (DragonFly Mail Agent v0.14 on fushigibana);
	Thu, 26 Jun 2025 12:23:20 -0400
From: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-media@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>
Subject: [PATCH] Add Fizz board variants, so driver can detect them
Date: Thu, 26 Jun 2025 12:21:29 -0400
Message-ID: <20250626162235.445407-2-pedro.nariyoshi@gmail.com>
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

I am open to suggestions for alternative solutions and I hope I did't
break any rules (this is my first kernel patch).

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

