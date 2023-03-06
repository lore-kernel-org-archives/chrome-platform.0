Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B45620F0
	for <chrome-platform@lists.linux.dev>; Mon,  6 Mar 2023 04:55:45 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id ky4so8970634plb.3
        for <chrome-platform@lists.linux.dev>; Sun, 05 Mar 2023 20:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678078544;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yyMg34Pt+3j/qeh7niq1HKdrEaFMQJzkVn1H9vzbivw=;
        b=udHRClkSW5UmfAWCH86ceRBF5mtTm0j96jOUzxehOaViNyS/lMa/PGClD1nFrfeZPw
         ONThjOUTl+URxAC4iRarEvBwEuFtQ0GGKzIu9IK1SWgdKIjV1snJ4n5iPD9JpiDlnYyW
         SICcBGgMx1rBoNMDHIGgLm3dR/XXpD85/KQcbZ0pTE22zCm2xNXpchv8pEZKtpKhFIFs
         RgAHmp98yFST0xr+BhYt6wCPJlweMwGC/oep3fCLie1UOb9AZ+5hJcyZr19sVNFWX6/P
         z8RQXxyldsSBNV5xnm3hVmyXUrIo2KxGVNXSqDdBaILKd7Zb7QhEWQCEpPEDVOgfT1UJ
         1rig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678078544;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yyMg34Pt+3j/qeh7niq1HKdrEaFMQJzkVn1H9vzbivw=;
        b=rmdAjtZf0PgGQNwc+9HbR0ZbxNVOG+IaiVVMLpHxokIjhPTK1NDQzP4wmTEFg6EQPy
         fl6thyECvupqh+zeHmUDLSW+uU2tbauLkEIPIGOCwb2fHEkdryKrcIaVrUjJR2TC49/c
         9DgUdpOdcAV2YUIngWiFq4JdVc9al/96empcX5tzcwhXKn0k1ktpA1CF8AriL83ubagq
         xMzK7Akz3t4k9+sFKBtAElOrL1IS5az+sWydbaQSw6yzuBduBukDM4IS4RA83zb0soNe
         IoO5lYOol0B+L3NcwwtgB7WhwuHwSLr4QYR2kGocqCVegtYeKpvqJGj1ABjynMJM4B2X
         RKng==
X-Gm-Message-State: AO0yUKUba8YjVvj17SmHOpzx22sZ9BHhfEAb6b6toAHDRTfZpc0JNCdc
	iGsyDhB3/80YhewHq+Oubeid8w==
X-Google-Smtp-Source: AK7set+vUQfSzSvVxYxi4F74FBgRtoel7Bbo7/mMBuGQdgWEOiVi8JM5aPjcgYQ7mWD3KtElFWUSXg==
X-Received: by 2002:a17:902:d4c9:b0:19d:323:e70 with SMTP id o9-20020a170902d4c900b0019d03230e70mr12871090plg.33.1678078544344;
        Sun, 05 Mar 2023 20:55:44 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id lc8-20020a170902fa8800b0019a8597788csm5273721plb.0.2023.03.05.20.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 20:55:44 -0800 (PST)
Message-ID: <64057250.170a0220.7cb9d.8b63@mx.google.com>
Date: Sun, 05 Mar 2023 20:55:44 -0800 (PST)
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
X-Kernelci-Kernel: v6.3-rc1-1-gad79d30ce40d
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 78 runs,
 25 regressions (v6.3-rc1-1-gad79d30ce40d)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 78 runs, 25 regressions (v6.3-rc1-1-=
gad79d30ce40d)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =

imx6q-sabrelite              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =

imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =

tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.3-rc1-1-gad79d30ce40d/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.3-rc1-1-gad79d30ce40d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      ad79d30ce40d8c5edf5e93b1d334162af3a15aac =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/64056786034f44c73b8c862f

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64056786034f44c=
73b8c8632
        new failure (last pass: v6.2-rc1-35-g75a273974d7a)
        90 lines

    2023-03-06T04:09:22.790819  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-06T04:09:22.790993  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-06T04:09:22.799879  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xe0cb8000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-06T04:09:22.808859  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-06T04:09:22.818032  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-06T04:09:22.826897  kern  :alert : Register r7 information: sla=
