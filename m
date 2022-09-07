Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E842F42
	for <chrome-platform@lists.linux.dev>; Wed,  7 Sep 2022 19:47:58 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id h188so14544040pgc.12
        for <chrome-platform@lists.linux.dev>; Wed, 07 Sep 2022 12:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=ervzw9BQ8VM4er5r5vxUajf62kP7y7OiZ+4wz+1bR9M=;
        b=Bcr9aJzDv2/qChwfRM/07dHY0f6WypxwSEz5aTcqBPcr8oIQCvNwadl2tcsiZbGxaQ
         cnHNk8z6HDSrzUyR4SN+WvhvuJL4BWP+VAGvNtklcB1boAExp7IhJzDwecdCoQ3jyWnf
         KML5svoMCKxoik6jiddtqul0bbNhY+k0/b2Eq15w6OWC7x1fXN3G4m5WKBBD6KhqugCz
         jX9vTv9L+7ZPpBPDFcybqYDeb2dWAr1MRIfgwE/G4DI2ULamIk2kLJ54KMXORGSCFoVP
         7rMEIWTG9uuho4K4hevEhs9CP5CccCxy9pCwJMj8cf6LzNiQDZfx7glxcHLkzGChM4XP
         E0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=ervzw9BQ8VM4er5r5vxUajf62kP7y7OiZ+4wz+1bR9M=;
        b=a9HwX2YGRgOaK9bCgirbn5PPxBc9/wGGqEog8DrLc82s7FwVnRbOMu2INkshmTqRmV
         EqsOT0RKZf+xV+HBlLBRfIphJVJGkn8rsP1K7clEpbmzSUESDGnZyfSJwVeY4x/Ed5SK
         xqarcssjJVTMEswxO6Cs/Kk4I6uwW8UTF/IxUJiqXLhV9D7G5XHBWqAD6G4xHDHIC3VV
         fvucEnfgdXFnSmRxFECDqvBVf35mxxd4tljqnhQrZ1hmpDyN/eFVUJ8U9Zp4u1KA1Iuz
         QPC5YflvQjf5NuMbl0VU+/ZglnT6TbujTN/V31PSdiMzMuMW2KxKbdVSzYoH7BmZnSxX
         cJNw==
X-Gm-Message-State: ACgBeo0rjPKbW+imrDkmbyOrG7uWp95cVTCcpOTaGltTais08qYIwIw7
	DsEnEycRBvYvj8BtIgb1oD3Ggw==
X-Google-Smtp-Source: AA6agR5T4vBultPzgsZ5ENighcPj54hjmZSdqvqB/5bsf6v+MiIhfrx8C1LAcxNWtUn91SH8YYNk/g==
X-Received: by 2002:a63:c055:0:b0:434:a799:470e with SMTP id z21-20020a63c055000000b00434a799470emr4650395pgi.49.1662580077820;
        Wed, 07 Sep 2022 12:47:57 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a206-20020a621ad7000000b00537d74f58cbsm4306694pfa.69.2022.09.07.12.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 12:47:57 -0700 (PDT)
Message-ID: <6318f56d.620a0220.a5ef3.6eb7@mx.google.com>
Date: Wed, 07 Sep 2022 12:47:57 -0700 (PDT)
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
X-Kernelci-Kernel: v6.0-rc1-19-gd378c6f0456c
Subject: chrome-platform/for-kernelci baseline: 108 runs,
 9 regressions (v6.0-rc1-19-gd378c6f0456c)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 108 runs, 9 regressions (v6.0-rc1-19=
-gd378c6f0456c)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
kontron-bl-imx8mm            | arm64 | lab-kontron   | gcc-10   | defconfig=
                  | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
                  | 2          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
                  | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.0-rc1-19-gd378c6f0456c/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.0-rc1-19-gd378c6f0456c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      d378c6f0456c101563fdac68c11e64c3a00ad3c2 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
kontron-bl-imx8mm            | arm64 | lab-kontron   | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/6318ed1572a113ca00355655

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-19-gd378c6f0456c/arm64/defconfig/gcc-10/lab-kontron/baseline-kontro=
n-bl-imx8mm.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-19-gd378c6f0456c/arm64/defconfig/gcc-10/lab-kontron/baseline-kontro=
n-bl-imx8mm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6318ed1572a113ca00355=
656
        new failure (last pass: v6.0-rc1-18-gf36a064d1483) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
                  | 2          =


  Details:     https://kernelci.org/test/plan/id/6318ebe918227a652635564d

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-19-gd378c6f0456c/arm64/defconfig/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-19-gd378c6f0456c/arm64/defconfig/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/6318ebe918227a652635565f
        failing since 15 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-09-07T19:07:14.496501  /lava-165209/1/../bin/lava-test-case
    2022-09-07T19:07:14.496881  <8>[   19.311781] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/631=
8ebe918227a6526355661
        failing since 15 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-09-07T19:07:15.533947  /lava-165209/1/../bin/lava-test-case
    2022-09-07T19:07:15.534324  <8>[   20.355937] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-09-07T19:07:15.534564  /lava-165209/1/../bin/lava-test-case
    2022-09-07T19:07:15.534789  <8>[   20.375832] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>
    2022-09-07T19:07:15.535134  /lava-165209/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6318ec30fa8b8738fa355645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-19-gd378c6f0456c/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-19-gd378c6f0456c/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6318ec30fa8b8738fa355=
646
        failing since 6 days (last pass: tag-chrome-platform-for-v5.20-2-gd=
dffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/6318f52176ddd264ca355644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-19-gd378c6f0456c/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a77=
950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-19-gd378c6f0456c/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a77=
950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6318f52176ddd264ca355=
645
        failing since 6 days (last pass: v6.0-rc1-11-g48a86d3e4836, first f=
ail: v6.0-rc1-18-gf36a064d1483) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =


  Details:     https://kernelci.org/test/plan/id/6318eb566af819c1cd355661

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-19-gd378c6f0456c/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-19-gd378c6f0456c/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/6318eb566af819c1cd355687
        failing since 155 days (last pass: v5.17-rc1-10-g0ef49b25b7cc, firs=
t fail: v5.18-rc1-1-gbf84b10d9901d)

    2022-09-07T19:04:42.293130  /lava-7207016/1/../bin/lava-test-case
    2022-09-07T19:04:42.303153  <8>[   41.230417] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/6318eb566af819c1cd3556aa
        failing since 93 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-09-07T19:04:40.089901  /lava-7207016/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/6318eb566af819c1cd3556ab
        failing since 93 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-09-07T19:04:39.053692  /lava-7207016/1/../bin/lava-test-case
    2022-09-07T19:04:39.064081  <8>[   37.990437] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/6318eb566af819c1cd3556ac
        failing since 93 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-09-07T19:04:37.061380  <4>[   35.987515] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-09-07T19:04:38.009816  /lava-7207016/1/../bin/lava-test-case
    2022-09-07T19:04:38.021156  <8>[   36.946994] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =20
