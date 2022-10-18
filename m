Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B307B
	for <chrome-platform@lists.linux.dev>; Tue, 18 Oct 2022 10:12:04 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id x31-20020a17090a38a200b0020d2afec803so13572903pjb.2
        for <chrome-platform@lists.linux.dev>; Tue, 18 Oct 2022 03:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KIFpD7WlO4ScICsWOh5GDmeRk+60ez1rFaqAngmRyOc=;
        b=Amu6F3mkH+Br1yKhGbtxYHBGHPVHQ4PRk5HBut2h3BDqIdshASG3bfSwHX/HGxthfk
         /gic+zQBoQgN9CyNDcIcRi4u7uZ7KFNv2gwm6hopX/KGhRbMwcKv+64/M1CSi/olBy4E
         1Os6j0n/TFZjJqJbGp5lFEI9MKLwRqyMQh3ZPn0cWji0XVaMslWXHKCt+PUhhCM88mfl
         uY0BYCj2FYoGSQVuIkJ+ULxz87ZFwQ3co5GWup8t8ZdtFNUAgarbL/C4HXDLjDgq7Llo
         MWFNE/+JAoJFl14P956tEaeAjWJnXLhBGyEb1EbJExP+b/F8Rn36g4i+NtdFmHGgkhOD
         zNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KIFpD7WlO4ScICsWOh5GDmeRk+60ez1rFaqAngmRyOc=;
        b=V8CktZJejuwByOAWbEsq7fFK2KcR5DSGCeQsAsYGXW3L31XVY3ZCqWos3Cc84PvWhA
         SLYOb2eAYEJ4+VWCYQbToBn2s/rM6qbbtXy9GWmNVTt33ftvhhmMd/VWE0qNH03GPExt
         g6xqyveGsZuHWESRMA9W1cgtYG1a4CtPBPBm9RdQ0DzYRcgTOuaPIFHQQ+LN+OhCcH8Q
         TorA4aetLEX1ntLxh1qrnrtKSezkht6Mhr5HJZn2kht7PmRg2Fp0JrmYq0UYFycmSpD5
         oBQSnWcA5HBlPEklO3Zfzlabr14V/Z3F41uVDTp/K22RJLcHj11fH+TKeWJK13f6yw8N
         CpKQ==
X-Gm-Message-State: ACrzQf3cEFDaze/aaLq2PXQdNyjwyOqN1Qe62McCQea47aK2cXkxGsYY
	5NRGurb8Npcv8gnbw5hM+M7aFQ==
X-Google-Smtp-Source: AMsMyM5S3D2+SA/3ERoI54jtzIsljU/I/CmoVxwgRED1s0F7wwNZLlvq+MiJvL7WuHrtmS93afEfjw==
X-Received: by 2002:a17:903:2342:b0:181:bc30:b02f with SMTP id c2-20020a170903234200b00181bc30b02fmr2196898plh.30.1666087924290;
        Tue, 18 Oct 2022 03:12:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n14-20020a170902d2ce00b0017f36638010sm8297046plc.276.2022.10.18.03.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 03:12:03 -0700 (PDT)
Message-ID: <634e7bf3.170a0220.e7637.f10f@mx.google.com>
Date: Tue, 18 Oct 2022 03:12:03 -0700 (PDT)
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
X-Kernelci-Kernel: v6.1-rc1-2-gc7e2618e1256
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci cros-ec: 10 runs,
 8 regressions (v6.1-rc1-2-gc7e2618e1256)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 10 runs, 8 regressions (v6.1-rc1-2-gc=
7e2618e1256)

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
ci/kernel/v6.1-rc1-2-gc7e2618e1256/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.1-rc1-2-gc7e2618e1256
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      c7e2618e12562ba6f9d230d8ed4257dfa94d2d9d

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


  Details:     https://kernelci.org/test/plan/id/634e6413d1ee4c3317c2a874

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-2-gc7e2618e1256/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/cros-ec-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-2-gc7e2618e1256/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/cros-ec-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221007.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
34e6413d1ee4c3317c2a885
        failing since 56 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-10-18T08:29:50.362609  / # =

    2022-10-18T08:29:50.367103  =

    2022-10-18T08:29:50.468759  / # #
    2022-10-18T08:29:50.473579  #
    2022-10-18T08:29:50.574534  / # export SHELL=3D/bin/sh
    2022-10-18T08:29:50.574744  <4>[    8.561223] cros-ec-spi spi-PRP0001:0=
