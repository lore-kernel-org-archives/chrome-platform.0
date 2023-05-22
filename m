Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B91EA9
	for <chrome-platform@lists.linux.dev>; Mon, 22 May 2023 03:53:08 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1ae452c2777so21447285ad.0
        for <chrome-platform@lists.linux.dev>; Sun, 21 May 2023 20:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1684727587; x=1687319587;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=saYOKYLzY5pLmiv4vwXxVtpx7YjehHi74+9TadQxo7Q=;
        b=1O0djGwdBjg1FtLSTr3YtORT359Z/ZUCsSt1jmCF6VjmeXjUnUoPUlEFx+3XsXxXlo
         nuHo7CVwJSjsl0P8/PwWWKv/bWlZubNss2U2THfn5H7TV2vWyWIFECKZu+fJms9BW58s
         Vng5fTX3xsWLRcwER0JSSxoFxM9fLWnKpSd1sKSvBsDGAnF+PBMwUUlbGMJVkA/0DCvB
         tYAeHXeL/aBKdWGX5aDlpOgi4pSDNRo06vLcL5gduKgPIw7Ac9iZ4UZn0oA7LAzCAh8e
         29XttG+6trlSj7O7ZgAM1cv1EU2DIdRI1tWX75Pi2kh6CigRdk1qck0prZhGnAFBAbrY
         Koyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684727587; x=1687319587;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=saYOKYLzY5pLmiv4vwXxVtpx7YjehHi74+9TadQxo7Q=;
        b=cAn6kWlRD7TUsgFVFntVxiE6/4h3vcmqFEK4ppk4uPQhvWb5UmnuGoTI0e0vmXIcnW
         1q4AK55791vQF4QZJvNL9Mr1hsQIjL+dzhWIFzkEGxmC1NUnhR/yvHUgEFLWjaHsQWl7
         gspbOI/UXuvZkVWE8yW/3sAoocWfM/PERm2jMsMbIJrx+XTNsWwhidvFE9hLOg3NFbN5
         7P9DySo0ZJn51Ds30hWsmQu81kd0BTNQt5AVO58OoyYnlHd5bAzIfrmyE1LpsmNO5i6k
         zYAN2YcHWzDX3jEAcKZH4+wjKRl5Uf+0l2pWS7f5eKY5v3iVMpKHjnRCGl9M1BUwS2aB
         vBSQ==
X-Gm-Message-State: AC+VfDzo0Wdp+4ZGUhiRsumoTau3FYh2V0ngi/+I2Aq76L6c/FH99bfT
	bU9nzaqAky4N3DBAkbXO/z9TrA==
X-Google-Smtp-Source: ACHHUZ6Cc4W8vmxNBLFTGKsciinOsx7UXEEMARU6ZqdV/e7Ql2E8V+TnH0B7T7ocXMP9fTkI7aSR6g==
X-Received: by 2002:a17:902:ec8c:b0:1a9:80a0:47ef with SMTP id x12-20020a170902ec8c00b001a980a047efmr12824946plg.20.1684727587487;
        Sun, 21 May 2023 20:53:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u5-20020a17090341c500b001a245b49731sm3677547ple.128.2023.05.21.20.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 20:53:06 -0700 (PDT)
Message-ID: <646ae722.170a0220.ff287.5bd1@mx.google.com>
Date: Sun, 21 May 2023 20:53:06 -0700 (PDT)
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
X-Kernelci-Kernel: v6.4-rc1-3-g4b9abbc132b86
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 81 runs,
 14 regressions (v6.4-rc1-3-g4b9abbc132b86)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 81 runs, 14 regressions (v6.4-rc1-3-=
g4b9abbc132b86)

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

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig                    | 1          =

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
ci/kernel/v6.4-rc1-3-g4b9abbc132b86/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.4-rc1-3-g4b9abbc132b86
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      4b9abbc132b86e2ce65090798186836f48f33382 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646ad838279eb1f9e62e8611

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646ad838279eb1f9e62e8616
        failing since 44 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-05-22T02:49:14.265026  + <8>[   11.712500] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10406941_1.4.2.3.1>

    2023-05-22T02:49:14.265505  set +x

    2023-05-22T02:49:14.373848  / # #

    2023-05-22T02:49:14.476572  export SHELL=3D/bin/sh

    2023-05-22T02:49:14.477396  #

    2023-05-22T02:49:14.579124  / # export SHELL=3D/bin/sh. /lava-10406941/=
