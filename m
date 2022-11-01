Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC6F392
	for <chrome-platform@lists.linux.dev>; Tue,  1 Nov 2022 05:40:55 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id io19so12636443plb.8
        for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 22:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N7/A6wWYdIzFHEOI6WTUUQtSDGKiKmk6E92Rl4QqkVU=;
        b=HUXQRihP/M3l3gXBR2ksCJ59vve7jyd6vJK+QtjQCsB7aN8R0iQH7NVw/4HGh889KJ
         SvOPj+Ye8EC6dOzsarBpKJEuS6B1BfHVSk/PKs7we+nuEWCGQ0w0WE69NVUvGWg5rGA3
         RRDC0QBA9HKyWD8rnTt+FyW40CQM4anRL//Aiw7eqFhwcFQO5vpnKIObLeYuedI0Ptbv
         mutswHe8GoeecJHoH3mpjxBD5DQDaRouxrFl4N2wOSAHCXa9jaTFwEtZnWpFxSKWI0T2
         /CzCAIJtV407V/d5AImXGu4+63rl5PS7M72Q8nXYTiJDV2ZpbQvod4LW+2F40rSFzA6v
         gjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N7/A6wWYdIzFHEOI6WTUUQtSDGKiKmk6E92Rl4QqkVU=;
        b=CO9tyuLgwOaOjf90CoDsMUZBguM9wi5CCF413sDfEYmhNu5z6wl5XmCzOT7Zd5JqC8
         WOpsTNVVK0lKpTV4h8ayJEbf+Tq99JuvYCj2u6YE3IR2jrvR3WQy/OBXIxvSBrDYwDhW
         tDK+WrVogQpJeKrJc4xJMtmJnKr1g7CC9JTesID/m7dXfP8ASBGsBwEh8ZnQd+QWkp9e
         uxEIvRp4VR1iC7AeFId+OuZUQy5C8URkMnppqEw/TTh7BVrnfAutontnIQjWUvLOGimL
         FB7wmMgRBEo5F8r/XzQnjqQq8NpDxtgTr0uUU0k/Bi4a4hDJvN4SGSydxOOi5MafFWPE
         aPjQ==
X-Gm-Message-State: ACrzQf1s7dBoqIrud6/ZqAlQitkNSqqw0s8o+ZkmlhOifdMhP5i4hxld
	nrYLQUyoWMFB9Q/7QkL1bDq7yg==
X-Google-Smtp-Source: AMsMyM6AmIOdwH5jjLd2js8QkbEu4wYsDS26Ss+BiSoDQWClH1YJd564p6md0cf78gPkk3YKBxoSpA==
X-Received: by 2002:a17:90a:d586:b0:213:de8f:4d6 with SMTP id v6-20020a17090ad58600b00213de8f04d6mr9867023pju.31.1667281254823;
        Mon, 31 Oct 2022 22:40:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 22-20020a17090a031600b001fb1de10a4dsm5109525pje.33.2022.10.31.22.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 22:40:54 -0700 (PDT)
Message-ID: <6360b166.170a0220.dd677.91c5@mx.google.com>
Date: Mon, 31 Oct 2022 22:40:54 -0700 (PDT)
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
Subject: chrome-platform/for-kernelci cros-ec: 8 runs,
 7 regressions (v6.1-rc1-6-g18ffa74c2259)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 8 runs, 7 regressions (v6.1-rc1-6-g18=
ffa74c2259)

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
ci/kernel/v6.1-rc1-6-g18ffa74c2259/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.1-rc1-6-g18ffa74c2259
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      18ffa74c225988fdc907dd59051256d39816346c

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


  Details:     https://kernelci.org/test/plan/id/63609a6a80d825de00e7db6c

  Results:     8 PASS, 2 FAIL, 9 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-6-g18ffa74c2259/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/cros-ec-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-6-g18ffa74c2259/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/cros-ec-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221024.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3609a6a80d825de00e7db7f
        failing since 70 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-11-01T04:02:44.437018  / # =

    2022-11-01T04:02:44.443162  =

    2022-11-01T04:02:44.548605  / # #
    2022-11-01T04:02:44.554932  #
    2022-11-01T04:02:44.657427  / # export SHELL=3D/bin/sh
    2022-11-01T04:02:44.663961  export SHELL=3D/bin/sh
    2022-11-01T04:02:44.765890  / # . /lava-7798839/environment
    2022-11-01T04:02:44.771518  . /lava-7798839/environment
    2022-11-01T04:02:44.872514  / # /lava-7798839/bin/lava-test-runner /lav=
