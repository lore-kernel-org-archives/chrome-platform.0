Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CCF63A7
	for <chrome-platform@lists.linux.dev>; Thu,  9 Mar 2023 09:45:29 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id bo22so1567163pjb.4
        for <chrome-platform@lists.linux.dev>; Thu, 09 Mar 2023 01:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678355128;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fdlVtXZQR+fO0hyOvMovLr4f/lykQQZ+CDHdaBu6bcM=;
        b=SO73uv6dIMu3xezmkglbrn5+D4bwcqm7RRq0cpGp6pW3D76R7YTr+Vk1R9/h6lQN1W
         dR0R/Bm/vOg/rGITdDfVwQyYyFZU7/T4ErgIU7rgsqaNu6ZHIxbUKAJ7l/jwlDXSaXbh
         z1UXoqJAkv4iXVlWFbMQs3X1hYDsPT3C05/4Cq1jrLlebNz3DiJ4kuM6Z09T62QgY42O
         j6pDD8DKU5vwQzbtsLVKmndFCB3bGZR8k1oJZ6UMiz9yGF5VuZwFNg93PjBfImkKrPow
         uqq0k1Cs/vCD5d9H4FwbOvtjfz+redlYCzgxa8amghkX0zFI602IzRcjKXPA1LjssU13
         +ZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678355128;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fdlVtXZQR+fO0hyOvMovLr4f/lykQQZ+CDHdaBu6bcM=;
        b=Ki96y/k3fxJRUYOpwMPjBBm7yQsZCdjORGgx97COZK5t6XQsxiAnI/fIWO4rwWXSWr
         fnEoUkGRMJu+Clh+dTQP1LfTBvVCq0Od10sgXWNV10K7ECgcXIbthRL7/XgpbVlcyp7d
         Hr7PiNn+bN37rxmw2Yu0UhbTlAtPmDq0mAOG2XDxI0eHjPiwnEPjDmiKPoLeQ3Hwk1dF
         42k+xBECmiLGmrB11b2S93TnYUBd4rPTDZpcv82Cw3VGxmQalOrlac5mUJOucVEfN/1I
         vpRjCUBT58K+GzTHJb9EoHFfs2Hn8Jh44u8YlcDQBk9tB7RhVCVyWdA/qIzPCRqFKb0Y
         LGWA==
X-Gm-Message-State: AO0yUKVKfLn2G07aJIaeV0QvzLfegi7YAM7Jhb6q3Htx9+q06r9FmcSL
	Zv0u87dQYYgDWFgs4hZajUVLMnbwillWEXLVBj7dTzkj
X-Google-Smtp-Source: AK7set90q4tA+aWWGEbtcwBa7gmdoQn4tZu6q0lBH9TM0tRP9IcamoXZVRlRkWox1BkNEezpJbAZIA==
X-Received: by 2002:a05:6a20:9389:b0:cd:2952:7b69 with SMTP id x9-20020a056a20938900b000cd29527b69mr24603327pzh.52.1678355128363;
        Thu, 09 Mar 2023 01:45:28 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e12-20020a62aa0c000000b005e032bb1c34sm10787009pff.24.2023.03.09.01.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 01:45:27 -0800 (PST)
