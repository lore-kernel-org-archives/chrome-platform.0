Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1D4A94F
	for <chrome-platform@lists.linux.dev>; Tue, 31 Jan 2023 21:46:31 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id on9-20020a17090b1d0900b002300a96b358so18169pjb.1
        for <chrome-platform@lists.linux.dev>; Tue, 31 Jan 2023 13:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E7LFzEQw2azZOUrorbQxCrMGeWo64I9qHkeA88YDy6U=;
        b=goi83ZIcev39lc31LS/lZiyh97Yffe8JkYPo+KFGLK1SoH8qPbxacJdk38nMnGhdAl
         7N8BR4MZ72KCTkqeDI9nb3n8bKXNLh/7xVMoc77KtAsE/zLtZUXxUJHDoxX6e5Uy4M5I
         OfMSTNDpuP9iX+kz3GEAG8L+80zQWNQeTKJfwwt18/6tRp+SC9E8HK7Z+sWhcuKOUGFm
         s7o2a1RCGOouTatUFl9zuTBUO9rW+IF4uHoIJZ78lxXUPYy2/ynNtEG2SGxlcTJ7hZST
         1F51f263rSodafOMh+lNloj0FkQvdjqWhFMw/eAz7LxRb8V7VkIVIjylAsTAY0io4+18
         0oXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7LFzEQw2azZOUrorbQxCrMGeWo64I9qHkeA88YDy6U=;
        b=QpPtidfdN1XGxavUQw6d9RbHfHFdkp0POP+hO9xY2g9P2TtXtTOG7+DzAfgkCjKvhd
         l49fO25J8duWjLxVjV1tN9kCZ1cTWr/Z3TQSP6U9X5XkURJm4ruKaIJrc9u+vL8SECOb
         Srxe7qq7TqQOhjkqNdzU6kOmM1U8cpIGrCH63tqful0MzcSFfuYm4k8wsOiweiOCMfSN
         N8JnggBWyKazvss1K7OKEa1259hF7R0gVr0yf6wTEE30QvFjqMvcuONIfr3l/z3LU89Z
         HvAVjBIQHELP2lamRLkWzp0YBQfNf2K0E6d4DEl4FxnkrXn70IGk3F52xiHtJuUjZWnv
         72QQ==
X-Gm-Message-State: AO0yUKUd0RtTl1O5xNxEdD6LkL+yhciO3C49/lao48IdfJxaNz/OzsCq
	HzqB0gF4fZoHbQChP0r1tUALSDNNW01vUYkRCpso1A==
X-Google-Smtp-Source: AK7set/qITL0vCnGVg9Q8YzMheKhVuLo3VR76/Z+dMe3vQaWSDa7EuZfrukeb4zHxCZKRccUqQtYvg==
X-Received: by 2002:a17:90b:1e43:b0:22c:a1e:b10f with SMTP id pi3-20020a17090b1e4300b0022c0a1eb10fmr26702435pjb.7.1675201590860;
        Tue, 31 Jan 2023 13:46:30 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m3-20020a17090a5a4300b00226156cf039sm11277793pji.44.2023.01.31.13.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 13:46:30 -0800 (PST)
Message-ID: <63d98c36.170a0220.43d6f.2e50@mx.google.com>
Date: Tue, 31 Jan 2023 13:46:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Kernel: v6.2-rc1-34-gfcc9e52d591e
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 110 runs,
 3 regressions (v6.2-rc1-34-gfcc9e52d591e)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 110 runs, 3 regressions (v6.2-rc1-34=
-gfcc9e52d591e)

Regressions Summary
-------------------

platform        | arch  | lab             | compiler | defconfig          |=
 regressions
----------------+-------+-----------------+----------+--------------------+=
------------
imx53-qsrb      | arm   | lab-pengutronix | gcc-10   | multi_v7_defconfig |=
 1          =

rk3328-rock64   | arm64 | lab-baylibre    | gcc-10   | defconfig          |=
 1          =

stm32mp157c-dk2 | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.2-rc1-34-gfcc9e52d591e/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.2-rc1-34-gfcc9e52d591e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      fcc9e52d591ee65aca385c3f426f7e943ee10ccc =



