Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8975423A0
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 05:44:53 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id o6-20020a17090a0a0600b001e2c6566046so17006496pjo.0
        for <chrome-platform@lists.linux.dev>; Sun, 05 Jun 2022 22:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ZA9VXZ7PJ26kq+78bytgG4qp/VMDn1z8VNwKkdoFfiE=;
        b=dP53OkDAftko69RZFvoTSQEmibx0EOHMtOajy5Zs/RT1fD+aTDcpM7SNo+oxQcJKaR
         E2NJg8zp2zRhu77RGBPnpplMvkzndKajv2Fnd6pD7FgCQB9Sub3Boo4Nlc6b2Vr2Kkhh
         8+Ye+ja/kckXkwM+J0NAOtDopdYr+AgkLnBF3otCKjWOPIdNNdG9Y26iZ6p3SUQ2YBtC
         Px2KGOLOiNk+c+KAAireyELlHp0m+3qBc+T0o4bQia2PhLd59Qm5ZL67VCGJ8AipMliW
         LQkxwctuGn3jvtaij7GGSIQo62D+jVPbHqzWQA46h+OVFqotNe2KPO4b2ENGkNjYa/nR
         cv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ZA9VXZ7PJ26kq+78bytgG4qp/VMDn1z8VNwKkdoFfiE=;
        b=DdcAhk/2Cx6eBM/IO9HPbdRa7ZTQPgkh/w83KTnX1vHBjSKiSe6xEwz6RfGrb7ev2h
         nfY/LnN72qwy6O6oMHKnvBGLQYJ7v+UEZN1U+gRpIzBiqa6MFNdr8gG1mgSK5Ik4n4i2
         AQcPsk+/Qn+J8wz+UywwyzXF0zTN1gSx2N3kt8nUFodpj0yQfI5fBDfamBhKSrHpHBfl
         3WhGgeVLUVeuhXe+3Lia3NVs99DbocpdsIGXXWkpXC7qtET2L5/bJrrcwUK89YQzZ7hM
         7ePK+EwMu8ElL6GR9oznFdqYfk8vlF1W/euiTPuOdYDysA+MqcIkGtUGbQNnio+6jUGS
         OpXw==
X-Gm-Message-State: AOAM531vOUq8UV3ATjTFpuBQIqurTAZyYiJhI0mFS+T0bC+EjqNVlZtc
	slZCesB+csn5mWRtP+nhzHh8DA==
X-Google-Smtp-Source: ABdhPJwALHwSDcz08ioq7vW112EacSBJFvcZ6IL9sdIbzZkO41Vd1wV3/C+wSnYY4CbFtSR05G1dZg==
X-Received: by 2002:a17:903:3296:b0:164:13db:509 with SMTP id jh22-20020a170903329600b0016413db0509mr22565024plb.128.1654494292981;
        Sun, 05 Jun 2022 22:44:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id gd20-20020a17090b0fd400b001d954837197sm11700231pjb.22.2022.06.05.22.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 22:44:52 -0700 (PDT)
Message-ID: <629d9454.1c69fb81.ebd56.c039@mx.google.com>
Date: Sun, 05 Jun 2022 22:44:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc1-6-gc1db0861e8d02
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci baseline: 87 runs,
 10 regressions (v5.19-rc1-6-gc1db0861e8d02)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 87 runs, 10 regressions (v5.19-rc1-6=
-gc1db0861e8d02)

Regressions Summary
-------------------

platform                    | arch  | lab           | compiler | defconfig =
                 | regressions
----------------------------+-------+---------------+----------+-----------=
-----------------+------------
jetson-tk1                  | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig         | 1          =

kontron-kbox-a-230-ls       | arm64 | lab-kontron   | gcc-10   | defconfig =
                 | 1          =

mt8173-elm-hana             | arm64 | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook | 1          =

r8a77950-salvator-x         | arm64 | lab-baylibre  | gcc-10   | defconfig =
                 | 1          =

rk3399-gru-kevin            | arm64 | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook | 4          =

sun8i-h2-plus-orangepi-zero | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig         | 1          =

tegra124-nyan-big           | arm   | lab-collabora | gcc-10   | multi_v7_d=
efconfig         | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.19-rc1-6-gc1db0861e8d02/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.19-rc1-6-gc1db0861e8d02
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      c1db0861e8d025ee5b2e0a83f6691aa9098f2f18 =



Test Regressions
---------------- =



platform                    | arch  | lab           | compiler | defconfig =
                 | regressions
