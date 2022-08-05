Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F0FA3D
	for <chrome-platform@lists.linux.dev>; Fri,  5 Aug 2022 05:31:20 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id f65so1763126pgc.12
        for <chrome-platform@lists.linux.dev>; Thu, 04 Aug 2022 22:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=/8arcw/M4FCqC+Ka0hqZfngEWYDB3kQm4CfJVCSr7nQ=;
        b=r1egmWUSZCWLltKeJvTmCXe5JPgoWax8KauN4g7CuXZilVZpp8uieoLiQC9vuhghW2
         6M9VPRwKzbeUmwJiQYA2lbndqQoYy9VVRzguKCPtQs0Eq9wLzk2/TNZyBesSgqf7e9Nq
         9hZOeSZ4IG4wXBgGJildcooFpGne6eh9dUgEYXKWJ01DF+ks2ps+eukTG+TBuLGZB+r6
         eGVs0/TB2sVctnri3BK+GsXP29zdtOPufh42u0v7bjFtfL3FV6xCHbyfZcTjLEmyUvrF
         zVgWTXwnEmpIk7sGzIFbNfGhv8axNYwQfXizQ1NvAgJ2kOVt5lwTNpyyhY1Uumn71aEh
         Fj7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=/8arcw/M4FCqC+Ka0hqZfngEWYDB3kQm4CfJVCSr7nQ=;
        b=Vd3tFXBMSO0OP/9d7RO9ouaLG0JK0c3ZVHT+M2SafX3UYT4nZfU3B0Mhc0eXir+tXF
         hAb4icw0V1wZT7jt9Tuq7Kbhcx46V5woURxApqJnFyb7CqsLg2FgOxWMcdVvcRXtB54u
         8XBP7d1AgxAwqGZsz3iZeAykRpn8OlgdR5VzvNLbi51R48gUscBoOAqQDR/G/Z4uX/6N
         lpU0gL7lA3FErgCePdLQCD3H8L7S5+kn2QzmLiWHy2m7+ZC5c9t85pP+j7EiMlrWmZoE
         x4m9gu8yXevc/4liqsQNfBJIcxQyC8AXwt1bm80E38EkwkMBC7C0TPj40sKW3sqLgyhF
         5unQ==
X-Gm-Message-State: ACgBeo3n745/3NsVlEl+8Uata0zDQRmIDchV2m1gM/tUcmgCj7WPltUP
	l7+pqeY2rq+o13Swux9KjGFQKw==
X-Google-Smtp-Source: AA6agR46+v44u+Qt17oIajoC1ADQp32WiGQagDfc3U3DYo+51wMTdt5DWp5DmsbV7BscbE57o8b2gQ==
X-Received: by 2002:a05:6a00:290a:b0:52d:9d95:9498 with SMTP id cg10-20020a056a00290a00b0052d9d959498mr5295334pfb.86.1659677479601;
        Thu, 04 Aug 2022 22:31:19 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i24-20020aa796f8000000b005251fff13dfsm1906075pfq.155.2022.08.04.22.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 22:31:18 -0700 (PDT)
Message-ID: <62ecab26.a70a0220.2f125.3a45@mx.google.com>
Date: Thu, 04 Aug 2022 22:31:18 -0700 (PDT)
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
Subject: chrome-platform/for-kernelci cros-ec: 10 runs,
 2 regressions (tag-chrome-platform-for-v5.20-2-gddffaa3d76750)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 10 runs, 2 regressions (tag-chrome-pl=
atform-for-v5.20-2-gddffaa3d76750)

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
ci/kernel/tag-chrome-platform-for-v5.20-2-gddffaa3d76750/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: tag-chrome-platform-for-v5.20-2-gddffaa3d76750
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      ddffaa3d76750278e5a0804fa173b3c8c16ff42a

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  86181a7fbd379fc42314c450740d2cea8cdf04c1 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62ec9c8809c1fdc424daf056

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v5.20-2-gddffaa3d76750/arm/multi_v7_defconfig/gcc-10=
/lab-collabora/cros-ec-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v5.20-2-gddffaa3d76750/arm/multi_v7_defconfig/gcc-10=
/lab-collabora/cros-ec-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220718.0/armhf/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/62ec9c8809c1fdc424daf0=
57
        failing since 59 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc) =

 =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62ec9ab05b477b7509daf057

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v5.20-2-gddffaa3d76750/arm/multi_v7_defconfig/gcc-10=
/lab-collabora/cros-ec-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/t=
ag-chrome-platform-for-v5.20-2-gddffaa3d76750/arm/multi_v7_defconfig/gcc-10=
/lab-collabora/cros-ec-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220718.0/armhf/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/62ec9ab05b477b7509daf0=
58
        failing since 60 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc) =

 =20