Test Regressions
---------------- =



platform        | arch  | lab             | compiler | defconfig          |=
 regressions
----------------+-------+-----------------+----------+--------------------+=
------------
imx53-qsrb      | arm   | lab-pengutronix | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/63d982670ebe5a0f28915ebc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-34-gfcc9e52d591e/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/base=
line-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-34-gfcc9e52d591e/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/base=
line-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d982670ebe5a0f28915ec1
        new failure (last pass: v6.1-rc1-16-gd74fa18ce5f0)

    2023-01-31T21:04:17.548845  + set +x
    2023-01-31T21:04:17.549129  [   12.903497] <LAVA_SIGNAL_ENDRUN 0_dmesg =
893606_1.5.2.3.1>
    2023-01-31T21:04:17.657029  / # #
    2023-01-31T21:04:17.758632  export SHELL=3D/bin/sh
    2023-01-31T21:04:17.759073  #
    2023-01-31T21:04:17.860146  / # export SHELL=3D/bin/sh. /lava-893606/en=
vironment
    2023-01-31T21:04:17.860678  =

    2023-01-31T21:04:17.961965  / # . /lava-893606/environment/lava-893606/=
bin/lava-test-runner /lava-893606/1
    2023-01-31T21:04:17.962520  =

    2023-01-31T21:04:17.965721  / # /lava-893606/bin/lava-test-runner /lava=
-893606/1 =

    ... (12 line(s) more)  =

 =



platform        | arch  | lab             | compiler | defconfig          |=
 regressions
----------------+-------+-----------------+----------+--------------------+=
------------
rk3328-rock64   | arm64 | lab-baylibre    | gcc-10   | defconfig          |=
 1          =


  Details:     https://kernelci.org/test/plan/id/63d9820080c0a1abf6915ef7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-34-gfcc9e52d591e/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk332=
8-rock64.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-34-gfcc9e52d591e/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk332=
8-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9820080c0a1abf6915efc
        new failure (last pass: v6.0-rc1-19-gd378c6f0456c)

    2023-01-31T21:02:37.386803  [   29.511632] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3257226_1.5.2.4.1>
    2023-01-31T21:02:37.491975  =

    2023-01-31T21:02:37.593547  / # #export SHELL=3D/bin/sh
    2023-01-31T21:02:37.593973  =

    2023-01-31T21:02:37.695368  / # export SHELL=3D/bin/sh. /lava-3257226/e=
nvironment
    2023-01-31T21:02:37.695927  =

    2023-01-31T21:02:37.797289  / # . /lava-3257226/environment/lava-325722=
6/bin/lava-test-runner /lava-3257226/1
    2023-01-31T21:02:37.797946  =

    2023-01-31T21:02:37.801493  / # /lava-3257226/bin/lava-test-runner /lav=
a-3257226/1
    2023-01-31T21:02:37.835206  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform        | arch  | lab             | compiler | defconfig          |=
 regressions
----------------+-------+-----------------+----------+--------------------+=
------------
stm32mp157c-dk2 | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/63d9814bbe25898aa5915ed2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-34-gfcc9e52d591e/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baselin=
e-stm32mp157c-dk2.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-34-gfcc9e52d591e/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baselin=
e-stm32mp157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9814bbe25898aa5915ed7
        new failure (last pass: v5.19-rc1-38-g15288cf9f149)

    2023-01-31T20:59:50.474678  <8>[   12.609283] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3257189_1.5.2.4.1>
    2023-01-31T20:59:50.578896  / # #
    2023-01-31T20:59:50.680295  export SHELL=3D/bin/sh
    2023-01-31T20:59:50.680619  #
    2023-01-31T20:59:50.781737  / # export SHELL=3D/bin/sh. /lava-3257189/e=
nvironment
    2023-01-31T20:59:50.782078  =

    2023-01-31T20:59:50.883028  / # . /lava-3257189/environment/lava-325718=
9/bin/lava-test-runner /lava-3257189/1
    2023-01-31T20:59:50.883544  =

    2023-01-31T20:59:50.887791  / # /lava-3257189/bin/lava-test-runner /lav=
a-3257189/1
    2023-01-31T20:59:50.964719  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =20
