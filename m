Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30B31369
	for <chrome-platform@lists.linux.dev>; Mon,  7 Aug 2023 04:49:15 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1b8b4748fe4so25780115ad.1
        for <chrome-platform@lists.linux.dev>; Sun, 06 Aug 2023 21:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1691383755; x=1691988555;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U+VHmp6n7tM5LEa/5ux8XO5U7ivBbvMDCyKOEaCQ7SA=;
        b=nHck5aqenJd1NfV9UyV6OGpjrxQFWIVVQPMOzjrA9l4NTNMAAg3h/bGWqt16+4IjwT
         4w4t3wJvAbMIhQ6jDhTLH7oFDj19+1VR83DbbIYJT9MUYNvLqqEVjP1D2Nc5BXNv+78z
         lVi369SXicuGRDHdqiKKi2OzwMc7mwF1lfIXrTJ4xQGMggTZht3cKgb35AYQamOQ3YS1
         Qxx1pAgGpc9xZ4ZWVjtfc71rlewkgS3U2G+7EMQeBQBUgeeQbx+OdMAWYfYSdvPDx00n
         sgbvvP430X8s0FcYNwy/cn+ogtxthgg5OmG2ORK5g3OEGMEOLkV1RjJDxl65uYKk1C+J
         C60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691383755; x=1691988555;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+VHmp6n7tM5LEa/5ux8XO5U7ivBbvMDCyKOEaCQ7SA=;
        b=EfZh2wxtCQCn9B5vcydEJWJBbbZqtnNU/yNL5OHC4TE6pRfSijtxC0U0HVFvy1uYcq
         7uxO1L4e+SkC/IQWxCNohn3AS91FEP44b/854OrYcX45cWvIARtDsmxIzm4EzVu0Xt/E
         5O+iz3Jqa/Kbd4kpWNv0o55lIOGouS2/Ll7sQSTYEJTwdWTjgBNZh02W1J3M/LpWOGiT
         eqwSe1iZpHPC+BaG/lWt7lCIOAsB1xjpkE9wFDOODhhyx8VvXIZF+k2ATcZ0teIK4PYn
         2mUHWHgPP7/acSn8IwYLVJjKuDuBXnzfBUdDBud1oPImqdY+aAmVyAzxFiiXVKmVBR4G
         /Nag==
X-Gm-Message-State: AOJu0YzLQ4wj9bSH4wraisNUeAuvCFTqMW/XjgENWtRkvP1onf0uHPy3
	PZhvUIPvGNsyGT9pSSj5f5aE8Q==
X-Google-Smtp-Source: AGHT+IH33H+6pFHpSOI0s5o3elMbOfIEXQXcozWb1OLP2a9qTrqiVsATH5jlDnzREov3mFrlhqw3Dw==
X-Received: by 2002:a17:902:7287:b0:1b3:f5c7:4e75 with SMTP id d7-20020a170902728700b001b3f5c74e75mr7185812pll.58.1691383754951;
        Sun, 06 Aug 2023 21:49:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 20-20020a170902e9d400b001bc05774004sm5709390plk.236.2023.08.06.21.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 21:49:14 -0700 (PDT)
Message-ID: <64d077ca.170a0220.4cde6.a0f3@mx.google.com>
Date: Sun, 06 Aug 2023 21:49:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.5-rc1-3-g703e77134ebf7
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
Subject: chrome-platform/for-kernelci baseline: 79 runs,
 10 regressions (v6.5-rc1-3-g703e77134ebf7)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 79 runs, 10 regressions (v6.5-rc1-3-=
g703e77134ebf7)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
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
ci/kernel/v6.5-rc1-3-g703e77134ebf7/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.5-rc1-3-g703e77134ebf7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      703e77134ebf7d99acbd0f85f7c94cfb408f4bd0 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64d06c3800b218be2335b216

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-3-g703e77134ebf7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-3-g703e77134ebf7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64d06c3800b218be2335b21b
        failing since 121 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-08-07T03:59:36.441250  + set<8>[   10.656837] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11219421_1.4.2.3.1>

    2023-08-07T03:59:36.441734   +x

    2023-08-07T03:59:36.548894  / # #

    2023-08-07T03:59:36.651102  export SHELL=3D/bin/sh

    2023-08-07T03:59:36.651821  #

    2023-08-07T03:59:36.753282  / # export SHELL=3D/bin/sh. /lava-11219421/=
