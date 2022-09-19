Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149337E8
	for <chrome-platform@lists.linux.dev>; Mon, 19 Sep 2022 04:44:30 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id q3so26602465pjg.3
        for <chrome-platform@lists.linux.dev>; Sun, 18 Sep 2022 21:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=l+/0EIoDGZXP/Mx4sHEEgqlqnd3rNEhwqpOFp1lXe5k=;
        b=cOCQ3dY9cytjo/bw88stXzfAih0q6EQ3lThDCQNsVYHVXiLqk8CFDKAthOD5593UHQ
         9lzuwLpfTJxFx/1YWvbmoPZwZl1Pvnvvj5T4OwZhcrapE9QlXhXIvqpdhvbI0DkA6wIK
         CxDjjlTKRd87jUTv8jtpsE4lBAkSKxwz/nbHYTPji2/8T0jbIXzu0pt4IrKrYakWtSzR
         9SvrUREkkH2lPudGSTKbW499TOvJAMtW+rG7zcJn+2L+I/Aca4YuDecQbmxAGs7OU+l2
         PUbFz5JShuHV0byazs1MMmUG5c1wQCW4yXZS+xyZkzOnvAe5Ltnji2TDlfSbpDqj22uB
         RqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=l+/0EIoDGZXP/Mx4sHEEgqlqnd3rNEhwqpOFp1lXe5k=;
        b=foL8mqxEvM3wdJkHL6FU5Ymsb/TN9kWy4aLEQ9xbigW0dD1fDqvja1P4JkkodQdgQR
         pHBkY9ufYek7El6TlH/kk1fYE7WIiobCYDTdO/8CpwlQ78EZQcLugCdAm9YUAvIh8EXh
         l2hxtMSiyPMKPvhh3IpiJwQrzwD4fF/qjTSpydJzbR4YPZhQgZeKt3uXlNpwLucvbxIT
         uU0ntKTt3YOlsA88ELod2IMY1alDvfibaIy1PcwSf82Zqcq3szbEjK8odoNb9kvl2xqv
         H5EkEOMWMHzn4M7Do3GVasyuT3rR/V2g/6TOOR5pwGe7QwNNPdMs9KYprvqkopp8fVTf
         gKkA==
X-Gm-Message-State: ACrzQf3sieKC9Xat2tpm4LZ56K8JziD/y8xQPU4XedS9b5K+bQjZliWe
	meJLoVFzQwbpyEAh9gbGKIU98w==
X-Google-Smtp-Source: AMsMyM7G/vVr+QG/PyWAlvqXx5tn9i7UzZO5zCt+JmBptdwI1PssXK4utFs903q2yQUUdv/EoRGb8A==
X-Received: by 2002:a17:902:f606:b0:172:6522:4bfc with SMTP id n6-20020a170902f60600b0017265224bfcmr11183385plg.133.1663562670459;
        Sun, 18 Sep 2022 21:44:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d11-20020a62f80b000000b0053e85a4a2c9sm7767926pfh.5.2022.09.18.21.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Sep 2022 21:44:30 -0700 (PDT)
Message-ID: <6327f3ae.620a0220.8ed1a.d6d8@mx.google.com>
Date: Sun, 18 Sep 2022 21:44:30 -0700 (PDT)
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
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.0-rc1-20-g95a789b97c72
Subject: chrome-platform/for-kernelci baseline: 110 runs,
 8 regressions (v6.0-rc1-20-g95a789b97c72)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 110 runs, 8 regressions (v6.0-rc1-20=
-g95a789b97c72)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
beaglebone-black             | arm   | lab-broonie   | gcc-10   | multi_v7_=
defconfig         | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
                  | 2          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.0-rc1-20-g95a789b97c72/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.0-rc1-20-g95a789b97c72
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      95a789b97c72e00d7be6951ebc3fe537803003a6 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
beaglebone-black             | arm   | lab-broonie   | gcc-10   | multi_v7_=
defconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/6327ea931dee15529f355656

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-20-g95a789b97c72/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline=
-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-20-g95a789b97c72/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline=
-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6327ea931dee15529f355=
657
        new failure (last pass: tag-chrome-platform-for-v5.20-2-gddffaa3d76=
750) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
                  | 2          =


  Details:     https://kernelci.org/test/plan/id/6327e9a444a3ebbb9235566a

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-20-g95a789b97c72/arm64/defconfig/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-20-g95a789b97c72/arm64/defconfig/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/6327e9a444a3ebbb92355678
        failing since 27 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-09-19T04:01:21.103213  /lava-169452/1/../bin/lava-test-case
    2022-09-19T04:01:21.103618  <8>[   19.358562] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-09-19T04:01:21.103880  /lava-169452/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/632=
7e9a444a3ebbb9235567a
        failing since 27 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-09-19T04:01:22.140802  /lava-169452/1/../bin/lava-test-case
    2022-09-19T04:01:22.141221  <8>[   20.403071] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-09-19T04:01:22.141477  /lava-169452/1/../bin/lava-test-case
    2022-09-19T04:01:22.141740  <8>[   20.423060] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>
    2022-09-19T04:01:22.141980  /lava-169452/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6327ea79f9f58abe2035564b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-20-g95a789b97c72/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-20-g95a789b97c72/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6327ea79f9f58abe20355=
64c
        failing since 17 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =


  Details:     https://kernelci.org/test/plan/id/6327ea260ae679c7083556b0

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-20-g95a789b97c72/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-20-g95a789b97c72/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/6327ea260ae679c7083556d2
        failing since 166 days (last pass: v5.17-rc1-10-g0ef49b25b7cc, firs=
t fail: v5.18-rc1-1-gbf84b10d9901d)

    2022-09-19T04:03:33.405111  /lava-7310724/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/6327ea260ae679c7083556f5
        failing since 105 days (last pass: v5.18-rc1-24-gc2d7e384924d, firs=
t fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-09-19T04:03:31.142786  /lava-7310724/1/../bin/lava-test-case
    2022-09-19T04:03:31.154371  <8>[   38.810556] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/6327ea260ae679c7083556f6
        failing since 105 days (last pass: v5.18-rc1-24-gc2d7e384924d, firs=
t fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-09-19T04:03:29.070386  <8>[   36.726748] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>
    2022-09-19T04:03:30.110367  /lava-7310724/1/../bin/lava-test-case
    2022-09-19T04:03:30.120105  <8>[   37.776455] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/6327ea260ae679c7083556f7
        failing since 105 days (last pass: v5.18-rc1-24-gc2d7e384924d, firs=
t fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-09-19T04:03:28.017770  <8>[   35.672875] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dpass>
    2022-09-19T04:03:28.072394  <4>[   35.727832] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-09-19T04:03:29.059541  /lava-7310724/1/../bin/lava-test-case   =

 =20
