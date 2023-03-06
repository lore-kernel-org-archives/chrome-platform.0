Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6034320F0
	for <chrome-platform@lists.linux.dev>; Mon,  6 Mar 2023 07:53:36 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id h11-20020a17090a2ecb00b00237c740335cso8059991pjs.3
        for <chrome-platform@lists.linux.dev>; Sun, 05 Mar 2023 23:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678089216;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wkxtpBVpcmAkQGmoT/dNQighrnBuyWGon/KiNWGhqR4=;
        b=gY5+I6rjIcKq1k9+5Qy04tAEpO2vghw8NN+6LiMBxj80wxeRXe5nSBT3o+CiNwKjWX
         YMSZcrQvL0NmvqABWgxlpzaM/6qfgw5gp72rlr3BH6Gk9QvZ+O40yNjo4D7dncWin3W2
         QLNBHeQUcrg/3WIZm54ex03Vsqh6goJtTuVZBlskY2qZP4QCKgDqdAe3uD2FdHeY7jjf
         0MMASGSUGhCoeueOsZschfXaZQxySl5XKD1wUlCf4GVfrwJoI8daN2YrIUK4UAPlLSnF
         vkpoM6pTUk0A/ki6Kzdw/vKldqbLNnebV6HFfYU2UFETAlNDLOHUQ7l3C7GtmcMq32qx
         q0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678089216;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wkxtpBVpcmAkQGmoT/dNQighrnBuyWGon/KiNWGhqR4=;
        b=an9uBkeRu+PUh6V7oE/X9YrDsHf4vT43Rvz++JpQhy9iOhCAQmr8jnW/Z0s7XzC86e
         7rWm0iUyJWn7iNVtELMMyITfCoLjBQS4TtyYZMl+coikm05v3yMXKb2buE9T/L2zaHK/
         TYM7j3BwLfomecpp65H0r1t9MDbEAatXKafNixGrJNWR4XgGMHAhK7HdwLcHlGccy0iZ
         sAnkArjtxTrn7Rq/RHW1BMxCeqoa+ZEk1zqwOVZxUBRBCP90Nv5FDm7oOrip/AsvWdtD
         NHljnBjpWYDbE6cd7AKB7OyDJLLobHK5EkVeTXdjdD3WI4zMKKbHaXgZQkMfeu5FZ9Uc
         I86w==
X-Gm-Message-State: AO0yUKW9nlT7iogpBGSYWm+6o7fwI89mkEhoIz6d3QjYcdeeYyROre6C
	ntTbaV6nkPaycwyBqw3VQH2peQ==
X-Google-Smtp-Source: AK7set/5aI49IlkeK/ePXl70d/IJiQKaQIqfm2M7XX6HUktKhJ/N6UXR1CbC2ukETjEWQJpdVr758A==
X-Received: by 2002:a05:6a21:6d9f:b0:cd:a334:a531 with SMTP id wl31-20020a056a216d9f00b000cda334a531mr13184019pzb.62.1678089215480;
        Sun, 05 Mar 2023 23:53:35 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s19-20020aa78293000000b0061a829d2679sm2657105pfm.37.2023.03.05.23.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 23:53:35 -0800 (PST)
Message-ID: <64059bff.a70a0220.ec2b4.40a6@mx.google.com>
Date: Sun, 05 Mar 2023 23:53:35 -0800 (PST)
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
X-Kernelci-Kernel: v6.3-rc1
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 85 runs,
 34 regressions (v6.3-rc1)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 85 runs, 34 regressions (v6.3-rc1)

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

imx6sx-sdb                   | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =

imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
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
ci/kernel/v6.3-rc1/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.3-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      fe15c26ee26efa11741a7b632e9f23b01aca4cc6 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1043a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64059394b6365ad9798c88f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls1043a-rdb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls1043a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64059394b6365ad9798c8=
8f7
        new failure (last pass: v6.1-rc1-14-geba771858c2d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6405917c008697c72d8c8684

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-qsrb.t=
xt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-qsrb.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6405917c008697c=
72d8c8687
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-03-06T07:08:25.912578  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-06T07:08:25.912757  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-06T07:08:25.921448  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xe0cb8000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-06T07:08:25.930493  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-06T07:08:25.939522  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-06T07:08:25.948864  kern  :alert : Register r7 information: sla=
b task_struct start c2384400 pointer offset 0 size 2176
    2023-03-06T07:08:25.949167  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-03-06T07:08:25.957557  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
    2023-03-06T07:08:25.966593  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory
    2023-03-06T07:08:25.966756  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory =

    ... (103 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6405917c008697c=
72d8c8688
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-03-06T07:08:25.876633  kern  :alert : 8<--- cut here ---
    2023-03-06T07:08:25.885532  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-06T07:08:25.885742  kern  :alert : [c1a50741] *pgd=3D71a0041e(b=
ad)
    2023-03-06T07:08:25.903749  kern  :alert : Register r0 information: non=
-slab/vmalloc memory[    6.786698] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
    2023-03-06T07:08:25.903941  =

    2023-03-06T07:08:25.904065  kern  :alert : Register r1 information: non=
-paged memory   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6405916758a3ff89098c8631

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6dl-riotb=
oard.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6dl-riotb=
oard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6405916758a3ff8=
9098c8634
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-03-06T07:08:14.574077  ern  :alert : Register r0 information: non-=
slab/vmalloc memory
    2023-03-06T07:08:14.574222  kern  :alert : Register r1 information: non=
-paged memory
    2023-03-06T07:08:14.583156  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-06T07:08:14.583328  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-06T07:08:14.592053  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0cd4000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-06T07:08:14.601077  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-06T07:08:14.610152  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-06T07:08:14.619132  kern  :alert : Register r7 information: sla=
b task_struct start c33d9100 pointer offset 0 size 2176
    2023-03-06T07:08:14.619284  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-03-06T07:08:14.628252  kern  :alert : Register r9 information: non=
-slab/vmalloc memory =

    ... (102 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6405916758a3ff8=
9098c8635
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-03-06T07:08:14.547018  kern  :alert : 8<--- cut here ---
    2023-03-06T07:08:14.555973  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-06T07:08:14.556296  kern  :alert : [c1a50741] *pgd=3D11a0041e(b=
ad)
    2023-03-06T07:08:14.565002  k[    6.771952] <LAVA_SIGNAL_TESTCASE TEST_=
CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6405918a934b5152578c8687

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6405918a934b515=
2578c868a
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-03-06T07:08:53.275532  k<8>[   16.630405] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
    2023-03-06T07:08:53.275849  ern  :alert : Register r0 information: non-=
slab/vmalloc memory
    2023-03-06T07:08:53.276010  kern  :alert : Register r1 information: non=
-paged memory
    2023-03-06T07:08:53.276555  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-06T07:08:53.276922  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-06T07:08:53.297526  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0cf0000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-06T07:08:53.298149  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-06T07:08:53.298417  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-06T07:08:53.319583  kern  :alert : Register r7 information: sla=
b task_struct start c4ca9980 pointer offset 0 size 2176
    2023-03-06T07:08:53.320207  kern  :alert : Register r8 information: non=
-slab/vmalloc memory =

    ... (103 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6405918a934b515=
2578c868b
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-03-06T07:08:53.252579  kern  :alert : 8<--- cut here ---
    2023-03-06T07:08:53.253378  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-06T07:08:53.253773  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-sabrelite              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6405919c934b5152578c869e

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-imx6q-sabrelit=
e.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-imx6q-sabrelit=
e.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6405919c934b515=
2578c86a1
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-03-06T07:08:58.988229  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0db8000 allocated at kernel_clone+0x8c/0x=
36c

    2023-03-06T07:08:58.988830  kern  :alert : Register r5 information: non=
-slab/vmalloc memory

    2023-03-06T07:08:58.989226  kern  :alert : Register r6 information: zer=
o-size pointer

    2023-03-06T07:08:58.989595  kern  :alert : Register r7 information: sla=
b task_struct start c3770880 pointer offset 0 size 2176

    2023-03-06T07:08:58.989955  kern  :alert : Register r8 information: non=
-slab/vmalloc memory

    2023-03-06T07:08:58.990298  kern  :alert : Register r9 information: non=
-slab/vmalloc memory

    2023-03-06T07:08:59.031288  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory

    2023-03-06T07:08:59.031893  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory

    2023-03-06T07:08:59.032301  kern  :alert : Register r12 information: NU=
LL pointer

    2023-03-06T07:08:59.032669  kern  :alert : 8<--- cut here ---
 =

    ... (101 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6405919c934b515=
2578c86a2
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-03-06T07:08:58.945485  kern  :alert : 8<--- cut here ---

    2023-03-06T07:08:58.946086  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741

    2023-03-06T07:08:58.946489  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)

    2023-03-06T07:08:58.946902  k<8>[    8.967727] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>

    2023-03-06T07:08:58.947330  ern  :alert : Register r0 information: non-=
slab/vmalloc memory

    2023-03-06T07:08:58.947690  kern  :alert : Register r1 information: non=
-paged memory

    2023-03-06T07:08:58.948036  kern  :alert : Register r2 information: non=
-slab/vmalloc memory

    2023-03-06T07:08:58.948370  kern  :alert : Register r3 information: non=
-paged memory
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6405919e4fe34b43418c8655

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6405919e4fe34b4=
3418c8658
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-03-06T07:09:00.163034  k<8>[   12.118606] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
    2023-03-06T07:09:00.163553  ern  :alert : Register r0 information: non-=
slab/vmalloc memory
    2023-03-06T07:09:00.163761  kern  :alert : Register r1 information: non=
-paged memory
    2023-03-06T07:09:00.163950  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-06T07:09:00.164131  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-06T07:09:00.184997  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0d40000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-06T07:09:00.185514  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-06T07:09:00.185724  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-06T07:09:00.206990  kern  :alert : Register r7 information: sla=
b task_struct start c4a91980 pointer offset 0 size 2176
    2023-03-06T07:09:00.207503  kern  :alert : Register r8 information: non=
-slab/vmalloc memory =

    ... (102 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6405919e4fe34b4=
3418c8659
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-03-06T07:09:00.139766  kern  :alert : 8<--- cut here ---
    2023-03-06T07:09:00.140145  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-06T07:09:00.140352  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6405917b1d06ecd0a68c863d

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6qp-wandb=
oard-revd1.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6qp-wandb=
oard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6405917b1d06ecd=
0a68c8640
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-03-06T07:08:27.782739  mation: non-slab/vmalloc memory
    2023-03-06T07:08:27.782966  kern  :alert : Register r1 information: non=
-paged memory
    2023-03-06T07:08:27.791718  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-06T07:08:27.792006  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-06T07:08:27.800854  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0e04000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-06T07:08:27.809863  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-06T07:08:27.818822  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-06T07:08:27.827861  kern  :alert : Register r7 information: sla=
b task_struct start c34c2200 pointer offset 0 size 2176
    2023-03-06T07:08:27.828229  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-03-06T07:08:27.836797  kern  :alert : Register r9 information: non=
-slab/vmalloc memory =

    ... (102 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6405917b1d06ecd=
0a68c8641
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-03-06T07:08:27.755806  kern  :alert : 8<--- cut here ---
    2023-03-06T07:08:27.764756  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-06T07:08:27.765098  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)
    2023-03-06T07:08:27.773917  kern  :alert : Register r0 infor[    5.5933=
98] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines =
MEASUREMENT=3D48>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6sx-sdb                   | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6405924855609e4f018c866d

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6405924855609e4=
f018c8671
        new failure (last pass: v6.2-rc1-30-gf2fe7d2bb64e)
        48 lines

    2023-03-06T07:11:38.488751  kern  :alert : 8<--- cut here ---
    2023-03-06T07:11:38.489218  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-06T07:11:38.489355  kern  :alert : [c1a50741] *pgd=3D81a1141e(b=
ad)
    2023-03-06T07:11:38.489499  kern  :alert : Register r0 infor<8>[   17.3=
33123] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlin=
es MEASUREMENT=3D48>
    2023-03-06T07:11:38.489636  mation: non-slab/vmalloc memory
    2023-03-06T07:11:38.489768  kern  :alert : Register r1 information: non=
-paged memory   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6405924855609e4=
f018c8672
        new failure (last pass: v6.2-rc1-30-gf2fe7d2bb64e)
        90 lines

    2023-03-06T07:11:38.490533  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-06T07:11:38.554970  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-06T07:11:38.555384  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0d58000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-06T07:11:38.555508  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-06T07:11:38.555639  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-06T07:11:38.555767  kern  :alert : Register r7 information: sla=
b task_struct start c3f90000 pointer offset 0 size 2176
    2023-03-06T07:11:38.555894  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-03-06T07:11:38.556364  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
    2023-03-06T07:11:38.634828  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory
    2023-03-06T07:11:38.635327  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory =

    ... (102 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6405922f13954a7fc58c862f

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6405922f13954a7=
fc58c8633
        new failure (last pass: v6.2-rc1-32-g7ae7deb4a4b4)
        48 lines

    2023-03-06T07:11:20.876594  kern  :alert : 8<--- cut here ---
    2023-03-06T07:11:20.877209  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-06T07:11:20.877474  kern  :alert : [c1a50741] *pgd=3D81a1141e(b=
ad)
    2023-03-06T07:11:20.877713  k<8>[   10.849226] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
    2023-03-06T07:11:20.877906  ern  :alert : Register r0 information: non-=
slab/vmalloc memory
    2023-03-06T07:11:20.878091  kern  :alert : Register r1 information: non=
-paged memory
    2023-03-06T07:11:20.878275  kern  :alert : Register r2 information: non=
-slab/vmalloc memory   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6405922f13954a7=
fc58c8634
        new failure (last pass: v6.2-rc1-32-g7ae7deb4a4b4)
        90 lines

    2023-03-06T07:11:20.879381  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-06T07:11:20.919881  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0e44000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-06T07:11:20.920144  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-06T07:11:20.920343  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-06T07:11:20.920784  kern  :alert : Register r7 information: sla=
b task_struct start c3a3aa80 pointer offset 0 size 2176
    2023-03-06T07:11:20.921010  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-03-06T07:11:20.921478  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
    2023-03-06T07:11:20.962665  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory
    2023-03-06T07:11:20.962956  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory
    2023-03-06T07:11:20.963447  kern  :alert : Register r12 information: NU=
LL pointer =

    ... (97 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6405924455609e4f018c8662

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6405924455609e4=
f018c8666
        new failure (last pass: v6.2-rc1-23-g93899a4cb7b1)
        48 lines

    2023-03-06T07:11:31.157814  kern  :alert : 8<--- cut here ---
    2023-03-06T07:11:31.158671  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-06T07:11:31.159056  kern  :alert : [c1a50741] *pgd=3D61a1141e(b=
ad)
    2023-03-06T07:11:31.159314  kern  :alert : Register r0 information: non=
-slab/vmalloc memory
    2023-03-06T07:11:31.167659  kern  :alert : Register r1 informati<8>[   =
24.578386] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D48>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6405924455609e4=
f018c8667
        new failure (last pass: v6.2-rc1-23-g93899a4cb7b1)
        90 lines

    2023-03-06T07:11:31.188640  on: non-paged memory
    2023-03-06T07:11:31.188945  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-06T07:11:31.189459  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-06T07:11:31.210508  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0be8000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-06T07:11:31.210723  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-06T07:11:31.210859  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-06T07:11:31.211225  kern  :alert : Register r7 information: sla=
b task_struct start c232dd80 pointer offset 0 size 2176
    2023-03-06T07:11:31.232513  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-03-06T07:11:31.232691  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
    2023-03-06T07:11:31.233024  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory =

    ... (104 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/6405925255609e4f018c8678

  Results:     166 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt81=
83-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt81=
83-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/640=
5925255609e4f018c86cc
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)

    2023-03-06T07:11:49.129082  /lava-9447853/1/../bin/lava-test-case

    2023-03-06T07:11:49.138755  <8>[   24.511889] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/6405925255609e4f018c871e
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)

    2023-03-06T07:11:46.245765  /lava-9447853/1/../bin/lava-test-case

    2023-03-06T07:11:46.255728  <8>[   21.628506] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/6405925255609e4f018c871f
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)

    2023-03-06T07:11:44.198010  <8>[   19.568477] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-topckgen-probed RESULT=3Dpass>

    2023-03-06T07:11:44.198553    value: 0x17E

    2023-03-06T07:11:44.201484    commandIndex: 0x17e

    2023-03-06T07:11:44.202082    reserved1:    0x0

    2023-03-06T07:11:44.204428    nv:           0

    2023-03-06T07:11:44.204917    extensive:    0

    2023-03-06T07:11:44.208178    flushed:      0

    2023-03-06T07:11:44.208667    cHandles:     0x0

    2023-03-06T07:11:44.211074    rHandle:      0

    2023-03-06T07:11:44.211587    V:            0
 =

    ... (84 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/64058f01d0f6cfcdc38c863f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uef=
i.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uef=
i.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64058f01d0f6cfcdc38c8=
640
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/640590a6c56cc128888c869d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-=
qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-=
qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640590a6c56cc128888c8=
69e
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/64058ee4d0f6cfcdc38c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-u=
efi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64058ee4d0f6cfcdc38c8=
630
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/640590ace5968cd9ec8c8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640590ace5968cd9ec8c8=
633
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/64058f03c12a1952c78c8648

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uef=
i-mixed.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uef=
i-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64058f03c12a1952c78c8=
649
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/640590a732020aed998c863b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-=
qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-=
qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640590a732020aed998c8=
63c
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/64058ee5c12a1952c78c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-u=
efi-mixed.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-u=
efi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64058ee5c12a1952c78c8=
630
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/640590ad2cbb0e5bbb8c8651

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640590ad2cbb0e5bbb8c8=
652
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/64059199934b5152578c8693

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-rock2-s=
quare.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-rock2-s=
quare.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64059199934b515=
2578c8696
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        30 lines =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64059199934b515=
2578c8697
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        16 lines

    2023-03-06T07:08:56.257319  kern  :alert : 8<--- cut here ---

    2023-03-06T07:08:56.257584  kern  :alert : Unhandled faul<8>[   13.7562=
40] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines =
MEASUREMENT=3D16>

    2023-03-06T07:08:56.257830  t: alignment exception (0x001) at 0xc1a50741

    2023-03-06T07:08:56.258065  kern  :alert : [c1a50741] *pgd=3D01a1141e(b=
ad)

    2023-03-06T07:08:56.258298  kern  :alert : Register r0 information: non=
-slab/vmalloc memory

    2023-03-06T07:08:56.258531  kern  :alert : Register r1 informat<8>[   1=
3.782768] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3D=
lines MEASUREMENT=3D30>

    2023-03-06T07:08:56.258849  ion: non-paged memory
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/640591abcfdc6fbcce8c8630

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-tegra124-nyan-=
big.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-tegra124-nyan-=
big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/640591abcfdc6fb=
cce8c8633
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-03-06T07:09:10.288217  rn  :alert : [c1a50741] *pgd=3D81a1141e(bad)

    2023-03-06T07:09:10.293705  kern  :alert : Register r0 information: non=
-slab/vmalloc memory

    2023-03-06T07:09:10.299014  kern  :alert : Register r1 information: non=
-paged memory

    2023-03-06T07:09:10.304560  kern  :alert : Register r2 information: non=
-slab/vmalloc memory

    2023-03-06T07:09:10.309639  kern  :alert : Register r3 information: non=
-paged memory

    2023-03-06T07:09:10.320240  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0edc000 allocated at kernel_clone+0x8c/0x=
36c

    2023-03-06T07:09:10.325558  kern  :alert : Register r5 information: non=
-slab/vmalloc memory

    2023-03-06T07:09:10.330882  kern  :alert : Register r6 information: zer=
o-size pointer

    2023-03-06T07:09:10.339572  kern  :alert : Register r7 information: sla=
b task_struct start c38ab300 pointer offset 0 size 2176

    2023-03-06T07:09:10.345024  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
 =

    ... (99 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/640591abcfdc6fb=
cce8c8634
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-03-06T07:09:10.253106  <8>[   16.785703] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-03-06T07:09:10.269299  kern  :alert : 8<--- cut here ---

    2023-03-06T07:09:10.275622  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741

    2023-03-06T07:09:10.284272  ke<8>[   16.815051] <LAVA_SIGNAL_TESTCASE T=
EST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
   =

 =20
