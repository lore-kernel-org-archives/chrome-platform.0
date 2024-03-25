Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BB9213437
	for <chrome-platform@lists.linux.dev>; Mon, 25 Mar 2024 03:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711336035; cv=none; b=WYRdYtQuOEAdqx4JWw+SizKkNExpjPHSIbNPGGJveNZq3QxubYInDzHkVDbRsOh4/ZBY+2wpvLfqWoAvOFhdjyVTMPvsWNJTrPDamsEiCscrTiwliK0VWfp2X5yoBKqWW2sXIl7r1OIF06wW+tgRsClP2lSSvg/6bfUPVNTS2Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711336035; c=relaxed/simple;
	bh=YNTPTC7U6C1f0lrVBWF8cThbY5E1IoKKBtmdkRoVYGI=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=JLxIrO/xsGh0nnQOIcgT8dRsEICtOi9P9eOLZpMLYyBoSvfB3w/QhOoUZV4Uw9OzaqoDk1T7PyO6dj3PCIsutV1e65tM9Ml6L47uIxdlw86XdJftSfCeJ3OU+BZKV4Tv1GrdpUf7HG7wsTRUT6edGsMUIyr3u23R2SwUyXVECrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=XCt3U+S6; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="XCt3U+S6"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1def89f0cfdso35764465ad.0
        for <chrome-platform@lists.linux.dev>; Sun, 24 Mar 2024 20:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1711336032; x=1711940832; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tOTX94aFdHdRhjFWA1DTYBpd8mId3WmTQDuggEcaJ10=;
        b=XCt3U+S6yDs8OF+1f4E5U4VjlM67itdZMuIRomCKWf8bO4tLw4Lk+nj25Aq3AHepbL
         hvAOO8K17lF2jnVSPB7raiYXMTzsBukL2gv2x6TWkGVKvKADZjIhcMvFz97yrX1RMkjp
         eKEoOWlkZhhYjRlAWE7cAxbtVdpaIi07l7tJxhjKy79Xf7f5LU+YBtcldeiyP5EYIfkw
         sTlF3JvMWMqhkvdnIihLV0a9KLc9VaenEmr9BAa0wjba8m7FN4x+aMYwG6BQwLg8mQWh
         mdiJ6SxLHtwC0stO/Z2El2J4sMaK3yoOo6twyjusu+ZbMDSCuRPQ8pEk+h6wHv3TJsJl
         MpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711336032; x=1711940832;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tOTX94aFdHdRhjFWA1DTYBpd8mId3WmTQDuggEcaJ10=;
        b=EJXFa5pUnmLwt9oBr3/Lkwz5W0t62K79tNV8c8lGOMvD/vA9BoYj6BnzLFEd9Dx9c/
         gmlGGmkkJSW6tkkfCddXa0T9RE/bkWuhHDEEs2g7EoB5sMt94ZNFNOotm8OY6N8+2eM+
         PuatMb2Q+c+lzUWyhW/lga53Uk8pReHeRhg55/B/Dki7IqJewq/sYrywdDMEwP4Yslm0
         ikKaVeyjuU6FqaYSfgGdGucdT3X773NSgzmGcuIJI5bGJzt+ueJuO39p8P1Dse1EWFO5
         Sst3dDkRZ9J2l0z9GxI32gSI2iXiWs+8D+t5kNUVC3Ud4d22mOLK3Axq0qandrMmqwaB
         0AYw==
X-Forwarded-Encrypted: i=1; AJvYcCU97baJWJ5i/RJlY7sXEkXlbU4jI50tVNX40vfsOZEQD0HfeD7MtgwON5HA6lw0KDzst3M145Fz2AcM7fuOzdcerk2tLZOF12NX7/FJUY+8
X-Gm-Message-State: AOJu0YyrdionmlPOoBW6kGNrviYSKVExYulQYIePxJLPYbtZY6P5AwUd
	rylsFODDd27NkYVFSCYxS+xMwcUHBfVxQ8raMUoUOmgrHuglByxPNmlA7ntJKEY=
X-Google-Smtp-Source: AGHT+IGYh+shRRSjbd+8+A/zUxLznzmMoB4YWvHg9g7fmvdf7ger9Hjcv+TeGYjzDgTHe45KBtBBAA==
X-Received: by 2002:a17:902:ce09:b0:1dc:fc84:198 with SMTP id k9-20020a170902ce0900b001dcfc840198mr8551018plg.29.1711336032251;
        Sun, 24 Mar 2024 20:07:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id u6-20020a170903124600b001dc30f13e6asm3755953plh.137.2024.03.24.20.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 20:07:11 -0700 (PDT)
