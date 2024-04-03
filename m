Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E4437145
	for <chrome-platform@lists.linux.dev>; Wed,  3 Apr 2024 06:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712126773; cv=none; b=gI2fhsZogic05EGyR+PLBSLPIiC06JJJxTGuwLoZSK6KeeChxky71FcQskD2nXJzeIQPMCefeALmvJxax2z80wGeC+4HKLU083LhNw3uW9TFBlqSaHMV72ua7pPMbZrTBGQiHBW7jtjIr2wvddvRttEw2U7dTJ0tGrLm/hzhAWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712126773; c=relaxed/simple;
	bh=CaehQLm+TjbQGw1FRajL+pVFBF6Q1RmAYejw/ZBmFpI=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=nIE9XKCxe5cJcaqeRBfchw8MEvE9AaVL3Gh5XLX6qjlDitg+pzuiaRxd7TSiAxhbBgyiGyGAcU3XY+zm2wxZikbIr2RD34NwP+Uqsma2eHABX36mXB4RSwt0czaPqcH11OVfHEODG/4cq58n2fHtQDI52xQ4c1nnQJCbFgkzl4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=WQI+O4gf; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="WQI+O4gf"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6ea9a605ca7so488092b3a.0
        for <chrome-platform@lists.linux.dev>; Tue, 02 Apr 2024 23:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712126771; x=1712731571; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i79oDpnUzuc7JetlV5sLmXe0MIqhGTnlGACYV3HjX68=;
        b=WQI+O4gfFvTMPwDY1B2bXyBGB3w96g0tmb9reysOW+KVSX2zFSNzRsd8cNNu6N/osa
         BkdejEcIiEjd0Rn4BnVbRbCC8FUsVskrBvL6AEQigNNA2vqeNTGrlyquqn/6If8XAI55
         oLFZVkG3t6dWo68eiciLWDM6IxVKGZa3XDUnRtINbPcOVJSocUkl0t4GjhPOHhQvxt5D
         7/AflNTJIjwLDds69ENe9s5wp9b3Wt5spv/DvkHjvYBlnHvv4bDQQboS4iq7ksPCwZgm
         wg5J/SDf7JzXxWX2CkI0IAHpGddKZGf7zkSIo3xRu5KgZtJoV/Xj16fF9uIRx2gcijoT
         0D2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712126771; x=1712731571;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i79oDpnUzuc7JetlV5sLmXe0MIqhGTnlGACYV3HjX68=;
        b=B6URp0OlZcaZsf3ZURVfJ3pBahYh6felZtHufZ3aqRNpLNR6ZWXj1gqogUNq+YxGEI
         CYuThqD+04B7/cyEZR6ktN15+S8M32rd+QMQSkSiuERvNu3BYT/Y1fNUKv9hnsB6iwDs
         ByulQ49x3CA9+youbKgxGtSgRGYg5FVND4L4bWOndeeq20HJ/SUmXuGIwM/CwmtXuTD1
         oYGZy+xOzI61GrQkDvPjZ9hbh8Nfb9CT2PtNXIysjIvlgnGy6wHGge5vjt7YoOg2NAVI
         g80vSoV9+YbXw4uEnpgl2bC4OXTk7NPt2wUglbSrQYVkGJRSwCz8tSmvgciKnXRROdre
         PzBA==
X-Forwarded-Encrypted: i=1; AJvYcCUIzglO5NG+L/++HzxCkxTvlkOLaeC+hcUDyABGr9mQlwwEWr2WzLzX3lrVqwKgNorw3yHnYBXb3JhYjIs3tOkUAjZBLtkt+iskTXrTsy8L
X-Gm-Message-State: AOJu0YwKe3vnHvFM0ZWZ90iMsIwaR6Y553fw5TyoHF87jli5bhI39dSH
	kg28hmW1w5FV5EBvDzOKfZvrFCtdYLkjZ2OKNDrg/gOEzZN6hOChKMcJvZ30A9g=
