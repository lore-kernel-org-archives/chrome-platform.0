Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37E523A0
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 05:30:55 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id l7-20020a17090aaa8700b001dd1a5b9965so11701644pjq.2
        for <chrome-platform@lists.linux.dev>; Sun, 05 Jun 2022 22:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=vHsF21syepLRoZ8044RRVt9EJYqtx+VIOYinQmutAdQ=;
        b=GxDtR64aSHYAO/qhj5DiPajxOlXmX1M/uDjgWr3o6k4kUiticQA26akPGDSBvwMVIQ
         a+5Z/B6wrR4nEHE83d7nc8IzS3xTRKIc4kI+XENIQs3e8WdAA3U9k5PpV3pPd705TicW
         Snsz7en8Ycx8Oh5aMxuUBm3cz4WBJOjKcxWR4IoUkXcOpEBWGH78aTBlGxZSUu9Uze75
         AsiaNR6nB+EVdOgQsKSgapZaNSRTm0Oz6RPJnqUS42DDEdrmKaKDFdu6JB5iHBQpQPBm
         CNtMKXhP/P5HWPXkD8Dpkwz5YBYXQzoI0imWvfvnnzBohgGZC23kJNMgQRSz+7Oqctfw
         z0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=vHsF21syepLRoZ8044RRVt9EJYqtx+VIOYinQmutAdQ=;
        b=doah7xjnQwYWdhBi5Y5LLQf6fCwdYmhmb5ueepsLOlNsdvAJBdkfGrXBYEfWL9vPT4
         P7581rSyAh1bYmcwexyAKfPqrHA5Ln1IYuvklPPJj88daEPpbwqu7+Owk9jtnndww21N
         CqUbJ+b3wF2U7ntUx6e4jDKeB3euCbh/k/GDXOoHb6593dwRnzTYHsnqBr2gs3tza8xW
         ldlHScKCxzgmEJVQmZkPEfGKcRz1j0eB7ovTn5DfKUWYxFpoVWTzl1ZP7lDNdSi+LNxz
         UH30H2XzAZ2ArMO4wzv7Q9svAoQsVrylab6xo1tDLKYCQoZQGp3AuFJDVXd0zCuoH3ZZ
         g0rw==
X-Gm-Message-State: AOAM530FSH2+HhCSF0Z65sx0uO9koREVzJ+KmTrGg9BNocJht2B9JU4C
	Io10KaBNIFUzK5yWbwJaZAKICw==
X-Google-Smtp-Source: ABdhPJyInhBY8RRa9C+DEcLgZV7Ca1UPFcl8W+8Ype/cTTPEb3qkt+hbt7X6JE6hr+XYo4KvsTN2nA==
X-Received: by 2002:a17:902:f647:b0:161:67af:6bf0 with SMTP id m7-20020a170902f64700b0016167af6bf0mr22018896plg.100.1654493455141;
        Sun, 05 Jun 2022 22:30:55 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u19-20020a170903305300b001622c377c3esm9472709pla.117.2022.06.05.22.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 22:30:54 -0700 (PDT)
Message-ID: <629d910e.1c69fb81.56a76.603c@mx.google.com>
Date: Sun, 05 Jun 2022 22:30:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc1-5-g4a0e708bb23fc
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci cros-ec: 10 runs,
 3 regressions (v5.19-rc1-5-g4a0e708bb23fc)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 10 runs, 3 regressions (v5.19-rc1-5-g=
4a0e708bb23fc)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =

rk3399-gru-kevin  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 1          =

tegra124-nyan-big | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.19-rc1-5-g4a0e708bb23fc/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.19-rc1-5-g4a0e708bb23fc
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      4a0e708bb23fc2fd10c7320b40ab9af2cf619f5f

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
rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/629d83e93712d0c32ba39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-5-g4a0e708bb23fc/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-=
ec-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-5-g4a0e708bb23fc/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-=
ec-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220527.0/armhf/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/629d83e93712d0c32ba39b=
ce
        new failure (last pass: v5.18-rc1-24-gc2d7e384924d) =

 =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
rk3399-gru-kevin  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 1          =


  Details:     https://kernelci.org/test/plan/id/629d7b59085fc93cdfa39bce

  Results:     4 PASS, 1 FAIL, 14 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-5-g4a0e708bb23fc/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-5-g4a0e708bb23fc/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220527.0/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_rtc_abi: https://kernelci.org/test/case/id/629d7b5=
9085fc93cdfa39bd1
        new failure (last pass: v5.18-rc1-24-gc2d7e384924d) =

 =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
tegra124-nyan-big | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/629d7fbe7a63713db9a39bd0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-5-g4a0e708bb23fc/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-=
ec-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-5-g4a0e708bb23fc/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-=
ec-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220527.0/armhf/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/629d7fbe7a63713db9a39b=
d1
        new failure (last pass: v5.18-rc1-24-gc2d7e384924d) =

 =20
