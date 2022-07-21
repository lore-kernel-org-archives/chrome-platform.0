Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0B0291C
	for <chrome-platform@lists.linux.dev>; Thu, 21 Jul 2022 11:00:36 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id r24so1475453plg.3
        for <chrome-platform@lists.linux.dev>; Thu, 21 Jul 2022 04:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=sdcNWnCiERH5v6TTxs1YOPB4i2S123QQQmD4LfFyMwo=;
        b=ppz65GgxOoEYB7e5V3xIWhyog724ZB9uijbPRO14BZOvRi4yWyhMZ9Hojp6p8YkEcE
         xHMG85m/g4ryTHNm/d+pLiZJmMM+xdWaNbh4iutLr7vD26DNOfzdz0dgRepwCtzDP61G
         SelkM2pZ3tWfisnQJueqXsaz3haJiF8hm0mgOqrYxC+Hl0pyjdxpQihb8+5meDSylWNM
         zfUdWQAjVppYbHTL3+bQcdH8nhCnjkMGt24uvPHSqkVA4W21vm2aTQ/Q0LDgq1UACWg6
         OYeqLAiPtT1rg7Tg39NH590iWFWvKV5QW0gjlOG6DaXtq2JW4UVJFjDSQ7SVGJbiCR06
         yBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=sdcNWnCiERH5v6TTxs1YOPB4i2S123QQQmD4LfFyMwo=;
        b=uSSLOFmYAAbrzu+yTbTizIA+ROcuU8FQrqReXqhAJkvS38IGKsq31Oq+f07e88R2sL
         euautDiUvWCL+cb85ZRzcRG3g5Mpi6ep754LKqIFm3jJEgJXXScKnOUvytkCW6ACTjvq
         4UThZjqxpMXLo0VbBNsutf4hJuOvbp5LB5L5in0ZmDi7GeQ/6Kvr+XkSeAB/WAi8+zK9
         3xb5r9C3v3DcW8Vz1gkiAezBenR8yPvJevRnYpPj7Tn7zvUg9n11HYxEyNb0qt/0Jx+M
         NyxwNoaSmAz4H3XfiBEfNBlMN447jPZAzBYmBvpLddNua8YgPEqViigno7n5JOmYUaYy
         ZJXQ==
X-Gm-Message-State: AJIora+vUKDQ+NU+M9rliFO1+65eXCpSzR2x6BRNsFrRNAhu8CUKzz0L
	1yRi7jvygdsvjonlStcMwfCrjq5EbKJh4KpitmE=
X-Google-Smtp-Source: AGRyM1u3+bJ3voj8QuPx4JjQXaVSjpHCyD3bUD3qHrk266uLd05aPr8UzLTghfQ7bP8QZRw0tfjDPw==
X-Received: by 2002:a17:903:d4:b0:16d:251e:5ac7 with SMTP id x20-20020a17090300d400b0016d251e5ac7mr6593443plc.56.1658401236130;
        Thu, 21 Jul 2022 04:00:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d8-20020a170902654800b0016d2d0ce376sm1373794pln.215.2022.07.21.04.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 04:00:35 -0700 (PDT)
Message-ID: <62d931d3.1c69fb81.4fd2a.21ba@mx.google.com>
Date: Thu, 21 Jul 2022 04:00:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc1-60-g088b8107e603
Subject: chrome-platform/for-kernelci sleep: 9 runs,
 2 regressions (v5.19-rc1-60-g088b8107e603)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 9 runs, 2 regressions (v5.19-rc1-60-g08=
8b8107e603)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =

tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.19-rc1-60-g088b8107e603/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.19-rc1-60-g088b8107e603
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      088b8107e603c7561ae41ebe65d98d2981d4f122 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62d925ad234f734720daf061

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-60-g088b8107e603/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep=
-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-60-g088b8107e603/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep=
-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220716.0/armhf/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/62d925ad234f734720daf062
        failing since 41 days (last pass: v5.19-rc1-6-gc1db0861e8d02, first=
 fail: v5.19-rc1-35-g412b193d93912) =

 =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62d9296012a884be99daf059

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-60-g088b8107e603/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep=
-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-60-g088b8107e603/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep=
-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220716.0/armhf/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/62d9296012a884be99daf05a
        failing since 45 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc) =

 =20
