Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EB116C844
	for <chrome-platform@lists.linux.dev>; Mon,  1 Jul 2024 18:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719859410; cv=none; b=hmgGMbJXA0+rWoDAB7D7HQ/IIlvPVRsSLJSnTgT6KcJteWGuUuosmV8CTRqs7vRrmvwEBSL2OaomXzGf7E0walUnx0xT5K0pIXTsFNFYY0VGcgTc6/KfBq+R/U/Qj+MzzteurJ88BiyXBL7dKi702x4Cn2/zPrJZc9De8xRaGbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719859410; c=relaxed/simple;
	bh=j20JCs4J6ZS3KwSCOzNGgGjk15vwVkAyEbJJvrcwnng=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=g4rTAkm8cLtmaan4PiGHpmMvKqykAiTwiiccJ62AdzIdyEU5l6ScaRhBAAjwouhs7B3aCoSW+RMq6JPh22KPztfvLx0clnE1GPhxA/Dn84haUSwILv37zmsLwlGq3WRPwIIexvbySbPg16K92WcjHcOtO3krvJyLKcCs5IZvcFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=EslG0e7v; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="EslG0e7v"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f9d9b57b90so23496345ad.0
        for <chrome-platform@lists.linux.dev>; Mon, 01 Jul 2024 11:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719859408; x=1720464208; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=28kNAcujoivGtlChdsj9Y300e/NFLD4mb31xyuYhjto=;
        b=EslG0e7vlpIttiF0tPvRRyQApig6nC7+fwux80SAANC8tU1imMVHxKzrzp4yMcKi4K
         Ou1Y8uCjk6UdMty8OkpXqCE7vkfwb3kMkYU6iGZgQIqP0UM6X4B71yVz2bbFynfB4Tzx
         TDTiQebqTvAIqrVIKA3dsDnkHAHLscl/3U1tf2QPQSZxcRwPLvVwjXQdikolxnW3030y
         3CKmlZW0MgXki5e7/m5n5ls5owSa9+dWsR0KivCc9jUCmkBI/mnmqvmRRWHZo43fcKJ/
         b4cCkXF0+QkKzyA1O2Xsj0Qg9WExGOneC3SaMZs/XfiQyI47VIUQ7V0gvYz4OVjHZYtH
         keDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719859408; x=1720464208;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=28kNAcujoivGtlChdsj9Y300e/NFLD4mb31xyuYhjto=;
        b=w37+v12K9ibQ20Zu7HbJT7rCDS1lYEh5EkXgCY56dd41lQMO7obm3t5YalmYYElWp2
         eRJLnFe5ARMVQTr8/V4W3L3XiX9I9J81KHP6WR5+aHuI/rJsobbLvrZADdN4ett+pHQ1
         ZI4hP0A5KoYr38umXd2aFpkgrJfMMLxMCX35GXXiQMzBuL3WjTt7p9MvfdJllwZ9ZjUb
         PPCAeEboBG7PbrZLBGPmkiyVIJMVR5iTRlqf/qAxREfzXwdejy9I5Dm0ca/wSMwzG0hI
         yj5bfOlZDVd9h9SpyyIlXSK9LAs5z4MsTUu+srGpdUAHptOnX8L0F86jlanYG+eEqLfm
         1ZiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpHvDYz0Ouoj62H31mdtTF9IQx4XE0s0dOOv1FIoRadsEjUyTISp8KV3jOQPvXMavqCVnm/5Y+AORZbBr7ouFcMFgubpdt5Xzs8YwSbuI7
X-Gm-Message-State: AOJu0YwXzFvDCLI9bzPuhxtFRNgImKHRxQ0Wx34NUzoBBD2jYtpB8PDt
	Vm3bMoH7dpZh1ApwfQBvRbdAYWOc1yL8pRzWJlne/f/UvWwSA5uAp4FRkTFW88k=
X-Google-Smtp-Source: AGHT+IGjrTYGDi58FVL2uxOEPXozBY+E8psbtwXcfGHoDI/JchyuFdwASmF4/i8lDkfTWsVFLu1gBA==
X-Received: by 2002:a17:903:1206:b0:1fa:199d:6d66 with SMTP id d9443c01a7336-1fadbcf41femr55588235ad.59.1719859407988;
        Mon, 01 Jul 2024 11:43:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac157a212sm68075455ad.241.2024.07.01.11.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 11:43:27 -0700 (PDT)
Message-ID: <6682f8cf.170a0220.c65f0.6c13@mx.google.com>
Date: Mon, 01 Jul 2024 11:43:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-26-g3664706e875f8
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci sleep: 4 runs,
 1 regressions (v6.10-rc1-26-g3664706e875f8)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 4 runs, 1 regressions (v6.10-rc1-26-g36=
64706e875f8)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-26-g3664706e875f8/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-26-g3664706e875f8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      3664706e875f84bd4e3fa25ed1c6e46934cb32cd =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/6682ed0fdd0e109a837e709c

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-26-g3664706e875f8/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/sleep-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-26-g3664706e875f8/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/sleep-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/6682ed0fdd0e109a=
837e70b1
        failing since 98 days (last pass: v6.8-rc1, first fail: v6.9-rc1)

    2024-07-01T17:51:11.703080  rtcwake: assuming RTC uses UTC ...

    2024-07-01T17:51:11.708892  rtcwake: wakeup from "mem" using rtc0 at Mo=
n Jul  1 17:51:14 2024

    2024-07-01T17:51:11.718312  <6>[   17.871412] PM: suspend entry (deep)

    2024-07-01T17:51:11.723343  <6>[   17.875505] Filesystems sync: 0.000 s=
econds

    2024-07-01T17:51:11.727314  <6>[   17.880276] Freezing user space proce=
sses

    2024-07-01T17:51:12.068345  <6>[   18.218171] mwifiex_sdio mmc2:0001:1:=
 info: FW download over, size 717068 bytes

    2024-07-01T17:51:12.833860  <6>[   18.985182] mwifiex_sdio mmc2:0001:1:=
 WLAN FW is active

    2024-07-01T17:51:12.838524  <6>[   18.986549] btmrvl_sdio mmc2:0001:2: =
wake by bt

    2024-07-01T17:51:12.849443  <3>[   18.995919] Freezing user space proce=
sses aborted after 1.102 seconds (1 tasks refusing to freeze, wq_busy=3D0):

    2024-07-01T17:51:12.853927  <6>[   19.006993] OOM killer enabled.
 =

    ... (4 line(s) more)  =

 =20
