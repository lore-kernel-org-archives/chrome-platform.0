Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60A09455
	for <chrome-platform@lists.linux.dev>; Mon,  5 Feb 2024 03:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707105163; cv=none; b=Y6JQj3/fG3EhSjqJkRBaLzMufD+hg+K3FaGSL3g1GEdVC+oxoNfZdQ1Fs9xYp07GIAcGcnimeTr0iIHa6ab+LtTx6jXkTe6TlDJxXvee+OZJ9hUvy8KFnnEciGmfaorTDauzbD/ZU0O/pIEBFZwsGdY1CbIkrtIso0SsvgqVqlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707105163; c=relaxed/simple;
	bh=ehNHA+ih5ObMGBQ55RvUiSup/nvVidKjyuZi9MEaTuk=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=ZT8cOgw7KAKJQ6ND/Sy3tXPQWpj+jQH+sSMucSYHdAlDZWEtTedqwT2MVbUMqbD7gr/Nme+hGLnTqMJdRVMbN4iyfZIxeD/4dxm1rFwEyvFg3cp9/8ptqgICrQ4RT+eNQtFYZl1QB+JZTeYhPEhOh9SAP5Tq1LaIwV/W08TrsPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=T7qQeQ+d; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="T7qQeQ+d"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5cdf76cde78so3549488a12.1
        for <chrome-platform@lists.linux.dev>; Sun, 04 Feb 2024 19:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707105161; x=1707709961; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rAqTA1ODodviFaEYzIT2IfQSmJN2wcW+4kaARW4RAmw=;
        b=T7qQeQ+dHebfdn6JQW4Z6C3GjZ3NKLQrIlNN4880YI1OkqqJ8tzeIRwasfP6o6+xMW
         zwUVvjwkF918eCp97K++s3KbXKj8egYHCEyinj4T4izJoSJ3Komv8Iv7e3k6laapECwD
         PEirDjAze0IF0OyH57e1rsfB5YBhjMXNcniF0rNpdrggvev5yT4JbiYxzizp+h6tqPdB
         nPHHAdgc8o6Xeq5P+0EedhAfm/fRqjPaPB8IBmZhGQmN64FtPEOpTIfg0XF1VFutgc5B
         56uhl7XzT6ruHQBs0tfLXgtK2wcNUNMemmoUoywNVS5NEdIh8q/zyXCS9mxu+2I1w9CU
         EYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707105161; x=1707709961;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rAqTA1ODodviFaEYzIT2IfQSmJN2wcW+4kaARW4RAmw=;
        b=ni8+7/Tmq/wEtGy0wjN7i6JeETMZkSrni+9MOALnCqWC0ZM71IkMw76SCAkffzAV6W
         GUB2mG9XFx/6GBsm2hVb6ejoBQocEMp5C8M62BT2lwpghnbsZvKHX5bznU3p5hIM4Ah1
         l1AoZW6HYU934UI5DBnH1EVBJ1juLa9t5G0x8EZoacp6CKI05zn9DbPrv9eNqavxgNlu
         gI9HSD8eD/jl7sxtiKwq+GNiydVjcqyGbv7ix6Dqmehi/rABmgN9ethsRrufcvQuiKrt
         P604gHHuZOAqZgoAljwkGjS5yPyw+NDvgYyRc6iA8MQsSO4mkHdhl8T9xJltfO+1FWFl
         qX6Q==
X-Gm-Message-State: AOJu0Yxkh9hyg+QugclBO5UzjwgCoAGEKzPooCeUUiMrFf+PLaXfj8u9
	vkWG2nuLM6uy15Tai/4YEH9e/mNvWsoqX5yblxhpPwy7G8heqe65kSjL+xUgWNc=
