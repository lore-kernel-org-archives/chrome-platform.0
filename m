Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB23628
	for <chrome-platform@lists.linux.dev>; Fri, 13 Jan 2023 03:47:26 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id o7-20020a17090a0a0700b00226c9b82c3aso23140163pjo.3
        for <chrome-platform@lists.linux.dev>; Thu, 12 Jan 2023 19:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b+AoK2nvo0AyjcprB47n83uXCfGMghUNWHWzXhOZTPI=;
        b=b7x7hhy0QqK8Nj8irHUn5QYMyM+0NjHgs1LCuLj54i4LNiqHyIW4IejaOx47lgGN4p
         3eWKcUDZwmz0ekiVnN+KFvGNZTkNFqZYOxAcaGTxUcGOvdjnxi2FBaXBs7iSMuyoQ7Ys
         KCfLYf5rhGOnjz6ZTtSemMMLhVJmD2WTWvyurlN7U+EK1QpQ5zMWTUkz3V4sItdvdU5d
         Uu6YClQyZ4K/OPkHo+rtmcysgRrihOLb+JwFqlRD0sYKYrFsIGmXIq3GTG4uuGGgAqmb
         04M7Oz4fsr3rIURtvbAkWRZ1eOJhLiPto3QW7ce/fYbkJkJ6D9YmRc8CMFosLLrQFOvg
         tTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+AoK2nvo0AyjcprB47n83uXCfGMghUNWHWzXhOZTPI=;
        b=gIsOCz5d4XyQXYpf8DLUGP+n3iWGiMspdqB93z460vl9qLbVCYfYzUgwppzMxpgF8j
         v6xUufHTT3kJy1tjcse0mVqHQDUGZfU6+msrsI/jRou4FMrRyVPX5B0PWAbvOfMicC7a
         g9yXVIzby+MP/w1VL619AxJnJB+52rRwV7lwf9I4EPOcQBSbYZ9FEhxwQbXPDNjh+kCo
         IabpR544BpBy8yhDoKhFjkTLxK5LFt9NfrqOK0LjEemJhGj9cUgu0Br1MU60L+PRtqXD
         UqP9QzzIqhJyn23GkeXn2S32Qxx/NEpNAUmLcGaQoimBLshtC48SZX+Iuz76ujll1PAz
         YMxA==
X-Gm-Message-State: AFqh2kp++vhJqgG814EvOxrdXYf0wsKSOypEDazpw6VkRVA6EKlh+ctg
	huDAX1CpcGjIBnfZx17rV2A61w==
X-Google-Smtp-Source: AMrXdXtYbgCXyBn7NWtR/KNaOSuY6G97z3OIoFnbzyybw1IYFwnB5nCbu1tvTjL8JIbtvcTRm37KZQ==
X-Received: by 2002:a17:902:aa85:b0:189:894c:6b48 with SMTP id d5-20020a170902aa8500b00189894c6b48mr82709027plr.59.1673581645844;
        Thu, 12 Jan 2023 19:47:25 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z12-20020a170903018c00b0019311ec702asm12773395plg.36.2023.01.12.19.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 19:47:25 -0800 (PST)
Message-ID: <63c0d44d.170a0220.bf97a.4b74@mx.google.com>
Date: Thu, 12 Jan 2023 19:47:25 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.2-rc1-28-g24ddc3b53a9d
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 70 runs,
 3 regressions (v6.2-rc1-28-g24ddc3b53a9d)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 70 runs, 3 regressions (v6.2-rc1-28-=
g24ddc3b53a9d)

Regressions Summary
-------------------

platform           | arch  | lab           | compiler | defconfig          =
        | regressions
-------------------+-------+---------------+----------+--------------------=
--------+------------
kontron-pitx-imx8m | arm64 | lab-kontron   | gcc-10   | defconfig          =
        | 2          =

mt8173-elm-hana    | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chr=
omebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.2-rc1-28-g24ddc3b53a9d/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.2-rc1-28-g24ddc3b53a9d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      24ddc3b53a9d05b5fb5ee367afd1758ac50e7861 =



Test Regressions
---------------- =



platform           | arch  | lab           | compiler | defconfig          =
        | regressions
-------------------+-------+---------------+----------+--------------------=
--------+------------
kontron-pitx-imx8m | arm64 | lab-kontron   | gcc-10   | defconfig          =
        | 2          =


  Details:     https://kernelci.org/test/plan/id/63c0cb3654c615935f1d39c9

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-28-g24ddc3b53a9d/arm64/defconfig/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-28-g24ddc3b53a9d/arm64/defconfig/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c0cb3654c615935f1d39cc
        new failure (last pass: v6.2-rc1-23-g93899a4cb7b1)

    2023-01-13T03:08:23.383014  / # #
    2023-01-13T03:08:23.484949  export SHELL=3D/bin/sh
    2023-01-13T03:08:23.485383  #
    2023-01-13T03:08:23.586815  / # export SHELL=3D/bin/sh. /lava-245959/en=
vironment
    2023-01-13T03:08:23.587254  =

    2023-01-13T03:08:23.688719  / # . /lava-245959/environment/lava-245959/=
bin/lava-test-runner /lava-245959/1
    2023-01-13T03:08:23.689591  =

    2023-01-13T03:08:23.694902  / # /lava-245959/bin/lava-test-runner /lava=
-245959/1
    2023-01-13T03:08:23.759800  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-13T03:08:23.760112  + cd /l<8>[   15.583709] <LAVA_SIGNAL_START=
RUN 1_bootrr 245959_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/63c=
0cb3654c615935f1d39dc
        new failure (last pass: v6.2-rc1-23-g93899a4cb7b1)

    2023-01-13T03:08:27.820291  /lava-245959/1/../bin/lava-test-case
    2023-01-13T03:08:27.820685  <8>[   19.809092] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-01-13T03:08:27.820936  /lava-245959/1/../bin/lava-test-case   =

 =



platform           | arch  | lab           | compiler | defconfig          =
        | regressions
-------------------+-------+---------------+----------+--------------------=
--------+------------
mt8173-elm-hana    | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chr=
omebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0cb0e82d1c27c881d39e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-28-g24ddc3b53a9d/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-28-g24ddc3b53a9d/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0cb0e82d1c27c881d3=
9e1
        new failure (last pass: v6.2-rc1-23-g93899a4cb7b1) =

 =20
