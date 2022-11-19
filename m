Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DB862F
	for <chrome-platform@lists.linux.dev>; Sat, 19 Nov 2022 08:43:14 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id q1so6946764pgl.11
        for <chrome-platform@lists.linux.dev>; Sat, 19 Nov 2022 00:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eXcVxAhfsw2kKKOUtABrjsvK5vALNBV4NusTFRLKey0=;
        b=HQ95xi1WvH7PTvyfMV4KbbbgvnB3ww1Jptjo7GoAtp2//GaDq3FqviFYlhUJxtH9ew
         3Ot2qGYVXqI5WlY+eaeSrbE0FhLf5FZF8yHiAxijs4byO7dOhojIbs86+MhsNAyafKnZ
         953Z/NwS4b9x1ketIoSk3axfbsvkMsnMpeCOwf29ffGLtx7aEezImrWHl9/lIY+lEhVe
         ZFZqpduJoPnuBA66pdkbSwpPf22A5IiR8f4h1Qo8SyLtBPOEmLm7iLF5fbTmtsDOXRMl
         YozctvPHtw5x+sfUaXWirawkLecGmpabFnrECnPtYeK7mIOErGvYDTNERvmTQY8pPvas
         NhKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eXcVxAhfsw2kKKOUtABrjsvK5vALNBV4NusTFRLKey0=;
        b=cduO9qlqJDjQIpKApvvgagUDOZw9BLROk1LtZaXcNpdHauI5LMwqAhrELnbbEEYlGz
         VF6q08GdUtNxn4yF+holr7t2/KXA9AxRQiq/by3WYYY28ETI4yLZD5hRdpQBbz6PgGH9
         9ivcpTskWPnxBD1Tw41h5wfiKlRmCyYhOw7p9HQd+xLnckeCQgBcjT+ZhOR5I8TndXt/
         7o++QMRTg+5dJKWsOwCkd8k40pffWf21LHpgQ/cbZMmWOuYcBe6oLfwiBHWeZkF/ESt9
         SOpQsCyJjy1H0gtpuN80COa2ldYkOeFXrZiurAy/JuykugkKQBJ8grwJHKMa34ktWpgu
         K3vA==
X-Gm-Message-State: ANoB5pmR3Kz0cIPv5zJHdOhRW/m65deBc5lFcFyN3OuZ+nBShpWU227M
	omxcGJ7aXmZ+KeMTybHEFYCptg==
X-Google-Smtp-Source: AA0mqf4TqUrVLaFhaCP5xwjbCt51QzMg/KboYIrn2wUBOBxIBi0mCsYsC/LX+3S2roZBwd56S9FIYw==
X-Received: by 2002:a63:4d0d:0:b0:477:14ea:cee6 with SMTP id a13-20020a634d0d000000b0047714eacee6mr8336556pgb.303.1668847393640;
        Sat, 19 Nov 2022 00:43:13 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p17-20020a170902c71100b0017f5c7d3931sm4999423plp.282.2022.11.19.00.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 00:43:13 -0800 (PST)
Message-ID: <63789721.170a0220.56d90.8424@mx.google.com>
Date: Sat, 19 Nov 2022 00:43:13 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-kernelci
X-Kernelci-Kernel: v6.1-rc1-14-geba771858c2d
X-Kernelci-Report-Type: test
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci baseline: 102 runs,
 6 regressions (v6.1-rc1-14-geba771858c2d)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 102 runs, 6 regressions (v6.1-rc1-14=
-geba771858c2d)

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


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.1-rc1-14-geba771858c2d/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.1-rc1-14-geba771858c2d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      eba771858c2d4ae4c3ab4546174072195578ac3f =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/63788c84ae372cc32f2abd2d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-14-geba771858c2d/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx=
7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-14-geba771858c2d/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx=
7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63788c84ae372cc32f2ab=
d2e
        failing since 16 days (last pass: v6.0-rc1-20-g95a789b97c72, first =
fail: v6.1-rc1-12-g52f572342440) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63788de1ef2d2b8b992abd08

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-14-geba771858c2d/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-14-geba771858c2d/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63788de1ef2d2b8b992ab=
d09
        failing since 79 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =


  Details:     https://kernelci.org/test/plan/id/63788ef9e66068606e2abd59

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-14-geba771858c2d/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-14-geba771858c2d/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/63788ef9e66068606e2abd7b
        failing since 227 days (last pass: v5.17-rc1-10-g0ef49b25b7cc, firs=
t fail: v5.18-rc1-1-gbf84b10d9901d)

    2022-11-19T08:08:10.939470  =

    2022-11-19T08:08:11.973712  /lava-8045291/1/../bin/lava-test-case
    2022-11-19T08:08:11.983332  <8>[   49.265501] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/63788ef9e66068606e2abd9e
        failing since 166 days (last pass: v5.18-rc1-24-gc2d7e384924d, firs=
t fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-11-19T08:08:08.953968  /lava-8045291/1/../bin/lava-test-case
    2022-11-19T08:08:08.969004  <8>[   46.249707] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/63788ef9e66068606e2abd9f
        failing since 166 days (last pass: v5.18-rc1-24-gc2d7e384924d, firs=
t fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-11-19T08:08:07.882868  /lava-8045291/1/../bin/lava-test-case
    2022-11-19T08:08:07.883722  =

    2022-11-19T08:08:07.900837  <8>[   45.181108] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/63788ef9e66068606e2abda0
        failing since 166 days (last pass: v5.18-rc1-24-gc2d7e384924d, firs=
t fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-11-19T08:08:05.742674  <8>[   43.021965] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dpass>
    2022-11-19T08:08:06.801919  /lava-8045291/1/../bin/lava-test-case
    2022-11-19T08:08:06.803014  =

    2022-11-19T08:08:06.821278  <8>[   44.103027] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =20
