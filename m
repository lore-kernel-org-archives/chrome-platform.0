Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241D133CFC
	for <chrome-platform@lists.linux.dev>; Wed, 29 May 2024 06:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716965978; cv=none; b=kLe6FwKSuPm5IgB7zdHltCxe8i7Zz+7pjIKg+Y09iB9iUHLLzxdErhR6x3KFsiZhkRMVG+zG2D4kSe2RTmyjhxM3dNVcF17IWLbXi2jZqtpwMaMsl1rbOKoQNw12nUTQOwlp699us+fyKlOWn3xiZhZ9RFRX7cksaL68pWNpgJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716965978; c=relaxed/simple;
	bh=AF2lhuXF7hrsnuxY1K2ddzSPKpuoeT7HhyJ/qNmvhQk=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=nH4NPayvhpj7A/bzCGNqnj0AzQLE4o2+TDRvemFFta7j/7TXLg8ycbdwuspW9llDGh/OTez0OSbJkwtxH/9YzFLKfXHZSirayzIgcTdLYilotnVBP2qhqkKnqwmAb/eiB4CVGUzSvcDFYtEhpcOT3izH3wi/6VXm3tcsb588yUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=EyAHOg+7; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="EyAHOg+7"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6fbbd937719so1278781b3a.0
        for <chrome-platform@lists.linux.dev>; Tue, 28 May 2024 23:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1716965976; x=1717570776; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VoBmPkR9w4RhHfXJ0J/uXHs0QyFyupuhwUL8yrQ8cr8=;
        b=EyAHOg+7fKDPKL2XvBAMonVPzeyuD6nhonmSL0dM2T7NbuCRLnfuNzRmVqvFIJjYF1
         7bJB3xqS1Ok06FzgAJhNCLZUNkKZ6E3ogHC6+fD79D+mIJUkSJO67yEXgLswu5mJHva6
         LBaMs+sXmeKY4rFVHYQUciAnNeCp0AdWRMbhCTMUFzgAJVprf3dadQ4d1f0DYfxuOmYX
         bcE9rCPKIZzbyBifceSymsimBfLER+9WBEzHdGYpKSJfehhaSaaJiCmDnb9jVGFblbgi
         9Ea1h/1jClH1x1Bix6Sfwt99x4359i/6UixA7cZfY8dGVfSe1KcwJwFNmVlBwbNG4n+t
         Odtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716965976; x=1717570776;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VoBmPkR9w4RhHfXJ0J/uXHs0QyFyupuhwUL8yrQ8cr8=;
        b=DNrvfh256w2qb6B4H4DwN/E+ay1JyhmtqO+Ny3gpyJow+LpRTMClvicVDSDGzvGb9L
         g1di6HJo2Dg5k60CE6qPxiQapP+BoCEvgA9yKSSWCyP7cZW3/Mq1vfBqU/VUKlRAXKFX
         mFIAJE7wioB7wZHnmrMk5xGHCfm5T87yDGS3yBfPmw06uRVlWhNY1NqBTDAHjJN+LIVa
         0gmEUfTs+TbSewogc0c3Y/J2knabb+15ZiGBsAjVM2mTUawxTGRcppG7I8093YBBuzRT
         fsvMEPXVuL28Z6hTwBdxLFa98xc4xeJuiqxyc1aHMSUwqFsTWT2/5p0ooY56YktQon/d
         9Y5g==
X-Forwarded-Encrypted: i=1; AJvYcCWQnz/PZxIbYkv7zeoSF7TIOrLbx2lw3zdYpCXmcjbbPturziOnFYby8NlPkBrz+Yo92ebsFT49GVBGSWebPLJ+t1cq47oW17m7v24qvTJ8
X-Gm-Message-State: AOJu0YzynKCXixiK0ljQIQV8QpYnQzBwdvR/XDxqjskquLSneUsd4BaU
	koVnqMiAFsOY+wCBznxLCfj/QWFgMPfWIpxK/M1OFG/lHQNiMNdPrqVgPFKn+EU=
X-Google-Smtp-Source: AGHT+IEJYl2tC91c3bHgBzfA5XzG8Iq3AvfmnnskqrNWFuTKUtaf2ilQYwwhpoT+48f89zZ6xwqQxA==
X-Received: by 2002:a05:6a00:450a:b0:6e6:89ad:1233 with SMTP id d2e1a72fcca58-6f8f2c576d9mr14169947b3a.2.1716965976396;
        Tue, 28 May 2024 23:59:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fc257fc3sm7444583b3a.79.2024.05.28.23.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 23:59:36 -0700 (PDT)
Message-ID: <6656d258.050a0220.9261.34c8@mx.google.com>
Date: Tue, 28 May 2024 23:59:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-4-g7b44d5381e541
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci sleep: 8 runs,
 2 regressions (v6.10-rc1-4-g7b44d5381e541)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 8 runs, 2 regressions (v6.10-rc1-4-g7b4=
4d5381e541)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig+x=
86-board | 1          =

mt8173-elm-hana    | arm64  | lab-collabora | gcc-10   | defconfig+arm64-ch=
romebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-4-g7b44d5381e541/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-4-g7b44d5381e541
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      7b44d5381e541de3da3cee2e948456b250f41f25 =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig+x=
86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/6656c712e57e1d81057e7088

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-4-g7b44d5381e541/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/sleep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-4-g7b44d5381e541/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/sleep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/amd64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/6656c712e57e1d81057e7089
        new failure (last pass: v6.9-rc4-22-g2fbe479c0024e) =

 =



platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
mt8173-elm-hana    | arm64  | lab-collabora | gcc-10   | defconfig+arm64-ch=
romebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6656c686abb205a3fe7e71d5

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-4-g7b44d5381e541/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-4-g7b44d5381e541/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/6656c686abb205a3=
fe7e71ea
        failing since 65 days (last pass: v6.8-rc1, first fail: v6.9-rc1)

    2024-05-29T06:07:33.290335  rtcwake: assuming RTC uses UTC ...

    2024-05-29T06:07:33.295857  rtcwake: wakeup from "mem" using rtc0 at We=
d May 29 06:07:38 2024

    2024-05-29T06:07:33.302277  <6>[   17.823132] PM: suspend entry (deep)

    2024-05-29T06:07:33.307742  <6>[   17.827380] Filesystems sync: 0.000 s=
econds

    2024-05-29T06:07:33.312248  <6>[   17.832351] Freezing user space proce=
sses

    2024-05-29T06:07:33.936766  <6>[   18.456264] mwifiex_sdio mmc2:0001:1:=
 WLAN FW is active

    2024-05-29T06:07:33.942900  <6>[   18.462398] btmrvl_sdio mmc2:0001:2: =
wake by bt

    2024-05-29T06:07:33.954558  <3>[   18.469093] Freezing user space proce=
sses aborted after 0.653 seconds (1 tasks refusing to freeze, wq_busy=3D0):

    2024-05-29T06:07:33.959347  <6>[   18.480283] OOM killer enabled.

    2024-05-29T06:07:33.964132  <6>[   18.484435] Restarting tasks ... done.
 =

    ... (3 line(s) more)  =

 =20
