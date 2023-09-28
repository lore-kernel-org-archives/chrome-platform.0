Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A7C8467
	for <chrome-platform@lists.linux.dev>; Thu, 28 Sep 2023 06:51:26 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3ae65e8eb45so2140736b6e.1
        for <chrome-platform@lists.linux.dev>; Wed, 27 Sep 2023 23:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695883885; x=1696488685; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CRWeUT9iGqIBg5702KjG14ld2ydUPl50KT3LVxXGAs8=;
        b=2Y+DoqPoyGBc3xiWPqINuG9j/q3aTHojklbpGpBzpqNkwJs9P8uyDAUy01gua6D1HY
         17Noqygzt1wzWUvKUz0ZbwCqhM1fMdn7UQNpALDQECuMMYwA9gN6rxJVqhtTfEPZOmVl
         u1KRBUi1VEwlgNF/exSP3xd/bA5vBmbvNrJoQkHf7H/Wf+GTzYCMyMhiQK8OuUwb0mU1
         onyXxt4iIYwI4y5JsX7sif9vY+ax4Np/p6QABz49pq+w2jFMZ4dwuTLn7qtp4s/ANwsm
         7hIWyCxFMhH9XjZykLz5DEFGmwTGI+SJpF7Gnkd5IlOxRAXYlgSJ4u6jeatM1Lgp6Rh9
         mnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695883885; x=1696488685;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CRWeUT9iGqIBg5702KjG14ld2ydUPl50KT3LVxXGAs8=;
        b=LaPe75NQrUC8IUc0qho3A8wkYCuLNbjIEuvtdAFZi7bUEdm/2rHRzMUnYTNiPJMoZL
         YI8yz5nL8U0eAIE4PdfttecoOLUrHlx85fdXZ8jE90T/P1DHeArHAeqb/FyaLW+F8Es4
         MhbBvqwk9A4DTDRm/bp5CRgMqKR5AKF9BUb8YcUeo/8o//arbtpq0rJMOTnU1te24ry8
         YWbLaDFnNVwSjCKSde02vLf9iU8A9HSGWsZKRVDv6BE4pmr3K1PNvSLrLAZ5vSnYFdPA
         eolgUYPH/64nCDr9bDJ6ACsleXvcW2KDk/JjtTIymbkierhnKOgmfkm9rd34lGe939dW
         t08w==
X-Gm-Message-State: AOJu0YzhrEj7smUw31rkuu5BXt1xbgk4m19I+keh9CfKYjPpWYcPwiAp
	TIgsGW118ff2Cnoh184jaVs5Hw==
X-Google-Smtp-Source: AGHT+IFRxRhnVoMKgh94EFqjzVM1G72hkKMCjhMDqAUoAjUlDFpb2v9FpARhGs+D5wr5msfdq0LyVg==
X-Received: by 2002:a05:6808:154:b0:3a7:215c:e37 with SMTP id h20-20020a056808015400b003a7215c0e37mr328074oie.59.1695883885299;
        Wed, 27 Sep 2023 23:51:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id y15-20020a63ad4f000000b00578bb0066b6sm1565538pgo.71.2023.09.27.23.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 23:51:24 -0700 (PDT)
Message-ID: <6515226c.630a0220.11b20.527e@mx.google.com>
Date: Wed, 27 Sep 2023 23:51:24 -0700 (PDT)
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
X-Kernelci-Kernel: v6.6-rc1-13-g7396a5b980fd
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 76 runs,
 12 regressions (v6.6-rc1-13-g7396a5b980fd)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 76 runs, 12 regressions (v6.6-rc1-13=
-g7396a5b980fd)

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