X-Google-Smtp-Source: AGHT+IE1FdU62d7nyxJBkiPRbIWaQrD0/G9ugm04tYItKCpM+2vNIExHwL894FxvC6qfr/A7hcSv9Q==
X-Received: by 2002:a05:6a20:6f05:b0:19c:922b:13e5 with SMTP id gt5-20020a056a206f0500b0019c922b13e5mr7328816pzb.59.1707105161113;
        Sun, 04 Feb 2024 19:52:41 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVApoVzl3pHhIYWjMmwN3wV76oWKIYgIX/VXD8Je7xGTMCTBtrKpWb3rV6uFKMJni0K59sZ2RpwxbmgVzsauD8Etn0j7sJGWKRqeVR468R/uorwKddh50vUYrddh248sw7r64YXl31U++g3JZd2z732s62lHzcYHplnEa7wNXhbKmELPE/GXlNHqFuP90j9j03CccsjU2x38WAZfKHF1F4VjGwc1Fpx8/l0546cWFHf4nLZuyq4LxEivO9GXhkU8E4=
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id dw4-20020a17090b094400b00295e392eca2sm4017907pjb.41.2024.02.04.19.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 19:52:40 -0800 (PST)
Message-ID: <65c05b88.170a0220.f3304.c911@mx.google.com>
Date: Sun, 04 Feb 2024 19:52:40 -0800 (PST)
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
X-Kernelci-Kernel: v6.8-rc1-1-gc6b0a4ceb7c9
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-firmware-kernelci baseline: 62 runs,
 8 regressions (v6.8-rc1-1-gc6b0a4ceb7c9)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-firmware-kernelci baseline: 62 runs, 8 regressions (v6.=
8-rc1-1-gc6b0a4ceb7c9)

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
re-kernelci/kernel/v6.8-rc1-1-gc6b0a4ceb7c9/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-firmware-kernelci
  Describe: v6.8-rc1-1-gc6b0a4ceb7c9
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      c6b0a4ceb7c9d8bb014d2967c97c8c7cbf60b006 =



Test Regressions
---------------- =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
imx8mp-evk             | arm64 | lab-broonie | gcc-10   | defconfig | 1    =
      =


  Details:     https://kernelci.org/test/plan/id/65c0502df65f547afd00a05e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.8-rc1-1-gc6b0a4ceb7c9/arm64/defconfig/gcc-10/lab-broonie/baselin=
e-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.8-rc1-1-gc6b0a4ceb7c9/arm64/defconfig/gcc-10/lab-broonie/baselin=
e-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c0502df65f547afd00a067
        failing since 146 days (last pass: v6.5-rc1-1-g0979e7e3cfd7, first =
fail: v6.6-rc1)

    2024-02-05T03:03:53.526904  + set<8>[   28.349423] <LAVA_SIGNAL_ENDRUN =
0_dmesg 544004_1.5.2.4.1>
    2024-02-05T03:03:53.527089   +x
    2024-02-05T03:03:53.643745  / # #
    2024-02-05T03:03:54.803087  export SHELL=3D/bin/sh
    2024-02-05T03:03:54.808594  #
    2024-02-05T03:03:56.299441  / # export SHELL=3D/bin/sh. /lava-544004/en=
vironment
    2024-02-05T03:03:56.304939  =

    2024-02-05T03:03:59.013942  / # . /lava-544004/environment/lava-544004/=
bin/lava-test-runner /lava-544004/1
    2024-02-05T03:03:59.019682  =

    2024-02-05T03:03:59.028924  / # /lava-544004/bin/lava-test-runner /lava=
-544004/1 =

    ... (13 line(s) more)  =

 =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 5    =
      =


  Details:     https://kernelci.org/test/plan/id/65c05010fec4296d5000a170

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.8-rc1-1-gc6b0a4ceb7c9/arm64/defconfig/gcc-10/lab-kontron/baselin=
e-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.8-rc1-1-gc6b0a4ceb7c9/arm64/defconfig/gcc-10/lab-kontron/baselin=
e-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c05011fec4296d5000a177
        failing since 13 days (last pass: v6.7-rc1-2-g09aeaabebdaf, first f=
ail: v6.8-rc1)

    2024-02-05T03:03:22.052974  / # #
    2024-02-05T03:03:22.153602  export SHELL=3D/bin/sh
    2024-02-05T03:03:22.153830  #
    2024-02-05T03:03:22.254373  / # export SHELL=3D/bin/sh. /lava-426100/en=
