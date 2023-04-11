Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A3A20F0
	for <chrome-platform@lists.linux.dev>; Tue, 11 Apr 2023 04:49:31 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id q2so11599274pll.7
        for <chrome-platform@lists.linux.dev>; Mon, 10 Apr 2023 21:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1681188571; x=1683780571;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IKv4wMw/BIVWzBfRklBkDp2YoW/kE3YoDRyGdJknAy8=;
        b=SVjT8t57CyEerHOQjr/1poHCWUdB63S0bOHRgyrOw1dlQNz5ZegTNYVttKdEk5S5e4
         1+AM+RF2MOrc0jv1k9fF7oRcBaSNI/avoxioOJE5GqAygM/cW90tsZnAaRHROCH+1Ude
         N3Z7ZTAnOclhvWVj4Du0UjXJyXMZ5AtKPhj/EbrP095csMO6sMXxzxkMKvd6RoWFRno3
         qRexCZSE9DgnDWMMHsXXT9VM5/xmExVbkUyJDx/PKBuQBwr9b37+yeaf3SAZqCZeT+Z3
         EI1CYUZPvzDijOUSolcZswPnmS96r5Y97qfiKuhWELSnNSyGNVwug2ieaxlacL67YoJG
         opGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681188571; x=1683780571;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKv4wMw/BIVWzBfRklBkDp2YoW/kE3YoDRyGdJknAy8=;
        b=b68JuZkzUzwL+vyuh62g/5SVZtqRmWEJFlzIyesCLGdeEKPFDhsNHvTM8a+YsMl30K
         m2L18a8VCoFPN6Zbj+zCS+6DlyALSh7e8AhdafVT2ngEmnCwUelCk+hj+Xn2xVXR+TEa
         AmLfYnpk+IlgXO8fI8Qr2cIFOFnen/Ur4VM5scK+eNfmLL2CS0iolx3PFMyeepTcyDxe
         y7r9fsDc3vhs+PrAeSdzcXQOElVr63lUS/wA0Ta8kaL4gF8Wc02xrGBPZyBlPSTX9nUO
         ccDj7GIvCKNzSrHcspXemwUsfV13cTxDJPz39BKSQHf6gNuXO+4+/g+lFpQ3IiVudFJH
         TAkw==
X-Gm-Message-State: AAQBX9fSIsUkdgTSLofJ6Egu8r4a6LLIDFs3pSvdHXDzTyOn0XTEylNO
	1ksaxlm/pg8pt/GfHT624ZoU9Q==
X-Google-Smtp-Source: AKy350am+D8/ze+Nk1cNbZgugJDt4l/7O7NE2Jf3kohXwQaRzkD3VEM0PUeL9TfkEZRmhiT/eMpGHA==
X-Received: by 2002:a05:6a20:3a8f:b0:da:c40:8d8 with SMTP id d15-20020a056a203a8f00b000da0c4008d8mr1293619pzh.4.1681188570494;
        Mon, 10 Apr 2023 21:49:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g19-20020aa78753000000b006373e59f0d4sm3187548pfo.24.2023.04.10.21.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 21:49:29 -0700 (PDT)
Message-ID: <6434e6d9.a70a0220.ef515.5ff0@mx.google.com>
Date: Mon, 10 Apr 2023 21:49:29 -0700 (PDT)
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
X-Kernelci-Kernel: v6.3-rc1-6-g14bb09b32f43
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 79 runs,
 31 regressions (v6.3-rc1-6-g14bb09b32f43)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 79 runs, 31 regressions (v6.3-rc1-6-=
g14bb09b32f43)

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

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
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

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

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


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.3-rc1-6-g14bb09b32f43/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.3-rc1-6-g14bb09b32f43
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      14bb09b32f433c1c87d96732ad71442d03fd4e73 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6434d9a1e541fd53a72e8633

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6434d9a1e541fd53a72e8638
        failing since 3 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first f=
ail: v6.3-rc1-5-gd946c9118047)

    2023-04-11T03:52:53.777013  <8>[   10.760964] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9931005_1.4.2.3.1>

    2023-04-11T03:52:53.780112  + set +x

    2023-04-11T03:52:53.885060  / # #

    2023-04-11T03:52:53.986294  export SHELL=3D/bin/sh

    2023-04-11T03:52:53.987073  #

    2023-04-11T03:52:54.089169  / # export SHELL=3D/bin/sh. /lava-9931005/e=
