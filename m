Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7056D62D
	for <chrome-platform@lists.linux.dev>; Mon, 29 May 2023 02:49:14 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-256712d65ceso427868a91.1
        for <chrome-platform@lists.linux.dev>; Sun, 28 May 2023 19:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685328554; x=1687920554;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zh9vGEHVAqkDHEAqSPvLAa4kVTVNJZkM7PwJID4edWY=;
        b=irn2XaqskdyaKN/oeE5XXAg4H7EUsqidOsASb6XZysRwzr2Xf1QxGkzTIEz96OFPCf
         DRm+mB/G5CrDtzSX1XhWGrb81q3czDOIS7iwEzdB9CKHJ0FDyBegEy1tsVvim+5dowqi
         NnocuGA1LKnyewGTXFc4cPZ0/HBfV1A4ketoen5glq8xoiJOlaXFIfgDKTA03EBHEdDj
         necCYPvmldFTindXC61CSCu0OknRRn3aRZ8O/WEr8cVHptcT3pTh6y3DhrN91YmReVFL
         fjP2CpnFv65KpT/+vwxduJzHkcqimrjtSGo9mzOQzbBzlFb32E13eVFbQALe0K93vOqD
         1Qnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685328554; x=1687920554;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zh9vGEHVAqkDHEAqSPvLAa4kVTVNJZkM7PwJID4edWY=;
        b=SdjGKu+k/QyfTcX3jlEA27Mw36NuOGWJl8aFB0FKgWJJ5bcClJ+SzDzOAJSUXOdHsZ
         aA8SsA/HUqIRtY0Zt0XTZd7QmkcSCYAKoC/uxB1VFy3rJfZivyMjUM8/Iv+XLKkcmorC
         eOkCtEc6vaVubVB3fPD5oODeKPprr6b915Q3DSEmt6aeRJqdv2w61HIS0WPdew8Pw9UL
         EKbXBTr6gmCWb9+NDHP4/ts7+rom6mTYF9mfbP7uGI/iVhdmeoRqAPyFP+A/33/DosUu
         uE1IXiztEBw84wMaheJeoQe5nrPbOVKI0EG1ga+36wZOIMOnALYc6pG+OC5i+zO+fIyb
         G1Rg==
X-Gm-Message-State: AC+VfDyxlLNcBgHUl635qGdtCf0SyFATdJeZLW/M60B2uQnsZgGS27gn
	AmkkU0HP8R652RBp4Wmu2KI2Ug==
X-Google-Smtp-Source: ACHHUZ6aqH/fuJywNIWzEPjoHrsItQkhlgQ9JUZZbw0S8R1u6vod+720l6YePGkcA8TAQ7JPWTiwAA==
X-Received: by 2002:a17:90b:c15:b0:24b:2fc1:8a9c with SMTP id bp21-20020a17090b0c1500b0024b2fc18a9cmr9099560pjb.11.1685328553613;
        Sun, 28 May 2023 19:49:13 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a4-20020a170902b58400b001ae3b51269dsm6883188pls.262.2023.05.28.19.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 19:49:13 -0700 (PDT)
Message-ID: <647412a9.170a0220.aa238.de4d@mx.google.com>
Date: Sun, 28 May 2023 19:49:13 -0700 (PDT)
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
X-Kernelci-Kernel: v6.4-rc1-4-gf5bb4e381290
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 83 runs,
 13 regressions (v6.4-rc1-4-gf5bb4e381290)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 83 runs, 13 regressions (v6.4-rc1-4-=
gf5bb4e381290)

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

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 2          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.4-rc1-4-gf5bb4e381290/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.4-rc1-4-gf5bb4e381290
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      f5bb4e381290883a014a9e865ee2c430447ef953 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64740518072edb3ce82e85ee

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64740518072edb3ce82e85f3
        failing since 51 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-05-29T01:51:03.100030  + <8>[    8.998448] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10501798_1.4.2.3.1>

    2023-05-29T01:51:03.100145  set +x

    2023-05-29T01:51:03.204354  / # #

    2023-05-29T01:51:03.305003  export SHELL=3D/bin/sh

    2023-05-29T01:51:03.305174  #

    2023-05-29T01:51:03.405632  / # export SHELL=3D/bin/sh. /lava-10501798/=
