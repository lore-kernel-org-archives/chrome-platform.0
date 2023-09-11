Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FDF257B
	for <chrome-platform@lists.linux.dev>; Mon, 11 Sep 2023 05:55:46 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1ba5cda3530so2917368fac.3
        for <chrome-platform@lists.linux.dev>; Sun, 10 Sep 2023 22:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1694411745; x=1695016545; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G+U3sERQM4myXDIIJzxCjx+DSL8RRuBZwPrgdvSSJ9A=;
        b=XEi4HuBCdw4QL6Da6mxujsghTIYNrPX/gZIoQ5kH8ITU859kPYoEPoA80v5iPzrXHc
         MlZT7GU5W774EwZ0nCnrk4qzkHZt7IoCGmjv3ldj+nRyrpVrOm2vkW3ZuKCYpatZaQ72
         9Ap7gfVLoUj45riFsnhaxPoonviRM2qvQrX1gJlbTqysR8U601rRsOWEVMvVa2ByhXGX
         t50opXXT2NgHRPOU2Brbq1BQM5XaLMnmnNgA0bylKcUiJXj54J8JyIwGfd3BMJa8Y6ZV
         ngAxmvOvYdbtEOXRp2eSni4uObE/iX4jalya5aldRTgtai1TCqPxf4p2iVPhXKYgJGGV
         oD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694411745; x=1695016545;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+U3sERQM4myXDIIJzxCjx+DSL8RRuBZwPrgdvSSJ9A=;
        b=Tkd4pcWugyC+gzOoQ48NDPBwK8WtxqtHztqrLZ7oBJIwb4X5vgewyOTBxZVVUOzXxO
         2UxVVn/Ruov55nlVJWMKeNcQa31CRb1l0ySAuF3VuHmQ6duWzR7wBRRTFSrHtLtd40Ps
         CuNBieGVtTwBD+SHnWV+W0NjkwLTDWr5RlkvteRC6XMiM5jPkYonCyoWvSn2lRMvygyV
         fRsi6DypeY/qtFOt3pPSgkloxvRpT5VYrSY7bgXUu4mVqKT4n2xJRuXRceXuEt60K8e3
         jP0s5idfqEbr2+NrWlTT93zNtdV5GYNnStehoMnTtLZhA8/lRNoqCJQx/+Wys+ZDXQUG
         ANSw==
X-Gm-Message-State: AOJu0YzjfOokcM0Zyk1ZtFfhtbj9/LuGAhFku9hsqUrN+mRrHoIxO9YT
	fU3eHdNE0JduObinDXQWZJPtGg==
X-Google-Smtp-Source: AGHT+IHyMefgVApN4OlOu0+MTF9KCAlJSOwOCj2zRUHhYJF9/O1qp2n/rF0kKfoaYaCkTU4L3e2DTg==
X-Received: by 2002:a05:6870:1b14:b0:1d5:aa27:cba9 with SMTP id hl20-20020a0568701b1400b001d5aa27cba9mr3477522oab.7.1694411745210;
        Sun, 10 Sep 2023 22:55:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id j14-20020a63b60e000000b0055c178a8df1sm4102474pgf.94.2023.09.10.22.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 22:55:44 -0700 (PDT)
Message-ID: <64feabe0.630a0220.f1b1e.87c7@mx.google.com>
Date: Sun, 10 Sep 2023 22:55:44 -0700 (PDT)
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
X-Kernelci-Kernel: v6.6-rc1
Subject: chrome-platform/for-kernelci baseline: 75 runs,
 11 regressions (v6.6-rc1)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 75 runs, 11 regressions (v6.6-rc1)

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

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

r8a77960-ulcb                | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.6-rc1/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.6-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      0bb80ecc33a8fb5a682236443c1e740d5c917d1d =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe9ccdab142acb05286dbe

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64fe9ccdab142acb05286dd3
        new failure (last pass: v6.5-rc1-4-g0820debb7d489)

    2023-09-11T04:51:08.347055  + <8>[   11.064627] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11491653_1.4.2.3.1>

    2023-09-11T04:51:08.347479  set +x

    2023-09-11T04:51:08.455851  / # #

    2023-09-11T04:51:08.559040  export SHELL=3D/bin/sh

    2023-09-11T04:51:08.559892  #

    2023-09-11T04:51:08.661531  / # export SHELL=3D/bin/sh. /lava-11491653/=
environment

    2023-09-11T04:51:08.661737  =


    2023-09-11T04:51:08.762309  / # . /lava-11491653/environment/lava-11491=
653/bin/lava-test-runner /lava-11491653/1

    2023-09-11T04:51:08.762648  =


    2023-09-11T04:51:08.766639  / # /lava-11491653/bin/lava-test-runner /la=