nvironment

    2023-04-11T03:52:54.090047  =


    2023-04-11T03:52:54.192013  / # . /lava-9931005/environment/lava-993100=
5/bin/lava-test-runner /lava-9931005/1

    2023-04-11T03:52:54.193218  =


    2023-04-11T03:52:54.199968  / # /lava-9931005/bin/lava-test-runner /lav=
a-9931005/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6434d998125ed2a2af2e860f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6434d998125ed2a2af2e8614
        failing since 3 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first f=
ail: v6.3-rc1-5-gd946c9118047)

    2023-04-11T03:52:48.045566  + <8>[   11.159000] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9931031_1.4.2.3.1>

    2023-04-11T03:52:48.046169  set +x

    2023-04-11T03:52:48.154801  / # #

    2023-04-11T03:52:48.258212  export SHELL=3D/bin/sh

    2023-04-11T03:52:48.259136  #

    2023-04-11T03:52:48.361491  / # export SHELL=3D/bin/sh. /lava-9931031/e=
nvironment

    2023-04-11T03:52:48.362422  =


    2023-04-11T03:52:48.464750  / # . /lava-9931031/environment/lava-993103=
1/bin/lava-test-runner /lava-9931031/1

    2023-04-11T03:52:48.466156  =


    2023-04-11T03:52:48.470720  / # /lava-9931031/bin/lava-test-runner /lav=
a-9931031/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6434d99751ecacaa332e8612

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6434d99751ecacaa332e8617
        failing since 3 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first f=
ail: v6.3-rc1-5-gd946c9118047)

    2023-04-11T03:52:32.144482  <8>[    9.799130] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9931013_1.4.2.3.1>

    2023-04-11T03:52:32.147707  + set +x

    2023-04-11T03:52:32.249681  #

    2023-04-11T03:52:32.350811  / # #export SHELL=3D/bin/sh

    2023-04-11T03:52:32.350994  =


    2023-04-11T03:52:32.451856  / # export SHELL=3D/bin/sh. /lava-9931013/e=
nvironment

    2023-04-11T03:52:32.452035  =


    2023-04-11T03:52:32.552919  / # . /lava-9931013/environment/lava-993101=
3/bin/lava-test-runner /lava-9931013/1

    2023-04-11T03:52:32.553186  =


    2023-04-11T03:52:32.557896  / # /lava-9931013/bin/lava-test-runner /lav=
a-9931013/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6434d98151ecacaa332e85f3

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
434d98151ecacaa332e8604
        new failure (last pass: v6.3-rc1-5-gd946c9118047)

    2023-04-11T03:52:15.717788  =


    2023-04-11T03:52:15.721325  /usr/bin/tpm2_getcap

    2023-04-11T03:52:25.935011  /lava-9931010/1/../bin/lava-test-case<8>[  =
 21.573728] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dtpm-chip-is-online RESULT=
=3Dfail>

    2023-04-11T03:52:25.935174  =

   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6434d9fcb9fb277c772e861b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6434d9fcb9fb277c772e8620
        failing since 3 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first f=
ail: v6.3-rc1-5-gd946c9118047)

    2023-04-11T03:54:19.359954  + <8>[   10.923571] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9931037_1.4.2.3.1>

    2023-04-11T03:54:19.360429  set +x

    2023-04-11T03:54:19.466116  #

    2023-04-11T03:54:19.467351  =


    2023-04-11T03:54:19.569661  / # #export SHELL=3D/bin/sh

    2023-04-11T03:54:19.570483  =


    2023-04-11T03:54:19.672380  / # export SHELL=3D/bin/sh. /lava-9931037/e=
nvironment

    2023-04-11T03:54:19.673104  =


    2023-04-11T03:54:19.774974  / # . /lava-9931037/environment/lava-993103=
7/bin/lava-test-runner /lava-9931037/1

    2023-04-11T03:54:19.776218  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6434d98dd22b80a9ff2e85eb

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6434d98dd22b80a9ff2e85f0
        failing since 3 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first f=
ail: v6.3-rc1-5-gd946c9118047)

    2023-04-11T03:52:35.973133  <8>[   10.816874] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9931038_1.4.2.3.1>

    2023-04-11T03:52:35.976379  + set +x

    2023-04-11T03:52:36.077964  #

    2023-04-11T03:52:36.078210  =


    2023-04-11T03:52:36.179227  / # #export SHELL=3D/bin/sh

    2023-04-11T03:52:36.179403  =


    2023-04-11T03:52:36.280261  / # export SHELL=3D/bin/sh. /lava-9931038/e=
