Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D257E7
	for <chrome-platform@lists.linux.dev>; Wed, 28 Dec 2022 06:31:43 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id m4so15240896pls.4
        for <chrome-platform@lists.linux.dev>; Tue, 27 Dec 2022 22:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gkpf97/0yVkLciaGiM1Egc2Bfrgo2CpmDmXgK2pkCb4=;
        b=y/upMN4AE0olPcWnkuvESQ4Snki47/5aSuXmAWwjQstmJFKjiFKk7ZVvehM/9o/lDt
         Op8+b9Yv1LuoJlXuFUfu8dfGqkiZnYYRrUPS1IH71+r65e6Y1PjoIpWXyi2Q0+ntfGW9
         aomjPgbd4UbIlLnCMcwmZ8a+0tAF3vnLN57NqbaVxVF19WIiVkh0vhCYVq01JixLpqTo
         dxy13LUYoNj8DDxy5j2SstICBgEl4TN5982nyvPl+hLiJWxzN0NnAwmK2qzhU5J+CQ/N
         /t2YhU1yNSG67NRji5efcGj+DhCvr8mYlPmqu0BSeiA2fAIXqHVO5sV4Z/QoHHB7EGX6
         oypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gkpf97/0yVkLciaGiM1Egc2Bfrgo2CpmDmXgK2pkCb4=;
        b=Kf0WhkImKuQqrbX61S8RF17YpdofFA1cZ8PX6bkz+MoNTUuK4DzpQjref1thhV0+YV
         jfpwFBQeYJaF0FzbOiZ5+Nhh0QEGszgdQ+QO3aC2kPB/YNpqKHWFgek3elAoJSG7llQs
         GV012IwaJuEc9tOMeUYDaVFQrsyGBb8/J4xODyYASF7QkNpxWly7LyJKKPI6vHkpeTiz
         AlJLMAFMbCMgf8m5l0XHOp5v6OzKxh5aGHznY+CDYblLPWFAQZmGGF3etXe3yVM8oWWk
         uh+tCbSMuv8GWZY4Vof24XZ9Td88C072IXaCwnQIk5g30ePDv6uwbeiLub+HgpvrvCKr
         wIOw==
X-Gm-Message-State: AFqh2krbBXA1BxM6OxBsMUamwCPCEAbNi+H8pV02J+eJwXqZRRysfMfs
	gNoZSurWVhRUnd/2vDCBqsLNLw==
X-Google-Smtp-Source: AMrXdXtsUXacdjovSkT3wD3gMjnv+Ui1LpS4uJeVtMbH0O1rXBWvmP+V7lcbjTutnmzHDgqzJYi6Yg==
X-Received: by 2002:a17:902:db05:b0:192:7c38:4842 with SMTP id m5-20020a170902db0500b001927c384842mr14497133plx.53.1672209103224;
        Tue, 27 Dec 2022 22:31:43 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h5-20020a170902f54500b00177e5d83d3esm4879453plf.88.2022.12.27.22.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 22:31:42 -0800 (PST)
Message-ID: <63abe2ce.170a0220.3ee60.855b@mx.google.com>
Date: Tue, 27 Dec 2022 22:31:42 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.2-rc1-6-gba409cd491c6
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci cros-ec: 8 runs,
 7 regressions (v6.2-rc1-6-gba409cd491c6)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 8 runs, 7 regressions (v6.2-rc1-6-gba=
409cd491c6)

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
ci/kernel/v6.2-rc1-6-gba409cd491c6/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.2-rc1-6-gba409cd491c6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      ba409cd491c6f13d48a70a5d2c28d340dabd49dc

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


  Details:     https://kernelci.org/test/plan/id/63abcc1a8126a1bc074eee31

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-6-gba409cd491c6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/cros-ec-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-6-gba409cd491c6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/cros-ec-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221216.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3abcc1a8126a1bc074eee36
        failing since 127 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-12-28T04:54:25.930241  / # =

    2022-12-28T04:54:25.936872  =

    2022-12-28T04:54:26.043112  / # #
    2022-12-28T04:54:26.044475  #<4>[    6.623595] cros-ec-spi spi-PRP0001:=
