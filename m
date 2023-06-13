Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04AB27738
	for <chrome-platform@lists.linux.dev>; Tue, 13 Jun 2023 10:11:11 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-54fbcfe65caso195305a12.1
        for <chrome-platform@lists.linux.dev>; Tue, 13 Jun 2023 03:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686651071; x=1689243071;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GEc1NPRSxIYpYwChzRhCtTm1KiRF9lXZCJQAXNAuqZM=;
        b=duMwfQT2pYypCutz5f2QT5zIsxmJUvPBPyKIhEQR4EasMBcqwRMei+aByUHDgsdDXe
         wlF3vZIS36QMl1UY6qldnKir17xO8PrFqNQ5/4PJjC6z1ZRJkkVKWellvc/L78A3jzC5
         Y79G/vVxN1d7eoc15+Xqtu5/0C8OnYf03gC4gAxjV+TfY8EtAurYo2cr8wjoq+sK5TrX
         cKnC80S/6SMLV/ZdRPu4ZnVAjavpTePw4RXUCLUZh8LJ+e8T5KTiv3YMUFyzUtfQNXnD
         PIlxDdWwQxDh+IQTTCidA0f36VRC2vmipvQPnpecdJa9/kDHBOL4iH3RSFz4zvzorzD3
         8Dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686651071; x=1689243071;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GEc1NPRSxIYpYwChzRhCtTm1KiRF9lXZCJQAXNAuqZM=;
        b=HEcKIAE99Nxn2ezpw/b5XExF+vR1YsVBFEiZdPMFnvkupHWQIT1UEion7ELUQEY1Vt
         mFjJ5Q4EP4BauIt64BuJUfzpWa5VbKHKIBcIncikEULZ9HRDZyyP2Skqx+SU6Laa2OsE
         3AxDlfr5+269J2XIZS35D5XIgO7Cp8D8D5B97FW7VDmfMrBGxjJgnXBy7J0qlj9dC5h/
         rcmJZpP7S/cmgnd5bsCt2od+lZjElU4rTFV06O+mdS2CprugWyoe0RqzhzTffBihZxbU
         /3ZkgFqXXvTXnTg2gQDGo8+ZY8fpxiMvLixKAJ4oVJ8uRkImJR1r6ey90B2ZVh6fliMJ
         GmMQ==
X-Gm-Message-State: AC+VfDxJqEBEKDh0uxk6KF8W7Kv/2Ve4lKMPSp2rmhNDd6ST15Xz/tpa
	0xuangELTxQ3LAe5hjENkMKKvg==
X-Google-Smtp-Source: ACHHUZ5+6jHAKDf6hRrL/PmksS7Wp7KJfVc6Q66nfCXH/y0jyFMzgp2WNLpcwBIEYzBx1UDH5Dzt+Q==
X-Received: by 2002:a17:90a:9b89:b0:25c:186b:8f76 with SMTP id g9-20020a17090a9b8900b0025c186b8f76mr1694103pjp.4.1686651070754;
        Tue, 13 Jun 2023 03:11:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 3-20020a17090a194300b0025b83c6227asm8294515pjh.3.2023.06.13.03.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 03:11:10 -0700 (PDT)
Message-ID: <648840be.170a0220.95016.1426@mx.google.com>
Date: Tue, 13 Jun 2023 03:11:10 -0700 (PDT)
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
X-Kernelci-Kernel: v6.4-rc1-5-g2b8cc5858a07a
Subject: chrome-platform/for-kernelci baseline: 81 runs,
 14 regressions (v6.4-rc1-5-g2b8cc5858a07a)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 81 runs, 14 regressions (v6.4-rc1-5-=
g2b8cc5858a07a)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.4-rc1-5-g2b8cc5858a07a/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.4-rc1-5-g2b8cc5858a07a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      2b8cc5858a07ab75ce98cae720e263e1c1b0d1d9 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6488346a301186580d3061a3

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6488346a301186580d3061a8
        failing since 66 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-06-13T09:18:13.873037  + set<8>[   11.779230] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10702879_1.4.2.3.1>

    2023-06-13T09:18:13.873464   +x

    2023-06-13T09:18:13.978986  / # #

    2023-06-13T09:18:14.081331  export SHELL=3D/bin/sh

    2023-06-13T09:18:14.082080  #

    2023-06-13T09:18:14.183595  / # export SHELL=3D/bin/sh. /lava-10702879/=
environment

    2023-06-13T09:18:14.184345  =


    2023-06-13T09:18:14.285976  / # . /lava-10702879/environment/lava-10702=
