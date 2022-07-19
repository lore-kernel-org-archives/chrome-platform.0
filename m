Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6E97B
	for <chrome-platform@lists.linux.dev>; Tue, 19 Jul 2022 00:23:26 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id cp18-20020a17090afb9200b001ef79e8484aso196908pjb.1
        for <chrome-platform@lists.linux.dev>; Mon, 18 Jul 2022 17:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=D15FJ5vC7PwcmmwTKIoSgLTXh4xf/hmjR9EQw9uFIG0=;
        b=tz6OQd+NVE+xmrpp1X86FW/wjjt48CUPiuBSNTHM3UW6vtMIg48gsMePIgXxskAlew
         F0I+o49WreRIxPf//7xZKSzF4Zzod2Xi4DfyZwFayoNN1nrJeiAfNnO5Q4OuPcpqgqNU
         mUC1E3kfYkP6P8wUKfcdUPRD+1XTa3gZ3uNIJRYsuSlPEHo3SMR145g9wJBI4z2SGjnt
         MKRJrNlF9cxUJDGYdpCdncPsQrUqY4vMGH1n3AyUoFMfPEgNysEs0RR71sHm/xUiyFMi
         Ikeo4WHYfbJuPCWGgpkPCh9E4nffzVDOykeO03arPBnEWlQSmVQWSX6bEOLLlJ4luXAr
         lXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=D15FJ5vC7PwcmmwTKIoSgLTXh4xf/hmjR9EQw9uFIG0=;
        b=Ry2r6qRn3Uzelfx5tz0dwZ6wRGTz9VhJ0WdgAtogkRK+W5r2yLlfGvMPgRLhsI8nmz
         1ZjiXQx8twWNISHJzJ0lfH1Q/DdMsUVff/JrC/NAhmCH6WWXEehB3wbIeBJ2BGt0Pk4K
         ips3n89yoYLeYd8Wp02g0i3+ufgImFTC7Ivd4oaUO6pBGxC4M6EFlowAMVWeChLPa47G
         gJHX33+KNoQ+/HyugrcUf2OGHEol6YxXzSTURefjz+EmUM8uOjy0oB1l6LkZCVV+dZOI
         AotFvzMaxpA6HyyuIlNFkOdk9egzuLlhThMTuIOpPniqHfBjZn9bAaiRREDTC06ciMev
         sNgw==
X-Gm-Message-State: AJIora8WECtFBt1Ekf7twUfmzJHZ5mdP3TOoc2m8BYKpk0mCeJM6McBa
	YEgZvGU/EKE7pyIqnH/0fgmLnA==
X-Google-Smtp-Source: AGRyM1stu/m59Kwj9V8xElQTr7k+hjlCMdnTxvIJiBjHkQosDPZjKnLTKzTAHxSXf2lgAe4mB1AOFg==
X-Received: by 2002:a17:902:c78b:b0:16c:5765:398c with SMTP id w11-20020a170902c78b00b0016c5765398cmr31027174pla.138.1658190205710;
        Mon, 18 Jul 2022 17:23:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z13-20020a170903018d00b00168a216f629sm10323253plg.11.2022.07.18.17.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 17:23:25 -0700 (PDT)
Message-ID: <62d5f97d.1c69fb81.a1896.f424@mx.google.com>
Date: Mon, 18 Jul 2022 17:23:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc1-41-gc30628bce72f
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci baseline: 59 runs,
 8 regressions (v5.19-rc1-41-gc30628bce72f)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 59 runs, 8 regressions (v5.19-rc1-41=
-gc30628bce72f)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
           | regressions
----------------------+-------+---------------+----------+-----------------=
-----------+------------
fsl-lx2160a-rdb       | arm64 | lab-nxp       | gcc-10   | defconfig       =
           | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron   | gcc-10   | defconfig       =
           | 1          =

meson-gxl-s905d-p230  | arm64 | lab-baylibre  | gcc-10   | defconfig       =
           | 1          =

mt8173-elm-hana       | arm64 | lab-collabora | gcc-10   | defconfig+arm64-=
chromebook | 1          =

