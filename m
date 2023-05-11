Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA96A3FDF
	for <chrome-platform@lists.linux.dev>; Thu, 11 May 2023 22:53:18 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6439d505274so5558359b3a.0
        for <chrome-platform@lists.linux.dev>; Thu, 11 May 2023 15:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683845598; x=1686437598;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5xe92xFMqh5xJpMcUrGjFgyCFNf5qKow0ogU0eOagw8=;
        b=l55ZPAqtS4nbEPR2RdWAnWzcKs/RgJKjtjphR8l2rwQRN8s7J3zrUJcCE7iDWA5voY
         Nihs0JsUM3S3k3E8M+l68bmsHqUKNywjNOBunU4l6x2p02qiLIonNoQRu256EipFsVFw
         TAyYpye0hEQyX4kBDnQMQ8ZDDmXVv6FWToCsYTrgSLGk8pMs8OdDq1KrI3SyO1qAjpSc
         AfPWgKl5qqd4O3w8mPPScMXM4BOykpMwwzS3QyjfsMc86Rq1xUi18bKbtKRPLTGi/ZsL
         pxiZy4NTEBI6QCzfGw+BRoRCaOEMSpmoPzUVuqCXkrChFGlC21sEKgK1kwfi095f4u9x
         W2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683845598; x=1686437598;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5xe92xFMqh5xJpMcUrGjFgyCFNf5qKow0ogU0eOagw8=;
        b=X7VpwQGrsnsspH5cU2/x/H1Xzfq6rsIt5qV6iK2J+KONqVhU0v0QyrsujJh/yq/jnd
         PIvkKV+/v0Oq/0jbbeVvfXRvBSczWzElz5fgk96NzJa9ejDmL/gAfhFLo1P4rs80AqBM
         l43Ci+S4FhQMWz+Qqr2KOe8PnATxYKoMoTx8rJNCx2IOGv5+j0KMsVK/bvVtn/XeOUBe
         3CZepkxWuxCMpnu73nPFjvsMxrGP9iUTzjSC9Qb+9u7B7o6Zy+GTKOaAuRdER6t/MJF4
         H5ryXcpPCmZWQdj0Xg9aX8pxj4iMphFQWzUGUw1cS/URKBpjnx0m0R5UGJvV+5FJxpT7
         qHMA==
X-Gm-Message-State: AC+VfDwj/3vC5T+AHBOB2KVzUHfNx3rR/vlTsCzPjUrLdqvar9afDChK
	fTX3WyNxx1LuwgMGJr+UmUve8w==
X-Google-Smtp-Source: ACHHUZ7K2VyDpz1k/V2cjiq4bBuNoUW5RsBt6yDU2HqcjlgTR8GnIbcv617PNRx4DFAqD2fPjju1SQ==
X-Received: by 2002:a05:6a00:1a41:b0:63b:8778:99e4 with SMTP id h1-20020a056a001a4100b0063b877899e4mr28664885pfv.2.1683845598151;
        Thu, 11 May 2023 15:53:18 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e10-20020a6558ca000000b0051b0e564963sm5268874pgu.49.2023.05.11.15.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 15:53:17 -0700 (PDT)
Message-ID: <645d71dd.650a0220.58a8.a37f@mx.google.com>
Date: Thu, 11 May 2023 15:53:17 -0700 (PDT)
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
X-Kernelci-Kernel: v6.4-rc1-1-gc9f9c6c875d14
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 78 runs,
 14 regressions (v6.4-rc1-1-gc9f9c6c875d14)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 78 runs, 14 regressions (v6.4-rc1-1-=
gc9f9c6c875d14)

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

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.4-rc1-1-gc9f9c6c875d14/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.4-rc1-1-gc9f9c6c875d14
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      c9f9c6c875d14a107dabcf4579fcab95ed30af31 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645d643d6fc0c3e62b2e8622

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d643d6fc0c3e62b2e8627
        failing since 34 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-05-11T21:54:42.229455  + set<8>[   11.450973] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10287716_1.4.2.3.1>

    2023-05-11T21:54:42.229570   +x

    2023-05-11T21:54:42.333581  / # #

    2023-05-11T21:54:42.434116  export SHELL=3D/bin/sh

    2023-05-11T21:54:42.434290  #

    2023-05-11T21:54:42.534751  / # export SHELL=3D/bin/sh. /lava-10287716/=
environment

    2023-05-11T21:54:42.534926  =


    2023-05-11T21:54:42.635405  / # . /lava-10287716/environment/lava-10287=
716/bin/lava-test-runner /lava-10287716/1

    2023-05-11T21:54:42.635698  =


    2023-05-11T21:54:42.640689  / # /lava-10287716/bin/lava-test-runner /la=