va-11491653/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe9cccab142acb05286d9c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64fe9cccab142acb05286da5
        failing since 156 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-09-11T04:51:13.649778  + <8>[   11.597842] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11491651_1.4.2.3.1>

    2023-09-11T04:51:13.649882  set +x

    2023-09-11T04:51:13.753993  / # #

    2023-09-11T04:51:13.854612  export SHELL=3D/bin/sh

    2023-09-11T04:51:13.854823  #

    2023-09-11T04:51:13.955315  / # export SHELL=3D/bin/sh. /lava-11491651/=
environment

    2023-09-11T04:51:13.955497  =


    2023-09-11T04:51:14.056041  / # . /lava-11491651/environment/lava-11491=
651/bin/lava-test-runner /lava-11491651/1

    2023-09-11T04:51:14.056332  =


    2023-09-11T04:51:14.060593  / # /lava-11491651/bin/lava-test-runner /la=
va-11491651/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe9cd09da4a074e0286d6d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64fe9cd09da4a074e0286d76
        failing since 156 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-09-11T04:51:10.426299  <8>[   10.439058] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11491673_1.4.2.3.1>

    2023-09-11T04:51:10.429563  + set +x

    2023-09-11T04:51:10.536239  / # #

    2023-09-11T04:51:10.637983  export SHELL=3D/bin/sh

    2023-09-11T04:51:10.638650  #

    2023-09-11T04:51:10.740084  / # export SHELL=3D/bin/sh. /lava-11491673/=
environment

    2023-09-11T04:51:10.740757  =


    2023-09-11T04:51:10.842186  / # . /lava-11491673/environment/lava-11491=
673/bin/lava-test-runner /lava-11491673/1

    2023-09-11T04:51:10.843299  =


    2023-09-11T04:51:10.848695  / # /lava-11491673/bin/lava-test-runner /la=
va-11491673/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe9cbf5a5ec731d2286dba

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64fe9cbf5a5ec731d2286dcf
        new failure (last pass: v6.5-rc1-4-g0820debb7d489)

    2023-09-11T04:52:02.797686  + <8>[   11.386394] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11491667_1.4.2.3.1>

    2023-09-11T04:52:02.797801  set +x

    2023-09-11T04:52:02.902198  / # #

    2023-09-11T04:52:03.002920  export SHELL=3D/bin/sh

    2023-09-11T04:52:03.003116  #

    2023-09-11T04:52:03.103622  / # export SHELL=3D/bin/sh. /lava-11491667/=
environment

    2023-09-11T04:52:03.103829  =


    2023-09-11T04:52:03.204339  / # . /lava-11491667/environment/lava-11491=
667/bin/lava-test-runner /lava-11491667/1

    2023-09-11T04:52:03.204641  =


    2023-09-11T04:52:03.208667  / # /lava-11491667/bin/lava-test-runner /la=
va-11491667/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe9cbb5a5ec731d2286d98

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64fe9cbb5a5ec731d2286dad
        new failure (last pass: v6.5-rc1-4-g0820debb7d489)

    2023-09-11T04:51:08.262676  + <8>[    8.018543] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11491648_1.4.2.3.1>

    2023-09-11T04:51:08.263221  set +x

    2023-09-11T04:51:08.371126  / # #

    2023-09-11T04:51:08.473243  export SHELL=3D/bin/sh

    2023-09-11T04:51:08.473915  #

    2023-09-11T04:51:08.575321  / # export SHELL=3D/bin/sh. /lava-11491648/=
environment

    2023-09-11T04:51:08.576075  =


    2023-09-11T04:51:08.677574  / # . /lava-11491648/environment/lava-11491=
648/bin/lava-test-runner /lava-11491648/1

    2023-09-11T04:51:08.678874  =


    2023-09-11T04:51:08.683215  / # /lava-11491648/bin/lava-test-runner /la=
va-11491648/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe9cbd5a5ec731d2286daf

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64fe9cbd5a5ec731d2286db8
        failing since 156 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-09-11T04:52:05.479339  + set +x

    2023-09-11T04:52:05.485559  <8>[    8.008120] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11491636_1.4.2.3.1>

    2023-09-11T04:52:05.590368  / # #

    2023-09-11T04:52:05.690943  export SHELL=3D/bin/sh

    2023-09-11T04:52:05.691111  #

    2023-09-11T04:52:05.791636  / # export SHELL=3D/bin/sh. /lava-11491636/=
environment

    2023-09-11T04:52:05.791890  =


    2023-09-11T04:52:05.892387  / # . /lava-11491636/environment/lava-11491=
636/bin/lava-test-runner /lava-11491636/1

    2023-09-11T04:52:05.892691  =


    2023-09-11T04:52:05.897966  / # /lava-11491636/bin/lava-test-runner /la=