environment

    2023-05-22T02:49:14.579986  =


    2023-05-22T02:49:14.681780  / # . /lava-10406941/environment/lava-10406=
941/bin/lava-test-runner /lava-10406941/1

    2023-05-22T02:49:14.683082  =


    2023-05-22T02:49:14.687881  / # /lava-10406941/bin/lava-test-runner /la=
va-10406941/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646ad81818f020829e2e862e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646ad81818f020829e2e8633
        failing since 44 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-05-22T02:48:43.561079  <8>[   10.612067] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10406900_1.4.2.3.1>

    2023-05-22T02:48:43.564309  + set +x

    2023-05-22T02:48:43.669125  #

    2023-05-22T02:48:43.670144  =


    2023-05-22T02:48:43.771821  / # #export SHELL=3D/bin/sh

    2023-05-22T02:48:43.772456  =


    2023-05-22T02:48:43.873709  / # export SHELL=3D/bin/sh. /lava-10406900/=
environment

    2023-05-22T02:48:43.874346  =


    2023-05-22T02:48:43.975778  / # . /lava-10406900/environment/lava-10406=
900/bin/lava-test-runner /lava-10406900/1

    2023-05-22T02:48:43.976994  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646ad822e987662fce2e85e7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646ad822e987662fce2e85ec
        failing since 44 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-05-22T02:48:57.374351  + set +x

    2023-05-22T02:48:57.380507  <8>[   10.251991] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10406903_1.4.2.3.1>

    2023-05-22T02:48:57.489574  / # #

    2023-05-22T02:48:57.590296  export SHELL=3D/bin/sh

    2023-05-22T02:48:57.590995  #

    2023-05-22T02:48:57.692275  / # export SHELL=3D/bin/sh. /lava-10406903/=
environment

    2023-05-22T02:48:57.693002  =


    2023-05-22T02:48:57.794354  / # . /lava-10406903/environment/lava-10406=
903/bin/lava-test-runner /lava-10406903/1

    2023-05-22T02:48:57.795409  =


    2023-05-22T02:48:57.800432  / # /lava-10406903/bin/lava-test-runner /la=
va-10406903/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646ad825e987662fce2e8636

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646ad825e987662fce2e863b
        failing since 44 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-05-22T02:48:56.573325  + set +x<8>[   10.198540] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10406956_1.4.2.3.1>

    2023-05-22T02:48:56.573482  =


    2023-05-22T02:48:56.676402  #

    2023-05-22T02:48:56.676795  =


    2023-05-22T02:48:56.777587  / # #export SHELL=3D/bin/sh

    2023-05-22T02:48:56.777861  =


    2023-05-22T02:48:56.878500  / # export SHELL=3D/bin/sh. /lava-10406956/=
environment

    2023-05-22T02:48:56.878780  =


    2023-05-22T02:48:56.979421  / # . /lava-10406956/environment/lava-10406=
956/bin/lava-test-runner /lava-10406956/1

    2023-05-22T02:48:56.979860  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646ad83769307f7b552e8618

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646ad83769307f7b552e861d
        failing since 44 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-05-22T02:49:08.887517  + <8>[   11.325615] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10406906_1.4.2.3.1>

    2023-05-22T02:49:08.887599  set +x

    2023-05-22T02:49:08.991982  / # #

    2023-05-22T02:49:09.092587  export SHELL=3D/bin/sh

    2023-05-22T02:49:09.092781  #

    2023-05-22T02:49:09.193321  / # export SHELL=3D/bin/sh. /lava-10406906/=
environment

    2023-05-22T02:49:09.193532  =


    2023-05-22T02:49:09.294178  / # . /lava-10406906/environment/lava-10406=
906/bin/lava-test-runner /lava-10406906/1

    2023-05-22T02:49:09.294433  =


    2023-05-22T02:49:09.299107  / # /lava-10406906/bin/lava-test-runner /la=
va-10406906/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/646ad8a107944ae42a2e8604

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/base=
line-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/base=
line-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646ad8a107944ae42a2e8609
        failing since 10 days (last pass: v6.4-rc1, first fail: v6.4-rc1-1-=
gc9f9c6c875d14)

    2023-05-22T02:50:50.651317  + set[   15.134968] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 956032_1.5.2.3.1>
    2023-05-22T02:50:50.651472   +x
    2023-05-22T02:50:50.757210  / # #
    2023-05-22T02:50:50.858668  export SHELL=3D/bin/sh
    2023-05-22T02:50:50.859077  #
    2023-05-22T02:50:50.960233  / # export SHELL=3D/bin/sh. /lava-956032/en=
