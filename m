Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955E01FDF
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 04:45:55 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id w21so11861750pfc.0
        for <chrome-platform@lists.linux.dev>; Sun, 05 Jun 2022 21:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=P8jxlggradK/wR/ONPk0Na0/BYalCvxx5RNieeYA4SA=;
        b=e45pBoCDQNHWaJ/KSx75RQIkEcmHrDvLAY0I0j48TvzQN3CuCATTjA/eCbZmzqPuMB
         Ra1d3veSowaS5uiQrH4GXxVK+n4C2hODoNE0iTafc2brj4p/r7XRDj21a7yFOQU4Csdq
         r8L0w1jwh2TNUJDBj3HuJKuhuItueaYCvbFcO0Bc6z/cutNVfQY1gOTlWLI+q1Yrvg44
         sVQy1Gx1V7ZtQxT+Y7Ilh3SIU/OjNAzro1W4CWsRYpLX/bYkfL9l3WQxIo7/zK6asMpg
         r5ByYEQH6pwA8I+U/IOANGCmQhnJNumxrT/Xg1xKi53xHRRH4Ryklv08+/fWh/bU42Os
         FziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=P8jxlggradK/wR/ONPk0Na0/BYalCvxx5RNieeYA4SA=;
        b=w/6zBs7+iWRMs3YRT/PPSPixytBwgIBRSceOtJ+OvQF8MEB5W12vtTR6MfhLUY1r0r
         2nNQ9i3br1Iyn7P/zzI0NcDzmkzHQ9vATq6LW1eF+PMpfdS/IbczNpxiYvSZZTvxqkw5
         ZAiS2+H2jEHUKsB2EvNQlXNP+sTVFY+O/uGowsuzvg7eDxegt4dRa8uGIjEEMiA3Gn9e
         TjgrNL6DJw1z9Mpdz77hb9XV1CxGlwDAiFKOCPyhIS0DNoeuaortWEmL++tXYCEqBVL3
         7+epgh6O5MjMxoEkcsHjkv5TVBoBBJMBmJSI7vI5Mk6WKeHR3N5eqTnPhXoolp2MvwVc
         NotA==
X-Gm-Message-State: AOAM53222hM2ujQ1VlR8ySasL/H3Ol+VtxwNTAKHJo6/y5ieZeQEyMUN
	P9s53wXxpvoXBSrmtvlfOOtgPw==
X-Google-Smtp-Source: ABdhPJwo0ZuEipVCXRRBM2uuiuKcJ74uTH4pMkSUu+h0NDq4NF+Pg4HCMbGscds0qiA2UcaDK1eUUw==
X-Received: by 2002:a63:e315:0:b0:3fa:8780:9a1b with SMTP id f21-20020a63e315000000b003fa87809a1bmr19438840pgh.306.1654490755002;
        Sun, 05 Jun 2022 21:45:55 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d62-20020a623641000000b0051baaa40028sm9881898pfa.11.2022.06.05.21.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 21:45:54 -0700 (PDT)
Message-ID: <629d8682.1c69fb81.809f5.64f6@mx.google.com>
Date: Sun, 05 Jun 2022 21:45:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc1-5-g4a0e708bb23fc
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci baseline: 86 runs,
 11 regressions (v5.19-rc1-5-g4a0e708bb23fc)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 86 runs, 11 regressions (v5.19-rc1-5=
-g4a0e708bb23fc)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig         | 1          =

beaglebone-black             | arm   | lab-broonie   | gcc-10   | multi_v7_=
defconfig         | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig         | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                  | 1          =

mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig         | 1          =

tegra124-nyan-big            | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig         | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.19-rc1-5-g4a0e708bb23fc/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.19-rc1-5-g4a0e708bb23fc
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      4a0e708bb23fc2fd10c7320b40ab9af2cf619f5f =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/629d7a70994dafa5dca39bd0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-5-g4a0e708bb23fc/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseli=
ne-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-5-g4a0e708bb23fc/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseli=
ne-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d7a70994dafa5dca39=
bd1
        new failure (last pass: v5.18-rc1-24-gc2d7e384924d) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
