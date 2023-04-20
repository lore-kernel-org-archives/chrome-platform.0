Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1BF17FF
	for <chrome-platform@lists.linux.dev>; Thu, 20 Apr 2023 03:49:24 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-63b5c4c76aaso469542b3a.2
        for <chrome-platform@lists.linux.dev>; Wed, 19 Apr 2023 20:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1681962564; x=1684554564;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H46szMcOMshxs42V9v2a9XyHulIHDBCb7cQfV1vJSi8=;
        b=0QWlTkzNQvhpa/Hk6g3sTdzjOuUQVhmxIKOL4Hdbwbyl8oKxz5DRgb+MmfNsBgVQzs
         upDkqc20IVhvSeWYZcZ1uQlBrfM9Zrh71pZq3PvemjlsaPggIGdg7kJGU5wbfWSZA/vo
         B4+h4zD8ZMVLiSJJG7qGRKnse2tM0Mcstq3ofR/N6I/rhl2gyF7+jj7nQTtJp4B3lUH1
         Gl/+lP7K+nc1ZLmihAmfml1lkdmZkBVu81mFaV3xsXJhh/NJN1amZk9KRaJ4tKTFhMtm
         TQWbOqEUQ6ZiMeIHH5n2KWrXNlXZUD4TdeqaqnhRnoMJbabsQ1K60j2KiGb+QEBdsS0b
         osCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681962564; x=1684554564;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H46szMcOMshxs42V9v2a9XyHulIHDBCb7cQfV1vJSi8=;
        b=gT3iRhpP5aPPZ3Hfj1KO/ofaKpXOap7T/bpboZiJHBZ+92jpxofVlqOhPe3G9Ovz4c
         qDUNk2bR7UEGUPzYyZ3CHcc9WanilEQwnrcMlcDl6td1cDJBvxPzPnzRERATJph/21gd
         tSnGfQtNG7Z9ZcitPYWtqvE13Ry/LwhSfxamcYaTFfiherpIZDOawRkBgFynJpyAMOI2
         RKNzLOBrlyT6dI5351GPhmDn0RCC69dA+C8v0MY6iaG2+zSohvY7s7mLafF6P7tTjkW3
         gYOYXByBXfRwrFJwCu4+fNssC1V61KtvcmnFtZ7Ilk28dSh+i5sxxRMXMdzuXcgRcRda
         4d6Q==
X-Gm-Message-State: AAQBX9f4/kiGHGST7pv2djyvE2/jox1WMd/7s314issVMflyROZuAZe3
	cCp8yAVS17zyQeZFKl2152U0pw==
X-Google-Smtp-Source: AKy350bdKUL9WbVC0A6QFS5Lw2SjR1EsoPvW/NpBfyrjJRNDvnEGJlAHjWdfueRFcYcx7n/UkxusTA==
X-Received: by 2002:aa7:8893:0:b0:63d:38dd:b120 with SMTP id z19-20020aa78893000000b0063d38ddb120mr6218593pfe.22.1681962563931;
        Wed, 19 Apr 2023 20:49:23 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h17-20020a056a001a5100b005abc30d9445sm137146pfv.180.2023.04.19.20.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 20:49:23 -0700 (PDT)
Message-ID: <6440b643.050a0220.ebd20.06cc@mx.google.com>
Date: Wed, 19 Apr 2023 20:49:23 -0700 (PDT)
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
X-Kernelci-Kernel: v6.3-rc1-8-g0ad5ce8407db
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 70 runs,
 30 regressions (v6.3-rc1-8-g0ad5ce8407db)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 70 runs, 30 regressions (v6.3-rc1-8-=
g0ad5ce8407db)

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

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =

imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =

imx6q-sabrelite              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =

imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =

imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =

imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.3-rc1-8-g0ad5ce8407db/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.3-rc1-8-g0ad5ce8407db
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      0ad5ce8407db2e44922ee21d2f2a9de4df336038 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6440aaed57b7475aa42e8609

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6440aaed57b7475aa42e860e
        failing since 12 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-04-20T03:00:43.722827  + set +x

    2023-04-20T03:00:43.729455  <8>[   10.643172] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10058019_1.4.2.3.1>

    2023-04-20T03:00:43.833534  / # #

    2023-04-20T03:00:43.934535  export SHELL=3D/bin/sh

    2023-04-20T03:00:43.934736  #

    2023-04-20T03:00:44.035614  / # export SHELL=3D/bin/sh. /lava-10058019/=
