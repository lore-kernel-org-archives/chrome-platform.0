Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECA5748A
	for <chrome-platform@lists.linux.dev>; Wed,  8 Feb 2023 20:12:31 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id r17so4622931pff.9
        for <chrome-platform@lists.linux.dev>; Wed, 08 Feb 2023 12:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=93AxlFzKvag+i9UFTU90CTZbo5GED76Jm5qcnmiEABQ=;
        b=f50F86EHvqLABYVhiFUw0kT7sH8Cb6GVmlWxHLv3lS41iZESGpksJLNKdSD2UZ7i3K
         +ukDs3NNIb2YmdYUelinFyP2oXN/UIj6xAKpVDw+B81mYWhV7ZPzEDCm7Z2tRaMnTFYH
         3o+letvZvs0ZwBPUL+yOK7KEc+h0vGCpS6ZUDq+jDywaOoybnvdXppfSpG8rXZvIrvvc
         mpj2CVfiFSgPlTWVrr+/qFtRJoI4BQh6m1fCkMk+DzLoaGTAe9HEK9sZrloCe3wvKSdp
         vOT5Ps9xhZJJJ95q7UBjmu4jFK2ycFLynDJJd0tqXcgiD2YtRARztSWuM4aJzl4eMMK7
         btTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=93AxlFzKvag+i9UFTU90CTZbo5GED76Jm5qcnmiEABQ=;
        b=dscNuHORFopfhy4ml8qb1elHeAf3S6QFdrsX8uSDkZx5T45wKudyTiqoQII/vliWJ4
         yl4gasz5AaX60TXtnm+foxpp6vAz3lBSZxfu9evwxHQ4XRdbA+yFcoMVVGwo5yBiwhet
         04ZtFFMdp/C4xXESLYXiV1ZEF+RBCaorhdaWoyvZ6IGAJ4KPUEat7Vxh5MnP/myMVtRx
         fryD8HuM4xGMI5diaq4dO00ILjcVe6Iz7CzKLLdNiitVHm3fQ12PxjTZUXTvj8R3ikhy
         RQYLfo4/TGJwJP/M78LL6VoNmF6S5qDD+QHm4kfD3cBPWCqmZF6BWGldyU0vwgmq66fI
         v/jQ==
X-Gm-Message-State: AO0yUKXGbmqoCqxBrzuq4Di7JdqoiNnxfW6HSPleys/89Oiko+JK8e8F
	hTzTOOA6uS+2Yl3yXfdNPvi36Q==
X-Google-Smtp-Source: AK7set+lMNX1YgJQrwdqFKAc9GnW6hVjl0hZcnySpo4TUw1E10hcIw+1lBKqmLYRQ6WHW7K/rpEywA==
X-Received: by 2002:a62:384f:0:b0:593:40ba:3ee8 with SMTP id f76-20020a62384f000000b0059340ba3ee8mr5807272pfa.12.1675887150621;
        Wed, 08 Feb 2023 12:12:30 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c8-20020aa78c08000000b00597caf6236esm9368713pfd.150.2023.02.08.12.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 12:12:30 -0800 (PST)
Message-ID: <63e4022e.a70a0220.c5879.fb58@mx.google.com>
Date: Wed, 08 Feb 2023 12:12:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
X-Kernelci-Kernel: v6.2-rc1-35-g75a273974d7a
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 76 runs,
 2 regressions (v6.2-rc1-35-g75a273974d7a)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 76 runs, 2 regressions (v6.2-rc1-35-=
g75a273974d7a)

Regressions Summary
-------------------

platform   | arch | lab             | compiler | defconfig          | regre=
ssions
-----------+------+-----------------+----------+--------------------+------=
------
imx53-qsrb | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig | 1    =
      =

odroid-xu3 | arm  | lab-collabora   | gcc-10   | multi_v7_defconfig | 1    =
      =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.2-rc1-35-g75a273974d7a/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.2-rc1-35-g75a273974d7a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      75a273974d7ac814b655eda546c62064a4b41d34 =



Test Regressions
---------------- =



platform   | arch | lab             | compiler | defconfig          | regre=
ssions
-----------+------+-----------------+----------+--------------------+------=
------
imx53-qsrb | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig | 1    =
      =


  Details:     https://kernelci.org/test/plan/id/63e3f4d2492e6f0cfd8c8634

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-35-g75a273974d7a/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/base=
line-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-35-g75a273974d7a/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/base=
line-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e3f4d2492e6f0cfd8c863d
        failing since 7 days (last pass: v6.1-rc1-16-gd74fa18ce5f0, first f=
ail: v6.2-rc1-34-gfcc9e52d591e)

    2023-02-08T19:15:10.451226  + set +x
    2023-02-08T19:15:10.451444  [   12.850785] <LAVA_SIGNAL_ENDRUN 0_dmesg =
901424_1.5.2.3.1>
    2023-02-08T19:15:10.558672  / # #
    2023-02-08T19:15:10.660506  export SHELL=3D/bin/sh
    2023-02-08T19:15:10.660988  #
    2023-02-08T19:15:10.762378  / # export SHELL=3D/bin/sh. /lava-901424/en=
vironment
    2023-02-08T19:15:10.762867  =

    2023-02-08T19:15:10.864256  / # . /lava-901424/environment/lava-901424/=
bin/lava-test-runner /lava-901424/1
    2023-02-08T19:15:10.864968  =

    2023-02-08T19:15:10.868210  / # /lava-901424/bin/lava-test-runner /lava=
-901424/1 =

    ... (12 line(s) more)  =

 =



platform   | arch | lab             | compiler | defconfig          | regre=
ssions
-----------+------+-----------------+----------+--------------------+------=
------
odroid-xu3 | arm  | lab-collabora   | gcc-10   | multi_v7_defconfig | 1    =
      =


  Details:     https://kernelci.org/test/plan/id/63e3f4e5730580d7848c8706

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-35-g75a273974d7a/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseli=
ne-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-35-g75a273974d7a/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseli=
ne-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e3f4e5730580d7848c8=
707
        new failure (last pass: v6.2-rc1-34-gfcc9e52d591e) =

 =20
