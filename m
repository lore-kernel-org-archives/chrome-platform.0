Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B91156227
	for <chrome-platform@lists.linux.dev>; Wed,  3 Apr 2024 23:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712186722; cv=none; b=uj6uTze2ZHF5R3gK4xg+jvhYMO00UuhROHmYaJCLlR6IhtEWOxc1AQwATB0L/Cg+o53FYiNgTmTKk1KRMx1uZXhKWYJdIiU++LO4dcD1gR3yptrsweX3gyd6AYyM6mWqE6rzSN7316vVhlHKG7ZwAj7vSBZePrgopEofRm+pAU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712186722; c=relaxed/simple;
	bh=g6fVvKpnwOKmHBwq9HLx5kkpz97Xf9qDUJj9TG+sEww=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=mDi60u0i04ClE3XFPKh0dnuNMETEh3XHlZANYO2+05txuyzaJLGtb+oA/VFu740rCoBVKe07llM8CTWUsHjJH7eYTcdMt5K9tfaetAqKzKddTV6/q9G+OOT2nlu0dayH1EB6UYw58Bm7nSygPqrqoUioLAhs44dQ3BYUM9ec9qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=BJAPhLKP; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="BJAPhLKP"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2a2c85b7dc5so214831a91.0
        for <chrome-platform@lists.linux.dev>; Wed, 03 Apr 2024 16:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712186720; x=1712791520; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mzFSP/1ecFaTQIO5UZcAcUIDS6wwJBCwCrE1XHd8L+M=;
        b=BJAPhLKPV9BclmmzQiQx2VOBLtnlc1UT82NGg7VrYofweg3yhKHjJoho3iOClxQR3c
         pV30TdUvfjPt+zlr+74MI/InCCTGXrYqPJPbRQmr5MJqgMNiOnQpg+lxSFlFhocusCy8
         3aKp2cz8xW1RzLXjm0RDTR64Blvrs5nz/vZ//I/u+PsLpQ4kqdo6FAYGg34oU3xJkHSX
         fg/yFkqYKAVWCEs8IS6IjiZ5Ku9d617wGb+vVlVTlndP832CXfqskmMbkHdXJ2p3NKSH
         ycmfCvu7nZXPXPpUuFOypml8mahj9d70OQ2aqaMQmzkhBjegBiB4GyohSZF2w53fPCAr
         cdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712186720; x=1712791520;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mzFSP/1ecFaTQIO5UZcAcUIDS6wwJBCwCrE1XHd8L+M=;
        b=Yeb6hggiZreHovucuZ30B8WF7GIApkI+1g8H2iW03h/oYazpwUJY3sSQDX2ctdym7b
         PWm1fvW1u62QLetLcImz4P8K3V5E/8m6mVG629kONXu8LMGTwqtcd5cEyN2P5iFJ4XqL
         dAfUi0X9EZYnUUQ9tPvYpgRj/xmUTMSYm5d8eU9xejUM727nSX7odlHUBm8RzDkHj6ce
         FnRnS9GFRuTWfBwR8GDJDVxA4atHOH6AQ+GXZRb5FfRdKEbbHEm2RcN1PoLGiwMbiNMz
         IojNgkEr4lPpbhC3yTrv+cFz2c7F0MWaoAyczGKOpIYCgI3ZTpY7SteJKVKT+EV2uG+f
         Ny4w==
X-Forwarded-Encrypted: i=1; AJvYcCWGYsnAA8pPaRcGPSw5RF/P1gd3oIK/0U2c4J7JW+AkL4auS3RLWHqbQc2U3taScjjx5tvNRFt4OscuhQQQHcnklhtL0EYs12e7B7Hu5ehl
X-Gm-Message-State: AOJu0YwEcji0ko19DZ5MoSsspQ0e9tMEaN5Dha6Qo9ES9BQ7uUfVXGRQ
	EV3bMQGYjXCTXSoxu99Ja8QxiXC6/9CLw/OcfGdY0Shbdc8JBZgqivb+4VE3AT8=
