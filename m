Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DA17C
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jun 2022 12:47:51 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id e9so7958236pju.5
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jun 2022 05:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2FLYYfHXmlOL38fBWoXmBKr9Z4kb+iD85H4uOHLw03E=;
        b=DvifVo5b4fIElKHt5BZk0x35D5Qh6WS7qF8k7W5cHYAVwIzrpMOz7ouNhiL6nRrrdV
         Zc/QFkK0+dYWfSTAKhGo+s+YTS+FvV1DEdexezFmKAOFhdnQLEahC4sehrjeOOanjRSR
         vg6w45o7sic6KUnhQN1gAUDehKHlTvyoHDuPw+T6OisWrgH1I5FY0mRVgXrMkErUER7z
         ZTByLLI8ou8qwkqi7P51By4EbC8GUfV1NsQxeAvl+AYAZ5r/x6aTSt+1QI6PXoa9QPnr
         aX3fkyojFcl4FyBFGbYluLchIOFPhjuLnoFDqzOWa9fMNfXHMMi1do+CJbVAtC7GEHOb
         Yk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2FLYYfHXmlOL38fBWoXmBKr9Z4kb+iD85H4uOHLw03E=;
        b=G8Y7GVqzYGXNTzz8sjE3zYeGU93rHYbnbA/93Ft8iGAbgGSb2ewvatpO1T0rr+VteK
         5fYjlR9j2Usm3jaKKRvxg0KxEjywhE4xANU8Ypm762QblbD22SMdAjrV1t1N89/f4URj
         fycP80bMQQcN99TXUm6Tgu0l/52DfLir/Bs303nNGqZE8ujr9/FJ4C6+IaiNLhshKcRy
         lWQuKXu0nctGMN5ZXw9pETdlFSwKCpB9AeC3mpH/K0g/p91Hqk0C19ebgnF7TrvfEdWg
         AQCaW/js0YOp5aWHzXs6XwLwg/oiU1wVpFyRVQceBCW5vlDG7iBWB61+z8bO3yUkaSWg
         bUxg==
X-Gm-Message-State: AOAM530kqkLRom876ZHG0WD1d76Ko49y35kRYaDhBZxh2wBhvzjm3Zw6
	J3KctauSFSXQgJU78WcCbcs1vg==
X-Google-Smtp-Source: ABdhPJzOpv6QigJGDRWSbovGwkVnaB75YmDnU2psnpZ/HQPZKkNcM+byX6edR7wa3t370GBdHDE8ug==
X-Received: by 2002:a17:902:8b8b:b0:167:4e55:2dac with SMTP id ay11-20020a1709028b8b00b001674e552dacmr25849851plb.132.1654692470906;
        Wed, 08 Jun 2022 05:47:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i186-20020a626dc3000000b0050dc7628148sm14976614pfc.34.2022.06.08.05.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 05:47:50 -0700 (PDT)
Message-ID: <62a09a76.1c69fb81.ff43e.0090@mx.google.com>
Date: Wed, 08 Jun 2022 05:47:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc1-9-g2e042d202474
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci baseline: 14 runs,
 4 regressions (v5.19-rc1-9-g2e042d202474)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 14 runs, 4 regressions (v5.19-rc1-9-=
g2e042d202474)

Regressions Summary
-------------------

platform                     | arch | lab          | compiler | defconfig  =
        | regressions
-----------------------------+------+--------------+----------+------------=
--------+------------
at91-sama5d4_xplained        | arm  | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =

jetson-tk1                   | arm  | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm  | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =

sun8i-h2-plus-orangepi-zero  | arm  | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.19-rc1-9-g2e042d202474/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.19-rc1-9-g2e042d202474
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      2e042d202474336c941d8c22a54c60ceb97aa623 =



Test Regressions
---------------- =



platform                     | arch | lab          | compiler | defconfig  =
        | regressions
-----------------------------+------+--------------+----------+------------=
--------+------------
at91-sama5d4_xplained        | arm  | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/62a08f1d1f9b6a1061a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-9-g2e042d202474/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baselin=
e-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-9-g2e042d202474/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baselin=
e-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a08f1d1f9b6a1061a39=
bce
        new failure (last pass: v5.19-rc1-6-gc1db0861e8d02) =

 =



platform                     | arch | lab          | compiler | defconfig  =
        | regressions
-----------------------------+------+--------------+----------+------------=
--------+------------
jetson-tk1                   | arm  | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/62a0901533b7cd67baa39bda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-9-g2e042d202474/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baselin=
e-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-9-g2e042d202474/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baselin=
e-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a0901533b7cd67baa39=
bdb
        failing since 2 days (last pass: v5.18-rc1-24-gc2d7e384924d, first =
fail: v5.19-rc1-5-g4a0e708bb23fc) =

 =



platform                     | arch | lab          | compiler | defconfig  =
        | regressions
-----------------------------+------+--------------+----------+------------=
--------+------------
sun8i-h2-plus...ch-all-h3-cc | arm  | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/62a090405427b4a66fa39be6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-9-g2e042d202474/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baselin=
e-sun8i-h2-plus-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-9-g2e042d202474/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baselin=
e-sun8i-h2-plus-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a090405427b4a66fa39=
be7
        new failure (last pass: v5.19-rc1-6-gc1db0861e8d02) =

 =



platform                     | arch | lab          | compiler | defconfig  =
        | regressions
-----------------------------+------+--------------+----------+------------=
--------+------------
sun8i-h2-plus-orangepi-zero  | arm  | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/62a090400603dd8bbda39bea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-9-g2e042d202474/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baselin=
e-sun8i-h2-plus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-9-g2e042d202474/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baselin=
e-sun8i-h2-plus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a090400603dd8bbda39=
beb
        failing since 2 days (last pass: v5.19-rc1-5-g4a0e708bb23fc, first =
fail: v5.19-rc1-6-gc1db0861e8d02) =

 =20
