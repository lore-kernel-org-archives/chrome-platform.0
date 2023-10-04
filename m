Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8579539D
	for <chrome-platform@lists.linux.dev>; Wed,  4 Oct 2023 05:51:28 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-578b4997decso1226446a12.0
        for <chrome-platform@lists.linux.dev>; Tue, 03 Oct 2023 22:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1696398688; x=1697003488; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iNW1UfkD5z8FVERfsBFvUVNOz2y9I++Ijar6qbR03xI=;
        b=SCxo6aZsn9QauD9Rotr7ivM2GZ60xbzfUwYcNRNuQ9S6/bzwNJPsTumsRn8KZToXpQ
         QPLtLct5rEFH+HbXxETqtOcq1KWpXzOru84rYvhrCcA7d6vY1tdOnyE7y0bJrtVGqzK7
         qPVauzMhYGFHc428bAsO1jA6QT/YoPloKF4Tduse8Lo04AMYocvCXe1cpBYtX24l8ZH/
         zC6VeSNUb/SkObwp4atyCJkVVHMyfeXpUAXjSnBlWuL4GCuaYf3PP5WaAtdm8DgMmDXM
         hVPFWd5AMbmx0Ro/wDdZJGOu01NQIXNO4p+HdzyQmaxF8C/Mm1cfSAYCB4r+ffkneC5N
         FLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696398688; x=1697003488;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iNW1UfkD5z8FVERfsBFvUVNOz2y9I++Ijar6qbR03xI=;
        b=eXZrLJFoBpEIwzstO/BfPL7A6ChwI+AYAPJf3juQiX3lFsbP9Q5J2zFMyJJCLJoCss
         N6uL6QmXtusxZZsVZ2GpAmybXdKVH3iTM+EdFlCIzDrzguguz2nQbd2+1lH6+xx6m0BB
         2Ji5dHEQ778ZOSI7QL9FAIYNhhL4LTALAvpaw4iPJz1F9WRhhzYZE7wm7kt1Zf+sm61E
         DKNMhs4s62uEtf7HsnQp6Ph8Ck4PWlHr1uUFvT2FyYgr9yKKqHrjrCMhBcjEH7Bub5dx
         0kTCaRHl/jDiAmLjZ3FSIKQEhxD1/iWpAIE0U/rEMoDs4BDwB+XO7t/b53kYcw4HOEyB
         Mrtw==
X-Gm-Message-State: AOJu0YwBLi9LeigCwGLqERa2aPmxFpdBMV6q7JImGkx6skKJu82lJoIs
	x5bW5KzsXTIe8rkW49mvBnnmfA==
X-Google-Smtp-Source: AGHT+IHo094OZdC9H0V68pAFlxhJql2B+hbhKg/FH0zlT+iP6YFb5n+w7SkCmLHTI7l9uOyNbLxE5w==
X-Received: by 2002:a17:90a:ad87:b0:277:7969:6bf2 with SMTP id s7-20020a17090aad8700b0027779696bf2mr1340726pjq.47.1696398687833;
        Tue, 03 Oct 2023 22:51:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 7-20020a17090a034700b002636dfcc6f5sm666359pjf.3.2023.10.03.22.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 22:51:27 -0700 (PDT)
Message-ID: <651cfd5f.170a0220.8bcc8.1ad0@mx.google.com>
Date: Tue, 03 Oct 2023 22:51:27 -0700 (PDT)
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
X-Kernelci-Kernel: v6.6-rc1-17-g2f3dd39e2b49
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 74 runs,
 11 regressions (v6.6-rc1-17-g2f3dd39e2b49)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 74 runs, 11 regressions (v6.6-rc1-17=
-g2f3dd39e2b49)

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

sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.6-rc1-17-g2f3dd39e2b49/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.6-rc1-17-g2f3dd39e2b49
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      2f3dd39e2b492bec366487a2c9bcbdbd7792f77c =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/651cef8a2efbf9cd538a0a52

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-17-g2f3dd39e2b49/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-17-g2f3dd39e2b49/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651cef8a2efbf9cd538a0a67
        failing since 23 days (last pass: v6.5-rc1-4-g0820debb7d489, first =
fail: v6.6-rc1)

    2023-10-04T04:52:09.235585  + <8>[   10.849504] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11673852_1.4.2.3.1>

    2023-10-04T04:52:09.236072  set +x

    2023-10-04T04:52:09.343474  / # #

    2023-10-04T04:52:09.445505  export SHELL=3D/bin/sh

    2023-10-04T04:52:09.445670  #

    2023-10-04T04:52:09.546174  / # export SHELL=3D/bin/sh. /lava-11673852/=
environment

    2023-10-04T04:52:09.546333  =


    2023-10-04T04:52:09.646802  / # . /lava-11673852/environment/lava-11673=
852/bin/lava-test-runner /lava-11673852/1

    2023-10-04T04:52:09.647096  =


    2023-10-04T04:52:09.651615  / # /lava-11673852/bin/lava-test-runner /la=
va-11673852/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/651cef87e5e46b70c38a0a4d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-17-g2f3dd39e2b49/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-17-g2f3dd39e2b49/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651cef87e5e46b70c38a0a56
        failing since 179 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-10-04T04:52:06.658318  + <8>[   11.302199] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11673858_1.4.2.3.1>

    2023-10-04T04:52:06.658845  set +x

    2023-10-04T04:52:06.764810  / # #

    2023-10-04T04:52:06.866930  export SHELL=3D/bin/sh

    2023-10-04T04:52:06.867613  #

    2023-10-04T04:52:06.968899  / # export SHELL=3D/bin/sh. /lava-11673858/=
environment

    2023-10-04T04:52:06.969662  =


    2023-10-04T04:52:07.071027  / # . /lava-11673858/environment/lava-11673=
858/bin/lava-test-runner /lava-11673858/1

    2023-10-04T04:52:07.072094  =


    2023-10-04T04:52:07.077016  / # /lava-11673858/bin/lava-test-runner /la=
va-11673858/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/651cef9d2efbf9cd538a0a9a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-17-g2f3dd39e2b49/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-17-g2f3dd39e2b49/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651cef9d2efbf9cd538a0aa3
        failing since 179 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-10-04T04:52:25.252112  <8>[    9.896663] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11673871_1.4.2.3.1>

    2023-10-04T04:52:25.255405  + set +x

    2023-10-04T04:52:25.361046  /#

    2023-10-04T04:52:25.464508   # #export SHELL=3D/bin/sh

    2023-10-04T04:52:25.465384  =


    2023-10-04T04:52:25.567293  / # export SHELL=3D/bin/sh. /lava-11673871/=
environment

    2023-10-04T04:52:25.568172  =


    2023-10-04T04:52:25.669933  / # . /lava-11673871/environment/lava-11673=
871/bin/lava-test-runner /lava-11673871/1

    2023-10-04T04:52:25.671410  =


    2023-10-04T04:52:25.676584  / # /lava-11673871/bin/lava-test-runner /la=
va-11673871/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/651cef7a116e3be74d8a0a69

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-17-g2f3dd39e2b49/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-17-g2f3dd39e2b49/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651cef7a116e3be74d8a0a7e
        failing since 23 days (last pass: v6.5-rc1-4-g0820debb7d489, first =
fail: v6.6-rc1)

    2023-10-04T04:52:21.652831  + <8>[   10.052687] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11673845_1.4.2.3.1>

    2023-10-04T04:52:21.652962  set +x

    2023-10-04T04:52:21.757287  / # #

    2023-10-04T04:52:21.857952  export SHELL=3D/bin/sh

    2023-10-04T04:52:21.858124  #

    2023-10-04T04:52:21.958599  / # export SHELL=3D/bin/sh. /lava-11673845/=
environment

    2023-10-04T04:52:21.958779  =


    2023-10-04T04:52:22.059262  / # . /lava-11673845/environment/lava-11673=
