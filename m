Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB098801
	for <chrome-platform@lists.linux.dev>; Wed,  2 Nov 2022 11:40:41 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id p3so16304552pld.10
        for <chrome-platform@lists.linux.dev>; Wed, 02 Nov 2022 04:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+i4Iy+LLUZcCONzrU2V3goqUYz6kEG4dJITxDO7ESa4=;
        b=7broHfujDN2k1SpNqc9WRSonIyA1BRmCFT7FEmn620Xix4FSTmFFDNV7BSk//U2sBc
         PMhLU3r1rQzOSLaaYj4K7H9UQUvGBNrf6k6LJygbkgsYng8suZDsRbmLqAmzX2227VFl
         6jW7elPrLJMtdaJ/pWfiAqTc5+1i0BZz3O2fD+UBxJ5pl8Z0XCZ5uzw5XT2BV6AzF//6
         whk2j3dTj28o3Xjoqvd7U4WI5Wz2zuf8240LjhFVGSQeoiTFHE2yPtHXH7HofnKKDxXS
         ivoj3jaHHAFuz4GSIOkPgjOciO9LlhWIseyenpAFOw40CrixJ6mPaDaOg2ZtTQyPUTof
         /VBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+i4Iy+LLUZcCONzrU2V3goqUYz6kEG4dJITxDO7ESa4=;
        b=ABYSB16Ksah7VHQTXqaXac668QaRwXDZuA8Nwe0uFXuF82O5vRIy3OaLH9swnY7NQ4
         X8k92q2UsEjE1/bC3SDzQ+uBNJ+dIAQwdWKGEYdH121FzkTbQzUVubI97vQjfpqmjrZc
         cTRFG2evt/SsOW1505fZXzs6EjGMSTbYNXXAhvNfyygU5xqR+2hVW1S8KUSrYwg9sHyl
         zWH/a03xsGy4vV47+FYkSPQlxn2+Mht033sMFqHQnnRVHSx/XxtS+QjPNXmGtzFhmfV+
         u91uBobWX+GVIVqxBzaoFykBvIXRJYhDa1VJq6ZzXL9RJOiBec1/YurqbybBznm2ANrQ
         c6sg==
X-Gm-Message-State: ACrzQf1TjEaElhRg/LR/sCvZ7a8E+xAUXsup1QdPnOM401AZFJjkGhMz
	cfmgaGFmlwmo3ZmtdK1s/i7+dMOcW4IwLW/j
X-Google-Smtp-Source: AMsMyM7KzylfFxQs0C7FpZEZagKZHY3cI8buEo48fOjNdSfBGmilf0uM4r6sKOD9aX1BwtrMkywvXA==
X-Received: by 2002:a17:902:8541:b0:17f:6b27:7a75 with SMTP id d1-20020a170902854100b0017f6b277a75mr24280738plo.65.1667389241107;
        Wed, 02 Nov 2022 04:40:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 189-20020a6219c6000000b0056bd4ec964csm8276097pfz.194.2022.11.02.04.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 04:40:40 -0700 (PDT)
Message-ID: <63625738.620a0220.d2e29.f2f7@mx.google.com>
Date: Wed, 02 Nov 2022 04:40:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.1-rc1-12-g52f572342440
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci baseline: 93 runs,
 7 regressions (v6.1-rc1-12-g52f572342440)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 93 runs, 7 regressions (v6.1-rc1-12-=
g52f572342440)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig         | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.1-rc1-12-g52f572342440/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.1-rc1-12-g52f572342440
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      52f5723424401d8d2efb78818d5a38684d70d519 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/63624b80b2ed20ae3be7db56

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-12-g52f572342440/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx=
7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-12-g52f572342440/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx=
7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63624b80b2ed20ae3be7d=
b57
        new failure (last pass: v6.0-rc1-20-g95a789b97c72) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63624e0e2a473c71d7e7db5c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-12-g52f572342440/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-12-g52f572342440/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63624e0e2a473c71d7e7d=
b5d
        failing since 62 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =


  Details:     https://kernelci.org/test/plan/id/636250dd5d99a0d332e7db56

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-12-g52f572342440/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-12-g52f572342440/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/636250dd5d99a0d332e7db78
        failing since 210 days (last pass: v5.17-rc1-10-g0ef49b25b7cc, firs=
t fail: v5.18-rc1-1-gbf84b10d9901d)

    2022-11-02T11:13:24.186090  /lava-7815252/1/../bin/lava-test-case
    2022-11-02T11:13:24.194917  <8>[   40.838184] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/636250dd5d99a0d332e7db9b
        failing since 149 days (last pass: v5.18-rc1-24-gc2d7e384924d, firs=
t fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-11-02T11:13:21.067376  /lava-7815252/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/636250dd5d99a0d332e7db9c
        failing since 149 days (last pass: v5.18-rc1-24-gc2d7e384924d, firs=
t fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-11-02T11:13:18.958610  <8>[   35.600352] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>
    2022-11-02T11:13:19.987504  /lava-7815252/1/../bin/lava-test-case
    2022-11-02T11:13:20.006338  <8>[   36.648495] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/636250dd5d99a0d332e7db9d
        failing since 149 days (last pass: v5.18-rc1-24-gc2d7e384924d, firs=
t fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-11-02T11:13:18.948257  /lava-7815252/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63624cfa62bf868a8ae7db62

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-12-g52f572342440/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-12-g52f572342440/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63624cfa62bf868a8ae7d=
b63
        new failure (last pass: v6.1-rc1-6-g18ffa74c2259) =

 =20
