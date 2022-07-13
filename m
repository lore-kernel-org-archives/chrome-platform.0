Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1494A0A
	for <chrome-platform@lists.linux.dev>; Wed, 13 Jul 2022 19:48:16 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id z12-20020a17090a7b8c00b001ef84000b8bso5461413pjc.1
        for <chrome-platform@lists.linux.dev>; Wed, 13 Jul 2022 12:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=CzeHZYhCbnSliDUJsxpka/BkCjfVE1pmCE0ed3e/J0o=;
        b=fL5o1xNdXGmlBPyHkvAl5d9cFeTK0yoYn17KEUQL7wAczZmFZkLIms12UwYpGkUqk8
         R5EcS0LoAUQ3EoWL/hhwitKA1g6Iv60AesOXFI7ThyUuRNMQnSOa7ofRihbi+pprY9s5
         Xc9fgl+4mxUCLC7yJk3Me5CtQkhqkXuaUTaBWosSws7db6fyCcteOXnpm/+77434WR3I
         UDcpmpqVm0pgrZqUtQi/R44xQnlVsxr0lep10vIEmaOJ1JSydIN8IACBR78Sw3bzDhZg
         xItC31PrB2z2i5uRMfmDjT4u907oJ/ZZJlsIX+TmmAuKMytgXSlVcReB8fezsj9+c+cB
         ctFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=CzeHZYhCbnSliDUJsxpka/BkCjfVE1pmCE0ed3e/J0o=;
        b=CLJKvh1TAd/8qRDw8dkBBqmZxJIO/unauOPfSNDwjCxVyUQ53mJB4ko4jk7UxCoi8b
         T/Gwi8iXkeDWsd6faWsow9deQWXaaxs/HzBSYxQu/q+wg9OgAJg7bscBP3SyQorRMWtV
         n0WY2c2T+4PBmrIcdlp11fNQb17G7ASr3Q/HFARQkfmajlpnSeb2qT5dQJrOjbE3R4cI
         1kY1ofDKAVc5+CxXsw90zVBjWIXry05btNFw/7cQz/mgKPV5FPb4igbOvIoAYr48thz9
         7vUozAM1KzXNuY6HwVylhcsfyhtNHuPZNkVXTWohee2zX1ZELI0lRlBt2F8LUMgL3SZl
         mNmQ==
X-Gm-Message-State: AJIora/ZmNvKY4Tiv9rL2chTtQABTobsMgsSSJl4E/XXGbSngC3nSKyr
	dIYmcwZup+HXR0lsijnB8RhnobyrgAdnHV+gk4Y=
X-Google-Smtp-Source: AGRyM1ugfrzahux1l+a8dxOTxTVtY4PPVxf7nsbaSCpZJ9QJHgJ44P9EVO/UmOKn9nJE4QMR2GwfIQ==
X-Received: by 2002:a17:902:e84a:b0:16c:30bd:2834 with SMTP id t10-20020a170902e84a00b0016c30bd2834mr4717023plg.66.1657741695916;
        Wed, 13 Jul 2022 12:48:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t9-20020a170902e84900b0016c0d531448sm4913880plg.276.2022.07.13.12.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 12:48:15 -0700 (PDT)
Message-ID: <62cf217f.1c69fb81.6f716.7ca0@mx.google.com>
Date: Wed, 13 Jul 2022 12:48:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc1-39-g5ffc0821f4df
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci baseline: 60 runs,
 5 regressions (v5.19-rc1-39-g5ffc0821f4df)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 60 runs, 5 regressions (v5.19-rc1-39=
-g5ffc0821f4df)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
           | regressions
----------------------+-------+---------------+----------+-----------------=
-----------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron   | gcc-10   | defconfig       =
           | 1          =

rk3399-gru-kevin      | arm64 | lab-collabora | gcc-10   | defconfig+arm64-=
chromebook | 4          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.19-rc1-39-g5ffc0821f4df/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.19-rc1-39-g5ffc0821f4df
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      5ffc0821f4df12a904643030172476b7f537508e =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
           | regressions
----------------------+-------+---------------+----------+-----------------=
-----------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron   | gcc-10   | defconfig       =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/62cf166882518bee30a39bd9

  Results:     93 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-39-g5ffc0821f4df/arm64/defconfig/gcc-10/lab-kontron/baseline-kontr=
on-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-39-g5ffc0821f4df/arm64/defconfig/gcc-10/lab-kontron/baseline-kontr=
on-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
cf166882518bee30a39be2
        failing since 37 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-07-13T19:00:43.885083  /lava-140269/1/../bin/lava-test-case
    2022-07-13T19:00:43.930309  <8>[   16.541180] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2022-07-13T19:00:43.930643  /lava-140269/1/../bin/lava-test-case
    2022-07-13T19:00:43.930852  <8>[   16.553838] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2022-07-13T19:00:43.931038  /lava-140269/1/../bin/lava-test-case   =

 =



platform              | arch  | lab           | compiler | defconfig       =
           | regressions
----------------------+-------+---------------+----------+-----------------=
-----------+------------
rk3399-gru-kevin      | arm64 | lab-collabora | gcc-10   | defconfig+arm64-=
chromebook | 4          =


  Details:     https://kernelci.org/test/plan/id/62cf15e89dee968284a39c3f

  Results:     84 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-39-g5ffc0821f4df/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-39-g5ffc0821f4df/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220708.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62cf15e89dee968284a39c60
        failing since 99 days (last pass: v5.17-rc1-10-g0ef49b25b7cc, first=
 fail: v5.18-rc1-1-gbf84b10d9901d)

    2022-07-13T18:58:33.706334  /lava-6812345/1/../bin/lava-test-case
    2022-07-13T18:58:33.720971  <8>[   53.479442] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/62cf15e89dee968284a39c83
        failing since 37 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-07-13T18:58:32.072940  /lava-6812345/1/../bin/lava-test-case
    2022-07-13T18:58:32.085457  <8>[   51.845475] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62cf15e89dee968284a39c84
        failing since 37 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-07-13T18:58:31.041123  /lava-6812345/1/../bin/lava-test-case
    2022-07-13T18:58:31.053296  <8>[   50.813900] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/62cf15e89dee968284a39c85
        failing since 37 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc)

    2022-07-13T18:58:29.402468  <4>[   49.158913] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-07-13T18:58:30.022246  /lava-6812345/1/../bin/lava-test-case
    2022-07-13T18:58:30.037431  <8>[   49.795333] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =20
