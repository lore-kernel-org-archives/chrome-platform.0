Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EBD17EC
	for <chrome-platform@lists.linux.dev>; Fri, 28 Jul 2023 03:48:36 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1bb74752ddbso1356552fac.0
        for <chrome-platform@lists.linux.dev>; Thu, 27 Jul 2023 20:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1690516116; x=1691120916;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vtVeovm+XrWsaY9jjuMOfvvilNmFwuwi+d0pnYGMwTs=;
        b=D/M30B8G3Z4VIebnkr3SiIKg8M3aV/+/Ju1iMz+6cEJd3rWxzhlJST4d/SGjXYcOb0
         SI67NWVgTxml1slEneN+djF8hI6u4As9A6rOX+AcRuW8DfdwVTgbh1ZhUbe1m7HKxniz
         mI2UJBgReGKb1o5mhwhjosNOphsC7dzQUPhWMAf1kzPH7tSKFTrPDrkR9nIi6hoN7I9w
         uk2C0JRFBJDug9g/SIbagD4HBwZXbKLh3Pu5fTw1IjDRFvNCvD6xaKcRB3tEgN48QUWZ
         aDqsieEUZH0L6QspQhi4avAfudSGlaRzDJSzUpXGBbu/MCYqpcynJr7rxk+/iXjb9E53
         sUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690516116; x=1691120916;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vtVeovm+XrWsaY9jjuMOfvvilNmFwuwi+d0pnYGMwTs=;
        b=DYOOEcE1o9Ltn9prw9DDwr7zJcgjjTWi34YHlVABITbHv64BxjtSAec48j3pru+DX6
         i8iT1NoETdhHiK7QyLDPHd5BsX3h4VvsO9gLNhRh8i3CW4bhYFLVSvMywwXPDBTHTgRd
         7GyZfj2BRC6XeiEgsM13j+l2f5Tp7rRQXlESxPj7pU4sssGywhfSGXq1DuY5pQwclSZ+
         sWXS9lKtrDhW2tWtsRPmdofQW+/iOXSOxZR63URx1qKQoVclaTlGW+i6a/QBgnTOUbFd
         W9ISKG7U2FZvTanNKhEgA/TGVd4IrRYo/s47/kq7GPoF3gJMzemBXXlwNDje+VI20VVr
         Jdfw==
X-Gm-Message-State: ABy/qLa/Ygcbil5JTKz1oNgLqi1DgeXddpsKJUHV1B8UZxJ99SFztkmj
	o8BuGKtmHAx2KwEjV+BA6BWA6g==
X-Google-Smtp-Source: APBJJlGve9oxAGnjNEJFRDEBgtc5hmH0cDDyFtianFXn3AgwJJOLrEpMm8iyU83tERxzn66JqUg8Mw==
X-Received: by 2002:a05:6870:5704:b0:1b3:f1f7:9958 with SMTP id k4-20020a056870570400b001b3f1f79958mr1914004oap.46.1690516115819;
        Thu, 27 Jul 2023 20:48:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id q7-20020a637507000000b0055b4307963dsm2356278pgc.23.2023.07.27.20.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 20:48:35 -0700 (PDT)
Message-ID: <64c33a93.630a0220.37da5.5705@mx.google.com>
Date: Thu, 27 Jul 2023 20:48:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Kernel: v6.5-rc1-1-g0a329167220af
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 77 runs,
 11 regressions (v6.5-rc1-1-g0a329167220af)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 77 runs, 11 regressions (v6.5-rc1-1-=
g0a329167220af)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

fsl-ls2088a-rdb              | arm64  | lab-nxp       | gcc-10   | defconfi=
g                    | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.5-rc1-1-g0a329167220af/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.5-rc1-1-g0a329167220af
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      0a329167220afd2b28584594d30a0643d8a18dfb =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c32f3c9105b040898ace20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-g0a329167220af/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-acer-chromebox-cxi4-puff.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-g0a329167220af/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-acer-chromebox-cxi4-puff.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c32f3c9105b040898ac=
e21
        new failure (last pass: v6.5-rc1-1-ga6edd5f5d9cc) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c32e4c4044d9ff148ace9b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-g0a329167220af/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-g0a329167220af/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c32e4c4044d9ff148acea0
        failing since 111 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-07-28T02:55:59.562980  + set<8>[   10.722956] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11156475_1.4.2.3.1>

    2023-07-28T02:55:59.563453   +x

    2023-07-28T02:55:59.671099  / # #

    2023-07-28T02:55:59.773548  export SHELL=3D/bin/sh

    2023-07-28T02:55:59.774317  #

    2023-07-28T02:55:59.875961  / # export SHELL=3D/bin/sh. /lava-11156475/=
