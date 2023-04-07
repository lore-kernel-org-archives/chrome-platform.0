Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556202582
	for <chrome-platform@lists.linux.dev>; Fri,  7 Apr 2023 20:48:20 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-62e102cadc7so257802b3a.2
        for <chrome-platform@lists.linux.dev>; Fri, 07 Apr 2023 13:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1680900499; x=1683492499;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VwqMndIS+U7HIx02O/HTKSnay+js3KZHG0MSzB9V57U=;
        b=YXVVXXhZW1a2HP0pHejkGjA1PrLW5WDbe+RGcnudflMkkJiLFrQEVFOh7jZXwt94Aw
         JgQraEmV41876Sbw6EXAtCofFBs/F8rQwKyILNY3g2O/MYGE4MmMJQM5c2o4DzJq6L/5
         TnRvZHJsU/2aa4Syd/carpDU0PiszOpZ8pzTphOGbyo90pC3JFT76flaEuVSVSdK1mX2
         Y2tfIut5g2NIBSQNz91pp8RPxW6cnZB+hnaBEhTkRQqbeJ69pPANJjqkyYdToVonQmSA
         Jj1ie8ARKLdPEevpqq/7A9Zy5IaV+SXOOmMTBPNRVbuPT5OvzGDieoZrGVgE1KaTxpyT
         6Gyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680900499; x=1683492499;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VwqMndIS+U7HIx02O/HTKSnay+js3KZHG0MSzB9V57U=;
        b=liEL8cIKUogZxExikoBopFdmIz0MkX9Bd+yTPclbg0HFeACy0fuZMzVa/9UvVVmhbz
         94/lcn2bvC4KqNODaa0lrDzn/619b5x/HE5fQpP1LATG/LGTbCefO9ArQ9OJtllAlES/
         RF69LxyQgpynspWGUnPirQw7tUuItcVUaoHdlPRctCsvl3r/Fgx4sh9k3rTIQ9dFwrDK
         h+I209qLaNI5/gBzF/CGMSSLOXwsJH3Vs3TfaJew3tHC7jP0E/x1iy0QIQ7KHW+yi/Eh
         IWpltkQ+mK+nKnBcaQkSI1xMlMPRkapkOdfJsn8wNgmEdP6v59/xW5NoX3K2I1Vus0mT
         MPNQ==
X-Gm-Message-State: AAQBX9fwhkRUZsjZWKnxy6vT+m5r/R5/JJJNb/AwSOpR9q3zkAS/bNJ7
	vyp10B1Pd3xrjyjaVtyP5Y+nkg==
X-Google-Smtp-Source: AKy350YILlw3p8nvdT+HVD3/uKTHiJiXQnmD9cES2g0PsHj5k44eiGKanTh63Q1FgdUndeqTYgszPQ==
X-Received: by 2002:aa7:9ad7:0:b0:5a8:abd2:2beb with SMTP id x23-20020aa79ad7000000b005a8abd22bebmr3454413pfp.30.1680900499251;
        Fri, 07 Apr 2023 13:48:19 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a2-20020a62bd02000000b005e5b11335b3sm3459752pff.57.2023.04.07.13.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 13:48:18 -0700 (PDT)
Message-ID: <64308192.620a0220.41726.72a3@mx.google.com>
Date: Fri, 07 Apr 2023 13:48:18 -0700 (PDT)
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
X-Kernelci-Kernel: v6.3-rc1-5-gd946c9118047
Subject: chrome-platform/for-kernelci baseline: 84 runs,
 33 regressions (v6.3-rc1-5-gd946c9118047)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 84 runs, 33 regressions (v6.3-rc1-5-=
gd946c9118047)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

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

imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =

imx6q-sabrelite              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =

imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =

imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 5          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.3-rc1-5-gd946c9118047/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.3-rc1-5-gd946c9118047
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      d946c9118047e4338567a98c1b2400859abfbafc =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6430761bafd3e9ba9b79e94f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6430761bafd3e9ba9b79e958
        new failure (last pass: v6.3-rc1-4-g9ce5f3b3c18e2)

    2023-04-07T19:59:10.326458  <8>[   10.234853] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9909763_1.4.2.3.1>

    2023-04-07T19:59:10.330015  + set +x

    2023-04-07T19:59:10.437682  / # #

    2023-04-07T19:59:10.540533  export SHELL=3D/bin/sh

    2023-04-07T19:59:10.541353  #

    2023-04-07T19:59:10.643450  / # export SHELL=3D/bin/sh. /lava-9909763/e=
nvironment

    2023-04-07T19:59:10.644258  =


    2023-04-07T19:59:10.746242  / # . /lava-9909763/environment/lava-990976=
3/bin/lava-test-runner /lava-9909763/1

    2023-04-07T19:59:10.747618  =


    2023-04-07T19:59:10.753682  / # /lava-9909763/bin/lava-test-runner /lav=
a-9909763/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643076251a53ad582279e9d3

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643076251a53ad582279e9dc
        new failure (last pass: v6.3-rc1-4-g9ce5f3b3c18e2)

    2023-04-07T19:59:16.152365  + set<8>[   11.992060] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9909703_1.4.2.3.1>

    2023-04-07T19:59:16.152488   +x

    2023-04-07T19:59:16.257430  / # #

    2023-04-07T19:59:16.358592  export SHELL=3D/bin/sh

    2023-04-07T19:59:16.358836  #

    2023-04-07T19:59:16.459738  / # export SHELL=3D/bin/sh. /lava-9909703/e=
nvironment

    2023-04-07T19:59:16.459986  =


    2023-04-07T19:59:16.560964  / # . /lava-9909703/environment/lava-990970=
3/bin/lava-test-runner /lava-9909703/1

    2023-04-07T19:59:16.561321  =


    2023-04-07T19:59:16.566373  / # /lava-9909703/bin/lava-test-runner /lav=
a-9909703/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64307623c93d2b0d3079e93c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64307623c93d2b0d3079e945
        new failure (last pass: v6.3-rc1-4-g9ce5f3b3c18e2)

    2023-04-07T19:59:24.760749  <8>[    9.693185] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9909776_1.4.2.3.1>

    2023-04-07T19:59:24.764133  + set +x

    2023-04-07T19:59:24.869529  #

    2023-04-07T19:59:24.870606  =


    2023-04-07T19:59:24.972640  / # #export SHELL=3D/bin/sh

    2023-04-07T19:59:24.973323  =


    2023-04-07T19:59:25.075048  / # export SHELL=3D/bin/sh. /lava-9909776/e=
nvironment

    2023-04-07T19:59:25.075770  =


    2023-04-07T19:59:25.177572  / # . /lava-9909776/environment/lava-990977=
6/bin/lava-test-runner /lava-9909776/1

    2023-04-07T19:59:25.178808  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6430760ab7dfef57ab79e96f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6430760ab7dfef57ab79e978
        new failure (last pass: v6.3-rc1-4-g9ce5f3b3c18e2)

    2023-04-07T19:58:58.195076  + set +x

    2023-04-07T19:58:58.201253  <8>[   13.405719] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9909738_1.4.2.3.1>

    2023-04-07T19:58:58.306614  / # #

    2023-04-07T19:58:58.407634  export SHELL=3D/bin/sh

    2023-04-07T19:58:58.407841  #

    2023-04-07T19:58:58.508718  / # export SHELL=3D/bin/sh. /lava-9909738/e=
nvironment

    2023-04-07T19:58:58.508903  =


    2023-04-07T19:58:58.609785  / # . /lava-9909738/environment/lava-990973=
8/bin/lava-test-runner /lava-9909738/1

    2023-04-07T19:58:58.610076  =


    2023-04-07T19:58:58.614633  / # /lava-9909738/bin/lava-test-runner /lav=
a-9909738/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6430762759a6c9e1fa79e94e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6430762759a6c9e1fa79e957
        new failure (last pass: v6.3-rc1-4-g9ce5f3b3c18e2)

    2023-04-07T19:59:15.454469  + set<8>[   10.855498] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9909788_1.4.2.3.1>

    2023-04-07T19:59:15.455082   +x

    2023-04-07T19:59:15.563054  /#

    2023-04-07T19:59:15.666547   # #export SHELL=3D/bin/sh

    2023-04-07T19:59:15.667329  =


    2023-04-07T19:59:15.769309  / # export SHELL=3D/bin/sh. /lava-9909788/e=
