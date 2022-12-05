Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9657C
	for <chrome-platform@lists.linux.dev>; Mon,  5 Dec 2022 08:28:14 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id 62so9838885pgb.13
        for <chrome-platform@lists.linux.dev>; Mon, 05 Dec 2022 00:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=x2SPf9OMki+mZ04kvPw/Qja1BoIHpJpfJP9326E2pKw=;
        b=ouTQWUC+RXocTTkgeRprsq3IUZr9yZP/GFclqoVGglNvP0XUGunRPzvBDrAA1PQOPe
         jzY+7TiJjaVCnTliWEoPgm1JPVvPnGoEH2c/iFR9JmYlI1PbAnBhVAY4UFIOxPKXv1El
         J3qntqwjT3g+UwGSgczEaeVzJm8vLNtssv4hDoJi8MUVYC0MF0bSRQVan/FFV1b3Bdzs
         h7UWIIxXv5QuBRXHqL3h4L3oXOAYvrrd05fKY08lRwp9SixCyDLaUx+h56aIFsLupwFc
         YVZbQe8hxzD8ot1Qgz4awN/w9qnLwBUFnii1qjevfrNFUwfA0peHjDu4TgGXsrHjAZ1i
         LNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x2SPf9OMki+mZ04kvPw/Qja1BoIHpJpfJP9326E2pKw=;
        b=Hx+JFUSCWUpCV0rImrKkcRHo2rjg4OwU/dBa8oxd4kJuv9gaIxlSLKrIVNy2i5xvjG
         7tww8C3/7whKexrNZQGXhAH7Duul/kIoF8T8L6rfEaizv4pR7ziyrofPnChoI7VOOM6s
         MgtTyqbgHgr+2tnMhqHIJ26MGw1yOU6gLY5y4+gJ0mThsy1g2Q4t4sdfWL2CpLEQqIgb
         V17W9YCkg5k62sQfZHO1XfJJ7T85IekAHNOxtKTdHbJQyhlmd8XhckElbV45efnuLXnq
         LWDiaSiiiK4vIcJEn4bMYSroJdXOMZRuoCQuTb1hYQUsvWt4OI8OmuVCykkLUZQ6iMRi
         3vnw==
X-Gm-Message-State: ANoB5pm8aXWY4I2yiQw/91hxvojea33RBk0yXz5pNjdr/C1U8nh0qy0F
	lMdQsRVXeMIJMGRkIiyp0UhUqA9LBiqZ4hlR1h3xbQ==
X-Google-Smtp-Source: AA0mqf4F3stvN/s+lK+mnC6N0dLgpN3KQ5+6ElmckNJXikmskceIciW/Bti0Z/C8oDFqoLUsY0cTUA==
X-Received: by 2002:a63:db0a:0:b0:477:cc21:5766 with SMTP id e10-20020a63db0a000000b00477cc215766mr45777957pgg.524.1670228893535;
        Mon, 05 Dec 2022 00:28:13 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x3-20020aa79ac3000000b00575c5ae50cdsm9576822pfp.142.2022.12.05.00.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 00:28:13 -0800 (PST)
Message-ID: <638dab9d.a70a0220.83ea5.12c6@mx.google.com>
Date: Mon, 05 Dec 2022 00:28:13 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-kernelci
X-Kernelci-Kernel: v6.1-rc1-16-gd74fa18ce5f0
X-Kernelci-Report-Type: test
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci cros-ec: 9 runs,
 8 regressions (v6.1-rc1-16-gd74fa18ce5f0)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 9 runs, 8 regressions (v6.1-rc1-16-gd=
74fa18ce5f0)

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
ci/kernel/v6.1-rc1-16-gd74fa18ce5f0/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.1-rc1-16-gd74fa18ce5f0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      d74fa18ce5f0fc462d93edd1514e6daaf55f804c

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


  Details:     https://kernelci.org/test/plan/id/638d93e3d83b45670b2abd02

  Results:     8 PASS, 2 FAIL, 9 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-16-gd74fa18ce5f0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-16-gd74fa18ce5f0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221125.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
