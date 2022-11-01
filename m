Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B07B365
	for <chrome-platform@lists.linux.dev>; Tue,  1 Nov 2022 04:55:55 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id v28so12325744pfi.12
        for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 21:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6R7BEc78HyHyEF5sxfAj1hZkyHOOwAbIR03AdMgqg9E=;
        b=5pv/098kBO7yygOEp5RAajZ0cWSXC55XkQ+FTbFYzAZKOHPFljZs/SsImef0UcVthl
         zY2lz9umtzCZTJplRZRtYhdXV35CRJgD6r645OVTYds/sTqIHX8N8G12sDplrrOr7byZ
         y4jS2rZ0gyo6hBMkBeAIxkZ2uZ6AlT5yKlQYtm8T+rIWuIyri9N04izgQkM5uVgKIO+k
         +CHCCT+EbImS6dkCIf/LUYKqJLjPtVs73mGSPm305D/DXzlJmkK6fk5D1cUchwyFIHIL
         8PKREAK/vx1R7NeXf9CEQXAMVc9tRZF5hjBINlCDcU6JiEiYGOqQBYXZkCTkqeqCMfo5
         YdGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6R7BEc78HyHyEF5sxfAj1hZkyHOOwAbIR03AdMgqg9E=;
        b=CfhkPx3eO08xsaNyMsbWsmmILLg5FaiZP+1IPCjNuH87RvZonEjZgSUDuU2lQKKNu8
         nD3vpJnfloEOBQwD3l0PBMNTRHng8SHLDPusOYbwofvLEh9YpLLtwMFqyOvRBMX75Ard
         vxf92+ZM7qGeLpYSdJV8GAVYA1StQ3SPZvLt3hBuKAt+XvxPyZK0ieKA6TuDl7C9220U
         bXS7JcJXHOj+4aOcXALOnDpJRvRrmEixTXYhE6Hi6IQoUgC6QD8q9LYB+cToqVtlzbdx
         NGKCJiRa0NZ3+RFRQvcDHbR7iAnP/zgXAAQoUv8Whjy2k8wJBf9G/jubCJ8V7uskRLJ7
         lPuA==
X-Gm-Message-State: ACrzQf3epN3xS66sb37jbVZ8JLc+hQDTggTPTg24aFllstlz8jYguCY2
	BM8sXZ/+tA8gGJ7+gTQcjPuGfQ==
X-Google-Smtp-Source: AMsMyM4cDFAghddJaN8C5CWKvvPD8lKXh5zw00pi1CS2U8ukcORVQ7nppGWUgbmr6jcjog6fm5xNxQ==
X-Received: by 2002:aa7:96c7:0:b0:56b:c569:99c with SMTP id h7-20020aa796c7000000b0056bc569099cmr18031956pfq.4.1667278554619;
        Mon, 31 Oct 2022 21:55:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b00178aaf6247bsm5278641plb.21.2022.10.31.21.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 21:55:54 -0700 (PDT)
Message-ID: <6360a6da.170a0220.dd8d3.97c1@mx.google.com>
Date: Mon, 31 Oct 2022 21:55:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.1-rc1-6-g18ffa74c2259
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci baseline: 87 runs,
 5 regressions (v6.1-rc1-6-g18ffa74c2259)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 87 runs, 5 regressions (v6.1-rc1-6-g=
18ffa74c2259)

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


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.1-rc1-6-g18ffa74c2259/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.1-rc1-6-g18ffa74c2259
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      18ffa74c225988fdc907dd59051256d39816346c =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63609d676c82458c98e7db51

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-6-g18ffa74c2259/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-6-g18ffa74c2259/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63609d676c82458c98e7d=
b52
        failing since 60 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =


  Details:     https://kernelci.org/test/plan/id/63609e23f3accdfb89e7db4f

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-6-g18ffa74c2259/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-6-g18ffa74c2259/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/63609e23f3accdfb89e7db71
        failing since 209 days (last pass: v5.17-rc1-10-g0ef49b25b7cc, firs=
t fail: v5.18-rc1-1-gbf84b10d9901d)

    2022-11-01T04:18:16.353298  <8>[   39.767664] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-11-01T04:18:17.403141  /lava-7799018/1/../bin/lava-test-case
    2022-11-01T04:18:17.415662  <8>[   40.830238] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/63609e23f3accdfb89e7db94
        failing since 148 days (last pass: v5.18-rc1-24-gc2d7e384924d, firs=
t fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-11-01T04:18:14.401415  /lava-7799018/1/../bin/lava-test-case
    2022-11-01T04:18:14.410980  <8>[   37.825146] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/63609e23f3accdfb89e7db95
        failing since 148 days (last pass: v5.18-rc1-24-gc2d7e384924d, firs=
t fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-11-01T04:18:12.303083  <8>[   35.716981] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>
    2022-11-01T04:18:13.352010  /lava-7799018/1/../bin/lava-test-case
    2022-11-01T04:18:13.364906  <8>[   36.779141] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/63609e23f3accdfb89e7db96
        failing since 148 days (last pass: v5.18-rc1-24-gc2d7e384924d, firs=
t fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-11-01T04:18:12.283305  /lava-7799018/1/../bin/lava-test-case   =

 =20
