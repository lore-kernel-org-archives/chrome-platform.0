Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE2815B12E
	for <chrome-platform@lists.linux.dev>; Fri,  7 Jun 2024 08:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717749890; cv=none; b=afsecg7S/7xOgCHsy0mn7G154VjaJ6N8S7f+LSfTQFqPoo4/J8MmgpK2IGvX1g1VLasTALAafzed+zUfbW4Wgnu1r8YOxjOqHK005qPquXbUj84klgdtyCdhxc6Pv+u8WnjlOKuexzF/kiqBYj/ydUWJEqvyt28YI0Si+ROCNIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717749890; c=relaxed/simple;
	bh=ihnvS0ABxYKrNQlZi5are9mu4sgy03wux49T4CEZWq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Z3YRReBGrlqDaEphttNbHsFXqotWVbqQnSJPEwv5sQPuS4W+yIVcEOj68XqUd2Vl/COFghwfIzLPOxyjtXSEGPg2oxqVy7y02eFxNto+P+6O/8ZOWnLmjjnOPTr1PrOiFv9j4s+XxcwgRa+LFLqbmFkPlZJSC/AI3a1J/ljRkE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=yeNhbItm; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yeNhbItm"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4215ac379fdso17763295e9.3
        for <chrome-platform@lists.linux.dev>; Fri, 07 Jun 2024 01:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717749886; x=1718354686; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uszGwktNGOeuCgKmkGe8cHShTeyjdwaQQjy8GQU7bhE=;
        b=yeNhbItmUCFyTJIAiolMWNLAZZ81587wuxTPktw348sQACOOd2116QiCXYyY3Yzi4C
         L+OyMj1sVbf68jaZnavOh3VCvqnkAFuwBa8lJuu+yd5b/k+TagidDQbpUEnGfa0kcV+c
         UXufwds5qGZ34p+k0jJzosLefykqXQTNubpCtEQj2ciEqw7vfxA84nGId1klb33glcw2
         +6BpbDwdmMmpdSGZo6hJNXUJXebQnG/Dm90CCJieGKsXNKCs+DOTC+TOI/iKC7cfRLCE
         hvn9OpkLwQlysVhzuFyr8DlMDhHDJXndnveN7sXuM2/qA3vJIGYI7lapvYWiabxQyMtw
         M4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717749886; x=1718354686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uszGwktNGOeuCgKmkGe8cHShTeyjdwaQQjy8GQU7bhE=;
        b=WisBIATOQYdjVYw9uetZfSoBKxtdZcenOGpZHLcIUFtc9AgOeyRxat/bEUdFtQMRMD
         RKn88n+qLGXI3p/4yYF1ioCecLr8dQeN1gDlwjfIB0nYeJP7LUD/yB3EcFbQdgtapkuC
         bn68K7r+3sPnaWIrztjOPkJqGPKWBHBsAT09P5kXCfImnhRlI0M4FEoU+nY0+cvLwiGR
         gi6qjFL90zqpklIMA9tqp8pCE2sxDFbwJdyTwY36WE4ptz8gNWe/1FJ9/sYmteOeGeAo
         QMAK2T6w7KjcHdua5NeBHf/uhilTX2FtU7xO9Vak5J6jd6jqiYSOOSPeCdePxCom7eyt
         xihg==
X-Forwarded-Encrypted: i=1; AJvYcCX6mWm89Ez7FHaB/7KemMrrBbJFJR5aeYAIQpqINwTfYXGVywKQB9Uyi5cr45iX2stq7e+tSnR7BjpN8vSim9NIzah014tnE9S8qJ4I57rz
X-Gm-Message-State: AOJu0YxlIZ5/UxOa1hxi1jgVtwrcveGAv0kcAqMa3diPSdrLF8Q3ifxT
	+Vi98pFoqDnO0dF5p/C0y47E9XdweFmgmdLh01la49xsmMHMUab79tl6T+N2D5E=
X-Google-Smtp-Source: AGHT+IEEuakaAfwi0wDeNmgPeB1P1PPMZuFb9rASp+9zaA9reljK1tQ+qlJ6Gw8SQhgD2im8pe1oww==
X-Received: by 2002:a05:600c:1909:b0:41f:e959:9053 with SMTP id 5b1f17b1804b1-42164a48472mr18734225e9.38.1717749886214;
        Fri, 07 Jun 2024 01:44:46 -0700 (PDT)
Received: from localhost (p509153eb.dip0.t-ipconnect.de. [80.145.83.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c19e97dsm46376265e9.5.2024.06.07.01.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 01:44:45 -0700 (PDT)
From: "=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <ukleinek@baylibre.com>
X-Google-Original-From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	linux-pwm@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] pwm: cros-ec: Some simplifications
Date: Fri,  7 Jun 2024 10:44:14 +0200
Message-ID: <20240607084416.897777-5-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=942; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=ihnvS0ABxYKrNQlZi5are9mu4sgy03wux49T4CEZWq0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmYshhKfgLwp6JZ+frPV+nWgJhRibmVGfj45G7r E0kqRxcFBGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZmLIYQAKCRCPgPtYfRL+ TuxGB/0VytZh0DBs7Vmgz/zYmyWJyYKCBl2yt15ghmLFeNvlrQ4oG7vqCAPxl90eZBrhc8ma9PD m46aaPW6/4fp3jlIvfhR1HQT6to6grtfcbICXJN2dS4U6Pw7Cm3yNHYh/mYocljAbgity20ljV1 RyRissSyS716GIQwKuGGfwsiUiO6BvJ3A/6zlrlQ4urfhhO8xbTYcRNWkU4LQi5HCc+LUWUhm+n 5eQ3IhIO+a0ujz0YRB0LAFlS7c3baftDHUF7PqdG1Nj/0PFP/RFDAFgMLudRmTyUvMi1dYWuzc6 iOLgoMZqu2FPSYt62q4AHBWhVe9tf31r2bp3duxUCM/09/DJ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

here come some simplifications for the cros-ec PWM driver and a followup
change in the core. The latter was the motivator for me, as I intend to
work on some changes how PWM wave forms are represented and this reduces
the number of code locations I have to care for.

I claim in the commit log that the changes work just fine, however I
only build-test them, so a runtime test from someone with a cros-ec
device would be very welcome.

Best regards
Uwe

Uwe Kleine-König (3):
  pwm: cros-ec: Don't care about consumers in .get_state()
  pwm: cros-ec: Simplify device tree xlation
  pwm: Make pwm_request_from_chip() private to the core

 drivers/pwm/core.c        |  8 ++---
 drivers/pwm/pwm-cros-ec.c | 63 ++++++++-------------------------------
 include/linux/pwm.h       | 12 --------
 3 files changed, 15 insertions(+), 68 deletions(-)

base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
-- 
2.43.0

