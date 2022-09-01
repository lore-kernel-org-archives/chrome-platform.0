Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963417E7
	for <chrome-platform@lists.linux.dev>; Thu,  1 Sep 2022 06:39:48 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id x23so16216834pll.7
        for <chrome-platform@lists.linux.dev>; Wed, 31 Aug 2022 23:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=u712tltvhPbL/UT4Scc/G2L3KrSQ7agXXBQLS7l8Q48=;
        b=3vyCLymffTrYLrhIGbVxJek8GjDj1tICYno1gqbyuAKfkDhjL/fIruLihkmKunDZWF
         RzB/9R+sSmVrUNkmEBtBQNjrZ3goRWfFvE17LqFucD0ZFEFi5wqXbw3O8gAZzjc0NLxT
         Y/5cMJmZE5SnuI0vuaHZ9tLTfkwGt2r76dTxZFSVV8JgZKFT31AHLd3m/7aGO68J61Lp
         vsZALCsLWa8cXVZBdsKAWfw1/K3tq/SbxOAUgYBGKO2I9ZiN1o096BBp/UQGj/Cju+X7
         3K/ZauaQIPSx2z79qi3IHXrc7XdXAa3g7gVGAiOKwt6X8PoQqE4Fpv/1e32okb6PCeNM
         M9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=u712tltvhPbL/UT4Scc/G2L3KrSQ7agXXBQLS7l8Q48=;
        b=x3kT7blYKaqTeiCjOkoE+2JidFHajXsB6LIeE5xB6Q1IY9y8+DT8yq4YMise2+4E+U
         nLAIUnV5Cox7BFb18NXW5XSpFzyFB2qXIKYLrRHGhGTG/iGmOKe4iVNuFgYbP67ZyCw4
         NSaqrEhXeYPY9a6iIIp+zudfvZ9n4bLt6rDqyonUi80sDm3wASrryRYeiVhBlS8DkLV2
         5Bsk6m4oXuLfwCDA6VEE+41JSq6BOXPiiFAy0Nqaz96pNYinhCvhfJ+U1mINBYCjpBLw
         WDh7QY/RlanvrG+kZ21yjtssEz4Vc4mNowsBAfiTQiSwZIybHZcVjG/D6yysDk00Pmah
         1fcA==
X-Gm-Message-State: ACgBeo0p4Wp4omIrpvBzRF7MIFHd92yQCpEdUjnP+nOsr546j/QReU/s
	tJGDlk+UtkkE27a7h+Y6SaZmvw==
X-Google-Smtp-Source: AA6agR7cDKeOP69FfBQ+7TTB7LDD4beuoTdggUyqRt0FkkA4joGkznUEhflRTTLbYhLbQe06fWMYtg==
X-Received: by 2002:a17:902:db07:b0:175:42e2:37f2 with SMTP id m7-20020a170902db0700b0017542e237f2mr6507905plx.13.1662014388000;
        Wed, 31 Aug 2022 23:39:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x13-20020a17090a1f8d00b001f510175984sm2460485pja.41.2022.08.31.23.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 23:39:47 -0700 (PDT)
