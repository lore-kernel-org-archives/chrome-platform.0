Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADE762C
	for <chrome-platform@lists.linux.dev>; Thu,  8 Dec 2022 03:49:17 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id o12so424969pjo.4
        for <chrome-platform@lists.linux.dev>; Wed, 07 Dec 2022 19:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=idASK/MtpV/qJwdChvBsksbyLUNEoHGXnmcZao62MI4=;
        b=D+NVemwlN6C/6WvnybI4uqnIYr89SXMVjI/Ct3iMcpdm3+6qZRT3Dqp7m587J2lqdP
         P59F7xdGtBTsqPKHMyMFaRZNbVEIdudLCEDSCxNXNyt+IUl3h5L2PeP6GpGWS/5cA4FM
         bJakEJPrpgDuouAVSrZVD1aViYRIWZOGAWepKAeFWNLRTpfyU1mFtY1/hIz7VlVnJyz+
         3cZpvcLWV82Kdn4d3KmY2r1OLCywJkn5AHRMPEDOkbdZA6F5xuCe6uXSyp9CafFa9J0A
         bwWF3l8pS5VxTREozDaXqvXQewfWOKNfG5xc/tWhUrESP6ctaii70Q2DiLFKiFl1q2Kl
         HY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=idASK/MtpV/qJwdChvBsksbyLUNEoHGXnmcZao62MI4=;
        b=WcSIP5QvipK0xHwcMoWUzxs2bqY57nBCFi7S/GaZkmL/V8O2o6ajoibhQY/uaMiSU5
         VmmEEl1+GA1CNwQx0XnPogj7pI2uiNj82NOcj8evzsjVUszaPlS6QdTZMZKlocfBhgHi
         48yKCd7BMCpJ76Rf0WTBDAqDxtPB6x6Hciq5dJueu7T3WkO0qnkSl0doHcF7yzwmKa1W
         yajLXnXIYvxRXGMF+PVJTfDKibRh71Q0l9vA1Qf2Zq6N5ndWnswbPfbMfa03s80mtqP/
         /E4I3YxChir6R/236FQ63P9shn4ZCQmbH037OiO14VyUNXEIAs9b2II4sTPz/41Za5Hf
         80PQ==
X-Gm-Message-State: ANoB5pl0wK2fNTr0hrTDCdZ3tKj+6+ceubrSg3cR1gK502IiA0ss7qc/
	3kY8aTeQkU2dTWUUPxeP6h5o+w==
X-Google-Smtp-Source: AA0mqf6Vv5Uxb0T5dIxK9hOWeoY7yzxc41iXp2XS9WMugVuPrkhXLun4cMMfzCzfHe0h0jDlaZHXGQ==
X-Received: by 2002:a17:902:7005:b0:189:dc47:fe40 with SMTP id y5-20020a170902700500b00189dc47fe40mr1293546plk.15.1670471356744;
        Wed, 07 Dec 2022 19:49:16 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y6-20020a17090322c600b00188f8badbcdsm9843688plg.137.2022.12.07.19.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 19:49:16 -0800 (PST)
Message-ID: <63915ebc.170a0220.13f37.38b9@mx.google.com>
Date: Wed, 07 Dec 2022 19:49:16 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-kernelci
X-Kernelci-Kernel: tag-chrome-platform-for-v6.2-2-g5990db2d66b3
X-Kernelci-Report-Type: test
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci baseline: 88 runs,
 6 regressions (tag-chrome-platform-for-v6.2-2-g5990db2d66b3)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 88 runs, 6 regressions (tag-chrome-p=
latform-for-v6.2-2-g5990db2d66b3)

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
ci/kernel/tag-chrome-platform-for-v6.2-2-g5990db2d66b3/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: tag-chrome-platform-for-v6.2-2-g5990db2d66b3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      5990db2d66b3445e885affcd284301fd2cc14ecd =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6391549e11470ed9452abd0c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.2-2-g5990db2d66b3/arm64/defconfig+arm64-chromeboo=
k/gcc-10/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.2-2-g5990db2d66b3/arm64/defconfig+arm64-chromeboo=
k/gcc-10/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6391549e11470ed9452ab=
d0d
        failing since 97 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =


  Details:     https://kernelci.org/test/plan/id/6391596192f591f98d2abcfa

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.2-2-g5990db2d66b3/arm64/defconfig+arm64-chromeboo=
k/gcc-10/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.2-2-g5990db2d66b3/arm64/defconfig+arm64-chromeboo=
k/gcc-10/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/6391596192f591f98d2abd1c
        failing since 246 days (last pass: v5.17-rc1-10-g0ef49b25b7cc, firs=
t fail: v5.18-rc1-1-gbf84b10d9901d)

    2022-12-08T03:25:57.614959  /lava-8281294/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/6391596192f591f98d2abd3f
        failing since 184 days (last pass: v5.18-rc1-24-gc2d7e384924d, firs=
t fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-12-08T03:25:54.558244  /lava-8281294/1/../bin/lava-test-case
    2022-12-08T03:25:54.577706  <8>[   45.786619] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/6391596192f591f98d2abd40
        failing since 184 days (last pass: v5.18-rc1-24-gc2d7e384924d, firs=
t fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-12-08T03:25:52.438138  =

    2022-12-08T03:25:53.488814  /lava-8281294/1/../bin/lava-test-case
    2022-12-08T03:25:53.505707  <8>[   44.714372] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/6391596192f591f98d2abd41
        failing since 184 days (last pass: v5.18-rc1-24-gc2d7e384924d, firs=
t fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-12-08T03:25:51.335535  <8>[   42.542411] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dpass>
    2022-12-08T03:25:52.421100  /lava-8281294/1/../bin/lava-test-case
    2022-12-08T03:25:52.436080  <8>[   43.645534] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/639153ad8f0fa0833f2abcfc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.2-2-g5990db2d66b3/arm64/defconfig+arm64-chromeboo=
k/gcc-10/lab-collabora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v6.2-2-g5990db2d66b3/arm64/defconfig+arm64-chromeboo=
k/gcc-10/lab-collabora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/639153ad8f0fa0833f2ab=
cfd
        failing since 2 days (last pass: v6.1-rc1-15-g6c7053bf3514, first f=
ail: v6.1-rc1-16-gd74fa18ce5f0) =

 =20
