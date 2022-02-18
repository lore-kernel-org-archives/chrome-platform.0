Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E3D4C9C
	for <chrome-platform@lists.linux.dev>; Fri, 18 Feb 2022 23:12:07 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id l8so8292361pls.7
        for <chrome-platform@lists.linux.dev>; Fri, 18 Feb 2022 15:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+kdotcF4X4rkZEVoDDtWEK1Knr0ayeq2Vj04RsMyJiE=;
        b=WBoF8MYMeqk5r1OaqDUwkV8xWdy9Or2Txd10UdRCKoo9ZLGq5B23OilnAtJXG1Y5VI
         fodxhSj1RDz6RtazR7DvjfctSGsxCreRoS7iravQb3Z0wEyuitP1fgdLCedTwIrjGJL8
         AhQc68Eh0HFNyGWve708TbhPA4v9NbNQT637H4H6GIhO+g3aFUKX3xK9eHcFwKy0W6Ph
         mtV56EdBb3zJVTY5iP6HBry46I/f4q9E6gXQqxNTngLPh3Bl3amyYhhXPQgQIlhjTCS4
         qAejoBenM6RGWkwq3Xjk8i6vEDMWu2dlRKPhUVuHarTrt7Ka8D+HyMQ3aSsDe4Y6JwZa
         KvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+kdotcF4X4rkZEVoDDtWEK1Knr0ayeq2Vj04RsMyJiE=;
        b=o0zjxGUNQ4brG17cd8sNJO7bwYgSGO0M2vJCatCSvzNh6sLaDqcoCzpjscPe5CErSl
         c7ynmKQrrQtNAvhSwmEWq2LC1cln2hykahPBB8zSn+28TpVADwCi5fjthqG+Gr+UoXs9
         3oU15f9K2205531nz215iIEPonbHfkJuT+p1egZazwBilj76VwLwTpkGTpAh2UZnU6xP
         x24tRLNlkdaCQ/eGGOdERGICaW0A5kXRtWjgrcm7kZTzAKE0s/iNagAsIaeb3CbT7US3
         WTRD/NyAIL0uJPSxZZTVamDLymgt5C8j7/7XRgvGADO/B3qE0n8tNVaSlF3cLDjpR57M
         pMCg==
X-Gm-Message-State: AOAM531eIiHHvdgXSX52NjcZtOl9uSiiA4dVYEaLDp+IBnCDyzpux5aT
	QQjumLqoYTjft/7HG27dn3CM6A==
X-Google-Smtp-Source: ABdhPJx6h74OeAtchj9k1nSyBNoZnXwrd1cXnFCcmJ+wA9Of2SdUcZgthJQgkKkgS3lJe+jtlE6Epw==
X-Received: by 2002:a17:902:aa05:b0:14d:66f5:3c3f with SMTP id be5-20020a170902aa0500b0014d66f53c3fmr9284437plb.157.1645225926530;
        Fri, 18 Feb 2022 15:12:06 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id bo5-20020a17090b090500b001b9dc0e399dsm386546pjb.9.2022.02.18.15.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 15:12:06 -0800 (PST)
Message-ID: <621027c6.1c69fb81.bcff.1bac@mx.google.com>
Date: Fri, 18 Feb 2022 15:12:06 -0800 (PST)
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
X-Kernelci-Kernel: v5.17-rc1-10-g0ef49b25b7cc
Subject: chrome-platform/for-kernelci baseline: 73 runs,
 26 regressions (v5.17-rc1-10-g0ef49b25b7cc)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 73 runs, 26 regressions (v5.17-rc1-1=
0-g0ef49b25b7cc)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                 | regressions
-----------------------------+-------+--------------+----------+-----------=
-----------------+------------
imx8mn-ddr4-evk              | arm64 | lab-baylibre | gcc-10   | defconfig =
                 | 2          =

imx8mn-ddr4-evk              | arm64 | lab-nxp      | gcc-10   | defconfig =
                 | 2          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron  | gcc-10   | defconfig =
                 | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron  | gcc-10   | defconfig =
                 | 2          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig =
                 | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-baylibre | gcc-10   | defconfig+=
arm64-chromebook | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-baylibre | gcc-10   | defconfig =
                 | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-broonie  | gcc-10   | defconfig+=
arm64-chromebook | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-broonie  | gcc-10   | defconfig =
                 | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre | gcc-10   | defconfig+=
arm64-chromebook | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre | gcc-10   | defconfig =
                 | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie  | gcc-10   | defconfig+=
arm64-chromebook | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie  | gcc-10   | defconfig =
                 | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-baylibre | gcc-10   | defconfig+=
