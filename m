Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899DC1B7D
	for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 22:43:19 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id y18so414270plb.11
        for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 14:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5r3NschO3Mz47U8rEUVUkcDWkTp8t8B8OsADxosibgM=;
        b=gmyfs1b7cWLPivoFRZyrV1awVc4IdqnslqkfGUm9sTOp3xVI4Zv2qAmh4v6WuxEXC4
         cEFVMWTyjzkKm/8h8ZC8pw3rVutaDRXxVpkfG3jTm+tAT1C4F9oUf1UKaUnIYb6sk3Af
         eP7W7UVMln1qb2M518mTVPbysnd2/elxlYsYWjRgkabcK4tkWf+UPPEM+zz5reDGZBox
         c0Rf8AYxHsHVs0kViOnpWcLNbGtbWc+U1t45QZd+zdF7i4WfBoRSY1yern02EdIIqA7F
         IPs1T7D3CTMZOQVmbjkp9WnQuuFDtJ6NVMV23qij8/GysOR2Xo9BfptBaAomNeCsJneU
         SJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5r3NschO3Mz47U8rEUVUkcDWkTp8t8B8OsADxosibgM=;
        b=H3xbRapm/phsvuBa/WgtMvQ3bVaJDo2MJo+HrSGuYJttCwv/+OhXNjlY/tQF4rhNX3
         sl1ZkTqob53YMVeIgXa0M7LRn6+W6FuchCL97NikoxgTu54qyPxV/yQaX6idFS6XG0om
         d3q4tY7y4KKYJY17RKP9acStCTsgVoUKLdugV590SNWAyJw0kTwlbKdOFCYh5CKSVxv4
         a+J9coptcZcuYca51zcb/n+ru/gMX8hhTPMJ4rKpmhl1xRQaGx3ucfxTPowLIQ9cywim
         BMDhneV2OouwKupSZHUeuaKGlpYdnPXlJYAY8wjakPqFaknsaDVl1zT5uBNanZO68lqJ
         958w==
X-Gm-Message-State: AOAM531yjP8AIR5siKdFIlbaiboHm/mUkZ5l6YTQwBjRLsWZ9CIZXBEq
	3P2G8hcUg+DbQctxVrySEZRaSA==
X-Google-Smtp-Source: ABdhPJzBtGvlHRN6dT0uRh4/M9vkLGVrorZ2KvTHGmbbTg+6wqisz1FC/MEKoMWDKw6ArGAWVb2EQw==
X-Received: by 2002:a17:90b:3149:: with SMTP id ip9mr1193001pjb.150.1644964998881;
        Tue, 15 Feb 2022 14:43:18 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j2sm40983219pfc.209.2022.02.15.14.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 14:43:18 -0800 (PST)
Message-ID: <620c2c86.1c69fb81.5247f.5a5f@mx.google.com>
Date: Tue, 15 Feb 2022 14:43:18 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Kernel: v5.17-rc1-8-g981d3de32cfb
Subject: chrome-platform/for-kernelci baseline: 79 runs,
 22 regressions (v5.17-rc1-8-g981d3de32cfb)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 79 runs, 22 regressions (v5.17-rc1-8=
-g981d3de32cfb)

Regressions Summary
-------------------

platform                   | arch  | lab          | compiler | defconfig   =
               | regressions
---------------------------+-------+--------------+----------+-------------=
---------------+------------
imx8mn-ddr4-evk            | arm64 | lab-baylibre | gcc-10   | defconfig   =
               | 2          =

kontron-kbox-a-230-ls      | arm64 | lab-kontron  | gcc-10   | defconfig   =
               | 2          =

kontron-sl28-var3-ads2     | arm64 | lab-kontron  | gcc-10   | defconfig   =
               | 2          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre | gcc-10   | defconfig   =
               | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre | gcc-10   | defconfig+ar=
m64-chromebook | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie  | gcc-10   | defconfig   =
               | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie  | gcc-10   | defconfig+ar=
m64-chromebook | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre | gcc-10   | defconfig   =
               | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre | gcc-10   | defconfig+ar=
m64-chromebook | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-10   | defconfig   =
               | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-10   | defconfig+ar=
m64-chromebook | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre | gcc-10   | defconfig   =
               | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre | gcc-10   | defconfig+ar=
m64-chromebook | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie  | gcc-10   | defconfig   =
               | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie  | gcc-10   | defconfig+ar=
m64-chromebook | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre | gcc-10   | defconfig   =
               | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre | gcc-10   | defconfig+ar=
m64-chromebook | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie  | gcc-10   | defconfig   =
               | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie  | gcc-10   | defconfig+ar=