Message-ID: <6409aab7.620a0220.1423d.459a@mx.google.com>
Date: Thu, 09 Mar 2023 01:45:27 -0800 (PST)
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
X-Kernelci-Kernel: v6.3-rc1-2-gdb7df0cfaff3f
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 75 runs,
 27 regressions (v6.3-rc1-2-gdb7df0cfaff3f)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 75 runs, 27 regressions (v6.3-rc1-2-=
gdb7df0cfaff3f)

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
ci/kernel/v6.3-rc1-2-gdb7df0cfaff3f/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.3-rc1-2-gdb7df0cfaff3f
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      db7df0cfaff3ffe5c125f8b79bcd54a4ad163b37 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6409a15e9a34ca3f448c8630

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline=
-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline=
-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6409a15e9a34ca3=
f448c8633
        failing since 3 days (last pass: v6.2-rc1-35-g75a273974d7a, first f=
ail: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-03-09T09:05:22.746873  k<8>[   16.241986] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
    2023-03-09T09:05:22.747301  ern  :alert : Register r0 information: non-=
slab/vmalloc memory
    2023-03-09T09:05:22.747601  kern  :alert : Register r1 information: non=
-paged memory
    2023-03-09T09:05:22.747799  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-09T09:05:22.748269  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-09T09:05:22.768945  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0cb4000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-09T09:05:22.769376  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-09T09:05:22.769697  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-09T09:05:22.790846  kern  :alert : Register r7 information: sla=
b task_struct start c4cc3300 pointer offset 0 size 2176
    2023-03-09T09:05:22.791562  kern  :alert : Register r8 information: non=
-slab/vmalloc memory =

    ... (102 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6409a15e9a34ca3=
f448c8634
        failing since 3 days (last pass: v6.2-rc1-35-g75a273974d7a, first f=
ail: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-03-09T09:05:22.724840  kern  :alert : 8<--- cut here ---
    2023-03-09T09:05:22.725285  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-09T09:05:22.725598  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-sabrelite              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6409a07182f9c41bd98c863f

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseli=
ne-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseli=
ne-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6409a07182f9c41=
bd98c8642
        failing since 3 days (last pass: v6.2-rc1-35-g75a273974d7a, first f=
ail: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-03-09T09:01:19.494455  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0e1c000 allocated at kernel_clone+0x8c/0x=
36c

    2023-03-09T09:01:19.495030  kern  :alert : Register r5 information: non=
-slab/vmalloc memory

    2023-03-09T09:01:19.495503  kern  :alert : Register r6 information: zer=
o-size pointer

    2023-03-09T09:01:19.495961  kern  :alert : Register r7 information: sla=
b task_struct start c2345d80 pointer offset 0 size 2176

    2023-03-09T09:01:19.496418  kern  :alert : Register r8 information: non=
-slab/vmalloc memory

    2023-03-09T09:01:19.496837  kern  :alert : Register r9 information: non=
-slab/vmalloc memory

    2023-03-09T09:01:19.538140  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory

    2023-03-09T09:01:19.538716  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory

    2023-03-09T09:01:19.539203  kern  :alert : Register r12 information: NU=
LL pointer

    2023-03-09T09:01:19.539633  kern  :alert : 8<--- cut here ---
 =

    ... (101 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6409a07182f9c41=
bd98c8643
        failing since 3 days (last pass: v6.2-rc1-35-g75a273974d7a, first f=
ail: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-03-09T09:01:19.451123  kern  :alert : 8<--- cut here ---

    2023-03-09T09:01:19.451344  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741

    2023-03-09T09:01:19.451502  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)

    2023-03-09T09:01:19.451643  k<8>[    9.018113] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>

    2023-03-09T09:01:19.451779  ern  :alert : Register r0 information: non-=
slab/vmalloc memory

    2023-03-09T09:01:19.451910  kern  :alert : Register r1 information: non=
-paged memory

    2023-03-09T09:01:19.452034  kern  :alert : Register r2 information: non=
-slab/vmalloc memory

    2023-03-09T09:01:19.452161  kern  :alert : Register r3 information: non=
-paged memory
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6409a1245da636d8b08c86ef

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline=
-imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline=
-imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6409a1245da636d=
8b08c86f2
        failing since 3 days (last pass: v6.2-rc1-35-g75a273974d7a, first f=
ail: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-03-09T09:04:14.737635  k<8>[   12.247054] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
    2023-03-09T09:04:14.738052  ern  :alert : Register r0 information: non-=
slab/vmalloc memory
    2023-03-09T09:04:14.738283  kern  :alert : Register r1 information: non=
-paged memory
    2023-03-09T09:04:14.738885  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-09T09:04:14.739170  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-09T09:04:14.760512  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0d44000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-09T09:04:14.761234  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-09T09:04:14.761541  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-09T09:04:14.782472  kern  :alert : Register r7 information: sla=
b task_struct start c49f1980 pointer offset 0 size 2176
    2023-03-09T09:04:14.782901  kern  :alert : Register r8 information: non=
-slab/vmalloc memory =

    ... (102 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6409a1245da636d=
8b08c86f3
        failing since 3 days (last pass: v6.2-rc1-35-g75a273974d7a, first f=
ail: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-03-09T09:04:14.715907  kern  :alert : 8<--- cut here ---
    2023-03-09T09:04:14.716620  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-09T09:04:14.717138  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6409a0278c62192a448c866c

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/base=
line-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/base=
line-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6409a0278c62192=
a448c866f
        failing since 3 days (last pass: v6.2-rc1-35-g75a273974d7a, first f=
ail: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-03-09T09:00:16.297667  mation: non-slab/vmalloc memory
    2023-03-09T09:00:16.297912  kern  :alert : Register r1 information: non=
-paged memory
    2023-03-09T09:00:16.306649  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-09T09:00:16.306847  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-09T09:00:16.315589  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0e0c000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-09T09:00:16.324706  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-09T09:00:16.333980  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-09T09:00:16.342792  kern  :alert : Register r7 information: sla=
b task_struct start c33c2a80 pointer offset 0 size 2176
    2023-03-09T09:00:16.342960  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-03-09T09:00:16.351854  kern  :alert : Register r9 information: non=
-slab/vmalloc memory =

    ... (102 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6409a0278c62192=
a448c8670
        failing since 3 days (last pass: v6.2-rc1-35-g75a273974d7a, first f=
ail: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-03-09T09:00:16.270775  kern  :alert : 8<--- cut here ---
    2023-03-09T09:00:16.279589  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-09T09:00:16.279750  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)
    2023-03-09T09:00:16.288612  kern  :alert : Register r0 infor[    5.5572=
66] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines =
MEASUREMENT=3D48>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6409a09e23396aa7c38c862f

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx=
7d-sdb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx=
7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6409a09e23396aa=
7c38c8633
        failing since 3 days (last pass: v6.2-rc1-32-g7ae7deb4a4b4, first f=
ail: v6.3-rc1)
        48 lines

    2023-03-09T09:01:55.879080  kern  :alert : 8<--- cut here ---
    2023-03-09T09:01:55.879832  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-09T09:01:55.880227  kern  :alert : [c1a50741] *pgd=3D81a1141e(b=
ad)
    2023-03-09T09:01:55.880597  k<8>[   10.882419] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
    2023-03-09T09:01:55.880929  ern  :alert : Register r0 information: non-=
slab/vmalloc memory
    2023-03-09T09:01:55.881248  kern  :alert : Register r1 information: non=
-paged memory
    2023-03-09T09:01:55.881645  kern  :alert : Register r2 information: non=
-slab/vmalloc memory   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6409a09e23396aa=
7c38c8634
        failing since 3 days (last pass: v6.2-rc1-32-g7ae7deb4a4b4, first f=
ail: v6.3-rc1)
        90 lines

    2023-03-09T09:01:55.883452  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-09T09:01:55.922534  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0e64000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-09T09:01:55.922985  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-09T09:01:55.923664  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-09T09:01:55.924084  kern  :alert : Register r7 information: sla=
b task_struct start c39f5500 pointer offset 0 size 2176
    2023-03-09T09:01:55.924453  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-03-09T09:01:55.925217  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
    2023-03-09T09:01:55.965251  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory
    2023-03-09T09:01:55.966049  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory
    2023-03-09T09:01:55.966407  kern  :alert : Register r12 information: NU=
LL pointer =

    ... (100 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6409a0ab23396aa7c38c8667

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx=
7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx=
7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6409a0ab23396aa=
7c38c866b
        failing since 3 days (last pass: v6.2-rc1-23-g93899a4cb7b1, first f=
ail: v6.3-rc1)
        48 lines

    2023-03-09T09:02:17.319648  kern  :alert : 8<--- cut here ---
    2023-03-09T09:02:17.319810  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-09T09:02:17.320146  kern  :alert : [c1a50741] *pgd=3D61a1141e(b=
ad)
    2023-03-09T09:02:17.320258  kern  :alert : Register r0 information: non=
-slab/vmalloc memory
    2023-03-09T09:02:17.329466  kern  :alert : Register r1 information: non=
-<8>[   24.572589] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail=
 UNITS=3Dlines MEASUREMENT=3D48>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6409a0ab23396aa=
7c38c866c
        failing since 3 days (last pass: v6.2-rc1-23-g93899a4cb7b1, first f=
ail: v6.3-rc1)
        90 lines

    2023-03-09T09:02:17.350592  paged memory
    2023-03-09T09:02:17.350726  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-09T09:02:17.351051  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-09T09:02:17.373467  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0be0000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-09T09:02:17.373611  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-09T09:02:17.373936  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-09T09:02:17.374045  kern  :alert : Register r7 information: sla=
b task_struct start c2329100 pointer offset 0 size 2176
    2023-03-09T09:02:17.395596  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-03-09T09:02:17.395739  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
    2023-03-09T09:02:17.396083  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory =

    ... (105 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/6409a0adc489b230cb8c8632

  Results:     166 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/640=
9a0adc489b230cb8c8686
        failing since 3 days (last pass: v6.2-rc1-35-g75a273974d7a, first f=
ail: v6.3-rc1-1-gad79d30ce40d)

    2023-03-09T09:02:12.119310  /lava-9513472/1/../bin/lava-test-case

    2023-03-09T09:02:12.129386  <8>[   25.040566] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/6409a0adc489b230cb8c86d8
        failing since 3 days (last pass: v6.2-rc1-35-g75a273974d7a, first f=
ail: v6.3-rc1-1-gad79d30ce40d)

    2023-03-09T09:02:09.262707  /lava-9513472/1/../bin/lava-test-case

    2023-03-09T09:02:09.272213  <8>[   22.183919] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/6409a0adc489b230cb8c86d9
        failing since 3 days (last pass: v6.2-rc1-35-g75a273974d7a, first f=
ail: v6.3-rc1-1-gad79d30ce40d)

    2023-03-09T09:02:07.218001    reserved1:    0x0

    2023-03-09T09:02:07.218094    nv:           0

    2023-03-09T09:02:07.221054    extensive:    0

    2023-03-09T09:02:07.221138    flushed:      0

    2023-03-09T09:02:07.224231    cHandles:     0x1

    2023-03-09T09:02:07.224311    rHandle:      0

    2023-03-09T09:02:07.227464    V:            0

    2023-03-09T09:02:07.230933    Res:          0x0

    2023-03-09T09:02:07.231026  TPM2_CC_PolicyNvWritten:

    2023-03-09T09:02:07.233877    value: 0x200018F
 =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/64099fe39449fbeb3c8c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baselin=
e-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baselin=
e-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64099fe39449fbeb3c8c8=
636
        failing since 3 days (last pass: v6.2-rc1-35-g75a273974d7a, first f=
ail: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6409a263616f0b2c888c86c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6409a263616f0b2c888c8=
6c3
        failing since 3 days (last pass: v6.2-rc1-35-g75a273974d7a, first f=
ail: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/64099e2bc9765042188c8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/x86_64/x86_64_defconfig/gcc-10/lab-collabora/basel=
ine-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/x86_64/x86_64_defconfig/gcc-10/lab-collabora/basel=
ine-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64099e2bc9765042188c8=
633
        failing since 3 days (last pass: v6.2-rc1-35-g75a273974d7a, first f=
ail: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64099fcf9449fbeb3c8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64099fcf9449fbeb3c8c8=
630
        failing since 3 days (last pass: v6.2-rc1-35-g75a273974d7a, first f=
ail: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6409a06fa14867aae78c8637

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baselin=
e-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baselin=
e-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6409a06fa14867aae78c8=
638
        failing since 3 days (last pass: v6.2-rc1-35-g75a273974d7a, first f=
ail: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6409a24f5a4ec275118c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
broonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
broonie/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6409a24f5a4ec275118c8=
630
        failing since 3 days (last pass: v6.2-rc1-35-g75a273974d7a, first f=
ail: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/64099e3fc9765042188c8638

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/x86_64/x86_64_defconfig/gcc-10/lab-collabora/basel=
ine-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/x86_64/x86_64_defconfig/gcc-10/lab-collabora/basel=
ine-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64099e3fc9765042188c8=
639
        failing since 3 days (last pass: v6.2-rc1-35-g75a273974d7a, first f=
ail: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64099fa79c003e56d88c8653

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64099fa79c003e56d88c8=
654
        failing since 3 days (last pass: v6.2-rc1-35-g75a273974d7a, first f=
ail: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6409a056f91fbed67e8c86a5

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseli=
ne-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseli=
ne-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6409a056f91fbed=
67e8c86a8
        failing since 3 days (last pass: v6.2-rc1-35-g75a273974d7a, first f=
ail: v6.3-rc1-1-gad79d30ce40d)
        30 lines =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6409a056f91fbed=
67e8c86a9
        failing since 3 days (last pass: v6.2-rc1-35-g75a273974d7a, first f=
ail: v6.3-rc1-1-gad79d30ce40d)
        16 lines

    2023-03-09T09:00:58.861272  kern  :alert : 8<--- cut here ---

    2023-03-09T09:00:58.861679  kern  :alert : Unhandled faul<8>[   15.3556=
04] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines =
MEASUREMENT=3D16>

    2023-03-09T09:00:58.862020  t: alignment exception (0x001) at 0xc1a50741

    2023-03-09T09:00:58.862359  kern  :alert : [c1a50741] *pgd=3D01a1141e(b=
ad)

    2023-03-09T09:00:58.862732  kern  :alert : Register r0 information: non=
-slab/vmalloc memory

    2023-03-09T09:00:58.863063  kern  :alert : Register r1 informat<8>[   1=
5.383870] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3D=
lines MEASUREMENT=3D30>

    2023-03-09T09:00:58.863394  ion: non-paged memory
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6409a0adcc186146308c863e

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseli=
ne-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseli=
ne-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6409a0adcc18614=
6308c8641
        failing since 3 days (last pass: v6.2-rc1-35-g75a273974d7a, first f=
ail: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-03-09T09:02:11.400257  rn  :alert : [c1a50741] *pgd=3D81a1141e(bad)

    2023-03-09T09:02:11.406124  kern  :alert : Register r0 information: non=
-slab/vmalloc memory

    2023-03-09T09:02:11.411120  kern  :alert : Register r1 information: non=
-paged memory

    2023-03-09T09:02:11.416520  kern  :alert : Register r2 information: non=
-slab/vmalloc memory

    2023-03-09T09:02:11.421709  kern  :alert : Register r3 information: non=
-paged memory

    2023-03-09T09:02:11.432354  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0e70000 allocated at kernel_clone+0x8c/0x=
36c

    2023-03-09T09:02:11.438031  kern  :alert : Register r5 information: non=
-slab/vmalloc memory

    2023-03-09T09:02:11.443051  kern  :alert : Register r6 information: zer=
o-size pointer

    2023-03-09T09:02:11.451888  kern  :alert : Register r7 information: sla=
b task_struct start c2409980 pointer offset 0 size 2176

    2023-03-09T09:02:11.457319  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
 =

    ... (101 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6409a0adcc18614=
6308c8642
        failing since 3 days (last pass: v6.2-rc1-35-g75a273974d7a, first f=
ail: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-03-09T09:02:11.380952  kern  :alert : 8<--- cut here ---

    2023-03-09T09:02:11.387389  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741

    2023-03-09T09:02:11.396432  ke<8>[   16.896663] <LAVA_SIGNAL_TESTCASE T=
EST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
   =

 =20