nvironment

    2023-04-11T03:52:36.280435  =


    2023-04-11T03:52:36.381341  / # . /lava-9931038/environment/lava-993103=
8/bin/lava-test-runner /lava-9931038/1

    2023-04-11T03:52:36.381633  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6434d99fe541fd53a72e8626

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6434d99fe541fd53a72e862b
        failing since 3 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first f=
ail: v6.3-rc1-5-gd946c9118047)

    2023-04-11T03:52:45.439526  + set<8>[   10.936508] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9931011_1.4.2.3.1>

    2023-04-11T03:52:45.439631   +x

    2023-04-11T03:52:45.544235  / # #

    2023-04-11T03:52:45.645355  export SHELL=3D/bin/sh

    2023-04-11T03:52:45.645588  #

    2023-04-11T03:52:45.746520  / # export SHELL=3D/bin/sh. /lava-9931011/e=
nvironment

    2023-04-11T03:52:45.746732  =


    2023-04-11T03:52:45.847671  / # . /lava-9931011/environment/lava-993101=
1/bin/lava-test-runner /lava-9931011/1

    2023-04-11T03:52:45.848004  =


    2023-04-11T03:52:45.852189  / # /lava-9931011/bin/lava-test-runner /lav=
a-9931011/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6434dac045ca647ba12e865e

  Results:     13 PASS, 12 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-=
imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-=
imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6434dac045ca647=
ba12e8678
        failing since 35 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-04-11T03:57:17.394239  k<8>[   12.142319] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
    2023-04-11T03:57:17.394594  ern  :alert : Register r0 information: non-=
slab/vmalloc memory
    2023-04-11T03:57:17.394791  kern  :alert : Register r1 information: non=
-paged memory
    2023-04-11T03:57:17.395205  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-04-11T03:57:17.395393  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-11T03:57:17.416525  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0c8c000 allocated at kernel_clone+0x8c/0x=
36c
    2023-04-11T03:57:17.416885  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-04-11T03:57:17.417210  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-04-11T03:57:17.438347  kern  :alert : Register r7 information: sla=
b task_struct start c4c74c80 pointer offset 0 size 2176
    2023-04-11T03:57:17.439195  kern  :alert : Register r8 information: non=