environment

    2023-04-20T03:00:44.035808  =


    2023-04-20T03:00:44.136727  / # . /lava-10058019/environment/lava-10058=
019/bin/lava-test-runner /lava-10058019/1

    2023-04-20T03:00:44.137005  =


    2023-04-20T03:00:44.142709  / # /lava-10058019/bin/lava-test-runner /la=
va-10058019/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6440aad7eff859ab6b2e85f5

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6440aad7eff859ab6b2e85fa
        failing since 12 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-04-20T03:00:29.442549  + <8>[   11.558062] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10057966_1.4.2.3.1>

    2023-04-20T03:00:29.442673  set +x

    2023-04-20T03:00:29.547430  / # #

    2023-04-20T03:00:29.648533  export SHELL=3D/bin/sh

    2023-04-20T03:00:29.648765  #

    2023-04-20T03:00:29.749713  / # export SHELL=3D/bin/sh. /lava-10057966/=
environment

    2023-04-20T03:00:29.749956  =


    2023-04-20T03:00:29.850977  / # . /lava-10057966/environment/lava-10057=
966/bin/lava-test-runner /lava-10057966/1

    2023-04-20T03:00:29.851422  =


    2023-04-20T03:00:29.855788  / # /lava-10057966/bin/lava-test-runner /la=
va-10057966/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6440aad6eff859ab6b2e85e7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6440aad6eff859ab6b2e85ec
        failing since 12 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-04-20T03:00:31.157600  <8>[    9.755769] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10058021_1.4.2.3.1>

    2023-04-20T03:00:31.160817  + set +x

    2023-04-20T03:00:31.262454  =


    2023-04-20T03:00:31.363468  / # #export SHELL=3D/bin/sh

    2023-04-20T03:00:31.363693  =


    2023-04-20T03:00:31.464573  / # export SHELL=3D/bin/sh. /lava-10058021/=
environment

    2023-04-20T03:00:31.464765  =


    2023-04-20T03:00:31.565660  / # . /lava-10058021/environment/lava-10058=
021/bin/lava-test-runner /lava-10058021/1

    2023-04-20T03:00:31.565997  =


    2023-04-20T03:00:31.570794  / # /lava-10058021/bin/lava-test-runner /la=
va-10058021/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6440b025b2c19c6d582e862a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6440b025b2c19c6d582e862f
        failing since 12 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-04-20T03:23:04.317273  + set +x

    2023-04-20T03:23:04.324509  <8>[   10.595519] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10058025_1.4.2.3.1>

    2023-04-20T03:23:04.428916  / # #

    2023-04-20T03:23:04.529904  export SHELL=3D/bin/sh

    2023-04-20T03:23:04.530185  #

    2023-04-20T03:23:04.631139  / # export SHELL=3D/bin/sh. /lava-10058025/=
environment

    2023-04-20T03:23:04.631366  =


    2023-04-20T03:23:04.732357  / # . /lava-10058025/environment/lava-10058=
025/bin/lava-test-runner /lava-10058025/1

    2023-04-20T03:23:04.732730  =


    2023-04-20T03:23:04.737165  / # /lava-10058025/bin/lava-test-runner /la=
va-10058025/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6440af38bf0208a6682e8620

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6440af38bf0208a6682e8625
        failing since 12 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-04-20T03:19:00.922901  + set +x<8>[   10.723403] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10057987_1.4.2.3.1>

    2023-04-20T03:19:00.923439  =


    2023-04-20T03:19:01.031223  #

    2023-04-20T03:19:01.032555  =


    2023-04-20T03:19:01.134578  / # #export SHELL=3D/bin/sh

    2023-04-20T03:19:01.135292  =


    2023-04-20T03:19:01.237138  / # export SHELL=3D/bin/sh. /lava-10057987/=
environment

    2023-04-20T03:19:01.237926  =


    2023-04-20T03:19:01.340047  / # . /lava-10057987/environment/lava-10057=
987/bin/lava-test-runner /lava-10057987/1

    2023-04-20T03:19:01.341294  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6440aad4d8cadfd2d82e8633

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6440aad4d8cadfd2d82e8638
        failing since 12 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-04-20T03:00:18.512978  + <8>[   11.509370] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10057968_1.4.2.3.1>

    2023-04-20T03:00:18.513070  set +x

    2023-04-20T03:00:18.617022  / # #

    2023-04-20T03:00:18.718016  export SHELL=3D/bin/sh

    2023-04-20T03:00:18.718242  #

    2023-04-20T03:00:18.819227  / # export SHELL=3D/bin/sh. /lava-10057968/=
