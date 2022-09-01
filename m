Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CFEA3B
	for <chrome-platform@lists.linux.dev>; Thu,  1 Sep 2022 07:24:47 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id f24so13554589plr.1
        for <chrome-platform@lists.linux.dev>; Thu, 01 Sep 2022 00:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=SHTVtC7w/NGTekAmfSpM53wybboVstLl0885VkrFEf0=;
        b=yCNmj9Rhe5DLRhaWVeMwxq9JSHlH76pkTFK5HP/uoIPh2otxiZPV/MvlOVmhFl8Izo
         ERWZyNpIvKBqq0avOwQhU8T+KcUd/PG/EYXoceNeJXqZK/O+GDjVKyx68EzpT1jeASNN
         hnP8SORF9Eg6tc46+gXRKVvLRyZ8g5FPe2IYf1XXvNoOcqYnVw9HZ6S6ZHq+JMd0KMnT
         2+jjY30tNZa8bq5zxLdYAU3XMEH2MmUWyFApRQC1hXyVd6beYbIwH/4oeYXV3tY4OSec
         cLk8CKDaV/P60+Lbc9v1kg3pVf+qUo/nL4f7Oj+jHDGGxGmCyEZwvT6Do+LS1V1U09hi
         l7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=SHTVtC7w/NGTekAmfSpM53wybboVstLl0885VkrFEf0=;
        b=7fJVtxOFwiVzWbc/6yyVKdjO9TAdSsV+unOBz6vZc0OIRExykNTE0IvAWu033ZMOBx
         Oz2RknQtfaVHQrlMe5L700w/uNHQoVF/laZdaC/KXbHOeyj4EFTM07/+nb/pTATnp92E
         YLAOIya1WpYttgXqBLIjC2rjy9HP0LHyG6q11pNtA5zzx35ZiS+e6xnctDNRtH34P6Qj
         KcmrEG1bpDU+GbHzvaRffFxgV644sYVVqs4mnnY6S2BEG+sHGC71tL3rY8NUtIq9LB72
         oiYDorNP8ykAuNAos0HeE29z/38FZOgOcEInx35PQbcRS/S/7GxvNs7fhzbwubC+vjeP
         CNUQ==
X-Gm-Message-State: ACgBeo0ZoC4OjRJErYVjgT+HEYe0JqvQ5Z42NwDLXnkAdoJ94eWytMPj
	b2sQ/F9m8JYXI1G4B6OH0OJVWg==
X-Google-Smtp-Source: AA6agR66nGqiVQ2KXWTDLSH4SWu3t1AbuAYOC56ZRewAePQMeLHYXyygXahwDMFXxi/YWrPVeSvedg==
X-Received: by 2002:a17:903:245:b0:172:bf22:fc5 with SMTP id j5-20020a170903024500b00172bf220fc5mr29641237plh.101.1662017086634;
        Thu, 01 Sep 2022 00:24:46 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o2-20020a63a802000000b0042bf6034b3fsm4620240pgf.55.2022.09.01.00.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 00:24:46 -0700 (PDT)
