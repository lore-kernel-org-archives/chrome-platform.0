Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED4820F5
	for <chrome-platform@lists.linux.dev>; Fri, 24 Mar 2023 04:51:21 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id d13so567972pjh.0
        for <chrome-platform@lists.linux.dev>; Thu, 23 Mar 2023 21:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1679633481;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ez0/JzyHWYLPX/7L7FdqPrMUoD4Aj44Jq+VKGvFF4oo=;
        b=SPdWHXDskM6116ObnMSS4HI87CGuzMlkuf7qPp59Z5hLyI6Gj9vb/Q1gebkl4lW23n
         DXlnvAeLdkEoAg0BnmVfIYFB7YRZGPVj8Monqy9Qg4bHGUtWhRSUcKDG94aVnt9djlo6
         zTNW9UtV+aHsEaekgeX3aSISHu9ukDRbtFjAaNDC99rQMIdRtcepquiNdtHyMY+zZTwY
         e+bk4KDWTyc7g7/bg43uP5jR60s3nzeArBJcHoII8p1lrrEeTL4xrwzX4wchliGnMaz7
         1YD4Ib83f3L/UBTawsvXxgatJru8Sf6SEPk+HUIz2YJTC72LhXfnx0B6Qt9lAQyaE+Ug
         7zsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679633481;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ez0/JzyHWYLPX/7L7FdqPrMUoD4Aj44Jq+VKGvFF4oo=;
        b=0QdoYobrg3+NPLsnN7j6OBTneMCX0Nk/VUs4Cu3tkyquscY3dgaQ9LW6QTl+EqdHrH
         YtdTAuwKAWpkUrVUsfThk1N0knyiJEiJ51+Ja35UgzPsNT4y7jPVQA9iQZKqLN8aHdik
         lMVtrZaNl7Q5xu9iieBN/GB/ML8IPrZvB6p3XDBKsAJWzjSB3vtAT/1ASQBQZjykk/pV
         4bOxlSleVC61+h+HoBWb6HfOltUOoBzs6SU8C0Z86RqHkGPwBnLSBt60vaSgY6QaYwbp
         OwOHx8qzf0OBlFw/YeoN8c4hycaXWatUV4MM64NrspwGQrPdF87SulDtQEIcB4vdlEOx
         PCfg==
X-Gm-Message-State: AAQBX9fbnP5zAn02mcSstJEQ14nlJykUJtj/7N8y/LmNoW505adNKchY
	hTCqhpypDgHd/tC0WPu6nQsvlQ==
X-Google-Smtp-Source: AKy350ZFnf8C4L5y64MaW98oSAkZK0fvgiwUfEySoZz+JqmaePZuF9PnXNTBu8QEsadiGqpdtiA7Sw==
X-Received: by 2002:a17:90a:498b:b0:23f:3539:d326 with SMTP id d11-20020a17090a498b00b0023f3539d326mr1582333pjh.0.1679633481030;
        Thu, 23 Mar 2023 21:51:21 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j12-20020a17090aeb0c00b00230b8431323sm2096203pjz.30.2023.03.23.21.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 21:51:20 -0700 (PDT)
Message-ID: <641d2c48.170a0220.26bfa.471d@mx.google.com>
Date: Thu, 23 Mar 2023 21:51:20 -0700 (PDT)
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
X-Kernelci-Kernel: v6.3-rc1-4-g9ce5f3b3c18e2
Subject: chrome-platform/for-kernelci baseline: 88 runs,
 32 regressions (v6.3-rc1-4-g9ce5f3b3c18e2)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 88 runs, 32 regressions (v6.3-rc1-4-=
g9ce5f3b3c18e2)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =

imx6q-sabrelite              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =

imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =

imx6sx-sdb                   | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =

imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =

imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 5          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.3-rc1-4-g9ce5f3b3c18e2/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.3-rc1-4-g9ce5f3b3c18e2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      9ce5f3b3c18e231aa58d4cf3f8a968e311d454de =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/641d21aa5be14c65349c9505

  Results:     13 PASS, 12 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline=
-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline=
-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/641d21aa5be14c6=
5349c9508
        failing since 17 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-03-24T04:05:19.851053  k<8>[   12.053483] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
    2023-03-24T04:05:19.851444  ern  :alert : Register r0 information: non-=
