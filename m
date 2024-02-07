Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F165D134AA
	for <chrome-platform@lists.linux.dev>; Wed,  7 Feb 2024 02:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707271695; cv=none; b=oMnfJP932yEC4w6RADCzaCsthxXeqa9MVFuY/a5W0QwkVJmEMp4O/Xx8q94aBmIHsfdjvSnrqSbPxgcOZt8nx9I+WZsasKJbFLyZ5a6KPgDVkI1dZTG4j4m7kdMrfl71fdyr7L4Neh37SNFSkPwkzB+v2L8Qc8VYHLE4fYf2vSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707271695; c=relaxed/simple;
	bh=zL8f3aMpnDBKJk8QnA/L71jmwBE6K0RBILY00SvIGB8=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=UMB0H758VSlo4137Qa8pC+ShzQrganyqdviHFG8G7Nd019c102+kGvqPPYBXQtD8LZe8MvKSjLy9YKmPE8inoOL5+dqSlx2kLaDWXPdZvsev5PSXV8WJyAEw5xicnhhLeZJsGDwr4fiNIt9OoAVN67+bdHPpctSYQnRueif1GKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=cZ5IrRm8; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="cZ5IrRm8"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3bfdbac32b3so86969b6e.0
        for <chrome-platform@lists.linux.dev>; Tue, 06 Feb 2024 18:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707271692; x=1707876492; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C1BypktsIH4XHcK8apm4xNxXqy4KRB+YSJqOxgPdjcM=;
        b=cZ5IrRm8MtUOTJpXHAs0Du9ynqlOvq9SMAP/zfkHukhOQluwI4lTQBXXaxh6lPbG2E
         Q8vCR92s275IvGeBvZiG8KRnr/1A049bNbjWEbM228Pa1HZfSJoI3mZk7uqZ9jlLMVea
         sEq0Cj1aYGjDYn4DEZkD/MS07kyp9tJ00lcVwUfEIdrzNT9u7tUQfVqueqylp+e898ih
         JxbSsi7HFz9cfQ7vtzW8ugUwvug/G6Rw70xuueKid+r17driEx2ydE6eOmXSKoL1BH5A
         ZMcvkjXgkbGM58X1UCQy+xgTp9zunD/V6Wx1zIJR0xnjhfJReobum/4j7AOY1AJ8Hfu7
         B2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707271692; x=1707876492;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C1BypktsIH4XHcK8apm4xNxXqy4KRB+YSJqOxgPdjcM=;
        b=cvOET7O6qA453CVHeIgeOKOwpZjnKjXT/8WTPSCWtwzA7VL6e/hmmHrEtivdr0yWMk
         M3yks41D4wLmtLBZrsfiM+D4YOyX5g5IGijKVK1zQ9KOdT/QonkJIb1RX2Y0pyi51TJK
         xv4yKB7LsvVEsjsX23f09OK7/At92vSOxy0HeK0yec5asbQJBzh6aNvGpujAYRI2mkUr
         0MpeupBuSkI4NqdDMMkqNjpfIA6Vh3K7nw/XMLAoer/Pji17dNfG6L/1YQrf0GDRXQBT
         kdlTRqMYV4RZoYtnelwV0K12cQsKcLvHG3lG3jXhH8e8FafwQxrFm0wN2qhw0HXC9mF5
         5PaA==
X-Gm-Message-State: AOJu0Ywuq6qTQaQgPmrdIsUyRJkyYIzGHAZwoBPoatss5OJkRXMFzp3u
	y2pcQdHQRypmbdbUhOZo7oVmN1G740F5m9hLsse/eZclnuWelUTpxGGarXy4Lzg=
