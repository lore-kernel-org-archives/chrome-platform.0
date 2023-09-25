Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE967F
	for <chrome-platform@lists.linux.dev>; Mon, 25 Sep 2023 03:49:25 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-59c07cf02ebso66345517b3.1
        for <chrome-platform@lists.linux.dev>; Sun, 24 Sep 2023 20:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695613765; x=1696218565; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=On4I6SImBZtXwT+lwFvG4NafFgm8j1aFI2ULXSfKfLI=;
        b=yXYsUFlY87GCrMKY+dqP7F+IYSpjBRL2Cw37nBBY3jsar4xR9z3Wd4OFpwMuX3apjY
         vZypZI2WxUSSI/sxQNkOXeGs3JGG4bDl5uqmbEuo6r4GEFyf6yrTzVCQYmwDhJwYG0cc
         1ivOiKcx8Ino4Fsz4hmprcA2SI8oLzEUFvd7nZu43zZV1DHYgTp2KPc2qZZT9nkeVnoW
         pSW/HhDojT9I9AB6Nw7YQ9sFFHrOBQ5ACSKNhwvjWGKSpRU6TNqptdM6CeXmc5H/BiZk
         7T2Mi+avXpBVzDIHiUZ69Ei+yC/Q+MdxachJiUSXR3BNByPkJ4fu6Brx60gUwGkx8VX1
         XN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695613765; x=1696218565;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=On4I6SImBZtXwT+lwFvG4NafFgm8j1aFI2ULXSfKfLI=;
        b=HmHCi7XDDyhCMsZTFHPHGO1wJghTr0EF+RazXxhcj81nuL1G1uCFShPRI8A/tu+bfS
         bbxwTFd7+T239MGWUSrriBZxI3GdGRJgS+ie7L7VchdS+IwaglRmwyoTQEM440vVEV1F
         fwMA6/uqWnpKLy6bCtlFuHLGnzP8QRC4HH3ZRMMKGiGeTEh8fI61mNEcyy741ChPwM7u
         J5r6xBNutCTUGGiH2EkSXT0UZbEdgol7KoZf8MiOgivcNnhL7wH084+cj9xr8cKA1f2s
         Okv2bC4DJBsnZD5rhBios0TE3xA78pSGqDcxtQTkNVvoAKFjisB+qDSeTqglSz860w6m
         gbFw==
X-Gm-Message-State: AOJu0YxZPCj6OJY0EZr59qOE+B2484QTG7/wOMfWQFRD7O6uDqgRQpVf
	nJGLkYExp6m/3MlssldiaMsGPVs7Ktlv4L3cogLEVQ==
X-Google-Smtp-Source: AGHT+IHtEN9gZZhD+DPytKxgcKfNIe/w1akhSMU0BlQyWEJCBKrLc4I5xTIpRJRFiFKZlCV3XTYFpw==
X-Received: by 2002:a81:4322:0:b0:59f:7d1a:fd94 with SMTP id q34-20020a814322000000b0059f7d1afd94mr1717017ywa.21.1695613764665;
        Sun, 24 Sep 2023 20:49:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id sf9-20020a17090b51c900b002609cadc56esm6833257pjb.11.2023.09.24.20.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 20:49:23 -0700 (PDT)
Message-ID: <65110343.170a0220.5c11a.e1f3@mx.google.com>
Date: Sun, 24 Sep 2023 20:49:23 -0700 (PDT)
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
X-Kernelci-Kernel: v6.6-rc1-1-g1aa8df90f456
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 77 runs,
 12 regressions (v6.6-rc1-1-g1aa8df90f456)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 77 runs, 12 regressions (v6.6-rc1-1-=
g1aa8df90f456)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

r8a77960-ulcb                | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.6-rc1-1-g1aa8df90f456/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.6-rc1-1-g1aa8df90f456
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      1aa8df90f4569acd36d2c94a9cfe1eee561575d6 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6510f7731ea63d52118a0a73

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-1-g1aa8df90f456/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-1-g1aa8df90f456/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6510f7731ea63d52118a0a88
        failing since 13 days (last pass: v6.5-rc1-4-g0820debb7d489, first =
fail: v6.6-rc1)

    2023-09-25T02:58:41.226979  + <8>[    8.434863] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11610581_1.4.2.3.1>

    2023-09-25T02:58:41.227412  set +x

    2023-09-25T02:58:41.336276  / # #

    2023-09-25T02:58:41.438765  export SHELL=3D/bin/sh

    2023-09-25T02:58:41.439478  #

    2023-09-25T02:58:41.541062  / # export SHELL=3D/bin/sh. /lava-11610581/=