845/bin/lava-test-runner /lava-11673845/1

    2023-10-04T04:52:22.059546  =


    2023-10-04T04:52:22.063929  / # /lava-11673845/bin/lava-test-runner /la=
va-11673845/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/651cef82116e3be74d8a0a81

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-17-g2f3dd39e2b49/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-17-g2f3dd39e2b49/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651cef82116e3be74d8a0a96
        failing since 23 days (last pass: v6.5-rc1-4-g0820debb7d489, first =
fail: v6.6-rc1)

    2023-10-04T04:51:54.721637  + <8>[    8.462281] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11673894_1.4.2.3.1>

    2023-10-04T04:51:54.721721  set +x

    2023-10-04T04:51:54.825969  / # #

    2023-10-04T04:51:54.926584  export SHELL=3D/bin/sh

    2023-10-04T04:51:54.926779  #

    2023-10-04T04:51:55.027286  / # export SHELL=3D/bin/sh. /lava-11673894/=
environment

    2023-10-04T04:51:55.027460  =


    2023-10-04T04:51:55.127956  / # . /lava-11673894/environment/lava-11673=
894/bin/lava-test-runner /lava-11673894/1

    2023-10-04T04:51:55.128238  =


    2023-10-04T04:51:55.132519  / # /lava-11673894/bin/lava-test-runner /la=
va-11673894/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/651cf1cebdfb633aae8a0a44

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-17-g2f3dd39e2b49/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-17-g2f3dd39e2b49/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651cf1cebdfb633aae8a0a4d
        failing since 179 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-10-04T05:03:25.123921  + set +x

    2023-10-04T05:03:25.130263  <8>[   10.984485] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11673918_1.4.2.3.1>

    2023-10-04T05:03:25.237612  / # #

    2023-10-04T05:03:25.339923  export SHELL=3D/bin/sh

    2023-10-04T05:03:25.340629  #

    2023-10-04T05:03:25.442217  / # export SHELL=3D/bin/sh. /lava-11673918/=
environment

    2023-10-04T05:03:25.443009  =


    2023-10-04T05:03:25.544851  / # . /lava-11673918/environment/lava-11673=
918/bin/lava-test-runner /lava-11673918/1

    2023-10-04T05:03:25.546160  =


    2023-10-04T05:03:25.551536  / # /lava-11673918/bin/lava-test-runner /la=
va-11673918/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/651cef8cc28c03e6318a0a5a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-17-g2f3dd39e2b49/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-17-g2f3dd39e2b49/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651cef8cc28c03e6318a0a63
        failing since 179 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-10-04T04:52:06.713454  + set +x<8>[   10.197979] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 11673865_1.4.2.3.1>

    2023-10-04T04:52:06.713649  =


    2023-10-04T04:52:06.816472  #

    2023-10-04T04:52:06.917253  / # #export SHELL=3D/bin/sh

    2023-10-04T04:52:06.917529  =


    2023-10-04T04:52:07.018162  / # export SHELL=3D/bin/sh. /lava-11673865/=
environment

    2023-10-04T04:52:07.018433  =


    2023-10-04T04:52:07.119097  / # . /lava-11673865/environment/lava-11673=
865/bin/lava-test-runner /lava-11673865/1

    2023-10-04T04:52:07.119369  =


    2023-10-04T04:52:07.124879  / # /lava-11673865/bin/lava-test-runner /la=
va-11673865/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/651cef9ec28c03e6318a0a79

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-17-g2f3dd39e2b49/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-17-g2f3dd39e2b49/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651cef9ec28c03e6318a0a82
        failing since 179 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-10-04T04:52:26.254884  + <8>[   11.762988] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11673896_1.4.2.3.1>

    2023-10-04T04:52:26.255370  set +x

    2023-10-04T04:52:26.362428  / # #

    2023-10-04T04:52:26.463557  export SHELL=3D/bin/sh

    2023-10-04T04:52:26.463933  #

    2023-10-04T04:52:26.564679  / # export SHELL=3D/bin/sh. /lava-11673896/=
