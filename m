Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAADAD5F
	for <chrome-platform@lists.linux.dev>; Tue,  7 Mar 2023 17:03:55 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id 130so8020795pgg.3
        for <chrome-platform@lists.linux.dev>; Tue, 07 Mar 2023 09:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678208634;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YL1xVZgQARAUQSE60laiKJl/DiA+RHUljR4zn3PWeRs=;
        b=vx/OTNlTx6p40ualQch/kyFMp7cClgZGw2cBdkV0ZaX1u3Do+PHJeSmmPvbttvIdUC
         4HXP0pGqBZSizLsUNWPbBZ3DGP3y6peBje4E69Q6Ph1tLehlk04TFsHljBycDggTLwsH
         /0V2VRWM2rJbT9sULI3uS57T35UDMrnSwzzhhxlfUkCLb7dxpoKJwSiAPYIHIgG0xmPa
         v9W2Mk+jwY9kDKvPbpEIaTc/OKsl787q9Y9RVcwe0QReMPGvNoFve+SDC1P7ud2wm2RB
         s66LbM6zcr/rs/Mf5pEs3MB/UCAp7vgvmXd13Zu5BI3+8uUbNr0Hktc1TPIXfQ3dw1jc
         6kSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678208634;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YL1xVZgQARAUQSE60laiKJl/DiA+RHUljR4zn3PWeRs=;
        b=JVc7ZXJvkL7ORF5HSqSAv9tP2tMDBIY8gyMUiPHF2WLf6oDEUVhMgRsOh5mjBUpR9+
         SiJaIBQTALI4bRT2d6dJw0HIuITql/STKl/rNRPiAESlOn72hTFX6tqSMhReZx89w5O3
         1zKeoCJoYk07UERs22Sp/s68NfYGsj1tSy6+PgjCxcGuns+rdWS4yPKuRaigtGDGXAMi
         Hh29wjGe41ETTkzVa2YV/YA2v0LZFio4mkNxnY1g5G36riTfolqHg8+ytVix3/V/K57U
         gQ4+qQYk25gwZJEhMSWIVGP/Afq6l3c2pPea9J8Eg5LAph4Es7AhJMe7GeiEzsd+J743
         SDcA==
X-Gm-Message-State: AO0yUKVI4V7aMhjZiC7KLeXinuKDmwec7sLm3iBj5CR8JrB6nsieZBWg
	UUAM6q4u2GcKZoKgGM5HdJtkog==
X-Google-Smtp-Source: AK7set9/Tek0pF9Ae2YcIUgHUMm9eE82Pm/EEs1qSLIj1SaAsyGxysy+kkIkBvtdKVmugecMLcu44w==
X-Received: by 2002:a62:3808:0:b0:5e1:f4e3:57d4 with SMTP id f8-20020a623808000000b005e1f4e357d4mr12598365pfa.17.1678208634303;
        Tue, 07 Mar 2023 09:03:54 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b9-20020aa78109000000b005a8e97fc71bsm8080871pfi.84.2023.03.07.09.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 09:03:53 -0800 (PST)
Message-ID: <64076e79.a70a0220.f4a12.ec89@mx.google.com>
Date: Tue, 07 Mar 2023 09:03:53 -0800 (PST)
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
X-Kernelci-Kernel: v6.3-rc1-1-g22181069e867
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 74 runs,
 34 regressions (v6.3-rc1-1-g22181069e867)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 74 runs, 34 regressions (v6.3-rc1-1-=
g22181069e867)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1043a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =

imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =

imx6q-sabrelite              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =

imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =

imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 5          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =

tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.3-rc1-1-g22181069e867/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.3-rc1-1-g22181069e867
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      22181069e86761d2d834434da741bc56a45a2705 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1043a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64076852e5b6d33c888c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls1043a=
-rdb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls1043a=
-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076852e5b6d33c888c8=
630
        failing since 1 day (last pass: v6.1-rc1-14-geba771858c2d, first fa=
il: v6.3-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6407639be3ddadcea58c8635

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6407639be3ddadc=
ea58c8638
        failing since 1 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-03-07T16:17:06.938334  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-07T16:17:06.938517  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-07T16:17:06.947256  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xe0cb8000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-07T16:17:06.956250  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-07T16:17:06.965264  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-07T16:17:06.974299  kern  :alert : Register r7 information: sla=
b task_struct start c880bb80 pointer offset 0 size 2176
    2023-03-07T16:17:06.974464  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-03-07T16:17:06.983288  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
    2023-03-07T16:17:06.992310  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory
    2023-03-07T16:17:06.992477  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory =

    ... (103 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6407639be3ddadc=
ea58c8639
        failing since 1 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-03-07T16:17:06.902203  kern  :alert : 8<--- cut here ---
    2023-03-07T16:17:06.911136  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-07T16:17:06.911333  kern  :alert : [c1a50741] *pgd=3D71a0041e(b=
ad)
    2023-03-07T16:17:06.929104  kern  :alert : Register r0 information: non=
-slab/vmalloc memory[    6.795434] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
    2023-03-07T16:17:06.929281  =

    2023-03-07T16:17:06.929404  kern  :alert : Register r1 information: non=
-paged memory   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/640763874a47f9e75d8c8633

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/640763874a47f9e=
75d8c8636
        failing since 1 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-03-07T16:17:03.122844  ern  :alert : Register r0 information: non-=
slab/vmalloc memory
    2023-03-07T16:17:03.123027  kern  :alert : Register r1 information: non=
-paged memory
    2023-03-07T16:17:03.131870  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-07T16:17:03.132094  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-07T16:17:03.141017  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0cd4000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-07T16:17:03.149970  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-07T16:17:03.158981  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-07T16:17:03.168208  kern  :alert : Register r7 information: sla=
b task_struct start c33d9100 pointer offset 0 size 2176
    2023-03-07T16:17:03.168568  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-03-07T16:17:03.177135  kern  :alert : Register r9 information: non=
-slab/vmalloc memory =

    ... (100 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/640763874a47f9e=
75d8c8637
        failing since 1 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-03-07T16:17:03.095813  kern  :alert : 8<--- cut here ---
    2023-03-07T16:17:03.104761  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-07T16:17:03.104935  kern  :alert : [c1a50741] *pgd=3D11a0041e(b=
ad)
    2023-03-07T16:17:03.114026  k[    6.804311] <LAVA_SIGNAL_TESTCASE TEST_=
CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/640764c12740feb1d18c86c0

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-=
imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-=
imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/640764c12740feb=
1d18c86c3
        failing since 1 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-03-07T16:22:09.725251  k<8>[   16.668423] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
    2023-03-07T16:22:09.725722  ern  :alert : Register r0 information: non-=
slab/vmalloc memory
    2023-03-07T16:22:09.726173  kern  :alert : Register r1 information: non=
-paged memory
    2023-03-07T16:22:09.726871  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-07T16:22:09.727281  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-07T16:22:09.747146  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0ccc000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-07T16:22:09.747960  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-07T16:22:09.748361  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-07T16:22:09.769309  kern  :alert : Register r7 information: sla=
b task_struct start c4d5aa80 pointer offset 0 size 2176
    2023-03-07T16:22:09.770121  kern  :alert : Register r8 information: non=
-slab/vmalloc memory =

    ... (103 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/640764c12740feb=
1d18c86c4
        failing since 1 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-03-07T16:22:09.702522  kern  :alert : 8<--- cut here ---
    2023-03-07T16:22:09.702858  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-07T16:22:09.703095  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-sabrelite              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/64076385085e598e098c86c6

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64076385085e598=
e098c86c9
        failing since 1 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-03-07T16:16:56.859510  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0dfc000 allocated at kernel_clone+0x8c/0x=
36c

    2023-03-07T16:16:56.860072  kern  :alert : Register r5 information: non=
-slab/vmalloc memory

    2023-03-07T16:16:56.860439  kern  :alert : Register r6 information: zer=
o-size pointer

    2023-03-07T16:16:56.860782  kern  :alert : Register r7 information: sla=
b task_struct start c27f4400 pointer offset 0 size 2176

    2023-03-07T16:16:56.861113  kern  :alert : Register r8 information: non=
-slab/vmalloc memory

    2023-03-07T16:16:56.861438  kern  :alert : Register r9 information: non=
-slab/vmalloc memory

    2023-03-07T16:16:56.902522  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory

    2023-03-07T16:16:56.903074  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory

    2023-03-07T16:16:56.903448  kern  :alert : Register r12 information: NU=
LL pointer

    2023-03-07T16:16:56.903793  kern  :alert : 8<--- cut here ---
 =

    ... (101 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64076385085e598=
e098c86ca
        failing since 1 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-03-07T16:16:56.816593  kern  :alert : 8<--- cut here ---

    2023-03-07T16:16:56.817151  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741

    2023-03-07T16:16:56.817522  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)

    2023-03-07T16:16:56.817909  k<8>[    8.981734] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>

    2023-03-07T16:16:56.818252  ern  :alert : Register r0 information: non-=
slab/vmalloc memory

    2023-03-07T16:16:56.818580  kern  :alert : Register r1 information: non=
-paged memory

    2023-03-07T16:16:56.818901  kern  :alert : Register r2 information: non=
-slab/vmalloc memory

    2023-03-07T16:16:56.819217  kern  :alert : Register r3 information: non=
-paged memory
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6407655f81f66e936a8c867f

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-=
imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-=
imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6407655f81f66e9=
36a8c8682
        failing since 1 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-03-07T16:24:51.734324  k<8>[   16.523949] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
    2023-03-07T16:24:51.734822  ern  :alert : Register r0 information: non-=
slab/vmalloc memory
    2023-03-07T16:24:51.735261  kern  :alert : Register r1 information: non=
-paged memory
    2023-03-07T16:24:51.735982  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-07T16:24:51.736231  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-07T16:24:51.756411  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0d58000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-07T16:24:51.757307  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-07T16:24:51.757659  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-07T16:24:51.778616  kern  :alert : Register r7 information: sla=
b task_struct start c22ef700 pointer offset 0 size 2176
    2023-03-07T16:24:51.779060  kern  :alert : Register r8 information: non=
-slab/vmalloc memory =

    ... (102 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6407655f81f66e9=
36a8c8683
        failing since 1 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-03-07T16:24:51.712348  kern  :alert : 8<--- cut here ---
    2023-03-07T16:24:51.712908  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-07T16:24:51.713338  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6407634eaaf737c8b88c8640

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6407634eaaf737c=
8b88c8643
        failing since 1 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-03-07T16:16:05.781432  mation: non-slab/vmalloc memory
    2023-03-07T16:16:05.781607  kern  :alert : Register r1 information: non=
-paged memory
    2023-03-07T16:16:05.790561  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-07T16:16:05.790725  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-07T16:16:05.799536  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0ddc000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-07T16:16:05.808471  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-07T16:16:05.817635  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-07T16:16:05.826533  kern  :alert : Register r7 information: sla=
b task_struct start c215ee80 pointer offset 0 size 2176
    2023-03-07T16:16:05.826723  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-03-07T16:16:05.835542  kern  :alert : Register r9 information: non=
-slab/vmalloc memory =

    ... (103 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6407634eaaf737c=
8b88c8644
        failing since 1 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-03-07T16:16:05.754638  kern  :alert : 8<--- cut here ---
    2023-03-07T16:16:05.763359  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-07T16:16:05.763525  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)
    2023-03-07T16:16:05.772513  kern  :alert : Register r0 infor[    5.6128=
15] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines =
MEASUREMENT=3D48>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/64076384efd1c5634e8c8666

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7=
d-sdb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7=
d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64076384efd1c56=
34e8c866a
        failing since 1 day (last pass: v6.2-rc1-32-g7ae7deb4a4b4, first fa=
il: v6.3-rc1)
        48 lines

    2023-03-07T16:16:40.758732  kern  :alert : 8<--- cut here ---
    2023-03-07T16:16:40.759180  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-07T16:16:40.759711  kern  :alert : [c1a50741] *pgd=3D81a1141e(b=
ad)
    2023-03-07T16:16:40.759969  kern  :alert : Register r0 infor<8>[   10.8=
47360] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlin=
es MEASUREMENT=3D48>
    2023-03-07T16:16:40.760218  mation: non-slab/vmalloc memory
    2023-03-07T16:16:40.760504  kern  :alert : Register r1 information: non=
-paged memory
    2023-03-07T16:16:40.760743  kern  :alert : Register r2 information: non=
-slab/vmalloc memory   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64076384efd1c56=
34e8c866b
        failing since 1 day (last pass: v6.2-rc1-32-g7ae7deb4a4b4, first fa=
il: v6.3-rc1)
        90 lines

    2023-03-07T16:16:40.762042  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-07T16:16:40.802007  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0e4c000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-07T16:16:40.802362  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-07T16:16:40.802621  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-07T16:16:40.803123  kern  :alert : Register r7 information: sla=
b task_struct start c20dbb80 pointer offset 0 size 2176
    2023-03-07T16:16:40.803427  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-03-07T16:16:40.803923  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
    2023-03-07T16:16:40.844889  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory
    2023-03-07T16:16:40.845166  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory
    2023-03-07T16:16:40.845541  kern  :alert : Register r12 information: NU=
LL pointer =

    ... (99 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6407650200e640f01d8c86ab

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7=
ulp-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7=
ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6407650200e640f=
01d8c86af
        failing since 1 day (last pass: v6.2-rc1-23-g93899a4cb7b1, first fa=
il: v6.3-rc1)
        48 lines

    2023-03-07T16:22:57.125631  kern  :alert : 8<--- cut here ---
    2023-03-07T16:22:57.125939  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-07T16:22:57.126443  kern  :alert : [c1a50741] *pgd=3D61a1141e(b=
ad)
    2023-03-07T16:22:57.126691  kern  :alert : Register r0 information: non=
-slab/vmalloc memory
    2023-03-07T16:22:57.135665  kern  :alert : Register r1 information: non=
<8>[   24.577582] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail =
UNITS=3Dlines MEASUREMENT=3D48>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6407650200e640f=
01d8c86b0
        failing since 1 day (last pass: v6.2-rc1-23-g93899a4cb7b1, first fa=
il: v6.3-rc1)
        90 lines

    2023-03-07T16:22:57.156616  -paged memory
    2023-03-07T16:22:57.156920  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-07T16:22:57.157424  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-07T16:22:57.178625  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0be8000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-07T16:22:57.178946  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-07T16:22:57.179453  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-07T16:22:57.179701  kern  :alert : Register r7 information: sla=
b task_struct start c232cc80 pointer offset 0 size 2176
    2023-03-07T16:22:57.201573  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-03-07T16:22:57.201874  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
    2023-03-07T16:22:57.202381  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory =

    ... (105 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 5          =


  Details:     https://kernelci.org/test/plan/id/64076622610f5180d98c863e

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron=
-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron=
-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64076622610f5180d98c8645
        new failure (last pass: v6.2-rc1-35-g75a273974d7a)

    2023-03-07T16:28:01.488568  / # #
    2023-03-07T16:28:01.590355  export SHELL=3D/bin/sh
    2023-03-07T16:28:01.590904  #
    2023-03-07T16:28:01.692631  / # export SHELL=3D/bin/sh. /lava-288001/en=
vironment
    2023-03-07T16:28:01.693276  =

    2023-03-07T16:28:01.797131  / # . /lava-288001/environment/lava-288001/=
bin/lava-test-runner /lava-288001/1
    2023-03-07T16:28:01.797955  =

    2023-03-07T16:28:01.817393  / # /lava-288001/bin/lava-test-runner /lava=
-288001/1
    2023-03-07T16:28:01.870497  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-07T16:28:01.870862  + <8>[   22.632922] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 288001_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/64076622610f5180d98c8649
        new failure (last pass: v6.2-rc1-35-g75a273974d7a)

    2023-03-07T16:28:03.968559  /lava-288001/1/../bin/lava-test-case
    2023-03-07T16:28:03.968846  <8>[   24.739206] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-03-07T16:28:03.968998  /lava-288001/1/../bin/lava-test-case
    2023-03-07T16:28:03.969142  <8>[   24.756614] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/64=
076622610f5180d98c864b
        new failure (last pass: v6.2-rc1-35-g75a273974d7a)

    2023-03-07T16:28:05.028418  /lava-288001/1/../bin/lava-test-case
    2023-03-07T16:28:05.028752  <8>[   25.779925] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-03-07T16:28:05.028943  /lava-288001/1/../bin/lava-test-case
    2023-03-07T16:28:05.029087  <8>[   25.798550] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2023-03-07T16:28:05.029229  /lava-288001/1/../bin/lava-test-case
    2023-03-07T16:28:05.029365  <8>[   25.818148] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2023-03-07T16:28:05.029501  /lava-288001/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/64076622610f5180d98c8650
        new failure (last pass: v6.2-rc1-35-g75a273974d7a)

    2023-03-07T16:28:06.103652  /lava-288001/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/64076622610f5180d98c8651
        new failure (last pass: v6.2-rc1-35-g75a273974d7a)

    2023-03-07T16:28:06.106601  <8>[   26.894629] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-03-07T16:28:07.165475  /lava-288001/1/../bin/lava-test-case
    2023-03-07T16:28:07.165765  <8>[   27.915867] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-03-07T16:28:07.165915  /lava-288001/1/../bin/lava-test-case
    2023-03-07T16:28:07.166056  <8>[   27.935021] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2023-03-07T16:28:07.166197  /lava-288001/1/../bin/lava-test-case
    2023-03-07T16:28:07.166332  <8>[   27.954013] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-probed RESULT=3Dpass>
    2023-03-07T16:28:07.166465  /lava-288001/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/64076208fa6415e2ba8c865d

  Results:     166 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/64076208fa6415e2ba8c86cb
        failing since 1 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)

    2023-03-07T16:10:34.109366  /lava-9473317/1/../bin/lava-test-case

    2023-03-07T16:10:34.119405  <8>[   22.341059] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/64076208fa6415e2ba8c86cc
        failing since 1 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)

    2023-03-07T16:10:32.064213    cHandles:     0x1

    2023-03-07T16:10:32.064302    rHandle:      0

    2023-03-07T16:10:32.067325    V:            0

    2023-03-07T16:10:32.070630    Res:          0x0

    2023-03-07T16:10:32.070719  TPM2_CC_PolicyNvWritten:

    2023-03-07T16:10:32.074276    value: 0x200018F

    2023-03-07T16:10:32.074364    commandIndex: 0x18f

    2023-03-07T16:10:32.077207    reserved1:    0x0

    2023-03-07T16:10:32.077294    nv:           0

    2023-03-07T16:10:32.080789    extensive:    0
 =

    ... (22 line(s) more)  =


  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/640=
76208fa6415e2ba8c86d6
        failing since 1 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)

    2023-03-07T16:10:36.991728  /lava-9473317/1/../bin/lava-test-case

    2023-03-07T16:10:37.001272  <8>[   25.223439] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/640762a39552e9bbf78c8680

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline=
-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline=
-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640762a39552e9bbf78c8=
681
        failing since 1 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6407636baaf737c8b88c86fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-b=
roonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-b=
roonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6407636baaf737c8b88c8=
6fc
        failing since 1 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6407622bdee9d9372a8c86a9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline=
-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline=
-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6407622bdee9d9372a8c8=
6aa
        failing since 1 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/640763936c8e8735478c8640

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-b=
roonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-b=
roonie/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640763936c8e8735478c8=
641
        failing since 1 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/640762a53cfd462bf38c866f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640762a53cfd462bf38c8=
670
        failing since 1 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6407646179e5b790ba8c866c

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6407646179e5b79=
0ba8c866f
        failing since 1 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        60 lines

    2023-03-07T16:20:39.480584  kern  :alert : Register r3 information: non=
-paged memory

    2023-03-07T16:20:39.480861  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf09fc000 allocated at kernel_clone+0x8c/0x=
36c

    2023-03-07T16:20:39.481107  kern  :alert : Register r5 information: non=
-slab/vmalloc memory

    2023-03-07T16:20:39.481334  kern  :alert : Register r6 information: zer=
o-size pointer

    2023-03-07T16:20:39.481543  kern  :alert : Register r7 information: sla=
b task_struct start c337d500 pointer offset 0 size 2176

    2023-03-07T16:20:39.481760  kern  :alert : Register r8 information: non=
-slab/vmalloc memory

    2023-03-07T16:20:39.481978  kern  :alert : Register r9 information: non=
-slab/vmalloc memory

    2023-03-07T16:20:39.528844  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory

    2023-03-07T16:20:39.529178  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory

    2023-03-07T16:20:39.529405  kern  :alert : Register r12 information: NU=
LL pointer
 =

    ... (50 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6407646179e5b79=
0ba8c8670
        failing since 1 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        32 lines

    2023-03-07T16:20:39.432886  kern  :alert : 8<--- cut here ---

    2023-03-07T16:20:39.433273  kern  :alert : Unhandled faul<8>[   16.1404=
14] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines =
MEASUREMENT=3D32>

    2023-03-07T16:20:39.433501  t: alignment exception (0x001) at 0xc1a50741

    2023-03-07T16:20:39.433716  kern  :alert : [c1a50741] *pgd=3D01a1141e(b=
ad)

    2023-03-07T16:20:39.433929  kern  :alert : Register r0 information: non=
-slab/vmalloc memory

    2023-03-07T16:20:39.434133  kern  :alert : Register r1 information: non=
-paged memory

    2023-03-07T16:20:39.434343  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/64076462b9bc259a378c863c

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g22181069e867/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64076462b9bc259=
a378c863f
        failing since 1 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-03-07T16:20:37.897095  0741

    2023-03-07T16:20:37.900036  kern  :alert : [c1a50741] *pgd=3D81a1141e(b=
ad)

    2023-03-07T16:20:37.905833  kern  :alert : Register r0 information: non=
-slab/vmalloc memory

    2023-03-07T16:20:37.910419  kern  :alert : Register r1 information: non=
-paged memory

    2023-03-07T16:20:37.916236  kern  :alert : Register r2 information: non=
-slab/vmalloc memory

    2023-03-07T16:20:37.921172  kern  :alert : Register r3 information: non=
-paged memory

    2023-03-07T16:20:37.931639  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0ed0000 allocated at kernel_clone+0x8c/0x=
36c

    2023-03-07T16:20:37.937280  kern  :alert : Register r5 information: non=
-slab/vmalloc memory

    2023-03-07T16:20:37.942433  kern  :alert : Register r6 information: zer=
o-size pointer

    2023-03-07T16:20:37.951190  kern  :alert : Register r7 information: sla=
b task_struct start c4ff3300 pointer offset 0 size 2176
 =

    ... (101 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64076462b9bc259=
a378c8640
        failing since 1 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-03-07T16:20:37.865557  <8>[   16.925363] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-03-07T16:20:37.880475  kern  :alert : 8<--- cut here ---

    2023-03-07T16:20:37.895264  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a5<8>[   16.953158] <LAVA_SIGNAL_TESTCASE TEST_CASE=
_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
   =

 =20
