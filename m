Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64A47C
	for <chrome-platform@lists.linux.dev>; Mon, 24 Apr 2023 07:50:19 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1a814fe0ddeso46597455ad.2
        for <chrome-platform@lists.linux.dev>; Mon, 24 Apr 2023 00:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1682322619; x=1684914619;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zv+JsSKyaRPRjA6JyeLZ5HocUhA+H+1gdPxOGXzx5QY=;
        b=hWhsAB2u1eXN8kasw8LQ2y5ya1RdaiF7x2eBxGh3cdkGum3Q4YfMncr2GM1nmEcxp+
         T4+VU5RF0oHBqC+o60ZZYXGlIMPDTob5EKdP1cRDkMuEq2sjYtGtVMSHQWz6goWhgVx8
         V0UdHFVV9OuOkgbHSO5TX9zcHFQUqP0F2sbdQO8xW/EQQEY2WM5XEj141rJhWuAqfn/k
         qmBRYM2HdJW+ap7CQLpKSGz6mcoN3dQNKTaaxavhCvTmbtOG9rHhMDORITtTjdct8/gx
         CC2nNw08y6iHN2zg4MXnyLQw+7IA0WdeCVcagYBxn8abAyuWNETDzQZg/0NwDn0MwO4B
         kK3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682322619; x=1684914619;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zv+JsSKyaRPRjA6JyeLZ5HocUhA+H+1gdPxOGXzx5QY=;
        b=cF5uvVlT6RlnBDPyetokqZt+6SUAL/2tDRUcZgfnU+1Xcfp8vMrDNuIPC1B0pNB0na
         Y/I+17Bj4UsTj8S6WQaEsQEygZng46OQR8L7KP2JecrvvSEtbyq9vLVpRunZ4RuKAIyx
         Z5Wz8PhdDu0d45q3u0E3cHmgzOspZyplY0jOdjG0rl5Am8ZGXrz4D0YB/0aWtecm0qMN
         mNVd1e6u6wJwbUDnQ6unseIgNJXqps5P9KNXSfoMofQVLKdUtcp7yC+KQx8Vf+fVgn3l
         fHzNLMkkDRkuqQKe3ogeXN3R5nzorW7BYq7ugzLsa/nnoTvB/v97C/V4vZB1vfej1nbz
         l5Qw==
X-Gm-Message-State: AAQBX9c+s3ZynLCSmXx5sbPf6IHNL1bk6e7c0STMf77AbqC1GwAw1GUt
	kdYUWK084Vg1RvwSUB6fan+5rsq2fLp3C0L2eNkqBw==
X-Google-Smtp-Source: AKy350Z1JMiyinq712avFTAfKi8qTIetC2vIDDE3XvhZ/H73LRFYBvDUy/Dc6Ip/CNTe4SldnX6AXg==
X-Received: by 2002:a17:902:e882:b0:1a1:c8b3:3fe1 with SMTP id w2-20020a170902e88200b001a1c8b33fe1mr17668202plg.31.1682322619180;
        Mon, 24 Apr 2023 00:50:19 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a7-20020a1709027d8700b001a653a32173sm6041831plm.29.2023.04.24.00.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 00:50:18 -0700 (PDT)
Message-ID: <644634ba.170a0220.8d28d.b9ce@mx.google.com>
Date: Mon, 24 Apr 2023 00:50:18 -0700 (PDT)
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
X-Kernelci-Kernel: tag-chrome-platform-for-v6.4
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 87 runs,
 13 regressions (tag-chrome-platform-for-v6.4)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 87 runs, 13 regressions (tag-chrome-=
platform-for-v6.4)

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
v7_defconfig           | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig                    | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

odroid-xu3                   | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/tag-chrome-platform-for-v6.4/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: tag-chrome-platform-for-v6.4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      d184d60aa301e424cd0cf7de90b40744710a2417 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446284965937a54ac2e8610

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/l=
ab-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/l=
ab-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6446284965937a54ac2e8=
611
        new failure (last pass: v6.3-rc1-8-g0ad5ce8407db) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64462778a525d44d832e85ec

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/l=
ab-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/l=
ab-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64462778a525d44d832e85f1
        failing since 16 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-04-24T06:53:18.929082  + <8>[   10.749471] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10099949_1.4.2.3.1>

    2023-04-24T06:53:18.929167  set +x

    2023-04-24T06:53:19.033561  / # #

    2023-04-24T06:53:19.134678  export SHELL=3D/bin/sh

    2023-04-24T06:53:19.134956  #

    2023-04-24T06:53:19.235914  / # export SHELL=3D/bin/sh. /lava-10099949/=
