Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C5D4A2D
	for <chrome-platform@lists.linux.dev>; Mon, 22 Jan 2024 04:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705899129; cv=none; b=m4jKU9cYvNzYuKlp6xhdML7bqCu5wk3zZjFjbNiprRp+5ReZkzh53J7lDYv0GHArUPYm2IFnlqf7AJIcwSZXjAfRDYfXFdd7xW+mQxOS4XgxY7HdX8FWEn06XNU63h6dy9EtHrWovkexgp2wicwoRioWk6EFWS6EjYj/TtCwLXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705899129; c=relaxed/simple;
	bh=iYT6owAcG/nwjtcW3wNfEyQD9CyF5+fZHymBdPBuAJc=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=hXUgC2wXR3y76vOE3um/DjlUDUljijCY7JyJ+NUIZ/6W4ZHe5KRC90iG2gJKWQ28vywYx+pMmVLXjxhi9CV6FxSpbmk81N6U5dVg+HdtSk9bnydrmY8WgKYqQfrgvs53ZSd7HgmiL9XY+do7ImZfoJhM4CPVtuYADhgp8Nb11nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=wMTsOCB5; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="wMTsOCB5"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d750660a0aso50525ad.0
        for <chrome-platform@lists.linux.dev>; Sun, 21 Jan 2024 20:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1705899127; x=1706503927; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Pw6Cx9vF6K6Bhy2Wa6RQmp/yS4Pavqa/lCf1iuvTAS0=;
        b=wMTsOCB5IwhoM3iAzwoWT+LbEFsWhwhj5+JSSBEtLC1lJm3jPIIt0ArwfghgzD403r
         4zPhJRk/ycXllqMShc4D6l9AbdrXHz5NDApHn6ztyCC+3ClOsKfJzDsFtoSmB1Y/Jg3Q
         VgDch1KaOF9yjk6Smsv4Fef00eW4IcA+9FY4fBrDk/uTazShQ4he+raoRpv/z5YEpFzi
         QoZBj08xaQ/dbZsSntlfpRCD3ykG97JyjXk5DiPFTI/08x4FMosC1ous2Q7cFHGmpFRl
         3mfEBhG+AKDI5R2qnMuUAR1CQJW9Qc7RrB0gYhzeF88Tlh9kT2E3l18GL/YtHyd3Wi42
         NXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705899127; x=1706503927;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pw6Cx9vF6K6Bhy2Wa6RQmp/yS4Pavqa/lCf1iuvTAS0=;
        b=Gvz80lMUAG+cY6DQqRKLFh7G1k79Mx2JYR9s4bGdhG7ErZLgXI3dVA4m1QLSFDrcdD
         UXXrgBrBevmK0rOnyZ2nHvugvHGDaQi1ndREj0lwgYSeloTIK/hMO7qEVbqfGhrtk6Lt
         NQU6kdiOjAPwGRmkUwJkHpny5Hx+yj/aNBmhQdMDzwZZ/z5VBpd+27yTa9vQcgDuE+sY
         CxzJXOmVH61R8irOey71ySBeoZtMCg6wZsdwqhxDtezGSgC1Vlfb4lyh+RTskPc5DYaG
         vj5zVjvJPEdYfbnVp+gyL5a2D7ESmNLgJnKaqnPOJpe84O6UTB+u1QGlNJ6cG6C1Swd/
         DqDQ==
X-Gm-Message-State: AOJu0YxhXo8Fru3StCM5FTs7QXJzGOuPTVx5TR1WQ90IKyx2MAUTiEg9
	IuVO69H3XZuxMFYqXZem0BLHuxIQpF/czH7Q5MyMEqhFooax/t7MBn76iaFN9rTP73FxvRBM0c9
	EMj4=
X-Google-Smtp-Source: AGHT+IFIwQpjeNCz8Q9QYq8tl8mYeVzheJHHDm1F6J4q2l40KfZnJl6hO2cuqkTdhVtuMPxsfxrvvQ==
X-Received: by 2002:a17:903:1ce:b0:1d7:14c8:3291 with SMTP id e14-20020a17090301ce00b001d714c83291mr1355675plh.90.1705899127363;
        Sun, 21 Jan 2024 20:52:07 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id kv4-20020a17090328c400b001d5b93560c3sm6516384plb.167.2024.01.21.20.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jan 2024 20:52:06 -0800 (PST)
Message-ID: <65adf476.170a0220.aef01.6b41@mx.google.com>
Date: Sun, 21 Jan 2024 20:52:06 -0800 (PST)
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
X-Kernelci-Kernel: v6.8-rc1
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 53 runs,
 8 regressions (v6.8-rc1)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 53 runs, 8 regressions (v6.8-rc1)