va-11491636/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe9cb65a5ec731d2286d77

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64fe9cb65a5ec731d2286d80
        failing since 156 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-09-11T04:50:56.926103  + set +x<8>[   10.489084] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 11491662_1.4.2.3.1>

    2023-09-11T04:50:56.926258  =


    2023-09-11T04:50:57.029040  #

    2023-09-11T04:50:57.130058  / # #export SHELL=3D/bin/sh

    2023-09-11T04:50:57.130236  =


    2023-09-11T04:50:57.230773  / # export SHELL=3D/bin/sh. /lava-11491662/=
environment

    2023-09-11T04:50:57.230961  =


    2023-09-11T04:50:57.331482  / # . /lava-11491662/environment/lava-11491=
662/bin/lava-test-runner /lava-11491662/1

    2023-09-11T04:50:57.331788  =


    2023-09-11T04:50:57.336845  / # /lava-11491662/bin/lava-test-runner /la=
va-11491662/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe9cc15a5ec731d2286dd1

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64fe9cc15a5ec731d2286dd6
        failing since 156 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-09-11T04:50:58.079531  + <8>[   11.013746] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11491630_1.4.2.3.1>

    2023-09-11T04:50:58.079635  set +x

    2023-09-11T04:50:58.183597  / # #

    2023-09-11T04:50:58.284121  export SHELL=3D/bin/sh

    2023-09-11T04:50:58.284288  #

    2023-09-11T04:50:58.384802  / # export SHELL=3D/bin/sh. /lava-11491630/=
environment

    2023-09-11T04:50:58.384976  =


    2023-09-11T04:50:58.485517  / # . /lava-11491630/environment/lava-11491=
630/bin/lava-test-runner /lava-11491630/1

    2023-09-11T04:50:58.485841  =


    2023-09-11T04:50:58.490237  / # /lava-11491630/bin/lava-test-runner /la=
va-11491630/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe9cba5a5ec731d2286d8d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64fe9cba5a5ec731d2286d96
        failing since 156 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-09-11T04:51:16.008507  + set<8>[   11.300171] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11491633_1.4.2.3.1>

    2023-09-11T04:51:16.008947   +x

    2023-09-11T04:51:16.115918  / # #

    2023-09-11T04:51:16.218186  export SHELL=3D/bin/sh

    2023-09-11T04:51:16.218937  #

    2023-09-11T04:51:16.320715  / # export SHELL=3D/bin/sh. /lava-11491633/=
environment

    2023-09-11T04:51:16.321426  =


    2023-09-11T04:51:16.422810  / # . /lava-11491633/environment/lava-11491=
633/bin/lava-test-runner /lava-11491633/1

    2023-09-11T04:51:16.423898  =


    2023-09-11T04:51:16.428567  / # /lava-11491633/bin/lava-test-runner /la=
va-11491633/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77960-ulcb                | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe9fb4fd2102b658286e50

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64fe9fb4fd2102b658286e59
        failing since 54 days (last pass: v6.4-rc1-5-g2b8cc5858a07a, first =
fail: v6.5-rc1-1-ga6edd5f5d9cc)

    2023-09-11T05:05:01.310408  / # #

    2023-09-11T05:05:01.412727  export SHELL=3D/bin/sh

    2023-09-11T05:05:01.413529  #

    2023-09-11T05:05:01.514954  / # export SHELL=3D/bin/sh. /lava-11491768/=
environment

    2023-09-11T05:05:01.515738  =


    2023-09-11T05:05:01.617211  / # . /lava-11491768/environment/lava-11491=
768/bin/lava-test-runner /lava-11491768/1

    2023-09-11T05:05:01.618476  =


    2023-09-11T05:05:01.619487  / # /lava-11491768/bin/lava-test-runner /la=
va-11491768/1

    2023-09-11T05:05:01.685416  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-11T05:05:01.685934  + cd /lav<8>[   20.543715] <LAVA_SIGNAL_STA=
RTRUN 1_bootrr 11491768_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe9fb2fd2102b658286e45

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64fe9fb2fd2102b658286e4e
        failing since 54 days (last pass: v6.4-rc1-5-g2b8cc5858a07a, first =
fail: v6.5-rc1-1-ga6edd5f5d9cc)

    2023-09-11T05:05:19.076085  / # #

    2023-09-11T05:05:19.178472  export SHELL=3D/bin/sh

    2023-09-11T05:05:19.179236  #

    2023-09-11T05:05:19.280690  / # export SHELL=3D/bin/sh. /lava-11491765/=
environment

    2023-09-11T05:05:19.281500  =


    2023-09-11T05:05:19.382974  / # . /lava-11491765/environment/lava-11491=
765/bin/lava-test-runner /lava-11491765/1

    2023-09-11T05:05:19.384189  =


    2023-09-11T05:05:19.400503  / # /lava-11491765/bin/lava-test-runner /la=
va-11491765/1

    2023-09-11T05:05:19.466491  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-11T05:05:19.467007  + cd /lava-1149176<8>[   19.206964] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11491765_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