----------------------------+-------+---------------+----------+-----------=
-----------------+------------
jetson-tk1                  | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/629d8cdc865aec3ba6a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-6-gc1db0861e8d02/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseli=
ne-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-6-gc1db0861e8d02/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseli=
ne-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d8cdc865aec3ba6a39=
bce
        failing since 0 day (last pass: v5.18-rc1-24-gc2d7e384924d, first f=
ail: v5.19-rc1-5-g4a0e708bb23fc) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                 | regressions
----------------------------+-------+---------------+----------+-----------=
-----------------+------------
kontron-kbox-a-230-ls       | arm64 | lab-kontron   | gcc-10   | defconfig =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/629d890033eaf660c9a39bf1

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-6-gc1db0861e8d02/arm64/defconfig/gcc-10/lab-kontron/baseline-kontr=
on-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-6-gc1db0861e8d02/arm64/defconfig/gcc-10/lab-kontron/baseline-kontr=
on-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
9d890033eaf660c9a39bfa
        failing since 0 day (last pass: v5.18-rc1-24-gc2d7e384924d, first f=
ail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-06-06T04:56:09.553228  /lava-124778/1/../bin/lava-test-case
    2022-06-06T04:56:09.597302  <8>[   15.145165] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2022-06-06T04:56:09.597569  /lava-124778/1/../bin/lava-test-case
    2022-06-06T04:56:09.597716  <8>[   15.158049] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2022-06-06T04:56:09.597857  /lava-124778/1/../bin/lava-test-case
    2022-06-06T04:56:09.597995  <8>[   15.170632] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2022-06-06T04:56:09.598132  /lava-124778/1/../bin/lava-test-case   =

 =



platform                    | arch  | lab           | compiler | defconfig =
                 | regressions
----------------------------+-------+---------------+----------+-----------=
-----------------+------------
mt8173-elm-hana             | arm64 | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/629d89cbe2bd72d806a39bda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-6-gc1db0861e8d02/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-6-gc1db0861e8d02/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d89cbe2bd72d806a39=
bdb
        failing since 0 day (last pass: v5.18-rc1-24-gc2d7e384924d, first f=
ail: v5.19-rc1-5-g4a0e708bb23fc) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                 | regressions
----------------------------+-------+---------------+----------+-----------=
-----------------+------------
r8a77950-salvator-x         | arm64 | lab-baylibre  | gcc-10   | defconfig =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/629d89e294fec5b67ea39be0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-6-gc1db0861e8d02/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a7=
7950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-6-gc1db0861e8d02/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a7=
7950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d89e294fec5b67ea39=
be1
        new failure (last pass: v5.19-rc1-5-g4a0e708bb23fc) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                 | regressions
----------------------------+-------+---------------+----------+-----------=
-----------------+------------
rk3399-gru-kevin            | arm64 | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook | 4          =


  Details:     https://kernelci.org/test/plan/id/629d891aff112ba2a7a39bd2

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-6-gc1db0861e8d02/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-6-gc1db0861e8d02/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/629d891aff112ba2a7a39bf4
        failing since 61 days (last pass: v5.17-rc1-10-g0ef49b25b7cc, first=
 fail: v5.18-rc1-1-gbf84b10d9901d)

    2022-06-06T04:56:48.128309  <8>[   56.207907] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-06-06T04:56:49.130555  /lava-6549340/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/629d891aff112ba2a7a39c17
        failing since 0 day (last pass: v5.18-rc1-24-gc2d7e384924d, first f=
ail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-06-06T04:56:47.514709  /lava-6549340/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/629d891aff112ba2a7a39c18
        failing since 0 day (last pass: v5.18-rc1-24-gc2d7e384924d, first f=
ail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-06-06T04:56:46.496516  /lava-6549340/1/../bin/lava-test-case
    2022-06-06T04:56:46.511833  <8>[   54.589815] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/629d891aff112ba2a7a39c19
        failing since 0 day (last pass: v5.18-rc1-24-gc2d7e384924d, first f=
ail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-06-06T04:56:44.664378  <4>[   52.741776] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-06-06T04:56:45.478771  /lava-6549340/1/../bin/lava-test-case
    2022-06-06T04:56:45.492001  <8>[   53.572174] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =



platform                    | arch  | lab           | compiler | defconfig =
                 | regressions
----------------------------+-------+---------------+----------+-----------=
-----------------+------------
sun8i-h2-plus-orangepi-zero | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/629d8b8bef9149b53ca39bee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-6-gc1db0861e8d02/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseli=
ne-sun8i-h2-plus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-6-gc1db0861e8d02/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseli=
ne-sun8i-h2-plus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d8b8bef9149b53ca39=
bef
        new failure (last pass: v5.19-rc1-5-g4a0e708bb23fc) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                 | regressions
----------------------------+-------+---------------+----------+-----------=
-----------------+------------
tegra124-nyan-big           | arm   | lab-collabora | gcc-10   | multi_v7_d=
efconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/629d8fc8d60fdbfaf4a39bde

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-6-gc1db0861e8d02/arm/multi_v7_defconfig/gcc-10/lab-collabora/basel=
ine-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-6-gc1db0861e8d02/arm/multi_v7_defconfig/gcc-10/lab-collabora/basel=
ine-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d8fc8d60fdbfaf4a39=
bdf
        failing since 0 day (last pass: v5.18-rc1-24-gc2d7e384924d, first f=
ail: v5.19-rc1-5-g4a0e708bb23fc) =

 =20