mt8195-cherry-tomato-r2      | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.6-rc1-13-g7396a5b980fd/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.6-rc1-13-g7396a5b980fd
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      7396a5b980fdeb2cb97136db45405b4fb5d21dfc =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6515199d6dd866ca0c8a0a8e

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-13-g7396a5b980fd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-13-g7396a5b980fd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6515199d6dd866ca0c8a0aa3
        failing since 17 days (last pass: v6.5-rc1-4-g0820debb7d489, first =
fail: v6.6-rc1)

    2023-09-28T06:13:28.107977  + <8>[   10.680227] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11633152_1.4.2.3.1>

    2023-09-28T06:13:28.108066  set +x

    2023-09-28T06:13:28.212762  / # #

    2023-09-28T06:13:28.313438  export SHELL=3D/bin/sh

    2023-09-28T06:13:28.313652  #

    2023-09-28T06:13:28.414228  / # export SHELL=3D/bin/sh. /lava-11633152/=
environment

    2023-09-28T06:13:28.414446  =


    2023-09-28T06:13:28.515000  / # . /lava-11633152/environment/lava-11633=
152/bin/lava-test-runner /lava-11633152/1

    2023-09-28T06:13:28.515332  =


    2023-09-28T06:13:28.520314  / # /lava-11633152/bin/lava-test-runner /la=
va-11633152/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/65151759ccb355d5088a0a66

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-13-g7396a5b980fd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-13-g7396a5b980fd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65151759ccb355d5088a0a6f
        failing since 173 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-09-28T06:03:49.319314  + <8>[   11.886756] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11633120_1.4.2.3.1>

    2023-09-28T06:03:49.319398  set +x

    2023-09-28T06:03:49.423417  / # #

    2023-09-28T06:03:49.524074  export SHELL=3D/bin/sh

    2023-09-28T06:03:49.524303  #

    2023-09-28T06:03:49.624917  / # export SHELL=3D/bin/sh. /lava-11633120/=
environment

    2023-09-28T06:03:49.625413  =


    2023-09-28T06:03:49.726482  / # . /lava-11633120/environment/lava-11633=
120/bin/lava-test-runner /lava-11633120/1

    2023-09-28T06:03:49.726846  =


    2023-09-28T06:03:49.731705  / # /lava-11633120/bin/lava-test-runner /la=
va-11633120/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/65151714c64c91ad198a0a88

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-13-g7396a5b980fd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-13-g7396a5b980fd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65151714c64c91ad198a0a91
        failing since 173 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-09-28T06:02:49.397782  <8>[   11.235783] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11633144_1.4.2.3.1>

    2023-09-28T06:02:49.400860  + set +x

    2023-09-28T06:02:49.502383  #

    2023-09-28T06:02:49.502893  =


    2023-09-28T06:02:49.603682  / # #export SHELL=3D/bin/sh

    2023-09-28T06:02:49.603904  =


    2023-09-28T06:02:49.704491  / # export SHELL=3D/bin/sh. /lava-11633144/=
environment

    2023-09-28T06:02:49.704709  =


    2023-09-28T06:02:49.805287  / # . /lava-11633144/environment/lava-11633=
144/bin/lava-test-runner /lava-11633144/1

    2023-09-28T06:02:49.805674  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/651516ed1788c585298a0a5f

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-13-g7396a5b980fd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-13-g7396a5b980fd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651516ed1788c585298a0a74
        failing since 17 days (last pass: v6.5-rc1-4-g0820debb7d489, first =
fail: v6.6-rc1)

    2023-09-28T06:02:00.770984  + <8>[   11.237932] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11633125_1.4.2.3.1>

    2023-09-28T06:02:00.771073  set +x

    2023-09-28T06:02:00.875375  / # #

    2023-09-28T06:02:00.976044  export SHELL=3D/bin/sh

    2023-09-28T06:02:00.976258  #

    2023-09-28T06:02:01.076754  / # export SHELL=3D/bin/sh. /lava-11633125/=
environment

    2023-09-28T06:02:01.076964  =


    2023-09-28T06:02:01.177480  / # . /lava-11633125/environment/lava-11633=
125/bin/lava-test-runner /lava-11633125/1

    2023-09-28T06:02:01.177842  =


    2023-09-28T06:02:01.182535  / # /lava-11633125/bin/lava-test-runner /la=
