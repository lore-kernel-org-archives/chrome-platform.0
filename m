Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC19130487
	for <chrome-platform@lists.linux.dev>; Thu, 13 Jun 2024 19:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718305988; cv=none; b=fcKXyfVvCaTftw7GfKtYh4J8z/oQyNw3NGfmYpjaFFvtguwJVx63vm/BmTefAwdI4v+RzAqCem4M7bBVmH44RqU/o8eRJgqm/heySevm72RrL8TTibj2X5S3DwElmx8YNK9JXV5SLGiAPMgoXFIGk1KMf0vVFvhumAL8FXisYog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718305988; c=relaxed/simple;
	bh=OJN4Jpx/zC87ccRUBML/0uYDE0jPdZtFXRtJzqY6R94=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=b6xj/OAvFrVYJPGosrh/VlfYDAyVbPIhAwPSvSodf+VgvrzA9Gt7ttptzlC+QvaZkAkXVKWIj/oxLMzswTGlRUg1HudXzm5ov/ks8m20I7JzEwG/DbzYJBpCnwOsZrR1c6A2UT5MT8UtWu7dQeJVE5aoZ7L11ImZJdgWFRFwYrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=oSct6Rho; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="oSct6Rho"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5bae81effd1so699459eaf.2
        for <chrome-platform@lists.linux.dev>; Thu, 13 Jun 2024 12:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718305986; x=1718910786; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t3azjgq4iOK2PvuTFIW+itT3QHDKZz7Qm8evwygtrJ8=;
        b=oSct6Rho9fW+F1ZenB9tuNev6N8obKkfDs0XmrvQNoCPK3r1OP3I5v26phK51XVdja
         C5zS0Tp/VobKujhmZcWwvC9iiLrPtMYtwPYbVVgzKPwmD145nURpp5afx8So4VVLHkbB
         b/FjCQaTaaQ3UnhXIIIQ0vGufpErB44ZOcjuuT2WH3X6FSl4chBYhNhAZDQsxUlcU2b2
         OXdybASuEht6v7rVxJfanPEnnZi3yCIez6knO2toI9DPuH+rFAF7FDMLnEky7o/wh4gA
         6tSyrBEaYtUEX211C0zRyimj2EQHd92xzQlxL09dt8gfRbey6XT09juAj6kpQCMeCJkv
         ++9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718305986; x=1718910786;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3azjgq4iOK2PvuTFIW+itT3QHDKZz7Qm8evwygtrJ8=;
        b=vEHutVIZ9gOn43cVtNKFpDCxOpWGwD6n/TvX+o6bQYDncsH8pF06gt53t3nGBYPzFp
         QMEvE9zE9UVbV+JHKE5M8pRoxCLk+ERcb1mkXCAliht2vwdWZeOFUDrM/yKdwnPuk0KU
         Glk3n0OR/BoPIq1xbWFEPNbgJLurY96weVb8m+t9rRHDI+cqUIV5t7avsP0K9/TJyH5y
         ZC2bjsih4vdKI2teLcdrz3N5lQfdG5hiJxOXODAri8YEGgN/UDKicAmTjLmiV8h6edrF
         msjFZBtMcIwA/1ZFQb8TdWMqZbGzIm9ch5x4Oc2uBlH5zq05t9eeoV83vA5P22N0kGRq
         nBiA==
X-Forwarded-Encrypted: i=1; AJvYcCUtNspXhYkEcOEERSLpLOe/sQz8Ob6l1gHNI5fELi9j4IDn777sBjZI5ToJKs4ZeOQAjiNMH4PIVDLI9+qsu+KDRnMSdHCwon9QVS3/S7hY
X-Gm-Message-State: AOJu0YwPTWVSq4pc4dl6WQKYT7fSePoOTyVuSkuSi9fU7v3ucAERTq5K
	3qcrF5oZ7I/W0IvKR9o+92S9he0ga+YUJ8HN3H4A1teOSv4jaMPkTTdZE/4urBM=
X-Google-Smtp-Source: AGHT+IGpc/p44PMO3n7mSJw5ZoNY/LHh8SP0I/CAMW36CtMAidudvXDmK4fZH5CyrIAC8dTFGwT48w==
X-Received: by 2002:a05:6358:2829:b0:19f:424f:d075 with SMTP id e5c5f4694b2df-19fabc74c35mr80583955d.17.1718305985322;
        Thu, 13 Jun 2024 12:13:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6fee2c4083asm1412700a12.65.2024.06.13.12.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 12:13:04 -0700 (PDT)
Message-ID: <666b44c0.630a0220.f6760.41b2@mx.google.com>
Date: Thu, 13 Jun 2024 12:13:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-19-g77a714325d09e
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci cros-ec: 11 runs,
 3 regressions (v6.10-rc1-19-g77a714325d09e)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 11 runs, 3 regressions (v6.10-rc1-19-=
g77a714325d09e)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-19-g77a714325d09e/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-19-g77a714325d09e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      77a714325d09e1527d865dc011ef91c4972ffedd

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
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/666b393c1523e570667e7076

  Results:     2 PASS, 1 FAIL, 13 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-19-g77a714325d09e/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-col=
labora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-19-g77a714325d09e/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-col=
labora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_chardev: https://kernelci.org/test/case/id/666b393=
c1523e570667e707c
        failing since 10 days (last pass: v6.10-rc1-6-ge8665a1723789, first=
 fail: v6.10-rc1-6-gbc3e45258096f)

    2024-06-13T18:28:33.919658  test_cros_ec_chardev (cros.tests.cros_ec_mc=
u.TestCrosECMCU.test_cros_ec_chardev)

    2024-06-13T18:28:33.926475  Checks the main Embedded controller charact=
er device. ... FAIL

    2024-06-13T18:28:33.926583  =

   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/666b3147e5db657b357e70a3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-19-g77a714325d09e/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/cros-ec-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-19-g77a714325d09e/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/cros-ec-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/666b3147e5db657b357e70=
a4
        failing since 15 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first=
 fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/666b3d6da42ee511537e707b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-19-g77a714325d09e/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/cros-ec-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-19-g77a714325d09e/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/cros-ec-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/666b3d6da42ee511537e70=
7c
        failing since 15 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first=
 fail: v6.10-rc1-4-g7b44d5381e541) =

 =20
