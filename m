Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082CC7A
	for <chrome-platform@lists.linux.dev>; Tue, 19 Apr 2022 12:59:50 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id h5so23556967pgc.7
        for <chrome-platform@lists.linux.dev>; Tue, 19 Apr 2022 05:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=JCb/4/sahvysgB1bCMecKAaEN//+/UiygFQkDiFvAAA=;
        b=qTA68Es0C2ixFEClxhIH/Z+3v+K6Pmat41nJ1Sbq1NnP0kWPklZ9tgZJCHHAGepHuc
         gt3GjZwndVESwOKr9YVB8Iwb8S1Do8s2bBSLlV8XxGlnLTE0anb8Olsg31GlWR3kI8QE
         OaMV2o7L2VWfIVx/U4Tlf6tWk7dhfHafkLlbtGMgGPBtnqoMbY32FW61tH5eSFD1J3mj
         HX40SxEl6asSI3t8rcj+/6L/2XDztEiyLQfjDBD4JCFysI8q9SNd2W7uEWwR3fJamGcj
         kBunzHUNJ3VHavl1e4GZs5qSx38ur0VPi4J85ZYlMkZbFNbKrkf4g75aqWEZ/zAg4nCU
         8U3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=JCb/4/sahvysgB1bCMecKAaEN//+/UiygFQkDiFvAAA=;
        b=PeuQWQbEOqkwulgJH0lcO5LqJBPPclPmKjKTFZHlywGvvr7uPETDPKJ5kk5CTVMxIT
         avgATAIpXasOrO107GLxDRSWAaYnkp/C5erUCIFK0wyLBoLrkIIiz97IdRjcuF5ZaAdC
         MUTA6ZvnobLnOETyy6BOGdlGTctlBPKrnqxGUcmAlsZJ3UDNVmugML3qmf0k24pg+auT
         /cyJbj9qIpIVGqYz3UgGajoBVCMliXI8mCUAEPf+y4POWGGgCarW/knvoHwSRIQdijcP
         WL3aJr4CGbG/gYPtgHfkKYZdV663kSeKjJeqC4Y+DxqejOwtI9nZSjSOGj6DXrpjYoK7
         E3Tg==
X-Gm-Message-State: AOAM533vU5LeoavA7iDj0W2+eYQkYrROqG+ma3TfoRZW+3Med9ElVWiX
	YEiZuOyMeQvNGooWnBGYwFih1g==
X-Google-Smtp-Source: ABdhPJy+FyK3I4H9yQyeH1yk01Pf36o+Df8XLmdGQom8vApqQnphjs0Eh7/QENJAU7Z6GNeCdSH1+g==
X-Received: by 2002:a63:4464:0:b0:3a3:d8fb:6ddd with SMTP id t36-20020a634464000000b003a3d8fb6dddmr14052037pgk.355.1650373190510;
        Tue, 19 Apr 2022 05:59:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p11-20020a17090a748b00b001d221a7134fsm10681958pjk.15.2022.04.19.05.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 05:59:50 -0700 (PDT)
Message-ID: <625eb246.1c69fb81.784a2.6eb4@mx.google.com>
Date: Tue, 19 Apr 2022 05:59:50 -0700 (PDT)
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
X-Kernelci-Kernel: v5.18-rc1-7-g27d5486ca020b
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 83 runs,
 1 regressions (v5.18-rc1-7-g27d5486ca020b)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 83 runs, 1 regressions (v5.18-rc1-7-=
g27d5486ca020b)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.18-rc1-7-g27d5486ca020b/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.18-rc1-7-g27d5486ca020b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      27d5486ca020b03d12410d03fddd7403dee7fc2f =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/625ea8500d6dccaf87ae068d

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.18-rc1-7-g27d5486ca020b/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.18-rc1-7-g27d5486ca020b/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/625ea8500d6dccaf87ae06af
        failing since 14 days (last pass: v5.17-rc1-10-g0ef49b25b7cc, first=
 fail: v5.18-rc1-1-gbf84b10d9901d)

    2022-04-19T12:16:55.836910  <8>[   32.782121] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-04-19T12:16:56.866067  /lava-6121225/1/../bin/lava-test-case   =

 =20
