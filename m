Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403C122E3E3
	for <chrome-platform@lists.linux.dev>; Thu,  8 May 2025 08:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746692546; cv=none; b=GoGTGeHwx4fagsNhHbf8FNm88g+zYYCedHWUj+Q+2QcraQDtH8TdGeCfZwdeA5tWU+zi4PmhAlxyZYs0vdD+gRa48kzNSuErbF5jaTCVo6Kfeq+GrPoWjHdD9JvEPr0A8AP9fVF1ncgkc+ONYbCF92EVDDaO/i8YiUpTeZnLykY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746692546; c=relaxed/simple;
	bh=SbW5avzHaWU49AR278z0p1QzFkuzF3Da3gfRm2cmijA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oJqe5YD8tSd/KirP9m2Vv7UcbFmZezFH2XEHzcL4aE8IrQujJrJJ90Si4yX+FnVwB8D0jhpAwzaZVNpR0iAob+dOg/5BseJpDEIONCduh1sT1A7IT0qoEjzMhrtxrIw13ZE7yO0P3AmO+20SjKOF0RiXDSyIvOgI4e4JJpcoVAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com; spf=pass smtp.mailfrom=quanta.corp-partner.google.com; dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b=DBOVAxpW; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b="DBOVAxpW"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so754830b3a.0
        for <chrome-platform@lists.linux.dev>; Thu, 08 May 2025 01:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1746692543; x=1747297343; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KkgycOKsn9rzANw2ASc26EEMyuH1deYSroQ2oKDRKiQ=;
        b=DBOVAxpWvq6+Y0WV6nhwL8wmyYe0QU8gFMK6nP22em6a62nCTp+aT8kjaswKPVwqc3
         wkwlxZv7yyjhkgJYh5BBuHNE2QjP7AWqFVsWwx62wgJYQJBZMOWegfsy4e/V//LVLuqT
         2q7XIzAIU2Gw/VpHjmPy4ZOZCKdEK6dnfq8ck8FP65K6HIQBEa1XN3fgdPb9z69ePJgR
         Cn0734khVLb2BcfB2I0i1J8ebIF8/CzFVjRwjkPPTz4QanjYDyIQuyejSmlwVWSYXp6Y
         nFy7HzsrhQpC8CPG3lBKzI9qb5SItqW4Lj9W3LvRmjkPUZ9UAgICOiEdnrlQiFKaGtE2
         d2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746692543; x=1747297343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KkgycOKsn9rzANw2ASc26EEMyuH1deYSroQ2oKDRKiQ=;
        b=eXfuoRPGQn0MEPcGe8NQhvCRWugXuQbHoLsj/SH/q3WXFqPGLizu9pcM8aa226OBy2
         +JAJnpRaWxXw9QGbhoE2+PxdgcP8ifX+impUdbGci6FS4Fak2GRgKbGCLVqAUeVWIl+M
         ixexf2b9yZm3V9AY17DERLeTX2qwOcX5BwJnLneEix363WrD8yY3MPr7/FV1nlbog3tx
         +eiCBCL+6XR0u3RA84AK1tyDu9svWF+wWLoxrNe1Gr59qFA8XCtX34a3/hIuK7Op80bn
         2kBF40e8nYs9mWyXe369HW9u9oOnalfsQ54m0pbySGlvxBr9gQcpZgcWPcHXylHpx6v4
         wnQg==
X-Forwarded-Encrypted: i=1; AJvYcCVb7z2DohpIzSlemh0NJdfUd4sTNrJI6wZPM7xeuosBS9ej44X6X7LH/A/4Ttt63tmDGU6smmaR9wpiC3LvZ/c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9EhGVna7VpHqo1PGdPoZhLwXK92UakhFelxU0v+sDa3pHFt8g
	75E45adrzVfO2DCFv1kGVLAzgilo3PXSYWamaQAc6KszAnChjxld0AYliHGNSww=
X-Gm-Gg: ASbGncu1rtqlnstw0UCGjB8fc0jy6tNwY+mjRObi/812RJNWrYO1p7TIyZz0yJ483Su
	pJAJ61IbcgTJr/5DX/GgOP1NSyOFfbkHPufNiJJdCO66YkFOe5PIYRcFhxzI2lKq8A5J7BDNb0L
	xo0d2q21EIJk6XMT9EiqRW7cWo/8B4N4g3mG+FMjUaU3RtvnrMw6yv7bJQZI+AI41LrLmyvmBDC
	LAAdivcMTOFUEWrF+ghkFAZhZFM0CH6fz2V1hDPblUqNeiwUIBKW8NIoC6QJ4EgVGW5ih3VZVcF
	HZS0d2JPpO6EQUweys3KZPXLXZBRh0iQfDPArpHPzxMZWxjGYUtaZ3Q3/cUq2/2jGsRbVXIoZnY
	5bL/Y5xxWv45aB9N5oXSkuExs88imo/B31UKtpO1oq9MJjC026BbyuEi+dTU=
X-Google-Smtp-Source: AGHT+IHh6/dRcAY4q4e72XSHH6l8kN5iTSUPT9veRBZSGN5lb5me12RT1bksMwi1d5S3wjdA19MU2A==
X-Received: by 2002:a05:6a21:3946:b0:1f5:56fe:b437 with SMTP id adf61e73a8af0-2148d21d093mr11797135637.32.1746692543562;
        Thu, 08 May 2025 01:22:23 -0700 (PDT)
Received: from kells-Predator-PTX17-71.lan (211-75-10-161.hinet-ip.hinet.net. [211.75.10.161])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3c3d6bcsm10879881a12.61.2025.05.08.01.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 01:22:22 -0700 (PDT)
From: Kells Ping <kells.ping@quanta.corp-partner.google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: groeck@chromium.org,
	Kells Ping <kellsping@gmail.com>,
	Kells Ping <kells.ping@quanta.corp-partner.google.com>,
	Benson Leung <bleung@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	chrome-platform@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [PATCH 1/2] media: platform: cros-ec: Add Dirks to the match table
Date: Thu,  8 May 2025 16:19:03 +0800
Message-Id: <20250508081904.632442-1-kells.ping@quanta.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kells Ping <kellsping@gmail.com>

The Google Dirks device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

Signed-off-by: Kells Ping <kellsping@gmail.com>
Signed-off-by: Kells Ping <kells.ping@quanta.corp-partner.google.com>
---

 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 12b73ea0f31d..a8d31c3126f8 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -329,6 +329,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Dexi", "0000:00:02.0", port_db_conns },
 	/* Google Dita */
 	{ "Google", "Dita", "0000:00:02.0", port_db_conns },
+	/* Google Dirks */
+	{ "Google", "Dirks", "0000:00:02.0", port_db_conns },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.34.1

