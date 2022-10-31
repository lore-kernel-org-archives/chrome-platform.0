Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D3317CC1
	for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 05:51:49 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id r61-20020a17090a43c300b00212f4e9cccdso14934688pjg.5
        for <chrome-platform@lists.linux.dev>; Sun, 30 Oct 2022 22:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=86pzPSblw9arkVq5HQl5Nz6NbtzU2V7z+RrlzT2LRgo=;
        b=UHVMe6q9Y7QijyHFHSAC/wYsaxtdHfqPUBtkXZnJBS9q2ojMbmfhQJoNv7Nnibxptz
         +P+LjAB943OpEyI5OTt2diLSatQqqydyqQrzeb6uehK9HZ0IsNT5NYL+4BIo1aPKTaDY
         UOcv2XUW13VDt937bwgP3QpEhDcX+NTtvW7EJV2QlKA3eRkvqBXF6IXYBXk6kjJhn8GU
         CWY+9GgO8NQFbbD4HAU5aCO7iZmMXAUpQlqP5FMvFBHKmJ2YZTRrMp0wikEKQyEdrD5J
         XqDsWcYdD+uTweyDOqK3Kkh9qvQZ6HmY8sr7rhqbyvXL8xKjobbyWvwuhX+a8VxHX3bC
         /Ujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86pzPSblw9arkVq5HQl5Nz6NbtzU2V7z+RrlzT2LRgo=;
        b=gcLuG77ZQqraV49hnUu7oK323cJnzJkVphCu4+BjKlv93kOS1Djs0i2zFMHIbsBGkI
         GMyOVKrAPePgg7yXR9PLNZm4wfNGO4G4n2DpmbOHJL08ioohOpvYMpo7/0ekOfQ+yEQg
         NrmOnUAMp6XP/qtttB4y0qKTr8xAPk8I48+cF1i7q8Z1jWGABnRbmaaCaD9HA++L1oCO
         o3Ad0ujxIYQv856PYNGUcQjERSfK2Nh/GLgs+FV5TR4XmseNkyIJrxT47JZtdplPrcID
         i+4nAuRmjZLp8Nirrc504lM17CIJHteq+bZI5itwYh7Ewna74xlJuiBaRiqfLm6Hfe0b
         +Dhw==
X-Gm-Message-State: ACrzQf3wdrmy+gzuolTOSEqpMT2LmSJVnkk1VXUxJRiXBo4OVEjQoqku
	2XPdK0uyOKbQBjb14bxaXdv/OA==
X-Google-Smtp-Source: AMsMyM5pKMujaknycMARcs0lM2U7nwjwhjPw1kFwK+sJtxRYPjEcTBFhj8wSoVyvBVkR36bMOYikbw==
X-Received: by 2002:a17:903:32ce:b0:187:143f:4c4d with SMTP id i14-20020a17090332ce00b00187143f4c4dmr7596469plr.135.1667195508784;
        Sun, 30 Oct 2022 22:51:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p1-20020a170902e74100b001784a45511asm3564272plf.79.2022.10.30.22.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 22:51:48 -0700 (PDT)
Message-ID: <635f6274.170a0220.79b7b.5d1a@mx.google.com>
Date: Sun, 30 Oct 2022 22:51:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.1-rc1-5-g27b86a65cd16
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci baseline: 98 runs,
 5 regressions (v6.1-rc1-5-g27b86a65cd16)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 98 runs, 5 regressions (v6.1-rc1-5-g=
27b86a65cd16)

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
ci/kernel/v6.1-rc1-5-g27b86a65cd16/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.1-rc1-5-g27b86a65cd16
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      27b86a65cd16b0e94ef69196b008d701a53feddb =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/635f5937dc56bfd2b5e7db6b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-5-g27b86a65cd16/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-5-g27b86a65cd16/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/635f5937dc56bfd2b5e7d=
b6c
        failing since 59 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =


  Details:     https://kernelci.org/test/plan/id/635f585b4cac8cb70ce7db4e

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-5-g27b86a65cd16/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-5-g27b86a65cd16/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/635f585b4cac8cb70ce7db74
        failing since 208 days (last pass: v5.17-rc1-10-g0ef49b25b7cc, firs=
t fail: v5.18-rc1-1-gbf84b10d9901d)

    2022-10-31T05:08:28.264507  /lava-7786804/1/../bin/lava-test-case
    2022-10-31T05:08:28.281732  <8>[   49.835676] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/635f585b4cac8cb70ce7db97
        failing since 147 days (last pass: v5.18-rc1-24-gc2d7e384924d, firs=
t fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-10-31T05:08:24.155654  <8>[   45.707785] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>
    2022-10-31T05:08:25.203819  /lava-7786804/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/635f585b4cac8cb70ce7db98
        failing since 147 days (last pass: v5.18-rc1-24-gc2d7e384924d, firs=
t fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-10-31T05:08:23.083107  <8>[   44.634358] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>
    2022-10-31T05:08:24.139057  /lava-7786804/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/635f585b4cac8cb70ce7db99
        failing since 147 days (last pass: v5.18-rc1-24-gc2d7e384924d, firs=
t fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-10-31T05:08:21.966121  <8>[   43.517597] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dpass>
    2022-10-31T05:08:23.060571  /lava-7786804/1/../bin/lava-test-case   =

 =20
