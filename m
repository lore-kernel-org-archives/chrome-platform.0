Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC87259A
	for <chrome-platform@lists.linux.dev>; Mon, 11 Sep 2023 05:55:40 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-68c576d35feso3899542b3a.2
        for <chrome-platform@lists.linux.dev>; Sun, 10 Sep 2023 22:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1694411740; x=1695016540; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qMTtPsPdRiqEj3AybTc8Sf+K2GmTb0qa5qsHWDr38Lc=;
        b=xZ7/QOt6VV2rD/Qb/uT9pvQGx02GmgHmeV7IVDiPRFs4U+Y9coRLaF6OhdEhcaPNqa
         X0wnAO7KLMHxzel9oNcFjWTlI3rGx5e/ULeBPx8ZugQgZFFUyzknJ3c0hJt3U20GIHDm
         3ykE1tRFch1WeyIaYSqMdUnjL4yNvqAyyafsqUNQkvA5gU9JuBcsgUcZpfaTOKTPa9G8
         OCDIY37UgTb1D5O4HSz6y764J1edfTtihBywNmYss1N13qsr9j/WuGtGnkWsdccyadG7
         oKLx0rjoHsntC0YOPil3Y1ZU5YirnwmylEhU460AUSeW2hoaDofznVT9CbuJ9wRVPJQQ
         qSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694411740; x=1695016540;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMTtPsPdRiqEj3AybTc8Sf+K2GmTb0qa5qsHWDr38Lc=;
        b=PyWOeFz8qzcI0FpTOdlgiXyCsXWfWxS0KSLX1hK4YKkIQMhk2E2fkPEf2WSAJrKzZ4
         A+RfZqHOt6spLrSbuIEW0WxS6Sg57vhSQJLaCb/VSzx44alEwd/x5So0WILrMsyNuDYo
         RSOdThIoU2is80Dv7wBzvejjRe0iTSpmahzz2ocZHmTE+ciMGA0r5M8WLKyVXbdjEchD
         byfoYhMq6OvmcD/IA4SJUsBsnl9tkDRRRxwgpJ5GJ9/bUJVRqmHPlDR4npJ/lqwvhj6Q
         FfMWwmilbuONRF0ix9RxLDc9QtxIvBNLYwOgRu/1RhURbAbPSN5Z0HUUoNYVp3cvrvK2
         f8Kw==
X-Gm-Message-State: AOJu0Yz14irKHGh1v2hU/eVfJcxcEtJVUHaPDLfQrIX7b8oxDc3h0+UY
	7KYI18ixfT9q6eP48jX0Gq25QA==
X-Google-Smtp-Source: AGHT+IHwI0BptHI1samq3IqEv9MKzAzRubDSfhbhNHOf3xZ6UhD0EIhbQtBYFEpHX0Svoi/3lLZMQg==
X-Received: by 2002:a05:6a21:6d98:b0:148:3c72:4878 with SMTP id wl24-20020a056a216d9800b001483c724878mr12104295pzb.50.1694411740305;
        Sun, 10 Sep 2023 22:55:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id h2-20020a170902748200b001b9d8688956sm5485022pll.144.2023.09.10.22.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 22:55:39 -0700 (PDT)
Message-ID: <64feabdb.170a0220.fc2c2.ce41@mx.google.com>
Date: Sun, 10 Sep 2023 22:55:39 -0700 (PDT)
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
X-Kernelci-Kernel: v6.6-rc1
Subject: chrome-platform/for-firmware-kernelci baseline: 76 runs,
 3 regressions (v6.6-rc1)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-firmware-kernelci baseline: 76 runs, 3 regressions (v6.=
6-rc1)

Regressions Summary
-------------------

platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
acer-R721T-grunt     | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...=
6-chromebook | 1          =

hp-11A-G6-EE-grunt   | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...=
6-chromebook | 1          =

hp-14-db0003na-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...=
6-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-firmwa=
re-kernelci/kernel/v6.6-rc1/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-firmware-kernelci
  Describe: v6.6-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      0bb80ecc33a8fb5a682236443c1e740d5c917d1d =



Test Regressions
---------------- =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
acer-R721T-grunt     | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...=
6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe9e67fc886b2b81286daf

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.6-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.6-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64fe9e68fc886b2b81286dc4
        new failure (last pass: v6.5-rc1-1-g0979e7e3cfd7)

    2023-09-11T04:57:59.675037  + <8>[   10.636979] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11491707_1.4.2.3.1>

    2023-09-11T04:57:59.675730  set +x

    2023-09-11T04:57:59.783535  / # #

    2023-09-11T04:57:59.885685  export SHELL=3D/bin/sh

    2023-09-11T04:57:59.886405  #

    2023-09-11T04:57:59.988034  / # export SHELL=3D/bin/sh. /lava-11491707/=
environment

    2023-09-11T04:57:59.988807  =


    2023-09-11T04:58:00.090518  / # . /lava-11491707/environment/lava-11491=
707/bin/lava-test-runner /lava-11491707/1

    2023-09-11T04:58:00.091619  =


    2023-09-11T04:58:00.096312  / # /lava-11491707/bin/lava-test-runner /la=
va-11491707/1
 =

    ... (12 line(s) more)  =

 =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
hp-11A-G6-EE-grunt   | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...=
6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe9e4d0b7163c595286d89

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.6-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.6-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64fe9e4d0b7163c595286d9e
        new failure (last pass: v6.5-rc1-1-g0979e7e3cfd7)

    2023-09-11T04:58:44.582478  + <8>[   10.698630] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11491690_1.4.2.3.1>

    2023-09-11T04:58:44.582589  set +x

    2023-09-11T04:58:44.687619  / # #

    2023-09-11T04:58:44.788319  export SHELL=3D/bin/sh

    2023-09-11T04:58:44.788532  #

    2023-09-11T04:58:44.889042  / # export SHELL=3D/bin/sh. /lava-11491690/=
environment

    2023-09-11T04:58:44.889235  =


    2023-09-11T04:58:44.989772  / # . /lava-11491690/environment/lava-11491=
690/bin/lava-test-runner /lava-11491690/1

    2023-09-11T04:58:44.990084  =


    2023-09-11T04:58:44.994892  / # /lava-11491690/bin/lava-test-runner /la=
va-11491690/1
 =

    ... (12 line(s) more)  =

 =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
hp-14-db0003na-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...=
6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe9e60fc886b2b81286d82

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.6-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.6-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64fe9e60fc886b2b81286d97
        new failure (last pass: v6.5-rc1-1-g0979e7e3cfd7)

    2023-09-11T04:57:53.431520  + <8>[   10.403175] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11491725_1.4.2.3.1>

    2023-09-11T04:57:53.431602  set +x

    2023-09-11T04:57:53.535995  / # #

    2023-09-11T04:57:53.636629  export SHELL=3D/bin/sh

    2023-09-11T04:57:53.636800  #

    2023-09-11T04:57:53.737332  / # export SHELL=3D/bin/sh. /lava-11491725/=
environment

    2023-09-11T04:57:53.737507  =


    2023-09-11T04:57:53.838156  / # . /lava-11491725/environment/lava-11491=
725/bin/lava-test-runner /lava-11491725/1

    2023-09-11T04:57:53.838416  =


    2023-09-11T04:57:53.843171  / # /lava-11491725/bin/lava-test-runner /la=
va-11491725/1
 =

    ... (12 line(s) more)  =

 =20
