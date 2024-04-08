Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716917462
	for <chrome-platform@lists.linux.dev>; Mon,  8 Apr 2024 07:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712560156; cv=none; b=tGe5ejaeX8PkhXbbFf/ZUxkBxAUQBkNLsv30WJ7KMiqei3BAOnsxTyobUam5GQ/JBD/SWYkRJAjIT5g5MM2EZctgyicYAZdsy4Q1mU/TgPA648VLXHnXZckozEl4+GWDu5dynUK/Fk0NWVbi5m3aTrR4ViNY0NihoFUrkyDfSoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712560156; c=relaxed/simple;
	bh=cyrSlYjlgXNwfqK0OZusN1/LQOHpRDBIJliDa24Qti0=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=AlSQuuPCUiftM3WakGECuJSNVNPPlu+EwJFKRx5VYjGqzd/Vr74bDSFJJyTYD7QzZMSs1rA6bAEjSVnHEjEpxIfs9KbOstOQao0Hnf5ndIYCCM1mI/xLtwP/cKB2MmE0tUFociD3KxvByeIJ3/B9KIZmHbmgDO6O1S8AfaIJPPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=1yQKLIjW; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="1yQKLIjW"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2a526803fccso233841a91.1
        for <chrome-platform@lists.linux.dev>; Mon, 08 Apr 2024 00:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712560154; x=1713164954; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cyrSlYjlgXNwfqK0OZusN1/LQOHpRDBIJliDa24Qti0=;
        b=1yQKLIjWTSTaswShFFLJW9l+Om9rO/0OC1MnCzxNh6n5Qgk5Yt6+S39sSpI6o9keZA
         5tPaxJFbodOuedhUaaXSa6kgIAdvLlICNS/r8+d4FyYCLgxxjQdP4uK98e/337k5JICV
         AEnmZYlIDofMXQnLOUjRoKmnF07akGeBFPL2ESWpDnEdAjvdbSfiH4fvipw0cSggORXS
         0+ylMUdEcF4g5hh8riTWYcdYHAIm4Fqe6moIxLpd9Vuei1igyU+jC+I0hjJMXLGnTY6E
         PzY8zeEv/c2G69l/SVp/yqcBbyEr2SKtw2GwLVbaZNAlOskNyFGEQdyv/ltMuUxQH/7v
         woVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712560154; x=1713164954;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cyrSlYjlgXNwfqK0OZusN1/LQOHpRDBIJliDa24Qti0=;
        b=eqR09MPfr6lDHO+n7BVrgcCYHmEg1SzsQC1GpmJKpeXNPudlTurct5UIPPgV/ZKOry
         SIBoxGlu2VcKF7kCrSbs32xK3bQDRmFg3eAOZjMYhu7jcL82jxY5r12lyU1cGs30ahjd
         WVbfJuwsJYd2pNHsEFgCQsR1NEssWZHQ3ZZqFR/uKR5KcU/FnqMQ5Hg4Oyap9/zQNYPu
         65oRwfjAjYsBRVKtRE5EvDubquTLrx/xSwZDjJXErC2DpiiCUI30zS9De69pgP/RfUA2
         6UMf6QZaP+jRmtJN3Dk+G8XU3eCb72pTQAWn3sTK5hqeveIq84OpNHE/FmR5j6f5NgEt
         KLwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWd+pUeyMkuHk1n1b6LZmfNn5HvTa+9q5kdEcMgJ+bNOFcjJQovzi/ZGZ+UKjwflXKrgjz0TzqyTVIkOxHRcQNwbf62aHD0euLZyOm6dy9c
X-Gm-Message-State: AOJu0YxuhnV3NqJOy++L8PCKzOZYZA7zz7dSVObBqubx2hHTUvmQ0NSb
	+HTJFWV26CCImowV6h+dkq+taUAeVgXssTFRXgaz5GN4O1L2HvdY8WmSMjzkR1c=
X-Google-Smtp-Source: AGHT+IHA8bYTIL3qL12nM4FansWz3NHJtq+j1Br4GBvFjcVzUTDXVvMWN3FN9p8c4d2g/YbwAAQRUA==
X-Received: by 2002:a17:90a:f416:b0:2a4:c2c4:4a84 with SMTP id ch22-20020a17090af41600b002a4c2c44a84mr3645306pjb.43.1712560154558;
        Mon, 08 Apr 2024 00:09:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ms3-20020a17090b234300b002a5201d9244sm1114154pjb.39.2024.04.08.00.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 00:09:14 -0700 (PDT)
Message-ID: <6613981a.170a0220.167ee.2528@mx.google.com>
Date: Mon, 08 Apr 2024 00:09:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
X-Kernelci-Kernel: v6.9-rc1-17-g3b89336c9ccf5
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.9-rc1-17-g3b89336c9ccf5)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.9-rc1-=
17-g3b89336c9ccf5)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.9-rc1-17-g3b89336c9ccf5/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.9-rc1-17-g3b89336c9ccf5
Git Commit: 3b89336c9ccf5961e9ec9521868a4c48bd6dded5
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/li=
nux.git
Built: 3 unique architectures

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-board (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---
For more info write to <info@kernelci.org>