environment

    2023-05-29T01:51:03.405797  =


    2023-05-29T01:51:03.506262  / # . /lava-10501798/environment/lava-10501=
798/bin/lava-test-runner /lava-10501798/1

    2023-05-29T01:51:03.506599  =


    2023-05-29T01:51:03.511239  / # /lava-10501798/bin/lava-test-runner /la=
va-10501798/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64740519072edb3ce82e85fa

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64740519072edb3ce82e85ff
        failing since 51 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-05-29T01:51:09.469174  <8>[    8.729170] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10501843_1.4.2.3.1>

    2023-05-29T01:51:09.472592  + set +x

    2023-05-29T01:51:09.574018  =


    2023-05-29T01:51:09.674629  / # #export SHELL=3D/bin/sh

    2023-05-29T01:51:09.674781  =


    2023-05-29T01:51:09.775293  / # export SHELL=3D/bin/sh. /lava-10501843/=
environment

    2023-05-29T01:51:09.775445  =


    2023-05-29T01:51:09.875961  / # . /lava-10501843/environment/lava-10501=
843/bin/lava-test-runner /lava-10501843/1

    2023-05-29T01:51:09.876195  =


    2023-05-29T01:51:09.881113  / # /lava-10501843/bin/lava-test-runner /la=
va-10501843/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6474050b85cc0e0a7a2e8608

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6474050b85cc0e0a7a2e860d
        failing since 51 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-05-29T01:50:58.176847  + <8>[   10.965592] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10501823_1.4.2.3.1>

    2023-05-29T01:50:58.176934  set +x

    2023-05-29T01:50:58.278105  #

    2023-05-29T01:50:58.278368  =


    2023-05-29T01:50:58.378971  / # #export SHELL=3D/bin/sh

    2023-05-29T01:50:58.379181  =


    2023-05-29T01:50:58.479779  / # export SHELL=3D/bin/sh. /lava-10501823/=
environment

    2023-05-29T01:50:58.479976  =


    2023-05-29T01:50:58.580502  / # . /lava-10501823/environment/lava-10501=
823/bin/lava-test-runner /lava-10501823/1

    2023-05-29T01:50:58.580819  =

 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6474050485cc0e0a7a2e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6474050485cc0e0a7a2e85eb
        failing since 51 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-05-29T01:50:46.852136  <8>[   10.660388] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10501837_1.4.2.3.1>

    2023-05-29T01:50:46.855998  + set +x

    2023-05-29T01:50:46.957388  #

    2023-05-29T01:50:46.957696  =


    2023-05-29T01:50:47.058413  / # #export SHELL=3D/bin/sh

    2023-05-29T01:50:47.058762  =


    2023-05-29T01:50:47.159648  / # export SHELL=3D/bin/sh. /lava-10501837/=
environment

    2023-05-29T01:50:47.160333  =


    2023-05-29T01:50:47.261673  / # . /lava-10501837/environment/lava-10501=
837/bin/lava-test-runner /lava-10501837/1

    2023-05-29T01:50:47.262707  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647405212fb32f4cad2e8664

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647405212fb32f4cad2e8669
        failing since 51 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-05-29T01:51:06.046839  + set<8>[   10.708878] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10501817_1.4.2.3.1>

    2023-05-29T01:51:06.046921   +x

    2023-05-29T01:51:06.150847  / # #

    2023-05-29T01:51:06.251478  export SHELL=3D/bin/sh

    2023-05-29T01:51:06.251681  #

    2023-05-29T01:51:06.352178  / # export SHELL=3D/bin/sh. /lava-10501817/=
environment

    2023-05-29T01:51:06.352380  =


    2023-05-29T01:51:06.452884  / # . /lava-10501817/environment/lava-10501=