Message-ID: <631053b3.170a0220.5e60d.5501@mx.google.com>
Date: Wed, 31 Aug 2022 23:39:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.0-rc1-18-gf36a064d1483
Subject: chrome-platform/for-kernelci baseline: 113 runs,
 12 regressions (v6.0-rc1-18-gf36a064d1483)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 113 runs, 12 regressions (v6.0-rc1-1=
8-gf36a064d1483)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig         | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
                  | 2          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
                  | 2          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig         | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
                  | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.0-rc1-18-gf36a064d1483/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.0-rc1-18-gf36a064d1483
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      f36a064d1483ddc1fe9faef38d370b68e632654e =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/63104a7fd78597406b355672

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-18-gf36a064d1483/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baselin=
e-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-18-gf36a064d1483/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baselin=
e-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63104a7fd78597406b355=
673
        failing since 87 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
                  | 2          =


  Details:     https://kernelci.org/test/plan/id/63104973209636b4bd35567a

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-18-gf36a064d1483/arm64/defconfig/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-18-gf36a064d1483/arm64/defconfig/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/63104973209636b4bd35568c
        failing since 9 days (last pass: tag-chrome-platform-for-v5.20-2-gd=
dffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-09-01T05:55:37.082792  /lava-162430/1/../bin/lava-test-case
    2022-09-01T05:55:37.083201  <8>[   19.319785] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-09-01T05:55:37.083451  /lava-162430/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/631=
04973209636b4bd35568e
        failing since 9 days (last pass: tag-chrome-platform-for-v5.20-2-gd=
dffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-09-01T05:55:38.120268  /lava-162430/1/../bin/lava-test-case
    2022-09-01T05:55:38.120662  <8>[   20.364059] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-09-01T05:55:38.120928  /lava-162430/1/../bin/lava-test-case
    2022-09-01T05:55:38.121162  <8>[   20.384027] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
                  | 2          =


  Details:     https://kernelci.org/test/plan/id/631048c2bd8045a1ff355655

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-18-gf36a064d1483/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson=
-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-18-gf36a064d1483/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson=
-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/631048c2bd8045a=
1ff355658
        new failure (last pass: v6.0-rc1-11-g48a86d3e4836)
        2 lines

    2022-09-01T05:52:55.795766  kern  :alert : Data abort info:
    2022-09-01T05:52:55.834777  kern  :alert :   ISV =3D 0, ISS <8>[   19.6=
22491] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlin=
es MEASUREMENT=3D2>
    2022-09-01T05:52:55.835060  =3D 0x00000006
    2022-09-01T05:52:55.835346  kern<8>[   19.630890] <LAVA_SIGNAL_ENDRUN 0=
_dmesg 2441162_1.5.2.4.1>
    2022-09-01T05:52:55.835586    :alert :   CM =3D 0, WnR =3D 0
    2022-09-01T05:52:55.835814  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000bd41d000
    2022-09-01T05:52:55.836081  kern  :alert : [0000000000000928] pgd=3D080=
00000bd41e003, p4d=3D08000000bd41e003, pud=3D08000000bd41b003, pmd=3D000000=
0000000000   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/631048c2bd8045a=
1ff355659
        new failure (last pass: v6.0-rc1-11-g48a86d3e4836)
        12 lines

    2022-09-01T05:52:55.791754  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000928
    2022-09-01T05:52:55.792295  kern  :alert : Mem abort inf<8>[   19.58863=
7] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines M=
EASUREMENT=3D12>
    2022-09-01T05:52:55.792556  o:
    2022-09-01T05:52:55.792797  kern  :alert :   ESR =3D 0x0000000096000006
    2022-09-01T05:52:55.793031  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-09-01T05:52:55.793303  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-09-01T05:52:55.793538  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-09-01T05:52:55.793782  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63104985349750d7cf35566c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-18-gf36a064d1483/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-18-gf36a064d1483/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63104985349750d7cf355=
66d
        new failure (last pass: tag-chrome-platform-for-v5.20-2-gddffaa3d76=
750) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/63104ad0c4ee661b9935567d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-18-gf36a064d1483/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baselin=
e-panda.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-18-gf36a064d1483/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baselin=
e-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63104ad0c4ee661b99355=
67e
        failing since 8 days (last pass: tag-chrome-platform-for-v5.20-2-gd=
dffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/631049bdc6be9d987b355653

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-18-gf36a064d1483/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a77=
950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-18-gf36a064d1483/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a77=
950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/631049bdc6be9d987b355=
654
        new failure (last pass: v6.0-rc1-11-g48a86d3e4836) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =


  Details:     https://kernelci.org/test/plan/id/63104bcbcf4d22fde93557a7

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-18-gf36a064d1483/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-18-gf36a064d1483/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/63104bcbcf4d22fde93557cd
        failing since 148 days (last pass: v5.17-rc1-10-g0ef49b25b7cc, firs=
t fail: v5.18-rc1-1-gbf84b10d9901d)

    2022-09-01T06:05:53.021825  /lava-7157901/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/63104bcbcf4d22fde93557f0
        failing since 87 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-09-01T06:05:50.809313  /lava-7157901/1/../bin/lava-test-case
    2022-09-01T06:05:50.818855  <8>[   34.548393] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/63104bcbcf4d22fde93557f1
        failing since 87 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-09-01T06:05:48.742437  <8>[   32.471583] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>
    2022-09-01T06:05:49.766707  /lava-7157901/1/../bin/lava-test-case
    2022-09-01T06:05:49.779244  <8>[   33.508684] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/63104bcbcf4d22fde93557f2
        failing since 87 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-09-01T06:05:47.684323  <8>[   31.412698] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dpass>
    2022-09-01T06:05:48.733354  /lava-7157901/1/../bin/lava-test-case   =

 =20