1: EC failed to respond in time
    2022-10-18T08:29:50.574825  <3>[    8.568718] cros-ec-spi spi-PRP0001:0=
1: Cannot identify the EC: error -110
    2022-10-18T08:29:50.574896  <3>[    8.576706] cros-ec-spi spi-PRP0001:0=
1: cannot register EC
    2022-10-18T08:29:50.574960  <4>[    8.583266] cros-ec-spi: probe of spi=
-PRP0001:01 failed with error -110
    2022-10-18T08:29:50.579628  export SHELL=3D/bin/sh =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/634e63e18c036cc2f4c2a845

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-2-gc7e2618e1256/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-2-gc7e2618e1256/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221007.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
4e63e18c036cc2f4c2a84e
        failing since 56 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
34e63e18c036cc2f4c2a850
        failing since 56 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-10-18T08:29:06.934445  / # =

    2022-10-18T08:29:06.939551  =

    2022-10-18T08:29:07.041396  / # #
    2022-10-18T08:29:07.046622  #
    2022-10-18T08:29:07.147660  / # export SHELL=3D/bin/sh
    2022-10-18T08:29:07.152633  export SHELL=3D/bin/sh
    2022-10-18T08:29:07.253497  / # . /lava-7624511/environment
    2022-10-18T08:29:07.257940  . /lava-7624511/environment
    2022-10-18T08:29:07.358905  / # /lava-7624511/bin/lava-test-runner /lav=
a-7624511/0
    2022-10-18T08:29:07.363817  /lava-7624511/bin/lava-test-runner /lava-76=
24511/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/634e63fd825a4f8bb6c2a86b

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-2-gc7e2618e1256/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/cros-ec-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-2-gc7e2618e1256/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/cros-ec-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221007.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
4e63fd825a4f8bb6c2a87c
        failing since 56 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
34e63fd825a4f8bb6c2a87e
        failing since 56 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-10-18T08:29:22.457718  / # =

    2022-10-18T08:29:22.462645  =

    2022-10-18T08:29:22.564236  / # #
    2022-10-18T08:29:22.569554  #
    2022-10-18T08:29:22.670539  / # export SHELL=3D/bin/sh
    2022-10-18T08:29:22.675565  export SHELL=3D/bin/sh
    2022-10-18T08:29:22.776399  / # . /lava-7624548/environment
    2022-10-18T08:29:22.781497  . /lava-7624548/environment
    2022-10-18T08:29:22.882442  / # /lava-7624548/bin/lava-test-runner /lav=
a-7624548/0
    2022-10-18T08:29:22.887749  /lava-7624548/bin/lava-test-runner /lava-76=
24548/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/634e6892899116b6bfc2a855

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-2-gc7e2618e1256/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/cros-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-2-gc7e2618e1256/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/cros-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221007.0/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
4e6893899116b6bfc2a866
        failing since 47 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
34e6893899116b6bfc2a868
        failing since 47 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483)

    2022-10-18T08:49:10.477753  / # =

    2022-10-18T08:49:10.481346  =

    2022-10-18T08:49:10.590211  / ##
    2022-10-18T08:49:10.593693   #
    2022-10-18T08:49:10.698970  / # export SHELL=3D/bin/sh
    2022-10-18T08:49:10.702121  export SHELL=3D/bin/sh
    2022-10-18T08:49:10.805868  / # . /lava-7624663/environment
    2022-10-18T08:49:10.809559  . /lava-7624663/environment
    2022-10-18T08:49:10.912873  / # /lava-7624663/bin/lava-test-runner /lav=
a-7624663/0
    2022-10-18T08:49:10.916584  /lava-7624663/bin/lava-test-runner /lava-76=
24663/0 =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/634e675136513a5aebc2a8af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-2-gc7e2618e1256/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/cros-ec-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-2-gc7e2618e1256/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/cros-ec-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221007.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/634e675136513a5aebc2a8=
b0
        failing since 0 day (last pass: v6.0-rc1-20-g95a789b97c72, first fa=
il: v6.1-rc1-1-g8b78c14e29f19) =

 =20