vironment
    2023-05-22T02:50:50.960672  =

    2023-05-22T02:50:51.061910  / # . /lava-956032/environment/lava-956032/=
bin/lava-test-runner /lava-956032/1
    2023-05-22T02:50:51.062716  =

    2023-05-22T02:50:51.065906  / # /lava-956032/bin/lava-test-runner /lava=
-956032/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/646ad97c9ccbffb27a2e867f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/arm64/defconfig/gcc-10/lab-pengutronix/baseline-im=
x8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/arm64/defconfig/gcc-10/lab-pengutronix/baseline-im=
x8mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ad97c9ccbffb27a2e8=
680
        new failure (last pass: v6.4-rc1-1-gc9f9c6c875d14) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646ad824fdae1bbfe82e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646ad824fdae1bbfe82e85eb
        failing since 44 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-05-22T02:48:55.466899  <8>[   11.895741] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10406925_1.4.2.3.1>

    2023-05-22T02:48:55.575293  / # #

    2023-05-22T02:48:55.677398  export SHELL=3D/bin/sh

    2023-05-22T02:48:55.678190  #

    2023-05-22T02:48:55.779621  / # export SHELL=3D/bin/sh. /lava-10406925/=
environment

    2023-05-22T02:48:55.780604  =


    2023-05-22T02:48:55.882236  / # . /lava-10406925/environment/lava-10406=
925/bin/lava-test-runner /lava-10406925/1

    2023-05-22T02:48:55.883512  =


    2023-05-22T02:48:55.888619  / # /lava-10406925/bin/lava-test-runner /la=
va-10406925/1

    2023-05-22T02:48:55.894762  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/646ade8c0ab7b4d8a72e8618

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646ade8c0ab7b4d8a72e8=
619
        failing since 13 days (last pass: tag-chrome-platform-for-v6.4, fir=
st fail: v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/646adde2c24bc12b652e8601

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646adde2c24bc12b652e8=
602
        failing since 13 days (last pass: tag-chrome-platform-for-v6.4, fir=
st fail: v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/646add38a4600c9bbd2e861e

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646add38a4600c9=
bbd2e8675
        failing since 13 days (last pass: tag-chrome-platform-for-v6.4, fir=
st fail: v6.4-rc1)
        2 lines

    2023-05-22T03:09:43.545157  kern  :alert : Mem abort in<8>[   19.069155=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D12>

    2023-05-22T03:09:43.545258  fo:

    2023-05-22T03:09:43.549377  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-22T03:09:43.555099  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-22T03:09:43.558724  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-22T03:09:43.561987  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-22T03:09:43.567413  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-22T03:09:43.570679  kern  :alert : Data abort info:

    2023-05-22T03:09:43.574594  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-22T03:09:43.578698  kern  :alert :   CM =3D 0, WnR =3D 0
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646add38a4600c9=
bbd2e8676
        failing since 13 days (last pass: tag-chrome-platform-for-v6.4, fir=
st fail: v6.4-rc1)
        12 lines

    2023-05-22T03:09:43.532828  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/646ad9a283d25f6eb32e867b

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/arm64/defconfig/gcc-10/lab-collabora/baseline-rk33=
99-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/arm64/defconfig/gcc-10/lab-collabora/baseline-rk33=
99-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230512.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646ad9a283d25f6=
eb32e8682
        failing since 13 days (last pass: tag-chrome-platform-for-v6.4, fir=
st fail: v6.4-rc1)
        2 lines

    2023-05-22T02:55:16.834635  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-22T02:55:16.835217  kern  :emerg : Code: 9403b910 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-22T02:55:16.835609  <8>[   23.743609] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-22T02:55:16.835979  + set +x

    2023-05-22T02:55:16.836336  <8>[   23.745816] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10406988_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646ad9a283d25f6=
eb32e8683
        failing since 13 days (last pass: tag-chrome-platform-for-v6.4, fir=
st fail: v6.4-rc1)
        12 lines

    2023-05-22T02:55:16.805499  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-22T02:55:16.806076  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-05-22T02:55:16.806462  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000078d4c000

    2023-05-22T02:55:16.806820  kern  :alert : [0000000000000008] pgd=3D080=
0000078d52003, p4d=3D0800000078d52003, pud=3D0800000078d53003, pmd=3D000000=
0000000000

    2023-05-22T02:55:16.807166  <8>[   23.717334] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =20
