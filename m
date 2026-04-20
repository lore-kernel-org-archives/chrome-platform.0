Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0703783AA
	for <chrome-platform@lists.linux.dev>; Mon, 20 Apr 2026 02:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776652664; cv=none; b=U73eilyWWSkBjKkAdi06so15A2wWnr2CXjYjVWI2O58cbJd2NLBnPjcz42b0FDuXUKLh78KF//MLYFRmWhW1wmmZT8ytxBXkPKWfVekjQi+fOE0xNzJeUxn9y5q2KpXPmKCZsXG2kF0/mWHRPHht8lVUsbl+zaIZiFBh7U9aJU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776652664; c=relaxed/simple;
	bh=ld8CEyg0rXDH8j591+SJR82yaUQyXvOHznc5li3fAvo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=heYV+CEt573XUsbl0zuq09MH+twZyZ+aeB75qiGU0YuR7S+3SFAxy6TnilEolqD4BlCgneUB0P6k6cOsZuzMK3T5nZVprtuXBntCnULzDX6CtJDCZ6Q9i9E3ea0l2lAutJr/73egh9jipRS7GgzMVL9sLRkKrZKuHKztpIYGXLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com; spf=pass smtp.mailfrom=quanta.corp-partner.google.com; dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20251104.gappssmtp.com header.i=@quanta-corp-partner-google-com.20251104.gappssmtp.com header.b=HEh6CIv3; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20251104.gappssmtp.com header.i=@quanta-corp-partner-google-com.20251104.gappssmtp.com header.b="HEh6CIv3"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b0afa0210bso11038105ad.2
        for <chrome-platform@lists.linux.dev>; Sun, 19 Apr 2026 19:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1776652662; x=1777257462; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yKHs/PNY/ofe4y8OFF1XE8lKpCR4K4vYDfp2ZW6ZepE=;
        b=HEh6CIv3KvUmVIBuQuGZCl4U5O848qSYSsQraoREEjWmPiw9doWGi0ajrToQKCnsRo
         nT+y3ZH67gsYBWQ4L3vdKSF6TK+lOU1kfn7KLfq4cqz67x4zIscJTjWXOqJ/Ju6hdtd4
         FKLPxLu5zUqeSPKFyIRxVzK7dkN3JhsA/uLczUstWbIVa4qblgWshsEvU5ZO1uJiZfSw
         Rcl/d5VowODz4C2sM/KmEqSv57AlYpDxtw8wTTq0BCtC2iM/bp78M3wB6HWauS//tMHq
         YDl6mxRnLaHmdX7fNuuVZYApvPoKZ/KjmOzbU8FMSGbwtaaaBmaNwAk/y7mpLwj+6gGG
         WGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776652662; x=1777257462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKHs/PNY/ofe4y8OFF1XE8lKpCR4K4vYDfp2ZW6ZepE=;
        b=pXWjU6EBVMMwBcnwtDlwD6V3E1m4lTiRDGuQXrmZ6CybeLY1PXQTmbH+/xOzFbPi72
         Ni0nbxP05NnkxIIhp7GvpkuTVG8MFDupPP/m++1zFSPdhhou2cNX+kJKU0zCznphmgzl
         47kESdORZqXG58yMUfnnV9S9yw7r27/+Jc6dkcm0DrwBNKLZyoGz5jdOrYfK9nsejVa4
         PyuN/dn5bIo2Q9vWuHJev8UdMzFzm6tT7UquOCmbE8ISZTvYTpf77Yh4RM7n8+k5DcE+
         pXYuAvxYntaam7p/7g1GT7HMYVVAcjNqzoL5m3QprWZNJokEiK1oEYvr226WypEAklet
         DBiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9M9z4bbQroXXzOskEhIukwCiBpifiI2p/6HWCm620NlXVeeZiqVO2detqByNHCoh2mlV8XtPkE8O2N9amvz38=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJPHgYbmnsVvRPpPdpmF3lmUMZAdgPapReCPyUVqcHZaqMDtCs
	a+dfFowUyqrLUn4dQTu8oclQMyeIuG9fI4o1XeNL5+mW/M+Ag78o5nn+tSetT4g8VL4=
X-Gm-Gg: AeBDiesBzkhHLmmnHDQre5Vy0aSRfqJfkmpnWB8nUieAqRQ2L9dikl5n4GlCrSZLUN4
	5v3+dMnQGztvI/WmtwVyV+V3TTg70lvsbOrpl3HWEqALd/TjS0fux1Mb5jOhkg4iLWEOdAV+pz9
	Xa5caumEjHG+1WPNf/RadHiyngdWziFrGsW5QZqEyU54mFD/sBPFKrFFev0P/lvI7WE++kBR5rm
	HhhG11GnTIk2iZSMIUncKw8uczHccgCEI+HSrqlegHVFKtL1aDJQv+rawa6nEqj7qsFBseUpGBH
	TECWaRVgux0RNr1NN00Lf8j+DMO0aNyrfGlfLjyVFPNRgC6btOO4krNlBN9rJNAMUEM3ctO6pDV
	Hm7LWoJRKKNj/LdQMP3dUW7zaCuMxy3bHKn7naWcXiFPEGbfT0yFV0jL3r4MV6cAIp5nVn/7PHw
	36ZMb67H3NhMTB8A7HznS0y8v3rSmIWmKQTqUNGRFx56ngqu2rQcIoRDS6biDuj+p0N4c6jcTSJ
	wnD+OO5vvlpz0BQZZJuN6H+/Mngxy81ZXd1lTRAhA==
X-Received: by 2002:a17:902:868f:b0:2b4:59bf:5728 with SMTP id d9443c01a7336-2b5f9f3ca68mr88397095ad.25.1776652662619;
        Sun, 19 Apr 2026 19:37:42 -0700 (PDT)
Received: from kells-Predator-PTX17-71.. (211-75-10-161.hinet-ip.hinet.net. [211.75.10.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cbaasm87313075ad.54.2026.04.19.19.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 19:37:42 -0700 (PDT)
From: Kells Ping <kells.ping@quanta.corp-partner.google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: groeck@chromium.org,
	Kells Ping <kells.ping@quanta.corp-partner.google.com>,
	Benson Leung <bleung@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Ken Lin <kenlin5@quanta.corp-partner.google.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	chrome-platform@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [PATCH] media: platform: cros-ec: Add Dirkson to the match table
Date: Mon, 20 Apr 2026 10:37:14 +0800
Message-ID: <20260420103713.1.I776a9d5aa44405b0083ab3ad3d44415a89bf21c4@changeid>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Google Dirkson device uses the same approach as the Google Brask
 which enables the HDMI CEC via the cros-ec-cec driver.

Signed-off-by: Kells Ping <kells.ping@quanta.corp-partner.google.com>
---

 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 419b9a7abcce..6548d7373261 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -334,6 +334,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Dirks", "0000:00:02.0", port_ab_conns },
 	/* Google Moxie */
 	{ "Google", "Moxie", "0000:00:02.0", port_b_conns },
+	/* Google Dirkson */
+	{ "Google", "Dirkson", "0000:00:02.0", port_ab_conns },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.43.0