m64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.17-rc1-8-g981d3de32cfb/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.17-rc1-8-g981d3de32cfb
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      981d3de32cfb74afd48d44805b8f5943a1723aa0 =



Test Regressions
---------------- =



platform                   | arch  | lab          | compiler | defconfig   =
               | regressions
---------------------------+-------+--------------+----------+-------------=
---------------+------------
imx8mn-ddr4-evk            | arm64 | lab-baylibre | gcc-10   | defconfig   =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/620c22efca311ec6fcc62969

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8m=
n-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8m=
n-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/620c22efca311ec=
6fcc6296d
        new failure (last pass: v5.15-rc1-22-g92af99fcc4df)
        12 lines

    2022-02-15T22:01:52.737028  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   10.962496] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2022-02-15T22:01:52.738502  0000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/620c22efca311ec=
6fcc6296e
        new failure (last pass: v5.15-rc1-22-g92af99fcc4df)
        2 lines

    2022-02-15T22:01:52.744413  kern  :alert : Mem abort info:
    2022-02-15T22:01:52.745612  kern  :alert :   ESR =3D 0x96000006
    2022-02-15T22:01:52.746938  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-02-15T22:01:52.748067  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-02-15T22:01:52.749273  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-02-15T22:01:52.750557  kern  :alert :<8>[   10.990899] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2=
>   =

 =



platform                   | arch  | lab          | compiler | defconfig   =
               | regressions
---------------------------+-------+--------------+----------+-------------=
---------------+------------
kontron-kbox-a-230-ls      | arm64 | lab-kontron  | gcc-10   | defconfig   =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/620c220f1fdcfd70e1c62982

  Results:     91 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig/gcc-10/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig/gcc-10/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/620c220f1fdcfd70e1c629c8
        failing since 18 days (last pass: v5.16-rc1-1-g22da27bb6da5, first =
fail: v5.17-rc1-2-g09824a28f604d)

    2022-02-15T21:58:16.981566  /lava-89188/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/620=
c220f1fdcfd70e1c629c9
        failing since 18 days (last pass: v5.16-rc1-1-g22da27bb6da5, first =
fail: v5.17-rc1-2-g09824a28f604d)

    2022-02-15T21:58:16.984752  <8>[   16.999121] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-02-15T21:58:18.034194  /lava-89188/1/../bin/lava-test-case
    2022-02-15T21:58:18.034593  <8>[   18.018273] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-02-15T21:58:18.034836  /lava-89188/1/../bin/lava-test-case
    2022-02-15T21:58:18.035066  <8>[   18.034187] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform                   | arch  | lab          | compiler | defconfig   =
               | regressions
---------------------------+-------+--------------+----------+-------------=
---------------+------------
kontron-sl28-var3-ads2     | arm64 | lab-kontron  | gcc-10   | defconfig   =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/620c22889fda39bd3ac62982

  Results:     99 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig/gcc-10/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig/gcc-10/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/620c22899fda39bd3ac629cf
        failing since 18 days (last pass: v5.15-rc1-22-g92af99fcc4df, first=
 fail: v5.17-rc1-2-g09824a28f604d)

    2022-02-15T22:00:20.133265  /lava-89192/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/620=
c22899fda39bd3ac629d0
        failing since 18 days (last pass: v5.15-rc1-22-g92af99fcc4df, first=
 fail: v5.17-rc1-2-g09824a28f604d)

    2022-02-15T22:00:20.136743  <8>[   13.505213] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-02-15T22:00:21.184049  /lava-89192/1/../bin/lava-test-case
    2022-02-15T22:00:21.184476  <8>[   14.524275] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform                   | arch  | lab          | compiler | defconfig   =
               | regressions
---------------------------+-------+--------------+----------+-------------=
---------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre | gcc-10   | defconfig   =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/620c21e1f318c03e0cc62990

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620c21e1f318c03e0cc62=
991
        new failure (last pass: v5.17-rc1-4-g5c223bb92642) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
               | regressions
---------------------------+-------+--------------+----------+-------------=
---------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre | gcc-10   | defconfig+ar=
m64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/620c226a9fda39bd3ac62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig+arm64-chromebook/gcc-10/lab-baylib=
re/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig+arm64-chromebook/gcc-10/lab-baylib=
re/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620c226a9fda39bd3ac62=
969
        new failure (last pass: v5.17-rc1-4-g5c223bb92642) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
               | regressions
---------------------------+-------+--------------+----------+-------------=
---------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie  | gcc-10   | defconfig   =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/620c21d6137ac0bb77c62981

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620c21d6137ac0bb77c62=
982
        new failure (last pass: v5.17-rc1-4-g5c223bb92642) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
               | regressions