environment

    2023-07-28T02:55:59.876755  =


    2023-07-28T02:55:59.978381  / # . /lava-11156475/environment/lava-11156=
475/bin/lava-test-runner /lava-11156475/1

    2023-07-28T02:55:59.979990  =


    2023-07-28T02:55:59.985101  / # /lava-11156475/bin/lava-test-runner /la=
va-11156475/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c32e2c4044d9ff148ace49

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-g0a329167220af/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-g0a329167220af/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c32e2c4044d9ff148ace4e
        failing since 111 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-07-28T02:55:28.492238  <8>[    9.975051] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11156433_1.4.2.3.1>

    2023-07-28T02:55:28.495518  + set +x

    2023-07-28T02:55:28.601504  =


    2023-07-28T02:55:28.703421  / # #export SHELL=3D/bin/sh

    2023-07-28T02:55:28.704213  =


    2023-07-28T02:55:28.805629  / # export SHELL=3D/bin/sh. /lava-11156433/=
environment

    2023-07-28T02:55:28.806352  =


    2023-07-28T02:55:28.907840  / # . /lava-11156433/environment/lava-11156=
433/bin/lava-test-runner /lava-11156433/1

    2023-07-28T02:55:28.908935  =


    2023-07-28T02:55:28.914607  / # /lava-11156433/bin/lava-test-runner /la=
va-11156433/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
fsl-ls2088a-rdb              | arm64  | lab-nxp       | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c3303a1fa1f904e28ace50

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-g0a329167220af/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-g0a329167220af/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c3303a1fa1f904e28ace53
        failing since 9 days (last pass: v6.0-rc1-19-gd378c6f0456c, first f=
ail: v6.5-rc1-1-ga6edd5f5d9cc)

    2023-07-28T03:04:07.473271  [   17.035066] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1239309_1.5.2.4.1>
    2023-07-28T03:04:07.580872  =

    2023-07-28T03:04:07.682033  / # #export SHELL=3D/bin/sh
    2023-07-28T03:04:07.682434  =

    2023-07-28T03:04:07.783354  / # export SHELL=3D/bin/sh. /lava-1239309/e=
nvironment
    2023-07-28T03:04:07.783907  =

    2023-07-28T03:04:07.885156  / # . /lava-1239309/environment/lava-123930=
9/bin/lava-test-runner /lava-1239309/1
    2023-07-28T03:04:07.885824  =

    2023-07-28T03:04:07.889064  / # /lava-1239309/bin/lava-test-runner /lav=
a-1239309/1
    2023-07-28T03:04:07.913275  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c32e416749eb60518ace20

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-g0a329167220af/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-g0a329167220af/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c32e416749eb60518ace25
        failing since 111 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-07-28T02:55:54.126502  + set +x

    2023-07-28T02:55:54.133530  <8>[   10.209903] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11156462_1.4.2.3.1>

    2023-07-28T02:55:54.237448  / # #

    2023-07-28T02:55:54.337967  export SHELL=3D/bin/sh

    2023-07-28T02:55:54.338122  #

    2023-07-28T02:55:54.438575  / # export SHELL=3D/bin/sh. /lava-11156462/=
environment

    2023-07-28T02:55:54.438732  =


    2023-07-28T02:55:54.539201  / # . /lava-11156462/environment/lava-11156=
462/bin/lava-test-runner /lava-11156462/1

    2023-07-28T02:55:54.539564  =


    2023-07-28T02:55:54.543877  / # /lava-11156462/bin/lava-test-runner /la=
va-11156462/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c32e354044d9ff148ace74

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-g0a329167220af/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-g0a329167220af/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c32e354044d9ff148ace79
        failing since 111 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-07-28T02:55:28.371576  + set +x

    2023-07-28T02:55:28.377976  <8>[   10.536719] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11156471_1.4.2.3.1>

    2023-07-28T02:55:28.479994  =


    2023-07-28T02:55:28.580511  / # #export SHELL=3D/bin/sh

    2023-07-28T02:55:28.580714  =


    2023-07-28T02:55:28.681172  / # export SHELL=3D/bin/sh. /lava-11156471/=