879/bin/lava-test-runner /lava-10702879/1

    2023-06-13T09:18:14.287160  =


    2023-06-13T09:18:14.292633  / # /lava-10702879/bin/lava-test-runner /la=
va-10702879/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6488341c8a523c931e30614c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6488341c8a523c931e306151
        failing since 66 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-06-13T09:17:11.703604  <8>[   10.591963] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10702838_1.4.2.3.1>

    2023-06-13T09:17:11.707228  + set +x

    2023-06-13T09:17:11.808405  /#

    2023-06-13T09:17:11.909146   # #export SHELL=3D/bin/sh

    2023-06-13T09:17:11.909336  =


    2023-06-13T09:17:12.009801  / # export SHELL=3D/bin/sh. /lava-10702838/=
environment

    2023-06-13T09:17:12.009991  =


    2023-06-13T09:17:12.110469  / # . /lava-10702838/environment/lava-10702=
838/bin/lava-test-runner /lava-10702838/1

    2023-06-13T09:17:12.110754  =


    2023-06-13T09:17:12.115387  / # /lava-10702838/bin/lava-test-runner /la=
va-10702838/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6488342285732271e0306152

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6488342285732271e0306157
        failing since 66 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-06-13T09:17:10.633516  + set +x

    2023-06-13T09:17:10.639713  <8>[   10.078468] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10702861_1.4.2.3.1>

    2023-06-13T09:17:10.743863  / # #

    2023-06-13T09:17:10.844479  export SHELL=3D/bin/sh

    2023-06-13T09:17:10.844659  #

    2023-06-13T09:17:10.945122  / # export SHELL=3D/bin/sh. /lava-10702861/=
environment

    2023-06-13T09:17:10.945293  =


    2023-06-13T09:17:11.045793  / # . /lava-10702861/environment/lava-10702=
861/bin/lava-test-runner /lava-10702861/1

    2023-06-13T09:17:11.046043  =


    2023-06-13T09:17:11.051057  / # /lava-10702861/bin/lava-test-runner /la=
va-10702861/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6488341c85732271e030612e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6488341c85732271e0306133
        failing since 66 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-06-13T09:17:17.405169  + <8>[   10.945546] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10702868_1.4.2.3.1>

    2023-06-13T09:17:17.405249  set +x

    2023-06-13T09:17:17.506421  #

    2023-06-13T09:17:17.607185  / # #export SHELL=3D/bin/sh

    2023-06-13T09:17:17.607377  =


    2023-06-13T09:17:17.707875  / # export SHELL=3D/bin/sh. /lava-10702868/=
environment

    2023-06-13T09:17:17.708075  =


    2023-06-13T09:17:17.808590  / # . /lava-10702868/environment/lava-10702=
868/bin/lava-test-runner /lava-10702868/1

    2023-06-13T09:17:17.808894  =


    2023-06-13T09:17:17.813429  / # /lava-10702868/bin/lava-test-runner /la=
va-10702868/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6488343085732271e0306194

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6488343085732271e0306199
        failing since 66 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-06-13T09:17:22.850176  + set<8>[   10.894596] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10702829_1.4.2.3.1>

    2023-06-13T09:17:22.850599   +x

    2023-06-13T09:17:22.957743  / # #

    2023-06-13T09:17:23.060341  export SHELL=3D/bin/sh

    2023-06-13T09:17:23.060539  #

    2023-06-13T09:17:23.161045  / # export SHELL=3D/bin/sh. /lava-10702829/=
environment

    2023-06-13T09:17:23.161242  =


    2023-06-13T09:17:23.261896  / # . /lava-10702829/environment/lava-10702=
829/bin/lava-test-runner /lava-10702829/1

    2023-06-13T09:17:23.263482  =


    2023-06-13T09:17:23.268089  / # /lava-10702829/bin/lava-test-runner /la=
va-10702829/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6488367402c08d90ce30614f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/base=
line-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/base=
line-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6488367402c08d90ce306154
        failing since 50 days (last pass: v6.3-rc1-8-g0ad5ce8407db, first f=
ail: tag-chrome-platform-for-v6.4)

    2023-06-13T09:27:03.028828  + set +x
    2023-06-13T09:27:03.029011  [   13.557332] <LAVA_SIGNAL_ENDRUN 0_dmesg =