nvironment

    2023-04-07T19:59:15.770088  =


    2023-04-07T19:59:15.872045  / # . /lava-9909788/environment/lava-990978=
8/bin/lava-test-runner /lava-9909788/1

    2023-04-07T19:59:15.873287  =


    2023-04-07T19:59:15.878524  / # /lava-9909788/bin/lava-test-runner /lav=
a-9909788/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6430762859a6c9e1fa79e959

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6430762859a6c9e1fa79e962
        new failure (last pass: v6.3-rc1-4-g9ce5f3b3c18e2)

    2023-04-07T19:59:13.357795  + <8>[   10.853745] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9909713_1.4.2.3.1>

    2023-04-07T19:59:13.357890  set +x

    2023-04-07T19:59:13.462960  / # #

    2023-04-07T19:59:13.563957  export SHELL=3D/bin/sh

    2023-04-07T19:59:13.564158  #

    2023-04-07T19:59:13.665107  / # export SHELL=3D/bin/sh. /lava-9909713/e=
nvironment

    2023-04-07T19:59:13.665290  =


    2023-04-07T19:59:13.766228  / # . /lava-9909713/environment/lava-990971=
3/bin/lava-test-runner /lava-9909713/1

    2023-04-07T19:59:13.766498  =


    2023-04-07T19:59:13.771781  / # /lava-9909713/bin/lava-test-runner /lav=
a-9909713/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/643077ac79feb1a7d779e98b

  Results:     13 PASS, 12 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-=
imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-=
imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643077ac79feb1a=
7d779e98e
        failing since 32 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-04-07T20:05:30.309364  k<8>[   16.795228] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
    2023-04-07T20:05:30.309775  ern  :alert : Register r0 information: non-=
slab/vmalloc memory
    2023-04-07T20:05:30.310086  kern  :alert : Register r1 information: non=
-paged memory
    2023-04-07T20:05:30.310639  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-04-07T20:05:30.310913  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-07T20:05:30.331601  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0cb4000 allocated at kernel_clone+0x8c/0x=
36c
    2023-04-07T20:05:30.332014  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-04-07T20:05:30.332235  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-04-07T20:05:30.353691  kern  :alert : Register r7 information: sla=
b task_struct start c4c54400 pointer offset 0 size 2176
    2023-04-07T20:05:30.354118  kern  :alert : Register r8 information: non=
