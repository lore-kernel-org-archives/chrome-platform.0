Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4A915CC
	for <chrome-platform@lists.linux.dev>; Mon,  8 May 2023 12:44:20 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5144a9c11c7so4191425a12.2
        for <chrome-platform@lists.linux.dev>; Mon, 08 May 2023 05:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683549859; x=1686141859;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/1sjgwW8CSPDqPM09ko2+CZzx3PDhKzkSlCdfQ7M768=;
        b=rRiCgPEJ8BuZNqWSapHpefMFyvDhAo+AVojKHHANjNZc1YMj7NvRFhn+zzWPlKbCJO
         sfjxpJc4spmKKsWCOmO8ZQnbET6BBp4JWiBKnRBGUyS6MXBp5p7ZapWwz4wHaCJRTdeN
         IAPaU5zEZ3OTak0TRG4NFkgZUEmCiYeF3Vds8oJHguuf2VuIUQqmNYjPKIbt8oYGmRu5
         b2kLjPbHgWwL1zWnr0D35H/2ntEz3pAzgzmaD0cQMg/c6EH+ePJY76ceNQD35tKK9Lqa
         NakBj/Gvql9si6xFNBo+D2Sdb0UK8VTQ1vUr9d2xN/Yajk4c7daaMkPp1k41CSgO4JV5
         HPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683549859; x=1686141859;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/1sjgwW8CSPDqPM09ko2+CZzx3PDhKzkSlCdfQ7M768=;
        b=bgLCR+Hw1OfOkxHdn/F6dgBViyOK52ya/LoNkrt53+c/GDgaDzD/RkpPuSdRk1YQKK
         ZWYvfiWXx7YEgiVbv/aLQthSaikCmMtC+vDtUjaDsIKt2gSmeR6tg3NkOnWt2ENsurd5
         9cwsYfyPpAogTlAaeYjttMVBCrFa4ejwfASxwhuVCJBmo3PedYRJi6YZecLgTpmCP2gJ
         jMlHV6kPdRIankc5YW8pqTUxz/wlYdsC0ZmYExGYu9aNcOjYPpNY3vkvJ3YZEQV+Ou9c
         B/pwmQqFp8zgy/NLcUUpRGixJoaMqloI6wNhGk9okCaesETp1npwr/OYLqITrLqZf+MN
         FpRw==
X-Gm-Message-State: AC+VfDxNVLD86AcBJGzKsK/VxD5Enr3F+rSuqOicJ9wieu4tTH7On0aR
	Ec+2YyGaB6GnWXp8SfBp5B5KcA==
X-Google-Smtp-Source: ACHHUZ6N62j9pjd2PEhWTdUrVGFpILU/qaNL9NqKXt/ZiowGFJcLTfBQMoD/5pbXyKJzUKWMEBKbrQ==
X-Received: by 2002:a17:90a:d681:b0:250:7347:39eb with SMTP id x1-20020a17090ad68100b00250734739ebmr4635856pju.20.1683549859434;
        Mon, 08 May 2023 05:44:19 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d13-20020a17090a498d00b0024dd8cc25e6sm12446715pjh.31.2023.05.08.05.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 05:44:18 -0700 (PDT)
Message-ID: <6458eea2.170a0220.3ee87.83aa@mx.google.com>
Date: Mon, 08 May 2023 05:44:18 -0700 (PDT)
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
X-Kernelci-Kernel: v6.4-rc1
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 79 runs,
 14 regressions (v6.4-rc1)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 79 runs, 14 regressions (v6.4-rc1)

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

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

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
ci/kernel/v6.4-rc1/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.4-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      ac9a78681b921877518763ba0e89202254349d1b =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6458e33ae73be68b232e8630

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458e33ae73be68b232e8635
        failing since 30 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-05-08T11:55:23.609458  + set<8>[   11.518395] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10237524_1.4.2.3.1>

    2023-05-08T11:55:23.609625   +x

    2023-05-08T11:55:23.713939  / # #

    2023-05-08T11:55:23.814614  export SHELL=3D/bin/sh

    2023-05-08T11:55:23.814841  #

    2023-05-08T11:55:23.915418  / # export SHELL=3D/bin/sh. /lava-10237524/=
environment

    2023-05-08T11:55:23.915633  =


    2023-05-08T11:55:24.016206  / # . /lava-10237524/environment/lava-10237=