va-10287716/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645d64356e9d8c35af2e8601

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d64356e9d8c35af2e8606
        failing since 34 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-05-11T21:54:51.127231  <8>[   10.936715] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10287701_1.4.2.3.1>

    2023-05-11T21:54:51.130664  + set +x

    2023-05-11T21:54:51.236369  =


    2023-05-11T21:54:51.338015  / # #export SHELL=3D/bin/sh

    2023-05-11T21:54:51.338648  =


    2023-05-11T21:54:51.440014  / # export SHELL=3D/bin/sh. /lava-10287701/=
environment

    2023-05-11T21:54:51.440658  =


    2023-05-11T21:54:51.542062  / # . /lava-10287701/environment/lava-10287=
701/bin/lava-test-runner /lava-10287701/1

    2023-05-11T21:54:51.543097  =


    2023-05-11T21:54:51.548125  / # /lava-10287701/bin/lava-test-runner /la=
va-10287701/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645d64a2d4b98077a92e85e7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d64a2d4b98077a92e85ec
        failing since 34 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-05-11T21:56:35.569887  + set +x

    2023-05-11T21:56:35.576445  <8>[   10.803573] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10287741_1.4.2.3.1>

    2023-05-11T21:56:35.680783  / # #

    2023-05-11T21:56:35.781483  export SHELL=3D/bin/sh

    2023-05-11T21:56:35.781748  #

    2023-05-11T21:56:35.882274  / # export SHELL=3D/bin/sh. /lava-10287741/=
environment

    2023-05-11T21:56:35.882454  =


    2023-05-11T21:56:35.982958  / # . /lava-10287741/environment/lava-10287=
741/bin/lava-test-runner /lava-10287741/1

    2023-05-11T21:56:35.983248  =


    2023-05-11T21:56:35.987490  / # /lava-10287741/bin/lava-test-runner /la=
va-10287741/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645d64203b63972d642e85e7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d64203b63972d642e85ec
        failing since 34 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-05-11T21:54:18.500396  <8>[   10.642650] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10287735_1.4.2.3.1>

    2023-05-11T21:54:18.503774  + set +x

    2023-05-11T21:54:18.604973  /#

    2023-05-11T21:54:18.705780   # #export SHELL=3D/bin/sh

    2023-05-11T21:54:18.706011  =


    2023-05-11T21:54:18.806563  / # export SHELL=3D/bin/sh. /lava-10287735/=
environment

    2023-05-11T21:54:18.806784  =


    2023-05-11T21:54:18.907362  / # . /lava-10287735/environment/lava-10287=
735/bin/lava-test-runner /lava-10287735/1

    2023-05-11T21:54:18.907672  =


    2023-05-11T21:54:18.912024  / # /lava-10287735/bin/lava-test-runner /la=
va-10287735/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645d641a77e8a92c722e862f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d641a77e8a92c722e8634
        failing since 34 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-05-11T21:54:29.488704  + set<8>[   11.345605] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10287699_1.4.2.3.1>

    2023-05-11T21:54:29.488799   +x

    2023-05-11T21:54:29.592922  / # #

    2023-05-11T21:54:29.693569  export SHELL=3D/bin/sh

    2023-05-11T21:54:29.693744  #

    2023-05-11T21:54:29.794295  / # export SHELL=3D/bin/sh. /lava-10287699/=
environment

    2023-05-11T21:54:29.794477  =


    2023-05-11T21:54:29.894979  / # . /lava-10287699/environment/lava-10287=
699/bin/lava-test-runner /lava-10287699/1

    2023-05-11T21:54:29.895250  =


    2023-05-11T21:54:29.900262  / # /lava-10287699/bin/lava-test-runner /la=
va-10287699/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/645d645ea00e1c9afa2e8669

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/base=
line-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/base=
line-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d645ea00e1c9afa2e866e
        failing since 17 days (last pass: v6.3-rc1-8-g0ad5ce8407db, first f=
ail: tag-chrome-platform-for-v6.4)

    2023-05-11T21:55:17.760517  + set +x
    2023-05-11T21:55:17.760675  [   13.189509] <LAVA_SIGNAL_ENDRUN 0_dmesg =
948311_1.5.2.3.1>
    2023-05-11T21:55:17.868579  / # #
    2023-05-11T21:55:17.970190  export SHELL=3D/bin/sh
    2023-05-11T21:55:17.970661  #
    2023-05-11T21:55:18.071910  / # export SHELL=3D/bin/sh. /lava-948311/en=
vironment
    2023-05-11T21:55:18.072398  =

    2023-05-11T21:55:18.173609  / # . /lava-948311/environment/lava-948311/=
bin/lava-test-runner /lava-948311/1
    2023-05-11T21:55:18.174224  =

    2023-05-11T21:55:18.177537  / # /lava-948311/bin/lava-test-runner /lava=
