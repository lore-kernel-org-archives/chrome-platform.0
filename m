Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E68838E
	for <chrome-platform@lists.linux.dev>; Tue, 10 Oct 2023 02:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="2oyYUugV"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-58907163519so3899617a12.1
        for <chrome-platform@lists.linux.dev>; Mon, 09 Oct 2023 19:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1696903238; x=1697508038; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Le8B0t/I3ZJpwwBaOG3DI/VcJfnywXPLYOfgwnr75ao=;
        b=2oyYUugVxzImqEKP/mW60QiiCY6enMHXRRfILPThAUFuIyAHQqXrJD4ZQWC2zl6AAo
         fOO2srZCRBNzfWoHhohmuORGuDsLtwdrXbF3QSSILkly3oqx5Z8OBeDBl4MvLRGEY/Nb
         G6FNhU+D4hqEceHYL47mGZ+N4ikHAwO0Rt9fUUZprJhSEGLdXia0La0LBiuZxCTo5PYg
         oY5T694wU1KkoivG9GpaoKBksnsYe6UwXCFwhmmBMtyoCZnDMpTHiDJlDW52g67Wu6Bf
         Ytqx2l4sv42Hm9oHHy5dvEWXFmQ4Hw4GSV+6IgSAdMossqqfUL7Cy52cz7nemDyW18A+
         qSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696903238; x=1697508038;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Le8B0t/I3ZJpwwBaOG3DI/VcJfnywXPLYOfgwnr75ao=;
        b=BKGa2u5Eg/42fbIiz0t6LsuRQ0BRC5CzCJ+/dtOnteb5fa/Fy9rFhHRWVRkN2s4Pzz
         46hStxVJNTFSQefC9N+TPmfPePKqPihMk0lK6kwGKedXORHqD3kBP0V8qhUkI6KtHqIV
         UnhJ8EH2Z7Q2eEo55Q09fj4mXbGh9VGMlTsBzEJMhaE2WT6e9lReXVm9WoC3By3K3Nld
         0J2U59TRjXplp58HgwgMfKU0WbSZ94tPVv9YwVN+TSgHrpH/vIgqSkEKRrUo24bm7t7A
         tlONPyzNdyZ5Zbk5R5wmf1kI5QK3BYfiwCfiIY8rRUiib1WJcP7uFjelGCtzYZzd3G9s
         W/ug==
X-Gm-Message-State: AOJu0YxifWENOSn845+VlgqBNuQ4H1xPldCbK3Z47tsyOXtn5mhAl4n+
	CH5JTDY2T2SLHDTITSau+ElpJg==
X-Google-Smtp-Source: AGHT+IHExBnR6Tqzid7QQMzOEaTKynzllSziyvv0nlph26UFTMvF6tVlAZVjWEHjQPPdH8oM1hEGXA==
X-Received: by 2002:a05:6a20:12c9:b0:15c:b7ba:6a4d with SMTP id v9-20020a056a2012c900b0015cb7ba6a4dmr20748391pzg.50.1696903238367;
        Mon, 09 Oct 2023 19:00:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id b7-20020a170902650700b001b89a6164desm24545plk.118.2023.10.09.19.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 19:00:37 -0700 (PDT)
Message-ID: <6524b045.170a0220.f3bdb.010d@mx.google.com>
Date: Mon, 09 Oct 2023 19:00:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-rc1-20-g466f70fb1b10
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci baseline: 70 runs,
 13 regressions (v6.6-rc1-20-g466f70fb1b10)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 70 runs, 13 regressions (v6.6-rc1-20=
-g466f70fb1b10)

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
efcon...6-chromebook | 2          =

imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

r8a77960-ulcb                | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.6-rc1-20-g466f70fb1b10/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.6-rc1-20-g466f70fb1b10
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      466f70fb1b10fd139582646285e587fb38a9ff2c =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6524a762c2a7c8ed67efcefe

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-20-g466f70fb1b10/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-20-g466f70fb1b10/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6524a762c2a7c8ed67efcf13
        failing since 28 days (last pass: v6.5-rc1-4-g0820debb7d489, first =
fail: v6.6-rc1)

    2023-10-10T01:22:21.839064  + <8>[   11.073982] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11718906_1.4.2.3.1>

    2023-10-10T01:22:21.839674  set +x

    2023-10-10T01:22:21.948030  / # #

    2023-10-10T01:22:22.050397  export SHELL=3D/bin/sh

    2023-10-10T01:22:22.051213  #

    2023-10-10T01:22:22.152741  / # export SHELL=3D/bin/sh. /lava-11718906/=