Regressions Summary
-------------------

platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
kontron-kbox-a-230-ls   | arm64 | lab-kontron   | gcc-10   | defconfig     =
             | 5          =

kontron-sl28-var3-ads2  | arm64 | lab-kontron   | gcc-10   | defconfig     =
             | 2          =

mt8195-cherry-tomato-r2 | arm64 | lab-collabora | gcc-10   | defconfig+arm6=
4-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.8-rc1/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.8-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      6613476e225e090cc9aad49be7fa504e290dd33d =



Test Regressions
---------------- =



platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
kontron-kbox-a-230-ls   | arm64 | lab-kontron   | gcc-10   | defconfig     =
             | 5          =


  Details:     https://kernelci.org/test/plan/id/65adea71923805601052a458

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.t=
xt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65adea71923805601052a45f
        new failure (last pass: v6.7-rc1-4-g57eb6dcd32cf6)

    2024-01-22T04:09:04.478657  / # #
    2024-01-22T04:09:04.580576  export SHELL=3D/bin/sh
    2024-01-22T04:09:04.581290  #
    2024-01-22T04:09:04.682505  / # export SHELL=3D/bin/sh. /lava-420209/en=
vironment
    2024-01-22T04:09:04.683052  =

    2024-01-22T04:09:04.784389  / # . /lava-420209/environment/lava-420209/=
bin/lava-test-runner /lava-420209/1
    2024-01-22T04:09:04.785660  =

    2024-01-22T04:09:04.830232  / # /lava-420209/bin/lava-test-runner /lava=
-420209/1
    2024-01-22T04:09:04.854517  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-22T04:09:04.888486  + cd /lava-420209/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65adea71923805601052a463
        new failure (last pass: v6.7-rc1-4-g57eb6dcd32cf6)

    2024-01-22T04:09:07.105237  /lava-420209/1/../bin/lava-test-case
    2024-01-22T04:09:07.132345  <8>[   26.070921] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
adea71923805601052a465
        new failure (last pass: v6.7-rc1-4-g57eb6dcd32cf6)

    2024-01-22T04:09:08.192585  /lava-420209/1/../bin/lava-test-case
    2024-01-22T04:09:08.219650  <8>[   27.158717] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65adea71923805601052a46a
        new failure (last pass: v6.7-rc1-4-g57eb6dcd32cf6)

    2024-01-22T04:09:09.451747  /lava-420209/1/../bin/lava-test-case
    2024-01-22T04:09:09.478761  <8>[   28.417581] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65adea71923805601052a46b
        new failure (last pass: v6.7-rc1-4-g57eb6dcd32cf6)

    2024-01-22T04:09:10.500677  /lava-420209/1/../bin/lava-test-case
    2024-01-22T04:09:10.528598  <8>[   29.468049] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
kontron-sl28-var3-ads2  | arm64 | lab-kontron   | gcc-10   | defconfig     =
             | 2          =


  Details:     https://kernelci.org/test/plan/id/65adea99111916562552a74a

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.=
txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65adea99111916562552a751
        new failure (last pass: v6.7-rc1-4-g57eb6dcd32cf6)

    2024-01-22T04:09:39.945050  / # #
    2024-01-22T04:09:40.045925  export SHELL=3D/bin/sh
    2024-01-22T04:09:40.046183  #
    2024-01-22T04:09:40.146730  / # export SHELL=3D/bin/sh. /lava-420204/en=
vironment
    2024-01-22T04:09:40.147042  =

    2024-01-22T04:09:40.247608  / # . /lava-420204/environment/lava-420204/=
bin/lava-test-runner /lava-420204/1
    2024-01-22T04:09:40.248014  =

    2024-01-22T04:09:40.255293  / # /lava-420204/bin/lava-test-runner /lava=
-420204/1
    2024-01-22T04:09:40.352153  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-22T04:09:40.352294  + cd /lava-420204/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65adea99111916562552a764
        new failure (last pass: v6.7-rc1-4-g57eb6dcd32cf6)

    2024-01-22T04:09:43.282197  /lava-420204/1/../bin/lava-test-case
    2024-01-22T04:09:43.312089  <8>[   27.076370] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
mt8195-cherry-tomato-r2 | arm64 | lab-collabora | gcc-10   | defconfig+arm6=
4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/65adeab1111916562552aac8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.8-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt81=
95-cherry-tomato-r2.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.8-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt81=
95-cherry-tomato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65adeab1111916562552a=
ac9
        failing since 37 days (last pass: v6.6-rc1-21-g47ea0ddb1f56, first =
fail: v6.7-rc1-3-g59a9ccf19ee03) =

 =20