X-Google-Smtp-Source: AGHT+IHLWmVHy3stoqNp0lMtDqMZWUl9wU82SEtjw7neZzk7LOK5eTxhP5MyQY/oIannosjUeIywEQ==
X-Received: by 2002:a05:6a00:1251:b0:6ea:c767:4699 with SMTP id u17-20020a056a00125100b006eac7674699mr2457743pfi.13.1712126770146;
        Tue, 02 Apr 2024 23:46:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id x8-20020aa79188000000b006e795082439sm10968341pfa.25.2024.04.02.23.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 23:46:09 -0700 (PDT)
Message-ID: <660cfb31.a70a0220.cd9ca.dcc2@mx.google.com>
Date: Tue, 02 Apr 2024 23:46:09 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc1-14-gd8db2c6d7b0e5
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 92 runs,
 4 regressions (v6.9-rc1-14-gd8db2c6d7b0e5)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 92 runs, 4 regressions (v6.9-rc1-14-=
gd8db2c6d7b0e5)

Regressions Summary
-------------------

platform                 | arch   | lab             | compiler | defconfig =
                 | regressions
-------------------------+--------+-----------------+----------+-----------=
-----------------+------------
acer-R721T-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config+x86-board | 1          =

hp-11A-G6-EE-grunt       | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config+x86-board | 1          =

hp-14-db0003na-grunt     | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config+x86-board | 1          =

imx8mm-innocomm-wb15-evk | arm64  | lab-pengutronix | gcc-10   | defconfig =
                 | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.9-rc1-14-gd8db2c6d7b0e5/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.9-rc1-14-gd8db2c6d7b0e5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      d8db2c6d7b0e5ca5e64c747236b2464d0c1661f3 =



Test Regressions
---------------- =



platform                 | arch   | lab             | compiler | defconfig =
                 | regressions
-------------------------+--------+-----------------+----------+-----------=
-----------------+------------
acer-R721T-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/660cf0cb8943c05fb44c4362

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-14-gd8db2c6d7b0e5/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/baseline-acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-14-gd8db2c6d7b0e5/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/baseline-acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660cf0cb8943c05fb44c4=
363
        failing since 9 days (last pass: v6.7-rc1-4-g57eb6dcd32cf6, first f=
ail: v6.9-rc1) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                 | regressions
-------------------------+--------+-----------------+----------+-----------=
-----------------+------------
hp-11A-G6-EE-grunt       | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/660cf0bd8943c05fb44c4359

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-14-gd8db2c6d7b0e5/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-14-gd8db2c6d7b0e5/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660cf0bd8943c05fb44c4=
35a
        failing since 9 days (last pass: v6.7-rc1-4-g57eb6dcd32cf6, first f=
ail: v6.9-rc1) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                 | regressions
-------------------------+--------+-----------------+----------+-----------=
-----------------+------------
hp-14-db0003na-grunt     | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/660cf0bf8943c05fb44c435f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-14-gd8db2c6d7b0e5/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/baseline-hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-14-gd8db2c6d7b0e5/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/baseline-hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660cf0bf8943c05fb44c4=
360
        failing since 9 days (last pass: v6.7-rc1-4-g57eb6dcd32cf6, first f=
ail: v6.9-rc1) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                 | regressions
-------------------------+--------+-----------------+----------+-----------=
-----------------+------------
imx8mm-innocomm-wb15-evk | arm64  | lab-pengutronix | gcc-10   | defconfig =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/660cf006663523314e4c4421

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-14-gd8db2c6d7b0e5/arm64/defconfig/gcc-10/lab-pengutronix/baseline-i=
mx8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-14-gd8db2c6d7b0e5/arm64/defconfig/gcc-10/lab-pengutronix/baseline-i=
mx8mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660cf006663523314e4c4=
422
        new failure (last pass: v6.9-rc1) =

 =20
