Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E6B1FAA
	for <chrome-platform@lists.linux.dev>; Thu, 21 Jul 2022 10:45:36 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id f11so1440573plr.4
        for <chrome-platform@lists.linux.dev>; Thu, 21 Jul 2022 03:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9bK1E1vUmfZIh/I/1LT0D9JoRgY1LCEVbyOz0ZieZB0=;
        b=Oxivs2yWd1muhNbcFJFRApks3GwTurPeg5zSlC7hKKlq6WtQ0tU0DtzPBihRI8kRgC
         Cg1a3o50+dVTYQMKNk3s10B38jSL0fMMTc41bz0yfLbRcazyFPyvGJCESAXt/nfwAH/X
         psO5oH1SqX+qXlrBIqiKoMTLJ2600Jt6SJfwA5dx5adJnptYF+I45sWvOWlwxot2ilQx
         DZVu7yedehZjC02JfNWUdpDEZghynpyH1GOrlPLnSB2/ccAb2VUu2BTAjaP5NsxCqHUU
         sP5OGjP6fs7G7STjm0a4RA3uHWfZClXvu8J5R3xIVGgsR/gVagqQisPYdIzslpGn0y95
         Sp8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9bK1E1vUmfZIh/I/1LT0D9JoRgY1LCEVbyOz0ZieZB0=;
        b=5emr2nZoLXUzdwMbnJoWjhh2woqePIkWdAYMPEs7j/Cl3Glm+Hekmn2KBMVQFkL5nS
         tHMRYCoNrYOeu/DeofVfMtZ/UICWG/+JgcRfYol5yj/3tA7Ri/VswWItt1K1PyFQeIDg
         pJpP2Se6GqzSHRk1h2JgwRPAYGuLW6b3ozZRIfmhYl8d8Ws9GaNhqYKIhZd8O+L3H1uQ
         nAAIO+0HXp02U+j6btuS7O7x4LLlUxqX582cJP6oA9FxMd3Z6q55g5gJv1nfIpDEWJfv
         aSvkDrbCsGeFWZErShvsJmxJDeAZfpJghm3YiKvBpuatunRkHsDntz/pQtSmcnrSP9e3
         T3MQ==
X-Gm-Message-State: AJIora9k+HUsQOVicDsPW/xsJfWcgR8/gAiS/CS2B+r2s6Zt7VYEuk31
	8XjhN5lA89Um5VMTCrbNfj1GNA==
X-Google-Smtp-Source: AGRyM1vo7nfbJm06i6aOgtNGrUlchgYtNIFEKDzjKYyuCq6kWSkdz+znPJcWHS+l/GjjSI4mMqw7vw==
X-Received: by 2002:a17:90a:b703:b0:1dd:1e2f:97d7 with SMTP id l3-20020a17090ab70300b001dd1e2f97d7mr10513821pjr.62.1658400336008;
        Thu, 21 Jul 2022 03:45:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q9-20020a17090a7a8900b001f219c5ae7dsm1121318pjf.31.2022.07.21.03.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 03:45:35 -0700 (PDT)
Message-ID: <62d92e4f.1c69fb81.d11b.1a6d@mx.google.com>
Date: Thu, 21 Jul 2022 03:45:35 -0700 (PDT)
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
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc1-60-g088b8107e603
Subject: chrome-platform/for-kernelci baseline: 99 runs,
 9 regressions (v5.19-rc1-60-g088b8107e603)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 99 runs, 9 regressions (v5.19-rc1-60=
-g088b8107e603)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig         | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =

sun50i-h6-pine-h64           | arm64 | lab-baylibre  | gcc-10   | defconfig=
                  | 1          =

sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig         | 1          =

sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig         | 1          =

tegra124-nyan-big            | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig         | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.19-rc1-60-g088b8107e603/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.19-rc1-60-g088b8107e603
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      088b8107e603c7561ae41ebe65d98d2981d4f122 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/62d92802719eda356adaf095

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-60-g088b8107e603/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseli=
ne-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-60-g088b8107e603/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseli=
ne-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d92802719eda356adaf=
096
        failing since 45 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =


  Details:     https://kernelci.org/test/plan/id/62d926a10c6be4fbcedaf056

  Results:     84 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-60-g088b8107e603/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-60-g088b8107e603/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62d926a10c6be4fbcedaf078
        failing since 106 days (last pass: v5.17-rc1-10-g0ef49b25b7cc, firs=
t fail: v5.18-rc1-1-gbf84b10d9901d)

    2022-07-21T10:12:34.234958  <8>[   54.047799] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-07-21T10:12:35.239711  /lava-6861047/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/62d926a10c6be4fbcedaf09b
        failing since 45 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-07-21T10:12:33.590955  /lava-6861047/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62d926a10c6be4fbcedaf09c
        failing since 45 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-07-21T10:12:31.568045  <8>[   51.378144] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>
    2022-07-21T10:12:32.571376  /lava-6861047/1/../bin/lava-test-case
    2022-07-21T10:12:32.603255  <8>[   52.396720] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/62d926a10c6be4fbcedaf09e
        failing since 45 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-07-21T10:12:30.531265  <8>[   50.343849] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dpass>
    2022-07-21T10:12:30.632115  <4>[   50.440992] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-07-21T10:12:31.552742  /lava-6861047/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-baylibre  | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/62d924b6824629d378daf06a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-60-g088b8107e603/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun5=
0i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-60-g088b8107e603/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun5=
0i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d924b6824629d378daf=
06b
        failing since 1 day (last pass: v5.19-rc1-41-gc30628bce72f, first f=
ail: v5.19-rc1-58-gad1e2226017a9) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/62d92428829327238cdaf08f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-60-g088b8107e603/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseli=
ne-sun8i-h2-plus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-60-g088b8107e603/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseli=
ne-sun8i-h2-plus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d92428829327238cdaf=
090
        failing since 45 days (last pass: v5.19-rc1-5-g4a0e708bb23fc, first=
 fail: v5.19-rc1-6-gc1db0861e8d02) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/62d923872752536ae0daf057

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-60-g088b8107e603/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseli=
ne-sun8i-h3-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-60-g088b8107e603/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseli=
ne-sun8i-h3-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d923872752536ae0daf=
058
        new failure (last pass: v5.19-rc1-58-gad1e2226017a9) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
tegra124-nyan-big            | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/62d92b43a2ad120b13daf058

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-60-g088b8107e603/arm/multi_v7_defconfig/gcc-10/lab-collabora/basel=
ine-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-60-g088b8107e603/arm/multi_v7_defconfig/gcc-10/lab-collabora/basel=
ine-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d92b43a2ad120b13daf=
059
        failing since 45 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc) =

 =20
