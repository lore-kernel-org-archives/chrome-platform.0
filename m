Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2A73A8FD9
	for <chrome-platform@lists.linux.dev>; Mon, 25 Mar 2024 03:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711337454; cv=none; b=ac8I1cPTzG3sgSmJx1rkb6PqzroEUGnruK58w9gSz8NHTeURg0s1Bgx62TvCGtCkL+dERivWZW7xUVQ0OQNog8oKMx+eLT/VzRMtZ1BMoygZZD/V1SmWxLCPMoLzdXBG79wVVBBirrw1LEau1UzA/F52nosjKQQSHezhhMtKgSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711337454; c=relaxed/simple;
	bh=euGU38bYLhyRKYXdrcks4iHaUHV8LK7wqPoI2E0ae04=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Ysm3Rp6vz42ZXlKbm9w0QBkdHvMKgMms+HTQkUVv8y3R/59YuFI0di7U80aFTjRHeOK2LUg6/qFNxq6O74HErknGB1oOab1Mcuad4FzbgDkH2ILFxV54IqGrYiLVymtvfD6E1QgOGOf44EZ+y9ZetKAqGDBs7sETdPRQz2AW/bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=2XlReXFo; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="2XlReXFo"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3c390030af2so2963100b6e.3
        for <chrome-platform@lists.linux.dev>; Sun, 24 Mar 2024 20:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1711337451; x=1711942251; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Jj0b1GoUmxaAQp5m9JKqCr3Tk7KFJInu9XtRdWSZFgU=;
        b=2XlReXFo7HbjhDPueyMq2v7DFXCWWTy6NmoYnqqVyGQy4Z8OY7Ibpy3gXQchY23YP5
         0mPC3v6Qc9W0hZ3Oo5/GWNnZky7fpRahXxDzYak5pC+GFgAaou+S3O2WX+CCaR66R9ji
         wdkhz0v4YUnaS7CbNP8AgDEowlzOpmCHZR2mjxq4ITxNpcg99A0vYVOCIENkFcbFyWdf
         S+YqhetKz1bs3XAeaUD8xqkXJIN7Vxh9mMXtGXS32XEPj5zVlF2ZzzTipmhs4FOyC/6W
         On9vGvGNQrpss4DUz/l7H22mTnFP3nV23C5ABxth5ZNZd4M2xOUJXuSefrqclDLU5Rjz
         EOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711337451; x=1711942251;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jj0b1GoUmxaAQp5m9JKqCr3Tk7KFJInu9XtRdWSZFgU=;
        b=WIUuYuM0DWP8wtSJ25sWenbZQA/CYjRBeo8Lqq3AL3U9RgSJytADTB/bd0tLJ5i/O0
         Zk1tZDlAQI0XCXDYd1FAlwZ3KozWoW/CMDv+W1RWvvOFZ+fVTHDhCzsthTeQEHMQYb+e
         8OdiS6PdK110g2GHLnNmXjXWMVMgx6+UyCnz02y26bdsAP8oe4epZtOirfsAalD0Q8R6
         HHYwGWj1TiIiZvbNxtEwMEv9/yPDJxIivdXOi60oVTXz6o1XxO8IKEnYVJFz6n08eX3J
         EWgjUo7VGTAt+4cRIkDTK1/uZ1RYqHevplsTu5hT13/pAZRsBA4RaRlRcSZdvKlBK0J3
         sTsA==
X-Forwarded-Encrypted: i=1; AJvYcCUz81brnNXg+2m99DKQyBMWTfQmQBWafX8t/VLQgcrWIIPCVG1H0jhmzEaeandr7DiN8rHOWBAg7SYN6c5jdacK/Rgo0eK4NW3ELJo43vCI
X-Gm-Message-State: AOJu0Yz+33q0hsqYC2qC6lKg0Ok8uuZpnI8BrBFSwj8qiV5obk/Q4bsh
	cx3mv/R1jR4fgABpiEI7AiDDdfD/2VJGI5UdBbF0dwzK6fUAOLXgp+Lw9+2p1PQ=