-slab/vmalloc memory =

    ... (103 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6434dac045ca647=
ba12e8679
        failing since 35 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-04-11T03:57:17.371244  kern  :alert : 8<--- cut here ---
    2023-04-11T03:57:17.371523  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-04-11T03:57:17.371996  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6434dabf466d14dde22e860e

  Results:     13 PASS, 12 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-=
imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-=
imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6434dabf466d14d=
de22e8628
        failing since 35 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-04-11T03:57:22.180253  k<8>[   16.928101] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
    2023-04-11T03:57:22.180871  ern  :alert : Register r0 information: non-=
slab/vmalloc memory
    2023-04-11T03:57:22.181140  kern  :alert : Register r1 information: non=
-paged memory
    2023-04-11T03:57:22.181329  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-04-11T03:57:22.181893  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-11T03:57:22.202225  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0d4c000 allocated at kernel_clone+0x8c/0x=
36c
    2023-04-11T03:57:22.202635  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-04-11T03:57:22.203186  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-04-11T03:57:22.225369  kern  :alert : Register r7 information: sla=
b task_struct start c22ef700 pointer offset 0 size 2176
    2023-04-11T03:57:22.225764  kern  :alert : Register r8 information: non=
-slab/vmalloc memory =

    ... (103 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6434dabf466d14d=
de22e8629
        failing since 35 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-04-11T03:57:22.158060  kern  :alert : 8<--- cut here ---
    2023-04-11T03:57:22.158548  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-04-11T03:57:22.159029  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6434da9245ca647ba12e85f3

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6434da9345ca647=
ba12e85fa
        failing since 35 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-04-11T03:56:58.704646  mation: non-slab/vmalloc memory
    2023-04-11T03:56:58.704825  kern  :alert : Register r1 information: non=
-paged memory
    2023-04-11T03:56:58.713553  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-04-11T03:56:58.713723  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-11T03:56:58.722726  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0e10000 allocated at kernel_clone+0x8c/0x=
36c
    2023-04-11T03:56:58.731445  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-04-11T03:56:58.740758  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-04-11T03:56:58.749534  kern  :alert : Register r7 information: sla=
b task_struct start c347bb80 pointer offset 0 size 2176
    2023-04-11T03:56:58.749695  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-04-11T03:56:58.758716  kern  :alert : Register r9 information: non=
-slab/vmalloc memory =

    ... (102 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6434da9345ca647=
ba12e85fb
        failing since 35 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-04-11T03:56:58.677350  kern  :alert : 8<--- cut here ---
    2023-04-11T03:56:58.686445  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-04-11T03:56:58.686644  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)
    2023-04-11T03:56:58.695397  kern  :alert : Register r0 infor[    5.5994=
93] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines =
MEASUREMENT=3D48>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6434db084c2d3baebc2e85e6

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7=
d-sdb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7=
d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6434db084c2d3ba=
ebc2e85ed
        failing since 35 days (last pass: v6.2-rc1-32-g7ae7deb4a4b4, first =
fail: v6.3-rc1)
        90 lines

    2023-04-11T03:58:28.238963  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-11T03:58:28.278724  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0d8c000 allocated at kernel_clone+0x8c/0x=
36c
    2023-04-11T03:58:28.279418  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-04-11T03:58:28.279678  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-04-11T03:58:28.279922  kern  :alert : Register r7 information: sla=
b task_struct start c39f2200 pointer offset 0 size 2176
    2023-04-11T03:58:28.280160  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-04-11T03:58:28.280681  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
    2023-04-11T03:58:28.321857  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory
    2023-04-11T03:58:28.322273  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory
    2023-04-11T03:58:28.322789  kern  :alert : Register r12 information: NU=
LL pointer =

    ... (97 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6434db084c2d3ba=
ebc2e85ee
        failing since 35 days (last pass: v6.2-rc1-32-g7ae7deb4a4b4, first =
fail: v6.3-rc1)
        48 lines

    2023-04-11T03:58:28.235726  kern  :alert : 8<--- cut here ---
    2023-04-11T03:58:28.236160  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-04-11T03:58:28.236677  kern  :alert : [c1a50741] *pgd=3D81a1141e(b=
ad)
    2023-04-11T03:58:28.236926  k<8>[   10.877856] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
    2023-04-11T03:58:28.237165  ern  :alert : Register r0 information: non-=
slab/vmalloc memory
    2023-04-11T03:58:28.237443  kern  :alert : Register r1 information: non=
-paged memory
    2023-04-11T03:58:28.237675  kern  :alert : Register r2 information: non=
-slab/vmalloc memory   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 5          =


  Details:     https://kernelci.org/test/plan/id/6434dbeda90fd508822e8716

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron=
-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron=
-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6434dbeda90fd508822e8719
        failing since 34 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-g22181069e867)

    2023-04-11T04:02:36.817766  / # #
    2023-04-11T04:02:36.920594  export SHELL=3D/bin/sh
    2023-04-11T04:02:36.921467  #
    2023-04-11T04:02:37.023517  / # export SHELL=3D/bin/sh. /lava-315690/en=
vironment
    2023-04-11T04:02:37.024319  =

    2023-04-11T04:02:37.126190  / # . /lava-315690/environment/lava-315690/=
bin/lava-test-runner /lava-315690/1
    2023-04-11T04:02:37.127541  =

    2023-04-11T04:02:37.142135  / # /lava-315690/bin/lava-test-runner /lava=
-315690/1
    2023-04-11T04:02:37.199762  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-11T04:02:37.200250  + <8>[   22.598015] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 315690_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/6434dbeda90fd508822e871d
        failing since 34 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-g22181069e867)

    2023-04-11T04:02:39.293595  /lava-315690/1/../bin/lava-test-case
    2023-04-11T04:02:39.294078  <8>[   24.703855] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-04-11T04:02:39.294396  /lava-315690/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/64=
34dbeda90fd508822e871f
        failing since 34 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-g22181069e867)

    2023-04-11T04:02:40.350464  /lava-315690/1/../bin/lava-test-case
    2023-04-11T04:02:40.350960  <8>[   25.741463] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-04-11T04:02:40.351269  /lava-315690/1/../bin/lava-test-case
    2023-04-11T04:02:40.351517  <8>[   25.758387] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/6434dbeda90fd508822e8724
        failing since 34 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-g22181069e867)

    2023-04-11T04:02:41.424938  /lava-315690/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/6434dbeda90fd508822e8725
        failing since 34 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-g22181069e867)

    2023-04-11T04:02:41.428192  <8>[   26.851794] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-04-11T04:02:42.481935  /lava-315690/1/../bin/lava-test-case
    2023-04-11T04:02:42.482417  <8>[   27.872799] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-04-11T04:02:42.482755  /lava-315690/1/../bin/lava-test-case
    2023-04-11T04:02:42.483000  <8>[   27.891423] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2023-04-11T04:02:42.483239  /lava-315690/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6434d994d22b80a9ff2e85f8

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6434d994d22b80a9ff2e85fd
        failing since 3 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first f=