environment

    2023-04-24T06:53:19.236155  =


    2023-04-24T06:53:19.337149  / # . /lava-10099949/environment/lava-10099=
949/bin/lava-test-runner /lava-10099949/1

    2023-04-24T06:53:19.337594  =


    2023-04-24T06:53:19.342808  / # /lava-10099949/bin/lava-test-runner /la=
va-10099949/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446275eb8b4a4cd962e85eb

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/l=
ab-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/l=
ab-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446275eb8b4a4cd962e85f0
        failing since 16 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-04-24T06:53:01.915732  <8>[    8.117424] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10099926_1.4.2.3.1>

    2023-04-24T06:53:01.919148  + set +x

    2023-04-24T06:53:02.025958  =


    2023-04-24T06:53:02.128467  / # #export SHELL=3D/bin/sh

    2023-04-24T06:53:02.129243  =


    2023-04-24T06:53:02.231238  / # export SHELL=3D/bin/sh. /lava-10099926/=
environment

    2023-04-24T06:53:02.232090  =


    2023-04-24T06:53:02.334467  / # . /lava-10099926/environment/lava-10099=
926/bin/lava-test-runner /lava-10099926/1

    2023-04-24T06:53:02.335580  =


    2023-04-24T06:53:02.340596  / # /lava-10099926/bin/lava-test-runner /la=
va-10099926/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644627506042b905c02e85f6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/l=
ab-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/l=
ab-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644627506042b905c02e85fb
        failing since 16 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-04-24T06:52:51.826353  + set +x

    2023-04-24T06:52:51.832750  <8>[   11.017245] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10099932_1.4.2.3.1>

    2023-04-24T06:52:51.937826  / # #

    2023-04-24T06:52:52.038493  export SHELL=3D/bin/sh

    2023-04-24T06:52:52.038685  #

    2023-04-24T06:52:52.139606  / # export SHELL=3D/bin/sh. /lava-10099932/=
environment

    2023-04-24T06:52:52.139794  =


    2023-04-24T06:52:52.240695  / # . /lava-10099932/environment/lava-10099=
932/bin/lava-test-runner /lava-10099932/1

    2023-04-24T06:52:52.241046  =


    2023-04-24T06:52:52.245724  / # /lava-10099932/bin/lava-test-runner /la=
va-10099932/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446274df3f98b80f62e85e9

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/l=
ab-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/l=
ab-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446274df3f98b80f62e85ee
        failing since 16 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-04-24T06:52:46.026744  <8>[   10.233407] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10099889_1.4.2.3.1>

    2023-04-24T06:52:46.029859  + set +x

    2023-04-24T06:52:46.131641  #

    2023-04-24T06:52:46.233043  / # #export SHELL=3D/bin/sh

    2023-04-24T06:52:46.233392  =


    2023-04-24T06:52:46.334326  / # export SHELL=3D/bin/sh. /lava-10099889/=
environment

    2023-04-24T06:52:46.334551  =


    2023-04-24T06:52:46.435480  / # . /lava-10099889/environment/lava-10099=
889/bin/lava-test-runner /lava-10099889/1

    2023-04-24T06:52:46.435785  =


    2023-04-24T06:52:46.440848  / # /lava-10099889/bin/lava-test-runner /la=
va-10099889/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446275ab82d450a2e2e85eb

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/l=
ab-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/l=
ab-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446275ab82d450a2e2e85f0
        failing since 16 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-04-24T06:52:53.720576  + set<8>[   11.346865] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10099928_1.4.2.3.1>

    2023-04-24T06:52:53.720688   +x

    2023-04-24T06:52:53.826311  / # #

    2023-04-24T06:52:53.927545  export SHELL=3D/bin/sh

    2023-04-24T06:52:53.927797  #

    2023-04-24T06:52:54.028786  / # export SHELL=3D/bin/sh. /lava-10099928/=
