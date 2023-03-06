Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FBE3C02
	for <chrome-platform@lists.linux.dev>; Mon,  6 Mar 2023 11:58:20 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id u5so9981047plq.7
        for <chrome-platform@lists.linux.dev>; Mon, 06 Mar 2023 03:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678103900;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fLfGRVP/hgwEJKRFxpcfqClpeB/xw71B+C4O6KheDj0=;
        b=oikPOk9W6NuAuw8uXaEJpiufzreiElgDj45NeWF0uJ33lLds16DMItlqyEYJjuIf6O
         g3ZkHKAsvJbBA2cca3jbp+XMRl4NA57v/fhSF9aR3o6u0vep3bMXGbMcsuLvXFuoXvg6
         oyP4MzCua/Co4kWchWBeWNRKI/mOywIySE9nHqoucbYfqz45NmopQk7dig+NR+JQ8WlI
         K38p6cGzBK3r2JO96+CRoqdv4DlBeCwV/CurmX1sbFvMl2dFRYe/cjMSnig/Gd+PBB1l
         U9WqC+OQ0UuJ7RgzA76QP6nO6b2brGK8ucRpKOwat57kKcZ7Ah0Mi1t/a48xx/rEJJ5i
         m0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678103900;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fLfGRVP/hgwEJKRFxpcfqClpeB/xw71B+C4O6KheDj0=;
        b=El+uuyD/cRR0RYlreLZjm4F/VH7LvkmlfikXQZchaRjGAc799PguR+UutEYJ/j+BY0
         JjKoZByhpL40GxtXfRkYwL1Wr1U+FgOWcniSWFf/t32g6gR8C3K0T8ekZEznNsDd3xRJ
         bCtZCzqlLcuAQTn+0N7dtUav9Ly7yVxDcYKZJkzpgaURVJiIZzTQeWxqfVKMTsd69OIW
         VE2w34k6+MOi49OxQIDmLeXEBC5FSa7oSXTSmhTg2SDHFIvjAmK+soq0XxbjQYb/Bq1Q
         3Q6VlNSzbpU33aJ3pBgJFlrajCcTIzZzCWJkWing0RL5FOrivRnRnEud1GumMgBOyMTm
         dk+w==
X-Gm-Message-State: AO0yUKWI3Vna2CGZXLTPGbUYkU9U9l/LVUap2j7JL0HXwJVgEd56UYKh
	tAgPGj6oelqsKyWxfEA0fPMbvXvwdlGmT9SRGI+0NEW2
X-Google-Smtp-Source: AK7set8R85EcLkfES3PVhlfa+QM2n0yhelcxJ47rnx1nXWrY3VEhwIUECBbSsoyjLbAWvvg+oy2oZg==
X-Received: by 2002:a05:6a20:c11f:b0:cc:32a8:69ae with SMTP id bh31-20020a056a20c11f00b000cc32a869aemr9449172pzb.40.1678103899386;
        Mon, 06 Mar 2023 03:58:19 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n4-20020a62e504000000b005a79596c795sm6151215pff.29.2023.03.06.03.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 03:58:19 -0800 (PST)
Message-ID: <6405d55b.620a0220.dbf1e.a61c@mx.google.com>
Date: Mon, 06 Mar 2023 03:58:19 -0800 (PST)
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
X-Kernelci-Kernel: v6.3-rc1-1-g18cc5124a241
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 69 runs,
 31 regressions (v6.3-rc1-1-g18cc5124a241)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 69 runs, 31 regressions (v6.3-rc1-1-=
g18cc5124a241)

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

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 3          =

tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.3-rc1-1-g18cc5124a241/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.3-rc1-1-g18cc5124a241
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      18cc5124a2417b94cb8402963c67b492210b3d38 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1043a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6405ce28c6beba452f8c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls1043a=
-rdb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls1043a=
-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405ce28c6beba452f8c8=
63f
        failing since 0 day (last pass: v6.1-rc1-14-geba771858c2d, first fa=
il: v6.3-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6405c78d5bda6781198c8664

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6405c78d5bda678=
1198c8667
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-03-06T10:59:03.301266  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-06T10:59:03.301489  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-06T10:59:03.310209  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xe0cb8000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-06T10:59:03.319479  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-06T10:59:03.328454  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-06T10:59:03.337235  kern  :alert : Register r7 information: sla=
b task_struct start c2386e80 pointer offset 0 size 2176
    2023-03-06T10:59:03.337485  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-03-06T10:59:03.346471  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
    2023-03-06T10:59:03.355366  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory
    2023-03-06T10:59:03.355748  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory =

    ... (105 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6405c78d5bda678=
1198c8668
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-03-06T10:59:03.265040  kern  :alert : 8<--- cut here ---
    2023-03-06T10:59:03.274126  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-06T10:59:03.274512  kern  :alert : [c1a50741] *pgd=3D71a0041e(b=
ad)
    2023-03-06T10:59:03.283453  kern  :alert : Register r0 information: non=
-slab/vmalloc memory
    2023-03-06T10:59:03.293262  kern  :alert : Register r1 in[    6.798429]=
 <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEA=
SUREMENT=3D48>
    2023-03-06T10:59:03.293582  formation: non-paged memory   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6405c78c9d5a0128508c862f

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6405c78c9d5a012=
8508c8632
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-03-06T10:59:02.267042  ern  :alert : Register r0 information: non-=
slab/vmalloc memory
    2023-03-06T10:59:02.267210  kern  :alert : Register r1 information: non=
-paged memory
    2023-03-06T10:59:02.275906  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-06T10:59:02.276059  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-06T10:59:02.284974  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0cd4000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-06T10:59:02.294023  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-06T10:59:02.303021  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-06T10:59:02.312238  kern  :alert : Register r7 information: sla=
b task_struct start c33d9100 pointer offset 0 size 2176
    2023-03-06T10:59:02.312404  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-03-06T10:59:02.321216  kern  :alert : Register r9 information: non=
-slab/vmalloc memory =

    ... (100 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6405c78c9d5a012=
8508c8633
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-03-06T10:59:02.239908  kern  :alert : 8<--- cut here ---
    2023-03-06T10:59:02.248786  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-06T10:59:02.248975  kern  :alert : [c1a50741] *pgd=3D11a0041e(b=
ad)
    2023-03-06T10:59:02.257880  k[    6.797292] <LAVA_SIGNAL_TESTCASE TEST_=
CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6405c96bfaff3fb1b68c8639

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-=
imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-=
imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6405c96bfaff3fb=
1b68c863c
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-03-06T11:07:03.436766  k<8>[   16.505171] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
    2023-03-06T11:07:03.457051  ern  :alert : Register r0 information: non-=
slab/vmalloc memory
    2023-03-06T11:07:03.457574  kern  :alert : Register r1 information: non=
-paged memory
    2023-03-06T11:07:03.457788  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-06T11:07:03.458066  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-06T11:07:03.479095  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0cec000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-06T11:07:03.479607  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-06T11:07:03.479822  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-06T11:07:03.500964  kern  :alert : Register r7 information: sla=
b task_struct start c4d4bb80 pointer offset 0 size 2176
    2023-03-06T11:07:03.501479  kern  :alert : Register r8 information: non=
-slab/vmalloc memory =

    ... (103 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6405c96cfaff3fb=
1b68c863d
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-03-06T11:07:03.434000  kern  :alert : 8<--- cut here ---
    2023-03-06T11:07:03.434510  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-06T11:07:03.434715  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-sabrelite              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6405c7993e0da1e10c8c862f

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6405c7993e0da1e=
10c8c8632
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-03-06T10:59:24.355881  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0e0c000 allocated at kernel_clone+0x8c/0x=
36c

    2023-03-06T10:59:24.355973  kern  :alert : Register r5 information: non=
-slab/vmalloc memory

    2023-03-06T10:59:24.356045  kern  :alert : Register r6 information: zer=
o-size pointer

    2023-03-06T10:59:24.356110  kern  :alert : Register r7 information: sla=
b task_struct start c2343300 pointer offset 0 size 2176

    2023-03-06T10:59:24.356173  kern  :alert : Register r8 information: non=
-slab/vmalloc memory

    2023-03-06T10:59:24.356235  kern  :alert : Register r9 information: non=
-slab/vmalloc memory

    2023-03-06T10:59:24.398980  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory

    2023-03-06T10:59:24.399079  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory

    2023-03-06T10:59:24.399186  kern  :alert : Register r12 information: NU=
LL pointer

    2023-03-06T10:59:24.399281  kern  :alert : 8<--- cut here ---
 =

    ... (101 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6405c7993e0da1e=
10c8c8633
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-03-06T10:59:24.312833  kern  :alert : 8<--- cut here ---

    2023-03-06T10:59:24.312935  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741

    2023-03-06T10:59:24.313009  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)

    2023-03-06T10:59:24.313077  k<8>[    8.985982] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>

    2023-03-06T10:59:24.313143  ern  :alert : Register r0 information: non-=
slab/vmalloc memory

    2023-03-06T10:59:24.313206  kern  :alert : Register r1 information: non=
-paged memory

    2023-03-06T10:59:24.313268  kern  :alert : Register r2 information: non=
-slab/vmalloc memory

    2023-03-06T10:59:24.313328  kern  :alert : Register r3 information: non=
-paged memory
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6405c94360fae874938c862f

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-=
imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-=
imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6405c94360fae87=
4938c8632
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-03-06T11:06:37.358010  kern  :alert : Register r0 information: non=
-slab/vmalloc memory
    2023-03-06T11:06:37.358416  kern  :alert : Register r1 information: non=
-paged memory
    2023-03-06T11:06:37.358624  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-06T11:06:37.359063  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-06T11:06:37.380269  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0d70000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-06T11:06:37.380741  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-06T11:06:37.380966  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-06T11:06:37.402293  kern  :alert : Register r7 information: sla=
b task_struct start c4cb9980 pointer offset 0 size 2176
    2023-03-06T11:06:37.402830  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-03-06T11:06:37.403111  kern  :alert : Register r9 information: non=
-slab/vmalloc memory =

    ... (101 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6405c94360fae87=
4938c8633
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-03-06T11:06:37.336011  kern  :alert : 8<--- cut here ---
    2023-03-06T11:06:37.336395  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-06T11:06:37.336870  kern  :alert : [<8>[   16.745204] <LAVA_SIG=
NAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D48>
    2023-03-06T11:06:37.337144  c1a50741] *pgd=3D11a1141e(bad)   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6405c78e9d5a0128508c863e

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6405c78e9d5a012=
8508c8641
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-03-06T10:59:04.808608  mation: non-slab/vmalloc memory
    2023-03-06T10:59:04.808739  kern  :alert : Register r1 information: non=
-paged memory
    2023-03-06T10:59:04.817873  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-06T10:59:04.818272  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-06T10:59:04.826755  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0e10000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-06T10:59:04.835727  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-06T10:59:04.844832  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-06T10:59:04.853799  kern  :alert : Register r7 information: sla=
b task_struct start c372a200 pointer offset 0 size 2176
    2023-03-06T10:59:04.853986  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-03-06T10:59:04.862802  kern  :alert : Register r9 information: non=
-slab/vmalloc memory =

    ... (103 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6405c78e9d5a012=
8508c8642
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-03-06T10:59:04.781603  kern  :alert : 8<--- cut here ---
    2023-03-06T10:59:04.790585  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-06T10:59:04.790762  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)
    2023-03-06T10:59:04.799784  kern  :alert : Register r0 infor[    5.5405=
37] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines =
MEASUREMENT=3D48>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6sx-sdb                   | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6405c7e5df633d0dce8c8697

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6=
sx-sdb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6=
sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6405c7e5df633d0=
dce8c869b
        failing since 0 day (last pass: v6.2-rc1-30-gf2fe7d2bb64e, first fa=
il: v6.3-rc1)
        48 lines

    2023-03-06T11:00:29.283299  kern  :alert : 8<--- cut here ---
    2023-03-06T11:00:29.283604  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-06T11:00:29.284108  kern  :alert : [c1a50741] *pgd=3D81a1141e(b=
ad)
    2023-03-06T11:00:29.284355  kern  :alert : Register r0 infor<8>[   17.3=
38384] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlin=
es MEASUREMENT=3D48>
    2023-03-06T11:00:29.284596  mation: non-slab/vmalloc memory
    2023-03-06T11:00:29.284827  kern  :alert : Register r1 information: non=
-paged memory   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6405c7e5df633d0=
dce8c869c
        failing since 0 day (last pass: v6.2-rc1-30-gf2fe7d2bb64e, first fa=
il: v6.3-rc1)
        90 lines

    2023-03-06T11:00:29.286128  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-06T11:00:29.350820  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-06T11:00:29.351559  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0d60000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-06T11:00:29.351827  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-06T11:00:29.352072  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-06T11:00:29.352310  kern  :alert : Register r7 information: sla=
b task_struct start c3f91980 pointer offset 0 size 2176
    2023-03-06T11:00:29.352560  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-03-06T11:00:29.353061  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
    2023-03-06T11:00:29.430540  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory
    2023-03-06T11:00:29.431016  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory =

    ... (101 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6405c7e011ab394b2e8c8635

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7=
d-sdb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7=
d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6405c7e011ab394=
b2e8c8639
        failing since 0 day (last pass: v6.2-rc1-32-g7ae7deb4a4b4, first fa=
il: v6.3-rc1)
        48 lines

    2023-03-06T11:00:00.477120  kern  :alert : 8<--- cut here ---
    2023-03-06T11:00:00.477371  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-06T11:00:00.477518  kern  :alert : [c1a50741] *pgd=3D81a1141e(b=
ad)
    2023-03-06T11:00:00.477868  kern  :alert : Register r0 infor<8>[   10.8=
34729] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlin=
es MEASUREMENT=3D48>
    2023-03-06T11:00:00.477998  mation: non-slab/vmalloc memory
    2023-03-06T11:00:00.478117  kern  :alert : Register r1 information: non=
-paged memory
    2023-03-06T11:00:00.478246  kern  :alert : Register r2 information: non=
-slab/vmalloc memory   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6405c7e011ab394=
b2e8c863a
        failing since 0 day (last pass: v6.2-rc1-32-g7ae7deb4a4b4, first fa=
il: v6.3-rc1)
        90 lines

    2023-03-06T11:00:00.479027  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-06T11:00:00.520357  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0e64000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-06T11:00:00.520840  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-06T11:00:00.520980  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-06T11:00:00.521095  kern  :alert : Register r7 information: sla=
b task_struct start c3a42200 pointer offset 0 size 2176
    2023-03-06T11:00:00.521206  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-03-06T11:00:00.521651  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
    2023-03-06T11:00:00.563259  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory
    2023-03-06T11:00:00.563502  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory
    2023-03-06T11:00:00.563837  kern  :alert : Register r12 information: NU=
LL pointer =

    ... (97 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6405c7f97c3f43deb18c862f

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7=
ulp-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7=
ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6405c7fa7c3f43d=
eb18c8633
        failing since 0 day (last pass: v6.2-rc1-23-g93899a4cb7b1, first fa=
il: v6.3-rc1)
        48 lines

    2023-03-06T11:00:40.132962  kern  :alert : 8<--- cut here ---
    2023-03-06T11:00:40.133108  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-03-06T11:00:40.133404  kern  :alert : [c1a50741] *pgd=3D61a1141e(b=
ad)
    2023-03-06T11:00:40.133506  kern  :alert : Register r0 information: non=
-slab/vmalloc memory
    2023-03-06T11:00:40.143321  kern  :alert : Register r1 information: non=
<8>[   24.583502] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail =
UNITS=3Dlines MEASUREMENT=3D48>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6405c7fa7c3f43d=
eb18c8634
        failing since 0 day (last pass: v6.2-rc1-23-g93899a4cb7b1, first fa=
il: v6.3-rc1)
        90 lines

    2023-03-06T11:00:40.164943  -paged memory
    2023-03-06T11:00:40.165109  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-06T11:00:40.165403  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-06T11:00:40.186956  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0be8000 allocated at kernel_clone+0x8c/0x=
36c
    2023-03-06T11:00:40.187131  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-06T11:00:40.187424  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-03-06T11:00:40.187525  kern  :alert : Register r7 information: sla=
b task_struct start c232cc80 pointer offset 0 size 2176
    2023-03-06T11:00:40.208957  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-03-06T11:00:40.209123  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
    2023-03-06T11:00:40.209417  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory =

    ... (104 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/6405cb7983f458c8648c8639

  Results:     166 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/640=
5cb7983f458c8648c868d
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)

    2023-03-06T11:15:39.595621  /lava-9450703/1/../bin/lava-test-case

    2023-03-06T11:15:39.606021  <8>[   24.535902] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/6405cb7983f458c8648c86df
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)

    2023-03-06T11:15:36.707118  /lava-9450703/1/../bin/lava-test-case

    2023-03-06T11:15:36.717330  <8>[   21.647034] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/6405cb7983f458c8648c86e0
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)

    2023-03-06T11:15:34.661375    commandIndex: 0x17e

    2023-03-06T11:15:34.661449    reserved1:    0x0

    2023-03-06T11:15:34.665050    nv:           0

    2023-03-06T11:15:34.665124    extensive:    0

    2023-03-06T11:15:34.668541    flushed:      0

    2023-03-06T11:15:34.668613    cHandles:     0x0

    2023-03-06T11:15:34.671496    rHandle:      0

    2023-03-06T11:15:34.671571    V:            0

    2023-03-06T11:15:34.674803    Res:          0x0

    2023-03-06T11:15:34.674876  TPM2_CC_PolicyPCR:
 =

    ... (82 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6405c878e6404bd6268c8655

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline=
-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline=
-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405c878e6404bd6268c8=
656
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6405c9dfe0f876b7748c8666

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-b=
roonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-b=
roonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405c9dfe0f876b7748c8=
667
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6405c95360fae874938c8662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline=
-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline=
-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405c95360fae874938c8=
663
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6405c9e08e32e421748c8771

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-b=
roonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-b=
roonie/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405c9e08e32e421748c8=
772
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 3          =


  Details:     https://kernelci.org/test/plan/id/6405c7979d5a0128508c864d

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6405c7979d5a012=
8508c8650
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        60 lines

    2023-03-06T10:59:23.110101  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0d54000 allocated at kernel_clone+0x8c/0x=
36c

    2023-03-06T10:59:23.110339  kern  :alert : Register r5 information: non=
-slab/vmalloc memory

    2023-03-06T10:59:23.110628  kern  :alert : Register r6 information: zer=
o-size pointer

    2023-03-06T10:59:23.111024  kern  :alert : Register r7 information: sla=
b task_struct start c2222200 pointer offset 0 size 2176

    2023-03-06T10:59:23.111467  kern  :alert : Register r8 information: non=
-slab/vmalloc memory

    2023-03-06T10:59:23.111784  kern  :alert : Register r9 information: non=
-slab/vmalloc memory

    2023-03-06T10:59:23.158828  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory

    2023-03-06T10:59:23.159344  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory

    2023-03-06T10:59:23.159788  kern  :alert : Register r12 information: NU=
LL pointer

    2023-03-06T10:59:23.160286  kern  :alert : 8<--- cut here ---
 =

    ... (49 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6405c7979d5a012=
8508c8651
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        32 lines

    2023-03-06T10:59:23.062512  kern  :alert : 8<--- cut here ---

    2023-03-06T10:59:23.063185  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at<8>[   13.400147] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Da=
lert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D32>

    2023-03-06T10:59:23.063640   0xc1a50741

    2023-03-06T10:59:23.064069  kern  :alert : [c1a50741] *pgd=3D01a1141e(b=
ad)

    2023-03-06T10:59:23.064643  kern  :alert : Register r0 information: non=
-slab/vmalloc memory

    2023-03-06T10:59:23.065083  kern  :alert : Register r1 information: non=
-paged memory

    2023-03-06T10:59:23.065557  kern  :alert : Register r2 information: non=
-slab/vmalloc memory

    2023-03-06T10:59:23.065976  kern  :alert : Register r3 information: non=
-paged memory
   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6405c7979d5a0128508c8656
        new failure (last pass: v6.3-rc1)

    2023-03-06T10:59:23.544253  kern  :emerg : Stack: (0xf0da9e10 to 0xf0da=
a000)

    2023-03-06T10:59:23.544811  kern  :emerg : 9e00:                       =
              c30eb300 40000013 c1b04d14 ba1ce42d

    2023-03-06T10:59:23.545483  kern  :emerg : 9e20: f0da9e80 00000010 c1b0=
4e50 c30eb300 f0da9e84 c110c488 00000000 00000000

    2023-03-06T10:59:23.545904  kern  :emerg : 9e40: 00000008 00000004 0000=
0000 11c0e192 0000000f c30eb300 c30eb300 00000142

    2023-03-06T10:59:23.546521  kern  :emerg : 9e60: 0003d97c c04cdc90 0000=
0000 00000000 aa1e3403 00000007 c2130015 00000000

    2023-03-06T10:59:23.546974  kern  :emerg : 9e80: 11c0e192 00000122 0000=
0000 ffff8f8b c110c660 02c40003 00000003 00000006

    2023-03-06T10:59:23.592361  kern  :emerg : 9ea0: 00000026 00000000 0000=
0000 00000000 f0da9eb4 ba1ce42d 00000020 c1dbd7ec

    2023-03-06T10:59:23.592876  kern  :emerg : 9ec0: f0da9f08 c09f667c c30e=
b300 00000001 00000020 00000000 00004004 c09f66cc

    2023-03-06T10:59:23.593456  kern  :emerg : 9ee0: c3790300 f0da9f78 c09f=
667c c04bb5c8 00000000 00000001 0003d97c c04d25c8

    2023-03-06T10:59:23.593914  kern  :emerg : 9f00: ffffeca2 00000000 0100=
0006 00000000 00000020 be8e3848 00000000 00000000
 =

    ... (40 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6405c89b967c9ba2488c86b9

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-g18cc5124a241/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6405c89b967c9ba=
2488c86bc
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-03-06T11:03:45.156846  rt : [c1a50741] *pgd=3D81a1141e(bad)

    2023-03-06T11:03:45.162262  kern  :alert : Register r0 information: non=
-slab/vmalloc memory

    2023-03-06T11:03:45.167672  kern  :alert : Register r1 information: non=
-paged memory

    2023-03-06T11:03:45.172820  kern  :alert : Register r2 information: non=
-slab/vmalloc memory

    2023-03-06T11:03:45.177951  kern  :alert : Register r3 information: non=
-paged memory

    2023-03-06T11:03:45.188828  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0e48000 allocated at kernel_clone+0x8c/0x=
36c

    2023-03-06T11:03:45.194379  kern  :alert : Register r5 information: non=
-slab/vmalloc memory

    2023-03-06T11:03:45.199506  kern  :alert : Register r6 information: zer=
o-size pointer

    2023-03-06T11:03:45.208173  kern  :alert : Register r7 information: sla=
b task_struct start c215cc80 pointer offset 0 size 2176

    2023-03-06T11:03:45.213828  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
 =

    ... (100 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6405c89b967c9ba=
2488c86bd
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-03-06T11:03:45.137816  kern  :alert : 8<--- cut here ---

    2023-03-06T11:03:45.144189  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741

    2023-03-06T11:03:45.153372  kern  :ale<8>[   16.897110] <LAVA_SIGNAL_TE=
STCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
   =

 =20
