Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA652ED178
	for <chrome-platform@lists.linux.dev>; Thu, 26 Jun 2025 18:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750961114; cv=none; b=VFAvcTXlEW/+JcVMPGVFzgWjJhy45CoLjjAEKFCBWqpVuOxcJi1pOFcEdX3KISvRkwMXGq/wT4s9RYeTIguQP01r4hBj/yo9ZKdM5k0oF2LYGWyPpSxqrmp1dZ8raNmyQYhin4QYDf2Zh7xZiYZZ6+czFsXATir6t7soKdpxRgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750961114; c=relaxed/simple;
	bh=HT1PZrDkhp6DI0bsi07qe2ZDkBoSKcXmqoFHOkEVHss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eO39yUcNSjk+m4NEm17OzVs13whG9f/lU5OHkNJT0vvKnv9X3yPo8saTVcmqljt/VUP127wog/y3s3bTNyXMrXkJyz+PG0Mh+vg1GDblb7WFbhPT2bpTNGohFaSaXaPZo2imLRaBspyiW9ICRAaCRGo/Dpz+upXo/fKRnbH0IVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JFEdrMzy; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JFEdrMzy"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a58ebece05so13832811cf.1
        for <chrome-platform@lists.linux.dev>; Thu, 26 Jun 2025 11:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750961112; x=1751565912; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QiZwuPd0AoWibuQALk3DmH+qz68nVTZ0UFoYX05f/uk=;
        b=JFEdrMzyVvochWJ/CV9BznJAj2WhitC6EciUgLeRTDlKZXJdr4kmlnPKi8ehczA9nq
         3k3FNRFPh9cZ1+IGZ1KALCXMOVH4mF6egWKVomkqQOdWSBgJUb3ZLya4iPxTT43DBzg6
         i1XqkQZ9r8W4zFaBJ7ht5N4G67xcpoXJctQMhnVjQZS8L3gWLIO4zkZnOQqseRwZUNSu
         eoH+e4Q0pbgETFvwHXrFPHUF/eo8ZU3CtFU3zM/RdpAqzP5I6hziDhScviPKHIrQesNs
         MTqVxDeoiMpq2DnJNISQVhW4xCqt+JrBDa7VjmnY1Yzd7ILt/SuLv2DHKenj8OLLkrwm
         bBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750961112; x=1751565912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QiZwuPd0AoWibuQALk3DmH+qz68nVTZ0UFoYX05f/uk=;
        b=tRy7cKWQCY6n22XnVqHJ3dWOVmhxB8mgjrEopWFtp0MLI9c8EN4z6iVV/iobd6dyAN
         j519bb5fERZThtKmvzIjYdG7uCjH+4CyszjfS8uKn67wv5Sh4P7PyenJengRi6HERlQx
         loLMehscQFd42yphyZ0w6izMMVHou3eItwfJJD8/gdmjzUWfnq0vqcpoOYVBsaUanFxN
         4n5Uh3KLNMfupaHgC+3WSn+pg7JbaY+RguoCKLIEEWK0dLeBAVeMs9wS8hJ7CeaY7tVF
         mrFEr+jZvRCW2zfFV6+BMBM+4iPi0Z6G0UAQ631e/DXbgVW3giFNDwqZZZ9RYmEDXwW1
         Dt3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwqokEYipc8jG/KAWsrrj9nwK+lckJxKS3iY3IAAlAgkoiRwcBYd/0qUCSXpwrr7B/OHPusWkOWANxLU2fOcY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9PvMAqNuxqPNQaqaSOkAcD9OjH/akY7Au9b7WrujkQ6et4i20
	EpLG7UusEEhZTJnZavUP/ZkVa7ftruA0ncMn+41Drnb770LAnpi6NJzTka2l4g==
X-Gm-Gg: ASbGncsFRqdRSxzxLFVQmle+cTORXhFeXUX58Ek3Eq/6w6ZVfK1xV/SS0lONzgvEqlr
	S0B23KZ/nkkDMb/4d4UCh2377Ui5Q1eXd4as3EVFlA6NdMcGAEw8bqPH8zXhyX3lT3/VG80lHyR
	H06mDv2vuv4Khl2960Puhn+NRnHtRAfL+SUhep/wDFqbJEtDUqsZ8pEBnjzbtX3v2qqtFcy2/3m
	S/oj2J5sBx43MjtN5gU7W8y4YRnBMOgejsW9VunO7lEfCdlcSTtMP1jxjbzkXm9rtjJ7OSr1/CH
	YrSLMFirem1Ml4vdGRCgo9fa58qq//q4N4Z/lBkcdhVheygQvW41
X-Google-Smtp-Source: AGHT+IGbRlpKvop3/AmtVImyd6B2YeyRgmfybmkmwd5OkdszlQLMfeR8n26u//jopIyoDGEL7mZGiQ==
X-Received: by 2002:a05:622a:1e0e:b0:4a7:234b:222 with SMTP id d75a77b69052e-4a7fca38a72mr8087771cf.22.1750961111867;
        Thu, 26 Jun 2025 11:05:11 -0700 (PDT)
Received: from fushigibana ([2601:405:4a00:186f::50e])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc560477sm2083581cf.41.2025.06.26.11.05.10
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 11:05:11 -0700 (PDT)
Received: from pnariyoshi (uid 1000)
	(envelope-from pedro.nariyoshi@gmail.com)
	id c5e35
	by fushigibana (DragonFly Mail Agent v0.14 on fushigibana);
	Thu, 26 Jun 2025 14:05:10 -0400
From: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-media@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	MrChromebox <mrchromebox@gmail.com>
Cc: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>
Subject: [PATCH] media : cros-ec-cec: Add Fizz board variants, so driver can detect them
Date: Thu, 26 Jun 2025 14:03:41 -0400
Message-ID: <20250626180429.463420-1-pedro.nariyoshi@gmail.com>
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
previous error in the subject line)

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