environment

    2023-04-20T03:00:18.819448  =


    2023-04-20T03:00:18.920298  / # . /lava-10057968/environment/lava-10057=
968/bin/lava-test-runner /lava-10057968/1

    2023-04-20T03:00:18.920616  =


    2023-04-20T03:00:18.925224  / # /lava-10057968/bin/lava-test-runner /la=
va-10057968/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6440a9d88dd5dc44dc2e862c

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6440a9d88dd5dc4=
4dc2e8633
        failing since 44 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-04-20T02:56:00.261903  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-04-20T02:56:00.262075  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-20T02:56:00.270763  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xe0cb8000 allocated at kernel_clone+0x8c/0x=
36c
    2023-04-20T02:56:00.279959  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-04-20T02:56:00.288840  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-04-20T02:56:00.297844  kern  :alert : Register r7 information: sla=
b task_struct start c880bb80 pointer offset 0 size 2176
    2023-04-20T02:56:00.298109  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-04-20T02:56:00.306873  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
    2023-04-20T02:56:00.315884  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory
    2023-04-20T02:56:00.316103  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory =

    ... (103 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6440a9d88dd5dc4=
4dc2e8634
        failing since 44 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-04-20T02:56:00.225635  kern  :alert : 8<--- cut here ---
    2023-04-20T02:56:00.234670  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-04-20T02:56:00.235026  kern  :alert : [c1a50741] *pgd=3D71a0041e(b=
ad)
    2023-04-20T02:56:00.252844  kern  :alert : Register r0 information: non=
-slab/vmalloc memory[    6.796143] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
    2023-04-20T02:56:00.253072  =

    2023-04-20T02:56:00.253190  kern  :alert : Register r1 information: non=
-paged memory   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6440a9d68dd5dc44dc2e860b

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6440a9d68dd5dc4=
4dc2e8612
        failing since 44 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-04-20T02:56:00.492725  ern  :alert : Register r0 information: non-=
slab/vmalloc memory
    2023-04-20T02:56:00.492911  kern  :alert : Register r1 information: non=
-paged memory
    2023-04-20T02:56:00.501681  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-04-20T02:56:00.501873  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-20T02:56:00.510753  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0cd4000 allocated at kernel_clone+0x8c/0x=
36c
    2023-04-20T02:56:00.519646  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-04-20T02:56:00.528805  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-04-20T02:56:00.537910  kern  :alert : Register r7 information: sla=
b task_struct start c33d9100 pointer offset 0 size 2176
    2023-04-20T02:56:00.538174  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-04-20T02:56:00.546843  kern  :alert : Register r9 information: non=
-slab/vmalloc memory =

    ... (102 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6440a9d68dd5dc4=
4dc2e8613
        failing since 44 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-04-20T02:56:00.465455  kern  :alert : 8<--- cut here ---
    2023-04-20T02:56:00.474483  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-04-20T02:56:00.474688  kern  :alert : [c1a50741] *pgd=3D11a0041e(b=
ad)
    2023-04-20T02:56:00.483473  k[    6.779184] <LAVA_SIGNAL_TESTCASE TEST_=
CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6440aabfd8cadfd2d82e85e6

  Results:     13 PASS, 12 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-=
imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-=
imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6440aabfd8cadfd=
2d82e8600
        failing since 44 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-04-20T02:59:30.884460  k<8>[   16.173139] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
    2023-04-20T02:59:30.885144  ern  :alert : Register r0 information: non-=
slab/vmalloc memory
    2023-04-20T02:59:30.885393  kern  :alert : Register r1 information: non=
-paged memory
    2023-04-20T02:59:30.885595  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-04-20T02:59:30.885763  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-20T02:59:30.906426  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0cb0000 allocated at kernel_clone+0x8c/0x=
36c
    2023-04-20T02:59:30.907101  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-04-20T02:59:30.907297  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-04-20T02:59:30.928682  kern  :alert : Register r7 information: sla=
b task_struct start c4aacc80 pointer offset 0 size 2176
    2023-04-20T02:59:30.929318  kern  :alert : Register r8 information: non=
-slab/vmalloc memory =

    ... (103 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6440aabfd8cadfd=
2d82e8601
        failing since 44 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-04-20T02:59:30.862402  kern  :alert : 8<--- cut here ---
    2023-04-20T02:59:30.862796  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-04-20T02:59:30.863277  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-sabrelite              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6440aa012a88dc8c622e8637

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6440aa012a88dc8=
c622e863e
        failing since 44 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-04-20T02:56:54.220777  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0e00000 allocated at kernel_clone+0x8c/0x=
36c

    2023-04-20T02:56:54.221346  kern  :alert : Register r5 information: non=
-slab/vmalloc memory

    2023-04-20T02:56:54.221759  kern  :alert : Register r6 information: zer=
o-size pointer

    2023-04-20T02:56:54.222112  kern  :alert : Register r7 information: sla=
b task_struct start c3481980 pointer offset 0 size 2176

    2023-04-20T02:56:54.222454  kern  :alert : Register r8 information: non=
-slab/vmalloc memory

    2023-04-20T02:56:54.222788  kern  :alert : Register r9 information: non=
-slab/vmalloc memory

    2023-04-20T02:56:54.263714  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory

    2023-04-20T02:56:54.264287  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory

    2023-04-20T02:56:54.264668  kern  :alert : Register r12 information: NU=
LL pointer

    2023-04-20T02:56:54.265017  kern  :alert : 8<--- cut here ---
 =

    ... (101 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6440aa012a88dc8=
c622e863f
        failing since 44 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-04-20T02:56:54.177760  kern  :alert : 8<--- cut here ---

    2023-04-20T02:56:54.178337  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741

    2023-04-20T02:56:54.178722  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)

    2023-04-20T02:56:54.179075  k<8>[    9.008095] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>

    2023-04-20T02:56:54.179412  ern  :alert : Register r0 information: non-=
slab/vmalloc memory

    2023-04-20T02:56:54.179749  kern  :alert : Register r1 information: non=
-paged memory

    2023-04-20T02:56:54.180105  kern  :alert : Register r2 information: non=
-slab/vmalloc memory

    2023-04-20T02:56:54.180440  kern  :alert : Register r3 information: non=
-paged memory
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6440aa3d0e46e3911a2e8649

  Results:     13 PASS, 12 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-=
imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-=
imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6440aa3d0e46e39=
11a2e8663
        failing since 44 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-04-20T02:57:35.586853  k<8>[   15.160140] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
    2023-04-20T02:57:35.587375  ern  :alert : Register r0 information: non-=
slab/vmalloc memory
    2023-04-20T02:57:35.587657  kern  :alert : Register r1 information: non=
-paged memory
    2023-04-20T02:57:35.588195  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-04-20T02:57:35.588667  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-20T02:57:35.609100  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0d48000 allocated at kernel_clone+0x8c/0x=
36c
    2023-04-20T02:57:35.609746  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-04-20T02:57:35.610519  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-04-20T02:57:35.631167  kern  :alert : Register r7 information: sla=
b task_struct start c24bbb80 pointer offset 0 size 2176
    2023-04-20T02:57:35.631837  kern  :alert : Register r8 information: non=
-slab/vmalloc memory =

    ... (102 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6440aa3d0e46e39=
11a2e8664
        failing since 44 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-04-20T02:57:35.564921  kern  :alert : 8<--- cut here ---
    2023-04-20T02:57:35.565465  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-04-20T02:57:35.566067  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6440a9d78dd5dc44dc2e8616

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6440a9d78dd5dc4=
4dc2e861d
        failing since 44 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-04-20T02:56:01.061714  mation: non-slab/vmalloc memory
    2023-04-20T02:56:01.061902  kern  :alert : Register r1 information: non=
-paged memory
    2023-04-20T02:56:01.070700  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-04-20T02:56:01.070910  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-20T02:56:01.079620  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0e0c000 allocated at kernel_clone+0x8c/0x=
36c
    2023-04-20T02:56:01.088752  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-04-20T02:56:01.097808  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-04-20T02:56:01.107066  kern  :alert : Register r7 information: sla=
b task_struct start c261bb80 pointer offset 0 size 2176
    2023-04-20T02:56:01.107331  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-04-20T02:56:01.115659  kern  :alert : Register r9 information: non=
-slab/vmalloc memory =

    ... (102 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6440a9d78dd5dc4=
4dc2e861e
        failing since 44 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-04-20T02:56:01.034664  kern  :alert : 8<--- cut here ---
    2023-04-20T02:56:01.043840  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-04-20T02:56:01.044074  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)
    2023-04-20T02:56:01.052681  kern  :alert : Register r0 infor[    5.5506=
12] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines =
MEASUREMENT=3D48>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6440aa6dfedf4342082e860c

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6=
ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6=
ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6440aa6dfedf434=
2082e8613
        failing since 26 days (last pass: v6.2-rc1-8-gf9a0ae83af2e, first f=
ail: v6.3-rc1-4-g9ce5f3b3c18e2)
        90 lines

    2023-04-20T02:57:55.504408  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-04-20T02:57:55.504652  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-20T02:57:55.524708  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xe0c34000 allocated at kernel_clone+0x8c/0x=
36c
    2023-04-20T02:57:55.525266  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-04-20T02:57:55.525522  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-04-20T02:57:55.539214  kern  :alert : Register r7 information: sla=
b task_struct start c7981100 pointer offset 0 size 2176
    2023-04-20T02:57:55.540495  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-04-20T02:57:55.550256  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
    2023-04-20T02:57:55.560278  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory
    2023-04-20T02:57:55.570378  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory =

    ... (105 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6440aa6dfedf434=
2082e8614
        failing since 26 days (last pass: v6.2-rc1-8-gf9a0ae83af2e, first f=
ail: v6.3-rc1-4-g9ce5f3b3c18e2)
        48 lines

    2023-04-20T02:57:55.479749  kern  :alert : 8<--- cut here ---
    2023-04-20T02:57:55.480051  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-04-20T02:57:55.480578  kern  :alert : [c1a50741] *pgd=3D81a1141e(b=
ad)
    2023-04-20T02:57:55.480824  kern  :alert : Register r0 information: non=
-slab/vmalloc memory
    2023-04-20T02:57:55.502703  kern  :alert : Register r1 in<8>[   21.9658=
86] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines =
MEASUREMENT=3D48>
    2023-04-20T02:57:55.503028  formation: non-paged memory   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6440aa263a7bed01862e8661

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7=
d-sdb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7=
d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6440aa263a7bed0=
1862e8668
        failing since 44 days (last pass: v6.2-rc1-32-g7ae7deb4a4b4, first =
fail: v6.3-rc1)
        90 lines

    2023-04-20T02:57:23.065407  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-20T02:57:23.105426  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0d8c000 allocated at kernel_clone+0x8c/0x=
36c
    2023-04-20T02:57:23.106012  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-04-20T02:57:23.106271  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-04-20T02:57:23.106514  kern  :alert : Register r7 information: sla=
b task_struct start c2155500 pointer offset 0 size 2176
    2023-04-20T02:57:23.106752  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-04-20T02:57:23.107273  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
    2023-04-20T02:57:23.148429  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory
    2023-04-20T02:57:23.148733  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory
    2023-04-20T02:57:23.149242  kern  :alert : Register r12 information: NU=
LL pointer =

    ... (97 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6440aa263a7bed0=
1862e8669
        failing since 44 days (last pass: v6.2-rc1-32-g7ae7deb4a4b4, first =
fail: v6.3-rc1)
        48 lines

    2023-04-20T02:57:23.062351  kern  :alert : 8<--- cut here ---
    2023-04-20T02:57:23.062656  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-04-20T02:57:23.063181  kern  :alert : [c1a50741] *pgd=3D81a1141e(b=
ad)
    2023-04-20T02:57:23.063431  k<8>[   10.878537] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
    2023-04-20T02:57:23.063669  ern  :alert : Register r0 information: non-=
slab/vmalloc memory
    2023-04-20T02:57:23.063902  kern  :alert : Register r1 information: non=
-paged memory
    2023-04-20T02:57:23.064129  kern  :alert : Register r2 information: non=
-slab/vmalloc memory   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6440aa6769c70828fc2e85f3

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7=
ulp-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7=
ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6440aa6769c7082=
8fc2e85fa
        failing since 44 days (last pass: v6.2-rc1-23-g93899a4cb7b1, first =
fail: v6.3-rc1)
        90 lines

    2023-04-20T02:58:00.572803  -paged memory
    2023-04-20T02:58:00.573134  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-04-20T02:58:00.573634  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-20T02:58:00.595803  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0bdc000 allocated at kernel_clone+0x8c/0x=
36c
    2023-04-20T02:58:00.596106  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-04-20T02:58:00.596608  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-04-20T02:58:00.596853  kern  :alert : Register r7 information: sla=
b task_struct start c232b300 pointer offset 0 size 2176
    2023-04-20T02:58:00.617800  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-04-20T02:58:00.618117  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
    2023-04-20T02:58:00.618619  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory =

    ... (104 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6440aa6769c7082=
8fc2e85fb
        failing since 44 days (last pass: v6.2-rc1-23-g93899a4cb7b1, first =
fail: v6.3-rc1)
        48 lines

    2023-04-20T02:58:00.541802  kern  :alert : 8<--- cut here ---
    2023-04-20T02:58:00.542102  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-04-20T02:58:00.542604  kern  :alert : [c1a50741] *pgd=3D61a1141e(b=
ad)
    2023-04-20T02:58:00.542849  kern  :alert : Register r0 information: non=
-slab/vmalloc memory
    2023-04-20T02:58:00.551579  kern  :alert : Register r1 information: non=
<8>[   24.579922] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail =
UNITS=3Dlines MEASUREMENT=3D48>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6440aad8d8cadfd2d82e865d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6440aad8d8cadfd2d82e8662
        failing since 12 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-04-20T03:00:24.210726  <8>[   11.668661] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10058027_1.4.2.3.1>

    2023-04-20T03:00:24.315707  / # #

    2023-04-20T03:00:24.416717  export SHELL=3D/bin/sh

    2023-04-20T03:00:24.416969  #

    2023-04-20T03:00:24.517930  / # export SHELL=3D/bin/sh. /lava-10058027/=
environment

    2023-04-20T03:00:24.518150  =


    2023-04-20T03:00:24.619055  / # . /lava-10058027/environment/lava-10058=
027/bin/lava-test-runner /lava-10058027/1

    2023-04-20T03:00:24.619381  =


    2023-04-20T03:00:24.623972  / # /lava-10058027/bin/lava-test-runner /la=
va-10058027/1

    2023-04-20T03:00:24.630027  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/6440ad1a7183fc03982e85ee

  Results:     166 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/644=
0ad1a7183fc03982e863b
        failing since 44 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)

    2023-04-20T03:09:54.261304  /lava-10058152/1/../bin/lava-test-case

    2023-04-20T03:09:54.271554  <8>[   23.452662] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/6440ad1a7183fc03982e868d
        failing since 44 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)

    2023-04-20T03:09:51.392938  /lava-10058152/1/../bin/lava-test-case

    2023-04-20T03:09:51.403360  <8>[   20.584067] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/6440ad1a7183fc03982e868e
        failing since 44 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)

    2023-04-20T03:09:50.364079  /lava-10058152/1/../bin/lava-test-case

    2023-04-20T03:09:50.374588  <8>[   19.555504] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6440a9e00e99bbcd722e85fc

  Results:     10 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-8-g0ad5ce8407db/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6440a9e00e99bbc=
d722e8609
        failing since 8 days (last pass: v6.3-rc1-6-g14bb09b32f43, first fa=
il: v6.3-rc1-7-g419346a03810)
        30 lines =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6440a9e00e99bbc=
d722e860a
        failing since 8 days (last pass: v6.3-rc1-6-g14bb09b32f43, first fa=
il: v6.3-rc1-7-g419346a03810)
        16 lines

    2023-04-20T02:56:18.568447  kern  :alert : 8<--- cut here ---

    2023-04-20T02:56:18.568516  kern  :alert : Unhandled faul<8>[   13.0035=
92] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines =
MEASUREMENT=3D16>

    2023-04-20T02:56:18.568566  t: alignment exception (0x001) at 0xc1a50741

    2023-04-20T02:56:18.568615  kern  :alert : [c1a50741] *pgd=3D01a1141e(b=
ad)

    2023-04-20T02:56:18.568660  kern  :alert : Register r0 information: non=
-slab/vmalloc memory

    2023-04-20T02:56:18.568703  kern  :alert : Register r1 informat<8>[   1=
3.029414] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3D=
lines MEASUREMENT=3D30>

    2023-04-20T02:56:18.568751  ion: non-paged memory
   =

 =20
