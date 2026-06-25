Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BC23BED79
	for <chrome-platform@lists.linux.dev>; Thu, 25 Jun 2026 06:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782367750; cv=none; b=lGl7C7G2TF5JW/hsIL3C8e5uRGIUMxNnaNsmjEja+qK9/lhAmjpDD7hgxeNF/L/qq8LMpTwQtnVjDAL2/QY2w6KhwZu5PYsuvZCffvJAWJ/odi5kctuoD6eE+NaalOrIk5pyZGDpLcQTRAcS/obPD04RpLflsbkpu6MJ2ksMgP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782367750; c=relaxed/simple;
	bh=AKv+KVE+8wqw4nK8QUIvuPl/3wmCpybIicyTFHJcLzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=df2Jpsidl2cTn8jYm2t/hyRlPQGztbaaONDykcKuMMW0tH/rYqtJmoSmQoIU48Gc8Y7P3V1o3g1Q560T2MHunumkEbdmRNCwwpKkmlcIUBVnMj+NWxmIX49EjXQPgCfSQt1Z23V4vC4B+o3iLd3LXuPutNBHZkQ9cXB4wYZTAMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=h0ZGygWZ; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h0ZGygWZ"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-37dedd62b90so374548a91.1
        for <chrome-platform@lists.linux.dev>; Wed, 24 Jun 2026 23:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782367747; x=1782972547; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KIhE6ku6meAbw0BvyicR03G3QMAyG8gmL8NOCMACOv4=;
        b=h0ZGygWZ7egYpp0C/BmwSFBNc7SkY8m9pD2hRZ8ZWCwssflKZkXgXsT3ZpvOHv8J1P
         RQXVJWwyjcSx33/ff+suVwOnnr13OCyZv0aZHl/LWCgj1JA6+Nv90nbMMgmyZQo60N8C
         kfA6vPifjDMVEauU5cft74ATnLDPXcUilBOpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782367747; x=1782972547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIhE6ku6meAbw0BvyicR03G3QMAyG8gmL8NOCMACOv4=;
        b=ftBXeoWpnxkOkn3YyacJrTZDeVYJrE0zSeZubowcl0adjCFRIlPxm5lsvDsPnSTFVh
         cvS2vLzPr3gp6mf64G/4HiqXfm1bDnjBG0ZDsQeTNWLGTZX8ipEkt81IwWQCWE2DlnBX
         56Fx71Zp/had51mQZtq9ySF/N8jYwovFExdJApQcP5Edmu7eulfZK0HAE9vuGT4rdAEw
         xEzOnKm6o5A2NzZJA6SyMc3b+cr1KRcT2si/Goc0SxCkPMTFimI0szRgjlLoeKcbKN01
         1r+areqePdBbqDPjIjKg231rYpHFKQmHPzdW1bspWvWr2QdGCcQEd33lqpcQVWz0XCax
         noug==
X-Forwarded-Encrypted: i=1; AHgh+RqFs1KzdxFR8wXpRLoJbI+FAOV93/B5RdpsM6rNGolUhnKb/FUGBvs+WMKLkjYly3Ff5y3QxOBCIeRwFybYVVQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyq8xblCq0djPL98wxLJLFs/zhAViHyb0caaD1tQnK1xKD0lf+v
	qAAzcOTKccXtmm5Yv+DCDwNVVoJLLQWLIvonTAbsuBS1YUfscrT/W58UuNPdfeKMlg==
X-Gm-Gg: AfdE7ck2YMXgQxdgaE5ybUPg2rbGJBhoC0KzluOU3+8Lfd3dQiUFa5SLObiM1uObKPl
	24mQTp5e4eAKYvMhwykn/uasSPZs95sLbIK8kq4O7fjtmb2Qa11i+bKez5sbzxFVZpCdP5e05Wp
	EF60MgsSxoIJmqPfhEXZwe4OclbLFRmExcoo5neWi2plJF6+/w+LQU7djEDfKS8EWsAUTkR/tzD
	opOuGzG+LgIoOx3MPzNIE8986TtUddm2PBArmoCyCbZkgQPfSAr4UZrLv4x8jtvVUSW7w8jTFl/
	tBUEizHgOsenjx5fu9YY63uvJOVQcQLmJLA0bVreDcNiSeq3tu5vTeV6XrUJ9G+bFpwOEFQYgjL
	+W4BUj+IIS5gpSj8uiijr9X2ihcOT6w2ewr1zSGS4PN2MtnvgSGMytfacFsCs0fC4TXJBQXEkLV
	ombQ0NOSGdTpgyzYV+qwg5p2NMCGYSwhYQM5QSwTiYkACfW1S7We5iGbXIHXgxWeo0vmmf9Q==
X-Received: by 2002:a17:90b:2f87:b0:35f:b9f1:fded with SMTP id 98e67ed59e1d1-37df9163af0mr982075a91.12.1782367746870;
        Wed, 24 Jun 2026 23:09:06 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:df79:389c:8c8d:21c2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37df411ddf7sm1102814a91.16.2026.06.24.23.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 23:09:05 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	chrome-platform@lists.linux.dev
Subject: [PATCH] platform/chrome: of_hw_prober: Use dumb trackpad prober for Spherion
Date: Thu, 25 Jun 2026 14:08:58 +0800
Message-ID: <20260625060859.1020483-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The trackpad power supply on Spherion is the system common 3.3V power
rail. This is always on as long as the main processor is running.

Switch to the dumb trackpad prober since it does not need to manage
the power rail.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/platform/chrome/chromeos_of_hw_prober.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
index f3cd612e5584..8562a0e89dc6 100644
--- a/drivers/platform/chrome/chromeos_of_hw_prober.c
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -100,7 +100,7 @@ static const struct hw_prober_entry hw_prober_platforms[] = {
 	}, {
 		.compatible = "google,spherion",
 		.prober = chromeos_i2c_component_prober,
-		.data = &chromeos_i2c_probe_hana_trackpad,
+		.data = &chromeos_i2c_probe_dumb_trackpad,
 	}, {
 		.compatible = "google,squirtle",
 		.prober = chromeos_i2c_component_prober,
-- 
2.55.0.rc0.799.gd6f94ed593-goog