X-Google-Smtp-Source: AGHT+IHZs3rQELOPKLCzkUNqGFZvSmHlf0ErnY+gKUAue0dkNEIa6augMrNj/eP9LImIgqC9wFotqQ==
X-Received: by 2002:a05:6808:14c2:b0:3bf:a2d2:6a7d with SMTP id f2-20020a05680814c200b003bfa2d26a7dmr4777445oiw.55.1707271691899;
        Tue, 06 Feb 2024 18:08:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW11G8pLmEUQf8XOEEoUvaG/4snVsD9nKdTt+iJF34LJroUSKnwZmHEKLSpTYp15kdwMDaY2eY7uG37g0784W7Ild9ZdpkekinDouPaxRSZChYdVhbGW+7OWXWXvjB3gHASkGBgNVFKRWi4L7UmYI7NiGRfUepQS7zWombDCLbaGAhzuOLwSlos2rCzJ3DiUB6euo9sybnS8Atfp2drM08j20OQZ+8QDSvZDOEBHBwYv4T68Tk9i44egD+j7AREyWA=
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id n29-20020a056a000d5d00b006e0322f072asm192852pfv.35.2024.02.06.18.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 18:08:11 -0800 (PST)
Message-ID: <65c2e60b.050a0220.4ff04.0b63@mx.google.com>
Date: Tue, 06 Feb 2024 18:08:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-firmware-kernelci
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.8-rc1-1-ge3c5df138169
Subject: chrome-platform/for-firmware-kernelci baseline: 63 runs,
 8 regressions (v6.8-rc1-1-ge3c5df138169)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-firmware-kernelci baseline: 63 runs, 8 regressions (v6.=
8-rc1-1-ge3c5df138169)

Regressions Summary
-------------------

platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
imx8mp-evk             | arm64 | lab-broonie | gcc-10   | defconfig | 1    =
      =

kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 5    =
      =

kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig | 2    =
      =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-firmwa=
re-kernelci/kernel/v6.8-rc1-1-ge3c5df138169/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-firmware-kernelci
  Describe: v6.8-rc1-1-ge3c5df138169
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      e3c5df138169b5494a16b20e74db1ee14b1901ce =



Test Regressions
---------------- =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
imx8mp-evk             | arm64 | lab-broonie | gcc-10   | defconfig | 1    =
      =


  Details:     https://kernelci.org/test/plan/id/65c2db3c2d07e12b758e1f27

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.8-rc1-1-ge3c5df138169/arm64/defconfig/gcc-10/lab-broonie/baselin=
e-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.8-rc1-1-ge3c5df138169/arm64/defconfig/gcc-10/lab-broonie/baselin=
e-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c2db3c2d07e12b758e1f2c
        failing since 148 days (last pass: v6.5-rc1-1-g0979e7e3cfd7, first =
fail: v6.6-rc1)

    2024-02-07T01:21:47.741124  + set<8>[   28.102807] <LAVA_SIGNAL_ENDRUN =
0_dmesg 551455_1.5.2.4.1>
    2024-02-07T01:21:47.741337   +x
    2024-02-07T01:21:47.845348  / # #
    2024-02-07T01:21:49.004395  export SHELL=3D/bin/sh
    2024-02-07T01:21:49.009927  #
    2024-02-07T01:21:50.501346  / # export SHELL=3D/bin/sh. /lava-551455/en=
vironment
    2024-02-07T01:21:50.506821  =

    2024-02-07T01:21:53.216940  / # . /lava-551455/environment/lava-551455/=
bin/lava-test-runner /lava-551455/1
    2024-02-07T01:21:53.222948  =

    2024-02-07T01:21:53.228302  / # /lava-551455/bin/lava-test-runner /lava=
-551455/1 =

    ... (12 line(s) more)  =

 =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 5    =
      =


  Details:     https://kernelci.org/test/plan/id/65c2dae4abb902736a8e1eaf

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.8-rc1-1-ge3c5df138169/arm64/defconfig/gcc-10/lab-kontron/baselin=
e-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.8-rc1-1-ge3c5df138169/arm64/defconfig/gcc-10/lab-kontron/baselin=
e-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c2dae4abb902736a8e1eb2
        failing since 15 days (last pass: v6.7-rc1-2-g09aeaabebdaf, first f=
ail: v6.8-rc1)

    2024-02-07T01:20:04.324593  / # #
    2024-02-07T01:20:04.426625  export SHELL=3D/bin/sh
    2024-02-07T01:20:04.427352  #
    2024-02-07T01:20:04.528552  / # export SHELL=3D/bin/sh. /lava-426572/en=
