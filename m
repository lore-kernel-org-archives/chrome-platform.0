Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03DB1118
	for <chrome-platform@lists.linux.dev>; Fri,  4 Aug 2023 03:49:27 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1bc34b32785so11942515ad.3
        for <chrome-platform@lists.linux.dev>; Thu, 03 Aug 2023 20:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1691120967; x=1691725767;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ykdm9QdlO2UmKs+TKtR4Phl585VEF/FN050OYbCAb94=;
        b=ALQau+E/BbNhlbHi3hqMWEk49ZT9SblBOi9gTgkMuEs+KA0xwksO61hvWHr3cFr9Zu
         iTGXzQEZmm4YAWkboEcEmIcfZE1+bsy33/DPYomzCY3NmZ3ohQMuFV5ozaBhxXuW2HdW
         TADKvPpuUeQM7ft7STe1Mx+C4y3EmT2B5oaybJr/ZW7xCzPHzrdJliZPYu32lOTdvMVW
         Dcz8EwgQsJ279FyYL4EhHM4AnyzVqTtB2H6nDxfO8WtEZ1x11AJ+G4PX7tyJf+iMOpB2
         rbUsNK/Vu4npX0Hy2lFLM8R8I/XaN9CRFoL5tVPXfH1UArLaMaVBb7BAfcvaD63Muxgt
         nVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691120967; x=1691725767;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ykdm9QdlO2UmKs+TKtR4Phl585VEF/FN050OYbCAb94=;
        b=IDlfdTmlKNf9EsLq19DZFGpK/W8Hdcg88lciBm8BDP93v+o6pX9eRjk7toDlmQGVZw
         hyydTSaRN97J/vJO03gRM5YMlbysXKclnsgwEps+A0XEkPk9wGF0n0LD16H00oHhlQHt
         W3epQeIRYqB0hCQyDKnLRxk6TEyC3bOGp4a4JTkCZDW5jE8NLXCQsvrUGNvac+9r6l6n
         3ypZZUjacPl4ZHzWaVm3S5QxWxNszPW/+1YxliPbBum3wqGdEARl2IlfM5zMZnB1sA58
         KR40O5QUik0kN2phlbZEgCECaKxabyqcq4NmDvsAlXrzpK9E67FLTSQezi/+bvJW3icl
         w5pw==
X-Gm-Message-State: AOJu0YzCoT0r6CuXQz/tP6M04iodYYT5Zzxb66ytrHNdGJM23l/qb4pf
	FjLe4bdhNvr9Geq6bITk7OEF5g==
X-Google-Smtp-Source: AGHT+IEcV/85HIfm+OEHJeRYo9qPZtYNqaqRHMc0Cqbh/9zoZoUIhyeBpVfDgs+2V08bymM8Zz+hbQ==
X-Received: by 2002:a17:902:c943:b0:1b3:d6c8:7008 with SMTP id i3-20020a170902c94300b001b3d6c87008mr612673pla.57.1691120966871;
        Thu, 03 Aug 2023 20:49:26 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id q7-20020a170902788700b001bb9f104333sm614940pll.12.2023.08.03.20.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 20:49:26 -0700 (PDT)
Message-ID: <64cc7546.170a0220.b0a57.1efb@mx.google.com>
Date: Thu, 03 Aug 2023 20:49:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.5-rc1
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
Subject: chrome-platform/for-kernelci baseline: 78 runs,
 11 regressions (v6.5-rc1)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 78 runs, 11 regressions (v6.5-rc1)

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
ci/kernel/v6.5-rc1/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.5-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64cc69ce75db11ecae35b23f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-acer-chromebox-cxi4-puff.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-acer-chromebox-cxi4-puff.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64cc69ce75db11ecae35b=
240
        failing since 7 days (last pass: v6.5-rc1-1-ga6edd5f5d9cc, first fa=
il: v6.5-rc1-1-g0a329167220af) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64cc69cf75db11ecae35b242

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64cc69cf75db11ecae35b247
        failing since 118 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-08-04T03:00:08.037277  + set<8>[   11.828078] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11205439_1.4.2.3.1>

    2023-08-04T03:00:08.037370   +x

    2023-08-04T03:00:08.141652  / # #

    2023-08-04T03:00:08.242297  export SHELL=3D/bin/sh

    2023-08-04T03:00:08.242522  #

    2023-08-04T03:00:08.343087  / # export SHELL=3D/bin/sh. /lava-11205439/=
