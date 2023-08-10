Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E83EBD
	for <chrome-platform@lists.linux.dev>; Thu, 10 Aug 2023 04:50:06 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1bc0d39b52cso4046395ad.2
        for <chrome-platform@lists.linux.dev>; Wed, 09 Aug 2023 21:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1691643006; x=1692247806;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bwfriw7wKyOw+m0zXpNAbuRhiHdww5RYcfb9few7ERk=;
        b=3oYxk2XTrmQb7cLe/o346Uvt27MxNlw3YtiOWRSAGmgLvGxiW0B/5A+Y+ftz+MFap/
         lCDInxvS8x88TRzh68YsmUV453r3xEWAQLCV4Iiziw2Y0uGHdOeyCWaZYFIHkMhghaEZ
         RIJQh1zh0pV0nasINP5kwG//lNjErIuQd13sfUSj2TJZi2YOTDhsIsqDFgpd6STjVHBd
         S128fy21qNr+cIZBGfyJ6l8O8eandoN0C2uq5bEGGhSAXp//oeJVcAU6JreDeS7BD0f9
         SXpsIoBR+dEjMxx47zJy/4bgF72neSXdSxAbDd4PUZeADFqgINE2nSd2oqFYrO4hRYe8
         UUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691643006; x=1692247806;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bwfriw7wKyOw+m0zXpNAbuRhiHdww5RYcfb9few7ERk=;
        b=fa48/lK7tV//mL4v/XIu3c2MyI0a7e2b28wP2prYJJvQgrMkpnTlL3rUAVnRnn1kD5
         qQzz4FMZ8VLDltR+xC1qnBsqc+JR6IMYyH6uLIH8/dDSXLb9Zq5X5ZEnbWicYxQOLETK
         m8gX5WDdVpX5gGvP+OZESlPNH06OfekyxBxCox2NQEjL9qA69a34bEueYiwyV9GCoPFc
         kjHIqt8YEiDRVOpG0OuOmJN3k8K0LNpXfrKaunsiMXBD4xVSD/VR0f/l1CTf11uhusNs
         KlRDtycYxNl0uLj1VUVGlNVJL36w3FPnpuUrCIKXEiy4uGCyONlelbKZJ3j0CSYRgszi
         OOSA==
X-Gm-Message-State: AOJu0YyU7d0GWa+zLNd9ol0GdgvDt5DdfxanDDLz0cdJE5Pn1ccse1BR
	zlVXzKUGmFnRDrxFw7C8Sqla+w==
X-Google-Smtp-Source: AGHT+IE6ix+0OshzsdOIoLHtwSG1H/gJplSwTQpet7dVnR4NZSRY41T6IjBBW3mtVWCwf0b2Umg+RA==
X-Received: by 2002:a17:903:234e:b0:1bc:8c6c:217d with SMTP id c14-20020a170903234e00b001bc8c6c217dmr1277682plh.61.1691643005815;
        Wed, 09 Aug 2023 21:50:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id t12-20020a1709028c8c00b001a5260a6e6csm477637plo.206.2023.08.09.21.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 21:50:05 -0700 (PDT)
Message-ID: <64d46c7d.170a0220.5f651.0f7e@mx.google.com>
Date: Wed, 09 Aug 2023 21:50:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.5-rc1-4-g0820debb7d489
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
Subject: chrome-platform/for-kernelci baseline: 79 runs,
 13 regressions (v6.5-rc1-4-g0820debb7d489)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 79 runs, 13 regressions (v6.5-rc1-4-=
g0820debb7d489)

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

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.5-rc1-4-g0820debb7d489/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.5-rc1-4-g0820debb7d489
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      0820debb7d489e9eb1f68b7bb69e6ae210699b3f =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64d45f944af20562f635b229

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-4-g0820debb7d489/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-acer-chromebox-cxi4-puff.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-4-g0820debb7d489/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-acer-chromebox-cxi4-puff.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64d45f944af20562f635b=
22a
        new failure (last pass: v6.5-rc1-3-g703e77134ebf7) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64d45f8e4af20562f635b1da

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-4-g0820debb7d489/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-4-g0820debb7d489/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64d45f8e4af20562f635b1df
        failing since 124 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-08-10T03:54:32.298409  + <8>[   11.336848] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11250043_1.4.2.3.1>

    2023-08-10T03:54:32.298494  set +x

    2023-08-10T03:54:32.402677  / # #

    2023-08-10T03:54:32.503314  export SHELL=3D/bin/sh

    2023-08-10T03:54:32.503489  #

    2023-08-10T03:54:32.604012  / # export SHELL=3D/bin/sh. /lava-11250043/=
