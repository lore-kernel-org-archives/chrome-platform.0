Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E147A7EE
	for <chrome-platform@lists.linux.dev>; Tue, 23 Aug 2022 02:59:08 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id f21so12807152pjt.2
        for <chrome-platform@lists.linux.dev>; Mon, 22 Aug 2022 19:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=RjFwHBkyiNvt47g+xwlXTcxEyKpFYSM1ZvsO6o3yWEU=;
        b=Q3ceUjjiBMZ8GQ2D1yYHOQEA+akKd8VlyMW9h0GFrEkCdFzLoo+tE7jLR8yzQHJYlN
         jmB0iue3lQdS60+z+l5IjCK6Pt8CDyGYibNh3qdx4CpNOXtPzBFUZ71Y4bbmS/1KhV0R
         F/otk7z31WUT6/trX7iB3JwVTVkxyuTmBO1CVZQyKuiHYZzEEbJfm1on2XkDpzIFGsza
         kIXbwiUQ/jIrllL0FvGiSTA40T5Ux7sRcZU78hdqeGCMMIyvoF2fsYlvsr7zAzFokoZ7
         zhttxA1m/oZBsJDAB/C9VIq96vV5DOBCZaCc7QlkJ+FjGTLoDm4PKswcv82MBMJZWVzj
         E7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=RjFwHBkyiNvt47g+xwlXTcxEyKpFYSM1ZvsO6o3yWEU=;
        b=Fj3Qnq1lEHbHYaBmOu01ZiiYdfA0gqQZL03qgC+5puSHUlqbtBhXvV//y8NHgRvQZq
         1uxNVCYXrLMP3MpujqTKyz474RK/xbyWfDyrt1L7YRq1sHGFDkK5D1+J262wy10kHDt/
         rm9bHNt55boS43q/5aBrNdXAAhEJXYZoc8vVDUgSdG3tJXlsrJrR6vlLjuAX4tiQhIcm
         hut48n0POI4xARrHHo9XmQzrbMn1m9XoYY91p9mAC/BsqkETKRIzEl5mPdH1I0+E1zCt
         SQToio6UmkKm51oWVtqmzwkWeqtld3MrL0vhunRAmYFw9LOyCAEXOhHKpB96Ynaoqkmp
         fUXQ==
X-Gm-Message-State: ACgBeo0+oAaGTMw5j9/hYX++rFactjRyrKjpeeP7bIjqXM9+4GF8Iupp
	LeRZ8bDobRh0XCLVhTS6Cd0/4g==
X-Google-Smtp-Source: AA6agR7GCJEKI3WZ3gUUtuZM4bkJjQ5x6Uhz/201tKa1K3dL66swpssatMfIU117VJwYCDfRC+jfvQ==
X-Received: by 2002:a17:902:8e83:b0:173:28b:3616 with SMTP id bg3-20020a1709028e8300b00173028b3616mr827598plb.149.1661223548313;
        Mon, 22 Aug 2022 19:59:08 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w6-20020a6556c6000000b0042a713dd68csm4709483pgs.53.2022.08.22.19.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 19:59:08 -0700 (PDT)
Message-ID: <6304427c.650a0220.3b7d5.7e64@mx.google.com>
Date: Mon, 22 Aug 2022 19:59:08 -0700 (PDT)
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
X-Kernelci-Kernel: v6.0-rc1-11-g48a86d3e4836
Subject: chrome-platform/for-kernelci cros-ec: 5 runs,
 5 regressions (v6.0-rc1-11-g48a86d3e4836)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 5 runs, 5 regressions (v6.0-rc1-11-g4=
8a86d3e4836)

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


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.0-rc1-11-g48a86d3e4836/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.0-rc1-11-g48a86d3e4836
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      48a86d3e48368fd79d1c4b96158cb77346f1867e

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


  Details:     https://kernelci.org/test/plan/id/630429d09110b60a54355674

  Results:     8 PASS, 2 FAIL, 9 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-11-g48a86d3e4836/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-11-g48a86d3e4836/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220812.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
30429d09110b60a54355687
        new failure (last pass: tag-chrome-platform-for-v5.20-2-gddffaa3d76=
750)

    2022-08-23T01:13:10.767329  / #
    2022-08-23T01:13:10.773744   =

    2022-08-23T01:13:10.879920  / # #
    2022-08-23T01:13:10.886344  #
    2022-08-23T01:13:10.988902  / # export SHELL=3D/bin/sh
    2022-08-23T01:13:10.994747  export SHELL=3D/bin/sh
    2022-08-23T01:13:11.096816  / # . /lava-7093951/environment
    2022-08-23T01:13:11.103293  . /lava-7093951/environment
    2022-08-23T01:13:11.205564  / # /lava-7093951/bin/lava-test-runner /lav=
a-7093951/0
    2022-08-23T01:13:11.211901  /lava-7093951/bin/lava-test-runner /lava-70=
93951/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/63042fe6420a5538d135569a

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-11-g48a86d3e4836/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-11-g48a86d3e4836/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220812.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
042fe6420a5538d13556ab
        new failure (last pass: tag-chrome-platform-for-v5.20-2-gddffaa3d76=
750) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3042fe6420a5538d13556ad
        new failure (last pass: tag-chrome-platform-for-v5.20-2-gddffaa3d76=
750)

    2022-08-23T01:39:33.808478  / # =

    2022-08-23T01:39:33.812952  =

    2022-08-23T01:39:33.914549  / # #
    2022-08-23T01:39:33.919117  #
    2022-08-23T01:39:34.020065  / # export SHELL=3D/bin/sh
    2022-08-23T01:39:34.024939  export SHELL=3D/bin/sh
    2022-08-23T01:39:34.125827  / # . /lava-7093931/environment
    2022-08-23T01:39:34.130214  . /lava-7093931/environment
    2022-08-23T01:39:34.231129  / # /lava-7093931/bin/lava-test-runner /lav=
a-7093931/0
    2022-08-23T01:39:34.236006  /lava-7093931/bin/lava-test-runner /lava-70=
93931/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/63042969e751b53f3d35564a

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-11-g48a86d3e4836/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-11-g48a86d3e4836/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220812.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
042969e751b53f3d35565b
        new failure (last pass: tag-chrome-platform-for-v5.20-2-gddffaa3d76=
750) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3042969e751b53f3d35565d
        new failure (last pass: tag-chrome-platform-for-v5.20-2-gddffaa3d76=
750)

    2022-08-23T01:11:47.491084  / # =

    2022-08-23T01:11:47.496334  =

    2022-08-23T01:11:47.597991  / # #
    2022-08-23T01:11:47.603460  #
    2022-08-23T01:11:47.704517  / # export SHELL=3D/bin/sh
    2022-08-23T01:11:47.710379  export SHELL=3D/bin/sh
    2022-08-23T01:11:47.811338  / # . /lava-7093916/environment
    2022-08-23T01:11:47.816599  . /lava-7093916/environment
    2022-08-23T01:11:47.917361  / # /lava-7093916/bin/lava-test-runner /lav=
a-7093916/0
    2022-08-23T01:11:47.923187  /lava-7093916/bin/lava-test-runner /lava-70=
93916/0 =

    ... (7 line(s) more)  =

 =20
