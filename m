Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C3389BB
	for <chrome-platform@lists.linux.dev>; Wed,  7 Sep 2022 20:32:57 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id 78so14644558pgb.13
        for <chrome-platform@lists.linux.dev>; Wed, 07 Sep 2022 13:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=iEI9Um6JPNc862UdntLoUejejswjaMLSJLaD1wB2PeE=;
        b=q8dUzpqObNnNEaP6EflAR+LlkftrxqBLpefX5bywXmBPP1qPVXBeNS4O3CQWbpN8cl
         HdInhIBDHvgxcJfORPzaWmsdtc+qnkEGwS27QVJqT08DWztSVULseHiQXUhfnKNidJnk
         zxTgQ4x/SMIoYB3ggeIWzQreN8goe9BPKN/WokEQb2TC4t0CX76tBbegfczl0i9kNc7f
         wcuafwmjNPJtHYohzzjUrBTHxmmjioew48ANPLfFfufKShLZZd8PwxX3rzlfRUpqBlWZ
         AfSNHJsCQ5rdkd8nvEjz9CexkB/z/bk37Z5n+JZl7qSjdrUbRSB8KETSxFpGq+MabCed
         LDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=iEI9Um6JPNc862UdntLoUejejswjaMLSJLaD1wB2PeE=;
        b=5PCMQAweld4SlQC8a23v5khdR6uuUF/DnBCCHwTurK+KwiyN8q60OOO9hXP+W2Op8D
         1Q97oJE/o5Y6wsMFQbTG1+0ApaHMzGSHJh0cRIIGXtfp3bp6Ons6Nhn/d4LzhQ0oRFU/
         KTdi9Qieq46O2gkTaAJf/MSE+B8AqofaoSNOt3LyGohc9wqeE1GtmTvwfSM3sE6ZIBvX
         6VvICQPhEqfvO4finVzgygaNR+HI2kRLaY95251d+bx3NN+h869Pf8Dpz1P26wAaH3EX
         tD3W4LwWfh0uOg0GTAnPUADpi+aUYfi5gvkoWa7acgnP5O95kFJlpAveKz3Ss9JXNzw+
         r+1A==
X-Gm-Message-State: ACgBeo2w4/ZtA9aAOf7pPMkIAR+fITSWCZFpY9k4f/pbYbHD/O5xrbEO
	IoOXoc3PsZdxWFEj6k3KBl2ejg==
X-Google-Smtp-Source: AA6agR7rrJov/FryWkT17pbt0cyczASkariV1lfmvPlJ/yJLE59nHtIfB2Plj46XgcyAOTk4qOnyBQ==
X-Received: by 2002:a63:8243:0:b0:42b:1d94:3c66 with SMTP id w64-20020a638243000000b0042b1d943c66mr5014259pgd.278.1662582776629;
        Wed, 07 Sep 2022 13:32:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b29-20020a631b1d000000b0043087a64bd5sm10821858pgb.10.2022.09.07.13.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 13:32:56 -0700 (PDT)
Message-ID: <6318fff8.630a0220.7e046.0151@mx.google.com>
Date: Wed, 07 Sep 2022 13:32:56 -0700 (PDT)
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
X-Kernelci-Kernel: v6.0-rc1-19-gd378c6f0456c
Subject: chrome-platform/for-kernelci cros-ec: 8 runs,
 8 regressions (v6.0-rc1-19-gd378c6f0456c)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 8 runs, 8 regressions (v6.0-rc1-19-gd=
378c6f0456c)

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

mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.0-rc1-19-gd378c6f0456c/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.0-rc1-19-gd378c6f0456c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      d378c6f0456c101563fdac68c11e64c3a00ad3c2

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


  Details:     https://kernelci.org/test/plan/id/6318e94d188bc7c6a8355646

  Results:     8 PASS, 2 FAIL, 9 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-19-gd378c6f0456c/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-19-gd378c6f0456c/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
