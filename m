Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54254362
	for <chrome-platform@lists.linux.dev>; Fri, 10 Jun 2022 04:44:40 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id p8so22856511pfh.8
        for <chrome-platform@lists.linux.dev>; Thu, 09 Jun 2022 21:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Sjr12jQU4UHRjUzPQjc6NH9NmnQ/EF32KKpV4pdufdI=;
        b=fb6x5iGkqL+0MKEwBGCrLiGn9C/ebLQtApR7+1ElG6VFZjjAQ6oU1ujUnhZlZ0TUNr
         AQshKpUB57vfPg41zFWePh9WVna5KvT2hazHar6VsH21IbEcyyrsJs3GAM0efGWNhKA0
         mhRdpmy3rmjTyNDPje7+/gobozyCPEsIMgZFs3TdzXr+j6tF15efj0jdjzYlsj4F4cPP
         sbXzOtWUof1+oabRgeYV+rKEe7VXpd1BFLT6Tnmt9u2N52aIUKyc+YM+vdwSbiCgqLut
         HVdDfl71gBTyH2/KaM82cKjCk3VIy8diDT0zojRYHsxvnaMC5AkLZOuoCY+l7mPCYPMC
         ZEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Sjr12jQU4UHRjUzPQjc6NH9NmnQ/EF32KKpV4pdufdI=;
        b=Y3l2U8MnCF9ulaOVsnnlLkUASmHAmYGZ51kPAuprJqn+pW6eU6vIq4/PvkLQ1qYwtM
         hQHgx/e7ih7F+MIRfBlt5EB4RFVNhUvn944hB/c3/p2xqlZIYFvP6rRHWMMIOo7SKS3p
         uP2iMHEfrbiJyp6aRjB7IeviuZ8aSMjOTIyagrfGHUhUgrCxGSj+Ql3G9X8QWJX2lJRO
         hgI7aEGmuyp+E0/5zJ52wOblNkEbrH8wjCqF9V6ngTXtfJtcnTnaF3f5Q9nRps38QriT
         F8o1pCcQ1CJCbhEnSAbHiTXF4bi3DgFnJqlFOjISIWyHtM2QV0/sMmiGCr0QqybqNb1A
         adkg==
X-Gm-Message-State: AOAM533oToLCTi/mAdbkGf77rrWQWK9u5HZsXra0ams5cTayQSWgLnor
	9AgkczjDxNDp3bEW7SI4SgFgZA==
X-Google-Smtp-Source: ABdhPJyCk7e/sn/+zdYsA3Ai2xGq+it52CL8hZ+F8wQ8sbU2rEc4JCh/+IxYJUA00xADFW+ThpQliA==
X-Received: by 2002:a63:2b02:0:b0:3fb:fe88:8a8f with SMTP id r2-20020a632b02000000b003fbfe888a8fmr37593093pgr.247.1654836279661;
        Thu, 09 Jun 2022 21:44:39 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t4-20020aa79384000000b0051baeb06c0bsm18096421pfe.168.2022.06.09.21.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 21:44:39 -0700 (PDT)
Message-ID: <62a2cc37.1c69fb81.9ea3d.3b06@mx.google.com>
Date: Thu, 09 Jun 2022 21:44:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc1-35-g412b193d93912
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci baseline: 85 runs,
 8 regressions (v5.19-rc1-35-g412b193d93912)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 85 runs, 8 regressions (v5.19-rc1-35=
-g412b193d93912)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                  | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig         | 1          =

sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig         | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.19-rc1-35-g412b193d93912/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.19-rc1-35-g412b193d93912
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      412b193d93912055f2389500102f4bd75ba9b144 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/62a2c2894662865783a39be1

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-35-g412b193d93912/arm64/defconfig/gcc-10/lab-kontron/baseline-kont=
ron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-35-g412b193d93912/arm64/defconfig/gcc-10/lab-kontron/baseline-kont=
ron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
a2c2894662865783a39bee
        failing since 3 days (last pass: v5.18-rc1-24-gc2d7e384924d, first =
fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-06-10T04:03:15.599846  /lava-125950/1/../bin/lava-test-case
    2022-06-10T04:03:15.644336  <8>[   17.249187] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2022-06-10T04:03:15.644720  /lava-125950/1/../bin/lava-test-case
    2022-06-10T04:03:15.644959  <8>[   17.262076] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2022-06-10T04:03:15.645181  /lava-125950/1/../bin/lava-test-case
    2022-06-10T04:03:15.645357  <8>[   17.274663] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2022-06-10T04:03:15.645533  /lava-125950/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =


  Details:     https://kernelci.org/test/plan/id/62a2c39247572fdbbaa39bf9

  Results:     82 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-35-g412b193d93912/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-35-g412b193d93912/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62a2c39247572fdbbaa39c19
        failing since 65 days (last pass: v5.17-rc1-10-g0ef49b25b7cc, first=
 fail: v5.18-rc1-1-gbf84b10d9901d)

    2022-06-10T04:07:32.027751  /lava-6580004/1/../bin/lava-test-case
    2022-06-10T04:07:32.040513  <8>[   55.780448] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/62a2c39247572fdbbaa39c3c
        failing since 4 days (last pass: v5.18-rc1-24-gc2d7e384924d, first =
fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-06-10T04:07:29.411838  <8>[   53.147499] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>
    2022-06-10T04:07:30.414132  /lava-6580004/1/../bin/lava-test-case
    2022-06-10T04:07:30.429600  <8>[   54.166981] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62a2c39247572fdbbaa39c3d
        failing since 4 days (last pass: v5.18-rc1-24-gc2d7e384924d, first =
fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-06-10T04:07:29.395980  /lava-6580004/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/62a2c39247572fdbbaa39c3e
        failing since 4 days (last pass: v5.18-rc1-24-gc2d7e384924d, first =
fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-06-10T04:07:27.726677  <4>[   51.462757] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-06-10T04:07:28.374718  /lava-6580004/1/../bin/lava-test-case
    2022-06-10T04:07:28.392173  <8>[   52.127407] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/62a2c3f7cca25f9abba39bce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-35-g412b193d93912/arm64/defconfig/gcc-10/lab-broonie/baseline-sun5=
0i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-35-g412b193d93912/arm64/defconfig/gcc-10/lab-broonie/baseline-sun5=
0i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a2c3f7cca25f9abba39=
bcf
        new failure (last pass: v5.18-rc1-24-gc2d7e384924d) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/62a2c1ebb4ad0ddc9ca39c44

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-35-g412b193d93912/arm/multi_v7_defconfig/gcc-10/lab-baylibre/basel=
ine-sun8i-h2-plus-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-35-g412b193d93912/arm/multi_v7_defconfig/gcc-10/lab-baylibre/basel=
ine-sun8i-h2-plus-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a2c1ebb4ad0ddc9ca39=
c45
        failing since 1 day (last pass: v5.19-rc1-6-gc1db0861e8d02, first f=
ail: v5.19-rc1-9-g2e042d202474) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/62a2c1f970ab4f18fba39bd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-35-g412b193d93912/arm/multi_v7_defconfig/gcc-10/lab-baylibre/basel=
ine-sun8i-h2-plus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-35-g412b193d93912/arm/multi_v7_defconfig/gcc-10/lab-baylibre/basel=
ine-sun8i-h2-plus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a2c1f970ab4f18fba39=
bd9
        failing since 3 days (last pass: v5.19-rc1-5-g4a0e708bb23fc, first =
fail: v5.19-rc1-6-gc1db0861e8d02) =

 =20