38d93e3d83b45670b2abd15
        failing since 104 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-12-05T06:46:52.851419  / # =

    2022-12-05T06:46:52.857867  =

    2022-12-05T06:46:52.964166  / # #
    2022-12-05T06:46:52.970939  #
    2022-12-05T06:46:53.073643  / # export SHELL=3D/bin/sh
    2022-12-05T06:46:53.080183  export SHELL=3D/bin/sh
    2022-12-05T06:46:53.182407  / # . /lava-8237829/environment
    2022-12-05T06:46:53.188893  . /lava-8237829/environment
    2022-12-05T06:46:53.291100  / # /lava-8237829/bin/lava-test-runner /lav=
a-8237829/0
    2022-12-05T06:46:53.297770  /lava-8237829/bin/lava-test-runner /lava-82=
37829/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/638d949bd7e73b28262abd07

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-16-gd74fa18ce5f0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-16-gd74fa18ce5f0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221125.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
8d949bd7e73b28262abd18
        failing since 104 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
38d949bd7e73b28262abd1a
        failing since 104 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-12-05T06:49:45.823872  / # =

    2022-12-05T06:49:45.830229  =

    2022-12-05T06:49:45.936367  / # #
    2022-12-05T06:49:45.942356  #
    2022-12-05T06:49:46.045994  / # export SHELL=3D/bin/sh
    2022-12-05T06:49:46.052222  export SHELL=3D/bin/sh
    2022-12-05T06:49:46.154224  / # . /lava-8237881/environment
    2022-12-05T06:49:46.160268  . /lava-8237881/environment
    2022-12-05T06:49:46.262169  / # /lava-8237881/bin/lava-test-runner /lav=
a-8237881/0
    2022-12-05T06:49:46.268187  /lava-8237881/bin/lava-test-runner /lava-82=
37881/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/638d93cfb60acecfbd2abd22

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-16-gd74fa18ce5f0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-16-gd74fa18ce5f0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221125.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
8d93cfb60acecfbd2abd33
        failing since 104 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
38d93cfb60acecfbd2abd35
        failing since 104 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-12-05T06:46:20.779838  / # =

    2022-12-05T06:46:20.786196  =

    2022-12-05T06:46:20.891867  / # #
    2022-12-05T06:46:20.897791  #
    2022-12-05T06:46:20.999924  / # export SHELL=3D/bin/sh
    2022-12-05T06:46:21.006313  export SHELL=3D/bin/sh
    2022-12-05T06:46:21.107933  / # . /lava-8237841/environment
    2022-12-05T06:46:21.113983  . /lava-8237841/environment
    2022-12-05T06:46:21.215866  / # /lava-8237841/bin/lava-test-runner /lav=
a-8237841/0
    2022-12-05T06:46:21.221859  /lava-8237841/bin/lava-test-runner /lava-82=
37841/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/638d968e468bc5ef662abcfe

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-16-gd74fa18ce5f0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-16-gd74fa18ce5f0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221125.0/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
8d968f468bc5ef662abd0f
        failing since 95 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
38d968f468bc5ef662abd11
        failing since 95 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483)

    2022-12-05T06:58:14.794779  / # =

    2022-12-05T06:58:14.796629  =

    2022-12-05T06:58:14.900730  / # #
    2022-12-05T06:58:14.903061  #
    2022-12-05T06:58:14.903612  =

    2022-12-05T06:58:15.008170  / #export SHELL=3D/bin/sh
    2022-12-05T06:58:15.010135   export SHELL=3D/bin/sh
    2022-12-05T06:58:15.010759  =

    2022-12-05T06:58:15.113063  / #. /lava-8237934/environment
    2022-12-05T06:58:15.115539   . /lava-8237934/environment =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/638d968aa68de2d3582abd03

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-16-gd74fa18ce5f0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-16-gd74fa18ce5f0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221125.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/638d968aa68de2d3582abd=
04
        failing since 9 days (last pass: v6.1-rc1-14-geba771858c2d, first f=
ail: v6.1-rc1-15-g6c7053bf3514) =

 =20
