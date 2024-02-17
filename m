Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3501323D
	for <chrome-platform@lists.linux.dev>; Sat, 17 Feb 2024 02:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708138798; cv=none; b=eg3SRqLS1XJsu4ffw5R0OcYD98yx6W3tKjwp3bxK4xme0kg3UwLtz6/kH+Ad5eG+AdgcVaviyjECk7CdlASlMDXWbccKAFVxtI16Kygk+1q+WwL1MDADbVFipt7FxUBApm5HHUfuM43RZ9srQOeDC9npQtOqQp5cd1rVzNTTd58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708138798; c=relaxed/simple;
	bh=mmQ05JXSV0mEycwDg6sK46heXXJE1lHSky8YCbKHRBo=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=AC5/TKVHVdDg/N8/iSyZep+lnYgOiSu4dyBTO8n4gri/F6XQheD2ZSfojJ3kSjciRRRrW/BHin2aGGtEjB6Q+LKkMBRk9HZ0uVZMSr/ZkL/DtUtTQOmCszoqsb0mHngmlwPL8RLNZ/0hbgiFumdBpP++ENv3so4RKNzsK/ye/KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=EcLnlfmk; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="EcLnlfmk"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5961a2726aaso1530548eaf.0
        for <chrome-platform@lists.linux.dev>; Fri, 16 Feb 2024 18:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708138795; x=1708743595; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AsUinz9f7dUOWxu4hA5W1+sEfHfdBOwYF4uHi0lI56Y=;
        b=EcLnlfmkkDLjlewhgKzWLcExsurzNEIIw8vykOwFMy3TAgoELqzSwl7dZ7B5hP+wqW
         AvfskhBGiTIgEmL6GRC5KP6aNc9/eTk3y+FdJkwnDQpDk+UCl5o5PqlV13RDnjGdKdOc
         uNXn4nPEyvPa1apJi5hGkmyF/q6E88tyMDLgphXjOh0fRAfHZeqJiJZMlVcvk8T5qHUO
         KqC8PFY8LZY8yIRwBoyE4nBmCJg0zKcsH0aHEYJvr5fojKFKKQOWERvkajntbBIOc7be
         TTQUBdJKwNvXWWkW9+1uAjd8pP2sL43HnWobk2/PBcEjH32QnRKcP/PdkQOtb7/1yhXY
         n7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708138795; x=1708743595;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AsUinz9f7dUOWxu4hA5W1+sEfHfdBOwYF4uHi0lI56Y=;
        b=tASdojKzuGNLT/fYrvdpH2EGN48R1lg3uNByNJwWjlFvWXUy5MQtQ4feNidOcEMcwI
         RilxK8xRIMjzh/GNhZV49oH1VQLJmXY5ubIJEXGG3yZfRBYoSDLn1/h6yyg0fG59yGst
         BmfpuYWyNA6wAcSUn/s0pmhGccZSHYiWg3D0Drc2p7WKtuisnt+yuwtUXOIvPIKG1HPN
         mYaiuEw0Yv068g/HpAWLusjBj+aoFine9EIYA+9lWJV/yKgO01fHrs1rkWBzUJEdDvJ0
         6EZPwJSMcPYvLHkr3sx7ut3c2AS0Ju7EoDd+MHzD09iAO+LcNwFWoQSDoymrhGhIVvxJ
         OdTA==
X-Forwarded-Encrypted: i=1; AJvYcCUEkEivL5ZyYVsCJCrJOCMwdKLtwDyRuY/TcFgmn4Vs0Ks9cectJzleKGFqQFvfDnCxCc3zwy4GslFoylvXVPK2Hlu5As0AVggYLP66HKiU
X-Gm-Message-State: AOJu0Ywe2uKP7ikQfH/wLaeQVESjdwUWnE8Q/06my5cyYvGD2EZpl3Ia
	eFzM5VIPTih0V22u8cpBaoCZAhbn3j+iFNJyxGkQwI6mJh+V65NeltHXjs0I14w=
