Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C237CA2C
	for <chrome-platform@lists.linux.dev>; Mon, 19 Sep 2022 05:29:30 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id c24so25756155pgg.11
        for <chrome-platform@lists.linux.dev>; Sun, 18 Sep 2022 22:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=MDxKyaShNqDQ3en/H1CX6qFzd8kpNtIccLRMIsfUky0=;
        b=Br2EPnTYH7VnIjoCrXqkuO1S+/3eZMFysW+DfvSJskOazpjra7JkHwE/mIqmeyNZuv
         ETPL07MmV/3DvAap9fmSZZZ8KudVDmRfDJ/ShR9Bebt0rPQ4kGWl/ryX30moe3Nar+im
         AIjOtL55owzP4sxlNoEzZECfc5CKtrKpr+wNM6c/QmmlXRnXhQ25smnycBGv4uD3BN1D
         t6QOeFrRw/u5jMaSUQvEhaUYKOy0iTcXb7wiagGzwZiQvhUcrlHTgCeanO+RDYXpbRlf
         53NCq/GlNSRtEv8LFOet2+dq2t4i1v8W8+fI8XfaB44IEHZ4Wbh2mG4ghbX0smmEJz2F
         A+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=MDxKyaShNqDQ3en/H1CX6qFzd8kpNtIccLRMIsfUky0=;
        b=12BUMt+uEkThVg3D3Pa9vU2cgZYA3moQF5GjHR+9PvBRa/47Y0Kwvh4uwHekxG2w+/
         ukgrVidOHyvNod2vOoi6Dg8cPWlv3t7Zc+eMGLwmlj+i2k7wzpNPoOGz6uObxPAOYkxB
         uhW+NUcO/0VqWMK3NoRG4E0rF6QYEftq8GgHUo4nuLK0ritm2XVr3jefLpS6OrSb1sRA
         gBmIfHQiRcF1ln1VMu11kcV3qTwHvAqR/JopnU5qjjJO3k+gKvQjIGyXf5letHz1akwD
         lvGp+uaEzU8pfeW/j4d6UI0W9eECVrJZG/lQHfm01WUmvpLGxWtktcWUvZCIemrVARbT
         NDow==
X-Gm-Message-State: ACrzQf3SjxecbfUM3cfeji+Z6njuo0e85qLHBPub9OKSzqR+dH7t2imt
	9NBvLiIN0dmiuunO8tqJqcBOMQ==
X-Google-Smtp-Source: AMsMyM7KVXbOHy5yAvDD7Z4Nh6lww/hnYaqF6f4TgIjbGeZq1ZMhn/Ne78SVt5B03KYQHZGRSypSDg==
X-Received: by 2002:a65:42c8:0:b0:41a:8138:f47f with SMTP id l8-20020a6542c8000000b0041a8138f47fmr14463212pgp.476.1663565370054;
        Sun, 18 Sep 2022 22:29:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u127-20020a626085000000b0053e80618a23sm19218755pfb.34.2022.09.18.22.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Sep 2022 22:29:29 -0700 (PDT)
Message-ID: <6327fe39.620a0220.a80f7.10e2@mx.google.com>
Date: Sun, 18 Sep 2022 22:29:29 -0700 (PDT)
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
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.0-rc1-20-g95a789b97c72
Subject: chrome-platform/for-kernelci cros-ec: 9 runs,
 8 regressions (v6.0-rc1-20-g95a789b97c72)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 9 runs, 8 regressions (v6.0-rc1-20-g9=
5a789b97c72)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =

mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.0-rc1-20-g95a789b97c72/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.0-rc1-20-g95a789b97c72
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      95a789b97c72e00d7be6951ebc3fe537803003a6

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  86181a7fbd379fc42314c450740d2cea8cdf04c1 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6327e7c2d769fae3363556f2

  Results:     8 PASS, 2 FAIL, 9 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-20-g95a789b97c72/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-20-g95a789b97c72/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
