Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83B97EA
	for <chrome-platform@lists.linux.dev>; Mon, 26 Dec 2022 10:34:11 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id 7so6996898pga.1
        for <chrome-platform@lists.linux.dev>; Mon, 26 Dec 2022 02:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oYwIlu0N1wodeUDM6FyKUAHAG+Y5G+lUpDhXLrYKYlA=;
        b=oprmhqGJI7wThyw4VOnelDwjgjd79rJ5vwL63Zd3mfN7pVyJC+08xNbEPnmELv2FVk
         vLTDjR+tbu5fUEXt7CriApfReuDZCSTwiWVbBC17Vtn8bAXZvBq3iNbh8/e7dDFqz606
         RH37s5spoP6bktZaBq+Xcycfm7OaBtdSHqb/e3798YA7epfViwVb2eINInYjoVtdJqgi
         gnDL9ZFitSp5RJOCK2QeJ8qu9GUQnbTwl9TXq8D4OdjpJM/2Hrpl9x72tAKhfYsrf25Z
         WWWa5s/snlp1N7O+c7Z+cJnTLVqBVy7wNFAgnqQtDnNhtPUYSoQf/3O3wFPKIPKiTLcw
         5GgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oYwIlu0N1wodeUDM6FyKUAHAG+Y5G+lUpDhXLrYKYlA=;
        b=R848QF4E+zf1jK9IMOuhVlxUCjJ7mHqINZYel/yzaoIb8cXhAo8YrShllF63Bgqd45
         I0qcvLDh0uJe/mN8tUbarKyntoHuPK1L1RtTEdAupBlhM2t4IM04iryriZ6YdQwPFD1e
         RER3Tk69afTVvzGiLPZeAGrooxsSZ63sJeyM8uIWtHglA/GATauWf+te1Xe7rhi+pYPJ
         7NIenKB6/rUQBInGgiC7a68lZAQe8ff/HbdJGNUdndHhgdE7aizgM2Sj6kC3I9Zdm+QC
         H1ke8IqrBXCGJBuoQucG07RaEj+IG+hWfSvKi0NtHSmUkLx8RUQu/PG2GWh30b+kiGz+
         DB1Q==
X-Gm-Message-State: AFqh2koXPhlowHQxlgddq70bJ+qdGu5Fn4+r2ZXeEMcER3Sn7ihFv8S/
	TdI4o7Njg7dtJPt1qhAHuV9HeA==
X-Google-Smtp-Source: AMrXdXumOKGlrzrcdHCvB5nvULnppiVHCDelWQn+nRvsP26d7GjeDFR96TexKU4VwR3m9gpygLl4Yw==
X-Received: by 2002:a62:f248:0:b0:576:1cb3:7981 with SMTP id y8-20020a62f248000000b005761cb37981mr20500151pfl.32.1672050851126;
        Mon, 26 Dec 2022 02:34:11 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k17-20020aa79d11000000b005764c8f8f15sm6647831pfp.73.2022.12.26.02.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 02:34:10 -0800 (PST)
Message-ID: <63a978a2.a70a0220.4d38c.bd1a@mx.google.com>
Date: Mon, 26 Dec 2022 02:34:10 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.2-rc1-3-g942956ddbb33c
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci cros-ec: 8 runs,
 7 regressions (v6.2-rc1-3-g942956ddbb33c)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 8 runs, 7 regressions (v6.2-rc1-3-g94=
2956ddbb33c)

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
ci/kernel/v6.2-rc1-3-g942956ddbb33c/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.2-rc1-3-g942956ddbb33c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      942956ddbb33c13ba4381d9557cd69d1e36cf856

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


  Details:     https://kernelci.org/test/plan/id/63a9622ea531ea406a4eee51

  Results:     8 PASS, 2 FAIL, 9 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-3-g942956ddbb33c/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-3-g942956ddbb33c/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221216.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3a9622ea531ea406a4eee60
        failing since 125 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-12-26T08:58:03.276135  / # =

    2022-12-26T08:58:03.282554  =

    2022-12-26T08:58:03.388160  / # #
    2022-12-26T08:58:03.394512  #
    2022-12-26T08:58:03.496825  / # export SHELL=3D/bin/sh
    2022-12-26T08:58:03.503528  export SHELL=3D/bin/sh
    2022-12-26T08:58:03.605548  / # . /lava-8472886/environment
    2022-12-26T08:58:03.611619  . /lava-8472886/environment
    2022-12-26T08:58:03.713741  / # /lava-8472886/bin/lava-test-runner /lav=