-slab/vmalloc memory =

    ... (103 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643077ac79feb1a=
7d779e98f
        failing since 32 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-04-07T20:05:30.286300  kern  :alert : 8<--- cut here ---
    2023-04-07T20:05:30.286695  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-04-07T20:05:30.287221  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-sabrelite              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6430763859a6c9e1fa79e98e

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6430763859a6c9e=
1fa79e991
        failing since 32 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-04-07T19:59:42.422045  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0ddc000 allocated at kernel_clone+0x8c/0x=
36c

    2023-04-07T19:59:42.422616  kern  :alert : Register r5 information: non=
-slab/vmalloc memory

    2023-04-07T19:59:42.422988  kern  :alert : Register r6 information: zer=
o-size pointer

    2023-04-07T19:59:42.423333  kern  :alert : Register r7 information: sla=
b task_struct start c31e3300 pointer offset 0 size 2176

    2023-04-07T19:59:42.423665  kern  :alert : Register r8 information: non=
-slab/vmalloc memory

    2023-04-07T19:59:42.423990  kern  :alert : Register r9 information: non=
-slab/vmalloc memory

    2023-04-07T19:59:42.466172  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory

    2023-04-07T19:59:42.466705  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory

    2023-04-07T19:59:42.467105  kern  :alert : Register r12 information: NU=
LL pointer

    2023-04-07T19:59:42.467431  kern  :alert : 8<--- cut here ---
 =

    ... (101 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6430763859a6c9e=
1fa79e992
        failing since 32 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-04-07T19:59:42.378577  kern  :alert : 8<--- cut here ---

    2023-04-07T19:59:42.379143  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741

    2023-04-07T19:59:42.379514  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)

    2023-04-07T19:59:42.379853  k<8>[    9.001153] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>

    2023-04-07T19:59:42.380191  ern  :alert : Register r0 information: non-=
slab/vmalloc memory

    2023-04-07T19:59:42.380516  kern  :alert : Register r1 information: non=
-paged memory

    2023-04-07T19:59:42.380836  kern  :alert : Register r2 information: non=
-slab/vmalloc memory

    2023-04-07T19:59:42.381150  kern  :alert : Register r3 information: non=
-paged memory
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/643077e647c719790979e981

  Results:     13 PASS, 12 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-=
imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-=
imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643077e647c7197=
90979e984
        failing since 32 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-04-07T20:06:31.298748  k<8>[   16.300103] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
    2023-04-07T20:06:31.299143  ern  :alert : Register r0 information: non-=
slab/vmalloc memory
    2023-04-07T20:06:31.299375  kern  :alert : Register r1 information: non=
-paged memory
    2023-04-07T20:06:31.299667  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-04-07T20:06:31.300158  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-07T20:06:31.321482  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0d64000 allocated at kernel_clone+0x8c/0x=
36c
    2023-04-07T20:06:31.321892  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-04-07T20:06:31.322412  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-04-07T20:06:31.343773  kern  :alert : Register r7 information: sla=
b task_struct start c21fb300 pointer offset 0 size 2176
    2023-04-07T20:06:31.344177  kern  :alert : Register r8 information: non=
-slab/vmalloc memory =

    ... (102 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643077e647c7197=
90979e985
        failing since 32 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-04-07T20:06:31.276593  kern  :alert : 8<--- cut here ---
    2023-04-07T20:06:31.276976  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-04-07T20:06:31.277479  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6430760a56625806c779e930

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6430760a5662580=
6c779e933
        failing since 32 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-04-07T19:58:58.246012  mation: non-slab/vmalloc memory
    2023-04-07T19:58:58.246311  kern  :alert : Register r1 information: non=
-paged memory
    2023-04-07T19:58:58.254906  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-04-07T19:58:58.255224  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-07T19:58:58.264281  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0dd4000 allocated at kernel_clone+0x8c/0x=
36c
    2023-04-07T19:58:58.273476  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-04-07T19:58:58.282137  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-04-07T19:58:58.291066  kern  :alert : Register r7 information: sla=
b task_struct start c36f0000 pointer offset 0 size 2176
    2023-04-07T19:58:58.291391  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-04-07T19:58:58.300105  kern  :alert : Register r9 information: non=
-slab/vmalloc memory =

    ... (103 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6430760a5662580=
6c779e934
        failing since 32 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-04-07T19:58:58.218716  kern  :alert : 8<--- cut here ---
    2023-04-07T19:58:58.227864  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-04-07T19:58:58.228188  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)
    2023-04-07T19:58:58.236847  kern  :alert : Register r0 infor[    5.5385=
46] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines =
MEASUREMENT=3D48>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/643076c814c5cff03979e95f

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7=
d-sdb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7=
d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643076c814c5cff=
03979e967
        failing since 32 days (last pass: v6.2-rc1-32-g7ae7deb4a4b4, first =
fail: v6.3-rc1)
        48 lines

    2023-04-07T20:01:41.105263  kern  :alert : 8<--- cut here ---
    2023-04-07T20:01:41.105471  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-04-07T20:01:41.105841  kern  :alert : [c1a50741] *pgd=3D81a1141e(b=
ad)
    2023-04-07T20:01:41.105989  k<8>[   10.903469] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
    2023-04-07T20:01:41.106129  ern  :alert : Register r0 information: non-=
slab/vmalloc memory
    2023-04-07T20:01:41.106265  kern  :alert : Register r1 information: non=
-paged memory
    2023-04-07T20:01:41.106408  kern  :alert : Register r2 information: non=
-slab/vmalloc memory   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643076c814c5cff=
03979e968
        failing since 32 days (last pass: v6.2-rc1-32-g7ae7deb4a4b4, first =
fail: v6.3-rc1)
        90 lines

    2023-04-07T20:01:41.107641  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-07T20:01:41.148259  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0dcc000 allocated at kernel_clone+0x8c/0x=
36c
    2023-04-07T20:01:41.148671  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-04-07T20:01:41.148883  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-04-07T20:01:41.149180  kern  :alert : Register r7 information: sla=
b task_struct start c2164c80 pointer offset 0 size 2176
    2023-04-07T20:01:41.149450  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-04-07T20:01:41.149898  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
    2023-04-07T20:01:41.191238  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory
    2023-04-07T20:01:41.191626  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory
    2023-04-07T20:01:41.191784  kern  :alert : Register r12 information: NU=
LL pointer =

    ... (100 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 5          =


  Details:     https://kernelci.org/test/plan/id/643077e747c719790979e99f

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron=
-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron=
-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643077e747c719790979e9a2
        failing since 31 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-g22181069e867)

    2023-04-07T20:06:48.146269  <8>[   22.070040] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 314285_1.5.2.4.1>
    2023-04-07T20:06:48.252270  / # #
    2023-04-07T20:06:48.353579  export SHELL=3D/bin/sh
    2023-04-07T20:06:48.354193  #
    2023-04-07T20:06:48.455850  / # export SHELL=3D/bin/sh. /lava-314285/en=
vironment
    2023-04-07T20:06:48.456582  =

    2023-04-07T20:06:48.558252  / # . /lava-314285/environment/lava-314285/=
bin/lava-test-runner /lava-314285/1
    2023-04-07T20:06:48.559306  =

    2023-04-07T20:06:48.578261  / # /lava-314285/bin/lava-test-runner /lava=
-314285/1
    2023-04-07T20:06:48.632115  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/643077e747c719790979e9a6
        failing since 31 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-g22181069e867)

    2023-04-07T20:06:50.729025  /lava-314285/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/64=
3077e747c719790979e9a8
        failing since 31 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-g22181069e867)

    2023-04-07T20:06:51.785429  /lava-314285/1/../bin/lava-test-case
    2023-04-07T20:06:51.785659  <8>[   25.677303] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-04-07T20:06:51.785783  /lava-314285/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/643077e747c719790979e9ad
        failing since 31 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-g22181069e867)

    2023-04-07T20:06:52.860894  /lava-314285/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/643077e747c719790979e9ae
        failing since 31 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-g22181069e867)

    2023-04-07T20:06:52.864029  <8>[   26.787864] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-04-07T20:06:53.921426  /lava-314285/1/../bin/lava-test-case
    2023-04-07T20:06:53.921959  <8>[   27.808840] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-04-07T20:06:53.922399  /lava-314285/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643076131a53ad582279e92f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643076131a53ad582279e938
        new failure (last pass: v6.3-rc1-4-g9ce5f3b3c18e2)

    2023-04-07T19:59:04.305896  <8>[   11.396766] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9909710_1.4.2.3.1>

    2023-04-07T19:59:04.415244  / # #

    2023-04-07T19:59:04.518587  export SHELL=3D/bin/sh

    2023-04-07T19:59:04.519351  #

    2023-04-07T19:59:04.621370  / # export SHELL=3D/bin/sh. /lava-9909710/e=