318e94d188bc7c6a8355659
        failing since 15 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-09-07T18:55:49.023198  / # =

    2022-09-07T18:55:49.029925  =

    2022-09-07T18:55:49.136549  / # #
    2022-09-07T18:55:49.143090  #
    2022-09-07T18:55:49.245820  / # export SHELL=3D/bin/sh
    2022-09-07T18:55:49.252368  export SHELL=3D/bin/sh
    2022-09-07T18:55:49.354487  / # . /lava-7206957/environment
    2022-09-07T18:55:49.360822  . /lava-7206957/environment
    2022-09-07T18:55:49.463080  / # /lava-7206957/bin/lava-test-runner /lav=
a-7206957/0
    2022-09-07T18:55:49.469453  /lava-7206957/bin/lava-test-runner /lava-72=
06957/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/6318ea152dc00d52e635566a

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-19-gd378c6f0456c/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-19-gd378c6f0456c/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
18ea162dc00d52e635567b
        failing since 15 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
318ea162dc00d52e635567d
        failing since 15 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-09-07T18:59:24.807526  / # =

    2022-09-07T18:59:24.812527  =

    2022-09-07T18:59:24.914388  / # #
    2022-09-07T18:59:24.919117  #
    2022-09-07T18:59:25.020206  / # export SHELL=3D/bin/sh
    2022-09-07T18:59:25.024615  export SHELL=3D/bin/sh
    2022-09-07T18:59:25.125350  / # . /lava-7206939/environment
    2022-09-07T18:59:25.129719  . /lava-7206939/environment
    2022-09-07T18:59:25.230670  / # /lava-7206939/bin/lava-test-runner /lav=
a-7206939/0
    2022-09-07T18:59:25.235296  /lava-7206939/bin/lava-test-runner /lava-72=
06939/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/6318e939ab6c1d9b8a355654

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-19-gd378c6f0456c/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-19-gd378c6f0456c/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
18e939ab6c1d9b8a355665
        failing since 15 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
318e939ab6c1d9b8a355667
        failing since 15 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-09-07T18:55:36.527904  / # =

    2022-09-07T18:55:36.532498  =

    2022-09-07T18:55:36.634172  / # #
    2022-09-07T18:55:36.638994  #
    2022-09-07T18:55:36.739953  / # export SHELL=3D/bin/sh
    2022-09-07T18:55:36.744782  export SHELL=3D/bin/sh
    2022-09-07T18:55:36.845669  / # . /lava-7206905/environment
    2022-09-07T18:55:36.850525  . /lava-7206905/environment
    2022-09-07T18:55:36.951445  / # /lava-7206905/bin/lava-test-runner /lav=
a-7206905/0
    2022-09-07T18:55:36.956625  /lava-7206905/bin/lava-test-runner /lava-72=
06905/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6318ec45752108eeb4355650

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-19-gd378c6f0456c/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-19-gd378c6f0456c/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/6318ec45752108eeb43556=
51
        new failure (last pass: v6.0-rc1-18-gf36a064d1483) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/6318eb41e8dbddc6fe355642

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-19-gd378c6f0456c/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-19-gd378c6f0456c/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
18eb41e8dbddc6fe355653
        failing since 6 days (last pass: tag-chrome-platform-for-v5.20-2-gd=
dffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
318eb41e8dbddc6fe355655
        failing since 6 days (last pass: tag-chrome-platform-for-v5.20-2-gd=
dffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483)

    2022-09-07T19:04:23.418588  / # =

    2022-09-07T19:04:23.421835  =

    2022-09-07T19:04:23.529601  / # #
    2022-09-07T19:04:23.532592  #
    2022-09-07T19:04:23.637009  / # export SHELL=3D/bin/sh
    2022-09-07T19:04:23.640300  export SHELL=3D/bin/sh
    2022-09-07T19:04:23.744290  / # . /lava-7207012/environment
    2022-09-07T19:04:23.747959  . /lava-7207012/environment
    2022-09-07T19:04:23.852142  / #/lava-7207012/bin/lava-test-runner /lava=
-7207012/0
    2022-09-07T19:04:23.855274   /lava-7207012/bin/lava-test-runner /lava-7=
207012/0 =

    ... (10 line(s) more)  =

 =20