va-11633125/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/651519b9cfce492e818a0a48

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-13-g7396a5b980fd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-13-g7396a5b980fd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651519b9cfce492e818a0a5d
        failing since 17 days (last pass: v6.5-rc1-4-g0820debb7d489, first =
fail: v6.6-rc1)

    2023-09-28T06:14:06.287844  + <8>[   11.000945] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11633139_1.4.2.3.1>

    2023-09-28T06:14:06.288572  set +x

    2023-09-28T06:14:06.396860  / # #

    2023-09-28T06:14:06.499718  export SHELL=3D/bin/sh

    2023-09-28T06:14:06.500529  #

    2023-09-28T06:14:06.602144  / # export SHELL=3D/bin/sh. /lava-11633139/=
environment

    2023-09-28T06:14:06.602996  =


    2023-09-28T06:14:06.704711  / # . /lava-11633139/environment/lava-11633=
139/bin/lava-test-runner /lava-11633139/1

    2023-09-28T06:14:06.705954  =


    2023-09-28T06:14:06.711303  / # /lava-11633139/bin/lava-test-runner /la=
va-11633139/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/65151852272cc54ddd8a0a5f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-13-g7396a5b980fd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-13-g7396a5b980fd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65151852272cc54ddd8a0a68
        failing since 173 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-09-28T06:08:01.125271  + set +x

    2023-09-28T06:08:01.131998  <8>[    8.140091] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11633141_1.4.2.3.1>

    2023-09-28T06:08:01.236337  / # #

    2023-09-28T06:08:01.336940  export SHELL=3D/bin/sh

    2023-09-28T06:08:01.337109  #

    2023-09-28T06:08:01.437599  / # export SHELL=3D/bin/sh. /lava-11633141/=
environment

    2023-09-28T06:08:01.437771  =


    2023-09-28T06:08:01.538379  / # . /lava-11633141/environment/lava-11633=
141/bin/lava-test-runner /lava-11633141/1

    2023-09-28T06:08:01.538764  =


    2023-09-28T06:08:01.543352  / # /lava-11633141/bin/lava-test-runner /la=
va-11633141/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/651517f9c1b59bef828a0a4f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-13-g7396a5b980fd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-13-g7396a5b980fd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651517f9c1b59bef828a0a58
        failing since 173 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-09-28T06:06:31.013096  <8>[   10.522668] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11633129_1.4.2.3.1>

    2023-09-28T06:06:31.016374  + set +x

    2023-09-28T06:06:31.124605  / # #

    2023-09-28T06:06:31.226740  export SHELL=3D/bin/sh

    2023-09-28T06:06:31.227575  #

    2023-09-28T06:06:31.329066  / # export SHELL=3D/bin/sh. /lava-11633129/=
environment

    2023-09-28T06:06:31.329884  =


    2023-09-28T06:06:31.431395  / # . /lava-11633129/environment/lava-11633=
129/bin/lava-test-runner /lava-11633129/1

    2023-09-28T06:06:31.432568  =


    2023-09-28T06:06:31.438366  / # /lava-11633129/bin/lava-test-runner /la=
va-11633129/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/651517002c477d357e8a0a68

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-13-g7396a5b980fd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-13-g7396a5b980fd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651517002c477d357e8a0a71
        failing since 173 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-09-28T06:02:17.801411  + set<8>[   11.002361] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11633101_1.4.2.3.1>

    2023-09-28T06:02:17.801499   +x

    2023-09-28T06:02:17.906057  / # #

    2023-09-28T06:02:18.006714  export SHELL=3D/bin/sh

    2023-09-28T06:02:18.006930  #

    2023-09-28T06:02:18.107402  / # export SHELL=3D/bin/sh. /lava-11633101/=
environment

    2023-09-28T06:02:18.107611  =


    2023-09-28T06:02:18.208185  / # . /lava-11633101/environment/lava-11633=
