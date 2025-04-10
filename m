Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EAE1E47C5
	for <chrome-platform@lists.linux.dev>; Thu, 10 Apr 2025 03:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744254277; cv=none; b=L/d7dju6YwlKYZ3N3xcIUtTsYPmhgbrX0fXPjQDy/FMVOu93ndQ7pUkVXHIf2EG0QOHpx8Dp1dcfBy5OA8d0x6QcKr6ictDVcLscRPmqQ4GHQtg9xRw3DYv0FBB+MuVYkJKof3ca0XfIsXwAEQONUdUJEWq+IjFcnWd6bKSedb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744254277; c=relaxed/simple;
	bh=n9QosFtSbeNeSbP34lrbIPOZ8CcsdXMCj9ufOqlVKmg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gj9iWp5QqdK03KnvGUmzsDnaZP75bSPv/nPh0NjM16LsO+PICeYUuECG0vRiCniTgOey9q3WtJdCvG/Zjjan62CPorPtCzXJopiM68o/o6+T5l0aZply0gtnbd9M7ic9BtqVQui12W/D7VEbVOQHT4tDFnuVMS6yUCiI5wg73Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com; spf=pass smtp.mailfrom=quanta.corp-partner.google.com; dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b=QDTSxWOB; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b="QDTSxWOB"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7369ce5d323so231061b3a.1
        for <chrome-platform@lists.linux.dev>; Wed, 09 Apr 2025 20:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1744254272; x=1744859072; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9GbPHC4XyIZwMLfb2UD9p5RCkxg4ygXrRY6FVcmk18c=;
        b=QDTSxWOBT6sVjO5L70zuKvq5iDi+WcL8ZUP6X4hKtmFr+6GNKu5yE4857yOdLiefrN
         GBim/XBq8+JY9jG+8ijaI3rkj6gYg03WQ2idfvHyEXqG5VKGsMocl4eJTLkDdvd7rtav
         abCGyuod4JqN1VDtE4++Kozem/nFndCkkK240q9KowlHI4/4A7YuAB+n+PZmDCrqy+nV
         SnXzbMy14u9/YZhow3rhcPlV2LMAWdfMF8r3YPo/TX+51b3h/q3A8ddt5pofHEQQ2OxI
         VupWNywHJ4SC9mWbAb9HSqOysJdoTJzolCDwV0yy3PGuQBt0eMVhUPwDsa6HaFotc7kN
         yteA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744254272; x=1744859072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9GbPHC4XyIZwMLfb2UD9p5RCkxg4ygXrRY6FVcmk18c=;
        b=SSb9JQcpf3fswRWRPuMY3pv6Ee8mY4xodwtQacEr+/AlSbpZGUICd5ySZ7qcDB0Liq
         mjNbY/jFkkz2e/Yx5RW0cdcbUTdIPiThHdSav1UoVn0HF9iQHGrfmTZXLMrTHUahBlu+
         L2atdbrBucP6E+KLRxVlRt3ha4Q/ySeWKNvVy+pPU3pYaRVPj9PPOlZvtHLj4TkQ2ytT
         mEWIJKfH+Yf/x+BPnCcFZhn7g8uJlhCIVFSt/FAiGzWnm1iO5t1morncI2pgv4aVyeHf
         jS/Frib0FbRl2RxvVe8plE6Uad+E27SbNUEyiIPz/ucJ6FHnU7GeOi9PE5IYH/Eud0br
         zQDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG1VQsge3djJh5ptP4ort3tGGbyB3L5F19xnD/CQJMknb1BYcNK87jSaaMO8E7Q2wYKHRhLkJfTuFAaHufqbc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVpX4DJqXCYngdic0IA6i4oWJpcbk8vNYuZae/v1T/JXnC6ufQ
	K7TVXBvqyu6P7VndXgEIqp/9e7IYWCj3eSLL6V5qLznyREQs64e7PKMt1Avelzw=
X-Gm-Gg: ASbGncuE5vO93yoViGBUEjgDrY3ep0ZalAyP84deu/nB0lb9V3vO9wO73bh0oVt2+4D
	s4LPyHK+/kNGD65i34uuGZvUvzShHjgSt+gLNx3WHaZkKDoROp3GmMgTRLiJ9jvz4agpvyB80PW
	2ofc8B+zhWwtQtnngpHRqzkmytnVc8ILgvklZCfCrwU9lqZ8TAv1dXuvJHVIWx0M2Xr0Ei6Dlnx
	HTi9vmIZjCFUaeiGZQqYkkA1qqTbmEFlH+E1M9HAt+dBbe1CNfXbzkGMt29DAADzN6DeD83ePOA
	64L7V/AQb/N3/fh0sROgOuzcrkSVwEqFuIJ3ihmJHS05m3LAIn3v41pgBDqjYqh/GvhK5E9x6ew
	pdaNdXQr0egIYpZTB3sztihrcsIMkm9nswFYiedM3A/KZxbHArJZJwkCYxeC0T6fPVhqKTeSyjd
	OI
X-Google-Smtp-Source: AGHT+IFxuMTEWXNHvY+DER3MAoYU6tYLKazUmZTcSJ+oZr5QmtLIkDa2HAYg6JAlPj0IBAYGmH0A5A==
X-Received: by 2002:a05:6a00:4642:b0:736:d297:164 with SMTP id d2e1a72fcca58-73bc0a14eb2mr1091377b3a.1.1744254271685;
        Wed, 09 Apr 2025 20:04:31 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e356-f6aa-66f7-bbbc-393e-d9a6.emome-ip6.hinet.net. [2001:b400:e356:f6aa:66f7:bbbc:393e:d9a6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e69700sm2233644b3a.172.2025.04.09.20.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 20:04:31 -0700 (PDT)
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
Date: Thu, 10 Apr 2025 11:03:59 +0800
Message-Id: <20250410110352.1.I78118a7168f9021bb12e150111da31de39455c27@changeid>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Google Moxie device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

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

