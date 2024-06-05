Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8684E1922C6
	for <chrome-platform@lists.linux.dev>; Wed,  5 Jun 2024 07:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717572357; cv=none; b=hou4tpt3vRb4m/ZrViVw/EPdb2X4w5VtgLrzwEXDdxpkNKQ0GiFe4+pjHypeGpaqC3Cdayouaf/1dUNFuTcSEAHUrQT9Tc5UbNv9somlFoKRLrPlYANvWeViB3L+8Cv0r62toTq7M6Od5ZcnRoZLWdwKNfFqdyg1QC3WuPpS4+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717572357; c=relaxed/simple;
	bh=dNcN6t6ynrSGPOVV9396dsDqtu6PnTCznugp2/0Szco=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=OYWIs9IyMJTQXT93hj1eDAyK7SsLmiIGKHPHOk0/Hwx8AyO9rfWHAZAMVJ+Y0t28Y2o2uOrLE8Vi3pI4oFpooe2LBFlDI/W/4oEwI0WrlYqdWeMWTc82oamPQrQX5euhuHJzcEfzpSxJ7c7reUttfODpHHN/FW9CCycXQ6mbo3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=PQrunlgE; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="PQrunlgE"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7023b6d810bso1588780b3a.3
        for <chrome-platform@lists.linux.dev>; Wed, 05 Jun 2024 00:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717572355; x=1718177155; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gheTI5IszdaZ9sc6ghxcCKF5zD6QtXgfAo0+wQo5apQ=;
        b=PQrunlgE15Gd/PTRz9tFq0ACDrGwR4wnuF03jlKxF4wmrsoKipkdQFzKdWZSHHDJM8
         oi6Rw8u8QszzLxVQOZdUKr0v5H2aBGsjELxAQ/6Tvl0KlQsZHq7NB4SDVKciypsEpb3N
         /vjUpTNsNqPqpafbJ1JrABmJF6DMrIdjZE6nd+47oQOsy2QVKIoxqWVe8KSilQkJ1CWl
         fqpjaC9t3uWybJN5oPT7ciQ4yp8I3SCg4HboAULOlj64X7ldOiXql7E44qd3qPBANjgm
         q4MsQBGRw3/HRTsQrabZbgfFqtwaNeFjGD7NyV4auW5ksYRj5+5T5mrf5Q1X7khn2rIl
         xX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717572355; x=1718177155;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gheTI5IszdaZ9sc6ghxcCKF5zD6QtXgfAo0+wQo5apQ=;
        b=ipYKkzgz6RnDmBQpC5AvF2/VVaABVOfRpvtjJhvG6bkgmRKbRjmxzVjU6+Nj1xBI/j
         kT7PG3sOgmgtkPzzoC8e5r5WbI9hOoIslz4VCpijKz//tExv12M5grO/8lN+wJLq5eAq
         SWM2wW8M/p8dxBMXg1aLA68HBeHcBp2nLfyWW6aM4NNFBKutGdm1fuumm/CqIaqVe7pt
         gjaWc4OXMSJ5QMbyxa8ce73VGTxRNMeKBRC1TrVw6UtzuxizI0IlZjaZi3CVCr0QfLEu
         x8O2uXuway2Hd/5vxlTSmd1BngRjrBejvQW2IKx68rR+fJJW5R2pGMqV34HGv7qeiW84
         dXDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO5elk3WN10cP+DpX7BMpa0JcGr9yQCOVTic0Qg6GCPAnNCjmB3SUXEIvGVJWd/ybd8WBURbh/Nxrz9YUS+jYtuKhYXgrHFilS1cHcwbxc
X-Gm-Message-State: AOJu0Ywo81/vMozLICbQ9w8rkf8fr1LS/lpkxWKn+kXwLEpbOGYMywde
	iFsOdq/7GJ35KxamCGYA364VEKevw/4v9RKzlYzDxJnhHVmOchrPhYRth2mq+zxZX5GUMNqrryU
	N
X-Google-Smtp-Source: AGHT+IGiWYgYzgQIG8PSaGCXtaJ/r48CdQH01ufNHG4/Hx7pRG5fLypWM1OcvTzUJ2vVtfQMniWd2w==
X-Received: by 2002:a05:6a21:1f0f:b0:1b2:93bc:b7c6 with SMTP id adf61e73a8af0-1b2b71225a4mr1729708637.43.1717572354700;
        Wed, 05 Jun 2024 00:25:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702425e2c23sm8091796b3a.85.2024.06.05.00.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 00:25:54 -0700 (PDT)
Message-ID: <66601302.050a0220.99e33.5ab5@mx.google.com>
Date: Wed, 05 Jun 2024 00:25:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-8-g106d673982336
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci baseline: 92 runs,
 4 regressions (v6.10-rc1-8-g106d673982336)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 92 runs, 4 regressions (v6.10-rc1-8-=
g106d673982336)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =

imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =

sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-8-g106d673982336/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-8-g106d673982336
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      106d6739823369c734a8fc3b13634274eee4f60e =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/66600a2df57d212d507e71f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-8-g106d673982336/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8m=
p-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-8-g106d673982336/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8m=
p-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66600a2df57d212d507e7=
1f1
        failing since 7 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first =
fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/666008c65a4ef103e27e7095

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-8-g106d673982336/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8m=
p-verdin-nonwifi-dahlia.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-8-g106d673982336/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8m=
p-verdin-nonwifi-dahlia.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/666008c65a4ef103e27e7=
096
        failing since 7 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first =
fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6660097428814b35827e7073

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-8-g106d673982336/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-8-g106d673982336/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6660097428814b35827e7=
074
        failing since 7 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first =
fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6660096f28814b35827e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-8-g106d673982336/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-8-g106d673982336/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6660096f28814b35827e7=
06e
        failing since 7 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first =
fail: v6.10-rc1-4-g7b44d5381e541) =

 =20