environment

    2023-09-25T02:58:41.541848  =


    2023-09-25T02:58:41.643414  / # . /lava-11610581/environment/lava-11610=
581/bin/lava-test-runner /lava-11610581/1

    2023-09-25T02:58:41.644539  =


    2023-09-25T02:58:41.649437  / # /lava-11610581/bin/lava-test-runner /la=
va-11610581/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6510f7841ea63d52118a0ac1

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-1-g1aa8df90f456/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-1-g1aa8df90f456/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6510f7841ea63d52118a0aca
        failing since 170 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-09-25T02:58:53.921270  + set<8>[   12.023765] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11610570_1.4.2.3.1>

    2023-09-25T02:58:53.921923   +x

    2023-09-25T02:58:54.030005  / # #

    2023-09-25T02:58:54.132661  export SHELL=3D/bin/sh

    2023-09-25T02:58:54.133484  #

    2023-09-25T02:58:54.235092  / # export SHELL=3D/bin/sh. /lava-11610570/=
environment

    2023-09-25T02:58:54.235918  =


    2023-09-25T02:58:54.337577  / # . /lava-11610570/environment/lava-11610=
570/bin/lava-test-runner /lava-11610570/1

    2023-09-25T02:58:54.338921  =


    2023-09-25T02:58:54.344106  / # /lava-11610570/bin/lava-test-runner /la=
va-11610570/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6510f77b1ea63d52118a0ab6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-1-g1aa8df90f456/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-1-g1aa8df90f456/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6510f77b1ea63d52118a0abf
        failing since 170 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-09-25T02:58:52.828530  <8>[   10.493482] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11610576_1.4.2.3.1>

    2023-09-25T02:58:52.831989  + set +x

    2023-09-25T02:58:52.933350  #

    2023-09-25T02:58:52.933754  =


    2023-09-25T02:58:53.034605  / # #export SHELL=3D/bin/sh

    2023-09-25T02:58:53.034809  =


    2023-09-25T02:58:53.135507  / # export SHELL=3D/bin/sh. /lava-11610576/=
environment

    2023-09-25T02:58:53.136155  =


    2023-09-25T02:58:53.237599  / # . /lava-11610576/environment/lava-11610=
576/bin/lava-test-runner /lava-11610576/1

    2023-09-25T02:58:53.238044  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6510f75307c34ffef08a0a52

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-1-g1aa8df90f456/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-1-g1aa8df90f456/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6510f75307c34ffef08a0a67
        failing since 13 days (last pass: v6.5-rc1-4-g0820debb7d489, first =
fail: v6.6-rc1)

    2023-09-25T02:58:10.845381  + <8>[    8.476902] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11610580_1.4.2.3.1>

    2023-09-25T02:58:10.845466  set +x

    2023-09-25T02:58:10.950096  / # #

    2023-09-25T02:58:11.050711  export SHELL=3D/bin/sh

    2023-09-25T02:58:11.050928  #

    2023-09-25T02:58:11.151433  / # export SHELL=3D/bin/sh. /lava-11610580/=
environment

    2023-09-25T02:58:11.151616  =


    2023-09-25T02:58:11.252145  / # . /lava-11610580/environment/lava-11610=
580/bin/lava-test-runner /lava-11610580/1

    2023-09-25T02:58:11.252429  =


    2023-09-25T02:58:11.256595  / # /lava-11610580/bin/lava-test-runner /la=
va-11610580/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6510f75fac24413d5b8a0a73

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-1-g1aa8df90f456/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-1-g1aa8df90f456/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6510f75fac24413d5b8a0a88
        failing since 13 days (last pass: v6.5-rc1-4-g0820debb7d489, first =
fail: v6.6-rc1)

    2023-09-25T02:58:25.874556  + <8>[   10.404020] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11610569_1.4.2.3.1>

    2023-09-25T02:58:25.875020  set +x

    2023-09-25T02:58:25.983012  / # #

    2023-09-25T02:58:26.085438  export SHELL=3D/bin/sh

    2023-09-25T02:58:26.086197  #

    2023-09-25T02:58:26.187774  / # export SHELL=3D/bin/sh. /lava-11610569/=