a-8472886/0
    2022-12-26T08:58:03.720316  /lava-8472886/bin/lava-test-runner /lava-84=
72886/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/63a96241a531ea406a4eee74

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-3-g942956ddbb33c/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-3-g942956ddbb33c/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221216.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
a96241a531ea406a4eee85
        failing since 125 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3a96241a531ea406a4eee87
        failing since 125 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-12-26T08:58:25.697945  / # =

    2022-12-26T08:58:25.702857  =

    2022-12-26T08:58:25.804437  / # #
    2022-12-26T08:58:25.808936  #
    2022-12-26T08:58:25.909898  / # export SHELL=3D/bin/sh
    2022-12-26T08:58:25.914703  export SHELL=3D/bin/sh
    2022-12-26T08:58:26.015602  / # . /lava-8472865/environment
    2022-12-26T08:58:26.020241  . /lava-8472865/environment
    2022-12-26T08:58:26.121144  / # /lava-8472865/bin/lava-test-runner /lav=
a-8472865/0
    2022-12-26T08:58:26.125612  /lava-8472865/bin/lava-test-runner /lava-84=
72865/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/63a961f6842d5d29404eee1a

  Results:     6 PASS, 2 FAIL, 11 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-3-g942956ddbb33c/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-3-g942956ddbb33c/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221216.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
a961f6842d5d29404eee2b
        failing since 125 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3a961f6842d5d29404eee2d
        failing since 125 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)

    2022-12-26T08:57:12.140812  / # =

    2022-12-26T08:57:12.147914  =

    2022-12-26T08:57:12.254040  / # #
    2022-12-26T08:57:12.261111  #
    2022-12-26T08:57:12.363771  / # export SHELL=3D/bin/sh
    2022-12-26T08:57:12.370595  export SHELL=3D/bin/sh
    2022-12-26T08:57:12.472759  / # . /lava-8472873/environment
    2022-12-26T08:57:12.479678  . /lava-8472873/environment
    2022-12-26T08:57:12.581741  / # /lava-8472873/bin/lava-test-runner /lav=
a-8472873/0
    2022-12-26T08:57:12.588084  /lava-8472873/bin/lava-test-runner /lava-84=
72873/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/63a964df3d24038af94eee56

  Results:     4 PASS, 2 FAIL, 12 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-3-g942956ddbb33c/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-3-g942956ddbb33c/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221216.0/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
a964df3d24038af94eee66
        failing since 116 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3a964df3d24038af94eee68
        failing since 116 days (last pass: tag-chrome-platform-for-v5.20-2-=
gddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483)

    2022-12-26T09:09:30.339531  / # =

    2022-12-26T09:09:30.342450  =

    2022-12-26T09:09:30.450879  / # #
    2022-12-26T09:09:30.454025  #
    2022-12-26T09:09:30.454912  =

    2022-12-26T09:09:30.558284  / # export SHELL=3D/bin/sh
    2022-12-26T09:09:30.561999  export SHELL=3D/bin/sh
    2022-12-26T09:09:30.665642  / # . /lava-8472977/environment
    2022-12-26T09:09:30.666550  <6>[   29.514350] mwifiex_pcie 0000:01:00.0=
: info: FW download over, size 638992 bytes
    2022-12-26T09:09:30.669090  . /lava-8472977/environment =

    ... (12 line(s) more)  =

 =20