b task_struct start c2382a80 pointer offset 0 size 2176
    2023-03-06T04:09:22.827165  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-03-06T04:09:22.836061  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
    2023-03-06T04:09:22.845002  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory
    2023-03-06T04:09:22.845248  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory =

    ... (103 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64056786034f44c=
73b8c8633
        new failure (last pass: v6.2-rc1-35-g75a273974d7a)
        48 lines

    2023-03-06T04:09:22.708024  [    6.740173] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-03-06T04:09:22.754692  kern  :alert : 8<--- cut here ---
    2023-03-06T04:09:22.763719  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-06T04:09:22.764005  kern  :alert : [c1a50741] *pgd=3D71a0041e(b=
ad)
    2023-03-06T04:09:22.781843  kern  :alert : Register r0 information: non=
-slab/vmalloc memory[    6.806324] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
    2023-03-06T04:09:22.782125  =

    2023-03-06T04:09:22.782244  kern  :alert : Register r1 information: non=
-paged memory   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/64056789034f44c73b8c864d

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64056789034f44c=
73b8c8650
        new failure (last pass: v6.2-rc1-35-g75a273974d7a)
        90 lines

    2023-03-06T04:09:21.396995  ern  :alert : Register r0 information: non-=
slab/vmalloc memory
    2023-03-06T04:09:21.397214  kern  :alert : Register r1 information: non=
-paged memory
    2023-03-06T04:09:21.405971  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-06T04:09:21.406162  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-06T04:09:21.415018  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0cd8000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-06T04:09:21.424098  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-06T04:09:21.433153  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-06T04:09:21.442143  kern  :alert : Register r7 information: sla=
b task_struct start c33d9100 pointer offset 0 size 2176
    2023-03-06T04:09:21.442344  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-03-06T04:09:21.451291  kern  :alert : Register r9 information: non=
-slab/vmalloc memory =

    ... (100 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64056789034f44c=
73b8c8651
        new failure (last pass: v6.2-rc1-35-g75a273974d7a)
        48 lines

    2023-03-06T04:09:21.369902  kern  :alert : 8<--- cut here ---
    2023-03-06T04:09:21.378872  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-06T04:09:21.379088  kern  :alert : [c1a50741] *pgd=3D11a0041e(b=
ad)
    2023-03-06T04:09:21.388208  k[    6.772744] <LAVA_SIGNAL_TESTCASE TEST_=
CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-sabrelite              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/640567b37da4ed9b138c86cc

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/640567b37da4ed9=
b138c86cf
        new failure (last pass: v6.2-rc1-35-g75a273974d7a)
        90 lines

    2023-03-06T04:10:09.326166  k<8>[    8.151862] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>

    2023-03-06T04:10:09.328025  ern  :alert : Register r0 information: non-=
slab/vmalloc memory

    2023-03-06T04:10:09.332689  kern  :alert : Register r1 information: non=
-paged memory

    2023-03-06T04:10:09.340084  kern  :alert : Register r2 information: non=
-slab/vmalloc memory

    2023-03-06T04:10:09.343688  kern  :alert : Register r3 information: non=
-paged memory

    2023-03-06T04:10:09.354653  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0de4000 allocated at kernel_clone+0x8c/0x=
36c

    2023-03-06T04:10:09.359851  kern  :alert : Register r5 information: non=
-slab/vmalloc memory

    2023-03-06T04:10:09.363560  kern  :alert : Register r6 information: zer=
o-size pointer

    2023-03-06T04:10:09.373886  kern  :alert : Register r7 information: sla=
b task_struct start c2346e80 pointer offset 0 size 2176

    2023-03-06T04:10:09.380414  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
 =

    ... (102 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/640567b37da4ed9=
b138c86d0
        new failure (last pass: v6.2-rc1-35-g75a273974d7a)
        48 lines

    2023-03-06T04:10:09.302201  kern  :alert : 8<--- cut here ---

    2023-03-06T04:10:09.308794  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741

    2023-03-06T04:10:09.313862  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/640571cdb55bd9a9628c863b

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-=
imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-=
imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/640571cdb55bd9a=
9628c863e
        new failure (last pass: v6.2-rc1-35-g75a273974d7a)
        90 lines

    2023-03-06T04:53:19.547168  k<8>[   14.755422] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
    2023-03-06T04:53:19.547676  ern  :alert : Register r0 information: non-=
slab/vmalloc memory
    2023-03-06T04:53:19.547890  kern  :alert : Register r1 information: non=
-paged memory
    2023-03-06T04:53:19.548076  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-06T04:53:19.548256  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-06T04:53:19.569232  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0d48000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-06T04:53:19.569743  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-06T04:53:19.569951  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-06T04:53:19.591275  kern  :alert : Register r7 information: sla=
b task_struct start c4ee0000 pointer offset 0 size 2176
    2023-03-06T04:53:19.591785  kern  :alert : Register r8 information: non=
-slab/vmalloc memory =

    ... (103 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/640571cdb55bd9a=
9628c863f
        new failure (last pass: v6.2-rc1-35-g75a273974d7a)
        48 lines

    2023-03-06T04:53:19.525146  kern  :alert : 8<--- cut here ---
    2023-03-06T04:53:19.525654  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-06T04:53:19.525867  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/64056787034f44c73b8c863d

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64056787034f44c=
73b8c8640
        new failure (last pass: v6.2-rc1-35-g75a273974d7a)
        90 lines

    2023-03-06T04:09:24.172286  mation: non-slab/vmalloc memory
    2023-03-06T04:09:24.172627  kern  :alert : Register r1 information: non=
-paged memory
    2023-03-06T04:09:24.181279  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-06T04:09:24.181521  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-06T04:09:24.190281  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0e18000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-06T04:09:24.199371  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-06T04:09:24.208355  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-06T04:09:24.217400  kern  :alert : Register r7 information: sla=
b task_struct start c247aa80 pointer offset 0 size 2176
    2023-03-06T04:09:24.217670  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-03-06T04:09:24.226456  kern  :alert : Register r9 information: non=
-slab/vmalloc memory =

    ... (102 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64056787034f44c=
73b8c8641
        new failure (last pass: v6.2-rc1-35-g75a273974d7a)
        48 lines

    2023-03-06T04:09:24.145242  kern  :alert : 8<--- cut here ---
    2023-03-06T04:09:24.154857  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-06T04:09:24.155165  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)
    2023-03-06T04:09:24.163255  kern  :alert : Register r0 infor[    5.6323=
95] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines =
MEASUREMENT=3D48>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/64056839233ed47ca08c8643

  Results:     166 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/640=
56839233ed47ca08c8697
        new failure (last pass: v6.2-rc1-35-g75a273974d7a)

    2023-03-06T04:12:11.217571  /lava-9446785/1/../bin/lava-test-case
   =


  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/64056839233ed47ca08c86e9
        new failure (last pass: v6.2-rc1-35-g75a273974d7a)

    2023-03-06T04:12:08.358711  /lava-9446785/1/../bin/lava-test-case

    2023-03-06T04:12:08.368461  <8>[   21.397567] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/64056839233ed47ca08c86ea
        new failure (last pass: v6.2-rc1-35-g75a273974d7a)

    2023-03-06T04:12:06.312547    0

    2023-03-06T04:12:06.315903    V:       <3>[   19.343514] Bluetooth: hci=
0: Opcode 0x1002 failed: -110

    2023-03-06T04:12:06.319640       0

    2023-03-06T04:12:06.319731    Res:          0x0

    2023-03-06T04:12:06.325982  TPM<3>[   19.347507] Bluetooth: hci0: comma=
nd 0x1002 tx timeout

    2023-03-06T04:12:06.326078  2_CC_PCR_Read:

    2023-03-06T04:12:06.329120    value: 0x17E

    2023-03-06T04:12:06.329209    commandIndex: 0x17e

    2023-03-06T04:12:06.332292    reserved1:    0x0

    2023-03-06T04:12:06.336007    nv:           0
 =

    ... (89 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/64056c9c1b442ecaeb8c8636

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline=
-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline=
-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64056c9c1b442ecaeb8c8=
637
        new failure (last pass: v6.2-rc1-35-g75a273974d7a) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64056d641181b2f3fa8c867b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-b=
roonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-b=
roonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64056d641181b2f3fa8c8=
67c
        new failure (last pass: v6.2-rc1-35-g75a273974d7a) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/640564d60b0403e8d18c8649

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseli=
ne-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseli=
ne-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640564d60b0403e8d18c8=
64a
        new failure (last pass: v6.2-rc1-35-g75a273974d7a) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/640566b66d49feb40b8c864f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640566b66d49feb40b8c8=
650
        new failure (last pass: v6.2-rc1-35-g75a273974d7a) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/64056c881b442ecaeb8c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline=
-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline=
-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64056c881b442ecaeb8c8=
631
        new failure (last pass: v6.2-rc1-35-g75a273974d7a) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64056cc4cd63e2de248c8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-b=
roonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-b=
roonie/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64056cc4cd63e2de248c8=
633
        new failure (last pass: v6.2-rc1-35-g75a273974d7a) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/640564d40494bde6768c8665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseli=
ne-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseli=
ne-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640564d50494bde6768c8=
666
        new failure (last pass: v6.2-rc1-35-g75a273974d7a) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/640566b16d49feb40b8c8648

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640566b16d49feb40b8c8=
649
        new failure (last pass: v6.2-rc1-35-g75a273974d7a) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6405679a034f44c73b8c865e

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6405679a034f44c=
73b8c8661
        new failure (last pass: v6.2-rc1-35-g75a273974d7a)
        30 lines =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6405679a034f44c=
73b8c8662
        new failure (last pass: v6.2-rc1-35-g75a273974d7a)
        16 lines

    2023-03-06T04:09:54.482268  kern  :alert : 8<--- cut here ---

    2023-03-06T04:09:54.482576  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at<8>[   14.513284] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Da=
lert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>

    2023-03-06T04:09:54.482839   0xc1a50741

    2023-03-06T04:09:54.483100  kern  :alert : [c1a50741] *pgd=3D01a1141e(b=
ad)

    2023-03-06T04:09:54.483344  kern  :alert : Register r0 information: non=
-slab/vmalloc memory

    2023-03-06T04:09:54.483587  kern  :alert : Register r1 information: non=
-paged memory

    2023-03-06T04:09:54.483835  kern  :ale<8>[   14.542923] <LAVA_SIGNAL_TE=
STCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D30>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/640567b44e5be370f98c863b

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/640567b44e5be37=
0f98c863e
        new failure (last pass: v6.2-rc1-35-g75a273974d7a)
        90 lines

    2023-03-06T04:10:12.425919  kern  :alert : [c1a50741] <8>[   16.958774]=
 <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEA=
SUREMENT=3D48>

    2023-03-06T04:10:12.427139  *pgd=3D81a1141e(bad)

    2023-03-06T04:10:12.432676  kern  :alert : Register r0 information: non=
-slab/vmalloc memory

    2023-03-06T04:10:12.437905  kern  :alert : Register r1 information: non=
-paged memory

    2023-03-06T04:10:12.443184  kern  :alert : Register r2 information: non=
-slab/vmalloc memory

    2023-03-06T04:10:12.448264  kern  :alert : Register r3 information: non=
-paged memory

    2023-03-06T04:10:12.458932  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0ed4000 allocated at kernel_clone+0x8c/0x=
36c

    2023-03-06T04:10:12.465131  kern  :alert : Register r5 information: non=
-slab/vmalloc memory

    2023-03-06T04:10:12.469899  kern  :alert : Register r6 information: zer=
o-size pointer

    2023-03-06T04:10:12.478690  kern  :alert : Register r7 information: sla=
b task_struct start c2839100 pointer offset 0 size 2176
 =

    ... (101 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/640567b44e5be37=
0f98c863f
        new failure (last pass: v6.2-rc1-35-g75a273974d7a)
        48 lines

    2023-03-06T04:10:12.388835  <8>[   16.924445] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-03-06T04:10:12.408268  kern  :alert : 8<--- cut here ---

    2023-03-06T04:10:12.415437  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
   =

 =20
