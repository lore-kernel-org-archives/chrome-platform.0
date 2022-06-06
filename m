Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483C523A0
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 06:29:53 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id p8so11957285pfh.8
        for <chrome-platform@lists.linux.dev>; Sun, 05 Jun 2022 23:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=EkB6aDnLHJ/G5YT2a+tvpghhZXd+tkam6BvV2bZZ2Sw=;
        b=STNNEPKoFhIlqmW1Sm4oUV0gf4+8SDspgk2y9iwYOhQJzb4Waa+tXqY1yMx+wPsCOB
         AlvsullKio3el7S7MYUfsKOJRUHcv59Wa4TVZ1IwaSanT3xR1EztgFEbOIl005+02rgl
         me/OC0KCo5cmJfdG/EhOEzpzvFX4ej6WYsHaxukcFx0HhhhbXYhLsUS9hW3KykICsdP8
         C0k1gspZDRId2vXPDbokwX7Uot251/PFudGGSKutd9P4iPebVx1WJlwOPgYsNk+Hj46t
         O/lyrh/LVrDi8gvYiL83Vz9Fe+lYLzTwjv6KEcIbETC6Ro7mdd4S6zpsSpQBKSjWMiB7
         RLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=EkB6aDnLHJ/G5YT2a+tvpghhZXd+tkam6BvV2bZZ2Sw=;
        b=NCPnJrG4y9z2C5whN8MNpWYiaD8Y8WFVZk+Pq1pWAu71wkBE8ANPK2ZFD/GrhkKAd9
         IAAroo5W1fmvhHjLR3V8vkPB+v7r0+yNP2H6Ycfdv7d4SncMLYvi2pxTtrPmNluYMM/C
         HbNJWBvYx2fYoJ/KlK0TI5qPd+YIgoaX4eTq0qLvH18jgDtdy2QXIOg6upYmfDQodfAS
         QQyDmUndOyJTjTlLb/xMdd1XgugRgWBpldQJHTHLq2oKOr4mRjsMK13wlYU6Ye9xUUUG
         6R2FC6TvcbOb5vnKMJWZ21nbsDMmpM7E+07HVCOMo3bndy7+wqjdjkeEACmeuLI6sQLF
         NKvA==
X-Gm-Message-State: AOAM530PvlL47HydxPYXNRLlMlSunOh0gpXA4c7zhi3XE9tN4ICsWg6r
	Fi9w/YfHQWxVJMp9w4B8SDN/IQ==
X-Google-Smtp-Source: ABdhPJxe1IAfhypiBY8HMlYTBG8vTNgQZ7IsO25/Oc4ZAQHSqLayuTDrpATYPqI3GuQDciWFl4edvg==
X-Received: by 2002:a63:4d08:0:b0:3fd:8436:edb5 with SMTP id a8-20020a634d08000000b003fd8436edb5mr7025257pgb.427.1654496992596;
        Sun, 05 Jun 2022 23:29:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w125-20020a623083000000b0051b915c1a47sm8708879pfw.113.2022.06.05.23.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 23:29:51 -0700 (PDT)
Message-ID: <629d9edf.1c69fb81.285a4.3335@mx.google.com>
Date: Sun, 05 Jun 2022 23:29:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc1-6-gc1db0861e8d02
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci cros-ec: 10 runs,
 4 regressions (v5.19-rc1-6-gc1db0861e8d02)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 10 runs, 4 regressions (v5.19-rc1-6-g=
c1db0861e8d02)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
mt8173-elm-hana   | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 1          =

rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =

rk3399-gru-kevin  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 1          =

tegra124-nyan-big | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.19-rc1-6-gc1db0861e8d02/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.19-rc1-6-gc1db0861e8d02
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      c1db0861e8d025ee5b2e0a83f6691aa9098f2f18

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  86181a7fbd379fc42314c450740d2cea8cdf04c1 =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
mt8173-elm-hana   | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 1          =


  Details:     https://kernelci.org/test/plan/id/629d8aec85ef17e5a3a39c19

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-6-gc1db0861e8d02/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-6-gc1db0861e8d02/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220527.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/629d8aec85ef17e5a3a39c=
1a
        new failure (last pass: v5.19-rc1-5-g4a0e708bb23fc) =

 =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/629d8b0a92934e483da39c80

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-6-gc1db0861e8d02/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-=
ec-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-6-gc1db0861e8d02/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-=
ec-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220527.0/armhf/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/629d8b0a92934e483da39c=
81
        failing since 0 day (last pass: v5.18-rc1-24-gc2d7e384924d, first f=
ail: v5.19-rc1-5-g4a0e708bb23fc) =

 =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
rk3399-gru-kevin  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 1          =


  Details:     https://kernelci.org/test/plan/id/629d8923ff112ba2a7a39c49

  Results:     4 PASS, 1 FAIL, 14 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-6-gc1db0861e8d02/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-6-gc1db0861e8d02/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220527.0/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_rtc_abi: https://kernelci.org/test/case/id/629d892=
3ff112ba2a7a39c4c
        failing since 0 day (last pass: v5.18-rc1-24-gc2d7e384924d, first f=
ail: v5.19-rc1-5-g4a0e708bb23fc) =

 =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
tegra124-nyan-big | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/629d8b8f8644a111b2a39bd0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-6-gc1db0861e8d02/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-=
ec-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-6-gc1db0861e8d02/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-=
ec-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220527.0/armhf/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/629d8b8f8644a111b2a39b=
d1
        failing since 0 day (last pass: v5.18-rc1-24-gc2d7e384924d, first f=
ail: v5.19-rc1-5-g4a0e708bb23fc) =

 =20