environment

    2023-07-28T02:55:28.681369  =


    2023-07-28T02:55:28.781933  / # . /lava-11156471/environment/lava-11156=
471/bin/lava-test-runner /lava-11156471/1

    2023-07-28T02:55:28.782227  =


    2023-07-28T02:55:28.786742  / # /lava-11156471/bin/lava-test-runner /la=
va-11156471/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c32e6a6749eb60518ace6e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-g0a329167220af/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-g0a329167220af/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c32e6a6749eb60518ace73
        failing since 111 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-07-28T02:56:00.888286  + set<8>[   11.215237] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11156454_1.4.2.3.1>

    2023-07-28T02:56:00.888367   +x

    2023-07-28T02:56:00.992866  / # #

    2023-07-28T02:56:01.093443  export SHELL=3D/bin/sh

    2023-07-28T02:56:01.093613  #

    2023-07-28T02:56:01.194128  / # export SHELL=3D/bin/sh. /lava-11156454/=
environment

    2023-07-28T02:56:01.194280  =


    2023-07-28T02:56:01.294813  / # . /lava-11156454/environment/lava-11156=
454/bin/lava-test-runner /lava-11156454/1

    2023-07-28T02:56:01.295090  =


    2023-07-28T02:56:01.299838  / # /lava-11156454/bin/lava-test-runner /la=
va-11156454/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c32e3a4044d9ff148ace8d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-g0a329167220af/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-g0a329167220af/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c32e3a4044d9ff148ace92
        failing since 111 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-07-28T02:55:42.444414  + set<8>[   11.200567] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11156460_1.4.2.3.1>

    2023-07-28T02:55:42.444499   +x

    2023-07-28T02:55:42.549156  / # #

    2023-07-28T02:55:42.649776  export SHELL=3D/bin/sh

    2023-07-28T02:55:42.649982  #

    2023-07-28T02:55:42.750514  / # export SHELL=3D/bin/sh. /lava-11156460/=
environment

    2023-07-28T02:55:42.750739  =


    2023-07-28T02:55:42.851293  / # . /lava-11156460/environment/lava-11156=
460/bin/lava-test-runner /lava-11156460/1

    2023-07-28T02:55:42.851615  =


    2023-07-28T02:55:42.856521  / # /lava-11156460/bin/lava-test-runner /la=
va-11156460/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c330bc3320c9135b8ace21

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-g0a329167220af/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i=
-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-g0a329167220af/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i=
-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c330bc3320c9135b8ac=
e22
        failing since 9 days (last pass: v6.4-rc1-5-g2b8cc5858a07a, first f=
ail: v6.5-rc1-1-ga6edd5f5d9cc) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c330be2977b82f358ace1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-g0a329167220af/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-g0a329167220af/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c330be2977b82f358ac=
e1e
        new failure (last pass: v6.5-rc1-1-ga6edd5f5d9cc) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c32fb9d77ea5cfdb8ace21

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-g0a329167220af/arm64/defconfig/gcc-10/lab-collabora/baseline-sun5=
0i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-g0a329167220af/arm64/defconfig/gcc-10/lab-collabora/baseline-sun5=
0i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c32fbad77ea5cfdb8ace26
        failing since 9 days (last pass: v6.4-rc1-5-g2b8cc5858a07a, first f=
ail: v6.5-rc1-1-ga6edd5f5d9cc)

    2023-07-28T03:03:37.096740  / # #

    2023-07-28T03:03:37.198995  export SHELL=3D/bin/sh

    2023-07-28T03:03:37.199736  #

    2023-07-28T03:03:37.301164  / # export SHELL=3D/bin/sh. /lava-11156527/=
environment

    2023-07-28T03:03:37.301916  =


    2023-07-28T03:03:37.403374  / # . /lava-11156527/environment/lava-11156=
527/bin/lava-test-runner /lava-11156527/1

    2023-07-28T03:03:37.404562  =


    2023-07-28T03:03:37.420683  / # /lava-11156527/bin/lava-test-runner /la=
va-11156527/1

    2023-07-28T03:03:37.489832  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-28T03:03:37.490347  + cd /lava-11156527/1/tests/1_boot<8>[   17=
.908249] <LAVA_SIGNAL_STARTRUN 1_bootrr 11156527_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