524/bin/lava-test-runner /lava-10237524/1

    2023-05-08T11:55:24.016639  =


    2023-05-08T11:55:24.021749  / # /lava-10237524/bin/lava-test-runner /la=
va-10237524/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6458e345ce38fff6802e8608

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458e346ce38fff6802e860d
        failing since 30 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-05-08T11:55:29.200521  <8>[   10.764888] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10237558_1.4.2.3.1>

    2023-05-08T11:55:29.203297  + set +x

    2023-05-08T11:55:29.305117  =


    2023-05-08T11:55:29.405746  / # #export SHELL=3D/bin/sh

    2023-05-08T11:55:29.405939  =


    2023-05-08T11:55:29.506453  / # export SHELL=3D/bin/sh. /lava-10237558/=
environment

    2023-05-08T11:55:29.506709  =


    2023-05-08T11:55:29.607306  / # . /lava-10237558/environment/lava-10237=
558/bin/lava-test-runner /lava-10237558/1

    2023-05-08T11:55:29.607661  =


    2023-05-08T11:55:29.612552  / # /lava-10237558/bin/lava-test-runner /la=
va-10237558/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6458e4286abbb392a92e85f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-dell-latitude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-dell-latitude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458e4286abbb392a92e8=
5f1
        new failure (last pass: tag-chrome-platform-for-v6.4) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6458e330dd715a90892e85ee

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458e330dd715a90892e85f3
        failing since 30 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-05-08T11:55:19.601941  + set +x

    2023-05-08T11:55:19.608349  <8>[   10.356004] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10237586_1.4.2.3.1>

    2023-05-08T11:55:19.713195  / # #

    2023-05-08T11:55:19.813710  export SHELL=3D/bin/sh

    2023-05-08T11:55:19.813888  #

    2023-05-08T11:55:19.914386  / # export SHELL=3D/bin/sh. /lava-10237586/=
environment

    2023-05-08T11:55:19.914558  =


    2023-05-08T11:55:20.015040  / # . /lava-10237586/environment/lava-10237=
586/bin/lava-test-runner /lava-10237586/1

    2023-05-08T11:55:20.015372  =


    2023-05-08T11:55:20.019703  / # /lava-10237586/bin/lava-test-runner /la=
va-10237586/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6458e323e73be68b232e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458e324e73be68b232e85eb
        failing since 30 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-05-08T11:55:00.809680  <8>[    9.941192] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10237549_1.4.2.3.1>

    2023-05-08T11:55:00.812890  + set +x

    2023-05-08T11:55:00.914088  #

    2023-05-08T11:55:01.014900  / # #export SHELL=3D/bin/sh

    2023-05-08T11:55:01.015099  =


    2023-05-08T11:55:01.115616  / # export SHELL=3D/bin/sh. /lava-10237549/=
environment

    2023-05-08T11:55:01.115806  =


    2023-05-08T11:55:01.216295  / # . /lava-10237549/environment/lava-10237=
549/bin/lava-test-runner /lava-10237549/1

    2023-05-08T11:55:01.216590  =


    2023-05-08T11:55:01.221735  / # /lava-10237549/bin/lava-test-runner /la=
va-10237549/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6458e340dd715a90892e8619

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458e340dd715a90892e861e
        failing since 30 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-05-08T11:55:27.621969  + set<8>[   11.511706] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10237564_1.4.2.3.1>

    2023-05-08T11:55:27.622061   +x

    2023-05-08T11:55:27.726692  / # #

    2023-05-08T11:55:27.827412  export SHELL=3D/bin/sh

    2023-05-08T11:55:27.827618  #

    2023-05-08T11:55:27.928212  / # export SHELL=3D/bin/sh. /lava-10237564/=
environment

    2023-05-08T11:55:27.928426  =


    2023-05-08T11:55:28.029017  / # . /lava-10237564/environment/lava-10237=
564/bin/lava-test-runner /lava-10237564/1

    2023-05-08T11:55:28.029345  =


    2023-05-08T11:55:28.034091  / # /lava-10237564/bin/lava-test-runner /la=
va-10237564/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6458e2c2b80d0625e92e85f0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-qsrb.t=
xt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-qsrb.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458e2c2b80d0625e92e85f5
        failing since 14 days (last pass: v6.3-rc1-8-g0ad5ce8407db, first f=
ail: tag-chrome-platform-for-v6.4)

    2023-05-08T11:53:26.915783  + set +x
    2023-05-08T11:53:26.916035  [   13.098595] <LAVA_SIGNAL_ENDRUN 0_dmesg =