nvironment

    2023-04-07T19:59:04.622171  =


    2023-04-07T19:59:04.724081  / # . /lava-9909710/environment/lava-990971=
0/bin/lava-test-runner /lava-9909710/1

    2023-04-07T19:59:04.725537  =


    2023-04-07T19:59:04.730055  / # /lava-9909710/bin/lava-test-runner /lav=
a-9909710/1

    2023-04-07T19:59:04.736414  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/64307771fa4a0c880a79e936

  Results:     166 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/643=
07771fa4a0c880a79e98a
        failing since 32 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)

    2023-04-07T20:04:56.754055  /lava-9909884/1/../bin/lava-test-case

    2023-04-07T20:04:56.760514  <8>[   23.380884] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/64307771fa4a0c880a79e9dc
        failing since 32 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)

    2023-04-07T20:04:53.880730  /lava-9909884/1/../bin/lava-test-case

    2023-04-07T20:04:53.890650  <8>[   20.507839] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/64307771fa4a0c880a79e9dd
        failing since 32 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)

    2023-04-07T20:04:52.818874  <3>[   19.439729] Bluetooth: hci0: command =
0x1002 tx timeout

    2023-04-07T20:04:52.825097  <3>[   19.439918] Bluetooth: hci0: Opcode 0=
x1002 failed: -110

    2023-04-07T20:04:52.852464  /lava-9909884/1/../bin/lava-test-case

    2023-04-07T20:04:52.862756  <8>[   19.480451] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/643075328e91eda67979e9ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline=
