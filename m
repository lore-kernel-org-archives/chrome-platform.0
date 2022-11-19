Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D67A137A
	for <chrome-platform@lists.linux.dev>; Sat, 19 Nov 2022 09:28:14 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso6817895pjt.0
        for <chrome-platform@lists.linux.dev>; Sat, 19 Nov 2022 01:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ud6yLsDeDLeJfb8lVpBGbl4UX9bgQ04OaZYFy7F9uLY=;
        b=4B6XrQGHQogEh8knK5OAdU9gMXDM/BgKfnhu7lPv+y75fSFz+lIySL8cdguxX3iHM+
         7ppqF96nZeK9p1pFUwCOXKR0LlCeS1O0DEWYJIETrO2NepfkFkkXzVXOceBTW9ikpgai
         YZHXZLdzo/mWDdd2/rFVVzAmyQlYuQGqyJoxsVfuMYPpuKaOqHX9BslTMET924mvKvaE
         jEHol3bnrLvtHdyYjXvbybvN/Tv+yWYkdug/rfNCCgOBpaNvTOkDPWzI7B0+s9vDiepI
         pmhSMFYtY1yypLzjilXa2RC6M0V5JnSGv07hWOf7RKKjXIv0TC+RRGYdxGFH3VttmMxg
         hnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ud6yLsDeDLeJfb8lVpBGbl4UX9bgQ04OaZYFy7F9uLY=;
        b=xEuIMTsgxs+7cS/biLQXHsv5dJ9J16Ttumw/OhPLGJFGrYaJmAY5f/XunUAt25g4Yv
         MHwRH313vmNrGlaIe05GKZQi+94+wHZS3YoXhDtS2yCQOUtAJeztcCcqqP2/LzEypuJa
         0V71a5WzPjlNCOxkIvuv2C0f+l0UZ94BtN4w2GDZNFV1SzmkLxIH3VVBgqXXzraApWaC
         mxmd1hvnn7SbwwSGvAJb9mbGv9WiTdNcHKt3VE5jNKZDBPg3iaHusQVviYlygN2Sqz0b
         +NkgE8BR6ej5BYS7aTumB+glaKP9+dwVuJuRz+bgxPa1WugzBgirlECrx550fyEW4OBQ
         gj1A==
X-Gm-Message-State: ANoB5pnJszUQ4oUYoJPW5IXYwSzMKDWvud96KMSYQj1JVMaYGXCXYPQo
	ROPvgGU0FTivFj5VM6r2WYKOJw==
X-Google-Smtp-Source: AA0mqf5F5+bboHdgPqHFamajT1IXGWM77+YvUiENz9gm5ginkzQWoIZGEiKat0vxUuUdCgK8DFcKdQ==
X-Received: by 2002:a17:902:e0ca:b0:188:712f:dfa5 with SMTP id e10-20020a170902e0ca00b00188712fdfa5mr3079867pla.140.1668850093744;
        Sat, 19 Nov 2022 01:28:13 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p10-20020a17090a4f0a00b001fe39bda429sm4034914pjh.38.2022.11.19.01.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 01:28:13 -0800 (PST)
Message-ID: <6378a1ad.170a0220.11094.65e9@mx.google.com>
Date: Sat, 19 Nov 2022 01:28:13 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-kernelci
X-Kernelci-Kernel: v6.1-rc1-14-geba771858c2d
X-Kernelci-Report-Type: test
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci cros-ec: 8 runs,
 7 regressions (v6.1-rc1-14-geba771858c2d)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 8 runs, 7 regressions (v6.1-rc1-14-ge=
ba771858c2d)

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
ci/kernel/v6.1-rc1-14-geba771858c2d/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.1-rc1-14-geba771858c2d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      eba771858c2d4ae4c3ab4546174072195578ac3f

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


  Details:     https://kernelci.org/test/plan/id/63788a212ecd506f9c2abd27

  Results:     8 PASS, 2 FAIL, 9 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-14-geba771858c2d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-14-geba771858c2d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221107.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3788a212ecd506f9c2abd3a
        failing since 88 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-11-19T07:47:37.796671  / # =

    2022-11-19T07:47:37.803263  =

    2022-11-19T07:47:37.907544  / # #
    2022-11-19T07:47:37.913824  #
    2022-11-19T07:47:38.016238  / # export SHELL=3D/bin/sh
    2022-11-19T07:47:38.023112  export SHELL=3D/bin/sh
    2022-11-19T07:47:38.125216  / # . /lava-8045132/environment
    2022-11-19T07:47:38.132435  . /lava-8045132/environment
    2022-11-19T07:47:38.234515  / # /lava-8045132/bin/lava-test-runner /lav=
