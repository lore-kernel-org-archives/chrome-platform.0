Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918B8801
	for <chrome-platform@lists.linux.dev>; Wed,  2 Nov 2022 12:25:41 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id l6so16118895pjj.0
        for <chrome-platform@lists.linux.dev>; Wed, 02 Nov 2022 05:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zxFeC4FETnfSBEvTPiKFt7mJ6d6aLyJZCfdvFTAOTxo=;
        b=khZdmyr21+uSE7L50vXnNnM/gnRRO5NW+KGsr+jn07pcZ/Bhu+cXbXwD5SZqw88Orz
         pStyqHzsi4YljQyft4keka9+VDfzrH4uFhQ0ZRkz/qZmQ1831X5ywDkrgGbWZ5wGS8IO
         MiiZQdSTVKON9L1SEnZ9V+L2H8QAU+0tCrJOOFUQBOgw5vrdzsU2uVDP0xN263dCAxLU
         hqS7lU6Xk0ZobGf04+cbwULDlTLw1znQzqcm9XAhx/NPKGhDtcSXznLxdrCGZt7wRJLh
         F7BIb6qQXHq9JLpmxdkX3ZYIW+fi/dSqmwlcwd/7hwwMe/i7EjxzazCCqGBCMix1YDdR
         ZLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zxFeC4FETnfSBEvTPiKFt7mJ6d6aLyJZCfdvFTAOTxo=;
        b=P0cFbLHgQQRZpHRRYyXyZiDmFS9qHHuzJXi7/NXlhEDIYUOTopFjWLe5e6MdT57AFf
         pwyVh+7s8MSZ0NLAsUYSRQiyABpk058OrzawHfo78JxNMeTnL2adEzO2mtfysSZywjD2
         G25SgPXZTBVI5aK2cpNdHd1adtqNNqxrpeWsG74B6bm9kTuDh5HY+HBwi9rkFIeitTtK
         KZX18D+joFlAKF/wld6AMYmKDd0AosLUpyG3A+u4zCgaZ1do02P7wtwVTAEY65bp3SDS
         yWgGfcSlw9Xn0GrlAHv8+phPRup/BySR/w/14NUdCnObDkQyqijN7sej1s16MCsF1+QJ
         SALw==
X-Gm-Message-State: ACrzQf3uJgVZzHkNNyNOaKMtLoiEeNIOxGFEN8qRC6WImP9y9efjbocq
	pBOowo74HAUoPAynXA0f2DBGCQ==
X-Google-Smtp-Source: AMsMyM44bmFUidl6RfbAjVWI1meLlLn+GAkC4KG3smT5Bic1UVc8DjR3GpjBRDQmKCjW8q8e1LrBVA==
X-Received: by 2002:a17:90b:8c5:b0:213:de45:d126 with SMTP id ds5-20020a17090b08c500b00213de45d126mr17096109pjb.34.1667391940976;
        Wed, 02 Nov 2022 05:25:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t5-20020a1709027fc500b00178650510f9sm8193795plb.160.2022.11.02.05.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 05:25:40 -0700 (PDT)
Message-ID: <636261c4.170a0220.314f5.efb7@mx.google.com>
Date: Wed, 02 Nov 2022 05:25:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.1-rc1-12-g52f572342440
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci cros-ec: 10 runs,
 7 regressions (v6.1-rc1-12-g52f572342440)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 10 runs, 7 regressions (v6.1-rc1-12-g=
52f572342440)

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
ci/kernel/v6.1-rc1-12-g52f572342440/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.1-rc1-12-g52f572342440
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      52f5723424401d8d2efb78818d5a38684d70d519

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


  Details:     https://kernelci.org/test/plan/id/63624a16c49f70a70ce7db56

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-12-g52f572342440/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-12-g52f572342440/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221024.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3624a16c49f70a70ce7db69
        failing since 71 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-11-02T10:44:26.413324  / # =

    2022-11-02T10:44:26.418537  =

    2022-11-02T10:44:26.520254  / # #
    2022-11-02T10:44:26.525313  #
    2022-11-02T10:44:26.626362  / # export SHELL=3D/bin/sh
    2022-11-02T10:44:26.626536  <4>[   11.361782] cros-ec-spi spi-PRP0001:0=
