Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7797D6FAB
	for <chrome-platform@lists.linux.dev>; Thu, 28 Dec 2023 04:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="l6inyS9M"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d427518d52so26727255ad.0
        for <chrome-platform@lists.linux.dev>; Wed, 27 Dec 2023 20:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1703739374; x=1704344174; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LDs6a8W2Xgcixzs+hGvyi+EHkDr136s6iroZJMsmCJU=;
        b=l6inyS9MwmVjo09oWhchc4jNaZvB2aaPoKalivK3Eale12cQtaqgN+goFCzp15G2ps
         m0NIFO9wHgx6grbWukGQ4HJ0ppBMBR6mxc3E8BCB3dCdw0ap5DuGk5bNDlcXUtL92ADd
         C2eaG+8NQs8fbQtoHrFSSkIc1p3utwI+3SmTGHRRgo+Q8q3oVDYS7oM+EZjEHWoQGiFR
         VROFcZrlKwJ3yUjf7FBkzgWGKJhcsiHa6Yqgz96ryuDWXZFeWxopSNFWTUmYYlLEr+wr
         b+EgXQOzGYj7M/q5izRBjtvP2u87PVx3lFCnvV4iKeyhZDkaNgKzR3shzdHoPiNWRugi
         dzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703739375; x=1704344175;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LDs6a8W2Xgcixzs+hGvyi+EHkDr136s6iroZJMsmCJU=;
        b=uulr+WoFQ9yBukcMT4hh0ZBd814YouulssnXtlGQMrP2VlbKcLZg2wjpo7n7Cp//AI
         sDOGDl9oHZcH97HVZi6XrqH8UTuZnxA4hhHxhzhCtPjyZEZkfRVeRfm0TBJu6KU/Z2PX
         B235O3S24s9MhZz3ancNXozFcslKe7IX6zy2CkHrVh4PALGns0Ptd+2cU6pcM9EKgXYQ
         u/y9pMEXgbOdnRlIMzReDGuxPE8jE++uiPjWNKdF6nsk0+GgqsN5RD0Y9fwSLgeoz7aA
         f93MQWRSfKYte3K2joZUBKWLcmbKR6R5Mo4D/jhoRklQoDhGMMjOXEtZnDyaXPf4vmpT
         ZYVw==
X-Gm-Message-State: AOJu0YzC4tCMbS5mL11K9vj117rubKPNeVCEz6RVEuacDjfCIH+eV31p
	AUeTMThNPTOn2U6qsasYGX2P68PxPTeBmQ==
X-Google-Smtp-Source: AGHT+IE/Qg8wE1bVxAgN+B2hSHbjrJPUQaQ9SaMxSiHXT0Qv2a0sHF9aKdcDlPTfTmHDf1TNGYDlDA==
X-Received: by 2002:a17:902:f802:b0:1d4:3cff:279e with SMTP id ix2-20020a170902f80200b001d43cff279emr8628484plb.32.1703739374689;
        Wed, 27 Dec 2023 20:56:14 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id l7-20020a170902f68700b001d39af62b1fsm12769965plg.232.2023.12.27.20.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 20:56:14 -0800 (PST)
Message-ID: <658cffee.170a0220.16c4a.e5d4@mx.google.com>
Date: Wed, 27 Dec 2023 20:56:14 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-firmware-kernelci
X-Kernelci-Tree: chrome-platform
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.7-rc1-2-g09aeaabebdaf
Subject: chrome-platform/for-firmware-kernelci baseline: 89 runs,
 1 regressions (v6.7-rc1-2-g09aeaabebdaf)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-firmware-kernelci baseline: 89 runs, 1 regressions (v6.=
7-rc1-2-g09aeaabebdaf)

Regressions Summary
-------------------

platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
imx8mp-evk | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-firmwa=
re-kernelci/kernel/v6.7-rc1-2-g09aeaabebdaf/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-firmware-kernelci
  Describe: v6.7-rc1-2-g09aeaabebdaf
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      09aeaabebdafbcf4afd1c481beaff37ecbc6b023 =



Test Regressions
---------------- =



platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
imx8mp-evk | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/658cf4db98d47c3c06e134d1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.7-rc1-2-g09aeaabebdaf/arm64/defconfig/gcc-10/lab-broonie/baselin=
e-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.7-rc1-2-g09aeaabebdaf/arm64/defconfig/gcc-10/lab-broonie/baselin=
e-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/658cf4db98d47c3c06e134da
        failing since 107 days (last pass: v6.5-rc1-1-g0979e7e3cfd7, first =
fail: v6.6-rc1)

    2023-12-28T04:08:37.423573  + set<8>[   29.752899] <LAVA_SIGNAL_ENDRUN =
0_dmesg 395986_1.5.2.4.1>
    2023-12-28T04:08:37.423824   +x
    2023-12-28T04:08:37.526770  / # #
    2023-12-28T04:08:38.686112  export SHELL=3D/bin/sh
    2023-12-28T04:08:38.691749  #
    2023-12-28T04:08:40.183399  / # export SHELL=3D/bin/sh. /lava-395986/en=
vironment
    2023-12-28T04:08:40.188904  =

    2023-12-28T04:08:42.898404  / # . /lava-395986/environment/lava-395986/=
bin/lava-test-runner /lava-395986/1
    2023-12-28T04:08:42.904734  =

    2023-12-28T04:08:42.909333  / # /lava-395986/bin/lava-test-runner /lava=
-395986/1 =

    ... (11 line(s) more)  =

 =20