-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline=
-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643075328e91eda67979e=
9eb
        failing since 14 days (last pass: v6.3-rc1-2-gdb7df0cfaff3f, first =
fail: v6.3-rc1-4-g9ce5f3b3c18e2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6430763446922f1aeb79e922

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-b=
roonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-b=
roonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6430763446922f1aeb79e=
923
        failing since 14 days (last pass: v6.3-rc1-2-gdb7df0cfaff3f, first =
fail: v6.3-rc1-4-g9ce5f3b3c18e2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/643075308e91eda67979e9e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline=
-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline=
-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643075308e91eda67979e=
9e8
        failing since 32 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643076ade27fdff8a479e952

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-b=
roonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-b=
roonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643076ade27fdff8a479e=
953
        failing since 32 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/64307558623d4f48ea79e935

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline=
-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline=
-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64307558623d4f48ea79e=
936
        failing since 32 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64307687efd0944fcd79e961

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-b=
roonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-b=
roonie/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64307687efd0944fcd79e=
962
        failing since 32 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6430763946922f1aeb79e954

  Results:     10 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-5-gd946c9118047/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6430763946922f1=
aeb79e957
        failing since 32 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        60 lines

    2023-04-07T19:59:28.399780  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0a28000 allocated at kernel_clone+0x8c/0x=
36c

    2023-04-07T19:59:28.400020  kern  :alert : Register r5 information: non=
-slab/vmalloc memory

    2023-04-07T19:59:28.400219  kern  :alert : Register r6 information: zer=
o-size pointer

    2023-04-07T19:59:28.400413  kern  :alert : Register r7 information: sla=
b task_struct start c30e6e80 pointer offset 0 size 2176

    2023-04-07T19:59:28.400621  kern  :alert : Register r8 information: non=
-slab/vmalloc memory

    2023-04-07T19:59:28.400812  kern  :alert : Register r9 information: non=
-slab/vmalloc memory

    2023-04-07T19:59:28.447851  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory

    2023-04-07T19:59:28.448088  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory

    2023-04-07T19:59:28.448287  kern  :alert : Register r12 information: NU=
LL pointer

    2023-04-07T19:59:28.448478  kern  :alert : 8<--- cut here ---
 =

    ... (49 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6430763946922f1=
aeb79e958
        failing since 32 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        32 lines

    2023-04-07T19:59:28.350911  kern  :alert : 8<--- cut here ---

    2023-04-07T19:59:28.351148  kern  :alert : Unhandled faul<8>[   14.5250=
63] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines =
MEASUREMENT=3D32>

    2023-04-07T19:59:28.351350  t: alignment exception (0x001) at 0xc1a50741

    2023-04-07T19:59:28.351543  kern  :alert : [c1a50741] *pgd=3D01a1141e(b=
ad)

    2023-04-07T19:59:28.351731  kern  :alert : Register r0 information: non=
-slab/vmalloc memory

    2023-04-07T19:59:28.351931  kern  :alert : Register r1 information: non=
-paged memory

    2023-04-07T19:59:28.352117  kern  :alert : Register r2 information: non=
-slab/vmalloc memory

    2023-04-07T19:59:28.352302  kern  :alert : Register r3 information: non=
-paged memory
   =

 =20
