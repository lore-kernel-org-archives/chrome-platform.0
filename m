Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D968F63
	for <chrome-platform@lists.linux.dev>; Tue, 24 Jan 2023 21:07:35 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id o13so16418719pjg.2
        for <chrome-platform@lists.linux.dev>; Tue, 24 Jan 2023 13:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=90a+luCbVJKtlpOYpYbM/EQhOh4m0FEH0PeJX2T3+pc=;
        b=ZJ4ClWVZ/Dh5J23MGv6L8v/nId095g+bFyolspA122tkn1+DoHv7fnVmUi4KMRiaC9
         DDqwqqJgNRBjyhXlWgluJhkOe1k5V3OUCyEWfwrtys0Gat4X1FAsQ9CbPQYxmy9BhXuV
         bz22Ta5eXnPg+/NoooMqfatHvsgpADPmi77i3BSqKpUhOfddd/pLQ/1L2KjJioeWKXgZ
         zFw93NhoYn/Wt915dVxWIUYi5ORvT4inn4jsjkg9piM0bhIVTY3LGOn6Y+xDOhaq8bjK
         PlMXAim92N/TY5fGi/pp0dOWUTDvdxe0LLXSiExhbeRbS0TjNvUKhKFST2oKqFped0Zq
         XDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=90a+luCbVJKtlpOYpYbM/EQhOh4m0FEH0PeJX2T3+pc=;
        b=P7az+32vDlJA0faAp623VLAtR5EvMNCfDZT8fQk8pHefo91gnvk8aPA4+LII/A0Yub
         8AHJy8sW+pFc/VmuvA2MnCsqd1ij93B9LOMT5SM/1SeIsNj5gLWntyjF2BrToD1ERg3W
         OIcF38kBC3FlUqmK8ypAwoTEJF62kp/6HvYUul6V9jtb1Z6GoSAePcttkNEozhc413Lc
         51Y0V+ZsIzdlbK3hezfPg0h98p/M0MpR91lGaB0E4n9mHV4NNUdD5hzS0LdjWxk2ItT2
         T0ZnJQjWR378JDPcy1LYXuBJ5SCiM8HOdxKNSs66aznvXPt9YBkln/TFGDrN2r9Nt+lw
         yfWw==
X-Gm-Message-State: AFqh2krmg9Y6EZBY4sJqi6lnju/4uHXoFuOqdZaqV63s/1YdEytYccf3
	bHwuyquFVW0ZdALEwpkq+9xBbA==
X-Google-Smtp-Source: AMrXdXvJx2oxWABsqWHk8ecayMJE5OZml0Tivd6tReor4eeGtVzaOBRye/NbZQkncMHUth0g47zdWg==
X-Received: by 2002:a17:902:7c0e:b0:192:afb0:8960 with SMTP id x14-20020a1709027c0e00b00192afb08960mr28306041pll.3.1674594454865;
        Tue, 24 Jan 2023 13:07:34 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v3-20020a1709029a0300b0018853dd8832sm2135603plp.4.2023.01.24.13.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 13:07:34 -0800 (PST)
Message-ID: <63d04896.170a0220.b96e0.46a5@mx.google.com>
Date: Tue, 24 Jan 2023 13:07:34 -0800 (PST)
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
X-Kernelci-Kernel: v6.2-rc1-32-g7ae7deb4a4b4
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 97 runs,
 1 regressions (v6.2-rc1-32-g7ae7deb4a4b4)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 97 runs, 1 regressions (v6.2-rc1-32-=
g7ae7deb4a4b4)

Regressions Summary
-------------------

platform   | arch | lab          | compiler | defconfig          | regressi=
ons
-----------+------+--------------+----------+--------------------+---------=
---
cubietruck | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1       =
   =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.2-rc1-32-g7ae7deb4a4b4/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.2-rc1-32-g7ae7deb4a4b4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      7ae7deb4a4b4d48a89d95cd03162bcfc408dce11 =



Test Regressions
---------------- =



platform   | arch | lab          | compiler | defconfig          | regressi=
ons
-----------+------+--------------+----------+--------------------+---------=
---
cubietruck | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1       =
   =


  Details:     https://kernelci.org/test/plan/id/63d03dcd00b47059dd915eea

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-32-g7ae7deb4a4b4/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baselin=
e-cubietruck.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-32-g7ae7deb4a4b4/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baselin=
e-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d03dcd00b47059dd915eef
        failing since 6 days (last pass: tag-chrome-platform-for-v6.2-2-g59=
90db2d66b3, first fail: v6.2-rc1-30-gf2fe7d2bb64e)

    2023-01-24T20:21:17.849554  <8>[   15.107475] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3203538_1.5.2.4.1>
    2023-01-24T20:21:17.956077  / # #
    2023-01-24T20:21:18.057590  export SHELL=3D/bin/sh
    2023-01-24T20:21:18.057968  #
    2023-01-24T20:21:18.159070  / # export SHELL=3D/bin/sh. /lava-3203538/e=
nvironment
    2023-01-24T20:21:18.159443  =

    2023-01-24T20:21:18.260651  / # . /lava-3203538/environment/lava-320353=
8/bin/lava-test-runner /lava-3203538/1
    2023-01-24T20:21:18.261257  =

    2023-01-24T20:21:18.261484  / # /lava-3203538/bin/lava-test-runner /lav=
a-3203538/1<3>[   15.516957] Bluetooth: hci0: command 0x0c03 tx timeout
    2023-01-24T20:21:18.265944   =

    ... (12 line(s) more)  =

 =20
