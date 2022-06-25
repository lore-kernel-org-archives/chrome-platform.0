Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8156D7C
	for <chrome-platform@lists.linux.dev>; Sat, 25 Jun 2022 14:20:32 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id 128so4977949pfv.12
        for <chrome-platform@lists.linux.dev>; Sat, 25 Jun 2022 07:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Zqz9bj6ZirykN6+1PIIDlexnhJnOqgKjA0oXU5Qjr6o=;
        b=WZ732xbV72vUI6w8L96ICntVwWT69my3FabH1QLDs+My30xqYGWcGUl9Sgdi9nvOr0
         YJmvUaIzAl0KdHh1ISfeRcw1JG4vsOHKL0qb3feBUkrNqbmR70WxLgsRp3poag2BqVqE
         Z9wjp++hWnrQPwpQNqq5jOlH69Rp6drV0VAW52ddNsQ94axIOBNxb1unZI+ggyi88G1M
         ytY/tWcLEqP878dBTCVUKTdSna4xNlPYevqSj0zpStAqLD0z1KCgfpRy8U5GsbvwaZRg
         R7TwOwDS7wSlfQaL+ha5ov7ZO3wv67DVCn2EVy7FNnOd+p374o74QK3d+Hg4KNZWGwH+
         rVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Zqz9bj6ZirykN6+1PIIDlexnhJnOqgKjA0oXU5Qjr6o=;
        b=VfbBFVWpyxzM2xVhA2Ffu9YhWr218F6CjRiPZE+NKkthpeFDU5KNQcX/W/i6YvXbly
         O0JSB5qEArAPOmUTITjOEuU/FQFxfJRIZ0hvb47uABKcdCwg93I8sHAGxRoR0w3CzXZE
         9EKaBkCEvMEPR7TJq5wckjwpx9mIyyKaV68Koxcre8p0cH3kC+95zqAKcx0phEtT+83Y
         p7g+latdCRaU8nxgq5RdZky0gaA3+grEsFRck9jJROefRtQqvBfK/jk5c52QegKOigJZ
         C0noG2jOnLYnDOmNb2k2EDHIu6WHdCPYO3DbAFun/ASUEaP3sDv/sIr2LPkK6vMprvgU
         3iuQ==
X-Gm-Message-State: AJIora9u9C8OdRA8nQ4bqwGpGwWmDTMOlzuZDFkwxS1iU9CmP2uf7+4F
	ADSQhTlvHYQaBbP3Bqm41keYCA==
X-Google-Smtp-Source: AGRyM1u1LPLABG+DamstNc+XSqhqG3dEeLDmo/i2ixWeQkpA/7ejXuh6Bit+v9aPWqu1sDSf30Z1vQ==
X-Received: by 2002:a63:8c5c:0:b0:40c:95c3:8c02 with SMTP id q28-20020a638c5c000000b0040c95c38c02mr4042328pgn.419.1656166831882;
        Sat, 25 Jun 2022 07:20:31 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 67-20020a630946000000b00405306de2c2sm3490354pgj.65.2022.06.25.07.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jun 2022 07:20:31 -0700 (PDT)
Message-ID: <62b719af.1c69fb81.3ab4b.4901@mx.google.com>
Date: Sat, 25 Jun 2022 07:20:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc1-38-g15288cf9f149
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci baseline: 106 runs,
 9 regressions (v5.19-rc1-38-g15288cf9f149)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 106 runs, 9 regressions (v5.19-rc1-3=
8-g15288cf9f149)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig         | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                  | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
                  | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
                  | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig         | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.19-rc1-38-g15288cf9f149/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.19-rc1-38-g15288cf9f149
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      15288cf9f149a0264eddd61c0af5d5dd9aad34d9 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/62b70f64aab15c6724a39bf7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-38-g15288cf9f149/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseli=
ne-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-38-g15288cf9f149/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseli=
ne-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b70f64aab15c6724a39=
bf8
        failing since 19 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/62b70e54dccbf10d81a39c11

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-38-g15288cf9f149/arm64/defconfig/gcc-10/lab-kontron/baseline-kontr=
on-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-38-g15288cf9f149/arm64/defconfig/gcc-10/lab-kontron/baseline-kontr=
on-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
b70e54dccbf10d81a39c1a
        failing since 19 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-06-25T13:31:50.275941  /lava-131519/1/../bin/lava-test-case
    2022-06-25T13:31:50.320526  <8>[   16.484878] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2022-06-25T13:31:50.320875  /lava-131519/1/../bin/lava-test-case
    2022-06-25T13:31:50.321084  <8>[   16.498098] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2022-06-25T13:31:50.321286  /lava-131519/1/../bin/lava-test-case
    2022-06-25T13:31:50.321480  <8>[   16.510684] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2022-06-25T13:31:50.321675  /lava-131519/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/62b70eb822284cf319a39c16

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-38-g15288cf9f149/arm64/defconfig/gcc-10/lab-kontron/baseline-kontr=
on-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-38-g15288cf9f149/arm64/defconfig/gcc-10/lab-kontron/baseline-kontr=
on-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b70eb822284cf319a39=
c17
        new failure (last pass: v5.19-rc1-35-g412b193d93912) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =


  Details:     https://kernelci.org/test/plan/id/62b710f353f88bcee6a39bdd

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-38-g15288cf9f149/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-38-g15288cf9f149/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62b710f353f88bcee6a39bff
        failing since 81 days (last pass: v5.17-rc1-10-g0ef49b25b7cc, first=
 fail: v5.18-rc1-1-gbf84b10d9901d)

    2022-06-25T13:42:51.609042  /lava-6683736/1/../bin/lava-test-case
    2022-06-25T13:42:51.620216  <8>[   55.046386] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/62b710f353f88bcee6a39c22
        failing since 19 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-06-25T13:42:49.986939  /lava-6683736/1/../bin/lava-test-case
    2022-06-25T13:42:50.000704  <8>[   53.424454] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62b710f353f88bcee6a39c23
        failing since 19 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-06-25T13:42:48.968801  /lava-6683736/1/../bin/lava-test-case
    2022-06-25T13:42:48.981390  <8>[   52.405096] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/62b710f353f88bcee6a39c24
        failing since 19 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-06-25T13:42:47.950276  /lava-6683736/1/../bin/lava-test-case
    2022-06-25T13:42:47.965321  <8>[   51.386987] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/62b70e9f22284cf319a39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-38-g15288cf9f149/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun5=
0i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-38-g15288cf9f149/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun5=
0i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b70e9f22284cf319a39=
bd0
        new failure (last pass: v5.18-rc1-11-g6c942e3f424f) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/62b70f54aab15c6724a39bf2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-38-g15288cf9f149/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseli=
ne-sun8i-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-38-g15288cf9f149/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseli=
ne-sun8i-h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b70f54aab15c6724a39=
bf3
        new failure (last pass: v5.19-rc1-35-g412b193d93912) =

 =20
