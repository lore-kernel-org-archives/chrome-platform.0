Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B95A3D
	for <chrome-platform@lists.linux.dev>; Fri,  5 Aug 2022 05:01:20 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id f11so1738505pgj.7
        for <chrome-platform@lists.linux.dev>; Thu, 04 Aug 2022 22:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=wDDyRN7zx9kd83k/brGUc5xej7GMACHpHsc/f+eOJG0=;
        b=BlbpWd8E2loVDYG7jOYLw0wTWOAZjNmsId3UxKE/APjjN8JZ/iCpiOpT2VvEx8y45O
         Wfk3fJZC+DVwvIBmUbTjMvqNdXDGg7q2YrPfSyHd/lQ+78eVrez5Lc2pZ93AeAYJUfIX
         AG9AlhGSvijMZxbyPuwfZs0GyYa+LEF8H53hFoObvQ3BNPWOLkkSUmA5qR29MzNmF8D6
         V5SFeV12/G5ZrK51C74F2VW+PtKpLaUZP1QoEFxX1PwvGuMlE6rhETku8nLT09LG/PF2
         DHxq8JwWzBkaLewoPHoOs9EBh6rgISqJ3b+ccdOL/xBMdXYxtqaB7sYxT0cE4k3nK8nH
         nnAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=wDDyRN7zx9kd83k/brGUc5xej7GMACHpHsc/f+eOJG0=;
        b=Wq0YnZNNqQNJj+hS9GkAbmeP1FtGYEE18yCitc7HE5jAgxRiSA/R96p78YwWJ6xyQa
         B/dHe7AUxXwA8l6rahwZGfHmnR9UjRKBRHDvaW019DFfxiE2imUXkESpcWHzpgpmjaGN
         feX0scdRpSBVrpBIKaCla2apC624nD1lvmnXxYEUi5HRCWz/zxDcN4XxUsLzGMaMcEwn
         y6QpgBUimW+nXwwVX65xoh+klSFNnz/pI8Hk4cs21o1QwbEoo3NBVHXq1sKJvp4b3I+l
         6DY80XRuOKhH1iirEMLHLF1YW0kyTEJ7jZoCWA3ELTebCcM2MZ4ccoScHgl4qspvD+5N
         xi8Q==
X-Gm-Message-State: ACgBeo19Rv+BW5MlVyNOkwhs3JI0Zva29/eY0zI+QWrquCoGucEn30yh
	vFol7r4r4BhqrehKn+9njCWSGw==
X-Google-Smtp-Source: AA6agR67VUObMuQ3gqk1m8hHPRyCNZcgZTODcBNk0Dzjht+gv2rmBgYatK5cH1xO+gZPwUbq+0fKJA==
X-Received: by 2002:a63:8549:0:b0:41b:5589:ad20 with SMTP id u70-20020a638549000000b0041b5589ad20mr4247390pgd.189.1659675679824;
        Thu, 04 Aug 2022 22:01:19 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p11-20020a635b0b000000b0041a615381d5sm728552pgb.4.2022.08.04.22.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 22:01:19 -0700 (PDT)
Message-ID: <62eca41f.630a0220.40f8b.1b5d@mx.google.com>
Date: Thu, 04 Aug 2022 22:01:19 -0700 (PDT)
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
X-Kernelci-Kernel: tag-chrome-platform-for-v5.20-2-gddffaa3d76750
Subject: chrome-platform/for-kernelci sleep: 9 runs,
 4 regressions (tag-chrome-platform-for-v5.20-2-gddffaa3d76750)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 9 runs, 4 regressions (tag-chrome-platf=
orm-for-v5.20-2-gddffaa3d76750)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
mt8173-elm-hana   | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 1          =

rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =

rk3399-gru-kevin  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 1          =

tegra124-nyan-big | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/tag-chrome-platform-for-v5.20-2-gddffaa3d76750/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: tag-chrome-platform-for-v5.20-2-gddffaa3d76750
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      ddffaa3d76750278e5a0804fa173b3c8c16ff42a =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
mt8173-elm-hana   | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec96d1320d498dd6daf0f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v5.20-2-gddffaa3d76750/arm64/defconfig+arm64-chromeb=
ook/gcc-10/lab-collabora/sleep-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v5.20-2-gddffaa3d76750/arm64/defconfig+arm64-chromeb=
ook/gcc-10/lab-collabora/sleep-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220718.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/62ec96d1320d498dd6daf0f6
        new failure (last pass: v5.19-rc1-60-g088b8107e603) =

 =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec99ccd91f33ed92daf07a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v5.20-2-gddffaa3d76750/arm/multi_v7_defconfig/gcc-10=
/lab-collabora/sleep-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v5.20-2-gddffaa3d76750/arm/multi_v7_defconfig/gcc-10=
/lab-collabora/sleep-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220718.0/armhf/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/62ec99ccd91f33ed92daf07b
        failing since 55 days (last pass: v5.19-rc1-6-gc1db0861e8d02, first=
 fail: v5.19-rc1-35-g412b193d93912) =

 =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
rk3399-gru-kevin  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec9770e88b8eac4bdaf06c

  Results:     12 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v5.20-2-gddffaa3d76750/arm64/defconfig+arm64-chromeb=
ook/gcc-10/lab-collabora/sleep-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v5.20-2-gddffaa3d76750/arm64/defconfig+arm64-chromeb=
ook/gcc-10/lab-collabora/sleep-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220718.0/arm64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-8: https://kernelci.org/test/case/id/62ec9770e88b8eac=
4bdaf074
        new failure (last pass: v5.19-rc1-60-g088b8107e603)

    2022-08-05T04:02:56.464196  rtcwake: assuming RTC uses UTC ...
    2022-08-05T04:02:56.470816  rtcwake: wakeup from \"mem\" using rtc0 at =
Wed Jun 22 11:28:28 2022
    2022-08-05T04:02:56.490121  <6>[   63.794600] PM: suspend entry (deep)
    2022-08-05T04:02:56.494879  <6>[   63.794644] Filesystems sync: 0.000 s=
econds
    2022-08-05T04:02:56.502663  <6>[   63.795132] Freezing user space proce=
sses ... (elapsed 0.001 seconds) done.
    2022-08-05T04:02:56.507715  <6>[   63.796811] OOM killer disabled.
    2022-08-05T04:02:56.515906  <6>[   63.796814] Freezing remaining freeza=
ble tasks ... (elapsed 0.001 seconds) done.
    2022-08-05T04:02:56.523355  <6>[   63.798174] printk: Suspending consol=
e(s) (use no_console_suspend to debug)
    2022-08-05T04:03:04.189910  =00=00=00<3>[   63.907613] mwifiex_pcie 000=
0:01:00.0: adapter is not valid
    2022-08-05T04:03:04.194492  <6>[   65.149466] Disabling non-boot CPUs .=
.. =

    ... (67 line(s) more)  =

 =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
tegra124-nyan-big | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec9d6fa0820650c6daf05d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v5.20-2-gddffaa3d76750/arm/multi_v7_defconfig/gcc-10=
/lab-collabora/sleep-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v5.20-2-gddffaa3d76750/arm/multi_v7_defconfig/gcc-10=
/lab-collabora/sleep-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220718.0/armhf/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/62ec9d6fa0820650c6daf05e
        failing since 60 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc) =

 =20