environment

    2023-09-25T02:58:26.188486  =


    2023-09-25T02:58:26.289892  / # . /lava-11610569/environment/lava-11610=
569/bin/lava-test-runner /lava-11610569/1

    2023-09-25T02:58:26.291080  =


    2023-09-25T02:58:26.295681  / # /lava-11610569/bin/lava-test-runner /la=
va-11610569/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6510f7e2ce6cf6b4698a0a44

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-1-g1aa8df90f456/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-1-g1aa8df90f456/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6510f7e2ce6cf6b4698a0a4d
        failing since 170 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-09-25T03:00:34.319572  + set +x

    2023-09-25T03:00:34.326650  <8>[   10.483863] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11610584_1.4.2.3.1>

    2023-09-25T03:00:34.434886  / # #

    2023-09-25T03:00:34.537318  export SHELL=3D/bin/sh

    2023-09-25T03:00:34.538157  #

    2023-09-25T03:00:34.639717  / # export SHELL=3D/bin/sh. /lava-11610584/=
environment

    2023-09-25T03:00:34.640535  =


    2023-09-25T03:00:34.742167  / # . /lava-11610584/environment/lava-11610=
584/bin/lava-test-runner /lava-11610584/1

    2023-09-25T03:00:34.743591  =


    2023-09-25T03:00:34.748902  / # /lava-11610584/bin/lava-test-runner /la=
va-11610584/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6510f7641ea63d52118a0a42

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-1-g1aa8df90f456/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-1-g1aa8df90f456/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6510f7641ea63d52118a0a4b
        failing since 170 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-09-25T02:58:34.034091  + set +x<8>[   10.932684] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 11610592_1.4.2.3.1>

    2023-09-25T02:58:34.034563  =


    2023-09-25T02:58:34.141988  #

    2023-09-25T02:58:34.244968  / # #export SHELL=3D/bin/sh

    2023-09-25T02:58:34.245877  =


    2023-09-25T02:58:34.347529  / # export SHELL=3D/bin/sh. /lava-11610592/=
environment

    2023-09-25T02:58:34.348392  =


    2023-09-25T02:58:34.450030  / # . /lava-11610592/environment/lava-11610=
592/bin/lava-test-runner /lava-11610592/1

    2023-09-25T02:58:34.451442  =


    2023-09-25T02:58:34.456674  / # /lava-11610592/bin/lava-test-runner /la=
va-11610592/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6510f786606db9e2f38a0a57

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-1-g1aa8df90f456/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-1-g1aa8df90f456/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6510f786606db9e2f38a0a60
        failing since 170 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-09-25T02:58:54.686250  + set<8>[   11.057284] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11610609_1.4.2.3.1>

    2023-09-25T02:58:54.686334   +x

    2023-09-25T02:58:54.790571  / # #

    2023-09-25T02:58:54.891160  export SHELL=3D/bin/sh

    2023-09-25T02:58:54.891339  #

    2023-09-25T02:58:54.991873  / # export SHELL=3D/bin/sh. /lava-11610609/=
environment

    2023-09-25T02:58:54.992057  =


    2023-09-25T02:58:55.092581  / # . /lava-11610609/environment/lava-11610=
609/bin/lava-test-runner /lava-11610609/1

    2023-09-25T02:58:55.093836  =


    2023-09-25T02:58:55.098269  / # /lava-11610609/bin/lava-test-runner /la=
va-11610609/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6510f8746a5980c3188a0a58

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-1-g1aa8df90f456/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-=
evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-1-g1aa8df90f456/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6510f8746a5980c3188a0a61
        failing since 13 days (last pass: v6.5-rc1-4-g0820debb7d489, first =
fail: v6.6-rc1)

    2023-09-25T03:02:50.618974  + set<8>[   28.522385] <LAVA_SIGNAL_ENDRUN =
