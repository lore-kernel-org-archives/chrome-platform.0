Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C745149C6A
	for <chrome-platform@lists.linux.dev>; Thu, 13 Jun 2024 18:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718304188; cv=none; b=GnL03aiMog0k0bCWn8Pri2Fl+Fk7e7yX6u5HnCC+R8R6bjF6mSzIRCKzc08+NMh2wOi8TQufVS9w+0UfMiKto7gdGUG2+Kw2JdsGMnfQBhDLvMznqgKwFCrpYhA07RS6vezXYPpQoNbKJGrkQOxcu6VApWkkiRc2T2VdU5DCQng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718304188; c=relaxed/simple;
	bh=RakQAApr6PHjWkltX2QBSZIBcTqqmaWp3dtRcbbGP90=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Dcjaz43nHbEGsFUsZl4TqMiodGazG6IbpWjkFcgbkLOjIzlzuOg4U5P+g9YzyQEYTbRUPSu7X0RNdbMmz7sNl2J7fau+qdxl2INOvZwTecMSKAMLZNuJidDh/sQZimrhRHoIVVciT0ut5z/7gvigJlMXb5X+D9tWC2hQ46i9wnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=GT3ZXaEV; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="GT3ZXaEV"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f480624d0dso11549035ad.1
        for <chrome-platform@lists.linux.dev>; Thu, 13 Jun 2024 11:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718304186; x=1718908986; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8WlSxTZju45XEYZBI9z9f6wsDYSCy2yK2iUBEEbPodQ=;
        b=GT3ZXaEVU29lNkZDX9kRWVNJAg6aU27zpvCUMmptMcTaVYLnoWSK4jcgFYVLfYvZGp
         31mYwLXERzFYHPBBXKsYhBEkrdYEBWwwLdtjxstAkPJyNhGdL4xrKvrtHo46po3QD/jZ
         yHeIKTgb7+SeKY6HBh/96DAQs6VSBjET4MXeDE7MrnATGmZjFK+FibCQV1bO5wZiJCsL
         m+nNdHUW8BJaAyksyJpBCWzMry85sJ+FbzXoUCXV7ecyQOFVJaoAGmHBxBykyV2ADmBq
         yoF3NcBkCRLp3QujNyIziqZVRUaCS0Cd6pk/xzX1wDQ/OyN8Mh/MuLAhLMtHYz+1FWMw
         6S4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718304186; x=1718908986;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8WlSxTZju45XEYZBI9z9f6wsDYSCy2yK2iUBEEbPodQ=;
        b=EzMJlG9zO8INwU8z1WRcAKdccI+Pjbp5//nLISEcy1wsd76jvkgcV9caY6y44jRMHe
         5FxdOdEEm5qMaKX8e/wo1z5VrPepW1ylbLkWUk8AozIrIQaKJvesSPZMU8prv9c/WGbC
         nq3ZB6lttwBL7NJIU1MG82vmI8fe0obbIGJzQ065RgDB2G1wr0XdRf+sD+PE+Dw1eWZo
         xdhYyB1FBfpoK/8Oa1dM6VhNEUYq59KSWM+etu0LgveMyeyCxGQ9UhfIAnLUl8oZd9VG
         3a7O5B8OhtO8TwVUSutrNDP3V/Efx5mUfFoT3kGYG8laFwvSwvAq1Tip59CdTk4r1wmK
         y63w==
X-Forwarded-Encrypted: i=1; AJvYcCVZ2YOv2XuXSgL4kTZAh9a13HlShnfwRs/hbtY36tACxclpkFa5th4SMwbM0cAxncDbfnwAkGvRNtoLKiHk65HVfeev1oU1QScVBO8ys8MV
X-Gm-Message-State: AOJu0YytwpQndqfr6/TV0m8SBr6XX26ZMn/Ss8wCV9vKopu09R/OLRBQ
	TzsJe8qvd6N97L9sEtXmRraVbIHPEf0EgHGjx15kCTb+ThvG5s5h3g24sRIySK4=