environment

    2023-08-04T03:00:08.343318  =


    2023-08-04T03:00:08.443878  / # . /lava-11205439/environment/lava-11205=
439/bin/lava-test-runner /lava-11205439/1

    2023-08-04T03:00:08.444199  =


    2023-08-04T03:00:08.449133  / # /lava-11205439/bin/lava-test-runner /la=
va-11205439/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64cc69bee8e138bbf235b252

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64cc69bee8e138bbf235b257
        failing since 118 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-08-04T02:59:45.116579  <8>[   11.103422] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11205395_1.4.2.3.1>

    2023-08-04T02:59:45.120343  + set +x

    2023-08-04T02:59:45.226690  #

    2023-08-04T02:59:45.329329  / # #export SHELL=3D/bin/sh

    2023-08-04T02:59:45.330023  =


    2023-08-04T02:59:45.431492  / # export SHELL=3D/bin/sh. /lava-11205395/=
environment

    2023-08-04T02:59:45.432197  =


    2023-08-04T02:59:45.533707  / # . /lava-11205395/environment/lava-11205=
395/bin/lava-test-runner /lava-11205395/1

    2023-08-04T02:59:45.534853  =


    2023-08-04T02:59:45.539705  / # /lava-11205395/bin/lava-test-runner /la=
va-11205395/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
fsl-ls2088a-rdb              | arm64  | lab-nxp       | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64cc6aa8ebdd7e3cb235b226

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64cc6aa8ebdd7e3cb235b229
        failing since 16 days (last pass: v6.0-rc1-19-gd378c6f0456c, first =
fail: v6.5-rc1-1-ga6edd5f5d9cc)

    2023-08-04T03:03:44.736672  + [   11.972728] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 1240818_1.5.2.4.1>
    2023-08-04T03:03:44.736989  set +x
    2023-08-04T03:03:44.843507  =

    2023-08-04T03:03:44.944880  / # #export SHELL=3D/bin/sh
    2023-08-04T03:03:44.945330  =

    2023-08-04T03:03:45.046301  / # export SHELL=3D/bin/sh. /lava-1240818/e=
nvironment
    2023-08-04T03:03:45.046765  =

    2023-08-04T03:03:45.147830  / # . /lava-1240818/environment/lava-124081=
8/bin/lava-test-runner /lava-1240818/1
    2023-08-04T03:03:45.148682  =

    2023-08-04T03:03:45.152361  / # /lava-1240818/bin/lava-test-runner /lav=
a-1240818/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64cc6993e8e138bbf235b1e4

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64cc6993e8e138bbf235b1e9
        failing since 118 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-08-04T02:59:21.415136  + set +x

    2023-08-04T02:59:21.421967  <8>[   10.568595] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11205410_1.4.2.3.1>

    2023-08-04T02:59:21.526000  / # #

    2023-08-04T02:59:21.626525  export SHELL=3D/bin/sh

    2023-08-04T02:59:21.626703  #

    2023-08-04T02:59:21.727168  / # export SHELL=3D/bin/sh. /lava-11205410/=
environment

    2023-08-04T02:59:21.727332  =


    2023-08-04T02:59:21.827850  / # . /lava-11205410/environment/lava-11205=
410/bin/lava-test-runner /lava-11205410/1

    2023-08-04T02:59:21.828088  =


    2023-08-04T02:59:21.832882  / # /lava-11205410/bin/lava-test-runner /la=
va-11205410/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64cc6996e8e138bbf235b1ef

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64cc6996e8e138bbf235b1f4
        failing since 118 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-08-04T02:59:23.303520  + set<8>[   10.575842] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11205394_1.4.2.3.1>

    2023-08-04T02:59:23.303695   +x

    2023-08-04T02:59:23.406037  #

    2023-08-04T02:59:23.506938  / # #export SHELL=3D/bin/sh

    2023-08-04T02:59:23.507166  =


    2023-08-04T02:59:23.607694  / # export SHELL=3D/bin/sh. /lava-11205394/=