-948311/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/645d645ba00e1c9afa2e8648

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/base=
line-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/base=
line-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d645ba00e1c9afa2e864d
        new failure (last pass: v6.4-rc1)

    2023-05-11T21:55:20.618713  + set[   15.170222] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 948307_1.5.2.3.1>
    2023-05-11T21:55:20.618891   +x
    2023-05-11T21:55:20.724928  / # #
    2023-05-11T21:55:20.826561  export SHELL=3D/bin/sh
    2023-05-11T21:55:20.826972  #
    2023-05-11T21:55:20.928165  / # export SHELL=3D/bin/sh. /lava-948307/en=
vironment
    2023-05-11T21:55:20.928651  =

    2023-05-11T21:55:21.029887  / # . /lava-948307/environment/lava-948307/=
bin/lava-test-runner /lava-948307/1
    2023-05-11T21:55:21.030453  =

    2023-05-11T21:55:21.033436  / # /lava-948307/bin/lava-test-runner /lava=
-948307/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645d641b62c6decb3a2e85f8

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645d641b62c6decb3a2e85fd
        failing since 34 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-05-11T21:54:17.040068  <8>[   11.011495] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10287707_1.4.2.3.1>

    2023-05-11T21:54:17.144995  / # #

    2023-05-11T21:54:17.245714  export SHELL=3D/bin/sh

    2023-05-11T21:54:17.245908  #

    2023-05-11T21:54:17.346410  / # export SHELL=3D/bin/sh. /lava-10287707/=
environment

    2023-05-11T21:54:17.346599  =


    2023-05-11T21:54:17.447131  / # . /lava-10287707/environment/lava-10287=
707/bin/lava-test-runner /lava-10287707/1

    2023-05-11T21:54:17.447460  =


    2023-05-11T21:54:17.452004  / # /lava-10287707/bin/lava-test-runner /la=
va-10287707/1

    2023-05-11T21:54:17.458474  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/645d68c4b487f096da2e860c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d68c4b487f096da2e8=
60d
        failing since 3 days (last pass: tag-chrome-platform-for-v6.4, firs=
t fail: v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/645d6a1ce8002e64d92e85f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645d6a1ce8002e64d92e8=
5f6
        failing since 3 days (last pass: tag-chrome-platform-for-v6.4, firs=
t fail: v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/645d67d4da2fc335bc2e85ee

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645d67d4da2fc33=
5bc2e8645
        failing since 3 days (last pass: tag-chrome-platform-for-v6.4, firs=
t fail: v6.4-rc1)
        2 lines

    2023-05-11T22:09:53.119249  kern  :alert : Mem abort in<8>[   19.214477=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D12>

    2023-05-11T22:09:53.119612  fo:

    2023-05-11T22:09:53.121876  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-11T22:09:53.129053  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-11T22:09:53.131587  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-11T22:09:53.135967  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-11T22:09:53.141425  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-11T22:09:53.143993  kern  :alert : Data abort info:

    2023-05-11T22:09:53.148429  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-11T22:09:53.158783  kern  :<8>[   19.258286] <LAVA_SIGNAL_TESTC=
ASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645d67d4da2fc33=
5bc2e8646
        failing since 3 days (last pass: tag-chrome-platform-for-v6.4, firs=
t fail: v6.4-rc1)
        12 lines

    2023-05-11T22:09:53.105277  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/645d661fde02fc6a2e2e86a2

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/arm64/defconfig/gcc-10/lab-collabora/baseline-rk33=
99-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/arm64/defconfig/gcc-10/lab-collabora/baseline-rk33=
99-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645d661fde02fc6=
a2e2e86a9
        failing since 3 days (last pass: tag-chrome-platform-for-v6.4, firs=
t fail: v6.4-rc1)
        2 lines

    2023-05-11T22:03:01.117604  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-11T22:03:01.118136  kern  :emerg : Code: 940f9910 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-11T22:03:01.118479  <8>[   21.370060] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-11T22:03:01.118801  + set +x

    2023-05-11T22:03:01.119108  <8>[   21.371972] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10287774_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645d661fde02fc6=
a2e2e86aa
        failing since 3 days (last pass: tag-chrome-platform-for-v6.4, firs=
t fail: v6.4-rc1)
        12 lines

    2023-05-11T22:03:01.065697  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-11T22:03:01.066124  kern  :alert : Mem abort info:

    2023-05-11T22:03:01.066462  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-11T22:03:01.066780  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-11T22:03:01.067087  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-11T22:03:01.067386  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-11T22:03:01.067676  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-11T22:03:01.067964  kern  :alert : Data abort info:

    2023-05-11T22:03:01.068247  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-11T22:03:01.068529  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =20
