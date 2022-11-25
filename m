Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB072F46
	for <chrome-platform@lists.linux.dev>; Fri, 25 Nov 2022 12:03:35 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id v3so3804279pgh.4
        for <chrome-platform@lists.linux.dev>; Fri, 25 Nov 2022 04:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/GNvpcnEoclUC2T9wkzCsL+82BI3WbZ8AOp4OjiIh+w=;
        b=V7Jp3K+fdqoBWRT3Z/jokgKO3zlQa/ukxF4ehK6ozC2/BfpDFFv2ib0OXnMZ8znm1K
         QyEeCHJsEOzDpgytRhCnAq7Ukrv2QCAEgDH0UwB+LKnttzVMP/uU6LxOVcS4SH2JImFL
         ne3zfgpK5bqX5aIFZzDeSswwSQGKASY9HXk6WPtBInYZp5J8eGkJJrFo3sj3f40dEELf
         O2U2F8XX3ag0uK9EvZGOF7tCNepfzm+RoWmhi+zkod2NM1Hf16c/VNtY5WxCvjpfb1Rj
         DVqAYPTHSvYP5JrJ9nhDgWY1sixHnVPM1IrJA7vKOsWL4KrXwcDYTBq5iPJaMzCT7oak
         lquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/GNvpcnEoclUC2T9wkzCsL+82BI3WbZ8AOp4OjiIh+w=;
        b=BkTcIwX6RBHBh1EVAqIfWxtioIueth2jXr6jw/Mc23OJNaUrMLqUdyAVb7G2U8TTP+
         GoXZ61y2NlLvjzd0zJ4n1ZJgwM3zsNKdTHa7BjqurSdV4xNHlu3CFxV2dDs0uZlhRus5
         fWVOfTtKyaLP5fgRKVZR7ak8xBs3Jyz7F9O0tG+HqEqvxqBCYVpN2dzJRipLa4thWCXR
         MagsKdUcr/HVKa7HalKXY019CkOGB4Z3u4fMjPO3m97nsaKGkzzjyin+zYEg/QC91j0f
         pmVmQ/w1qhsdZ4tdvVa78ABXJ3uypRRe9bvk8zaQsD4meNqebmKp1hEqMmDZd2cOmMu9
         /fRA==
X-Gm-Message-State: ANoB5pk1RZEaNgI78oQZS0uC2stGTsPGFPx0y5AKWx9mtMws5ocoCJN1
	0YUbV4MUSwmaSP17IJrnVVPz/g==
X-Google-Smtp-Source: AA0mqf6POw4Px9ERzEdcfBkuRNpwzrBzmPl44QJYZA0TZCw39/zRqyvrZOma0j1YQba3Oydv+OQJlA==
X-Received: by 2002:a63:ea15:0:b0:457:7285:fd2d with SMTP id c21-20020a63ea15000000b004577285fd2dmr17297951pgi.580.1669377814637;
        Fri, 25 Nov 2022 04:03:34 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k32-20020a635620000000b004768b74f208sm2521265pgb.4.2022.11.25.04.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 04:03:34 -0800 (PST)
Message-ID: <6380af16.630a0220.6786d.3619@mx.google.com>
Date: Fri, 25 Nov 2022 04:03:34 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-kernelci
X-Kernelci-Kernel: v6.1-rc1-15-g6c7053bf3514
X-Kernelci-Report-Type: test
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci cros-ec: 3 runs,
 3 regressions (v6.1-rc1-15-g6c7053bf3514)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 3 runs, 3 regressions (v6.1-rc1-15-g6=
c7053bf3514)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 2          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.1-rc1-15-g6c7053bf3514/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.1-rc1-15-g6c7053bf3514
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      6c7053bf3514b2a9684d5638e98351bde1c94951

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  86181a7fbd379fc42314c450740d2cea8cdf04c1 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/63809c327332f679cf2abd03

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-15-g6c7053bf3514/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-15-g6c7053bf3514/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221107.1/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
809c327332f679cf2abd14
        failing since 85 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3809c327332f679cf2abd16
        failing since 85 days (last pass: tag-chrome-platform-for-v5.20-2-g=
ddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483)

    2022-11-25T10:42:48.722303  / # =

    2022-11-25T10:42:48.724950  =

    2022-11-25T10:42:48.725385  =

    2022-11-25T10:42:48.831562  / # #
    2022-11-25T10:42:48.834322  #
    2022-11-25T10:42:48.835123  =

    2022-11-25T10:42:48.939377  / # export SHELL=3D/bin/sh
    2022-11-25T10:42:48.942666  export SHELL=3D/bin/sh
    2022-11-25T10:42:49.046999  / # . /lava-8121812/environment
    2022-11-25T10:42:49.049941  . /lava-8121812/environment =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63809a6e60561686582abd4d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-15-g6c7053bf3514/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.1-rc1-15-g6c7053bf3514/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221107.1/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/63809a6e60561686582abd=
4e
        new failure (last pass: v6.1-rc1-14-geba771858c2d) =

 =20