environment

    2023-04-24T06:52:54.029053  =


    2023-04-24T06:52:54.130089  / # . /lava-10099928/environment/lava-10099=
928/bin/lava-test-runner /lava-10099928/1

    2023-04-24T06:52:54.130426  =


    2023-04-24T06:52:54.134774  / # /lava-10099928/bin/lava-test-runner /la=
va-10099928/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/644628462c22598d8e2e8602

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.4/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/b=
aseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.4/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/b=
aseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644628462c22598d8e2e8607
        new failure (last pass: v6.3-rc1-8-g0ad5ce8407db)

    2023-04-24T06:56:48.928681  + set +x
    2023-04-24T06:56:48.928828  [   13.109582] <LAVA_SIGNAL_ENDRUN 0_dmesg =
935362_1.5.2.3.1>
    2023-04-24T06:56:49.035896  / # #
    2023-04-24T06:56:49.137535  export SHELL=3D/bin/sh
    2023-04-24T06:56:49.137962  #
    2023-04-24T06:56:49.239189  / # export SHELL=3D/bin/sh. /lava-935362/en=
vironment
    2023-04-24T06:56:49.239613  =

    2023-04-24T06:56:49.340831  / # . /lava-935362/environment/lava-935362/=
bin/lava-test-runner /lava-935362/1
    2023-04-24T06:56:49.341388  =

    2023-04-24T06:56:49.345123  / # /lava-935362/bin/lava-test-runner /lava=
-935362/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/644629d39b314357e72e866b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.4/arm64/defconfig/gcc-10/lab-pengutronix/baseline=
-imx8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.4/arm64/defconfig/gcc-10/lab-pengutronix/baseline=
-imx8mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644629d39b314357e72e8=
66c
        new failure (last pass: v6.3-rc1-8-g0ad5ce8407db) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446274fd54c62cc902e85ee

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/l=
ab-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/l=
ab-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6446274fd54c62cc902e85f3
        failing since 16 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-04-24T06:52:48.683254  <8>[   12.253026] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10099927_1.4.2.3.1>

    2023-04-24T06:52:48.788173  / # #

    2023-04-24T06:52:48.889185  export SHELL=3D/bin/sh

    2023-04-24T06:52:48.889425  #

    2023-04-24T06:52:48.990248  / # export SHELL=3D/bin/sh. /lava-10099927/=
environment

    2023-04-24T06:52:48.990440  =


    2023-04-24T06:52:49.091370  / # . /lava-10099927/environment/lava-10099=
927/bin/lava-test-runner /lava-10099927/1

    2023-04-24T06:52:49.091646  =


    2023-04-24T06:52:49.095945  / # /lava-10099927/bin/lava-test-runner /la=
va-10099927/1

    2023-04-24T06:52:49.101759  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/64462aab8a5f7521f72e863b

  Results:     166 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.4/arm64/defconfig+arm64-chromebook/gcc-10/lab-col=
labora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.4/arm64/defconfig+arm64-chromebook/gcc-10/lab-col=
labora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/644=
62aab8a5f7521f72e867b
        failing since 49 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)

    2023-04-24T07:06:59.121551  /lava-10100073/1/../bin/lava-test-case
   =


  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/64462aab8a5f7521f72e86cd
        failing since 49 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)

    2023-04-24T07:06:56.250438  /lava-10100073/1/../bin/lava-test-case

    2023-04-24T07:06:56.260831  <8>[   20.552613] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/64462aab8a5f7521f72e86ce
        failing since 49 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)

    2023-04-24T07:06:54.887096  <3>[   19.182228] Bluetooth: hci0: Opcode 0=
x1002 failed: -110

    2023-04-24T07:06:54.893293  <3>[   19.182266] Bluetooth: hci0: command =
0x1002 tx timeout

    2023-04-24T07:06:55.220877  /lava-10100073/1/../bin/lava-test-case

    2023-04-24T07:06:55.231026  <8>[   19.522939] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
odroid-xu3                   | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/644628ca9cd55a12d22e85f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.4/arm/multi_v7_defconfig/gcc-10/lab-collabora/bas=
eline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.4/arm/multi_v7_defconfig/gcc-10/lab-collabora/bas=
eline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644628ca9cd55a12d22e8=
5f2
        new failure (last pass: v6.3-rc1-8-g0ad5ce8407db) =

 =20