101/bin/lava-test-runner /lava-11633101/1

    2023-09-28T06:02:18.208458  =


    2023-09-28T06:02:18.213197  / # /lava-11633101/bin/lava-test-runner /la=
va-11633101/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6515187784083d31dd8a0a76

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-13-g7396a5b980fd/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp=
-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-13-g7396a5b980fd/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6515187784083d31dd8a0a7f
        failing since 16 days (last pass: v6.5-rc1-4-g0820debb7d489, first =
fail: v6.6-rc1)

    2023-09-28T06:08:42.800888  + set<8>[   28.131381] <LAVA_SIGNAL_ENDRUN =
0_dmesg 137192_1.5.2.4.1>
    2023-09-28T06:08:42.801354   +x
    2023-09-28T06:08:42.908535  / # #
    2023-09-28T06:08:44.074341  export SHELL=3D/bin/sh
    2023-09-28T06:08:44.080479  #
    2023-09-28T06:08:45.579547  / # export SHELL=3D/bin/sh. /lava-137192/en=
vironment
    2023-09-28T06:08:45.585586  =

    2023-09-28T06:08:48.303988  / # . /lava-137192/environment/lava-137192/=
bin/lava-test-runner /lava-137192/1
    2023-09-28T06:08:48.310922  =

    2023-09-28T06:08:48.318595  / # /lava-137192/bin/lava-test-runner /lava=
-137192/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/651517c507389818568a0a90

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-13-g7396a5b980fd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-13-g7396a5b980fd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651517c507389818568a0a99
        failing since 173 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-09-28T06:05:41.826949  + <8>[   11.474696] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11633151_1.4.2.3.1>

    2023-09-28T06:05:41.827034  set +x

    2023-09-28T06:05:41.931719  / # #

    2023-09-28T06:05:42.032401  export SHELL=3D/bin/sh

    2023-09-28T06:05:42.032622  #

    2023-09-28T06:05:42.133186  / # export SHELL=3D/bin/sh. /lava-11633151/=
environment

    2023-09-28T06:05:42.133412  =


    2023-09-28T06:05:42.233984  / # . /lava-11633151/environment/lava-11633=
151/bin/lava-test-runner /lava-11633151/1

    2023-09-28T06:05:42.234357  =


    2023-09-28T06:05:42.239115  / # /lava-11633151/bin/lava-test-runner /la=
va-11633151/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8195-cherry-tomato-r2      | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/651518a04fbb91bc1d8a0a85

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-13-g7396a5b980fd/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8195-cherry-tomato-r2.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-13-g7396a5b980fd/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8195-cherry-tomato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651518a04fbb91bc1d8a0=
a86
        new failure (last pass: v6.6-rc1-1-g1aa8df90f456) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65151847bef18ae76b8a0a7b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-13-g7396a5b980fd/arm64/defconfig/gcc-10/lab-collabora/baseline-sun5=
0i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-13-g7396a5b980fd/arm64/defconfig/gcc-10/lab-collabora/baseline-sun5=
0i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65151847bef18ae76b8a0a84
        failing since 71 days (last pass: v6.4-rc1-5-g2b8cc5858a07a, first =
fail: v6.5-rc1-1-ga6edd5f5d9cc)

    2023-09-28T06:12:09.308721  / # #

    2023-09-28T06:12:09.410886  export SHELL=3D/bin/sh

    2023-09-28T06:12:09.411604  #

    2023-09-28T06:12:09.513078  / # export SHELL=3D/bin/sh. /lava-11633229/=
environment

    2023-09-28T06:12:09.513802  =


    2023-09-28T06:12:09.615187  / # . /lava-11633229/environment/lava-11633=
229/bin/lava-test-runner /lava-11633229/1

    2023-09-28T06:12:09.616370  =


    2023-09-28T06:12:09.632860  / # /lava-11633229/bin/lava-test-runner /la=
va-11633229/1

    2023-09-28T06:12:09.700929  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-28T06:12:09.701424  + cd /lava-1163322<8>[   17.075310] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11633229_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
