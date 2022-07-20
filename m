Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EE01FD7
	for <chrome-platform@lists.linux.dev>; Wed, 20 Jul 2022 06:31:55 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id d7so2257461plr.9
        for <chrome-platform@lists.linux.dev>; Tue, 19 Jul 2022 23:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=3JGZUGhh4Z3/RmWCzWVDv5qjDguvk19gWydtt3v69G0=;
        b=ooJUo0rRuFLnlaj0h9blSrzB/24RFpPB/cuphDbGUMJdcbkORd/2VL4iWme9jItM8F
         YNH3zu1ukhXcudUqIcW6evfChlWReRcQJdiIeFB6LCs6GVLO5KhZHy9VNmxZxJ64UM9G
         WSGvG+9/yMYKgTwNZAR769eFsffJh6d2A1pHS3fb7gqNtfNUWjn3n8si6+2Ck68JxIJ8
         LfgmxJqLymxitVYpmKtKEgiZkSgtplkUIj5rq7kHA+qta5oQHs1Y+QB6RSxqBneVDhPz
         qh+D7Wn9OOgf+2d0nNbkqkb+Mv+2hEgbebYlpeyZLr9EhPEM8QhWlXmKON7GdvdDqSve
         BvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=3JGZUGhh4Z3/RmWCzWVDv5qjDguvk19gWydtt3v69G0=;
        b=c8juRVKExAJnlgrZWvWSNHQPJ/j3ykGMcJ62ICOB3OAfX1S090ys93IWL3B5wCU7db
         wkrBsimM9ywm8uu2Z5HA+20Fw+WCfKcOwwsoDiP7njA/Nqq1bkpQFU30JOxpVOq1qAJ6
         JjWrwesnzoDT0CpjuQ/rolGDP9Ua4sCDZ8i8miT271r4udEhRfJYf0mmv9o/Jmn2c7px
         pcbmcOr3hBuDd/c/cVCJc1GYOjN0iVeON9Xw4t1XIag0Fl1MkTCBWbpE6HK4+c19QuNz
         dsa0fKyj4TwhdkOOfLXg6GZ4mgggLHqRcRbVpkxMYxY7481pRXTk7VqQozv3KHglMyKj
         Tg+g==
X-Gm-Message-State: AJIora+J7NuDVHSGZ8hVsG6e3LmSfmUe/kjX0f2zxjzetql3Cn3sOsym
	IhzEozW5mfI9QslNTVvgMdXk0w==
X-Google-Smtp-Source: AGRyM1soxsLFUPgDZ8hOkQegZP0iarC+xY2YzwvKG3jn0Qw/jJBd7zvKObtqsrjIHBgwctQiqdlFtQ==
X-Received: by 2002:a17:902:e887:b0:16c:32e4:6446 with SMTP id w7-20020a170902e88700b0016c32e46446mr36650127plg.142.1658298714930;
        Tue, 19 Jul 2022 23:31:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a191-20020a621ac8000000b00525203c2847sm12690275pfa.128.2022.07.19.23.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 23:31:54 -0700 (PDT)
Message-ID: <62d7a15a.1c69fb81.4debc.3a94@mx.google.com>
Date: Tue, 19 Jul 2022 23:31:54 -0700 (PDT)
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
X-Kernelci-Kernel: v5.19-rc1-58-gad1e2226017a9
Subject: chrome-platform/for-kernelci baseline: 109 runs,
 12 regressions (v5.19-rc1-58-gad1e2226017a9)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 109 runs, 12 regressions (v5.19-rc1-=
58-gad1e2226017a9)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig         | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                  | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =

sun50i-h6-pine-h64           | arm64 | lab-baylibre  | gcc-10   | defconfig=
                  | 1          =

sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig         | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig         | 1          =