1: EC failed to respond in time
    2022-11-02T10:44:26.626619  <3>[   11.369291] cros-ec-spi spi-PRP0001:0=
1: Cannot identify the EC: error -110
    2022-11-02T10:44:26.626687  <3>[   11.377276] cros-ec-spi spi-PRP0001:0=
1: cannot register EC
    2022-11-02T10:44:26.626756  <4>[   11.383908] cros-ec-spi: probe of spi=
-PRP0001:01 failed with error -110
    2022-11-02T10:44:26.626820  export SHELL=3D/bin/sh<4>[   11.400151] cro=
s-ec-sensorhub cros-ec-sensorhub.1.auto: no info for EC sensor 3 : -22/3 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/63624a00185f64218be7db4e

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-12-g52f572342440/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-12-g52f572342440/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221024.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
624a00185f64218be7db5f
        failing since 71 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3624a00185f64218be7db61
        failing since 71 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-11-02T10:44:00.321228  / # =

    2022-11-02T10:44:00.326344  =

    2022-11-02T10:44:00.428041  / # #
    2022-11-02T10:44:00.432960  #
    2022-11-02T10:44:00.534028  / # export SHELL=3D/bin/sh
    2022-11-02T10:44:00.538726  export SHELL=3D/bin/sh
    2022-11-02T10:44:00.639690  / # . /lava-7814922/environment
    2022-11-02T10:44:00.644477  . /lava-7814922/environment
    2022-11-02T10:44:00.745411  / # /lava-7814922/bin/lava-test-runner /lav=
a-7814922/0
    2022-11-02T10:44:00.750770  /lava-7814922/bin/lava-test-runner /lava-78=
14922/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/636249f3efe1829ad3e7db58

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-12-g52f572342440/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-12-g52f572342440/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221024.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
6249f3efe1829ad3e7db69
        failing since 71 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
36249f3efe1829ad3e7db6b
        failing since 71 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-11-02T10:43:40.261717  / # =

    2022-11-02T10:43:40.267527  =

    2022-11-02T10:43:40.369168  / # #
    2022-11-02T10:43:40.374362  #
    2022-11-02T10:43:40.475348  / # export SHELL=3D/bin/sh
    2022-11-02T10:43:40.480264  export SHELL=3D/bin/sh
    2022-11-02T10:43:40.581144  / # . /lava-7814904/environment
    2022-11-02T10:43:40.586603  . /lava-7814904/environment
    2022-11-02T10:43:40.687565  / # /lava-7814904/bin/lava-test-runner /lav=
a-7814904/0
    2022-11-02T10:43:40.693171  /lava-7814904/bin/lava-test-runner /lava-78=
14904/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/6362513c9dfbe302b8e7db76

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-12-g52f572342440/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-12-g52f572342440/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221024.1/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
62513c9dfbe302b8e7db87
        failing since 62 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
362513c9dfbe302b8e7db89
        failing since 62 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483)

    2022-11-02T11:15:03.398432  / # =

    2022-11-02T11:15:03.401800  =

    2022-11-02T11:15:03.509452  / # #
    2022-11-02T11:15:03.511757  #<6>[   30.554708] mwifiex_pcie 0000:01:00.=
0: info: FW download over, size 638992 bytes
    2022-11-02T11:15:03.513165  =

    2022-11-02T11:15:03.617206  / # export SHELL=3D/bin/sh
    2022-11-02T11:15:03.620102  export SHELL=3D/bin/sh
    2022-11-02T11:15:03.724600  / # . /lava-7815262/environment
    2022-11-02T11:15:03.728001  . /lava-7815262/environment
    2022-11-02T11:15:03.833463  / # /lava-7815262/bin/lava-test-runner /lav=
a-7815262/0 =

    ... (15 line(s) more)  =

 =20