environment

    2023-10-10T01:22:22.153728  =


    2023-10-10T01:22:22.255351  / # . /lava-11718906/environment/lava-11718=
906/bin/lava-test-runner /lava-11718906/1

    2023-10-10T01:22:22.256580  =


    2023-10-10T01:22:22.261793  / # /lava-11718906/bin/lava-test-runner /la=
va-11718906/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6524a409245aba64c5efcf0d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-20-g466f70fb1b10/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-20-g466f70fb1b10/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6524a409245aba64c5efcf16
        failing since 185 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-10-10T01:08:02.825636  + set<8>[   12.649441] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11718903_1.4.2.3.1>

    2023-10-10T01:08:02.825837   +x

    2023-10-10T01:08:02.930326  / # #

    2023-10-10T01:08:03.031138  export SHELL=3D/bin/sh

    2023-10-10T01:08:03.031455  #

    2023-10-10T01:08:03.132100  / # export SHELL=3D/bin/sh. /lava-11718903/=
environment

    2023-10-10T01:08:03.132398  =


    2023-10-10T01:08:03.233065  / # . /lava-11718903/environment/lava-11718=
903/bin/lava-test-runner /lava-11718903/1

    2023-10-10T01:08:03.233480  =


    2023-10-10T01:08:03.238044  / # /lava-11718903/bin/lava-test-runner /la=
va-11718903/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6524a3f6d06ff70220efcef5

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-20-g466f70fb1b10/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-20-g466f70fb1b10/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6524a3f6d06ff70220efcefe
        failing since 185 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-10-10T01:07:48.705870  / # #

    2023-10-10T01:07:48.806437  export SHELL=3D/bin/sh

    2023-10-10T01:07:48.806668  #

    2023-10-10T01:07:48.907243  / # export SHELL=3D/bin/sh. /lava-11718899/=
environment

    2023-10-10T01:07:48.907538  =


    2023-10-10T01:07:49.008133  / # . /lava-11718899/environment/lava-11718=
899/bin/lava-test-runner /lava-11718899/1

    2023-10-10T01:07:49.008395  =


    2023-10-10T01:07:49.013007  / # /lava-11718899/bin/lava-test-runner /la=
va-11718899/1

    2023-10-10T01:07:49.025658  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-10T01:07:49.035952  + cd /lava-11718899/1/tests/1_bo<8>[   13.7=
17286] <LAVA_SIGNAL_STARTRUN 1_bootrr 11718899_1.4.2.3.5>
 =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6524a45e8dcd979036efcef3

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-20-g466f70fb1b10/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-20-g466f70fb1b10/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6524a45e8dcd979036efcf08
        failing since 28 days (last pass: v6.5-rc1-4-g0820debb7d489, first =
fail: v6.6-rc1)

    2023-10-10T01:10:52.477303  + <8>[    8.455864] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11718882_1.4.2.3.1>

    2023-10-10T01:10:52.477387  set +x

    2023-10-10T01:10:52.581651  / # #

    2023-10-10T01:10:52.682241  export SHELL=3D/bin/sh

    2023-10-10T01:10:52.682415  #

    2023-10-10T01:10:52.782911  / # export SHELL=3D/bin/sh. /lava-11718882/=
environment

    2023-10-10T01:10:52.783122  =


    2023-10-10T01:10:52.883597  / # . /lava-11718882/environment/lava-11718=
882/bin/lava-test-runner /lava-11718882/1

    2023-10-10T01:10:52.883909  =


    2023-10-10T01:10:52.888153  / # /lava-11718882/bin/lava-test-runner /la=
va-11718882/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6524a73b67129ad126efcfc7

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-20-g466f70fb1b10/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-20-g466f70fb1b10/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6524a73b67129ad126efcfdc
        failing since 28 days (last pass: v6.5-rc1-4-g0820debb7d489, first =
fail: v6.6-rc1)

    2023-10-10T01:21:42.394465  + <8>[   11.391181] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11718893_1.4.2.3.1>

    2023-10-10T01:21:42.394898  set +x

    2023-10-10T01:21:42.502356  / # #

    2023-10-10T01:21:42.604448  export SHELL=3D/bin/sh

    2023-10-10T01:21:42.605123  #

    2023-10-10T01:21:42.706461  / # export SHELL=3D/bin/sh. /lava-11718893/=