tegra124-nyan-big            | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig         | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.19-rc1-58-gad1e2226017a9/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.19-rc1-58-gad1e2226017a9
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      ad1e2226017a9e56e242029f834a2cfc14f6fa83 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/62d7973b0f0368dbf7daf06e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-58-gad1e2226017a9/arm/multi_v7_defconfig/gcc-10/lab-baylibre/basel=
ine-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-58-gad1e2226017a9/arm/multi_v7_defconfig/gcc-10/lab-baylibre/basel=
ine-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d7973b0f0368dbf7daf=
06f
        failing since 44 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/62d7977a9e9f73fb3cdaf0a9

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-58-gad1e2226017a9/arm64/defconfig/gcc-10/lab-kontron/baseline-kont=
ron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-58-gad1e2226017a9/arm64/defconfig/gcc-10/lab-kontron/baseline-kont=
ron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
d7977a9e9f73fb3cdaf0b2
        failing since 44 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-07-20T05:49:35.755830  /lava-143108/1/../bin/lava-test-case
    2022-07-20T05:49:35.800963  <8>[   15.969032] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2022-07-20T05:49:35.801308  /lava-143108/1/../bin/lava-test-case
    2022-07-20T05:49:35.801498  <8>[   15.982034] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2022-07-20T05:49:35.801697  /lava-143108/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =


  Details:     https://kernelci.org/test/plan/id/62d797f09d3b2c3a25daf057

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-58-gad1e2226017a9/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-58-gad1e2226017a9/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62d797f09d3b2c3a25daf079
        failing since 105 days (last pass: v5.17-rc1-10-g0ef49b25b7cc, firs=
t fail: v5.18-rc1-1-gbf84b10d9901d)

    2022-07-20T05:51:19.403853  /lava-6851734/1/../bin/lava-test-case
    2022-07-20T05:51:19.419831  <8>[   53.496277] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/62d797f09d3b2c3a25daf09c
        failing since 44 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-07-20T05:51:17.772452  /lava-6851734/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62d797f09d3b2c3a25daf09d
        failing since 44 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-07-20T05:51:15.751028  <8>[   49.827373] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>
    2022-07-20T05:51:16.752923  /lava-6851734/1/../bin/lava-test-case
    2022-07-20T05:51:16.765587  <8>[   50.845646] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/62d797f09d3b2c3a25daf09e
        failing since 44 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-07-20T05:51:15.082544  <4>[   49.158873] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-07-20T05:51:15.734435  /lava-6851734/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/62d79975c80f6f0051daf066

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-58-gad1e2226017a9/arm64/defconfig/gcc-10/lab-broonie/baseline-sun5=
0i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-58-gad1e2226017a9/arm64/defconfig/gcc-10/lab-broonie/baseline-sun5=
0i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d79975c80f6f0051daf=
067
        new failure (last pass: v5.19-rc1-41-gc30628bce72f) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/62d798703d06bb08d4daf089

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-58-gad1e2226017a9/arm64/defconfig/gcc-10/lab-broonie/baseline-sun5=
0i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-58-gad1e2226017a9/arm64/defconfig/gcc-10/lab-broonie/baseline-sun5=
0i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d798703d06bb08d4daf=
08a
        new failure (last pass: v5.19-rc1-41-gc30628bce72f) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-baylibre  | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/62d797e8a6eb81514ddaf26e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-58-gad1e2226017a9/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun=
50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-58-gad1e2226017a9/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun=
50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d797e8a6eb81514ddaf=
26f
        new failure (last pass: v5.19-rc1-41-gc30628bce72f) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/62d79a9815bad7a981daf05c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-58-gad1e2226017a9/arm/multi_v7_defconfig/gcc-10/lab-baylibre/basel=
ine-sun8i-h2-plus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-58-gad1e2226017a9/arm/multi_v7_defconfig/gcc-10/lab-baylibre/basel=
ine-sun8i-h2-plus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d79a9815bad7a981daf=
05d
        failing since 44 days (last pass: v5.19-rc1-5-g4a0e708bb23fc, first=
 fail: v5.19-rc1-6-gc1db0861e8d02) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/62d797200f0368dbf7daf067

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-58-gad1e2226017a9/arm/multi_v7_defconfig/gcc-10/lab-baylibre/basel=
ine-sun8i-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-58-gad1e2226017a9/arm/multi_v7_defconfig/gcc-10/lab-baylibre/basel=
ine-sun8i-h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d797200f0368dbf7daf=
068
        failing since 24 days (last pass: v5.19-rc1-35-g412b193d93912, firs=
t fail: v5.19-rc1-38-g15288cf9f149) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
tegra124-nyan-big            | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/62d79a3dd860ec11d8daf073

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-58-gad1e2226017a9/arm/multi_v7_defconfig/gcc-10/lab-collabora/base=
line-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-58-gad1e2226017a9/arm/multi_v7_defconfig/gcc-10/lab-collabora/base=
line-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d79a3dd860ec11d8daf=
074
        failing since 44 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc) =

 =20
