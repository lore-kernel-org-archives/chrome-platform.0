Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BBA7C
	for <chrome-platform@lists.linux.dev>; Mon,  5 Dec 2022 07:43:14 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id g10so10032802plo.11
        for <chrome-platform@lists.linux.dev>; Sun, 04 Dec 2022 23:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wzMLRPDSUy9mRtP/OIfU4n/9lQgF2e5nRoiiJZjaZeY=;
        b=W2veCI2lWhYLgdZfuJnbtdjKe+cDQHQmFR7q1D5Cs9d5/tlnkC2m1Pp6ZZ1wVlsB+3
         +i8nsJCaiBGbqWhmYOokxgmKF1YXNqTtp80UJgJASHUmljTP4KanB/Zyx1ZqRuZ6gLTN
         T14PVuZTwdc0+h2WogG3jAu6izTsAUMNcMVtEzcukgIc50AV2fnHMi1fvTZo4k8KcmWV
         txwhK4NC6CWhN/qaSEJof3a16ukiXsT3CLJm40cqr1COjbfl7Qb+7VQPZapjXKgE/SGQ
         oGvcdsk95O5EwMfjHEyTpRsmIc94P1LfRChnvNUYJqAMX46GikwFIsKO+UIfF8hnUN7n
         lQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wzMLRPDSUy9mRtP/OIfU4n/9lQgF2e5nRoiiJZjaZeY=;
        b=kmNBJ09cSUoTUtgHtW5GkQo7P1IeYkhZGiabv8Y4I3UgYQO14BUBS9sEMHGuAOU4CZ
         eb4qQ7f5USMB1phXzWdICZNziUTPn6c8nYqb4GjtiCXfb387cIldG7t8pofPjVabuhfD
         moYw3DqGeiLkGaniGwdLRoeZj76NRirVBoceo33wbsUz6QPl3ul6D8tMqnOdJZiRQD1p
         TyHZvqV5oUGXbtIdVRz/INdxoawNT41OQqH7X2vtpB5ZuNYwEVe0bEho11qrSrz2qq1P
         k7xw9FMDTR1h/vbwLPBIsbP7+c3iDMgJQ8yEnMdEZ0+g42B6oJKIOdiml7Ma1sDlzuqn
         nZKQ==
X-Gm-Message-State: ANoB5pkJs8YMUVujY1NevWq6NvaXfh7exOhMjES9j1oegyC9tiORigJR
	Rb/F7gnNfdlnVM2pzyulkT/s1Q==
X-Google-Smtp-Source: AA0mqf4XLz/2FQl21VQ050xqfnG/IolpqTFC/3RmPHUStgGcO/ZOyWvHy9v0a01Q7Yj8/Kr0ZDXKAQ==
X-Received: by 2002:a17:90a:c795:b0:218:9893:9aa7 with SMTP id gn21-20020a17090ac79500b0021898939aa7mr74788260pjb.223.1670226193708;
        Sun, 04 Dec 2022 23:43:13 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902e80b00b001897bfc9800sm9927887plg.53.2022.12.04.23.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 23:43:13 -0800 (PST)
Message-ID: <638da111.170a0220.45303.1f87@mx.google.com>
Date: Sun, 04 Dec 2022 23:43:13 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-kernelci
X-Kernelci-Kernel: v6.1-rc1-16-gd74fa18ce5f0
X-Kernelci-Report-Type: test
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci baseline: 88 runs,
 7 regressions (v6.1-rc1-16-gd74fa18ce5f0)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 88 runs, 7 regressions (v6.1-rc1-16-=
gd74fa18ce5f0)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
                  | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.1-rc1-16-gd74fa18ce5f0/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.1-rc1-16-gd74fa18ce5f0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      d74fa18ce5f0fc462d93edd1514e6daaf55f804c =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/638d977f63776ef6e02abd4e

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-16-gd74fa18ce5f0/arm64/defconfig/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-16-gd74fa18ce5f0/arm64/defconfig/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/638=
d977f63776ef6e02abd61
        failing since 9 days (last pass: v6.1-rc1-14-geba771858c2d, first f=
ail: v6.1-rc1-15-g6c7053bf3514)

    2022-12-05T07:02:02.732107  /lava-223221/1/../bin/lava-test-case
    2022-12-05T07:02:02.732472  <8>[   16.824149] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/638d976c958f91804d2abd5d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-16-gd74fa18ce5f0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-16-gd74fa18ce5f0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/638d976c958f91804d2ab=
d5e
        failing since 95 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =


  Details:     https://kernelci.org/test/plan/id/638d97bb5808d60fda2abd97

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-16-gd74fa18ce5f0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-16-gd74fa18ce5f0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/638d97bb5808d60fda2abdb9
        failing since 243 days (last pass: v5.17-rc1-10-g0ef49b25b7cc, firs=
t fail: v5.18-rc1-1-gbf84b10d9901d)

    2022-12-05T07:03:03.387249  /lava-8237948/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/638d97bb5808d60fda2abddc
        failing since 182 days (last pass: v5.18-rc1-24-gc2d7e384924d, firs=
t fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-12-05T07:03:00.283554  /lava-8237948/1/../bin/lava-test-case
    2022-12-05T07:03:00.284470  =

    2022-12-05T07:03:00.297259  <8>[   37.647517] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/638d97bb5808d60fda2abddd
        failing since 182 days (last pass: v5.18-rc1-24-gc2d7e384924d, firs=
t fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-12-05T07:02:59.208499  /lava-8237948/1/../bin/lava-test-case
    2022-12-05T07:02:59.228259  <8>[   36.577962] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/638d97bb5808d60fda2abdde
        failing since 182 days (last pass: v5.18-rc1-24-gc2d7e384924d, firs=
t fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-12-05T07:02:58.170133  /lava-8237948/1/../bin/lava-test-case
    2022-12-05T07:02:58.180150  <8>[   35.529953] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/638d9679fd4dfafe0a2abd06

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-16-gd74fa18ce5f0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-16-gd74fa18ce5f0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/638d9679fd4dfafe0a2ab=
d07
        new failure (last pass: v6.1-rc1-15-g6c7053bf3514) =

 =20