environment

    2023-10-10T01:21:42.707119  =


    2023-10-10T01:21:42.808450  / # . /lava-11718893/environment/lava-11718=
893/bin/lava-test-runner /lava-11718893/1

    2023-10-10T01:21:42.809575  =


    2023-10-10T01:21:42.813566  / # /lava-11718893/bin/lava-test-runner /la=
va-11718893/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6524a5417b294e0de1efcef7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-20-g466f70fb1b10/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-20-g466f70fb1b10/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6524a5417b294e0de1efcf00
        failing since 185 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-10-10T01:13:44.380689  + set +x

    2023-10-10T01:13:44.387128  <8>[   10.793614] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11718869_1.4.2.3.1>

    2023-10-10T01:13:44.492543  / # #

    2023-10-10T01:13:44.594634  export SHELL=3D/bin/sh

    2023-10-10T01:13:44.594951  #

    2023-10-10T01:13:44.695575  / # export SHELL=3D/bin/sh. /lava-11718869/=
environment

    2023-10-10T01:13:44.695817  =


    2023-10-10T01:13:44.796450  / # . /lava-11718869/environment/lava-11718=
869/bin/lava-test-runner /lava-11718869/1

    2023-10-10T01:13:44.797423  =


    2023-10-10T01:13:44.802500  / # /lava-11718869/bin/lava-test-runner /la=
va-11718869/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6524a58164ed13e84fefcefb

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-20-g466f70fb1b10/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-20-g466f70fb1b10/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6524a58164ed13e84fefcf04
        failing since 185 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-10-10T01:14:32.383979  <8>[    9.931962] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11718849_1.4.2.3.1>

    2023-10-10T01:14:32.387466  + set +x

    2023-10-10T01:14:32.489071  =


    2023-10-10T01:14:32.589686  / # #export SHELL=3D/bin/sh

    2023-10-10T01:14:32.589875  =


    2023-10-10T01:14:32.690440  / # export SHELL=3D/bin/sh. /lava-11718849/=
environment

    2023-10-10T01:14:32.690648  =


    2023-10-10T01:14:32.791189  / # . /lava-11718849/environment/lava-11718=
849/bin/lava-test-runner /lava-11718849/1

    2023-10-10T01:14:32.791544  =


    2023-10-10T01:14:32.796637  / # /lava-11718849/bin/lava-test-runner /la=
va-11718849/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/6524a3f785336a89ecefcf02

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-20-g466f70fb1b10/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-20-g466f70fb1b10/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6524a3f785336a8=
9ecefcf05
        new failure (last pass: v6.6-rc1-17-g2f3dd39e2b49)
        3 lines

    2023-10-10T01:07:46.646297  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-10-10T01:07:46.652978  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-10-10T01:07:46.665976  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector<8>[    8.927366] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>

    2023-10-10T01:07:46.666132  =

   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6524a3f785336a89ecefcf0b
        failing since 185 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-10-10T01:07:46.673077  + set<8>[    8.951293] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11718821_1.4.2.3.1>

    2023-10-10T01:07:46.673252   +x

    2023-10-10T01:07:46.777371  / # #

    2023-10-10T01:07:46.878155  export SHELL=3D/bin/sh

    2023-10-10T01:07:46.878378  #

    2023-10-10T01:07:46.978908  / # export SHELL=3D/bin/sh. /lava-11718821/=
environment

    2023-10-10T01:07:46.979163  =


    2023-10-10T01:07:47.079723  / # . /lava-11718821/environment/lava-11718=
821/bin/lava-test-runner /lava-11718821/1

    2023-10-10T01:07:47.080066  =


    2023-10-10T01:07:47.084915  / # /lava-11718821/bin/lava-test-runner /la=
va-11718821/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6524a398de3e0c4516efcfd5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-20-g466f70fb1b10/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp=
-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-20-g466f70fb1b10/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6524a398de3e0c4516efcfde
        failing since 28 days (last pass: v6.5-rc1-4-g0820debb7d489, first =
fail: v6.6-rc1)

    2023-10-10T01:06:13.411032  + set<8>[   29.270579] <LAVA_SIGNAL_ENDRUN =