a-8045132/0
    2022-11-19T07:47:38.241030  /lava-8045132/bin/lava-test-runner /lava-80=
45132/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/63788b25fbe64ac82a2abcfd

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-14-geba771858c2d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-14-geba771858c2d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221107.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
788b25fbe64ac82a2abd0e
        failing since 88 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3788b25fbe64ac82a2abd10
        failing since 88 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-11-19T07:51:47.116095  / # =

    2022-11-19T07:51:47.121213  =

    2022-11-19T07:51:47.225420  / # #
    2022-11-19T07:51:47.231667  #
    2022-11-19T07:51:47.334198  / # export SHELL=3D/bin/sh
    2022-11-19T07:51:47.340553  export SHELL=3D/bin/sh
    2022-11-19T07:51:47.442701  / # . /lava-8045188/environment
    2022-11-19T07:51:47.449599  . /lava-8045188/environment
    2022-11-19T07:51:47.551745  / # /lava-8045188/bin/lava-test-runner /lav=
a-8045188/0
    2022-11-19T07:51:47.557807  /lava-8045188/bin/lava-test-runner /lava-80=
45188/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/63788a340806be391b2abd21

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-14-geba771858c2d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-14-geba771858c2d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221107.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
788a340806be391b2abd32
        failing since 88 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3788a340806be391b2abd34
        failing since 88 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-11-19T07:47:49.698518  / # =

    2022-11-19T07:47:49.704221  =

    2022-11-19T07:47:49.806870  / # #
    2022-11-19T07:47:49.813172  #
    2022-11-19T07:47:49.915450  / # export SHELL=3D/bin/sh
    2022-11-19T07:47:49.921524  export SHELL=3D/bin/sh
    2022-11-19T07:47:50.023401  / # . /lava-8045191/environment
    2022-11-19T07:47:50.029867  . /lava-8045191/environment
    2022-11-19T07:47:50.131753  / # /lava-8045191/bin/lava-test-runner /lav=
a-8045191/0
    2022-11-19T07:47:50.136806  /lava-8045191/bin/lava-test-runner /lava-80=
45191/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/63788e313a536cdf0b2abcfa

  Results:     2 PASS, 2 FAIL, 12 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-14-geba771858c2d/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-14-geba771858c2d/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221107.1/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
788e313a536cdf0b2abd08
        failing since 79 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3788e313a536cdf0b2abd0a
        failing since 79 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483)

    2022-11-19T08:04:49.744981  / # =

    2022-11-19T08:04:49.748090  =

    2022-11-19T08:04:49.748994  =

    2022-11-19T08:04:49.858653  / ##
    2022-11-19T08:04:49.862185   #
    2022-11-19T08:04:49.863070  =

    2022-11-19T08:04:49.967070  / # export SHELL=3D/bin/sh
    2022-11-19T08:04:49.970667  export SHELL=3D/bin/sh
    2022-11-19T08:04:50.075025  / # . /lava-8045280/environment
    2022-11-19T08:04:50.075893  . /lava-8045280/environment<6>[   31.154071=
] mwifiex_pcie 0000:01:00.0: info: FW download over, size 638992 bytes =

    ... (15 line(s) more)  =

 =20