environment

    2023-08-10T03:54:32.604178  =


    2023-08-10T03:54:32.704709  / # . /lava-11250043/environment/lava-11250=
043/bin/lava-test-runner /lava-11250043/1

    2023-08-10T03:54:32.704973  =


    2023-08-10T03:54:32.709748  / # /lava-11250043/bin/lava-test-runner /la=
va-11250043/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64d45f7a4f66b17d8535b1d9

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-4-g0820debb7d489/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-4-g0820debb7d489/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64d45f7a4f66b17d8535b1de
        failing since 124 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-08-10T03:54:34.036265  <8>[    7.673771] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11250027_1.4.2.3.1>

    2023-08-10T03:54:34.039316  + set +x

    2023-08-10T03:54:34.140865  #

    2023-08-10T03:54:34.141155  =


    2023-08-10T03:54:34.241745  / # #export SHELL=3D/bin/sh

    2023-08-10T03:54:34.241950  =


    2023-08-10T03:54:34.342464  / # export SHELL=3D/bin/sh. /lava-11250027/=
environment

    2023-08-10T03:54:34.342683  =


    2023-08-10T03:54:34.443237  / # . /lava-11250027/environment/lava-11250=
027/bin/lava-test-runner /lava-11250027/1

    2023-08-10T03:54:34.443542  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
fsl-ls2088a-rdb              | arm64  | lab-nxp       | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64d461f1552ded5c3635b1e5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-4-g0820debb7d489/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-4-g0820debb7d489/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64d461f1552ded5c3635b1e8
        failing since 22 days (last pass: v6.0-rc1-19-gd378c6f0456c, first =
fail: v6.5-rc1-1-ga6edd5f5d9cc)

    2023-08-10T04:04:44.768472  + [   16.009948] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 1242382_1.5.2.4.1>
    2023-08-10T04:04:44.768765  set +x
    2023-08-10T04:04:44.873907  =

    2023-08-10T04:04:44.975065  / # #export SHELL=3D/bin/sh
    2023-08-10T04:04:44.975495  =

    2023-08-10T04:04:45.076451  / # export SHELL=3D/bin/sh. /lava-1242382/e=
nvironment
    2023-08-10T04:04:45.076873  =

    2023-08-10T04:04:45.177840  / # . /lava-1242382/environment/lava-124238=
2/bin/lava-test-runner /lava-1242382/1
    2023-08-10T04:04:45.178514  =

    2023-08-10T04:04:45.182545  / # /lava-1242382/bin/lava-test-runner /lav=
a-1242382/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64d45f68051ca90b0635b1f8

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-4-g0820debb7d489/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-4-g0820debb7d489/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64d45f68051ca90b0635b1fd
        failing since 124 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-08-10T03:54:09.176156  + set +x

    2023-08-10T03:54:09.182762  <8>[   11.074392] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11250010_1.4.2.3.1>

    2023-08-10T03:54:09.286830  / # #

    2023-08-10T03:54:09.387391  export SHELL=3D/bin/sh

    2023-08-10T03:54:09.387578  #

    2023-08-10T03:54:09.488033  / # export SHELL=3D/bin/sh. /lava-11250010/=
environment

    2023-08-10T03:54:09.488215  =


    2023-08-10T03:54:09.588685  / # . /lava-11250010/environment/lava-11250=
010/bin/lava-test-runner /lava-11250010/1

    2023-08-10T03:54:09.588933  =


    2023-08-10T03:54:09.593254  / # /lava-11250010/bin/lava-test-runner /la=
va-11250010/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64d45f69b635638d3b35b205

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-4-g0820debb7d489/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-4-g0820debb7d489/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64d45f69b635638d3b35b20a
        failing since 124 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-08-10T03:54:03.755296  <8>[   10.467441] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11250032_1.4.2.3.1>

    2023-08-10T03:54:03.758972  + set +x

    2023-08-10T03:54:03.860461  =


    2023-08-10T03:54:03.961026  / # #export SHELL=3D/bin/sh

    2023-08-10T03:54:03.961218  =


    2023-08-10T03:54:04.061734  / # export SHELL=3D/bin/sh. /lava-11250032/=
environment

    2023-08-10T03:54:04.061927  =


    2023-08-10T03:54:04.162442  / # . /lava-11250032/environment/lava-11250=
032/bin/lava-test-runner /lava-11250032/1

    2023-08-10T03:54:04.162772  =


    2023-08-10T03:54:04.167793  / # /lava-11250032/bin/lava-test-runner /la=
