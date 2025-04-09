Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483A11922C0
	for <chrome-platform@lists.linux.dev>; Wed,  9 Apr 2025 06:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744181436; cv=none; b=e66ltHqBt++fga9tRnDlxa9jD8bOWc3h23JEZwkOfdi0NvmJvtnne5BVYXpBzPNYOm5qBZTtz+SMtGIA3vpKNmW7gwqdzf8sNTk7uNv5mvDj2ScMaB3kRqmu3rSwNrAgH3AgLTEiclEpwjzDolqmrcP8QTivDp3+Yj8YlAuUWIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744181436; c=relaxed/simple;
	bh=lzJPNu/ho7QoswrV6WnWRkvoPRlvvYAh73zB3hxTIVw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=VDepYV2/phTg7VU6rvcnvF0YE323ixy0Q8ewuAbU/cCZFxgHN3pmZGdHJjBbs5uEjg/hGxuZ2SMJL8d3ekVskynuoO+JFz0Jf419pdxZFQOs3TpNdKAHJciXsjOStIkjQOA2YQaDjm8Tj7yGqUM9HQmPuGKPIiRaVsLHtQj26b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com; spf=pass smtp.mailfrom=quanta.corp-partner.google.com; dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b=rnPR+wBY; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b="rnPR+wBY"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22580c9ee0aso69625035ad.2
        for <chrome-platform@lists.linux.dev>; Tue, 08 Apr 2025 23:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1744181433; x=1744786233; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5118vdKYBhBBOKePz4luIaPeX9QCXZzRMgQUdbYU/AI=;
        b=rnPR+wBYle7aJ9y4Doy8SCPgOSf1kwYjSB1R4eK/+g+OXnk5vmh+KGvbIk36vhWrjD
         UdmErtM6k7HReTf3J23E71cBLRMGnkzmyDPiWgWndmGmBsgl5gfw8/Ixsg0UtY0P0J91
         hNkVgfW4aEoxuBaTWaEWGyDuk48RzyJi8BEDyubYNi0ShC7zzXzGKBz8aSwfDQ9Y4d2I
         3p/eRivAuMycO5fUPHNWW26Tp/AVTGPiCuTeyrAr2R9pZaZQ/+fZqKp5I0GKw1yUJ9mb
         v+Yp423NfFCqoFoOcVKiI3TP63K0CF38tSBJoBQ27WTsNrmsEP/mlami5G1eP9LcCrie
         Jf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744181433; x=1744786233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5118vdKYBhBBOKePz4luIaPeX9QCXZzRMgQUdbYU/AI=;
        b=tFe+6vxdzenbsVNEylvvWxNonjcOPsIHpXxeal9ZkvA92TLT0BWVpdWAj1uiLAMn6w
         YVftWXHKgxtBU9cz3UlEnVC08rgK1Eyt5EZsCsD+DwG+iNXZ+IEQkHDWnNQtFn27S0LX
         FWGZaZxtJPQStv5iQLswvsPycFwdHiBVJMJlXXGv2HttCgXhkK3BRaSb52+K/KTY8Rql
         YQOa6hrzuZ3v5743O1RbKYDIMgc9yZznDvcZBDu2XmM+OoKlM1aw5CXEwthNWjf1Oxc8
         eOn/2TjGgzoTsASaZ7EmZSw6Qa8GAv741kjjllFxSn2nt2Cijs1bly1knRAL2UVmvf67
         lIzg==
X-Forwarded-Encrypted: i=1; AJvYcCWajhyB1CAkF4ryG4Ivnoj2ApH7w4P5KBaQNvfsBAjaU8FF0TlImwGHQQstKpDAmqbNHFaK1yPrQ9NN7fM6hhI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6Pw5OyalZeJFXwV4hZ7RGHR2MyoJvb5edzXh/0c5wMNiGuvDX
	wjzMxvLYQRMLb2XeERPnl/1+796KXapLfvR1fMxft/nkbWbLJriTcuUF+JDzdm8=
X-Gm-Gg: ASbGncuYWeBtonu/R49fFS8Rnhe+He18BkcngbMqyt7nYNlnNZy/IOMUviHjEEtPaIU
	3BqVh6IRlBl7ItCx9F4QBNlVeXGNwuG/r7/RZ2FcR3XSDmjegaohOZGX6oCd+rKeBwFcYWlQm1c
	wqfrNVgmM/NfWMQH1OP2j6I/ehKQEbqBXiNl3gCXPC7V+ixIqwj07Sl6y8L/pgTkoQxJ3Jkav36
	jDAHZ0hGIh4mc2cQjqpVJLSTjBtV1vo7R2wSRzGuGER3G9UfD1tZ4JT3xIlF5cBi4tWw8vPYtNZ
	GVxwVFUCiTJOag0p7DrBvpLHCv8iIlnJnZ8e1+e2rvhcE940Wh/6nHqQAiT4RouKNe2CMDngemN
	GjBg7efEzRHmNMY57pnQRbJjwpFVxfA3s8ceUlCmRC9VMcP8cetgXtyiLqbHb3YLXr09Iw/7mnx
	U=
X-Google-Smtp-Source: AGHT+IHD/fcSTYcWjVLug8eNiUB0tiAbpo7VA3eJHkJExJWi+Ls8UggqC88792E4rbXW3ZUyHbHK6g==
X-Received: by 2002:a17:903:2f86:b0:224:10a2:cae1 with SMTP id d9443c01a7336-22ac2a25780mr28913545ad.37.1744181433539;
        Tue, 08 Apr 2025 23:50:33 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e356-f6aa-64bc-0a4d-57de-afb7.emome-ip6.hinet.net. [2001:b400:e356:f6aa:64bc:a4d:57de:afb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c97a1bsm4308235ad.148.2025.04.08.23.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:50:33 -0700 (PDT)
From: Ken Lin <kenlin5@quanta.corp-partner.google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: groeck@chromium.org,
	Benson Leung <bleung@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	chrome-platform@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [PATCH] media: platform: cros-ec: Add Moxie to the match table
Date: Wed,  9 Apr 2025 14:50:12 +0800
Message-Id: <20250409145007.1.I78118a7168f9021bb12e150111da31de39455c27@changeid>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Google Moxie device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

           "Benson Leung" <bleung@chromium.org>,
           "Hans Verkuil" <hverkuil@xs4all.nl>,
           "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
           "Mauro Carvalho Chehab" <mchehab@kernel.org>,
           "Tzung-Bi Shih" <tzungbi@kernel.org>,
           "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>,
           chrome-platform@lists.linux.dev, linux-media@vger.kernel.org

Signed-off-by: Ken Lin <kenlin5@quanta.corp-partner.google.com>
---

 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 12b73ea0f31d4..1de5799a05799 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -329,6 +329,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Dexi", "0000:00:02.0", port_db_conns },
 	/* Google Dita */
 	{ "Google", "Dita", "0000:00:02.0", port_db_conns },
+	/* Google Moxie */
+	{ "Google", "Moxie", "0000:00:02.0", port_b_conns },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.25.1