vironment
    2024-02-07T01:20:04.529251  =

    2024-02-07T01:20:04.630494  / # . /lava-426572/environment/lava-426572/=
bin/lava-test-runner /lava-426572/1
    2024-02-07T01:20:04.631543  =

    2024-02-07T01:20:04.636584  / # /lava-426572/bin/lava-test-runner /lava=
-426572/1
    2024-02-07T01:20:04.700592  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-07T01:20:04.734297  + cd /lava-426572/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65c2dae4abb902736a8e1eb6
        failing since 15 days (last pass: v6.7-rc1-2-g09aeaabebdaf, first f=
ail: v6.8-rc1)

    2024-02-07T01:20:06.950565  /lava-426572/1/../bin/lava-test-case
    2024-02-07T01:20:06.977589  <8>[   26.137105] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
c2dae4abb902736a8e1eb8
        failing since 15 days (last pass: v6.7-rc1-2-g09aeaabebdaf, first f=
ail: v6.8-rc1)

    2024-02-07T01:20:08.038622  /lava-426572/1/../bin/lava-test-case
    2024-02-07T01:20:08.065094  <8>[   27.224747] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65c2dae4abb902736a8e1ebd
        failing since 15 days (last pass: v6.7-rc1-2-g09aeaabebdaf, first f=
ail: v6.8-rc1)

    2024-02-07T01:20:09.297865  /lava-426572/1/../bin/lava-test-case
    2024-02-07T01:20:09.323694  <8>[   28.483819] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65c2dae4abb902736a8e1ebe
        failing since 15 days (last pass: v6.7-rc1-2-g09aeaabebdaf, first f=
ail: v6.8-rc1)

    2024-02-07T01:20:10.347328  /lava-426572/1/../bin/lava-test-case
    2024-02-07T01:20:10.374267  <8>[   29.534112] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig | 2    =
      =


  Details:     https://kernelci.org/test/plan/id/65c2dae7abb902736a8e1f10

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.8-rc1-1-ge3c5df138169/arm64/defconfig/gcc-10/lab-kontron/baselin=
e-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.8-rc1-1-ge3c5df138169/arm64/defconfig/gcc-10/lab-kontron/baselin=
e-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c2dae7abb902736a8e1f13
        failing since 15 days (last pass: v6.7-rc1-2-g09aeaabebdaf, first f=
ail: v6.8-rc1)

    2024-02-07T01:20:20.166633  / # #
    2024-02-07T01:20:20.268687  export SHELL=3D/bin/sh
    2024-02-07T01:20:20.269415  #
    2024-02-07T01:20:20.370947  / # export SHELL=3D/bin/sh. /lava-426574/en=
vironment
    2024-02-07T01:20:20.371708  =

    2024-02-07T01:20:20.473097  / # . /lava-426574/environment/lava-426574/=
bin/lava-test-runner /lava-426574/1
    2024-02-07T01:20:20.474287  =

    2024-02-07T01:20:20.493983  / # /lava-426574/bin/lava-test-runner /lava=
-426574/1
    2024-02-07T01:20:20.581619  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-07T01:20:20.582115  + cd /lava-426574/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65c2dae7abb902736a8e1f26
        failing since 15 days (last pass: v6.7-rc1-2-g09aeaabebdaf, first f=
ail: v6.8-rc1)

    2024-02-07T01:20:23.510421  /lava-426574/1/../bin/lava-test-case
    2024-02-07T01:20:23.539631  <8>[   27.054471] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =20
