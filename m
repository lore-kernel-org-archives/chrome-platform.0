Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D147E8
	for <chrome-platform@lists.linux.dev>; Fri,  5 Aug 2022 04:46:19 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id c19-20020a17090ae11300b001f2f94ed5c6so6763016pjz.1
        for <chrome-platform@lists.linux.dev>; Thu, 04 Aug 2022 21:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=KySjTSkCok6Uxjfl5u8z8r37xIwQrxeoJYg285Ep6Mo=;
        b=CzJsJpk5PUk4IlQ+nbLHS5xz5oV0iZevJckMRHDTSQunm7bHzkNWrfWAbnigaXzo0d
         z1SfMykfJ5x6VBDKXbNps5vKIXMHZnd2l41sr892A2JkGwvzFwfQRj8pZ2dN612lw+Jq
         WYEX+HTt2ec/Zn9wfQypETJ/25XF76d5+UEIHFHFpieh2PQFyaU+PlW4DJF7fbX8RrPr
         dVUpzaNxrHjJLDoxIWW6EXyBpcAwa+KXc0Mbi7prYCPX+TrgV9qA4RfGyK09FJnz1BRR
         5ZuT6E/8C0/Pe0jPgF7+lXk2vSskj0ZWdAo6L5EQIKkREoFTkwhBbx+zz98rRvJa3AYD
         wP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=KySjTSkCok6Uxjfl5u8z8r37xIwQrxeoJYg285Ep6Mo=;
        b=TK3mCYTc9BQascAIKUOt7d6U9s3lUsOxe3BbS4xtpOXFOsrwq0kWXdXjOBuNbiWwTP
         f8WMjZtfxcYpRFHmi9FHBMxjLrzbF2Y3zuWDukDUhPHxHKrm0Iieob7aiaMN/SjX01qP
         tjvIz+DDgwjGsiKMhdXdX0NbiJ2ZJNTsoe0gTgF0lr47m2GEUcUQiIdhB6PJ2Hc6m9Rl
         Jh8UaStAVvy6JWAPhIFHdSXOSbXK0Xfba2NE55Sr28Fku/6umvwum9C52kAQPKLRqhGh
         8aTOXMR3I2iZUm3XDvzL9AsJeQ0Su5VZQ5vfK0+33ifGQPpMkXXzXY2pMATvSpmypym5
         0oGQ==
X-Gm-Message-State: ACgBeo0j7oKYbz0Cf12h79BFQFkTZl7cy79qVlX9mZ5XSMoDpf+MbdV4
	45hPRNxBjpFDGEo7sNSN1YpYIQ==
X-Google-Smtp-Source: AA6agR6E61HEMfWfDzRcCprd2H+jsJRc6crvQ+LLS8DDrHi1MNhsSk+TPMj02r72jsB/JyRPY91bhg==
X-Received: by 2002:a17:90b:1d02:b0:1f5:8526:303 with SMTP id on2-20020a17090b1d0200b001f585260303mr2263062pjb.79.1659674779428;
        Thu, 04 Aug 2022 21:46:19 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z29-20020aa79e5d000000b0052b9351737fsm1930572pfq.92.2022.08.04.21.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 21:46:18 -0700 (PDT)
Message-ID: <62eca09a.a70a0220.42f97.3a69@mx.google.com>
Date: Thu, 04 Aug 2022 21:46:18 -0700 (PDT)
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
X-Kernelci-Kernel: tag-chrome-platform-for-v5.20-2-gddffaa3d76750
Subject: chrome-platform/for-kernelci baseline: 96 runs,
 8 regressions (tag-chrome-platform-for-v5.20-2-gddffaa3d76750)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 96 runs, 8 regressions (tag-chrome-p=
latform-for-v5.20-2-gddffaa3d76750)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
                  | 1          =

tegra124-nyan-big            | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig         | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/tag-chrome-platform-for-v5.20-2-gddffaa3d76750/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: tag-chrome-platform-for-v5.20-2-gddffaa3d76750
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      ddffaa3d76750278e5a0804fa173b3c8c16ff42a =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec95ba0d1f2e6144daf058

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v5.20-2-gddffaa3d76750/arm64/defconfig+arm64-chromeb=
ook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v5.20-2-gddffaa3d76750/arm64/defconfig+arm64-chromeb=
ook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec95ba0d1f2e6144daf=
059
        new failure (last pass: v5.19-rc1-60-g088b8107e603) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =


  Details:     https://kernelci.org/test/plan/id/62ec96a988b7db44e2daf084

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v5.20-2-gddffaa3d76750/arm64/defconfig+arm64-chromeb=
ook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v5.20-2-gddffaa3d76750/arm64/defconfig+arm64-chromeb=
ook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62ec96a988b7db44e2daf0a6
        failing since 121 days (last pass: v5.17-rc1-10-g0ef49b25b7cc, firs=
t fail: v5.18-rc1-1-gbf84b10d9901d)

    2022-08-05T04:03:31.615886  /lava-6977312/1/../bin/lava-test-case
    2022-08-05T04:03:31.631409  <8>[   52.854165] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/62ec96a988b7db44e2daf0c9
        failing since 60 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-08-05T04:03:29.984800  /lava-6977312/1/../bin/lava-test-case
    2022-08-05T04:03:30.003242  <8>[   51.219871] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62ec96a988b7db44e2daf0ca
        failing since 60 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-08-05T04:03:27.961804  <8>[   49.182052] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>
    2022-08-05T04:03:28.965933  /lava-6977312/1/../bin/lava-test-case
    2022-08-05T04:03:28.980593  <8>[   50.199748] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/62ec96a988b7db44e2daf0cb
        failing since 60 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-08-05T04:03:27.173265  <4>[   48.390977] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-08-05T04:03:27.947983  /lava-6977312/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec963156a4303f08daf05d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v5.20-2-gddffaa3d76750/arm64/defconfig/gcc-10/lab-br=
oonie/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v5.20-2-gddffaa3d76750/arm64/defconfig/gcc-10/lab-br=
oonie/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec963156a4303f08daf=
05e
        failing since 15 days (last pass: v5.19-rc1-41-gc30628bce72f, first=
 fail: v5.19-rc1-58-gad1e2226017a9) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec95f8fb8daa3bc0daf083

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v5.20-2-gddffaa3d76750/arm64/defconfig/gcc-10/lab-co=
llabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v5.20-2-gddffaa3d76750/arm64/defconfig/gcc-10/lab-co=
llabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec95f8fb8daa3bc0daf=
084
        new failure (last pass: v5.19-rc1-60-g088b8107e603) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
tegra124-nyan-big            | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec9c040d83cffd90daf0d3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v5.20-2-gddffaa3d76750/arm/multi_v7_defconfig/gcc-10=
/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v5.20-2-gddffaa3d76750/arm/multi_v7_defconfig/gcc-10=
/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec9c040d83cffd90daf=
0d4
        failing since 60 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc) =

 =20