arm64-chromebook | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-baylibre | gcc-10   | defconfig =
                 | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-broonie  | gcc-10   | defconfig+=
arm64-chromebook | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-broonie  | gcc-10   | defconfig =
                 | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre | gcc-10   | defconfig+=
arm64-chromebook | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre | gcc-10   | defconfig =
                 | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie  | gcc-10   | defconfig+=
arm64-chromebook | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie  | gcc-10   | defconfig =
                 | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre | gcc-10   | defconfig =
                 | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.17-rc1-10-g0ef49b25b7cc/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.17-rc1-10-g0ef49b25b7cc
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      0ef49b25b7ccd4b0c97b043bea3da976784044c7 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                 | regressions
-----------------------------+-------+--------------+----------+-----------=
-----------------+------------
imx8mn-ddr4-evk              | arm64 | lab-baylibre | gcc-10   | defconfig =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/62101a752479cf4824c6297d

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8=
mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8=
mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62101a752479cf4=
824c62981
        failing since 3 days (last pass: v5.15-rc1-22-g92af99fcc4df, first =
fail: v5.17-rc1-8-g981d3de32cfb)
        12 lines

    2022-02-18T22:15:00.759699  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   10.851280] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-02-18T22:15:00.761182  at virtual address 0000000000000000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62101a752479cf4=
824c62982
        failing since 3 days (last pass: v5.15-rc1-22-g92af99fcc4df, first =
fail: v5.17-rc1-8-g981d3de32cfb)
        2 lines

    2022-02-18T22:15:00.766896  kern  :alert : Mem abort info:
    2022-02-18T22:15:00.768026  kern  :alert :   ESR =3D 0x96000006
    2022-02-18T22:15:00.769175  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-02-18T22:15:00.770362  kern  :alert :   SET =3D <8>[   10.875286] =
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEAS=
UREMENT=3D2>
    2022-02-18T22:15:00.771570  0, FnV =3D 0   =

 =



platform                     | arch  | lab          | compiler | defconfig =
                 | regressions
-----------------------------+-------+--------------+----------+-----------=
-----------------+------------
imx8mn-ddr4-evk              | arm64 | lab-nxp      | gcc-10   | defconfig =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/62101aef64b3968660c629aa

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig/gcc-10/lab-nxp/baseline-imx8mn-dd=
r4-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig/gcc-10/lab-nxp/baseline-imx8mn-dd=
r4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62101aef64b3968=
660c629ae
        failing since 3 days (last pass: v5.15-rc1-22-g92af99fcc4df, first =
fail: v5.17-rc1-8-g981d3de32cfb)
        12 lines

    2022-02-18T22:16:47.625653  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   15.150810] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2022-02-18T22:16:47.625957  0000
    2022-02-18T22:16:47.626244  kern  :alert : Mem abort info:
    2022-02-18T22:16:47.626488  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62101aef64b3968=
660c629af
        failing since 3 days (last pass: v5.15-rc1-22-g92af99fcc4df, first =
fail: v5.17-rc1-8-g981d3de32cfb)
        2 lines

    2022-02-18T22:16:47.627818  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-02-18T22:16:47.628063  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-02-18T22:16:47.628296  kern  :alert :   EA<8>[   15.177678] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2022-02-18T22:16:47.628563   =3D 0, S1PTW =3D 0   =

 =



platform                     | arch  | lab          | compiler | defconfig =
                 | regressions
-----------------------------+-------+--------------+----------+-----------=
-----------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron  | gcc-10   | defconfig =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/62101a56285b9b59e9c62976

  Results:     91 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig/gcc-10/lab-kontron/baseline-kontr=
on-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig/gcc-10/lab-kontron/baseline-kontr=
on-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/62101a57285b9b59e9c629bc
        failing since 21 days (last pass: v5.16-rc1-1-g22da27bb6da5, first =
fail: v5.17-rc1-2-g09824a28f604d)

    2022-02-18T22:14:35.464590  /lava-90819/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/621=
01a57285b9b59e9c629bd
        failing since 21 days (last pass: v5.16-rc1-1-g22da27bb6da5, first =
fail: v5.17-rc1-2-g09824a28f604d)

    2022-02-18T22:14:35.467748  <8>[   17.680269] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-02-18T22:14:36.515854  /lava-90819/1/../bin/lava-test-case
    2022-02-18T22:14:36.516293  <8>[   18.699004] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-02-18T22:14:36.516544  /lava-90819/1/../bin/lava-test-case
    2022-02-18T22:14:36.516774  <8>[   18.715784] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-02-18T22:14:36.517005  /lava-90819/1/../bin/lava-test-case
    2022-02-18T22:14:36.517227  <8>[   18.731820] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-02-18T22:14:36.517452  /lava-90819/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab          | compiler | defconfig =
                 | regressions