rk3399-gru-kevin      | arm64 | lab-collabora | gcc-10   | defconfig+arm64-=
chromebook | 4          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.19-rc1-41-gc30628bce72f/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.19-rc1-41-gc30628bce72f
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      c30628bce72fc72d64c6764aee770e59d727ede3 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
           | regressions
----------------------+-------+---------------+----------+-----------------=
-----------+------------
fsl-lx2160a-rdb       | arm64 | lab-nxp       | gcc-10   | defconfig       =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/62d5f078caabf9f90ca39be8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-41-gc30628bce72f/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-lx216=
0a-rdb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-41-gc30628bce72f/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-lx216=
0a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d5f078caabf9f90ca39=
be9
        new failure (last pass: v5.19-rc1-39-g5ffc0821f4df) =

 =



platform              | arch  | lab           | compiler | defconfig       =
           | regressions
----------------------+-------+---------------+----------+-----------------=
-----------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron   | gcc-10   | defconfig       =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/62d5eee8d8b3c13feaa39c0f

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-41-gc30628bce72f/arm64/defconfig/gcc-10/lab-kontron/baseline-kontr=
on-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-41-gc30628bce72f/arm64/defconfig/gcc-10/lab-kontron/baseline-kontr=
on-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
d5eee8d8b3c13feaa39c18
        failing since 42 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-07-18T23:38:06.565741  /lava-142079/1/../bin/lava-test-case
    2022-07-18T23:38:06.610353  <8>[   15.373363] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2022-07-18T23:38:06.610687  /lava-142079/1/../bin/lava-test-case
    2022-07-18T23:38:06.610868  <8>[   15.385986] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2022-07-18T23:38:06.611042  /lava-142079/1/../bin/lava-test-case   =

 =



platform              | arch  | lab           | compiler | defconfig       =
           | regressions
----------------------+-------+---------------+----------+-----------------=
-----------+------------
meson-gxl-s905d-p230  | arm64 | lab-baylibre  | gcc-10   | defconfig       =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/62d5f09b826b86ab02a39bd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-41-gc30628bce72f/arm64/defconfig/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-41-gc30628bce72f/arm64/defconfig/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d5f09b826b86ab02a39=
bd9
        new failure (last pass: v5.19-rc1-39-g5ffc0821f4df) =

 =



platform              | arch  | lab           | compiler | defconfig       =
           | regressions
----------------------+-------+---------------+----------+-----------------=
-----------+------------
mt8173-elm-hana       | arm64 | lab-collabora | gcc-10   | defconfig+arm64-=
chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62d5f0c86ef465c914a39c0a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-41-gc30628bce72f/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-41-gc30628bce72f/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d5f0c86ef465c914a39=
c0b
        new failure (last pass: v5.19-rc1-39-g5ffc0821f4df) =

 =



platform              | arch  | lab           | compiler | defconfig       =
           | regressions
----------------------+-------+---------------+----------+-----------------=
-----------+------------
rk3399-gru-kevin      | arm64 | lab-collabora | gcc-10   | defconfig+arm64-=
chromebook | 4          =


  Details:     https://kernelci.org/test/plan/id/62d5ef9c87291876e8a39c33

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-41-gc30628bce72f/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-41-gc30628bce72f/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62d5ef9c87291876e8a39c55
        failing since 104 days (last pass: v5.17-rc1-10-g0ef49b25b7cc, firs=
t fail: v5.18-rc1-1-gbf84b10d9901d)

    2022-07-18T23:40:57.738217  <8>[   52.950217] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-07-18T23:40:58.753709  /lava-6839897/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/62d5ef9c87291876e8a39c78
        failing since 42 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-07-18T23:40:57.102403  /lava-6839897/1/../bin/lava-test-case
    2022-07-18T23:40:57.118241  <8>[   52.326797] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62d5ef9c87291876e8a39c79
        failing since 42 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-07-18T23:40:56.084363  /lava-6839897/1/../bin/lava-test-case
    2022-07-18T23:40:56.098786  <8>[   51.308212] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/62d5ef9c87291876e8a39c7a
        failing since 42 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-07-18T23:40:54.207374  <4>[   49.414942] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-07-18T23:40:55.048281  /lava-6839897/1/../bin/lava-test-case
    2022-07-18T23:40:55.070299  <8>[   50.278942] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =20