environment

    2023-08-04T02:59:23.607896  =


    2023-08-04T02:59:23.708431  / # . /lava-11205394/environment/lava-11205=
394/bin/lava-test-runner /lava-11205394/1

    2023-08-04T02:59:23.708772  =


    2023-08-04T02:59:23.714110  / # /lava-11205394/bin/lava-test-runner /la=
va-11205394/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64cc69ba75db11ecae35b1e7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64cc69ba75db11ecae35b1ec
        failing since 118 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-08-04T02:59:47.785151  + set<8>[   11.067693] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11205420_1.4.2.3.1>

    2023-08-04T02:59:47.785611   +x

    2023-08-04T02:59:47.893144  / # #

    2023-08-04T02:59:47.995402  export SHELL=3D/bin/sh

    2023-08-04T02:59:47.995673  #

    2023-08-04T02:59:48.096301  / # export SHELL=3D/bin/sh. /lava-11205420/=
environment

    2023-08-04T02:59:48.096496  =


    2023-08-04T02:59:48.196992  / # . /lava-11205420/environment/lava-11205=
420/bin/lava-test-runner /lava-11205420/1

    2023-08-04T02:59:48.197259  =


    2023-08-04T02:59:48.201236  / # /lava-11205420/bin/lava-test-runner /la=
va-11205420/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64cc69aae7d8a0a7ee35b1fa

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64cc69aae7d8a0a7ee35b1ff
        failing since 118 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-08-04T02:59:36.561587  + set<8>[   11.821537] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11205400_1.4.2.3.1>

    2023-08-04T02:59:36.561893   +x

    2023-08-04T02:59:36.668736  / # #

    2023-08-04T02:59:36.770324  export SHELL=3D/bin/sh

    2023-08-04T02:59:36.770673  #

    2023-08-04T02:59:36.871295  / # export SHELL=3D/bin/sh. /lava-11205400/=
environment

    2023-08-04T02:59:36.871799  =


    2023-08-04T02:59:36.972811  / # . /lava-11205400/environment/lava-11205=
400/bin/lava-test-runner /lava-11205400/1

    2023-08-04T02:59:36.973837  =


    2023-08-04T02:59:36.978779  / # /lava-11205400/bin/lava-test-runner /la=
va-11205400/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64cc6b2f2a576d20aa35b1df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.=
txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64cc6b2f2a576d20aa35b=
1e0
        failing since 16 days (last pass: v6.4-rc1-5-g2b8cc5858a07a, first =
fail: v6.5-rc1-1-ga6edd5f5d9cc) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64cc6a7b9e54dcf84d35b1f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all=
-h3-cc.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all=
-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64cc6a7b9e54dcf84d35b=
1f2
        failing since 6 days (last pass: v6.5-rc1-1-ga6edd5f5d9cc, first fa=
il: v6.5-rc1-1-g0a329167220af) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64cc6a3946d062af4d35b1e0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64cc6a3946d062af4d35b1e5
        failing since 16 days (last pass: v6.4-rc1-5-g2b8cc5858a07a, first =
fail: v6.5-rc1-1-ga6edd5f5d9cc)

    2023-08-04T03:03:41.137450  / # #

    2023-08-04T03:03:41.239804  export SHELL=3D/bin/sh

    2023-08-04T03:03:41.240580  #

    2023-08-04T03:03:41.342034  / # export SHELL=3D/bin/sh. /lava-11205457/=
environment

    2023-08-04T03:03:41.342822  =


    2023-08-04T03:03:41.444294  / # . /lava-11205457/environment/lava-11205=
457/bin/lava-test-runner /lava-11205457/1

    2023-08-04T03:03:41.445562  =


    2023-08-04T03:03:41.462429  / # /lava-11205457/bin/lava-test-runner /la=
va-11205457/1

    2023-08-04T03:03:41.530441  + export 'TESTRUN_ID=3D1_bootrr'

    2023-08-04T03:03:41.530960  + cd /lava-11205457/1/tests/1_boot<8>[   18=
.372696] <LAVA_SIGNAL_STARTRUN 1_bootrr 11205457_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