X-Google-Smtp-Source: AGHT+IHkYfbHp49vXBPq2GzYI+m+sj3EoOMSLNJUFByut9N0A/v1sqpk1lB930PSP3tEEGwWku9VsQ==
X-Received: by 2002:a05:6808:169f:b0:3c3:cfdd:cabb with SMTP id bb31-20020a056808169f00b003c3cfddcabbmr1711052oib.15.1711337451448;
        Sun, 24 Mar 2024 20:30:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id b15-20020aa78ecf000000b006ea8cb5b514sm3285591pfr.186.2024.03.24.20.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 20:30:50 -0700 (PDT)
Message-ID: <6600efea.a70a0220.91abc.7a36@mx.google.com>
Date: Sun, 24 Mar 2024 20:30:50 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc1
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-firmware-kernelci baseline: 80 runs,
 10 regressions (v6.9-rc1)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-firmware-kernelci baseline: 80 runs, 10 regressions (v6=
.9-rc1)

Regressions Summary
-------------------

platform              | arch   | lab           | compiler | defconfig      =
            | regressions
----------------------+--------+---------------+----------+----------------=
------------+------------
acer-R721T-grunt      | x86_64 | lab-collabora | gcc-10   | x86_64_defconfi=
g+x86-board | 1          =

hp-11A-G6-EE-grunt    | x86_64 | lab-collabora | gcc-10   | x86_64_defconfi=
g+x86-board | 1          =

hp-14-db0003na-grunt  | x86_64 | lab-collabora | gcc-10   | x86_64_defconfi=
g+x86-board | 1          =

kontron-kbox-a-230-ls | arm64  | lab-kontron   | gcc-10   | defconfig      =
            | 5          =

mt8173-elm-hana       | arm64  | lab-collabora | gcc-10   | defconfig+arm64=
-chromebook | 2          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-firmwa=
re-kernelci/kernel/v6.9-rc1/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-firmware-kernelci
  Describe: v6.9-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      4cece764965020c22cff7665b18a012006359095 =



Test Regressions
---------------- =



platform              | arch   | lab           | compiler | defconfig      =
            | regressions
----------------------+--------+---------------+----------+----------------=
------------+------------
acer-R721T-grunt      | x86_64 | lab-collabora | gcc-10   | x86_64_defconfi=
g+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/6600e507dbb9a28c694c42f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.9-rc1/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/bas=
eline-acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.9-rc1/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/bas=
eline-acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6600e507dbb9a28c694c4=
2f6
        new failure (last pass: v6.7-rc1-2-g09aeaabebdaf) =

 =



platform              | arch   | lab           | compiler | defconfig      =
            | regressions
----------------------+--------+---------------+----------+----------------=
------------+------------
hp-11A-G6-EE-grunt    | x86_64 | lab-collabora | gcc-10   | x86_64_defconfi=
g+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/6600e5e33c9c66f84a4c42e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.9-rc1/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/bas=
eline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.9-rc1/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/bas=
eline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6600e5e33c9c66f84a4c4=
2ea
        new failure (last pass: v6.7-rc1-2-g09aeaabebdaf) =

 =



platform              | arch   | lab           | compiler | defconfig      =
            | regressions
----------------------+--------+---------------+----------+----------------=
------------+------------
hp-14-db0003na-grunt  | x86_64 | lab-collabora | gcc-10   | x86_64_defconfi=
g+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/6600e4f906bfcfd9134c430e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.9-rc1/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/bas=
eline-hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.9-rc1/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/bas=
eline-hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6600e4f906bfcfd9134c4=
30f
        new failure (last pass: v6.7-rc1-2-g09aeaabebdaf) =

 =



platform              | arch   | lab           | compiler | defconfig      =
            | regressions