slab/vmalloc memory
    2023-03-24T04:05:19.851678  kern  :alert : Register r1 information: non=
-paged memory
    2023-03-24T04:05:19.852241  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-24T04:05:19.852542  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-24T04:05:19.874238  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0cb8000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-24T04:05:19.875138  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-24T04:05:19.875458  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-24T04:05:19.896196  kern  :alert : Register r7 information: sla=
b task_struct start c4c7bb80 pointer offset 0 size 2176
    2023-03-24T04:05:19.896877  kern  :alert : Register r8 information: non=
-slab/vmalloc memory =

    ... (103 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/641d21aa5be14c6=
5349c9509
        failing since 17 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-03-24T04:05:19.829340  kern  :alert : 8<--- cut here ---
    2023-03-24T04:05:19.829722  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-24T04:05:19.829924  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-sabrelite              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/641d21a196bfd3cd4f9c95bc

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseli=
ne-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseli=
ne-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/641d21a196bfd3c=
d4f9c95bf
        failing since 17 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-03-24T04:05:39.586450  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0dfc000 allocated at kernel_clone+0x8c/0x=
36c

    2023-03-24T04:05:39.587003  kern  :alert : Register r5 information: non=
-slab/vmalloc memory

    2023-03-24T04:05:39.587362  kern  :alert : Register r6 information: zer=
o-size pointer

    2023-03-24T04:05:39.587690  kern  :alert : Register r7 information: sla=
b task_struct start c3781980 pointer offset 0 size 2176

    2023-03-24T04:05:39.588012  kern  :alert : Register r8 information: non=
-slab/vmalloc memory

    2023-03-24T04:05:39.588324  kern  :alert : Register r9 information: non=
-slab/vmalloc memory

    2023-03-24T04:05:39.630072  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory

    2023-03-24T04:05:39.630623  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory

    2023-03-24T04:05:39.630991  kern  :alert : Register r12 information: NU=
LL pointer

    2023-03-24T04:05:39.631322  kern  :alert : 8<--- cut here ---
 =

    ... (101 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/641d21a196bfd3c=
d4f9c95c0
        failing since 17 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-03-24T04:05:39.543566  kern  :alert : 8<--- cut here ---

    2023-03-24T04:05:39.544116  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741

    2023-03-24T04:05:39.544480  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)

    2023-03-24T04:05:39.544810  k<8>[    8.983308] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>

    2023-03-24T04:05:39.545133  ern  :alert : Register r0 information: non-=
slab/vmalloc memory

    2023-03-24T04:05:39.545445  kern  :alert : Register r1 information: non=
-paged memory

    2023-03-24T04:05:39.545787  kern  :alert : Register r2 information: non=
-slab/vmalloc memory

    2023-03-24T04:05:39.546086  kern  :alert : Register r3 information: non=
-paged memory
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/641d21a896bfd3cd4f9c95cb

  Results:     13 PASS, 12 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline=
-imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline=
-imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/641d21a896bfd3c=
d4f9c95ce
        failing since 17 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-03-24T04:05:29.988580  k<8>[   17.152178] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
    2023-03-24T04:05:29.988993  ern  :alert : Register r0 information: non-=
slab/vmalloc memory
    2023-03-24T04:05:29.989227  kern  :alert : Register r1 information: non=
-paged memory
    2023-03-24T04:05:29.989746  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-24T04:05:29.989945  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-24T04:05:30.010475  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0d4c000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-24T04:05:30.011165  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-24T04:05:30.011385  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-24T04:05:30.032718  kern  :alert : Register r7 information: sla=
b task_struct start c215cc80 pointer offset 0 size 2176
    2023-03-24T04:05:30.033533  kern  :alert : Register r8 information: non=
-slab/vmalloc memory =

    ... (103 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/641d21a896bfd3c=
d4f9c95cf
        failing since 17 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-03-24T04:05:29.966703  kern  :alert : 8<--- cut here ---
    2023-03-24T04:05:29.967087  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-24T04:05:29.967349  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/641d21679b855f0f3d9c9525

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/base=
line-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/base=
line-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/641d21679b855f0=
f3d9c9528
        failing since 17 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-03-24T04:04:48.941329  mation: non-slab/vmalloc memory
    2023-03-24T04:04:48.941577  kern  :alert : Register r1 information: non=
-paged memory
    2023-03-24T04:04:48.950464  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-24T04:04:48.950653  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-24T04:04:48.959398  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0e14000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-24T04:04:48.968452  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-24T04:04:48.977425  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-24T04:04:48.986604  kern  :alert : Register r7 information: sla=
b task_struct start c3748000 pointer offset 0 size 2176
    2023-03-24T04:04:48.986787  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-03-24T04:04:48.995648  kern  :alert : Register r9 information: non=
-slab/vmalloc memory =

    ... (103 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/641d21679b855f0=
f3d9c9529
        failing since 17 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-03-24T04:04:48.914398  kern  :alert : 8<--- cut here ---
    2023-03-24T04:04:48.923225  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-24T04:04:48.923486  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)
    2023-03-24T04:04:48.932274  kern  :alert : Register r0 infor[    5.5599=
46] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines =
MEASUREMENT=3D48>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6sx-sdb                   | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/641d2218ff39149a649c963d

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx=
6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx=
6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/641d2218ff39149=
a649c9641
        failing since 17 days (last pass: v6.2-rc1-30-gf2fe7d2bb64e, first =
fail: v6.3-rc1)
        48 lines

    2023-03-24T04:07:26.105891  kern  :alert : 8<--- cut here ---
    2023-03-24T04:07:26.106392  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-24T04:07:26.106582  kern  :alert : [c1a50741] *pgd=3D81a1141e(b=
ad)
    2023-03-24T04:07:26.106759  kern  :alert : Register r0 infor<8>[   18.3=
24849] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlin=
es MEASUREMENT=3D48>
    2023-03-24T04:07:26.106948  mation: non-slab/vmalloc memory
    2023-03-24T04:07:26.107120  kern  :alert : Register r1 information: non=
-paged memory   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/641d2218ff39149=
a649c9642
        failing since 17 days (last pass: v6.2-rc1-30-gf2fe7d2bb64e, first =
fail: v6.3-rc1)
        90 lines

    2023-03-24T04:07:26.108121  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-24T04:07:26.172524  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-24T04:07:26.173014  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0d68000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-24T04:07:26.173213  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-24T04:07:26.173392  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-24T04:07:26.173565  kern  :alert : Register r7 information: sla=
b task_struct start c3f91100 pointer offset 0 size 2176
    2023-03-24T04:07:26.173737  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-03-24T04:07:26.174125  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
    2023-03-24T04:07:26.252187  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory
    2023-03-24T04:07:26.252721  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory =

    ... (102 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/641d220aff39149a649c957c

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx=
6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx=
6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/641d220aff39149=
a649c9580
        new failure (last pass: v6.2-rc1-8-gf9a0ae83af2e)
        48 lines

    2023-03-24T04:07:05.725872  kern  :alert : 8<--- cut here ---
    2023-03-24T04:07:05.726485  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-24T04:07:05.726793  kern  :alert : [c1a50741] *pgd=3D81a1141e(b=
ad)
    2023-03-24T04:07:05.727105  kern  :alert : Register r0 information: non=
-slab/vmalloc memory
    2023-03-24T04:07:05.747976  kern  :alert : Register r1 in<8>[   22.4008=
77] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines =
MEASUREMENT=3D48>
    2023-03-24T04:07:05.748252  formation: non-paged memory   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/641d220aff39149=
a649c9581
        new failure (last pass: v6.2-rc1-8-gf9a0ae83af2e)
        90 lines

    2023-03-24T04:07:05.749490  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-24T04:07:05.749709  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-24T04:07:05.770197  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xe0c38000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-24T04:07:05.770457  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-24T04:07:05.770674  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-24T04:07:05.784920  kern  :alert : Register r7 information: sla=
b task_struct start c7988880 pointer offset 0 size 2176
    2023-03-24T04:07:05.785930  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-03-24T04:07:05.795808  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
    2023-03-24T04:07:05.805800  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory
    2023-03-24T04:07:05.815757  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory =

    ... (105 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/641d222b00f22265159c9521

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx=
7d-sdb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx=
7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/641d222b00f2226=
5159c9525
        failing since 17 days (last pass: v6.2-rc1-32-g7ae7deb4a4b4, first =
fail: v6.3-rc1)
        48 lines

    2023-03-24T04:07:39.571427  kern  :alert : 8<--- cut here ---
    2023-03-24T04:07:39.571919  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-24T04:07:39.572440  kern  :alert : [c1a50741] *pgd=3D81a1141e(b=
ad)
    2023-03-24T04:07:39.572691  k<8>[   10.872162] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
    2023-03-24T04:07:39.572930  ern  :alert : Register r0 information: non-=
slab/vmalloc memory
    2023-03-24T04:07:39.573205  kern  :alert : Register r1 information: non=
-paged memory
    2023-03-24T04:07:39.573435  kern  :alert : Register r2 information: non=
-slab/vmalloc memory   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/641d222b00f2226=
5159c9526
        failing since 17 days (last pass: v6.2-rc1-32-g7ae7deb4a4b4, first =
fail: v6.3-rc1)
        90 lines

    2023-03-24T04:07:39.574731  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-24T04:07:39.614909  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0e28000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-24T04:07:39.615262  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-24T04:07:39.615514  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-24T04:07:39.616004  kern  :alert : Register r7 information: sla=
b task_struct start c2322200 pointer offset 0 size 2176
    2023-03-24T04:07:39.616284  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-03-24T04:07:39.616775  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
    2023-03-24T04:07:39.657619  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory
    2023-03-24T04:07:39.658037  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory
    2023-03-24T04:07:39.658553  kern  :alert : Register r12 information: NU=
LL pointer =

    ... (97 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/641d223f1b6b58fe729c9546

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx=
7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx=
7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/641d223f1b6b58f=
e729c954a
        failing since 17 days (last pass: v6.2-rc1-23-g93899a4cb7b1, first =
fail: v6.3-rc1)
        48 lines

    2023-03-24T04:08:00.049521  kern  :alert : 8<--- cut here ---
    2023-03-24T04:08:00.050027  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-24T04:08:00.050742  kern  :alert : [c1a50741] *pgd=3D61a1141e(b=
ad)
    2023-03-24T04:08:00.051104  kern  :alert : Register r0 information: non=
-slab/vmalloc memory
    2023-03-24T04:08:00.059796  kern  :alert : Register r1 information: non=
<8>[   24.578884] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail =
UNITS=3Dlines MEASUREMENT=3D48>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/641d223f1b6b58f=
e729c954b
        failing since 17 days (last pass: v6.2-rc1-23-g93899a4cb7b1, first =
fail: v6.3-rc1)
        90 lines

    2023-03-24T04:08:00.080510  -paged memory
    2023-03-24T04:08:00.081076  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-24T04:08:00.081372  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-24T04:08:00.103579  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0bdc000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-24T04:08:00.104228  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-24T04:08:00.104539  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-24T04:08:00.104842  kern  :alert : Register r7 information: sla=
b task_struct start c232b300 pointer offset 0 size 2176
    2023-03-24T04:08:00.125572  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-03-24T04:08:00.126146  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
    2023-03-24T04:08:00.126440  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory =

    ... (105 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 5          =


  Details:     https://kernelci.org/test/plan/id/641d21b196bfd3cd4f9c9619

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/arm64/defconfig/gcc-10/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/arm64/defconfig/gcc-10/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/641d21b196bfd3cd4f9c9620
        failing since 16 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-g22181069e867)

    2023-03-24T04:05:42.205759  / # #
    2023-03-24T04:05:42.308459  export SHELL=3D/bin/sh
    2023-03-24T04:05:42.309300  <6>[   22.185256] fsl_enetc 0000:00:00.6: e=
nabling device (0400 -> 0402)
    2023-03-24T04:05:42.309734  #
    2023-03-24T04:05:42.411462  / # export SHELL=3D/bin/sh. /lava-302747/en=
vironment
    2023-03-24T04:05:42.412283  =

    2023-03-24T04:05:42.514196  / # . /lava-302747/environment/lava-302747/=
bin/lava-test-runner /lava-302747/1
    2023-03-24T04:05:42.515464  =

    2023-03-24T04:05:42.529664  / # /lava-302747/bin/lava-test-runner /lava=
-302747/1
    2023-03-24T04:05:42.587681  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/641d21b196bfd3cd4f9c9624
        failing since 16 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-g22181069e867)

    2023-03-24T04:05:44.683617  /lava-302747/1/../bin/lava-test-case
    2023-03-24T04:05:44.684099  <8>[   24.707821] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-03-24T04:05:44.684442  /lava-302747/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/64=
1d21b196bfd3cd4f9c9626
        failing since 16 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-g22181069e867)

    2023-03-24T04:05:45.742331  /lava-302747/1/../bin/lava-test-case
    2023-03-24T04:05:45.742805  <8>[   25.748216] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-03-24T04:05:45.743057  /lava-302747/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/641d21b196bfd3cd4f9c962b
        failing since 16 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-g22181069e867)

    2023-03-24T04:05:46.815629  /lava-302747/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/641d21b196bfd3cd4f9c962c
        failing since 16 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-g22181069e867)

    2023-03-24T04:05:46.818292  <8>[   26.856596] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-03-24T04:05:47.875886  /lava-302747/1/../bin/lava-test-case
    2023-03-24T04:05:47.876130  <8>[   27.876773] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-03-24T04:05:47.876331  /lava-302747/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/641d2210ff39149a649c9587

  Results:     166 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/641=
d2210ff39149a649c95bd
        failing since 17 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)

    2023-03-24T04:07:30.932298  /lava-9757073/1/../bin/lava-test-case

    2023-03-24T04:07:30.942512  <8>[   23.408630] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/641d2210ff39149a649c9633
        failing since 17 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)

    2023-03-24T04:07:27.098907  <3>[   19.567939] Bluetooth: hci0: command =