-----------------------------+-------+--------------+----------+-----------=
-----------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron  | gcc-10   | defconfig =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/62101a583df0ab549bc62975

  Results:     99 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig/gcc-10/lab-kontron/baseline-kontr=
on-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig/gcc-10/lab-kontron/baseline-kontr=
on-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/62101a583df0ab549bc629c2
        failing since 21 days (last pass: v5.15-rc1-22-g92af99fcc4df, first=
 fail: v5.17-rc1-2-g09824a28f604d)

    2022-02-18T22:14:36.251136  /lava-90820/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/621=
01a583df0ab549bc629c3
        failing since 21 days (last pass: v5.15-rc1-22-g92af99fcc4df, first=
 fail: v5.17-rc1-2-g09824a28f604d)

    2022-02-18T22:14:36.254314  <8>[   13.534010] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-02-18T22:14:37.300923  /lava-90820/1/../bin/lava-test-case
    2022-02-18T22:14:37.301305  <8>[   14.552788] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-02-18T22:14:37.301553  /lava-90820/1/../bin/lava-test-case
    2022-02-18T22:14:37.301784  <8>[   14.568336] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform                     | arch  | lab          | compiler | defconfig =
                 | regressions
-----------------------------+-------+--------------+----------+-----------=
-----------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/62101af164b3968660c629b5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig/gcc-10/lab-baylibre/baseline-meso=
n-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig/gcc-10/lab-baylibre/baseline-meso=
n-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62101af164b3968660c62=
9b6
        new failure (last pass: v5.17-rc1-8-g981d3de32cfb) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                 | regressions