----------------------+--------+---------------+----------+----------------=
------------+------------
kontron-kbox-a-230-ls | arm64  | lab-kontron   | gcc-10   | defconfig      =
            | 5          =


  Details:     https://kernelci.org/test/plan/id/6600e4462b6f402e624c4343

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.9-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.9-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6600e4462b6f402e624c434a
        failing since 62 days (last pass: v6.7-rc1-2-g09aeaabebdaf, first f=
ail: v6.8-rc1)

    2024-03-25T02:40:49.286104  / # #
    2024-03-25T02:40:49.388428  export SHELL=3D/bin/sh
    2024-03-25T02:40:49.389188  #
    2024-03-25T02:40:49.490632  / # export SHELL=3D/bin/sh. /lava-446984/en=
vironment
    2024-03-25T02:40:49.491405  =

    2024-03-25T02:40:49.592744  / # . /lava-446984/environment/lava-446984/=
bin/lava-test-runner /lava-446984/1
    2024-03-25T02:40:49.593968  =

    2024-03-25T02:40:49.613710  / # /lava-446984/bin/lava-test-runner /lava=
-446984/1
    2024-03-25T02:40:49.657268  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-25T02:40:49.657702  + <8>[   20.743006] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 446984_1.5.2.4.5> =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/6600e4462b6f402e624c434e
        failing since 62 days (last pass: v6.7-rc1-2-g09aeaabebdaf, first f=
ail: v6.8-rc1)

    2024-03-25T02:40:51.765327  /lava-446984/1/../bin/lava-test-case
    2024-03-25T02:40:51.765753  <8>[   22.852112] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-03-25T02:40:51.766144  /lava-446984/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/66=
00e4462b6f402e624c4350
        failing since 62 days (last pass: v6.7-rc1-2-g09aeaabebdaf, first f=
ail: v6.8-rc1)

    2024-03-25T02:40:52.828969  /lava-446984/1/../bin/lava-test-case
    2024-03-25T02:40:52.829452  <8>[   23.892659] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-03-25T02:40:52.829750  /lava-446984/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/6600e4462b6f402e624c4355
        failing since 62 days (last pass: v6.7-rc1-2-g09aeaabebdaf, first f=
ail: v6.8-rc1)

    2024-03-25T02:40:53.906013  /lava-446984/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/6600e4462b6f402e624c4356
        failing since 62 days (last pass: v6.7-rc1-2-g09aeaabebdaf, first f=
ail: v6.8-rc1)

    2024-03-25T02:40:53.909282  <8>[   25.009491] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-25T02:40:54.964498  /lava-446984/1/../bin/lava-test-case
    2024-03-25T02:40:54.964939  <8>[   26.031515] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-03-25T02:40:54.965299  /lava-446984/1/../bin/lava-test-case   =

 =



platform              | arch   | lab           | compiler | defconfig      =
            | regressions
----------------------+--------+---------------+----------+----------------=
------------+------------
mt8173-elm-hana       | arm64  | lab-collabora | gcc-10   | defconfig+arm64=
-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/6600e4fe2c823f05924c433c

  Results:     27 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.9-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.9-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.armv8-pmu-a72-probed: https://kernelci.org/test/case/id=
/6600e4fe2c823f05924c4357
        new failure (last pass: v6.8-rc1-4-g8a0a62941a042)

    2024-03-25T02:47:01.091294  <8>[   31.522567] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Darmv8-pmu-a53-probed RESULT=3Dfail>

    2024-03-25T02:47:02.112268  /lava-13143696/1/../bin/lava-test-case

    2024-03-25T02:47:02.123191  <8>[   32.554375] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Darmv8-pmu-a72-probed RESULT=3Dfail>
   =


  * baseline.bootrr.armv8-pmu-a53-probed: https://kernelci.org/test/case/id=
/6600e4fe2c823f05924c4358
        new failure (last pass: v6.8-rc1-4-g8a0a62941a042)

    2024-03-25T02:47:00.059703  <8>[   30.490799] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Darmv8-pmu-driver-present RESULT=3Dpass>

    2024-03-25T02:47:01.080668  /lava-13143696/1/../bin/lava-test-case
   =

 =20
