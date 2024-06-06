Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AF6446A2
	for <chrome-platform@lists.linux.dev>; Thu,  6 Jun 2024 06:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717656450; cv=none; b=Bv422+L3fvOa8nbpCXmRRNeREgVMGM+W2X5m4+UkntFG2jE45zWXQYX4XX7GsH9B4h3/FspBo6QZ5ZFsRTgyZ1I68Zc6t9CVUJEvV4Uvi1gc7HVpGWDWsef6hNuY9SD9WjQ1hXAD30M0h/zfZGVsk6H4gkbp7ndnJLOzo1GStOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717656450; c=relaxed/simple;
	bh=3F4aAmaxp2m1dHXWgXMxKoekzeAZXecmyQhngcCm5Io=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Ze5fqDotSR/l15thfZ0nY6efNQ7an2s/SB89LNllwqqS2mhNLjCnpPVeo8k5dJ8zzeuVg1TvKOqviiFHawa4P3utxRxgBJl6zqvBfmA5uTOLazVvoVi/HrkP5tH2LVZ1Pdc01rfZD7Uey2RGOPYDz5hrUZhmsS03+nVqaZ57ISM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=djuBbWw2; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="djuBbWw2"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f62a628b4cso5937895ad.1
        for <chrome-platform@lists.linux.dev>; Wed, 05 Jun 2024 23:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717656447; x=1718261247; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sNeHwc1O6p+9b3pbCNgTMfGY+Kgl5F9BLvaWLlW7sQM=;
        b=djuBbWw2be5PHnfzST0LcU6L99x943SWBN9saqsJGidV2LEzoxAUH6B73W7HNjspqD
         sQTRK6aoMC/M3EYx1rMX/hu1OdwwZSBi0fH+KJB4EgCb8mNYTGkcu7P7rBVcCwihLqGr
         IlWzX3A+YasLFzA0QqgEXmw9dX9USWYX7pIwyiFKVjxRbAsZSTTijizy1QiPLeLm4tbv
         Rh1gnxMxF6UhABUkQbVVvH8nReVKAr7t6Jsdc6vep4V44BLl6hXhouxNJZ6gOv38Iymr
         P5dwT+ZeQcudL8M/eFRCXZCBAb41qeArGT9xoKCyrZ06rdjKmS3ocCUkWYhABKwyewWh
         mayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717656447; x=1718261247;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNeHwc1O6p+9b3pbCNgTMfGY+Kgl5F9BLvaWLlW7sQM=;
        b=PuYJ333D6eBfYMCnZQ9O4n7Yvw1QMVCyM2MI8UG8wiHFEwwz55MqkVI6qovyt3yfMh
         zurL6AwQ0bW09YhjFSxBSR4UyXtodItWm238DeUdGBnKc+BaIninVrC8Komc5+3YJsve
         tZE1Hs4KxPl0z1raZ8ltj3mgfFK5D+jysLg5vuxnoyOcIHRlsKhZGqH1NlbmuiTE4zfj
         gdOIiM4Tpa5VQaH2BOv83sQV5NYR8w9XQloQdA4hGwgFOAFRYMHT/e5P60Szwyazfz6a
         uAkw7XodQpQakzjbO2oKxp0rqe9y+b6xYYRfBpNjHadf/CURAgfb1IuugeEp+yILQh69
         JCWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQoWEptBvzq/GBZj/DjTazBOX41AhS6LEfYJ4gApjxc8eUm55rQkJbv/JWJXnmA4RbvP78UN6JSXyzYYu7lV6M4I9RydijwS3QylAeUdhj
X-Gm-Message-State: AOJu0Yy8fMrx6/RAqkOsc01cbqhjvhO8KZ0lE4MdhJ7iShuPgAYIkMhR
	pXoDSTYg37V2MMTgpvwK6TWZUb69SQ+mr+RTc1JODe9xhGnwf0nGeum4T9CxJy8=
X-Google-Smtp-Source: AGHT+IGVmZolOeuOrzLdtAoiUXIoaHzsen8Pk1bj3yhF0nRsriJ6eh1c8rJ/VkUWHNyWrGd+2ws0aQ==
X-Received: by 2002:a17:903:3212:b0:1f6:7f8f:65b5 with SMTP id d9443c01a7336-1f6a5a73208mr42768105ad.56.1717656447553;
        Wed, 05 Jun 2024 23:47:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd7edf88sm6622645ad.253.2024.06.05.23.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 23:47:27 -0700 (PDT)
Message-ID: <66615b7f.170a0220.e1bd2.1a7e@mx.google.com>
Date: Wed, 05 Jun 2024 23:47:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-13-g04ca0a51f1e6
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci baseline: 90 runs,
 5 regressions (v6.10-rc1-13-g04ca0a51f1e6)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 90 runs, 5 regressions (v6.10-rc1-13=
-g04ca0a51f1e6)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                  | regressions
-----------------------------+-------+-----------------+----------+--------=
--------------------+------------
imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig                  | 1          =

imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie     | gcc-10   | defconf=
ig                  | 1          =

mt8195-cherry-tomato-r2      | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook | 1          =

sc7180-trogdor-kingoftown    | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook | 1          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-13-g04ca0a51f1e6/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-13-g04ca0a51f1e6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      04ca0a51f1e63bd553fd4af8e9af0fe094fa4f0a =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                  | regressions
-----------------------------+-------+-----------------+----------+--------=
--------------------+------------
imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig                  | 1          =


  Details:     https://kernelci.org/test/plan/id/66614dd4f1b213b9b37e7085

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-13-g04ca0a51f1e6/arm64/defconfig/gcc-10/lab-pengutronix/baseline-i=
mx8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-13-g04ca0a51f1e6/arm64/defconfig/gcc-10/lab-pengutronix/baseline-i=
mx8mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66614dd4f1b213b9b37e7=
086
        new failure (last pass: v6.10-rc1-8-g106d673982336) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                  | regressions
-----------------------------+-------+-----------------+----------+--------=
--------------------+------------
imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie     | gcc-10   | defconf=
ig                  | 1          =


  Details:     https://kernelci.org/test/plan/id/66614e3af982e7b4657e7073

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-13-g04ca0a51f1e6/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8m=
p-verdin-nonwifi-dahlia.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-13-g04ca0a51f1e6/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8m=
p-verdin-nonwifi-dahlia.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66614e3af982e7b4657e7=
074
        failing since 7 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first =
fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                  | regressions
-----------------------------+-------+-----------------+----------+--------=
--------------------+------------
mt8195-cherry-tomato-r2      | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/66614e49f982e7b4657e7083

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-13-g04ca0a51f1e6/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-mt8195-cherry-tomato-r2.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-13-g04ca0a51f1e6/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-mt8195-cherry-tomato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66614e49f982e7b4657e7=
084
        new failure (last pass: v6.10-rc1-8-g106d673982336) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                  | regressions
-----------------------------+-------+-----------------+----------+--------=
--------------------+------------
sc7180-trogdor-kingoftown    | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/66614f0befffcdb4da7e70a3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-13-g04ca0a51f1e6/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-13-g04ca0a51f1e6/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66614f0befffcdb4da7e7=
0a4
        failing since 7 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first =
fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                  | regressions
-----------------------------+-------+-----------------+----------+--------=
--------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/66614f22b2aee051a27e7089

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-13-g04ca0a51f1e6/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-13-g04ca0a51f1e6/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66614f22b2aee051a27e7=
08a
        failing since 7 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first =
fail: v6.10-rc1-4-g7b44d5381e541) =

 =20