975493_1.5.2.3.1>
    2023-06-13T09:27:03.135963  / # #
    2023-06-13T09:27:03.237617  export SHELL=3D/bin/sh
    2023-06-13T09:27:03.238091  #
    2023-06-13T09:27:03.339366  / # export SHELL=3D/bin/sh. /lava-975493/en=
vironment
    2023-06-13T09:27:03.339871  =

    2023-06-13T09:27:03.441131  / # . /lava-975493/environment/lava-975493/=
bin/lava-test-runner /lava-975493/1
    2023-06-13T09:27:03.441732  =

    2023-06-13T09:27:03.444693  / # /lava-975493/bin/lava-test-runner /lava=
-975493/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/648834c00f6731a86f306132

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/arm64/defconfig/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/arm64/defconfig/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648834c00f6731a86f306=
133
        new failure (last pass: v6.4-rc1-4-gf5bb4e381290) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6488341e85732271e030613c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6488341e85732271e0306141
        failing since 66 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-06-13T09:17:07.514189  + set<8>[    8.791967] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10702837_1.4.2.3.1>

    2023-06-13T09:17:07.514281   +x

    2023-06-13T09:17:07.618584  / # #

    2023-06-13T09:17:07.719252  export SHELL=3D/bin/sh

    2023-06-13T09:17:07.719489  #

    2023-06-13T09:17:07.820065  / # export SHELL=3D/bin/sh. /lava-10702837/=
environment

    2023-06-13T09:17:07.820300  =


    2023-06-13T09:17:07.920875  / # . /lava-10702837/environment/lava-10702=
837/bin/lava-test-runner /lava-10702837/1

    2023-06-13T09:17:07.921193  =


    2023-06-13T09:17:07.925971  / # /lava-10702837/bin/lava-test-runner /la=
va-10702837/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64883767247acd06093061a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64883767247acd0609306=
1a7
        failing since 35 days (last pass: tag-chrome-platform-for-v6.4, fir=
st fail: v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/6488368c99376e0da230615a

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6488368c99376e0=
da23061b1
        failing since 35 days (last pass: tag-chrome-platform-for-v6.4, fir=
st fail: v6.4-rc1)
        2 lines

    2023-06-13T09:27:09.226742  fo:

    2023-06-13T09:27:09.230795  kern  :alert :   ESR =3D 0x0000000096000006

    2023-06-13T09:27:09.236711  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-06-13T09:27:09.240923  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-06-13T09:27:09.243517  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-06-13T09:27:09.249662  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-06-13T09:27:09.252631  kern  :alert : Data abort info:

    2023-06-13T09:27:09.256499  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-06-13T09:27:09.260655  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-06-13T09:27:09.273911  kern  :alert : user pgtable: 4k pages<8>[  =
 19.345877] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6488368c99376e0=
da23061b2
        failing since 35 days (last pass: tag-chrome-platform-for-v6.4, fir=
st fail: v6.4-rc1)
        12 lines

    2023-06-13T09:27:09.214060  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-06-13T09:27:09.226052  kern  :alert : Mem abort in<8>[   19.295668=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/648833bed6a29c9e8730612e

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/arm64/defconfig/gcc-10/lab-collabora/baseline-rk33=
99-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/arm64/defconfig/gcc-10/lab-collabora/baseline-rk33=
99-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/648833bed6a29c9=
e87306135
        failing since 35 days (last pass: tag-chrome-platform-for-v6.4, fir=
st fail: v6.4-rc1)
        2 lines

    2023-06-13T09:15:28.957220  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-06-13T09:15:28.957825  kern  :emerg : Code: 97fb7910 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-06-13T09:15:28.958330  <8>[   29.000770] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-06-13T09:15:28.958803  + set +x

    2023-06-13T09:15:28.959259  <8>[   29.002823] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10702753_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/648833bed6a29c9=
e87306136
        failing since 35 days (last pass: tag-chrome-platform-for-v6.4, fir=
st fail: v6.4-rc1)
        12 lines

    2023-06-13T09:15:28.929832  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-06-13T09:15:28.930119  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-06-13T09:15:28.930336  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000078ce1000

    2023-06-13T09:15:28.930534  kern  :alert : [0000000000000008] pgd=3D080=
0000078cdb003, p4d=3D0800000078cdb003, pud=3D0800000078cda003, pmd=3D000000=
0000000000

    2023-06-13T09:15:28.930718  <8>[   28.976147] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/648834ee96e025af79306167

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648834ee96e025af79306=
168
        new failure (last pass: v6.4-rc1-4-gf5bb4e381290) =

 =20
