Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493887B
	for <chrome-platform@lists.linux.dev>; Mon, 26 Dec 2022 07:55:55 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id r18so6796502pgr.12
        for <chrome-platform@lists.linux.dev>; Sun, 25 Dec 2022 23:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EU3S8/ublK10eX3oVVbV8oT88+bjGDQubu39MxCNVb8=;
        b=ut+Gdj+4YlYXT7Uy+PF8wsxAqkNKK5K9fhYj21OHfIZvTiOXXsFPMO53LzIhcTAoKD
         y0cmfoqYHdoPyCPceWXmEpfrNmrE63/W/xqjNAdQ9qA5XH8Z1aYK32f9VkERnJtvqYI8
         0xXKNo9HqmHSYH9CyzfjrDJYYuovWXt/wRBDjoXHrMRipb5oVGBNGj8mZeNn7m6IXsAO
         xDbUpOc36l4+0/d+JXSdjHGcCyMtPpWRkZIoWHbD/ctu5Jze55I6g+Wo9cWHWoucRoID
         edmerDDdBkxf3j0yQkev/RNBtTjs7VFBBKnhB+pnaTsV2qBxmWkO2X9mPf7SNf9dB61D
         BN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EU3S8/ublK10eX3oVVbV8oT88+bjGDQubu39MxCNVb8=;
        b=49zC/8/sB8+J8jCNmS1WzOT8Ka+Od5GMiwyljcPesNfQLXNu9ZEy05epAxdJCpKu2F
         57oXoS3/sJx9XzXktEDRh+cY//Igpi5iZC8q6opYyitJvXro5KgKE9E3q19zsR7WmeEn
         oe4sA8nuiKyo7V1x9MPzpUaUZPXa0Gikka30WBG2Z/JKM17wJqgubvL+geRA59z57M1H
         O2fcPjVfoT+no6NWydqQT45sfvqn9zptWtrqWegswRcrA8aRRs+LWW1jz//Um/O0AqOM
         9yTptbAX7Q1v/YodmS0wQ2iDidgqx5d4hRXEdeX2Hn70JPnOdXgzXlpfFonkubVkv8cV
         O6vQ==
X-Gm-Message-State: AFqh2kr8bRodtQUvj2J39FMmwy4MPNSPW57BRzFR4T9pUKgrrMlXkTAH
	l3yZ/4PRbfPFDNSX5iE0IYmkGQ==
X-Google-Smtp-Source: AMrXdXs3eXsBuSsn5FfVBU0K/eO0IbqfiBtvJUEE3x+U1vYt+l7GHyhauBIFzxgQQYQnW2iIIuS21Q==
X-Received: by 2002:a05:6a00:d50:b0:580:e6b5:5a9f with SMTP id n16-20020a056a000d5000b00580e6b55a9fmr5688067pfv.7.1672041354581;
        Sun, 25 Dec 2022 23:55:54 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x68-20020a626347000000b0056bc742d21esm6451873pfb.176.2022.12.25.23.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 23:55:54 -0800 (PST)
Message-ID: <63a9538a.620a0220.5f6ab.b64e@mx.google.com>
Date: Sun, 25 Dec 2022 23:55:54 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.2-rc1-2-g65291e76da37
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci cros-ec: 7 runs,
 7 regressions (v6.2-rc1-2-g65291e76da37)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 7 runs, 7 regressions (v6.2-rc1-2-g65=
291e76da37)

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
ci/kernel/v6.2-rc1-2-g65291e76da37/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.2-rc1-2-g65291e76da37
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      65291e76da37b896f54a2948431f4d6ea28767b3

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


  Details:     https://kernelci.org/test/plan/id/63a938eb05aae43a7c4eee1b

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-2-g65291e76da37/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/cros-ec-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-2-g65291e76da37/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/cros-ec-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221216.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3a938eb05aae43a7c4eee2c
        failing since 125 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-12-26T06:02:14.913564  / # =

    2022-12-26T06:02:14.918373  =

    2022-12-26T06:02:15.020176  / # #
    2022-12-26T06:02:15.020508  #<4>[   10.836740] cros-ec-spi spi-PRP0001:=