environment

    2023-10-04T04:52:26.565009  =


    2023-10-04T04:52:26.665789  / # . /lava-11673896/environment/lava-11673=
896/bin/lava-test-runner /lava-11673896/1

    2023-10-04T04:52:26.666488  =


    2023-10-04T04:52:26.670932  / # /lava-11673896/bin/lava-test-runner /la=
va-11673896/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/651cf25573a30b6c058a0a49

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-17-g2f3dd39e2b49/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp=
-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-17-g2f3dd39e2b49/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651cf25573a30b6c058a0a52
        failing since 22 days (last pass: v6.5-rc1-4-g0820debb7d489, first =
fail: v6.6-rc1)

    2023-10-04T05:04:05.674366  + set<8>[   28.217426] <LAVA_SIGNAL_ENDRUN =
0_dmesg 151514_1.5.2.4.1>
    2023-10-04T05:04:05.674949   +x
    2023-10-04T05:04:05.783770  / # #
    2023-10-04T05:04:06.948036  export SHELL=3D/bin/sh
    2023-10-04T05:04:06.954109  #
    2023-10-04T05:04:08.452722  / # export SHELL=3D/bin/sh. /lava-151514/en=
vironment
    2023-10-04T05:04:08.458883  =

    2023-10-04T05:04:11.182004  / # . /lava-151514/environment/lava-151514/=
bin/lava-test-runner /lava-151514/1
    2023-10-04T05:04:11.188549  =

    2023-10-04T05:04:11.196922  / # /lava-151514/bin/lava-test-runner /lava=
-151514/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/651cef82e5e46b70c38a0a42

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-17-g2f3dd39e2b49/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-17-g2f3dd39e2b49/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651cef82e5e46b70c38a0a4b
        failing since 179 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-10-04T04:51:56.801921  + <8>[   12.112774] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11673861_1.4.2.3.1>

    2023-10-04T04:51:56.802452  set +x

    2023-10-04T04:51:56.909689  / # #

    2023-10-04T04:51:57.012280  export SHELL=3D/bin/sh

    2023-10-04T04:51:57.013019  #

    2023-10-04T04:51:57.114590  / # export SHELL=3D/bin/sh. /lava-11673861/=
environment

    2023-10-04T04:51:57.115390  =


    2023-10-04T04:51:57.216986  / # . /lava-11673861/environment/lava-11673=
861/bin/lava-test-runner /lava-11673861/1

    2023-10-04T04:51:57.218178  =


    2023-10-04T04:51:57.223044  / # /lava-11673861/bin/lava-test-runner /la=
va-11673861/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/651cf2059df975fee78a0a44

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-17-g2f3dd39e2b49/arm64/defconfig/gcc-10/lab-collabora/baseline-sun5=
0i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-17-g2f3dd39e2b49/arm64/defconfig/gcc-10/lab-collabora/baseline-sun5=
0i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651cf2059df975fee78a0a4d
        failing since 77 days (last pass: v6.4-rc1-5-g2b8cc5858a07a, first =
fail: v6.5-rc1-1-ga6edd5f5d9cc)

    2023-10-04T05:07:11.481344  / # #

    2023-10-04T05:07:11.583588  export SHELL=3D/bin/sh

    2023-10-04T05:07:11.584321  #

    2023-10-04T05:07:11.685699  / # export SHELL=3D/bin/sh. /lava-11673950/=
environment

    2023-10-04T05:07:11.686392  =


    2023-10-04T05:07:11.787810  / # . /lava-11673950/environment/lava-11673=
950/bin/lava-test-runner /lava-11673950/1

    2023-10-04T05:07:11.788880  =


    2023-10-04T05:07:11.805736  / # /lava-11673950/bin/lava-test-runner /la=
va-11673950/1

    2023-10-04T05:07:11.873610  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-04T05:07:11.874109  + cd /lava-1167395<8>[   17.368645] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11673950_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