X-Google-Smtp-Source: AGHT+IGJcYIZ6eNVZC1a/WgeL9PEa/jF2CbUJoNPbKiah+lJiW3koxDvUNtbGd3zOkRGAeM8xYqxOA==
X-Received: by 2002:a17:902:c401:b0:1f7:2099:6fa3 with SMTP id d9443c01a7336-1f8629feb2fmr6760695ad.56.1718304185619;
        Thu, 13 Jun 2024 11:43:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e56012sm17280965ad.16.2024.06.13.11.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 11:43:05 -0700 (PDT)
Message-ID: <666b3db9.170a0220.ae878.4d21@mx.google.com>
Date: Thu, 13 Jun 2024 11:43:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-19-g77a714325d09e
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci sleep: 8 runs,
 3 regressions (v6.10-rc1-19-g77a714325d09e)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 8 runs, 3 regressions (v6.10-rc1-19-g77=
a714325d09e)

Regressions Summary
-------------------

platform                   | arch   | lab           | compiler | defconfig =
                 | regressions
---------------------------+--------+---------------+----------+-----------=
-----------------+------------
asus-C523NA-A20057-coral   | x86_64 | lab-collabora | gcc-10   | x86_64_def=
config+x86-board | 1          =

mt8173-elm-hana            | arm64  | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook | 1          =

mt8192-asurada-spherion-r0 | arm64  | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-19-g77a714325d09e/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-19-g77a714325d09e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      77a714325d09e1527d865dc011ef91c4972ffedd =



Test Regressions
---------------- =



platform                   | arch   | lab           | compiler | defconfig =
                 | regressions
---------------------------+--------+---------------+----------+-----------=
-----------------+------------
asus-C523NA-A20057-coral   | x86_64 | lab-collabora | gcc-10   | x86_64_def=
config+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/666b3043003fdb9da47e70b6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-19-g77a714325d09e/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-col=
labora/sleep-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-19-g77a714325d09e/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-col=
labora/sleep-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/amd64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/666b3043003fdb9da47e70b7
        new failure (last pass: v6.10-rc1-18-gc2a28647bbb4e) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                 | regressions
---------------------------+--------+---------------+----------+-----------=
-----------------+------------
mt8173-elm-hana            | arm64  | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/666b318438208470d77e7156

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-19-g77a714325d09e/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/sleep-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-19-g77a714325d09e/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/sleep-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/666b318438208470=
d77e716b
        failing since 80 days (last pass: v6.8-rc1, first fail: v6.9-rc1)

    2024-06-13T17:48:47.727432  rtcwake: assuming RTC uses UTC ...

    2024-06-13T17:48:47.732768  rtcwake: wakeup from "mem" using rtc0 at Th=
u Jun 13 17:48:53 2024

    2024-06-13T17:48:47.740480  <6>[   17.663429] PM: suspend entry (deep)

    2024-06-13T17:48:47.745115  <6>[   17.667665] Filesystems sync: 0.000 s=
econds

    2024-06-13T17:48:47.749951  <6>[   17.672901] Freezing user space proce=
sses

    2024-06-13T17:48:47.779475  <6>[   17.698572] mwifiex_sdio mmc2:0001:1:=
 info: FW download over, size 717068 bytes

    2024-06-13T17:48:48.542643  <6>[   18.464412] mwifiex_sdio mmc2:0001:1:=
 WLAN FW is active

    2024-06-13T17:48:48.547996  <6>[   18.465057] btmrvl_sdio mmc2:0001:2: =
wake by bt

    2024-06-13T17:48:48.557314  <6>[   18.476854] Freezing user space proce=
sses completed (elapsed 0.797 seconds)

    2024-06-13T17:48:48.561735  <6>[   18.484691] OOM killer disabled.
 =

    ... (8 line(s) more)  =

 =



platform                   | arch   | lab           | compiler | defconfig =
                 | regressions
---------------------------+--------+---------------+----------+-----------=
-----------------+------------
mt8192-asurada-spherion-r0 | arm64  | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/666b326112cd61ce827e714f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-19-g77a714325d09e/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/sleep-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-19-g77a714325d09e/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/sleep-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/666b326112cd61ce827e7150
        new failure (last pass: v6.10-rc1-18-gc2a28647bbb4e) =

 =20