817/bin/lava-test-runner /lava-10501817/1

    2023-05-29T01:51:06.453219  =


    2023-05-29T01:51:06.457193  / # /lava-10501817/bin/lava-test-runner /la=
va-10501817/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6474051885cc0e0a7a2e8641

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6474051885cc0e0a7a2e8646
        failing since 51 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-05-29T01:50:57.614671  <8>[   11.294160] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10501784_1.4.2.3.1>

    2023-05-29T01:50:57.722515  / # #

    2023-05-29T01:50:57.824792  export SHELL=3D/bin/sh

    2023-05-29T01:50:57.825442  #

    2023-05-29T01:50:57.926794  / # export SHELL=3D/bin/sh. /lava-10501784/=
environment

    2023-05-29T01:50:57.927453  =


    2023-05-29T01:50:58.029016  / # . /lava-10501784/environment/lava-10501=
784/bin/lava-test-runner /lava-10501784/1

    2023-05-29T01:50:58.030087  =


    2023-05-29T01:50:58.035501  / # /lava-10501784/bin/lava-test-runner /la=
va-10501784/1

    2023-05-29T01:50:58.042201  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6474098dc34c73ab1f2e85fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6474098dc34c73ab1f2e8=
5fd
        failing since 20 days (last pass: tag-chrome-platform-for-v6.4, fir=
st fail: v6.4-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6474097fca7fcae7532e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6474097fca7fcae7532e8=
5f4
        failing since 20 days (last pass: tag-chrome-platform-for-v6.4, fir=
st fail: v6.4-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/647408a5c2bc693aa22e85f2

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/647408a5c2bc693=
aa22e8649
        failing since 20 days (last pass: tag-chrome-platform-for-v6.4, fir=
st fail: v6.4-rc1)
        2 lines

    2023-05-29T02:05:56.429575  fo:

    2023-05-29T02:05:56.431995  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-29T02:05:56.438296  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-29T02:05:56.442756  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-29T02:05:56.445095  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-29T02:05:56.450723  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-29T02:05:56.453817  kern  :alert : Data abort info:

    2023-05-29T02:05:56.457883  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-29T02:05:56.468007  kern  :<8>[   19.236325] <LAVA_SIGNAL_TESTC=
ASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/647408a5c2bc693=
aa22e864a
        failing since 20 days (last pass: tag-chrome-platform-for-v6.4, fir=
st fail: v6.4-rc1)
        12 lines

    2023-05-29T02:05:56.415766  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-29T02:05:56.427535  kern  :alert : Mem abort in<8>[   19.189990=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D12>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6474081bd5ac7cbae62e85e6

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/arm64/defconfig/gcc-10/lab-collabora/baseline-rk339=
9-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/arm64/defconfig/gcc-10/lab-collabora/baseline-rk339=
9-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6474081bd5ac7cb=
ae62e85ed
        failing since 20 days (last pass: tag-chrome-platform-for-v6.4, fir=
st fail: v6.4-rc1)
        2 lines

    2023-05-29T02:04:00.814890  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-29T02:04:00.815424  kern  :emerg : Code: 97f9f510 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-29T02:04:00.815771  <8>[   20.982600] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-29T02:04:00.816091  + set +x

    2023-05-29T02:04:00.816398  <8>[   20.984697] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10501918_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6474081bd5ac7cb=
ae62e85ee
        failing since 20 days (last pass: tag-chrome-platform-for-v6.4, fir=
st fail: v6.4-rc1)
        12 lines

    2023-05-29T02:04:00.766441  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-29T02:04:00.766980  kern  :alert : Mem abort info:

    2023-05-29T02:04:00.767322  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-29T02:04:00.767640  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-29T02:04:00.767950  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-29T02:04:00.768250  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-29T02:04:00.768541  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-29T02:04:00.768827  kern  :alert : Data abort info:

    2023-05-29T02:04:00.769111  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-29T02:04:00.769425  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/647408ed288b223eb82e8626

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50=
i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50=
i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647408ed288b223eb82e8=
627
        new failure (last pass: v6.4-rc1-3-g4b9abbc132b86) =

 =20