943362_1.5.2.3.1>
    2023-05-08T11:53:27.023503  / # #
    2023-05-08T11:53:27.125319  export SHELL=3D/bin/sh
    2023-05-08T11:53:27.125750  #
    2023-05-08T11:53:27.226828  / # export SHELL=3D/bin/sh. /lava-943362/en=
vironment
    2023-05-08T11:53:27.227314  =

    2023-05-08T11:53:27.328694  / # . /lava-943362/environment/lava-943362/=
bin/lava-test-runner /lava-943362/1
    2023-05-08T11:53:27.329453  =

    2023-05-08T11:53:27.332600  / # /lava-943362/bin/lava-test-runner /lava=
-943362/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6458e330e73be68b232e8616

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baselin=
e-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458e330e73be68b232e861b
        failing since 30 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first =
fail: v6.3-rc1-5-gd946c9118047)

    2023-05-08T11:55:15.617817  <8>[   12.244253] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10237512_1.4.2.3.1>

    2023-05-08T11:55:15.722260  / # #

    2023-05-08T11:55:15.822954  export SHELL=3D/bin/sh

    2023-05-08T11:55:15.823167  #

    2023-05-08T11:55:15.923679  / # export SHELL=3D/bin/sh. /lava-10237512/=
environment

    2023-05-08T11:55:15.923924  =


    2023-05-08T11:55:16.024451  / # . /lava-10237512/environment/lava-10237=
512/bin/lava-test-runner /lava-10237512/1

    2023-05-08T11:55:16.024773  =


    2023-05-08T11:55:16.029429  / # /lava-10237512/bin/lava-test-runner /la=
va-10237512/1

    2023-05-08T11:55:16.035797  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6458e5e90ebc49ebc72e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt81=
83-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt81=
83-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458e5e90ebc49ebc72e8=
5e7
        new failure (last pass: tag-chrome-platform-for-v6.4) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6458e5cffb6398eb392e85f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt81=
92-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt81=
92-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458e5cffb6398eb392e8=
5f9
        new failure (last pass: tag-chrome-platform-for-v6.4) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/6458e4a4acf0cc37a42e8607

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk33=
99-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk33=
99-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6458e4a4acf0cc3=
7a42e865e
        new failure (last pass: tag-chrome-platform-for-v6.4)
        2 lines

    2023-05-08T12:01:05.564250  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-08T12:01:05.570868  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-08T12:01:05.573552  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-08T12:01:05.576703  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-08T12:01:05.582830  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-08T12:01:05.585896  kern  :alert : Data abort info:

    2023-05-08T12:01:05.589959  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-08T12:01:05.594017  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-05-08T12:01:05.606600  kern  :alert : user pgtable: 4k pages<8>[  =
 19.329453] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6458e4a4acf0cc3=
7a42e865f
        new failure (last pass: tag-chrome-platform-for-v6.4)
        12 lines

    2023-05-08T12:01:05.508928  <8>[   19.236100] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-05-08T12:01:05.547323  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-08T12:01:05.559869  kern  :alert : Mem abort in<8>[   19.284902=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D12>

    2023-05-08T12:01:05.560019  fo:
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6458e497a9498cc3b12e8600

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6458e497a9498cc=
3b12e8607
        new failure (last pass: tag-chrome-platform-for-v6.4)
        2 lines

    2023-05-08T12:01:06.838681  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-08T12:01:06.838873  kern  :emerg : Code: 97fd0510 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-08T12:01:06.838965  <8>[   18.944375] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-08T12:01:06.839053  + set +x

    2023-05-08T12:01:06.839137  <8>[   18.946459] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10237824_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6458e497a9498cc=
3b12e8608
        new failure (last pass: tag-chrome-platform-for-v6.4)
        12 lines

    2023-05-08T12:01:06.792422  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-08T12:01:06.792514  kern  :alert : Mem abort info:

    2023-05-08T12:01:06.792584  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-08T12:01:06.792651  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-08T12:01:06.792716  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-08T12:01:06.792794  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-08T12:01:06.792870  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-08T12:01:06.792932  kern  :alert : Data abort info:

    2023-05-08T12:01:06.792992  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-08T12:01:06.793051  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =20