va-11250032/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64d45f864f66b17d8535b214

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-4-g0820debb7d489/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-4-g0820debb7d489/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64d45f864f66b17d8535b219
        failing since 124 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-08-10T03:54:37.469142  + <8>[   11.164955] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11250045_1.4.2.3.1>

    2023-08-10T03:54:37.469277  set +x

    2023-08-10T03:54:37.573838  / # #

    2023-08-10T03:54:37.674789  export SHELL=3D/bin/sh

    2023-08-10T03:54:37.675145  #

    2023-08-10T03:54:37.775805  / # export SHELL=3D/bin/sh. /lava-11250045/=
environment

    2023-08-10T03:54:37.776195  =


    2023-08-10T03:54:37.876888  / # . /lava-11250045/environment/lava-11250=
045/bin/lava-test-runner /lava-11250045/1

    2023-08-10T03:54:37.877369  =


    2023-08-10T03:54:37.882235  / # /lava-11250045/bin/lava-test-runner /la=
va-11250045/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64d45f67b635638d3b35b1df

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-4-g0820debb7d489/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-4-g0820debb7d489/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64d45f67b635638d3b35b1e4
        failing since 124 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-08-10T03:54:02.975342  + set +x<8>[   11.274853] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 11250017_1.4.2.3.1>

    2023-08-10T03:54:02.975424  =


    2023-08-10T03:54:03.079456  / # #

    2023-08-10T03:54:03.180030  export SHELL=3D/bin/sh

    2023-08-10T03:54:03.180199  #

    2023-08-10T03:54:03.280715  / # export SHELL=3D/bin/sh. /lava-11250017/=
environment

    2023-08-10T03:54:03.280886  =


    2023-08-10T03:54:03.381416  / # . /lava-11250017/environment/lava-11250=
017/bin/lava-test-runner /lava-11250017/1

    2023-08-10T03:54:03.381670  =


    2023-08-10T03:54:03.386215  / # /lava-11250017/bin/lava-test-runner /la=
va-11250017/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64d462b041502e3e3e35b1d9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-4-g0820debb7d489/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-4-g0820debb7d489/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64d462b041502e3e3e35b=
1da
        new failure (last pass: v6.5-rc1-3-g703e77134ebf7) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64d462afd58cea941435b23b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-4-g0820debb7d489/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-4-g0820debb7d489/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64d462afd58cea941435b=
23c
        new failure (last pass: v6.5-rc1-3-g703e77134ebf7) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64d462699a3712ab6a35b1d9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-4-g0820debb7d489/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i=
-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-4-g0820debb7d489/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i=
-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64d462699a3712ab6a35b=
1da
        failing since 22 days (last pass: v6.4-rc1-5-g2b8cc5858a07a, first =
fail: v6.5-rc1-1-ga6edd5f5d9cc) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64d4626a9a3712ab6a35b1dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-4-g0820debb7d489/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-4-g0820debb7d489/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64d4626a9a3712ab6a35b=
1dd
        failing since 13 days (last pass: v6.5-rc1-1-ga6edd5f5d9cc, first f=
ail: v6.5-rc1-1-g0a329167220af) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64d46186979b0d8f0335b1fb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-4-g0820debb7d489/arm64/defconfig/gcc-10/lab-collabora/baseline-sun5=
0i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-4-g0820debb7d489/arm64/defconfig/gcc-10/lab-collabora/baseline-sun5=
0i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64d46186979b0d8f0335b200
        failing since 22 days (last pass: v6.4-rc1-5-g2b8cc5858a07a, first =
fail: v6.5-rc1-1-ga6edd5f5d9cc)

    2023-08-10T04:04:41.568334  / # #

    2023-08-10T04:04:41.670473  export SHELL=3D/bin/sh

    2023-08-10T04:04:41.671196  #

    2023-08-10T04:04:41.772635  / # export SHELL=3D/bin/sh. /lava-11250110/=
environment

    2023-08-10T04:04:41.773404  =


    2023-08-10T04:04:41.874863  / # . /lava-11250110/environment/lava-11250=
110/bin/lava-test-runner /lava-11250110/1

    2023-08-10T04:04:41.876000  =


    2023-08-10T04:04:41.892801  / # /lava-11250110/bin/lava-test-runner /la=
va-11250110/1

    2023-08-10T04:04:41.961802  + export 'TESTRUN_ID=3D1_bootrr'

    2023-08-10T04:04:41.962296  + cd /lava-11250110/1/tests/1_boot<8>[   16=
.985588] <LAVA_SIGNAL_STARTRUN 1_bootrr 11250110_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