environment

    2023-08-07T03:59:36.754022  =


    2023-08-07T03:59:36.856006  / # . /lava-11219421/environment/lava-11219=
421/bin/lava-test-runner /lava-11219421/1

    2023-08-07T03:59:36.857058  =


    2023-08-07T03:59:36.862139  / # /lava-11219421/bin/lava-test-runner /la=
va-11219421/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64d06c3400b218be2335b1fd

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-3-g703e77134ebf7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-3-g703e77134ebf7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64d06c3400b218be2335b202
        failing since 121 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-08-07T03:59:34.060740  <8>[    8.383001] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11219423_1.4.2.3.1>

    2023-08-07T03:59:34.064122  + set +x

    2023-08-07T03:59:34.169503  #

    2023-08-07T03:59:34.170862  =


    2023-08-07T03:59:34.272885  / # #export SHELL=3D/bin/sh

    2023-08-07T03:59:34.273629  =


    2023-08-07T03:59:34.375498  / # export SHELL=3D/bin/sh. /lava-11219423/=
environment

    2023-08-07T03:59:34.376370  =


    2023-08-07T03:59:34.477848  / # . /lava-11219423/environment/lava-11219=
423/bin/lava-test-runner /lava-11219423/1

    2023-08-07T03:59:34.479146  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
fsl-ls2088a-rdb              | arm64  | lab-nxp       | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64d06d244d1082757f35b1de

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-3-g703e77134ebf7/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-3-g703e77134ebf7/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64d06d244d1082757f35b1e1
        failing since 19 days (last pass: v6.0-rc1-19-gd378c6f0456c, first =
fail: v6.5-rc1-1-ga6edd5f5d9cc)

    2023-08-07T04:03:32.321156  + [   12.307398] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 1241272_1.5.2.4.1>
    2023-08-07T04:03:32.321445  set +x
    2023-08-07T04:03:32.426791  =

    2023-08-07T04:03:32.527949  / # #export SHELL=3D/bin/sh
    2023-08-07T04:03:32.528347  =

    2023-08-07T04:03:32.629283  / # export SHELL=3D/bin/sh. /lava-1241272/e=
nvironment
    2023-08-07T04:03:32.629743  =

    2023-08-07T04:03:32.730797  / # . /lava-1241272/environment/lava-124127=
2/bin/lava-test-runner /lava-1241272/1
    2023-08-07T04:03:32.731588  =

    2023-08-07T04:03:32.734974  / # /lava-1241272/bin/lava-test-runner /lav=
a-1241272/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64d06c20adc630997a35b1ef

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-3-g703e77134ebf7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-3-g703e77134ebf7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64d06c20adc630997a35b1f4
        failing since 121 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-08-07T03:59:19.994752  + set +x

    2023-08-07T03:59:20.001582  <8>[   10.264213] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11219425_1.4.2.3.1>

    2023-08-07T03:59:20.105784  / # #

    2023-08-07T03:59:20.206325  export SHELL=3D/bin/sh

    2023-08-07T03:59:20.206504  #

    2023-08-07T03:59:20.306999  / # export SHELL=3D/bin/sh. /lava-11219425/=
environment

    2023-08-07T03:59:20.307238  =


    2023-08-07T03:59:20.407776  / # . /lava-11219425/environment/lava-11219=
425/bin/lava-test-runner /lava-11219425/1

    2023-08-07T03:59:20.408079  =


    2023-08-07T03:59:20.412182  / # /lava-11219425/bin/lava-test-runner /la=
va-11219425/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64d06c2600b218be2335b1da

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-3-g703e77134ebf7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-3-g703e77134ebf7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64d06c2600b218be2335b1df
        failing since 121 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-08-07T03:59:22.021715  <8>[   10.610947] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11219452_1.4.2.3.1>

    2023-08-07T03:59:22.024889  + set +x

    2023-08-07T03:59:22.126024  #

    2023-08-07T03:59:22.126271  =


    2023-08-07T03:59:22.226763  / # #export SHELL=3D/bin/sh

    2023-08-07T03:59:22.226949  =


    2023-08-07T03:59:22.327431  / # export SHELL=3D/bin/sh. /lava-11219452/=