---------------------------+-------+--------------+----------+-------------=
---------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie  | gcc-10   | defconfig+ar=
m64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/620c22759312544204c629ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig+arm64-chromebook/gcc-10/lab-brooni=
e/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig+arm64-chromebook/gcc-10/lab-brooni=
e/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620c22759312544204c62=
9bb
        new failure (last pass: v5.17-rc1-4-g5c223bb92642) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
               | regressions
---------------------------+-------+--------------+----------+-------------=
---------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre | gcc-10   | defconfig   =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/620c21e00329057281c62974

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620c21e00329057281c62=
975
        new failure (last pass: v5.17-rc1-4-g5c223bb92642) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
               | regressions
---------------------------+-------+--------------+----------+-------------=
---------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre | gcc-10   | defconfig+ar=
m64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/620c22312bd91885c5c62991

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig+arm64-chromebook/gcc-10/lab-baylib=
re/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig+arm64-chromebook/gcc-10/lab-baylib=
re/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620c22312bd91885c5c62=
992
        new failure (last pass: v5.17-rc1-4-g5c223bb92642) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
               | regressions
---------------------------+-------+--------------+----------+-------------=
---------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-10   | defconfig   =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/620c21ebb53f2f3bc7c62976

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620c21ebb53f2f3bc7c62=
977
        new failure (last pass: v5.17-rc1-4-g5c223bb92642) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
               | regressions
---------------------------+-------+--------------+----------+-------------=
---------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-10   | defconfig+ar=
m64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/620c22131fdcfd70e1c629eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig+arm64-chromebook/gcc-10/lab-brooni=
e/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig+arm64-chromebook/gcc-10/lab-brooni=
e/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620c22131fdcfd70e1c62=
9ec
        new failure (last pass: v5.17-rc1-4-g5c223bb92642) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
               | regressions
---------------------------+-------+--------------+----------+-------------=
---------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre | gcc-10   | defconfig   =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/620c21e20329057281c6297a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620c21e20329057281c62=
97b
        new failure (last pass: v5.17-rc1-4-g5c223bb92642) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
               | regressions
---------------------------+-------+--------------+----------+-------------=
---------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre | gcc-10   | defconfig+ar=
m64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/620c22324bebc6f4b4c62981

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig+arm64-chromebook/gcc-10/lab-baylib=
re/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig+arm64-chromebook/gcc-10/lab-baylib=
re/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620c22324bebc6f4b4c62=
982
        new failure (last pass: v5.17-rc1-4-g5c223bb92642) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
               | regressions
---------------------------+-------+--------------+----------+-------------=
---------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie  | gcc-10   | defconfig   =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/620c21d7f318c03e0cc62982

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620c21d7f318c03e0cc62=
983
        new failure (last pass: v5.17-rc1-4-g5c223bb92642) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
               | regressions
---------------------------+-------+--------------+----------+-------------=
---------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie  | gcc-10   | defconfig+ar=
m64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/620c224e9312544204c62973

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig+arm64-chromebook/gcc-10/lab-brooni=
e/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig+arm64-chromebook/gcc-10/lab-brooni=
e/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620c224e9312544204c62=
974
        new failure (last pass: v5.17-rc1-4-g5c223bb92642) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
               | regressions
---------------------------+-------+--------------+----------+-------------=
---------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre | gcc-10   | defconfig   =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/620c21def318c03e0cc62988

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620c21def318c03e0cc62=
989
        new failure (last pass: v5.17-rc1-4-g5c223bb92642) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
               | regressions
---------------------------+-------+--------------+----------+-------------=
---------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre | gcc-10   | defconfig+ar=
m64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/620c2230f2a69e4104c6299d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig+arm64-chromebook/gcc-10/lab-baylib=
re/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig+arm64-chromebook/gcc-10/lab-baylib=
re/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620c2230f2a69e4104c62=
99e
        new failure (last pass: v5.17-rc1-4-g5c223bb92642) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
               | regressions
---------------------------+-------+--------------+----------+-------------=
---------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie  | gcc-10   | defconfig   =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/620c21e90329057281c62986

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620c21e90329057281c62=
987
        new failure (last pass: v5.17-rc1-4-g5c223bb92642) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
               | regressions
---------------------------+-------+--------------+----------+-------------=
---------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie  | gcc-10   | defconfig+ar=
m64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/620c22111fdcfd70e1c629e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig+arm64-chromebook/gcc-10/lab-brooni=
e/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/arm64/defconfig+arm64-chromebook/gcc-10/lab-brooni=
e/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620c22111fdcfd70e1c62=
9e6
        new failure (last pass: v5.17-rc1-4-g5c223bb92642) =

 =20