-----------------------------+-------+--------------+----------+-----------=
-----------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-baylibre | gcc-10   | defconfig+=
arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62101b47d884eb80f7c62973

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig+arm64-chromebook/gcc-10/lab-bayli=
bre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig+arm64-chromebook/gcc-10/lab-bayli=
bre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62101b47d884eb80f7c62=
974
        failing since 3 days (last pass: v5.17-rc1-4-g5c223bb92642, first f=
ail: v5.17-rc1-8-g981d3de32cfb) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                 | regressions
-----------------------------+-------+--------------+----------+-----------=
-----------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-baylibre | gcc-10   | defconfig =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/62101c4df2cefd7c78c62982

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62101c4df2cefd7c78c62=
983
        failing since 3 days (last pass: v5.17-rc1-4-g5c223bb92642, first f=
ail: v5.17-rc1-8-g981d3de32cfb) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                 | regressions
-----------------------------+-------+--------------+----------+-----------=
-----------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-broonie  | gcc-10   | defconfig+=
arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62101a35cca8a4bb49c6297e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig+arm64-chromebook/gcc-10/lab-broon=
ie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig+arm64-chromebook/gcc-10/lab-broon=
ie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62101a35cca8a4bb49c62=
97f
        failing since 3 days (last pass: v5.17-rc1-4-g5c223bb92642, first f=
ail: v5.17-rc1-8-g981d3de32cfb) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                 | regressions
-----------------------------+-------+--------------+----------+-----------=
-----------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-broonie  | gcc-10   | defconfig =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/62101afb72ebbdf51ac6297d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62101afb72ebbdf51ac62=
97e
        failing since 3 days (last pass: v5.17-rc1-4-g5c223bb92642, first f=
ail: v5.17-rc1-8-g981d3de32cfb) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                 | regressions
-----------------------------+-------+--------------+----------+-----------=
-----------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre | gcc-10   | defconfig+=
arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62101b59d884eb80f7c62992

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig+arm64-chromebook/gcc-10/lab-bayli=
bre/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig+arm64-chromebook/gcc-10/lab-bayli=
bre/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62101b59d884eb80f7c62=
993
        failing since 3 days (last pass: v5.17-rc1-4-g5c223bb92642, first f=
ail: v5.17-rc1-8-g981d3de32cfb) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                 | regressions
-----------------------------+-------+--------------+----------+-----------=
-----------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre | gcc-10   | defconfig =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/62101c85560f884db4c62975

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62101c85560f884db4c62=
976
        failing since 3 days (last pass: v5.17-rc1-4-g5c223bb92642, first f=
ail: v5.17-rc1-8-g981d3de32cfb) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                 | regressions
-----------------------------+-------+--------------+----------+-----------=
-----------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie  | gcc-10   | defconfig+=
arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62101a5b285b9b59e9c629de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig+arm64-chromebook/gcc-10/lab-broon=
ie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig+arm64-chromebook/gcc-10/lab-broon=
ie/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62101a5b285b9b59e9c62=
9df
        failing since 3 days (last pass: v5.17-rc1-4-g5c223bb92642, first f=
ail: v5.17-rc1-8-g981d3de32cfb) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                 | regressions
-----------------------------+-------+--------------+----------+-----------=
-----------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie  | gcc-10   | defconfig =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/62101afd72ebbdf51ac62984

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62101afd72ebbdf51ac62=
985
        failing since 3 days (last pass: v5.17-rc1-4-g5c223bb92642, first f=
ail: v5.17-rc1-8-g981d3de32cfb) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                 | regressions
-----------------------------+-------+--------------+----------+-----------=
-----------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-baylibre | gcc-10   | defconfig+=
arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62101babd8d96da8a4c6298f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig+arm64-chromebook/gcc-10/lab-bayli=
bre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig+arm64-chromebook/gcc-10/lab-bayli=
bre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62101babd8d96da8a4c62=
990
        failing since 3 days (last pass: v5.17-rc1-4-g5c223bb92642, first f=
ail: v5.17-rc1-8-g981d3de32cfb) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                 | regressions
-----------------------------+-------+--------------+----------+-----------=
-----------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-baylibre | gcc-10   | defconfig =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/62101cad7abe27b25ac62983

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62101cad7abe27b25ac62=
984
        failing since 3 days (last pass: v5.17-rc1-4-g5c223bb92642, first f=
ail: v5.17-rc1-8-g981d3de32cfb) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                 | regressions
-----------------------------+-------+--------------+----------+-----------=
-----------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-broonie  | gcc-10   | defconfig+=
arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62101a702479cf4824c62971

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig+arm64-chromebook/gcc-10/lab-broon=
ie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig+arm64-chromebook/gcc-10/lab-broon=
ie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62101a702479cf4824c62=
972
        failing since 3 days (last pass: v5.17-rc1-4-g5c223bb92642, first f=
ail: v5.17-rc1-8-g981d3de32cfb) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                 | regressions
-----------------------------+-------+--------------+----------+-----------=
-----------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-broonie  | gcc-10   | defconfig =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/62101b0f18b1df8e27c62983

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62101b0f18b1df8e27c62=
984
        failing since 3 days (last pass: v5.17-rc1-4-g5c223bb92642, first f=
ail: v5.17-rc1-8-g981d3de32cfb) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                 | regressions
-----------------------------+-------+--------------+----------+-----------=
-----------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre | gcc-10   | defconfig+=
arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62101b810d38922588c62995

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig+arm64-chromebook/gcc-10/lab-bayli=
bre/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig+arm64-chromebook/gcc-10/lab-bayli=
bre/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62101b810d38922588c62=
996
        failing since 3 days (last pass: v5.17-rc1-4-g5c223bb92642, first f=
ail: v5.17-rc1-8-g981d3de32cfb) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                 | regressions
-----------------------------+-------+--------------+----------+-----------=
-----------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre | gcc-10   | defconfig =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/62101c4cf2cefd7c78c6297f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62101c4cf2cefd7c78c62=
980
        failing since 3 days (last pass: v5.17-rc1-4-g5c223bb92642, first f=
ail: v5.17-rc1-8-g981d3de32cfb) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                 | regressions
-----------------------------+-------+--------------+----------+-----------=
-----------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie  | gcc-10   | defconfig+=
arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62101a6f2479cf4824c6296c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig+arm64-chromebook/gcc-10/lab-broon=
ie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig+arm64-chromebook/gcc-10/lab-broon=
ie/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62101a6f2479cf4824c62=
96d
        failing since 3 days (last pass: v5.17-rc1-4-g5c223bb92642, first f=
ail: v5.17-rc1-8-g981d3de32cfb) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                 | regressions
-----------------------------+-------+--------------+----------+-----------=
-----------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie  | gcc-10   | defconfig =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/62101ae964b3968660c62985

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62101ae964b3968660c62=
986
        failing since 3 days (last pass: v5.17-rc1-4-g5c223bb92642, first f=
ail: v5.17-rc1-8-g981d3de32cfb) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                 | regressions
-----------------------------+-------+--------------+----------+-----------=
-----------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre | gcc-10   | defconfig =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/62101adeb8cbf6d840c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a7=
7950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-10-g0ef49b25b7cc/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a7=
7950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220211.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62101adeb8cbf6d840c62=
969
        new failure (last pass: v5.17-rc1-8-g981d3de32cfb) =

 =20