environment

    2023-08-07T03:59:22.327626  =


    2023-08-07T03:59:22.428113  / # . /lava-11219452/environment/lava-11219=
452/bin/lava-test-runner /lava-11219452/1

    2023-08-07T03:59:22.428461  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64d06c365849ef23d935b200

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-3-g703e77134ebf7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-3-g703e77134ebf7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64d06c365849ef23d935b205
        failing since 121 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-08-07T03:59:43.377384  + set<8>[   11.298976] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11219442_1.4.2.3.1>

    2023-08-07T03:59:43.377470   +x

    2023-08-07T03:59:43.482735  / # #

    2023-08-07T03:59:43.585344  export SHELL=3D/bin/sh

    2023-08-07T03:59:43.586028  #

    2023-08-07T03:59:43.687298  / # export SHELL=3D/bin/sh. /lava-11219442/=
environment

    2023-08-07T03:59:43.687466  =


    2023-08-07T03:59:43.787989  / # . /lava-11219442/environment/lava-11219=
442/bin/lava-test-runner /lava-11219442/1

    2023-08-07T03:59:43.788303  =


    2023-08-07T03:59:43.792715  / # /lava-11219442/bin/lava-test-runner /la=
va-11219442/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64d06c36b484cdef7b35b1f4

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-3-g703e77134ebf7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-3-g703e77134ebf7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64d06c36b484cdef7b35b1f9
        failing since 121 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-08-07T03:59:39.384468  + set<8>[   12.181198] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11219457_1.4.2.3.1>

    2023-08-07T03:59:39.384577   +x

    2023-08-07T03:59:39.488811  / # #

    2023-08-07T03:59:39.589354  export SHELL=3D/bin/sh

    2023-08-07T03:59:39.589505  #

    2023-08-07T03:59:39.690035  / # export SHELL=3D/bin/sh. /lava-11219457/=
environment

    2023-08-07T03:59:39.690180  =


    2023-08-07T03:59:39.790699  / # . /lava-11219457/environment/lava-11219=
457/bin/lava-test-runner /lava-11219457/1

    2023-08-07T03:59:39.790921  =


    2023-08-07T03:59:39.795692  / # /lava-11219457/bin/lava-test-runner /la=
va-11219457/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64d06f39d3de58165935b1d9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-3-g703e77134ebf7/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i=
-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-3-g703e77134ebf7/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i=
-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64d06f39d3de58165935b=
1da
        failing since 19 days (last pass: v6.4-rc1-5-g2b8cc5858a07a, first =
fail: v6.5-rc1-1-ga6edd5f5d9cc) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64d06dbc0290cb10df35b314

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-3-g703e77134ebf7/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-3-g703e77134ebf7/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64d06dbd0290cb10df35b=
315
        failing since 10 days (last pass: v6.5-rc1-1-ga6edd5f5d9cc, first f=
ail: v6.5-rc1-1-g0a329167220af) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64d06cd82c5e7e13cf35b1d9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-3-g703e77134ebf7/arm64/defconfig/gcc-10/lab-collabora/baseline-sun5=
0i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-3-g703e77134ebf7/arm64/defconfig/gcc-10/lab-collabora/baseline-sun5=
0i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64d06cd82c5e7e13cf35b1de
        failing since 19 days (last pass: v6.4-rc1-5-g2b8cc5858a07a, first =
fail: v6.5-rc1-1-ga6edd5f5d9cc)

    2023-08-07T04:03:54.389964  / # #

    2023-08-07T04:03:54.491390  export SHELL=3D/bin/sh

    2023-08-07T04:03:54.492115  #

    2023-08-07T04:03:54.593558  / # export SHELL=3D/bin/sh. /lava-11219481/=
environment

    2023-08-07T04:03:54.594318  =


    2023-08-07T04:03:54.695722  / # . /lava-11219481/environment/lava-11219=
481/bin/lava-test-runner /lava-11219481/1

    2023-08-07T04:03:54.696920  =


    2023-08-07T04:03:54.698601  / # /lava-11219481/bin/lava-test-runner /la=
va-11219481/1

    2023-08-07T04:03:54.781617  + export 'TESTRUN_ID=3D1_bootrr'

    2023-08-07T04:03:54.782121  + cd /lava-11219481/1/tests/1_boot<8>[   17=
.335479] <LAVA_SIGNAL_STARTRUN 1_bootrr 11219481_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