beaglebone-black             | arm   | lab-broonie   | gcc-10   | multi_v7_=
defconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/629d7b69aeef5cef23a39c0c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-5-g4a0e708bb23fc/arm/multi_v7_defconfig/gcc-10/lab-broonie/baselin=
e-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-5-g4a0e708bb23fc/arm/multi_v7_defconfig/gcc-10/lab-broonie/baselin=
e-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d7b69aeef5cef23a39=
c0d
        new failure (last pass: v5.18-rc1-24-gc2d7e384924d) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/629d7fb7797f5e7b27a39bd6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-5-g4a0e708bb23fc/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseli=
ne-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-5-g4a0e708bb23fc/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseli=
ne-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d7fb7797f5e7b27a39=
bd7
        new failure (last pass: v5.18-rc1-24-gc2d7e384924d) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/629d7ce08607cbeec1a39bdc

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-5-g4a0e708bb23fc/arm64/defconfig/gcc-10/lab-kontron/baseline-kontr=
on-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-5-g4a0e708bb23fc/arm64/defconfig/gcc-10/lab-kontron/baseline-kontr=
on-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
9d7ce08607cbeec1a39be5
        new failure (last pass: v5.18-rc1-24-gc2d7e384924d)

    2022-06-06T04:04:28.260680  /lava-124776/1/../bin/lava-test-case
    2022-06-06T04:04:28.305294  <8>[   15.341419] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2022-06-06T04:04:28.305632  /lava-124776/1/../bin/lava-test-case
    2022-06-06T04:04:28.305821  <8>[   15.353854] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2022-06-06T04:04:28.306007  /lava-124776/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/629d7c198b38fd11d3a39bd0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-5-g4a0e708bb23fc/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-5-g4a0e708bb23fc/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d7c198b38fd11d3a39=
bd1
        new failure (last pass: v5.18-rc1-24-gc2d7e384924d) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =


  Details:     https://kernelci.org/test/plan/id/629d7bea2c65fad1ffa39c67

  Results:     83 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-5-g4a0e708bb23fc/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-5-g4a0e708bb23fc/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/629d7bea2c65fad1ffa39c88
        failing since 61 days (last pass: v5.17-rc1-10-g0ef49b25b7cc, first=
 fail: v5.18-rc1-1-gbf84b10d9901d)

    2022-06-06T04:00:17.878662  <8>[   52.254333] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-06-06T04:00:18.889282  /lava-6549124/1/../bin/lava-test-case
    2022-06-06T04:00:18.902829  <8>[   53.276273] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/629d7bea2c65fad1ffa39cab
        new failure (last pass: v5.18-rc1-24-gc2d7e384924d)

    2022-06-06T04:00:16.247687  <8>[   50.620326] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>
    2022-06-06T04:00:17.256286  /lava-6549124/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/629d7bea2c65fad1ffa39cac
        new failure (last pass: v5.18-rc1-24-gc2d7e384924d)

    2022-06-06T04:00:16.234257  /lava-6549124/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/629d7bea2c65fad1ffa39cad
        new failure (last pass: v5.18-rc1-24-gc2d7e384924d)

    2022-06-06T04:00:14.199785  <8>[   48.572995] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dpass>
    2022-06-06T04:00:14.272537  <4>[   48.646753] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-06-06T04:00:15.215732  /lava-6549124/1/../bin/lava-test-case
    2022-06-06T04:00:15.232133  <8>[   49.602664] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/629d7ba11f850372b5a39be7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-5-g4a0e708bb23fc/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseli=
ne-sun8i-h2-plus-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-5-g4a0e708bb23fc/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseli=
ne-sun8i-h2-plus-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d7ba11f850372b5a39=
be8
        new failure (last pass: v5.18-rc1-24-gc2d7e384924d) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
tegra124-nyan-big            | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/629d7e5d863f2f113ca39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-5-g4a0e708bb23fc/arm/multi_v7_defconfig/gcc-10/lab-collabora/basel=
ine-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-5-g4a0e708bb23fc/arm/multi_v7_defconfig/gcc-10/lab-collabora/basel=
ine-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d7e5d863f2f113ca39=
bce
        new failure (last pass: v5.18-rc1-24-gc2d7e384924d) =

 =20