X-Google-Smtp-Source: AGHT+IEKDXE5W+ss7ruUiF3d3MIQ1Ni/vtxFInC1JKJSe/GnhKjrO4vh7q811XBx1s3j90mbvNdNoQ==
X-Received: by 2002:a05:6358:d1c:b0:178:c712:b123 with SMTP id v28-20020a0563580d1c00b00178c712b123mr7036039rwj.5.1708138795475;
        Fri, 16 Feb 2024 18:59:55 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id s12-20020a63f04c000000b005d67862799asm586229pgj.44.2024.02.16.18.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 18:59:54 -0800 (PST)
Message-ID: <65d0212a.630a0220.3b809.39a3@mx.google.com>
Date: Fri, 16 Feb 2024 18:59:54 -0800 (PST)
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
X-Kernelci-Kernel: v6.8-rc1-4-g8a0a62941a042
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-firmware-kernelci baseline: 61 runs,
 9 regressions (v6.8-rc1-4-g8a0a62941a042)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-firmware-kernelci baseline: 61 runs, 9 regressions (v6.=
8-rc1-4-g8a0a62941a042)

Regressions Summary
-------------------

platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
imx8mp-evk              | arm64 | lab-broonie   | gcc-10   | defconfig     =
             | 1          =

kontron-kbox-a-230-ls   | arm64 | lab-kontron   | gcc-10   | defconfig     =
             | 5          =

kontron-sl28-var3-ads2  | arm64 | lab-kontron   | gcc-10   | defconfig     =
             | 2          =

mt8195-cherry-tomato-r2 | arm64 | lab-collabora | gcc-10   | defconfig+arm6=
4-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-firmwa=
re-kernelci/kernel/v6.8-rc1-4-g8a0a62941a042/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-firmware-kernelci
  Describe: v6.8-rc1-4-g8a0a62941a042
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      8a0a62941a042612f7487f6c4ff291f9054ff214 =



Test Regressions
---------------- =



platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
imx8mp-evk              | arm64 | lab-broonie   | gcc-10   | defconfig     =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/65d0158306934ebac0637438

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.8-rc1-4-g8a0a62941a042/arm64/defconfig/gcc-10/lab-broonie/baseli=
ne-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.8-rc1-4-g8a0a62941a042/arm64/defconfig/gcc-10/lab-broonie/baseli=
ne-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d0158306934ebac063743d
        failing since 158 days (last pass: v6.5-rc1-1-g0979e7e3cfd7, first =
fail: v6.6-rc1)

    2024-02-17T02:09:47.888744  + set<8>[   27.601251] <LAVA_SIGNAL_ENDRUN =
0_dmesg 595223_1.5.2.4.1>
    2024-02-17T02:09:47.888976   +x
    2024-02-17T02:09:47.995035  / # #
    2024-02-17T02:09:49.156736  export SHELL=3D/bin/sh
    2024-02-17T02:09:49.162614  #
    2024-02-17T02:09:50.656308  / # export SHELL=3D/bin/sh. /lava-595223/en=
vironment
    2024-02-17T02:09:50.661814  =

    2024-02-17T02:09:53.375149  / # . /lava-595223/environment/lava-595223/=
bin/lava-test-runner /lava-595223/1
    2024-02-17T02:09:53.381251  =

    2024-02-17T02:09:53.393628  / # /lava-595223/bin/lava-test-runner /lava=
-595223/1 =

    ... (12 line(s) more)  =

 =



platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
kontron-kbox-a-230-ls   | arm64 | lab-kontron   | gcc-10   | defconfig     =
             | 5          =


  Details:     https://kernelci.org/test/plan/id/65d01492c1b246a50c637031

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.8-rc1-4-g8a0a62941a042/arm64/defconfig/gcc-10/lab-kontron/baseli=
ne-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.8-rc1-4-g8a0a62941a042/arm64/defconfig/gcc-10/lab-kontron/baseli=
ne-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d01492c1b246a50c637034
        failing since 25 days (last pass: v6.7-rc1-2-g09aeaabebdaf, first f=
ail: v6.8-rc1)

    2024-02-17T02:05:53.280070  / # #
    2024-02-17T02:05:53.382104  export SHELL=3D/bin/sh
    2024-02-17T02:05:53.382874  #
    2024-02-17T02:05:53.484398  / # export SHELL=3D/bin/sh. /lava-431417/en=
