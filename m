Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C0F4A2D
	for <chrome-platform@lists.linux.dev>; Mon, 22 Jan 2024 04:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705899104; cv=none; b=e8aL3JPoKkCglfl+iAJY9qiBOiFL8lkaD3QkTOMeYP6kpgLM27+u0u4UYlC2F+rQCrRNlp4NMn9/lmIK5Fo4UMEudY7l+Q3TQUnK0dA6BqLEN8OWlvzmoYjxxinVLcb1/VdMpfu21K8TfadvmjblU7JDND8jg+uQ9kRAM94GFaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705899104; c=relaxed/simple;
	bh=UFbNigkqyIidKECgkC9781PBs37qJOkQuz4Avtz1STA=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=iQJnS2ttyzR6nUWmgULiIjc+vL8TpVejxQ4ctDnl2gC6SSDZwQn6hcE7S2RflBH8xRMqJLdFYxwtXw+jHH44PLl1k58HXvlmL3VJaIgoKBD4cWaOLBlb/rLoobowJp6tf0VIbo3OOmw5FeMjZClzTvCtEfRaBtbVOrQSjA9V9XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=X0DRD4U+; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="X0DRD4U+"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d74678df08so894415ad.1
        for <chrome-platform@lists.linux.dev>; Sun, 21 Jan 2024 20:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1705899102; x=1706503902; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=12k8oLjpKguuACthn6EmQII5oeuoAkJ2AYPGRNwUtOA=;
        b=X0DRD4U+zntz925mRTt50P+PBPwiSdMDVmQhxzvbUnIafgJeZWCq9kQWkFdcU/8740
         w8EYT+sK/k/4N0TnuuVvy3kF2ZXXQmXDzeyYypBiGz70p3rAJ5BYq0GTHadD2yazQ8AV
         fsnyKfc+g5HdbLNVTgHd/8EZGtI14AGoAl6j9VOz+WWCux45xzkKwFwCclDBIF5cEDwx
         uNz8Bq6/RPfS6C5YxP5JbZxfbSlx1ZELEphNV+Mb+ED+nhb27zE3VI9ng33oqM7DUZo0
         Gb54ihXnDXAa4epIjzt2sEOtv0U4sIHe5Qe7Mf0IQW+02MVyia6axd0HkdQQ7NwMb3lk
         Q1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705899102; x=1706503902;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=12k8oLjpKguuACthn6EmQII5oeuoAkJ2AYPGRNwUtOA=;
        b=GFAh1mJrmMn+0SK/whFki/t/ns4mZ3pnqh4Cp0CZCLg2EKzaP3QfTBi4VtgpgOwxoH
         gVbdxUXt/9HbGMPQagwZIYcDyLiof3EQT93zG+U8mXhA+oPimbo+ViiMiViGTlkNlxZm
         owrVvX0ZX4MWJUEs4jt2eRgOXSZKNATCFJwh0a3WdFTdbh1/Ihgw63qb+x90jRTtwKHr
         hcNpa/y7SNer3sQe1sTDs2fM3fKnUC4RMAyHSQHiA4XHzd8GMTRCEtcrBHUD0xOCG+vr
         j5attJcepINL7AiuAJs2lyL2qAbpU1GTbLlp73PAUK9fb4hH2+qdev1ixYPuC6pOAt6z
         FW/g==
X-Gm-Message-State: AOJu0YwhEdlq3t7rhNfqpGua++MrNBktuT2ONyiCiy/QhubqrmTR/RWP
	D7bsX70yI99wDO0e1oKqayC1+/xtWQBjG7zbLNqI6C8AnixQ9vIibYKIfm/uc/U=
X-Google-Smtp-Source: AGHT+IFE8y3qXL51JnYGuXOpS3bb6hyiJIODeVVBGFWZGSLQVJZcAJAE0vsegXQm9pzpGDqRqSHHlQ==
X-Received: by 2002:a17:902:74c1:b0:1d7:163:54a1 with SMTP id f1-20020a17090274c100b001d7016354a1mr1349621plt.138.1705899102323;
        Sun, 21 Jan 2024 20:51:42 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id s21-20020a17090330d500b001d6fbaaeb56sm4287564plc.145.2024.01.21.20.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jan 2024 20:51:41 -0800 (PST)
