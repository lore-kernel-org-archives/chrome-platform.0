Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F220962D
	for <chrome-platform@lists.linux.dev>; Mon, 29 May 2023 03:04:13 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1b034ca1195so6295475ad.2
        for <chrome-platform@lists.linux.dev>; Sun, 28 May 2023 20:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685329453; x=1687921453;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OMgeY3eCfz++A8dnqzgRfu8p/vACgRXVa46rwxk1G4w=;
        b=3T8jorXG501cWDcK/Rn5mneSU7OjMVM+lqTkRo10IxUWWSStqKKzBrrtjiCtzdCW+d
         VBswu9IxGaveMM9RXEHgppzwriZEFePrkjVp6Aps/FfPvj4pivk4jQZ5yNo+p9wSWs5o
         SZBQEiSRhmDrJLZ21DcUZSPc6WGxJ9HmDvbkXe5xcfAMSGZdqiXSpplvbjDm/1DTzTzI
         C72mtFiNSDqB0bzNKjuwJ8i0cBgXquRWf8ereBtUDX31EOpUrtKPGIu5AvP93j6R6dwd
         9H7gybWxvd+HRgX8FXnxeYrXJBnyInM/H9OrxjFYfgzVjvL8rT46FHtYsXKTpVTpvT8m
         dvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685329453; x=1687921453;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OMgeY3eCfz++A8dnqzgRfu8p/vACgRXVa46rwxk1G4w=;
        b=JhDk1oCfbvjlj7cxjz5LTkysFGfkSS8/fI4hzqDQZtis2FINU0e3yywAI/iCVFVQXb
         6pBxifxhZ7VJ+FuVV5e+ikJ/RY6TiyHmlhLPbSLARo2piXK0sL9+QGrt1bNqmpgmVQPv
         EAXDl2ew4V1hybcyZXEWU+NIlARsqASAhp6T45rKPSDEiD6JDUQHYP7u5C6GrBS5aZrq
         3+L5eyciw/DR+Znfghmh0WADL6HKG/GRi+fFxrpD2gxMk8WDQfQ/iofeFbCymEPJF4mG
         yuz+0xppbhaMw6FQOTh63scDFLH0t9pJX9l9mpOa9fqesjvpLtg61gRrYU47OHdTBd9c
         IVrw==
X-Gm-Message-State: AC+VfDzZeEahyksWin4WhuBid+voYcWumVlOvNVFnvElga6IsYL9vPEc
	ODOSA/OpqsDHvSTlpNy8ou+dbQ==
X-Google-Smtp-Source: ACHHUZ5jCGNbEEyu0dn09YVxeIdLqlUcXxGDJxaRV6ZW+HlQCGl7sbfxcqWi6xjA81rTwc8ePG1baQ==
X-Received: by 2002:a17:902:e890:b0:1a6:c595:d7c3 with SMTP id w16-20020a170902e89000b001a6c595d7c3mr11313153plg.22.1685329453386;
        Sun, 28 May 2023 20:04:13 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a22-20020a170902b59600b001ae2b94701fsm6907661pls.21.2023.05.28.20.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 20:04:12 -0700 (PDT)
Message-ID: <6474162c.170a0220.bb3f9.d5a4@mx.google.com>
Date: Sun, 28 May 2023 20:04:12 -0700 (PDT)
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
X-Kernelci-Kernel: v6.4-rc1-4-gf5bb4e381290
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci sleep: 8 runs,
 2 regressions (v6.4-rc1-4-gf5bb4e381290)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 8 runs, 2 regressions (v6.4-rc1-4-gf5bb=
4e381290)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.4-rc1-4-gf5bb4e381290/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.4-rc1-4-gf5bb4e381290
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      f5bb4e381290883a014a9e865ee2c430447ef953 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64740c9ac4dfef53f12e85f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/sleep-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/sleep-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230519.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/64740c9ac4dfef53f12e85f3
        failing since 20 days (last pass: tag-chrome-platform-for-v6.4, fir=
st fail: v6.4-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64740b06027fc677cf2e85fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/sleep-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/sleep-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230519.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/64740b06027fc677cf2e85fe
        failing since 20 days (last pass: tag-chrome-platform-for-v6.4, fir=
st fail: v6.4-rc1) =

 =20
