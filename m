Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A3A8F72
	for <chrome-platform@lists.linux.dev>; Mon,  3 Jun 2024 03:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717383623; cv=none; b=LZBPs0BFpnNwQckQsVI15O99I3pXvGXFrsOXScs3m9IvZd7mr7X6m/p0fyUYi7WUCEfqOLt0TsKDGYA5X1VkbVBuYblYgb2q6MGRSLsLznYT5G/4EgSV2GrVisZTPYlrXLELLoZJg6JSqAraKqOCAGBWO82cz+87hPKmYcAd8fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717383623; c=relaxed/simple;
	bh=Q2F3FJLq+B2E1x6a7r8l7MiVu0M5KFcog6GJ2QQgKgA=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=D/dyglTazVx8cCzsMZpkqHSeNWrZHDl9yhVhKzc3cPtsIgbpYMDp0yS7rb4yQPu2DSl7rBaUdEnVy8e+H/Qw78oPSFZ25oIMTsQQARadnB9NM5D8jiOWHnxV1uCiGl45e+w1zKYVM5inNwF30tIyFQwD7lDiWRYkNqW+2G3vjEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=aHh681DG; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="aHh681DG"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f4a5344ec7so27971225ad.1
        for <chrome-platform@lists.linux.dev>; Sun, 02 Jun 2024 20:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717383621; x=1717988421; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sZ6QOuU9DHHKJ76bI93Xo8F7+JXBwLW9l7KOclNo2uc=;
        b=aHh681DGbBAbzbwKVt7EwDcvg+2izf5+td8FQ8AM0xp9HMXUpygnons2tpuZViEziO
         k/8ukdVHHZZ4mfCfmtwKC9pHebkKSe3Zp3aRgI/poBLO8Og+hIm2fNj1RTE7eYHT+Rlc
         JgJmOxfTrOQyJhLK0lvkXgro3cmrXjmBFBabM5jiSB9PPBXrJEYUyfs+AQ4WZOQ7YVF+
         B7uLOhuFH/AfqQrJcOMziGxFghgmAtA9j34UjJwdE74a1eciK0z/QqTYlV0pI1EsWvWE
         YfFAe1iu4xFqZ4gnvCLCMq6cZKDW8A7znEgpwPFQmYKMBa20F5yPee2wpStEX0tITVrv
         vdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717383621; x=1717988421;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZ6QOuU9DHHKJ76bI93Xo8F7+JXBwLW9l7KOclNo2uc=;
        b=YEzFXwmFhgK4qVJlb/tCW4XlIqMiWVIFgzlbUQORGQ7PjJMCV6+Hqot0hC1CUiPJsW
         tx9RiiJwzLC4AHW4zPqo8cz+C5chfiQT+y6KZS5fihhll85lBP34lp8WcndA91SbXesJ
         gTmF3k3Zub83ek98GyfaryEmjo6ASbeQ/JsAE+OQEy9kK+HIna+JxcoK3dHVMUrUDQyK
         rW44etr5cM6wglj9dwQUxCTC69I8C1MkUoQLZq6fvcCtvkiVELxqkB4tVyE/DTIt60u8
         QoCoxBzflOekvKzxQrzbEQwHVYM4G5NqJ94dt1X1aPQN1SiQV5FEoN0YrWSvDezk7sGi
         S9Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWG004wqKslK4w0pgnCNV6oprNpTtlaC1l4djkQ5C3BGOAVj9dFcsc8ly5wpX9nk/isnickMSCSaQZw1CXPnuPx9eIM5RQx2W6RAqKfpQfp
X-Gm-Message-State: AOJu0YznbOX5+xlrH6pK+3arf39HeApMqOfytUyjvd0/f+L21w3+oi1v
	APSx9IKzuUGEnYz5ToJm2ldBrkIMnn1umT20qMLymrqt/CaLXagNDgvQoh+Ge4g=
X-Google-Smtp-Source: AGHT+IEBiO4OkuyKV0U8z72yA3I00Fjjekmlk3fi1ISUYZxG1BZiEGxJMgcN+OCgcHDoNTZ1z2hXQA==
X-Received: by 2002:a17:903:244d:b0:1f6:39fa:da2c with SMTP id d9443c01a7336-1f639fadc90mr100315945ad.11.1717383621255;
        Sun, 02 Jun 2024 20:00:21 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f68088e4easm4269805ad.166.2024.06.02.20.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 20:00:20 -0700 (PDT)
Message-ID: <665d31c4.170a0220.1dbd76.1400@mx.google.com>
Date: Sun, 02 Jun 2024 20:00:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-6-ge8665a1723789
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci sleep: 8 runs,
 3 regressions (v6.10-rc1-6-ge8665a1723789)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 8 runs, 3 regressions (v6.10-rc1-6-ge86=
65a1723789)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-6-ge8665a1723789/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-6-ge8665a1723789
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      e8665a172378986159ce8aaf45712c43472f5866 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/665d24d82fa4cc56397e7075

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-ge8665a1723789/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-ge8665a1723789/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/665d24d82fa4cc56=
397e708a
        failing since 69 days (last pass: v6.8-rc1, first fail: v6.9-rc1)

    2024-06-03T02:02:59.340582  rtcwake: assuming RTC uses UTC ...

    2024-06-03T02:02:59.350046  rtcwake: wakeup from "mem" using rtc0 at Mo=
n Jun  3 02:03:05 2<6>[   17.293920] PM: suspend entry (deep)

    2024-06-03T02:02:59.350466  024

    2024-06-03T02:02:59.354967  <6>[   17.298873] Filesystems sync: 0.000 s=
econds

    2024-06-03T02:02:59.359219  <6>[   17.303784] Freezing user space proce=
sses

    2024-06-03T02:02:59.616451  <6>[   17.557707] mwifiex_sdio mmc2:0001:1:=
 info: FW download over, size 717068 bytes

    2024-06-03T02:03:00.378837  <6>[   18.321585] mwifiex_sdio mmc2:0001:1:=
 WLAN FW is active

    2024-06-03T02:03:00.382641  <6>[   18.322095] btmrvl_sdio mmc2:0001:2: =
wake by bt

    2024-06-03T02:03:00.393819  <3>[   18.332161] Freezing user space proce=
sses aborted after 1.022 seconds (1 tasks refusing to freeze, wq_busy=3D0):

    2024-06-03T02:03:00.397543  <6>[   18.343011] OOM killer enabled.
 =

    ... (4 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/665d251e6b1a8a88b67e707e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-ge8665a1723789/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-ge8665a1723789/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/665d251e6b1a8a88b67e707f
        new failure (last pass: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/665d24d962bc5da6d17e7072

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-ge8665a1723789/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-ge8665a1723789/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/665d24d962bc5da6d17e7073
        new failure (last pass: v6.10-rc1-4-g7b44d5381e541) =

 =20
