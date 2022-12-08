Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DDC629
	for <chrome-platform@lists.linux.dev>; Thu,  8 Dec 2022 04:34:17 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id s7so414837plk.5
        for <chrome-platform@lists.linux.dev>; Wed, 07 Dec 2022 20:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kta0iCTltXKl58x0NUXr+LXd472pYHYEeOYoOcbSgA4=;
        b=HRjPaXqqduuXJTiR+ndMHiLtIhuVn0StArnsEl5KDgXUXVEZY9N6LlokHEkemj8Rly
         eQ+YVybKLTtOKAVCH9sEpKfxz2/JFcj8ZES2Uv8S+zPsIZmqW+Cf6mWqGUcOozGbjPSD
         5uGecZp3U4xQ5TAFPU2nsB0n7a2lYf3E5Fxv26TyDVaOdpMjCOhNpPK1cca/Ek7B56Cc
         8qVcP4F5hwP1wYGN8wmUX8wVKkcP8DIQVzYErLlHlz2x8+VmvK2fUNq+G4iE1UTIs++K
         tUb19Jxzzj7qfCni3MisAbGa3FQHze2T9j1g9FCN5fTQ+Uw7MFXH/pWJtmbpw8cG4Ibd
         PW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kta0iCTltXKl58x0NUXr+LXd472pYHYEeOYoOcbSgA4=;
        b=UpRgp+xv5ZGBEvWc+R9lJKUtLB9G8UVyq/0P7AjVKU1ZQusAMuFTs9JeuNjSuOOXPL
         5cEdtPcE+lq3wIgIA1R6i55TZBuefBzyUDif2KP0tkIUUVgcyzVsHY561TERzsr13MbX
         HZNg3OYB31s37N+QRRoCrTYEVLUZWIpEaG7SQuKK3310R68OooMWBzrauwI80W846R8j
         iPvMEtmOs4uIMCPFTiEN6m2XX0tNw8YYUGwJaMljFtHDT4qPakY7h9Ku+OOIXMfUzyCU
         Xpcv1E8ZLqXhvd+k7kdh1UpCWH+XsKoR9BJpCyz90ctR1jNhmLT/Y7BvwmlOfZ5jjWa2
         csuw==
X-Gm-Message-State: ANoB5plLYJBKQjMY18xm85w16S+J2MdKiwfuqnPhK4U/wiJYaKM61sZr
	fFd1EBNWgv0xD9T7wkTcp9LISA==
X-Google-Smtp-Source: AA0mqf4SFDSGe8YpS3uV6v9Rr8+xGJhnzCcOccpv/CVQ7ZwSBY9DXHB0hqZZU+L3ZRjQV9XrYYv0Ig==
X-Received: by 2002:a17:90b:2d83:b0:219:e002:1ba3 with SMTP id sj3-20020a17090b2d8300b00219e0021ba3mr1469913pjb.9.1670474056997;
        Wed, 07 Dec 2022 20:34:16 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id js3-20020a17090b148300b0020ad53b5883sm1959650pjb.14.2022.12.07.20.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 20:34:16 -0800 (PST)
Message-ID: <63916948.170a0220.3dbdf.426e@mx.google.com>
Date: Wed, 07 Dec 2022 20:34:16 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-kernelci
X-Kernelci-Kernel: tag-chrome-platform-for-v6.2-2-g5990db2d66b3
X-Kernelci-Report-Type: test
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci cros-ec: 8 runs,
 8 regressions (tag-chrome-platform-for-v6.2-2-g5990db2d66b3)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 8 runs, 8 regressions (tag-chrome-pla=
tform-for-v6.2-2-g5990db2d66b3)

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

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/tag-chrome-platform-for-v6.2-2-g5990db2d66b3/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: tag-chrome-platform-for-v6.2-2-g5990db2d66b3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      5990db2d66b3445e885affcd284301fd2cc14ecd

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


  Details:     https://kernelci.org/test/plan/id/639151d14a8a58b4672abd37

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.2-2-g5990db2d66b3/x86_64/x86_64_defconfig+x86-chr=
omebook/gcc-10/lab-collabora/cros-ec-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.2-2-g5990db2d66b3/x86_64/x86_64_defconfig+x86-chr=
omebook/gcc-10/lab-collabora/cros-ec-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221202.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
39151d14a8a58b4672abd4a
        failing since 107 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-12-08T02:53:57.348773  / # =

    2022-12-08T02:53:57.353636  =

    2022-12-08T02:53:57.455278  / # #
    2022-12-08T02:53:57.462271  #<4>[   11.322090] cros-ec-spi spi-PRP0001:=
01: EC failed to respond in time
    2022-12-08T02:53:57.469035  <3>[   11.329583] cros-ec-spi spi-PRP0001:0=
