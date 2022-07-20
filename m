Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD36A1FD7
	for <chrome-platform@lists.linux.dev>; Wed, 20 Jul 2022 06:46:54 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id s21so16839125pjq.4
        for <chrome-platform@lists.linux.dev>; Tue, 19 Jul 2022 23:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=qDlwBhgZvP62pp4PHXe566rS4W+P4DFJC6Ic7tB+xYM=;
        b=X1sl34bA63mIWWlEhmHLZ2WQahFbsKKYEc8SC+V4Q7FuvYaFnvZU8UfHKl49lrFmDZ
         RqdQseQdEqJx3BXhHNJKB+DJ9P363vIM8UH2z2fRoUK2GN5c71DW9bCzC+fPRtr5mXTS
         j/Cxp3JAVg7vCX0ZsqfQRkxApPSQVSPTOuOYibt+V/X3WfoMYa2pIhvaA17lni0/Um+H
         Qv7eWZeUEbMU87FwYIsH2w7okaVMw4QP2u1YTWNF7jDkLe+8RQWFjjstepxTnxAMwCio
         U15d7ih/Drw4PbTTPddOzG8QnK4a9plE/17TCMy/DhqpdUO910AW5MVXe9KbAZvgGj3V
         GZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=qDlwBhgZvP62pp4PHXe566rS4W+P4DFJC6Ic7tB+xYM=;
        b=mtvzvLlUIHbV/CoK/IzMfvLlyXGbwlxN9LpJX+ZFAKzmwOwcuCEPyryB7PH965KOsz
         UFUAypoLHVJ/vsTjDQHhp4DJY1YSPcaQlbBIfZp8J8tQ6eOQa0Aed5ZjhiQ7SHfaQ1xf
         1+9R3MGu0uO6q4/liw+Vo1bRCXrye6jKApmVX5JaKyKRI7OkQdopFhZ0O5kv3gvz9gvA
         0Xg9YQxMI3FkFJmLwDKpVEG3MsNreWQeVJmz8n20FdP9CbtWSVlZ8mY7ToAb+mMLajuR
         TegVfXObMq+UsqcvtGNMQlArTfKPk5zH3XPYSZWhozHPOlG5ELPMfybXASu5uDyFBwdc
         NDDw==
X-Gm-Message-State: AJIora+IrpdXzt9gzb1GV5aCEkkY5P3MJGBu67kOr4hWg3/O0I5ZpweM
	Mn4yVboYNT/8Qk4GXcc6S8Qgng==
X-Google-Smtp-Source: AGRyM1tHs/b8XEPeIAhBgfW0igZqapWK/rX9M3EZy0sw6McD64OBH5CCqMsD23z5gRHuQDa6o0JZuw==
X-Received: by 2002:a17:902:e952:b0:16d:2552:f2eb with SMTP id b18-20020a170902e95200b0016d2552f2ebmr455277pll.76.1658299614234;
        Tue, 19 Jul 2022 23:46:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l1-20020a63da41000000b004114aad90ebsm11042332pgj.49.2022.07.19.23.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 23:46:53 -0700 (PDT)
Message-ID: <62d7a4dd.1c69fb81.12e01.04ff@mx.google.com>
Date: Tue, 19 Jul 2022 23:46:53 -0700 (PDT)
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
X-Kernelci-Kernel: v5.19-rc1-58-gad1e2226017a9
Subject: chrome-platform/for-kernelci sleep: 9 runs,
 4 regressions (v5.19-rc1-58-gad1e2226017a9)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 9 runs, 4 regressions (v5.19-rc1-58-gad=
1e2226017a9)

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
ci/kernel/v5.19-rc1-58-gad1e2226017a9/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.19-rc1-58-gad1e2226017a9
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      ad1e2226017a9e56e242029f834a2cfc14f6fa83 =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
mt8173-elm-hana   | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62d79891f83d6e1eaadaf05c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-58-gad1e2226017a9/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/sleep-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-58-gad1e2226017a9/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/sleep-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220716.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/62d79891f83d6e1eaadaf05d
        new failure (last pass: v5.19-rc1-41-gc30628bce72f) =

 =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/62d7a39557adff3ca9daf061

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-58-gad1e2226017a9/arm/multi_v7_defconfig/gcc-10/lab-collabora/slee=
p-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-58-gad1e2226017a9/arm/multi_v7_defconfig/gcc-10/lab-collabora/slee=
p-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220716.0/armhf/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/62d7a39557adff3ca9daf062
        failing since 40 days (last pass: v5.19-rc1-6-gc1db0861e8d02, first=
 fail: v5.19-rc1-35-g412b193d93912) =

 =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
rk3399-gru-kevin  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62d7991a4e51569e62daf07a

  Results:     12 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-58-gad1e2226017a9/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/sleep-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-58-gad1e2226017a9/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/sleep-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220716.0/arm64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/62d7991a4e51569e=
62daf083
        new failure (last pass: v5.19-rc1-41-gc30628bce72f)

    2022-07-20T05:51:46.090565  rtcwake: assuming RTC uses UTC ...
    2022-07-20T05:51:46.097115  rtcwake: wakeup from \"mem\" using rtc0 at =
Sun Jun 19 12:27:35 2022
    2022-07-20T05:51:46.111735  <6>[   46.057226] PM: suspend entry (deep)
    2022-07-20T05:51:46.116305  <6>[   46.057303] Filesystems sync: 0.000 s=
econds
    2022-07-20T05:51:46.127162  <6>[   46.057812] Freezing user space proce=
sses ... (elapsed 0.001 seconds) done.
    2022-07-20T05:51:46.130668  <6>[   46.059692] OOM killer disabled.
    2022-07-20T05:51:46.139990  <6>[   46.059697] Freezing remaining freeza=
ble tasks ... (elapsed 0.001 seconds) done.
    2022-07-20T05:51:46.147253  <6>[   46.061148] printk: Suspending consol=
e(s) (use no_console_suspend to debug)
    2022-07-20T05:51:54.003565  =01=00=00<3>[   46.185314] mwifiex_pcie 000=
0:01:00.0: adapter is not valid
    2022-07-20T05:51:54.008081  <6>[   47.417143] Disabling non-boot CPUs .=
.. =

    ... (45 line(s) more)  =

 =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
tegra124-nyan-big | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/62d79bb6842a3ec526daf0ad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-58-gad1e2226017a9/arm/multi_v7_defconfig/gcc-10/lab-collabora/slee=
p-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-58-gad1e2226017a9/arm/multi_v7_defconfig/gcc-10/lab-collabora/slee=
p-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220716.0/armhf/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/62d79bb6842a3ec526daf0ae
        failing since 44 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc) =

 =20