0_dmesg 159139_1.5.2.4.1>
    2023-10-10T01:06:13.411518   +x
    2023-10-10T01:06:13.521384  / # #
    2023-10-10T01:06:14.684062  export SHELL=3D/bin/sh
    2023-10-10T01:06:14.689806  #
    2023-10-10T01:06:16.185254  / # export SHELL=3D/bin/sh. /lava-159139/en=
vironment
    2023-10-10T01:06:16.191244  =

    2023-10-10T01:06:18.903680  / # . /lava-159139/environment/lava-159139/=
bin/lava-test-runner /lava-159139/1
    2023-10-10T01:06:18.909661  =

    2023-10-10T01:06:18.913513  / # /lava-159139/bin/lava-test-runner /lava=
-159139/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6524a3f561a758e07aefcf2d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-20-g466f70fb1b10/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-20-g466f70fb1b10/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6524a3f561a758e07aefcf36
        failing since 185 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-10-10T01:07:54.815804  + <8>[   11.492025] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11718866_1.4.2.3.1>

    2023-10-10T01:07:54.816020  set +x

    2023-10-10T01:07:54.920355  / # #

    2023-10-10T01:07:55.020971  export SHELL=3D/bin/sh

    2023-10-10T01:07:55.021249  #

    2023-10-10T01:07:55.121860  / # export SHELL=3D/bin/sh. /lava-11718866/=
environment

    2023-10-10T01:07:55.122176  =


    2023-10-10T01:07:55.222776  / # . /lava-11718866/environment/lava-11718=
866/bin/lava-test-runner /lava-11718866/1

    2023-10-10T01:07:55.223175  =


    2023-10-10T01:07:55.227667  / # /lava-11718866/bin/lava-test-runner /la=
va-11718866/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77960-ulcb                | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6524a30ac22a491670efcfc6

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-20-g466f70fb1b10/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a7=
7960-ulcb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-20-g466f70fb1b10/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a7=
7960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6524a30ac22a491670efcfcf
        failing since 83 days (last pass: v6.4-rc1-5-g2b8cc5858a07a, first =
fail: v6.5-rc1-1-ga6edd5f5d9cc)

    2023-10-10T01:08:12.102177  / # #

    2023-10-10T01:08:12.204408  export SHELL=3D/bin/sh

    2023-10-10T01:08:12.205107  #

    2023-10-10T01:08:12.306492  / # export SHELL=3D/bin/sh. /lava-11718785/=
environment

    2023-10-10T01:08:12.307206  =


    2023-10-10T01:08:12.408657  / # . /lava-11718785/environment/lava-11718=
785/bin/lava-test-runner /lava-11718785/1

    2023-10-10T01:08:12.409884  =


    2023-10-10T01:08:12.426418  / # /lava-11718785/bin/lava-test-runner /la=
va-11718785/1

    2023-10-10T01:08:12.476743  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-10T01:08:12.477246  + cd /lava-117187<8>[   20.408845] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11718785_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6524a308b39acef4d1efcef5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-20-g466f70fb1b10/arm64/defconfig/gcc-10/lab-collabora/baseline-sun5=
0i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-20-g466f70fb1b10/arm64/defconfig/gcc-10/lab-collabora/baseline-sun5=
0i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6524a308b39acef4d1efcefe
        failing since 83 days (last pass: v6.4-rc1-5-g2b8cc5858a07a, first =
fail: v6.5-rc1-1-ga6edd5f5d9cc)

    2023-10-10T01:08:22.128471  / # #

    2023-10-10T01:08:22.230647  export SHELL=3D/bin/sh

    2023-10-10T01:08:22.231396  #

    2023-10-10T01:08:22.332866  / # export SHELL=3D/bin/sh. /lava-11718784/=
environment

    2023-10-10T01:08:22.333597  =


    2023-10-10T01:08:22.434988  / # . /lava-11718784/environment/lava-11718=
784/bin/lava-test-runner /lava-11718784/1

    2023-10-10T01:08:22.436057  =


    2023-10-10T01:08:22.439114  / # /lava-11718784/bin/lava-test-runner /la=
va-11718784/1

    2023-10-10T01:08:22.521184  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-10T01:08:22.521688  + cd /lava-1171878<8>[   17.380285] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11718784_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