327e7c2d769fae336355705
        failing since 27 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-09-19T03:53:16.536309  / # =

    2022-09-19T03:53:16.541072  =

    2022-09-19T03:53:16.642748  / # #
    2022-09-19T03:53:16.648095  #
    2022-09-19T03:53:16.749169  / # export SHELL=3D/bin/sh
    2022-09-19T03:53:16.754193  export SHELL=3D/bin/sh
    2022-09-19T03:53:16.855134  / # . /lava-7310655/environment
    2022-09-19T03:53:16.859951  . /lava-7310655/environment
    2022-09-19T03:53:16.960931  / # /lava-7310655/bin/lava-test-runner /lav=
a-7310655/0
    2022-09-19T03:53:16.965902  /lava-7310655/bin/lava-test-runner /lava-73=
10655/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/6327e85d1a3cedc672355647

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-20-g95a789b97c72/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-20-g95a789b97c72/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
27e85e1a3cedc672355658
        failing since 27 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
327e85e1a3cedc67235565a
        failing since 27 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-09-19T03:55:58.669412  / # =

    2022-09-19T03:55:58.674865  =

    2022-09-19T03:55:58.780847  / # #
    2022-09-19T03:55:58.786840  #
    2022-09-19T03:55:58.889250  / # export SHELL=3D/bin/sh
    2022-09-19T03:55:58.895113  export SHELL=3D/bin/sh
    2022-09-19T03:55:58.996914  / # . /lava-7310627/environment
    2022-09-19T03:55:59.002851  . /lava-7310627/environment
    2022-09-19T03:55:59.104907  / # /lava-7310627/bin/lava-test-runner /lav=
a-7310627/0
    2022-09-19T03:55:59.110508  /lava-7310627/bin/lava-test-runner /lava-73=
10627/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/6327e79afcedfdbc2b355642

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-20-g95a789b97c72/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-20-g95a789b97c72/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
27e79afcedfdbc2b355653
        failing since 27 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
327e79afcedfdbc2b355655
        failing since 27 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-09-19T03:52:44.112265  / # =

    2022-09-19T03:52:44.117668  =

    2022-09-19T03:52:44.219275  / # #
    2022-09-19T03:52:44.224761  #
    2022-09-19T03:52:44.325805  / # export SHELL=3D/bin/sh
    2022-09-19T03:52:44.331109  export SHELL=3D/bin/sh
    2022-09-19T03:52:44.432178  / # . /lava-7310626/environment
    2022-09-19T03:52:44.437500  . /lava-7310626/environment
    2022-09-19T03:52:44.538406  / # /lava-7310626/bin/lava-test-runner /lav=
a-7310626/0
    2022-09-19T03:52:44.543192  /lava-7310626/bin/lava-test-runner /lava-73=
10626/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6327e9b1cc80a5efc8355687

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-20-g95a789b97c72/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-20-g95a789b97c72/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/6327e9b1cc80a5efc83556=
88
        failing since 11 days (last pass: v6.0-rc1-18-gf36a064d1483, first =
fail: v6.0-rc1-19-gd378c6f0456c) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/6327eb6eb92266aad2355717

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-20-g95a789b97c72/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-20-g95a789b97c72/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
27eb6eb92266aad2355728
        failing since 17 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
327eb6eb92266aad235572a
        failing since 17 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483)

    2022-09-19T04:09:07.235900  / # =

    2022-09-19T04:09:07.239407  =

    2022-09-19T04:09:07.348383  / # #
    2022-09-19T04:09:07.349815  <6>[   20.658673] mwifiex_pcie 0000:01:00.0=
: info: FW download over, size 638992 bytes
    2022-09-19T04:09:07.351839  #
    2022-09-19T04:09:07.456317  / # export SHELL=3D/bin/sh
    2022-09-19T04:09:07.459809  export SHELL=3D/bin/sh
    2022-09-19T04:09:07.564911  / # . /lava-7310750/environment
    2022-09-19T04:09:07.569576  . /lava-7310750/environment
    2022-09-19T04:09:07.672007  / # /lava-7310750/bin/lava-test-runner /lav=
a-7310750/0 =

    ... (15 line(s) more)  =

 =20