01: EC failed to respond in time
    2022-12-28T04:54:26.044885  <3>[    6.631124] cros-ec-spi spi-PRP0001:0=
1: Cannot identify the EC: error -110
    2022-12-28T04:54:26.045255  <3>[    6.639112] cros-ec-spi spi-PRP0001:0=
1: cannot register EC
    2022-12-28T04:54:26.045601  <4>[    6.645717] cros-ec-spi: probe of spi=
-PRP0001:01 failed with error -110
    2022-12-28T04:54:26.055432  <4>[    6.668979] cros-ec-sensorhub cros-ec=
-sensorhub.2.auto: no info for EC sensor 3 : -22/3
    2022-12-28T04:54:26.055922  =

    2022-12-28T04:54:26.158242  / #export SHELL=3D/bin/sh =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/63abcbe2ab670b001f4eee1d

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-6-gba409cd491c6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-6-gba409cd491c6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221216.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
abcbe2ab670b001f4eee2e
        failing since 127 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3abcbe2ab670b001f4eee30
        failing since 127 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-12-28T04:53:36.663308  / # =

    2022-12-28T04:53:36.667871  =

    2022-12-28T04:53:36.769521  / # #
    2022-12-28T04:53:36.774669  #
    2022-12-28T04:53:36.875674  / # export SHELL=3D/bin/sh
    2022-12-28T04:53:36.881133  export SHELL=3D/bin/sh
    2022-12-28T04:53:36.982151  / # . /lava-8495258/environment
    2022-12-28T04:53:36.987157  . /lava-8495258/environment
    2022-12-28T04:53:37.088144  / # /lava-8495258/bin/lava-test-runner /lav=
a-8495258/0
    2022-12-28T04:53:37.092543  /lava-8495258/bin/lava-test-runner /lava-84=
95258/0 =

    ... (8 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/63abcbded7abd2b4004eee21

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-6-gba409cd491c6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/cros-ec-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-6-gba409cd491c6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/cros-ec-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221216.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
abcbded7abd2b4004eee2d
        failing since 127 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3abcbded7abd2b4004eee2f
        failing since 127 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-12-28T04:53:33.285820  / # =

    2022-12-28T04:53:33.291972  =

    2022-12-28T04:53:33.395184  / # #
    2022-12-28T04:53:33.401689  #
    2022-12-28T04:53:33.503889  / # export SHELL=3D/bin/sh
    2022-12-28T04:53:33.509834  export SHELL=3D/bin/sh
    2022-12-28T04:53:33.611548  / # . /lava-8495248/environment
    2022-12-28T04:53:33.617318  . /lava-8495248/environment
    2022-12-28T04:53:33.718220  / # /lava-8495248/bin/lava-test-runner /lav=
a-8495248/0
    2022-12-28T04:53:33.722901  /lava-8495248/bin/lava-test-runner /lava-84=
95248/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/63abd0685d5a5a42bf4eee1d

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-6-gba409cd491c6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/cros-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-6-gba409cd491c6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/cros-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221216.0/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
abd0685d5a5a42bf4eee2e
        failing since 117 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3abd0685d5a5a42bf4eee30
        failing since 117 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483)

    2022-12-28T05:12:58.124182  / # =

    2022-12-28T05:12:58.128113  =

    2022-12-28T05:12:58.236562  / # #
    2022-12-28T05:12:58.239666  #
    2022-12-28T05:12:58.240527  =

    2022-12-28T05:12:58.345224  / # export SHELL=3D/bin/sh
    2022-12-28T05:12:58.348342  export SHELL=3D/bin/sh
    2022-12-28T05:12:58.349388  =

    2022-12-28T05:12:58.452827  / # . /lava-8495431/environment
    2022-12-28T05:12:58.456250  . /lava-8495431/environment =

    ... (12 line(s) more)  =

 =20