vironment
    2024-02-17T02:05:53.485137  =

    2024-02-17T02:05:53.586673  / # . /lava-431417/environment/lava-431417/=
bin/lava-test-runner /lava-431417/1
    2024-02-17T02:05:53.587859  =

    2024-02-17T02:05:53.634356  / # /lava-431417/bin/lava-test-runner /lava=
-431417/1
    2024-02-17T02:05:53.655930  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-17T02:05:53.695615  + cd /lava-431417/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65d01492c1b246a50c637038
        failing since 25 days (last pass: v6.7-rc1-2-g09aeaabebdaf, first f=
ail: v6.8-rc1)

    2024-02-17T02:05:55.907566  /lava-431417/1/../bin/lava-test-case
    2024-02-17T02:05:55.934690  <8>[   26.136531] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
d01492c1b246a50c63703a
        failing since 25 days (last pass: v6.7-rc1-2-g09aeaabebdaf, first f=
ail: v6.8-rc1)

    2024-02-17T02:05:56.995174  /lava-431417/1/../bin/lava-test-case
    2024-02-17T02:05:57.022474  <8>[   27.224660] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d01492c1b246a50c63703f
        failing since 25 days (last pass: v6.7-rc1-2-g09aeaabebdaf, first f=
ail: v6.8-rc1)

    2024-02-17T02:05:58.255273  /lava-431417/1/../bin/lava-test-case
    2024-02-17T02:05:58.282318  <8>[   28.483467] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65d01492c1b246a50c637040
        failing since 25 days (last pass: v6.7-rc1-2-g09aeaabebdaf, first f=
ail: v6.8-rc1)

    2024-02-17T02:05:59.305676  /lava-431417/1/../bin/lava-test-case
    2024-02-17T02:05:59.331701  <8>[   29.533684] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
kontron-sl28-var3-ads2  | arm64 | lab-kontron   | gcc-10   | defconfig     =
             | 2          =


  Details:     https://kernelci.org/test/plan/id/65d014a6c1b246a50c6370b0

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.8-rc1-4-g8a0a62941a042/arm64/defconfig/gcc-10/lab-kontron/baseli=
ne-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.8-rc1-4-g8a0a62941a042/arm64/defconfig/gcc-10/lab-kontron/baseli=
ne-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d014a6c1b246a50c6370b3
        failing since 25 days (last pass: v6.7-rc1-2-g09aeaabebdaf, first f=
ail: v6.8-rc1)

    2024-02-17T02:06:16.449706  / # #
    2024-02-17T02:06:16.552035  export SHELL=3D/bin/sh
    2024-02-17T02:06:16.552783  #
    2024-02-17T02:06:16.654223  / # export SHELL=3D/bin/sh. /lava-431416/en=
vironment
    2024-02-17T02:06:16.654988  =

    2024-02-17T02:06:16.756348  / # . /lava-431416/environment/lava-431416/=
bin/lava-test-runner /lava-431416/1
    2024-02-17T02:06:16.757555  =

    2024-02-17T02:06:16.776975  / # /lava-431416/bin/lava-test-runner /lava=
-431416/1
    2024-02-17T02:06:16.864855  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-17T02:06:16.865292  + cd /lava-431416/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d014a6c1b246a50c6370c6
        failing since 25 days (last pass: v6.7-rc1-2-g09aeaabebdaf, first f=
ail: v6.8-rc1)

    2024-02-17T02:06:19.792616  /lava-431416/1/../bin/lava-test-case
    2024-02-17T02:06:19.819750  <8>[   27.150707] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
mt8195-cherry-tomato-r2 | arm64 | lab-collabora | gcc-10   | defconfig+arm6=
4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/65d015e59abde2627563702e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.8-rc1-4-g8a0a62941a042/arm64/defconfig+arm64-chromebook/gcc-10/l=
ab-collabora/baseline-mt8195-cherry-tomato-r2.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.8-rc1-4-g8a0a62941a042/arm64/defconfig+arm64-chromebook/gcc-10/l=
ab-collabora/baseline-mt8195-cherry-tomato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d015e59abde26275637=
02f
        new failure (last pass: v6.8-rc1-1-ge3c5df138169) =

 =20
