Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0C0198
	for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 06:36:49 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id r61-20020a17090a43c300b00212f4e9cccdso15005505pjg.5
        for <chrome-platform@lists.linux.dev>; Sun, 30 Oct 2022 23:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S2Q8g0bh9O2ZiQis5h0lvFZEfSmwR3QzlLHaQWY+zu8=;
        b=AcCUIPH16lJ9kx8wNmziZTDH79AGl5U6uv9XS7Oal1OuQI6pyVkLBfIuW5iYn0q7ra
         JiSggtdVu9qvLtH+o4/PY1+R7dyl/m5KNOk+JYj3xfee9udwKiNSJCmpqpAFvBYgZCNs
         Lj//M14zeIVNpqtutWGDohY8LhMppVP6GZIl5Fi/Mt6ku/3rZJIBumhxAcR78Z8KkdDC
         Q71Y17tsmubFL2npo0N9CVcDoggmbnIfP+O7eh0+rSq7mJK7VUqQg3XBF9ddzMB42LxP
         NPMHxybTohPud9oSU2CDqxKbaevlRfpc9gIlvCoCFznIW3jCUVVR/G3nywP7xZ71uPdj
         VSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S2Q8g0bh9O2ZiQis5h0lvFZEfSmwR3QzlLHaQWY+zu8=;
        b=m4/rUC3t/63OcvKkRsqhszUw8semWAf4dyKrbZn0VJqxnOPfY8+iYat268dHoH/AHR
         GSwjlnsA4j1o9t3Ppr0PmnQLqNGx45iFH2QYKmaKlK2VChTBi6bysBpmVaBEArXP0DAr
         BMVKW/bzpzKLQXGszxrf+kNdE2IlSkzr/zs4novqz1erOx7L2pRKyUnvXgU2bzcMHRiH
         wTzf0dMyarYLYCBWYvY0+7F516myojPa5YDtXqOtpAdkFlWlDElKQfbll7nxi4oCCTh6
         sX5fq1l8A4NEZ8XtGVIU/SyWwh9jPAp3OhY7d9YnP5f5xtt5UJpNRBRBWlz3O3uRZMqD
         07jA==
X-Gm-Message-State: ACrzQf2qgHzvUQs01+eX4l3slIcHdnwV4apzRvWGlfVGTOin9gZpm2KD
	dJw+0YP7adbA+5R7NLmX8LCP9g==
X-Google-Smtp-Source: AMsMyM7fKm/mF1i8dy+x+XMQdQP9IODQiJrJBGDwIzopXxh9W9oyL8GCNgAIoylDrxGLWlCLeQhQAg==
X-Received: by 2002:a17:902:7c12:b0:186:8111:ade2 with SMTP id x18-20020a1709027c1200b001868111ade2mr12838199pll.111.1667198208934;
        Sun, 30 Oct 2022 23:36:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y4-20020a170902ed4400b001714c36a6e7sm3637670plb.284.2022.10.30.23.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 23:36:48 -0700 (PDT)
Message-ID: <635f6d00.170a0220.ff546.5dce@mx.google.com>
Date: Sun, 30 Oct 2022 23:36:48 -0700 (PDT)
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
Subject: chrome-platform/for-kernelci cros-ec: 10 runs,
 7 regressions (v6.1-rc1-5-g27b86a65cd16)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 10 runs, 7 regressions (v6.1-rc1-5-g2=
7b86a65cd16)

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

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.1-rc1-5-g27b86a65cd16/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.1-rc1-5-g27b86a65cd16
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      27b86a65cd16b0e94ef69196b008d701a53feddb

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


  Details:     https://kernelci.org/test/plan/id/635f559e20d5839a91e7db60

  Results:     8 PASS, 2 FAIL, 9 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-5-g27b86a65cd16/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/cros-ec-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-5-g27b86a65cd16/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/cros-ec-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221024.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