Message-ID: <65adf45d.170a0220.688dc.b62f@mx.google.com>
Date: Sun, 21 Jan 2024 20:51:41 -0800 (PST)
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
X-Kernelci-Kernel: v6.8-rc1
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-firmware-kernelci baseline: 53 runs,
 7 regressions (v6.8-rc1)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-firmware-kernelci baseline: 53 runs, 7 regressions (v6.=
8-rc1)

Regressions Summary
-------------------

platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 5    =
      =

kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig | 2    =
      =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-firmwa=
re-kernelci/kernel/v6.8-rc1/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-firmware-kernelci
  Describe: v6.8-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      6613476e225e090cc9aad49be7fa504e290dd33d =



Test Regressions
---------------- =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 5    =
      =


  Details:     https://kernelci.org/test/plan/id/65ade9a9be097d609e52a43e

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ade9a9be097d609e52a445
        new failure (last pass: v6.7-rc1-2-g09aeaabebdaf)

    2024-01-22T04:05:44.190780  / # #
    2024-01-22T04:05:44.291677  export SHELL=3D/bin/sh
    2024-01-22T04:05:44.292246  #
    2024-01-22T04:05:44.393398  / # export SHELL=3D/bin/sh. /lava-420198/en=
vironment
    2024-01-22T04:05:44.394104  =

    2024-01-22T04:05:44.495211  / # . /lava-420198/environment/lava-420198/=
bin/lava-test-runner /lava-420198/1
    2024-01-22T04:05:44.496151  =

    2024-01-22T04:05:44.504333  / # /lava-420198/bin/lava-test-runner /lava=
-420198/1
    2024-01-22T04:05:44.601019  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-22T04:05:44.601376  + cd /lava-420198/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65ade9a9be097d609e52a449
        new failure (last pass: v6.7-rc1-2-g09aeaabebdaf)

    2024-01-22T04:05:46.816138  /lava-420198/1/../bin/lava-test-case
    2024-01-22T04:05:46.843262  <8>[   26.070576] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
ade9a9be097d609e52a44b
        new failure (last pass: v6.7-rc1-2-g09aeaabebdaf)

    2024-01-22T04:05:47.903349  /lava-420198/1/../bin/lava-test-case
    2024-01-22T04:05:47.929572  <8>[   27.157891] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65ade9a9be097d609e52a450
        new failure (last pass: v6.7-rc1-2-g09aeaabebdaf)

    2024-01-22T04:05:49.161813  /lava-420198/1/../bin/lava-test-case
    2024-01-22T04:05:49.188833  <8>[   28.416486] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65ade9a9be097d609e52a474
        new failure (last pass: v6.7-rc1-2-g09aeaabebdaf)

    2024-01-22T04:05:50.212530  /lava-420198/1/../bin/lava-test-case
    2024-01-22T04:05:50.239820  <8>[   29.466862] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig | 2    =
      =


  Details:     https://kernelci.org/test/plan/id/65ade9abd93f48a1fb52a3f2

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ade9abd93f48a1fb52a3f9
        new failure (last pass: v6.7-rc1-2-g09aeaabebdaf)

    2024-01-22T04:05:47.407240  / # #
    2024-01-22T04:05:47.508039  export SHELL=3D/bin/sh
    2024-01-22T04:05:47.508324  #
    2024-01-22T04:05:47.608884  / # export SHELL=3D/bin/sh. /lava-420200/en=
vironment
    2024-01-22T04:05:47.609209  =

    2024-01-22T04:05:47.709839  / # . /lava-420200/environment/lava-420200/=
bin/lava-test-runner /lava-420200/1
    2024-01-22T04:05:47.710252  =

    2024-01-22T04:05:47.722538  / # /lava-420200/bin/lava-test-runner /lava=
-420200/1
    2024-01-22T04:05:47.815417  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-22T04:05:47.815551  + cd /lava-420200/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65ade9abd93f48a1fb52a40c
        new failure (last pass: v6.7-rc1-2-g09aeaabebdaf)

    2024-01-22T04:05:50.744732  /lava-420200/1/../bin/lava-test-case
    2024-01-22T04:05:50.772570  <8>[   27.091858] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =20
