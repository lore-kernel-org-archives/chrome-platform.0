Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F5D7F
	for <chrome-platform@lists.linux.dev>; Tue, 23 Aug 2022 02:14:09 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id m15so4680811pjj.3
        for <chrome-platform@lists.linux.dev>; Mon, 22 Aug 2022 19:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=Z5XH+AHN0sZRqrl2HQ0Qb6qhlW3JvCPWvHW5vKSDQgY=;
        b=JKj8LN3NxSxbCfBX7Km9lzeb0Kzs04RaE6QbKd31GUkLh/z6zjA+u2MCq59B1jxjPU
         aiUgJvGireTEZjC+HlhILdqI9zyMr4svIT+WCu5LCrGEMgyJCYrMonOz3lpn/rr3OLf8
         jTw5Zz1bO3ACPY4t55mlNbtFAnyEEeDnOu6J2jZDrAv19osYABDehEmx9yIr60CPHrdV
         7/auDkFN+0S8YpUJP6cdNvg6A45N044vLe0QL7HN227y4Y1gZ508kCDRX/+bWPb1o/Jr
         nmrD9X4RwLy8LntzGD6n79A2HL0pRsvcMLciLQKA0hrcI4cipD/jVdbFYFe7RXTLhIm5
         3uQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=Z5XH+AHN0sZRqrl2HQ0Qb6qhlW3JvCPWvHW5vKSDQgY=;
        b=o0r861wYX/VpIXMgeC6HVl5I1mfeMqR9wqs8QO2HS/VG2sotPJPr+bBNRAP3hNYe6S
         A59ZCqekaHiocNFFNDtlFY0QHbhvhhPSh4IMNRXUI0izCxe4uQEco3+x+629fZmjRxrD
         BTF5xnIz6f9sTEYUGsB4BrS74Kqmaf4rMnvGzLq7tgxKuVzmZUbFSecL+nCnco3vD6Jy
         f+UCEp2ZsI00xoPsLUlIK9vJOACJE0a6WQxzxSHnO3nvI/BzHhsZppF98tOAQyRotkPa
         14qvdzJcGamUVW6fxTcENHFeykZ9bwODty2sgTx1nqNrqnnGVKJj+SCKcuQHH7o1GpxZ
         Vwng==
X-Gm-Message-State: ACgBeo3qEeS7RVMn9LlqsfhNJEHDl+WJ1W+E+j+fw4bCCfbaytRkjxdw
	RVPyIyoGC+smuIDDJEjmNhYwYA==
X-Google-Smtp-Source: AA6agR52JBo3gqikHV5RipHGCuLYM741OK83yd/a1y6leXfDaJKpSf2i7hvxG/6uihm8bzEhhJNh6g==
X-Received: by 2002:a17:90b:1e4a:b0:1f7:3769:ac18 with SMTP id pi10-20020a17090b1e4a00b001f73769ac18mr1097172pjb.228.1661220848875;
        Mon, 22 Aug 2022 19:14:08 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a68-20020a621a47000000b005366280c39fsm4985685pfa.140.2022.08.22.19.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 19:14:08 -0700 (PDT)
Message-ID: <630437f0.620a0220.cc9cb.8730@mx.google.com>
Date: Mon, 22 Aug 2022 19:14:08 -0700 (PDT)
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
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.0-rc1-11-g48a86d3e4836
Subject: chrome-platform/for-kernelci baseline: 68 runs,
 2 regressions (v6.0-rc1-11-g48a86d3e4836)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 68 runs, 2 regressions (v6.0-rc1-11-=
g48a86d3e4836)

Regressions Summary
-------------------

platform           | arch  | lab         | compiler | defconfig | regressio=
ns
-------------------+-------+-------------+----------+-----------+----------=
--
kontron-pitx-imx8m | arm64 | lab-kontron | gcc-10   | defconfig | 2        =
  =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.0-rc1-11-g48a86d3e4836/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.0-rc1-11-g48a86d3e4836
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      48a86d3e48368fd79d1c4b96158cb77346f1867e =



Test Regressions
---------------- =



platform           | arch  | lab         | compiler | defconfig | regressio=
ns
-------------------+-------+-------------+----------+-----------+----------=
--
kontron-pitx-imx8m | arm64 | lab-kontron | gcc-10   | defconfig | 2        =
  =


  Details:     https://kernelci.org/test/plan/id/630429353453f405d6355661

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-11-g48a86d3e4836/arm64/defconfig/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.0-rc1-11-g48a86d3e4836/arm64/defconfig/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/630429353453f405d6355673
        new failure (last pass: tag-chrome-platform-for-v5.20-2-gddffaa3d76=
750)

    2022-08-23T01:11:07.992964  /lava-157786/1/../bin/lava-test-case
    2022-08-23T01:11:07.993290  <8>[   19.382107] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-08-23T01:11:07.993443  /lava-157786/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/630=
429353453f405d6355675
        new failure (last pass: tag-chrome-platform-for-v5.20-2-gddffaa3d76=
750)

    2022-08-23T01:11:09.030307  /lava-157786/1/../bin/lava-test-case
    2022-08-23T01:11:09.030719  <8>[   20.425807] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-08-23T01:11:09.030963  /lava-157786/1/../bin/lava-test-case
    2022-08-23T01:11:09.031916  <8>[   20.445707] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>
    2022-08-23T01:11:09.032214  /lava-157786/1/../bin/lava-test-case
    2022-08-23T01:11:09.032452  <8>[   20.466087] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb0-probed RESULT=3Dpass>
    2022-08-23T01:11:09.032686  /lava-157786/1/../bin/lava-test-case   =

 =20