a-7798839/0
    2022-11-01T04:02:44.878519  /lava-7798839/bin/lava-test-runner /lava-77=
98839/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/63609e3b84a7b3c2d6e7db4e

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-6-g18ffa74c2259/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-6-g18ffa74c2259/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221024.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
609e3b84a7b3c2d6e7db5f
        failing since 70 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3609e3b84a7b3c2d6e7db61
        failing since 70 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-11-01T04:18:49.029379  / # =

    2022-11-01T04:18:49.034245  =

    2022-11-01T04:18:49.135905  / # #
    2022-11-01T04:18:49.140515  #
    2022-11-01T04:18:49.241505  / # export SHELL=3D/bin/sh
    2022-11-01T04:18:49.246043  export SHELL=3D/bin/sh
    2022-11-01T04:18:49.346764  / # . /lava-7798863/environment
    2022-11-01T04:18:49.351453  . /lava-7798863/environment
    2022-11-01T04:18:49.452405  / # /lava-7798863/bin/lava-test-runner /lav=
a-7798863/0
    2022-11-01T04:18:49.456938  /lava-7798863/bin/lava-test-runner /lava-77=
98863/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/63609a96c8205cd769e7db9e

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-6-g18ffa74c2259/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/cros-ec-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-6-g18ffa74c2259/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/cros-ec-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221024.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
609a96c8205cd769e7dbaf
        failing since 70 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3609a96c8205cd769e7dbb1
        failing since 70 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-11-01T04:03:20.322448  / # =

    2022-11-01T04:03:20.327610  =

    2022-11-01T04:03:20.429303  / # #
    2022-11-01T04:03:20.434988  #
    2022-11-01T04:03:20.536288  / # export SHELL=3D/bin/sh
    2022-11-01T04:03:20.541177  export SHELL=3D/bin/sh
    2022-11-01T04:03:20.642063  / # . /lava-7798795/environment
    2022-11-01T04:03:20.647005  . /lava-7798795/environment
    2022-11-01T04:03:20.747969  / # /lava-7798795/bin/lava-test-runner /lav=
a-7798795/0
    2022-11-01T04:03:20.752664  /lava-7798795/bin/lava-test-runner /lava-77=
98795/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/63609d8e4f40119c36e7db9f

  Results:     4 PASS, 2 FAIL, 12 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-6-g18ffa74c2259/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/cros-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-6-g18ffa74c2259/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/cros-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221024.1/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
609d8e4f40119c36e7dbaf
        failing since 60 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3609d8e4f40119c36e7dbb1
        failing since 60 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483)

    2022-11-01T04:16:02.884486  / # =

    2022-11-01T04:16:02.886486  =

    2022-11-01T04:16:02.990122  / # #
    2022-11-01T04:16:02.991670  #
    2022-11-01T04:16:03.095731  / # export SHELL=3D/bin/sh
    2022-11-01T04:16:03.095924  <6>[   30.936384] mwifiex_pcie 0000:01:00.0=
: info: FW download over, size 638992 bytes
    2022-11-01T04:16:03.097407  export SHELL=3D/bin/sh
    2022-11-01T04:16:03.200803  / # . /lava-7799003/environment
    2022-11-01T04:16:03.203312  . /lava-7799003/environment
    2022-11-01T04:16:03.307103  / # /lava-7799003/bin/lava-test-runner /lav=
a-7799003/0 =

    ... (12 line(s) more)  =

 =20