Message-ID: <63105e3e.630a0220.81f7f.919d@mx.google.com>
Date: Thu, 01 Sep 2022 00:24:46 -0700 (PDT)
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
Subject: chrome-platform/for-kernelci cros-ec: 10 runs,
 7 regressions (v6.0-rc1-18-gf36a064d1483)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 10 runs, 7 regressions (v6.0-rc1-18-g=
f36a064d1483)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.0-rc1-18-gf36a064d1483/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.0-rc1-18-gf36a064d1483
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      f36a064d1483ddc1fe9faef38d370b68e632654e

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  86181a7fbd379fc42314c450740d2cea8cdf04c1 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6310462813815c595b355645

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-18-gf36a064d1483/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-18-gf36a064d1483/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
310462813815c595b355658
        failing since 9 days (last pass: tag-chrome-platform-for-v5.20-2-gd=
dffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-09-01T05:41:50.083315  / # =

    2022-09-01T05:41:50.088110  =

    2022-09-01T05:41:50.189892  / # #
    2022-09-01T05:41:50.194507  #
    2022-09-01T05:41:50.295575  / # export SHELL=3D/bin/sh
    2022-09-01T05:41:50.295854  <4>[   10.948033] cros-ec-spi spi-PRP0001:0=
1: EC failed to respond in time
    2022-09-01T05:41:50.295945  <3>[   10.955565] cros-ec-spi spi-PRP0001:0=
1: Cannot identify the EC: error -110
    2022-09-01T05:41:50.296019  <3>[   10.963553] cros-ec-spi spi-PRP0001:0=
1: cannot register EC
    2022-09-01T05:41:50.296089  <4>[   10.970109] cros-ec-spi: probe of spi=
-PRP0001:01 failed with error -110
    2022-09-01T05:41:50.300614  export SHELL=3D/bin/sh =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/6310475503eb9e549235566a

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-18-gf36a064d1483/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-18-gf36a064d1483/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
10475503eb9e549235567b
        failing since 9 days (last pass: tag-chrome-platform-for-v5.20-2-gd=
dffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
310475503eb9e549235567d
        failing since 9 days (last pass: tag-chrome-platform-for-v5.20-2-gd=
dffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-09-01T05:46:49.632599  / # =

    2022-09-01T05:46:49.638656  =

    2022-09-01T05:46:49.743727  / # #
    2022-09-01T05:46:49.749713  #
    2022-09-01T05:46:49.852347  / # export SHELL=3D/bin/sh
    2022-09-01T05:46:49.858383  export SHELL=3D/bin/sh
    2022-09-01T05:46:49.960452  / # . /lava-7157861/environment
    2022-09-01T05:46:49.966198  . /lava-7157861/environment
    2022-09-01T05:46:50.068058  / # /lava-7157861/bin/lava-test-runner /lav=
a-7157861/0
    2022-09-01T05:46:50.074281  /lava-7157861/bin/lava-test-runner /lava-71=
57861/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/6310462b10b2aac057355669

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-18-gf36a064d1483/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-18-gf36a064d1483/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
10462b10b2aac05735567a
        failing since 9 days (last pass: tag-chrome-platform-for-v5.20-2-gd=
dffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
310462b10b2aac05735567c
        failing since 9 days (last pass: tag-chrome-platform-for-v5.20-2-gd=
dffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-09-01T05:41:47.532225  / # =

    2022-09-01T05:41:47.538086  =

    2022-09-01T05:41:47.639915  / # #
    2022-09-01T05:41:47.644961  #
    2022-09-01T05:41:47.745965  / # export SHELL=3D/bin/sh
    2022-09-01T05:41:47.751336  export SHELL=3D/bin/sh
    2022-09-01T05:41:47.852138  / # . /lava-7157822/environment
    2022-09-01T05:41:47.857336  . /lava-7157822/environment
    2022-09-01T05:41:47.958270  / # /lava-7157822/bin/lava-test-runner /lav=
a-7157822/0
    2022-09-01T05:41:47.963188  /lava-7157822/bin/lava-test-runner /lava-71=
57822/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/631048a9ae2eff8b15355653

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-18-gf36a064d1483/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-18-gf36a064d1483/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
1048a9ae2eff8b15355664
        new failure (last pass: tag-chrome-platform-for-v5.20-2-gddffaa3d76=
750) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
31048a9ae2eff8b15355666
        new failure (last pass: tag-chrome-platform-for-v5.20-2-gddffaa3d76=
750)

    2022-09-01T05:52:21.473975  / # =

    2022-09-01T05:52:21.477726  =

    2022-09-01T05:52:21.585306  / # #
    2022-09-01T05:52:21.588585  #
    2022-09-01T05:52:21.693058  / # export SHELL=3D/bin/sh
    2022-09-01T05:52:21.697332  export SHELL=3D/bin/sh
    2022-09-01T05:52:21.800472  / # . /lava-7157884/environment
    2022-09-01T05:52:21.804225  . /lava-7157884/environment
    2022-09-01T05:52:21.907441  / # /lava-7157884/bin/lava-test-runner /lav=
a-7157884/0
    2022-09-01T05:52:21.910224  /lava-7157884/bin/lava-test-runner /lava-71=
57884/0 =

    ... (10 line(s) more)  =

 =20