01: EC failed to respond in time
    2022-12-26T06:02:15.020854  <3>[   10.844231] cros-ec-spi spi-PRP0001:0=
1: Cannot identify the EC: error -110
    2022-12-26T06:02:15.027808  <3>[   10.852219] cros-ec-spi spi-PRP0001:0=
1: cannot register EC
    2022-12-26T06:02:15.033762  <4>[   10.858686] cros-ec-spi: probe of spi=
-PRP0001:01 failed with error -110
    2022-12-26T06:02:15.037110  =

    2022-12-26T06:02:15.037208  =

    2022-12-26T06:02:15.138249  / # export SHELL=3D/bin/sh =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/63a93a6c31e3fd05c84eee53

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-2-g65291e76da37/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-2-g65291e76da37/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221216.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
a93a6c31e3fd05c84eee64
        failing since 125 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3a93a6c31e3fd05c84eee66
        failing since 125 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-12-26T06:08:32.468238  / # =

    2022-12-26T06:08:32.474432  =

    2022-12-26T06:08:32.580802  / # #
    2022-12-26T06:08:32.587168  #
    2022-12-26T06:08:32.689733  / # export SHELL=3D/bin/sh
    2022-12-26T06:08:32.695575  export SHELL=3D/bin/sh
    2022-12-26T06:08:32.797605  / # . /lava-8471394/environment
    2022-12-26T06:08:32.803551  . /lava-8471394/environment
    2022-12-26T06:08:32.905806  / # /lava-8471394/bin/lava-test-runner /lav=
a-8471394/0
    2022-12-26T06:08:32.912072  /lava-8471394/bin/lava-test-runner /lava-84=
71394/0 =

    ... (8 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/63a938f80571b225ba4eee23

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-2-g65291e76da37/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/cros-ec-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-2-g65291e76da37/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/cros-ec-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221216.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
a938f80571b225ba4eee34
        failing since 125 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3a938f80571b225ba4eee36
        failing since 125 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-12-26T06:02:14.724535  / # =

    2022-12-26T06:02:14.730801  =

    2022-12-26T06:02:14.836964  / # #
    2022-12-26T06:02:14.843194  #
    2022-12-26T06:02:14.945559  / # export SHELL=3D/bin/sh
    2022-12-26T06:02:14.951919  export SHELL=3D/bin/sh
    2022-12-26T06:02:15.053890  / # . /lava-8471405/environment
    2022-12-26T06:02:15.060174  . /lava-8471405/environment
    2022-12-26T06:02:15.162121  / # /lava-8471405/bin/lava-test-runner /lav=
a-8471405/0
    2022-12-26T06:02:15.168458  /lava-8471405/bin/lava-test-runner /lava-84=
71405/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/63a93cfba17c9506ef4eee28

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-2-g65291e76da37/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/cros-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-2-g65291e76da37/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/cros-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221216.0/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
a93cfba17c9506ef4eee39
        failing since 116 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3a93cfba17c9506ef4eee3b
        failing since 116 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483)

    2022-12-26T06:19:20.305331  / # =

    2022-12-26T06:19:20.308312  =

    2022-12-26T06:19:20.417801  / # #
    2022-12-26T06:19:20.420784  #
    2022-12-26T06:19:20.524151  / # export SHELL=3D/bin/sh
    2022-12-26T06:19:20.527353  export SHELL=3D/bin/sh
    2022-12-26T06:19:20.630703  / #. /lava-8471751/environment
    2022-12-26T06:19:20.634502   . /lava-8471751/environment
    2022-12-26T06:19:20.635374  =

    2022-12-26T06:19:20.739057  / # /lava-8471751/bin/lava-test-runner /lav=
a-8471751/0 =

    ... (13 line(s) more)  =

 =20