Message-ID: <6600ea5f.170a0220.86cbb.8cb3@mx.google.com>
Date: Sun, 24 Mar 2024 20:07:11 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc1
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 83 runs,
 12 regressions (v6.9-rc1)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 83 runs, 12 regressions (v6.9-rc1)

Regressions Summary
-------------------

platform               | arch   | lab           | compiler | defconfig     =
             | regressions
-----------------------+--------+---------------+----------+---------------=
-------------+------------
acer-R721T-grunt       | x86_64 | lab-collabora | gcc-10   | x86_64_defconf=
ig+x86-board | 1          =

hp-11A-G6-EE-grunt     | x86_64 | lab-collabora | gcc-10   | x86_64_defconf=
ig+x86-board | 1          =

hp-14-db0003na-grunt   | x86_64 | lab-collabora | gcc-10   | x86_64_defconf=
ig+x86-board | 1          =

kontron-kbox-a-230-ls  | arm64  | lab-kontron   | gcc-10   | defconfig     =
             | 5          =

kontron-sl28-var3-ads2 | arm64  | lab-kontron   | gcc-10   | defconfig     =
             | 2          =

mt8173-elm-hana        | arm64  | lab-collabora | gcc-10   | defconfig+arm6=
4-chromebook | 2          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.9-rc1/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.9-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      4cece764965020c22cff7665b18a012006359095 =



Test Regressions
---------------- =



platform               | arch   | lab           | compiler | defconfig     =
             | regressions
-----------------------+--------+---------------+----------+---------------=
-------------+------------
acer-R721T-grunt       | x86_64 | lab-collabora | gcc-10   | x86_64_defconf=
ig+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/6600e05930fba145fd4c4334

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-ace=
r-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-ace=
r-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6600e05930fba145fd4c4=
335
        new failure (last pass: v6.7-rc1-4-g57eb6dcd32cf6) =

 =



platform               | arch   | lab           | compiler | defconfig     =
             | regressions
-----------------------+--------+---------------+----------+---------------=
-------------+------------
hp-11A-G6-EE-grunt     | x86_64 | lab-collabora | gcc-10   | x86_64_defconf=
ig+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/6600e06c26df3cfd2f4c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-=
11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-=
11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6600e06c26df3cfd2f4c4=
2db
        new failure (last pass: v6.7-rc1-4-g57eb6dcd32cf6) =

 =



platform               | arch   | lab           | compiler | defconfig     =
             | regressions
-----------------------+--------+---------------+----------+---------------=
-------------+------------
hp-14-db0003na-grunt   | x86_64 | lab-collabora | gcc-10   | x86_64_defconf=
ig+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/6600e06b5bec175e294c4364

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-=
14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-=
14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6600e06b5bec175e294c4=
365
        new failure (last pass: v6.7-rc1-4-g57eb6dcd32cf6) =

 =



platform               | arch   | lab           | compiler | defconfig     =
             | regressions
-----------------------+--------+---------------+----------+---------------=
-------------+------------
kontron-kbox-a-230-ls  | arm64  | lab-kontron   | gcc-10   | defconfig     =
             | 5          =


  Details:     https://kernelci.org/test/plan/id/6600df96e33f5606fa4c42e1

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.t=
xt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6600df96e33f5606fa4c42e8
        failing since 62 days (last pass: v6.7-rc1-4-g57eb6dcd32cf6, first =
fail: v6.8-rc1)

    2024-03-25T02:20:56.716785  <8>[   20.258495] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 446972_1.5.2.4.1>
    2024-03-25T02:20:56.822154  / # #
    2024-03-25T02:20:56.924190  export SHELL=3D/bin/sh
    2024-03-25T02:20:56.924893  #
    2024-03-25T02:20:57.026463  / # export SHELL=3D/bin/sh. /lava-446972/en=
vironment
    2024-03-25T02:20:57.027164  =

    2024-03-25T02:20:57.128441  / # . /lava-446972/environment/lava-446972/=
bin/lava-test-runner /lava-446972/1
    2024-03-25T02:20:57.129661  =

    2024-03-25T02:20:57.148501  / # /lava-446972/bin/lava-test-runner /lava=
