Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B4A374F5
	for <chrome-platform@lists.linux.dev>; Mon,  3 Jun 2024 06:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717396713; cv=none; b=L2e4q1XoxI57tf37J1Z9/Pzg2dPWBQoIwatTCz0BQvM+sUGvOO8OjhNKmxL8bAlt3LBoRId6MLgraRoPXdMKrs7HjS91DObAak9tULl/nEEbSUP3Ii07Lgt5Sfi+fdZkqNaMmZYmlzxtNm3aWjdyWH5TRFFaButyYU1pFPvxK0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717396713; c=relaxed/simple;
	bh=iCNGs64dEGHA6uMx/1B+Me3UkUkH2TxGrn+r3OKFQGc=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=PEfo0PB0rgoaujgv1VsNCvzXTltSfL54CwW7hH2OfoxZtXrOwuCP/f7hc8bMTpSwn4C6QU+qMLc/LLJjg2OzX4CcFidwAc3F4kZPzDWBDBrhjIT3f9lBBFyL4/G2Ej3bh1dpttM1wxGqAJJ25BySRxxR27CcERBP4z0w+uEn9FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=C6pwRRj7; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="C6pwRRj7"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f62217f806so33450135ad.2
        for <chrome-platform@lists.linux.dev>; Sun, 02 Jun 2024 23:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717396711; x=1718001511; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=go8vso3c2kMY+D4l1GMm652VxSzw+Z8/q90joO+GDJM=;
        b=C6pwRRj7rCn82JjQPj21y4ShMbwtbX9jLJ0ivfRY2nF/+e/rt1sZbI5nCz/9F0jjnA
         EingvojI1VJCAqbmpcxMFa0P+9xnZxx9KfQwMKkzcLzwsaNigzsvxsdQRPQ8ZCCB4Bd5
         yzb0Oie+8rYnPqB0Z9akXFnD7gvh8d1yAoeYiQo3bDwD4HgiVi0cfaX8+Maj8BdHfbn7
         Xw9u9nlHzTsBq/SXRgEMVE1SRB1INHjbALgYPU4Rb4CCidPEwtGlGAU2AuX1Z1udGmzN
         0K3mH/0xhY6VXRXS1Y7352/eGOwhAQiBoMaSRK7DTXKD2ehpmEZyxbJleC/vL93lCrT5
         PYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717396711; x=1718001511;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=go8vso3c2kMY+D4l1GMm652VxSzw+Z8/q90joO+GDJM=;
        b=Y9iaZvAao7ISK+MpvCXrfVJ0xIMgC9JIxiT8/Mp02ZK+khX9Qzz6Vv6bOad/a2+HMo
         6l2g8YGNbAp5SWRPI2xYeWjNnVRobtaWMvG/tYx4jEKrHfSjFdgEYLwmy2+NTWMRQSEp
         YitTe1BsVytB3TeKctVVPJ9+UEKVQ4vhygY1z9n9TmzhsITCSoGrXWwOZut3iDFwWY2w
         zCksH8K4ioDWc5npF1C+wKDUlHid9uQn0Qv5fGMcQ0E5M5sydI4oPR4j4GMwnv/5zDLv
         /mcM9jqNonZZEMVy01Nw0uXx/OMN5Vu9rybFHQ8rrGUtVJLRnYNwfgakJN3iijcdyKG0
         fIZA==
X-Forwarded-Encrypted: i=1; AJvYcCVkTyin8oo0q0uviSKz86KSy7HB01h5UaqeQKBhUZTJbEx1ZX5um5R0nOiLEgIpAGQqQPRHZdcb3RoINqbe0mEYXhK5Vga1xqm0AIZrZoC9
X-Gm-Message-State: AOJu0YyJ05jwkLp6al+jbsLdr9NT38tNYeW4cXrDs0v4LM/2LYfulv+4
	LeqiGNOD/ULNDqKBFtFO/X+w33JGj0y4L51amNBY1t2xSnE8BXwqOQUpZTukEouUiYb9jQ5Xkf+
	L
X-Google-Smtp-Source: AGHT+IHfohTQdLWQ3qB4WbsW7Kka4qHExQJcjkY3TQlhZNkFeKOep4WuSwSDexPcq5ZjN7xTI6cH6g==
X-Received: by 2002:a17:90a:dd83:b0:2bf:5f75:9c2b with SMTP id 98e67ed59e1d1-2c1dc5c0e5dmr7635419a91.32.1717396711276;
        Sun, 02 Jun 2024 23:38:31 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1c2845041sm5397854a91.56.2024.06.02.23.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 23:38:30 -0700 (PDT)
Message-ID: <665d64e6.170a0220.fae30.d36a@mx.google.com>
Date: Sun, 02 Jun 2024 23:38:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-6-gbc3e45258096f
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci cros-ec: 11 runs,
 5 regressions (v6.10-rc1-6-gbc3e45258096f)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 11 runs, 5 regressions (v6.10-rc1-6-g=
bc3e45258096f)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-6-gbc3e45258096f/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-6-gbc3e45258096f
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      bc3e45258096f2ea2116302abefde4b1cb9bc3c1

  Test suite revisions:
    cros-ec-tests
      URL:  https://github.com/kernelci/cros-ec-tests.git
      SHA:  fad9423ae3c64bfd48c207de34a1177000d45fa8 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/665d58698edf55dc857e708a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-gbc3e45258096f/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/cros-ec-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-gbc3e45258096f/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/cros-ec-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/amd64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/665d58698edf55dc857e70=
8b
        new failure (last pass: v6.10-rc1-6-ge8665a1723789) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/665d50908c11b050a37e7081

  Results:     2 PASS, 1 FAIL, 13 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-gbc3e45258096f/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-gbc3e45258096f/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_chardev: https://kernelci.org/test/case/id/665d509=
08c11b050a37e7090
        new failure (last pass: v6.10-rc1-6-ge8665a1723789)

    2024-06-03T05:12:28.607140  test_cros_ec_chardev (cros.tests.cros_ec_mc=
u.TestCrosECMCU.test_cros_ec_chardev)

    2024-06-03T05:12:28.607256  Checks the main Embedded controller charact=
er device. ... FAIL

    2024-06-03T05:12:28.607368  =

   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/665d558d8273b2f4007e7093

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-gbc3e45258096f/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-gbc3e45258096f/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/665d558d8273b2f4007e70=
94
        new failure (last pass: v6.10-rc1-6-ge8665a1723789) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/665d5125c68f0adf8f7e7084

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-gbc3e45258096f/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-gbc3e45258096f/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/665d5125c68f0adf8f7e70=
85
        failing since 4 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first =
fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/665d569d72f0037bec7e706f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-gbc3e45258096f/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-gbc3e45258096f/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/665d569d72f0037bec7e70=
70
        failing since 4 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first =
fail: v6.10-rc1-4-g7b44d5381e541) =

 =20
