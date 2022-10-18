Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF59C7B
	for <chrome-platform@lists.linux.dev>; Tue, 18 Oct 2022 09:27:12 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id s196so11513212pgs.3
        for <chrome-platform@lists.linux.dev>; Tue, 18 Oct 2022 02:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c7LCMqYeGSUhWqUkRluT00cAfrBii40UGz44ZRWNUKM=;
        b=fxKUU94qFAgq/RawzLfeTWisfOO7kbye67CnnAFyd3sOYq64/Zo1KBNS+u+hsYqLrs
         Ief9kYhrlBz97yraN0QIbLoFeIq5TKvLS5ajqxunOg/kgQXeHIWP6tIYDfXjoRztRkSe
         1pZkNI0ruGcxznTd8mo0QDrHodmLNP1cpDAhGp/QhbyePPOvpithUqdpwndMAnfy3EuX
         aMXiX3RdfpKAFhGM71Y18d1mYrkX8SI6+qmEbrHcOuFn4eRIovGyrsWzN+dMPxMZqqp7
         /gGuFxyRnW+MDa8Be7oRVUDKc+SohsgJHw4ITa81bluTPH5MKsFRFIEQvqFr2OKHMxtl
         Ug4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7LCMqYeGSUhWqUkRluT00cAfrBii40UGz44ZRWNUKM=;
        b=la/0/QLHNKTQx2ig9+nVpjfX24iJt1rxLFRN1BmbB8aVltgLsTJp4JFIp+ZQwLgs4Z
         0faZXpahoBhQpdhylHHoRArfJ224RY77IElWZtqvOm/VxVNn9QGB8NGUjac+rg8a6n3k
         T6TkKafQIovpMv2PsT9C7vYjkEIQ1muT85bEQUSfQIaW1WPxgDJokpZdD+Q6koJxjrNA
         mUKi1ChPUbiszAdDnMQG/6qupjKPYS+8QXPC5nwIEMsPpQPZ8csS6fYj3zHuMssibPnj
         RIBXNUMF96wV2WqDVj1NABe+/bgyDrEBWP+vzy57iXPA0MPA7293juHoXQIRasJmGrXX
         QfgA==
X-Gm-Message-State: ACrzQf3ufOpUwvtv4hN4k02BUHX5iy5stMkzfybKtFH4GFiTMchyYrgw
	m63uPPVIr/rnL3h5EK6jAFcvvw==
X-Google-Smtp-Source: AMsMyM4IzjRpD9YftOfSvHFBhMp/1mj0weauOb6+ruCBuQMV6fBUbMbh/mgrSo9JHGiPkMCGBRkSTg==
X-Received: by 2002:a63:1e56:0:b0:462:970:e0de with SMTP id p22-20020a631e56000000b004620970e0demr1943280pgm.90.1666085232205;
        Tue, 18 Oct 2022 02:27:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i2-20020aa796e2000000b00560e5da42d5sm8596503pfq.201.2022.10.18.02.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 02:27:11 -0700 (PDT)
Message-ID: <634e716f.a70a0220.f278c.f42f@mx.google.com>
Date: Tue, 18 Oct 2022 02:27:11 -0700 (PDT)
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
X-Kernelci-Kernel: v6.1-rc1-2-gc7e2618e1256
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 80 runs,
 6 regressions (v6.1-rc1-2-gc7e2618e1256)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 80 runs, 6 regressions (v6.1-rc1-2-g=
c7e2618e1256)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.1-rc1-2-gc7e2618e1256/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.1-rc1-2-gc7e2618e1256
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      c7e2618e12562ba6f9d230d8ed4257dfa94d2d9d =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/634e682dfafe8b1cf3c2a857

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-2-gc7e2618e1256/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-2-gc7e2618e1256/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/634e682dfafe8b1cf3c2a=
858
        failing since 47 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =


  Details:     https://kernelci.org/test/plan/id/634e67f3dfc9c20456c2a90f

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-2-gc7e2618e1256/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-2-gc7e2618e1256/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/634e67f4dfc9c20456c2a935
        failing since 195 days (last pass: v5.17-rc1-10-g0ef49b25b7cc, firs=
t fail: v5.18-rc1-1-gbf84b10d9901d)

    2022-10-18T08:46:18.617910  <8>[   48.220584] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-10-18T08:46:19.664240  /lava-7624652/1/../bin/lava-test-case
    2022-10-18T08:46:19.673901  <8>[   49.276643] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/634e67f4dfc9c20456c2a958
        failing since 134 days (last pass: v5.18-rc1-24-gc2d7e384924d, firs=
t fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-10-18T08:46:16.637751  /lava-7624652/1/../bin/lava-test-case
    2022-10-18T08:46:16.653904  <8>[   46.255542] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/634e67f4dfc9c20456c2a959
        failing since 134 days (last pass: v5.18-rc1-24-gc2d7e384924d, firs=
t fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-10-18T08:46:15.588840  /lava-7624652/1/../bin/lava-test-case
    2022-10-18T08:46:15.602616  <8>[   45.203895] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/634e67f4dfc9c20456c2a95a
        failing since 134 days (last pass: v5.18-rc1-24-gc2d7e384924d, firs=
t fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-10-18T08:46:14.520957  /lava-7624652/1/../bin/lava-test-case
    2022-10-18T08:46:14.537124  <8>[   44.138694] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/634e673d36513a5aebc2a843

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-2-gc7e2618e1256/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-2-gc7e2618e1256/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/634e673d36513a5aebc2a=
844
        new failure (last pass: v6.1-rc1-1-g8b78c14e29f19) =

 =20