0x1002 tx timeout

    2023-03-24T04:07:27.105160  <3>[   19.568130] Bluetooth: hci0: Opcode 0=
x1002 failed: -110

    2023-03-24T04:07:28.045086  /lava-9757073/1/../bin/lava-test-case

    2023-03-24T04:07:28.058524  <8>[   20.524710] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/641d2210ff39149a649c9634
        failing since 17 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)

    2023-03-24T04:07:27.020301  /lava-9757073/1/../bin/lava-test-case

    2023-03-24T04:07:27.030343  <8>[   19.496149] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/641d1e92c30765b3a19c9554

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641d1e92c30765b3a19c9=
555
        new failure (last pass: v6.3-rc1-2-gdb7df0cfaff3f) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/641d1f817541bcccf29c9517

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baselin=
e-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baselin=
e-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641d1f817541bcccf29c9=
518
        new failure (last pass: v6.3-rc1-2-gdb7df0cfaff3f) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/641d1e94c2a0c2f8eb9c951d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641d1e94c2a0c2f8eb9c9=
51e
        failing since 17 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/641d1f8249b676e4f09c951e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baselin=
e-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baselin=
e-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641d1f8249b676e4f09c9=
51f
        failing since 17 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/641d1e91c30765b3a19c952d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
broonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
broonie/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641d1e91c30765b3a19c9=
52e
        failing since 17 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/641d1f847541bcccf29c951d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baselin=
e-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baselin=
e-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641d1f847541bcccf29c9=
51e
        failing since 17 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/641d219696bfd3cd4f9c9506

  Results:     10 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseli=
ne-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-4-g9ce5f3b3c18e2/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseli=
ne-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/641d219696bfd3c=
d4f9c9509
        failing since 17 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        30 lines =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/641d219696bfd3c=
d4f9c950a
        failing since 17 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        16 lines

    2023-03-24T04:05:19.005457  kern  :alert : 8<--- cut here ---

    2023-03-24T04:05:19.005712  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at<8>[   14.927431] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Da=
lert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>

    2023-03-24T04:05:19.005889   0xc1a50741

    2023-03-24T04:05:19.006057  kern  :alert : [c1a50741] *pgd=3D01a1141e(b=
ad)

    2023-03-24T04:05:19.006222  kern  :alert : Register r0 information: non=
-slab/vmalloc memory

    2023-03-24T04:05:19.006392  kern  :alert : Register r1 information: non=
-paged memory

    2023-03-24T04:05:19.006581  kern  :ale<8>[   14.955952] <LAVA_SIGNAL_TE=
STCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D30>
   =

 =20
