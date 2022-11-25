Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C6B2CA4
	for <chrome-platform@lists.linux.dev>; Fri, 25 Nov 2022 11:18:35 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id g10so3706773plo.11
        for <chrome-platform@lists.linux.dev>; Fri, 25 Nov 2022 03:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nxnuj4Y/RaAOKIqXSvA2pOYDEyTOBPohjSr7RPVunns=;
        b=Eqs3anxeJzVB8wfr0MGA+68eqXonpmzZJyQl3RMpGKvcueCXP+pvU//17r4pCN8G9k
         Q1Pkyieb/hIUhW4lfHHmIR8eIkX0BP7hZvfUoFOX4ehpAiBfKrwJgvsVYXlbVDH0E++u
         l8KLsWrbb+7jjipZidj+LdY8avQBA/Bydr84Uq9if7k0f7bWvdO2S2Hh7kgUn2P/ACXK
         ZkD3VOxDsyNA3CQ/ku2z7Q3RQXwdb7VNQRRI6SUYZxGglhy14/OynOlE8X37NObRdS34
         r4umuSYWlGthHN3plPPBuCOeNjKfrhPKAMyGL8IOWj4RRBpYjekAap4gIvgfCncX5KRM
         gSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxnuj4Y/RaAOKIqXSvA2pOYDEyTOBPohjSr7RPVunns=;
        b=KRqXDgYpFMhNZqIIqeuELmfN7zfR9zuqiKwmnVyIBvriZpyS3nw1EUp+F8vrOZBi+x
         ktjEOhLECeXtOuyj82jf9yP5AHLhBYQdFEK7hUh1Mz3WJAtlBi0mzxm258N7IvcRH5dL
         qyOedGr1o6o0s9Bg0DEubEVm7ajzWYTYoc2mjWcL0NHDqfKKvgqM5Omt9OuiVuQh1CnM
         Hw2L2MzixorVjHCKzAccpn/UGGZgNIncPhXkwhXa2O34DMmidPaB+4SViiq4EZZF9lt5
         J25okAOBtsrsQF2ek3NdNNQSJeY7En5Rc1qpJaFKHlJcc/7vX3DUHsV+KNmPV/KZo5zo
         jl7g==
X-Gm-Message-State: ANoB5pk7AFRGXsZ4ZQCke/krBr+V86dbAubiUOJI7+0R2jQ0L6mU3mdh
	XIGyEpT0EUPCpoHU0FlbVV90USFDhEHutOvFd4o=
X-Google-Smtp-Source: AA0mqf5BNa/tNX/Wa1kGThRA374Te7uOwdLVbf0bIo/7St3wEXjiUoCrN+hrfcMwXIsZ8vkg9Ra2CA==
X-Received: by 2002:a17:90b:ed1:b0:210:a844:217c with SMTP id gz17-20020a17090b0ed100b00210a844217cmr41091132pjb.150.1669375114618;
        Fri, 25 Nov 2022 03:18:34 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e8-20020a17090301c800b00186b138706fsm3195580plh.13.2022.11.25.03.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 03:18:34 -0800 (PST)
Message-ID: <6380a48a.170a0220.9c665.4291@mx.google.com>
Date: Fri, 25 Nov 2022 03:18:34 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-kernelci
X-Kernelci-Kernel: v6.1-rc1-15-g6c7053bf3514
X-Kernelci-Report-Type: test
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci baseline: 58 runs,
 7 regressions (v6.1-rc1-15-g6c7053bf3514)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 58 runs, 7 regressions (v6.1-rc1-15-=
g6c7053bf3514)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig         | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
                  | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.1-rc1-15-g6c7053bf3514/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.1-rc1-15-g6c7053bf3514
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      6c7053bf3514b2a9684d5638e98351bde1c94951 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/63809a5787fb94c1042abd26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-15-g6c7053bf3514/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx=
7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-15-g6c7053bf3514/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx=
7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63809a5787fb94c1042ab=
d27
        failing since 22 days (last pass: v6.0-rc1-20-g95a789b97c72, first =
fail: v6.1-rc1-12-g52f572342440) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/638099c7142ccb3f102abd1c

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-15-g6c7053bf3514/arm64/defconfig/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-15-g6c7053bf3514/arm64/defconfig/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/638=
099c7142ccb3f102abd2f
        new failure (last pass: v6.1-rc1-14-geba771858c2d)

    2022-11-25T10:32:22.734038  /lava-216031/1/../bin/lava-test-case
    2022-11-25T10:32:22.734428  <8>[   16.840220] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-11-25T10:32:22.734685  /lava-216031/1/../bin/lava-test-case
    2022-11-25T10:32:22.734916  <8>[   16.861159] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy-driver-present RESULT=3Dpass>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63809b51f369fe97952abd1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-15-g6c7053bf3514/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-15-g6c7053bf3514/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63809b51f369fe97952ab=
d1e
        failing since 85 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =


  Details:     https://kernelci.org/test/plan/id/63809cbc004491b02d2abd32

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-15-g6c7053bf3514/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-15-g6c7053bf3514/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/63809cbc004491b02d2abd54
        failing since 233 days (last pass: v5.17-rc1-10-g0ef49b25b7cc, firs=
t fail: v5.18-rc1-1-gbf84b10d9901d)

    2022-11-25T10:45:01.620157  <8>[   39.416406] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-11-25T10:45:02.654819  /lava-8121817/1/../bin/lava-test-case
    2022-11-25T10:45:02.673756  <8>[   40.470747] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/63809cbc004491b02d2abd76
        failing since 172 days (last pass: v5.18-rc1-24-gc2d7e384924d, firs=
t fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-11-25T10:44:58.599996  <8>[   36.396288] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>
    2022-11-25T10:44:59.636730  /lava-8121817/1/../bin/lava-test-case
    2022-11-25T10:44:59.657197  <8>[   37.452895] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/63809cbc004491b02d2abd77
        failing since 172 days (last pass: v5.18-rc1-24-gc2d7e384924d, firs=
t fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-11-25T10:44:57.530813  =

    2022-11-25T10:44:58.585521  /lava-8121817/1/../bin/lava-test-case
    2022-11-25T10:44:58.586541     =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/63809cbc004491b02d2abd78
        failing since 172 days (last pass: v5.18-rc1-24-gc2d7e384924d, firs=
t fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-11-25T10:44:57.511047  /lava-8121817/1/../bin/lava-test-case
    2022-11-25T10:44:57.530193  <8>[   35.327083] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =20