0_dmesg 129870_1.5.2.4.1>
    2023-09-25T03:02:50.619558   +x
    2023-09-25T03:02:50.728018  / # #
    2023-09-25T03:02:51.894025  export SHELL=3D/bin/sh
    2023-09-25T03:02:51.900136  #
    2023-09-25T03:02:53.399336  / # export SHELL=3D/bin/sh. /lava-129870/en=
vironment
    2023-09-25T03:02:53.405357  =

    2023-09-25T03:02:56.128490  / # . /lava-129870/environment/lava-129870/=
bin/lava-test-runner /lava-129870/1
    2023-09-25T03:02:56.135361  =

    2023-09-25T03:02:56.151586  / # /lava-129870/bin/lava-test-runner /lava=
-129870/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6510f7dab81d868a3a8a0a97

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-1-g1aa8df90f456/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-1-g1aa8df90f456/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6510f7dab81d868a3a8a0aa0
        failing since 170 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-09-25T03:00:27.950444  + set<8>[   11.811721] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11610579_1.4.2.3.1>

    2023-09-25T03:00:27.951023   +x

    2023-09-25T03:00:28.058363  / # #

    2023-09-25T03:00:28.160799  export SHELL=3D/bin/sh

    2023-09-25T03:00:28.161542  #

    2023-09-25T03:00:28.263224  / # export SHELL=3D/bin/sh. /lava-11610579/=
environment

    2023-09-25T03:00:28.263963  =


    2023-09-25T03:00:28.365544  / # . /lava-11610579/environment/lava-11610=
579/bin/lava-test-runner /lava-11610579/1

    2023-09-25T03:00:28.366733  =


    2023-09-25T03:00:28.371259  / # /lava-11610579/bin/lava-test-runner /la=
va-11610579/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77960-ulcb                | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6510f832536883f78c8a0a4d

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-1-g1aa8df90f456/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77=
960-ulcb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-1-g1aa8df90f456/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77=
960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6510f832536883f78c8a0a56
        failing since 68 days (last pass: v6.4-rc1-5-g2b8cc5858a07a, first =
fail: v6.5-rc1-1-ga6edd5f5d9cc)

    2023-09-25T03:06:18.405785  / # #

    2023-09-25T03:06:18.507897  export SHELL=3D/bin/sh

    2023-09-25T03:06:18.508656  #

    2023-09-25T03:06:18.610082  / # export SHELL=3D/bin/sh. /lava-11610621/=
environment

    2023-09-25T03:06:18.610802  =


    2023-09-25T03:06:18.712288  / # . /lava-11610621/environment/lava-11610=
621/bin/lava-test-runner /lava-11610621/1

    2023-09-25T03:06:18.713388  =


    2023-09-25T03:06:18.730249  / # /lava-11610621/bin/lava-test-runner /la=
va-11610621/1

    2023-09-25T03:06:18.779534  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-25T03:06:18.780086  + cd /lav<8>[   20.412244] <LAVA_SIGNAL_STA=
RTRUN 1_bootrr 11610621_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6510f846536883f78c8a0a5a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-1-g1aa8df90f456/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50=
i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-1-g1aa8df90f456/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50=
i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6510f846536883f78c8a0a63
        failing since 68 days (last pass: v6.4-rc1-5-g2b8cc5858a07a, first =
fail: v6.5-rc1-1-ga6edd5f5d9cc)

    2023-09-25T03:06:30.778895  / # #

    2023-09-25T03:06:30.881099  export SHELL=3D/bin/sh

    2023-09-25T03:06:30.881827  #

    2023-09-25T03:06:30.983277  / # export SHELL=3D/bin/sh. /lava-11610619/=
environment

    2023-09-25T03:06:30.984025  =


    2023-09-25T03:06:31.085493  / # . /lava-11610619/environment/lava-11610=
619/bin/lava-test-runner /lava-11610619/1

    2023-09-25T03:06:31.086620  =


    2023-09-25T03:06:31.103472  / # /lava-11610619/bin/lava-test-runner /la=
va-11610619/1

    2023-09-25T03:06:31.171398  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-25T03:06:31.171933  + cd /lava-11610619/1/tests/1_boot<8>[   16=
.995853] <LAVA_SIGNAL_STARTRUN 1_bootrr 11610619_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