35f559e20d5839a91e7db73
        failing since 69 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-10-31T04:56:49.832429  / #
    2022-10-31T04:56:49.838144   =

    2022-10-31T04:56:49.944294  / # #
    2022-10-31T04:56:49.950578  #
    2022-10-31T04:56:50.053187  / # export SHELL=3D/bin/sh
    2022-10-31T04:56:50.059671  export SHELL=3D/bin/sh
    2022-10-31T04:56:50.161759  / # . /lava-7786609/environment
    2022-10-31T04:56:50.168132  . /lava-7786609/environment
    2022-10-31T04:56:50.270549  / # /lava-7786609/bin/lava-test-runner /lav=
a-7786609/0
    2022-10-31T04:56:50.277071  /lava-7786609/bin/lava-test-runner /lava-77=
86609/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/635f561ee5db9f00f8e7db7f

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-5-g27b86a65cd16/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-5-g27b86a65cd16/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221024.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
5f561ee5db9f00f8e7db90
        failing since 69 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
35f561ee5db9f00f8e7db92
        failing since 69 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-10-31T04:58:53.417726  / # =

    2022-10-31T04:58:53.422499  =

    2022-10-31T04:58:53.524175  / # #
    2022-10-31T04:58:53.529440  #
    2022-10-31T04:58:53.630405  / # export SHELL=3D/bin/sh
    2022-10-31T04:58:53.635343  export SHELL=3D/bin/sh
    2022-10-31T04:58:53.736219  / # . /lava-7786651/environment
    2022-10-31T04:58:53.741081  . /lava-7786651/environment
    2022-10-31T04:58:53.842013  / # /lava-7786651/bin/lava-test-runner /lav=
a-7786651/0
    2022-10-31T04:58:53.847421  /lava-7786651/bin/lava-test-runner /lava-77=
86651/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/635f5578bd35e8cfeee7db65

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-5-g27b86a65cd16/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/cros-ec-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-5-g27b86a65cd16/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/cros-ec-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221024.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
5f5578bd35e8cfeee7db76
        failing since 69 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
35f5578bd35e8cfeee7db78
        failing since 69 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-10-31T04:56:06.658955  / # =

    2022-10-31T04:56:06.664551  =

    2022-10-31T04:56:06.767788  / # #
    2022-10-31T04:56:06.774388  #
    2022-10-31T04:56:06.876774  / # export SHELL=3D/bin/sh
    2022-10-31T04:56:06.882534  export SHELL=3D/bin/sh
    2022-10-31T04:56:06.984183  / # . /lava-7786607/environment
    2022-10-31T04:56:06.989682  . /lava-7786607/environment
    2022-10-31T04:56:07.090797  / # /lava-7786607/bin/lava-test-runner /lav=
a-7786607/0
    2022-10-31T04:56:07.096405  /lava-7786607/bin/lava-test-runner /lava-77=
86607/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/635f5a2e9cd5e91b28e7dba4

  Results:     4 PASS, 2 FAIL, 12 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-5-g27b86a65cd16/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/cros-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-5-g27b86a65cd16/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/cros-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221024.1/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
5f5a2e9cd5e91b28e7dbb4
        failing since 59 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
35f5a2e9cd5e91b28e7dbb6
        failing since 59 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483)

    2022-10-31T05:16:19.860240  / # =

    2022-10-31T05:16:19.863661  =

    2022-10-31T05:16:19.972209  / # #
    2022-10-31T05:16:19.975735  #
    2022-10-31T05:16:20.080780  / # export SHELL=3D/bin/sh
    2022-10-31T05:16:20.084274  export SHELL=3D/bin/sh
    2022-10-31T05:16:20.188289  / #. /lava-7786821/environment
    2022-10-31T05:16:20.192427   . /lava-7786821/environment
    2022-10-31T05:16:20.296340  / # /lava-7786821/bin/lava-test-runner /lav=
a-7786821/0
    2022-10-31T05:16:20.300359  /lava-7786821/bin/lava-test-runner /lava-77=
86821/0 =

    ... (10 line(s) more)  =

 =20