1: Cannot identify the EC: error -110
    2022-12-08T02:53:57.475614  <3>[   11.337575] cros-ec-spi spi-PRP0001:0=
1: cannot register EC
    2022-12-08T02:53:57.482598  <4>[   11.344056] cros-ec-spi: probe of spi=
-PRP0001:01 failed with error -110
    2022-12-08T02:53:57.485226  =

    2022-12-08T02:53:57.485307  =

    2022-12-08T02:53:57.586287  / # export SHELL=3D/bin/sh =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/639151b5d03a0b9e582abd08

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.2-2-g5990db2d66b3/x86_64/x86_64_defconfig+x86-chr=
omebook/gcc-10/lab-collabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.2-2-g5990db2d66b3/x86_64/x86_64_defconfig+x86-chr=
omebook/gcc-10/lab-collabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221202.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
9151b5d03a0b9e582abd19
        failing since 107 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
39151b5d03a0b9e582abd1b
        failing since 107 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-12-08T02:53:27.202418  / # =

    2022-12-08T02:53:27.208444  =

    2022-12-08T02:53:27.313951  / # #
    2022-12-08T02:53:27.319544  #
    2022-12-08T02:53:27.421704  / # export SHELL=3D/bin/sh
    2022-12-08T02:53:27.427824  export SHELL=3D/bin/sh
    2022-12-08T02:53:27.529609  / # . /lava-8280876/environment
    2022-12-08T02:53:27.535565  . /lava-8280876/environment
    2022-12-08T02:53:27.637308  / # /lava-8280876/bin/lava-test-runner /lav=
a-8280876/0
    2022-12-08T02:53:27.643146  /lava-8280876/bin/lava-test-runner /lava-82=
80876/0 =

    ... (8 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/639151b94a8a58b4672abcfc

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.2-2-g5990db2d66b3/x86_64/x86_64_defconfig+x86-chr=
omebook/gcc-10/lab-collabora/cros-ec-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.2-2-g5990db2d66b3/x86_64/x86_64_defconfig+x86-chr=
omebook/gcc-10/lab-collabora/cros-ec-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221202.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
9151b94a8a58b4672abd0d
        failing since 107 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
39151b94a8a58b4672abd0f
        failing since 107 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-12-08T02:53:27.783279  / # =

    2022-12-08T02:53:27.788284  =

    2022-12-08T02:53:27.889930  / # #
    2022-12-08T02:53:27.895296  #
    2022-12-08T02:53:27.996022  / # export SHELL=3D/bin/sh
    2022-12-08T02:53:28.001032  export SHELL=3D/bin/sh
    2022-12-08T02:53:28.101951  / # . /lava-8280905/environment
    2022-12-08T02:53:28.107045  . /lava-8280905/environment
    2022-12-08T02:53:28.207944  / # /lava-8280905/bin/lava-test-runner /lav=
a-8280905/0
    2022-12-08T02:53:28.212888  /lava-8280905/bin/lava-test-runner /lava-82=
80905/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/639158aa9c5f4ecc352abd12

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.2-2-g5990db2d66b3/arm64/defconfig+arm64-chromeboo=
k/gcc-10/lab-collabora/cros-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.2-2-g5990db2d66b3/arm64/defconfig+arm64-chromeboo=
k/gcc-10/lab-collabora/cros-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221202.0/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
9158aa9c5f4ecc352abd23
        failing since 97 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483)

    2022-12-08T03:23:11.988046     =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
39158aa9c5f4ecc352abd25
        failing since 97 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483)

    2022-12-08T03:23:10.943425  / # =

    2022-12-08T03:23:10.945648  =

    2022-12-08T03:23:10.945934  =

    2022-12-08T03:23:11.048994  / # #
    2022-12-08T03:23:11.051160  #
    2022-12-08T03:23:11.051440  =

    2022-12-08T03:23:11.154116  / # export SHELL=3D/bin/sh
    2022-12-08T03:23:11.156372  export SHELL=3D/bin/sh
    2022-12-08T03:23:11.261013  / # . /lava-8281285/environment
    2022-12-08T03:23:11.263358  . /lava-8281285/environment =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/639153c2de91d899762abcfc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.2-2-g5990db2d66b3/arm64/defconfig+arm64-chromeboo=
k/gcc-10/lab-collabora/cros-ec-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.2-2-g5990db2d66b3/arm64/defconfig+arm64-chromeboo=
k/gcc-10/lab-collabora/cros-ec-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221202.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/639153c2de91d899762abc=
fd
        failing since 12 days (last pass: v6.1-rc1-14-geba771858c2d, first =
fail: v6.1-rc1-15-g6c7053bf3514) =

 =20