X-Google-Smtp-Source: AGHT+IHvEwcM0+7ezAPgKs/hpdOo6Z/YbWJEQrQjTgoyjuYB0ZQctMCZkS4oIfB7mYH/0MprsbDRsQ==
X-Received: by 2002:a17:90b:4a88:b0:2a2:6c60:cf88 with SMTP id lp8-20020a17090b4a8800b002a26c60cf88mr1111010pjb.36.1712186720523;
        Wed, 03 Apr 2024 16:25:20 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id t17-20020a17090b019100b002a2317c387asm252716pjs.28.2024.04.03.16.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:25:20 -0700 (PDT)
Message-ID: <660de560.170a0220.28f03.13ca@mx.google.com>
Date: Wed, 03 Apr 2024 16:25:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-firmware-kernelci
X-Kernelci-Tree: chrome-platform
X-Kernelci-Kernel: v6.9-rc1-2-g7f20f21c22aa2
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-firmware-kernelci baseline: 74 runs,
 3 regressions (v6.9-rc1-2-g7f20f21c22aa2)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-firmware-kernelci baseline: 74 runs, 3 regressions (v6.=
9-rc1-2-g7f20f21c22aa2)

Regressions Summary
-------------------

platform             | arch   | lab           | compiler | defconfig       =
           | regressions
---------------------+--------+---------------+----------+-----------------=
-----------+------------
acer-R721T-grunt     | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig=
+x86-board | 1          =

hp-11A-G6-EE-grunt   | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig=
+x86-board | 1          =

hp-14-db0003na-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig=
+x86-board | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-firmwa=
re-kernelci/kernel/v6.9-rc1-2-g7f20f21c22aa2/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-firmware-kernelci
  Describe: v6.9-rc1-2-g7f20f21c22aa2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      7f20f21c22aa22e488530f66bf4fc168e427f5bd =



Test Regressions
---------------- =



platform             | arch   | lab           | compiler | defconfig       =
           | regressions
---------------------+--------+---------------+----------+-----------------=
-----------+------------
acer-R721T-grunt     | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig=
+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/660dda85226cd75c234c42e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.9-rc1-2-g7f20f21c22aa2/x86_64/x86_64_defconfig+x86-board/gcc-10/=
lab-collabora/baseline-acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.9-rc1-2-g7f20f21c22aa2/x86_64/x86_64_defconfig+x86-board/gcc-10/=
lab-collabora/baseline-acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660dda85226cd75c234c4=
2e5
        failing since 9 days (last pass: v6.7-rc1-2-g09aeaabebdaf, first fa=
il: v6.9-rc1) =

 =



platform             | arch   | lab           | compiler | defconfig       =
           | regressions
---------------------+--------+---------------+----------+-----------------=
-----------+------------
hp-11A-G6-EE-grunt   | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig=
+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/660ddab516c25831064c4303

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.9-rc1-2-g7f20f21c22aa2/x86_64/x86_64_defconfig+x86-board/gcc-10/=
lab-collabora/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.9-rc1-2-g7f20f21c22aa2/x86_64/x86_64_defconfig+x86-board/gcc-10/=
lab-collabora/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660ddab516c25831064c4=
304
        failing since 9 days (last pass: v6.7-rc1-2-g09aeaabebdaf, first fa=
il: v6.9-rc1) =

 =



platform             | arch   | lab           | compiler | defconfig       =
           | regressions
---------------------+--------+---------------+----------+-----------------=
-----------+------------
hp-14-db0003na-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig=
+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/660dda87352f6a0f2b4c4424

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.9-rc1-2-g7f20f21c22aa2/x86_64/x86_64_defconfig+x86-board/gcc-10/=
lab-collabora/baseline-hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.9-rc1-2-g7f20f21c22aa2/x86_64/x86_64_defconfig+x86-board/gcc-10/=
lab-collabora/baseline-hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660dda87352f6a0f2b4c4=
425
        failing since 9 days (last pass: v6.7-rc1-2-g09aeaabebdaf, first fa=
il: v6.9-rc1) =

 =20