ail: v6.3-rc1-5-gd946c9118047)

    2023-04-11T03:52:33.701008  + set +x<8>[   11.370776] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 9930992_1.4.2.3.1>

    2023-04-11T03:52:33.701119  =


    2023-04-11T03:52:33.805794  / # #

    2023-04-11T03:52:33.906946  export SHELL=3D/bin/sh

    2023-04-11T03:52:33.907138  #

    2023-04-11T03:52:34.008076  / # export SHELL=3D/bin/sh. /lava-9930992/e=
nvironment

    2023-04-11T03:52:34.008335  =


    2023-04-11T03:52:34.109223  / # . /lava-9930992/environment/lava-993099=
2/bin/lava-test-runner /lava-9930992/1

    2023-04-11T03:52:34.109555  =


    2023-04-11T03:52:34.114361  / # /lava-9930992/bin/lava-test-runner /lav=
a-9930992/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6434ddd27a3966d4b02e87d2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/arm64/defconfig+arm64-chromebook/gcc-10/lab-broonie=
/baseline-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/arm64/defconfig+arm64-chromebook/gcc-10/lab-broonie=
/baseline-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6434ddd27a3966d4b02e8=
7d3
        new failure (last pass: v6.3-rc1-5-gd946c9118047) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/6434dcb138e981d20f2e8712

  Results:     166 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/643=
4dcb138e981d20f2e8760
        failing since 35 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)

    2023-04-11T04:05:59.079851  /lava-9931204/1/../bin/lava-test-case

    2023-04-11T04:05:59.086221  <8>[   23.433483] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/6434dcb138e981d20f2e87af
        failing since 35 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)

    2023-04-11T04:05:56.203657  /lava-9931204/1/../bin/lava-test-case

    2023-04-11T04:05:56.215132  <8>[   20.560557] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/6434dcb138e981d20f2e87b0
        failing since 35 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)

    2023-04-11T04:05:55.122168  <3>[   19.471306] Bluetooth: hci0: command =
0x1002 tx timeout

    2023-04-11T04:05:55.128894  <3>[   19.471443] Bluetooth: hci0: Opcode 0=
x1002 failed: -110

    2023-04-11T04:05:55.176805  /lava-9931204/1/../bin/lava-test-case

    2023-04-11T04:05:55.187175  <8>[   19.532249] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6434d8b50b6d54a7392e85fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline=
-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline=
-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6434d8b50b6d54a7392e8=
5fb
        failing since 17 days (last pass: v6.3-rc1-2-gdb7df0cfaff3f, first =
fail: v6.3-rc1-4-g9ce5f3b3c18e2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6434d9a8e541fd53a72e8641

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-b=
roonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-b=
roonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6434d9a8e541fd53a72e8=
642
        failing since 18 days (last pass: v6.3-rc1-2-gdb7df0cfaff3f, first =
fail: v6.3-rc1-4-g9ce5f3b3c18e2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6434d8b6d977d0437c2e85f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline=
-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline=
-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6434d8b6d977d0437c2e8=
5f6
        failing since 35 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6434d9a59d48adaa702e864b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-b=
roonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-b=
roonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6434d9a59d48adaa702e8=
64c
        failing since 35 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6434d8b7d977d0437c2e85fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline=
-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline=
-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6434d8b7d977d0437c2e8=
5fc
        failing since 35 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6434d9a6d22b80a9ff2e8617

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-b=
roonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-6-g14bb09b32f43/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-b=
roonie/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6434d9a6d22b80a9ff2e8=
618
        failing since 35 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d) =

 =20
