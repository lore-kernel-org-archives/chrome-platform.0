Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C51B2E06ED
	for <chrome-platform@lists.linux.dev>; Fri, 20 Mar 2026 08:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773995539; cv=none; b=L99x9r3CVh7ChFcn5T6Pm/l9O+nULPuf7+HCGsA30SLGhqszoA4/0mA0+gPtQM/j4L9Eq82fMFt/EC2FNJHmC7fyv5BrkE4AoqEUfC8Il2O56/Sr3SEx+QRMntEP1q9SgfmW+G6soU+jFlOKIWBb+bk++I9zH1iqapcdZ0cVAJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773995539; c=relaxed/simple;
	bh=1D4fSyTvSEso8i2Ejp40j4xJBp907BVnO5lKtj86KL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rk1fYN6nUSOAN/aukSte5dkQfnzm/8yy0fwRHIGKaYcYCdsIlt+QT8EN9i1Qsgi/Kig+p6EYOA6c4iJPkdYr+Nb6IK//0fjL/4eX8hkc2U/SVQUdaImBsFaOAFlPQSygLyYeeuOPrbNYzytyfq94DaudngoVo70jezp4EayRTaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Rcu7FqCu; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Rcu7FqCu"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-824c9da9928so1623519b3a.3
        for <chrome-platform@lists.linux.dev>; Fri, 20 Mar 2026 01:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773995537; x=1774600337; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iLEs0e2qJIlqfw8fHUZzPP3Wzmar5tmvZs6TyzNUS+A=;
        b=Rcu7FqCu4dk6S9VKm75O/tS7NZjxj81rCUL1XePJMUFDLePjom41BB1q8rIUQxQwtQ
         sPSHXoYFeRTcFEDqudVx2ha3dKa4tfKWb2+RpbCK0uHGUyKTMudn3zVPBHv6/xdmBlG1
         DJ7UB8mxzII6rN3tNYXCGXDo746LaEfb/y844=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773995537; x=1774600337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLEs0e2qJIlqfw8fHUZzPP3Wzmar5tmvZs6TyzNUS+A=;
        b=ErU8y3H8Ui2xa+RWg4GTN+KmHWUgoVKA90MPzekvprBOzaityNJ/Nj0X1OsBGa9cad
         w7zvl3/NWVCP+UqVdZ0+0Xt9JO91is5Nm6jSTzapowGkqffYnbzY+qRJI/MlcAHPcrP5
         AsHjuGY3ERzaVgpZDkxuZ894qLJ/dqzpc1GBjsjg0lgQIUBllcnnvEv9HZLwyXvr3sni
         YYdomB0yuWdS3n9DBIoDCw5DSVNLvQzKIo3zbwXclU2MfubaUH9J6TbG/EO2FyFoNkdk
         YFfEq1Ir9SiT80ilBKLoVl4mEbvqoqqV1OQV/4lG1j3zSRrAnDJHhGKoU/8m86HmVQA9
         SicQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3dJR8GiWHiwajvDd4LwFEOurp41jnLOXCjK8mL6akr9cBd96Up5Gbgeg8xn8w9M5K+XhJCBQQ79u30dTmpXE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+e/cX6/d5m/o5pauNokfUYD7EIv3Wn9o6c2REfDS7t5kAqdAv
	gHf92we/7DQiI/gXK3P3wVdxjq/5c3oEY/bHyQiQwIP3oO++wvGsdKaE2KZi5Sondw==
X-Gm-Gg: ATEYQzyo3P/vvda6QQanue7AMOyg/50mUw5BQwxu4SXueV434QiVYXyzOEmU2frkikv
	Z79HJ2ngpb/ilf4kfMq/8kH5WixaYeHG0eCnpmL/eZY0d4Vn2YxQS9hqNMVK1RdtLPGpiJDepXr
	1OTtr7Pts8D1nfWPh1qXNcQbk9gMHAmyfvJZtW+NqeSjmn5nqK3qI9EAaYCSQVY8vv8eDgYXJ1n
	oNDv6W4yK/upOe99rPcOr1PRxr40fBxppm3K0uI2TZ2MDpWlLJHqA+n+eAjC3mssEw/9yNn++GH
	Ef9DXJiy5iB0r5pA7UGretrKRckUPNkczOt9t9n6H78dykhRs/ap8e7JGfqCHGro4cMaXF/O1s8
	j6t2d1RaNrZzNBgKNH+argtTOTgRXQNilrL1Qt0QFrv/vaA2NqS+N+YMeIEgJVgqK/eDTNFxbu7
	ReC2a9WKbin2S6y/3dv92g1Y1SbfQVeus02JemIFnVX1Ef76Kue4fuOVOjxv1HC/9gaZd76Eb+m
	x/1F/OMCeSRDOVXnTI=
X-Received: by 2002:a05:6a00:1a89:b0:829:9fa3:5c8b with SMTP id d2e1a72fcca58-82a8c3b91fdmr1755152b3a.55.1773995536642;
        Fri, 20 Mar 2026 01:32:16 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b040debf9sm1408816b3a.47.2026.03.20.01.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:32:16 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH 0/2] regulator: cros-ec: cleanup and add supplies
Date: Fri, 20 Mar 2026 16:31:31 +0800
Message-ID: <20260320083135.2455444-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series is part of a broader collection of regulator related
cleanups for MediaTek Chromebooks. This one covers the regulators
exposed by the ChromeOS Embedded Controller.

Patch 1 adds the names of the power supply inputs to the binding.

Patch 2 adds the supply names from the DT binding change in patch 1
to the regulator descriptions in the driver. This patch has a
checkpatch.pl warnings, but I wonder if it's because the context size
for checking complex macros is not large enough.

Device tree changes will be sent separately. The goal is to get the
regulator tree as complete as possible. This includes adding supply
names to other regulator DT bindings, and adding all the supply links
to the existing DTs.

Please have a look.


Thanks
ChenYu


Chen-Yu Tsai (2):
  regulator: dt-bindings: cros-ec: Add regulator supply
  regulator: cros-ec: Add regulator supply

 .../bindings/regulator/google,cros-ec-regulator.yaml          | 4 ++++
 drivers/regulator/cros-ec-regulator.c                         | 1 +
 2 files changed, 5 insertions(+)

-- 
2.53.0.959.g497ff81fa9-goog