vironment
    2024-02-05T03:03:22.254617  =

    2024-02-05T03:03:22.355087  / # . /lava-426100/environment/lava-426100/=
bin/lava-test-runner /lava-426100/1
    2024-02-05T03:03:22.355389  =

    2024-02-05T03:03:22.368211  / # /lava-426100/bin/lava-test-runner /lava=
-426100/1
    2024-02-05T03:03:22.459132  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-05T03:03:22.459267  + cd /lava-426100/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65c05011fec4296d5000a17b
        failing since 13 days (last pass: v6.7-rc1-2-g09aeaabebdaf, first f=
ail: v6.8-rc1)

    2024-02-05T03:03:24.675553  /lava-426100/1/../bin/lava-test-case
    2024-02-05T03:03:24.702528  <8>[   26.067422] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
c05011fec4296d5000a17d
        failing since 13 days (last pass: v6.7-rc1-2-g09aeaabebdaf, first f=
ail: v6.8-rc1)

    2024-02-05T03:03:25.763211  /lava-426100/1/../bin/lava-test-case
    2024-02-05T03:03:25.789836  <8>[   27.155149] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65c05011fec4296d5000a182
        failing since 13 days (last pass: v6.7-rc1-2-g09aeaabebdaf, first f=
ail: v6.8-rc1)

    2024-02-05T03:03:27.022257  /lava-426100/1/../bin/lava-test-case
    2024-02-05T03:03:27.048347  <8>[   28.414303] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65c05011fec4296d5000a183
        failing since 13 days (last pass: v6.7-rc1-2-g09aeaabebdaf, first f=
ail: v6.8-rc1)

    2024-02-05T03:03:28.073125  /lava-426100/1/../bin/lava-test-case
    2024-02-05T03:03:28.099083  <8>[   29.464471] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig | 2    =
      =


  Details:     https://kernelci.org/test/plan/id/65c0500ffec4296d5000a10a

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.8-rc1-1-gc6b0a4ceb7c9/arm64/defconfig/gcc-10/lab-kontron/baselin=
e-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.8-rc1-1-gc6b0a4ceb7c9/arm64/defconfig/gcc-10/lab-kontron/baselin=
e-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c0500ffec4296d5000a111
        failing since 13 days (last pass: v6.7-rc1-2-g09aeaabebdaf, first f=
ail: v6.8-rc1)

    2024-02-05T03:03:23.457644  / # #
    2024-02-05T03:03:23.558277  export SHELL=3D/bin/sh
    2024-02-05T03:03:23.558519  #
    2024-02-05T03:03:23.659040  / # export SHELL=3D/bin/sh. /lava-426096/en=
vironment
    2024-02-05T03:03:23.659291  =

    2024-02-05T03:03:23.759801  / # . /lava-426096/environment/lava-426096/=
bin/lava-test-runner /lava-426096/1
    2024-02-05T03:03:23.760338  =

    2024-02-05T03:03:23.772381  / # /lava-426096/bin/lava-test-runner /lava=
-426096/1
    2024-02-05T03:03:23.865329  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-05T03:03:23.865472  + cd /lava-426096/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65c0500ffec4296d5000a124
        failing since 13 days (last pass: v6.7-rc1-2-g09aeaabebdaf, first f=
ail: v6.8-rc1)

    2024-02-05T03:03:26.793119  /lava-426096/1/../bin/lava-test-case
    2024-02-05T03:03:26.820255  <8>[   27.099356] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =20
