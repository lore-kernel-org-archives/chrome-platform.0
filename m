Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE38833E9
	for <chrome-platform@lists.linux.dev>; Thu, 21 Jul 2022 11:30:37 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id h132so1382632pgc.10
        for <chrome-platform@lists.linux.dev>; Thu, 21 Jul 2022 04:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=zzGaDmPeQ8I5wh6hTDfN7zAd+gYuTWWDYqJ9ilSXR8o=;
        b=d2dB5Vfkwoq6eIKa7ygrU/r0ZFucW3eDoRrqZMVygzwUpwc4lp03b7MHkAg1Ygf3gm
         hkEqwy3TBCrsjnyxQUhhrKkpIMAFdXVk2esXU90aCX22mTNY270YvlW7HWYXa4bW7bm/
         BlOO2i7RN4zU3P0dF8T9b0QQreXCiGBPRC5FKN03CuhsjFgHMwB38BKt1ZMYzxKBIS6V
         fGt0vUGedexrErQqYTXHFpCF+xQs3KO1c/8R9nXTpudcZ44wZ9XduOgIPaMNb/NbrsNi
         B9qGWrvN0tS5HWKVtVqAPhP9F0d31ruL4zp1ei9DCoUd2Nnf1OzRRPOzaIL/r37wvdCF
         cByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=zzGaDmPeQ8I5wh6hTDfN7zAd+gYuTWWDYqJ9ilSXR8o=;
        b=j+Ln0hC4QFiVyD4U3NV0+daLIjcV2yFBjIVc0deO5ghXmM4b7QLV/8O1QLy4DWNfxZ
         EVato9nHGJtp/o2wUdR3BUTBQSLo4bUku45Uyl982yxzfDNDbs48UJPIAGVU0DApNuki
         U+E/cDMwwJnmlXwLc1qEloeMhzX8cBzds/jpUohtiMSRCWC+X06oG6f+vJjy0Qd5y/+7
         wMQ2YavslPV0EgcnHTtYTHnGuZ0ImBI21o39lpgztg/hor7IQPoETlD0rqx2VOVpDeCp
         njrfNIMM92hbPpXPqEIJrQc85Atd5cOGRmqwFFoqYGNuxjDvK2DP/M8TEs66xupWq0wF
         S9mQ==
X-Gm-Message-State: AJIora9PWPPrFhDiApjkWhmkKXM3B6NrwdfR51r+XaddUBZMF6DpCx11
	g1cVzAf3Py7XQiuQPHYnhSPAgQ==
X-Google-Smtp-Source: AGRyM1tpb4ISD+gIeapZVFuGEP+0WJoAnELpvjDNyLOZCXi8tEcDMbepJlZlIKzea53oWU1FXrqrBw==
X-Received: by 2002:a63:4664:0:b0:416:3564:2a94 with SMTP id v36-20020a634664000000b0041635642a94mr38794455pgk.112.1658403037158;
        Thu, 21 Jul 2022 04:30:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l6-20020a656806000000b00419a6f3c8f5sm1297166pgt.19.2022.07.21.04.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 04:30:36 -0700 (PDT)
Message-ID: <62d938dc.1c69fb81.bbd2c.1dbe@mx.google.com>
Date: Thu, 21 Jul 2022 04:30:36 -0700 (PDT)
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
Subject: chrome-platform/for-kernelci cros-ec: 10 runs,
 3 regressions (v5.19-rc1-60-g088b8107e603)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 10 runs, 3 regressions (v5.19-rc1-60-=
g088b8107e603)

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

tegra124-nyan-big | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.19-rc1-60-g088b8107e603/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.19-rc1-60-g088b8107e603
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      088b8107e603c7561ae41ebe65d98d2981d4f122

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
mt8173-elm-hana   | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62d9255dcd3d2c51b1daf09e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-60-g088b8107e603/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-60-g088b8107e603/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220716.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/62d9255dcd3d2c51b1daf0=
9f
        new failure (last pass: v5.19-rc1-58-gad1e2226017a9) =

 =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/62d924485b52543170daf093

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-60-g088b8107e603/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-=
ec-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-60-g088b8107e603/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-=
ec-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220716.0/armhf/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/62d924485b52543170daf0=
94
        failing since 45 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc) =

 =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
tegra124-nyan-big | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/62d927f9c94f1bbe0fdaf06d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-60-g088b8107e603/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-=
ec-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-60-g088b8107e603/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-=
ec-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220716.0/armhf/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/62d927f9c94f1bbe0fdaf0=
6e
        failing since 45 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc) =

 =20