-446972/1
    2024-03-25T02:20:57.192897  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/6600df96e33f5606fa4c42ec
        failing since 62 days (last pass: v6.7-rc1-4-g57eb6dcd32cf6, first =
fail: v6.8-rc1)

    2024-03-25T02:20:59.300785  /lava-446972/1/../bin/lava-test-case
    2024-03-25T02:20:59.301017  <8>[   22.831329] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-03-25T02:20:59.301532  /lava-446972/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/66=
00df96e33f5606fa4c42ee
        failing since 62 days (last pass: v6.7-rc1-4-g57eb6dcd32cf6, first =
fail: v6.8-rc1)

    2024-03-25T02:21:00.340369  /lava-446972/1/../bin/lava-test-case
    2024-03-25T02:21:00.340813  <8>[   23.870844] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-03-25T02:21:00.341131  /lava-446972/1/../bin/lava-test-case
    2024-03-25T02:21:00.341356  <8>[   23.888876] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/6600df96e33f5606fa4c42f3
        failing since 62 days (last pass: v6.7-rc1-4-g57eb6dcd32cf6, first =
fail: v6.8-rc1)

    2024-03-25T02:21:01.439650  /lava-446972/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/6600df96e33f5606fa4c42f4
        failing since 62 days (last pass: v6.7-rc1-4-g57eb6dcd32cf6, first =
fail: v6.8-rc1)

    2024-03-25T02:21:01.442825  <8>[   24.987544] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-25T02:21:02.502747  /lava-446972/1/../bin/lava-test-case
    2024-03-25T02:21:02.503209  <8>[   26.009596] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-03-25T02:21:02.503569  /lava-446972/1/../bin/lava-test-case   =

 =



platform               | arch   | lab           | compiler | defconfig     =
             | regressions
-----------------------+--------+---------------+----------+---------------=
-------------+------------
kontron-sl28-var3-ads2 | arm64  | lab-kontron   | gcc-10   | defconfig     =
             | 2          =


  Details:     https://kernelci.org/test/plan/id/6600dfaae33f5606fa4c435c

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.=
txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6600dfaae33f5606fa4c4363
        failing since 62 days (last pass: v6.7-rc1-4-g57eb6dcd32cf6, first =
fail: v6.8-rc1)

    2024-03-25T02:21:09.172109  / # #
    2024-03-25T02:21:09.273678  export SHELL=3D/bin/sh
    2024-03-25T02:21:09.274155  #
    2024-03-25T02:21:09.375288  / # export SHELL=3D/bin/sh. /lava-446975/en=
vironment
    2024-03-25T02:21:09.376021  =

    2024-03-25T02:21:09.477413  / # . /lava-446975/environment/lava-446975/=
bin/lava-test-runner /lava-446975/1
    2024-03-25T02:21:09.478640  =

    2024-03-25T02:21:09.483685  / # /lava-446975/bin/lava-test-runner /lava=
-446975/1
    2024-03-25T02:21:09.551583  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-25T02:21:09.552013  + <8>[   20.998866] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 446975_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/6600dfaae33f5606fa4c4376
        failing since 62 days (last pass: v6.7-rc1-4-g57eb6dcd32cf6, first =
fail: v6.8-rc1)

    2024-03-25T02:21:11.990510  /lava-446975/1/../bin/lava-test-case
    2024-03-25T02:21:11.991005  <8>[   23.425209] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-25T02:21:11.991300  /lava-446975/1/../bin/lava-test-case   =

 =



platform               | arch   | lab           | compiler | defconfig     =
             | regressions
-----------------------+--------+---------------+----------+---------------=
-------------+------------
mt8173-elm-hana        | arm64  | lab-collabora | gcc-10   | defconfig+arm6=
4-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/6600e05a5bec175e294c430f

  Results:     27 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt81=
73-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt81=
73-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.armv8-pmu-a72-probed: https://kernelci.org/test/case/id=
/6600e05a5bec175e294c432a
        new failure (last pass: v6.8-rc1)

    2024-03-25T02:24:13.777255  <8>[   31.104995] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Darmv8-pmu-a53-probed RESULT=3Dfail>

    2024-03-25T02:24:14.794340  /lava-13143349/1/../bin/lava-test-case

    2024-03-25T02:24:14.803780  <8>[   32.133640] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Darmv8-pmu-a72-probed RESULT=3Dfail>
   =


  * baseline.bootrr.armv8-pmu-a53-probed: https://kernelci.org/test/case/id=
/6600e05a5bec175e294c432b
        new failure (last pass: v6.8-rc1)

    2024-03-25T02:24:13.764451  /lava-13143349/1/../bin/lava-test-case
   =

 =20
