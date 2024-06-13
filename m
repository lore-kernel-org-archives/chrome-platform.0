Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACA514A623
	for <chrome-platform@lists.linux.dev>; Thu, 13 Jun 2024 18:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718303289; cv=none; b=kRuxeSbKlnUI/7kvghMIMbkCQ9hGdhgVMKzcBZbDU9QBahMfJaq2Da6P/Ba0CA4aAoPdCLvPZFycKBkTV3Ob1OvwVJSX+MwNGpQBe8/7SLqBnwf+8pktlq3Kirc0DLL3R4Hq2gOHHcOld29gDSEyWSlXqs8/QQHAMowQaEc7b34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718303289; c=relaxed/simple;
	bh=UM897GKlLHZlZgKXR470jOnX32g5Gqd5TdrqYwJoR0A=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=rorhNUKM4R7PM0HIi/a0Mu/U9AxTjO8fPlkHvKL+sUhdTQKZP5lwmDOskgDcbDKtn8XvxI53K414C9OXu3D6M1Zj3giD9YgoEngaaF7/rV+6jCYPZ5ZWyW3XA5+OQExMJG1nVOniKcyaqur8XDusjCqF+xl8M1BfNpYRC4iA1pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=I9NZtaTZ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="I9NZtaTZ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1f4a5344ec7so9906955ad.1
        for <chrome-platform@lists.linux.dev>; Thu, 13 Jun 2024 11:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718303286; x=1718908086; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uu8Blnb+U3qkqorj/WsZBdb7F/1f06cHju3RiCwZLf8=;
        b=I9NZtaTZZytbVYkz1UtIXzhK7xFhmP8av7T9pu3/Ir6YWu51+RSpWh8S68A5eOBSqJ
         +wAXpn3j21FQSYrwLeibBOYg0oT/kzp3I8atdAbG5JZyEZ6FncuU49s/NADpDi13Xibz
         fDL1Pr8ECnPtCk1L9jr7FwJO5ZwOTcKa3YBqlRO4uuXcnmRcLYiEF9aRc826h4KjYAMh
         Sc2mWQFNCAWjZuoBEqvxPP4NRINQwun9I4A6TehGyQI3hbtqE7MWdC0wWtyzEZLhKEkt
         HxPnUjdEKEMotu8u8OM74wQg2916NkS0S5bNBQoDRcZuGS/9S3bM4ietwL/+14pg+I2C
         omhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718303286; x=1718908086;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uu8Blnb+U3qkqorj/WsZBdb7F/1f06cHju3RiCwZLf8=;
        b=ALTSdT+FHKl6AMaov88uYUoNG1fA2UcmBcBxwdgjUg0KupFC/K9knmMsOr5VlHkd5T
         slmjaMh8gj9vamT8qRDG137pyt4N++1Z3OKgx5y4gbLfQVSgLAGKuy1aIR9tm/6aLsIj
         0MQ2je4LK2H06PqsOItN5ul++tRUhBYuikHDkEAC+tlix7+zh5LRv0ZfY8ZTIcFksddV
         VhTVf1ugXq4nKE0Rqxg6kbFk9LYwGSN8wVyo8TONjSq7d9rj21bbn7qYkhZZ4XUDTCzA
         W9zirJ/+ZOBuRdYDOvuN7WCqmpqPmGfVzsp8Xe217GGxNjPSSTHNvtVHAWKETH7Y3/XS
         ZMFA==
X-Forwarded-Encrypted: i=1; AJvYcCW4LaH+iNw+1FOMAiaVALIfHJqHKESLHwskfFMIN2dH+nfcxFWht82dC/ewwdAGOMg68VFxLsABXJXfQd0Omkx41wcvT30zwa9CCp4lGV/G
X-Gm-Message-State: AOJu0YxiIfnsEuez5MTMBaiWfggN6zQHgkm+DPzDx5oQSCUJMIj7aPPx
	macnu5FPMv4nwj68XfqrLOeSo764Jr6d46+M9N6mOV6yBAKNl/uVqA1RyWzx/shITuRNAFDGW6f
	+g/c=
X-Google-Smtp-Source: AGHT+IEcexZm6Yx60kgGpg41Oho6FfuR/MJZTU1djCkc2bSHQ5Ug01JppFe6X1Uljv9FurEyYOvblw==
X-Received: by 2002:a17:902:d2cc:b0:1f2:fcc0:66f with SMTP id d9443c01a7336-1f862323439mr7909905ad.31.1718303285643;
        Thu, 13 Jun 2024 11:28:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855ee8349sm17106875ad.120.2024.06.13.11.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 11:28:05 -0700 (PDT)
Message-ID: <666b3a35.170a0220.3e5c0.4a79@mx.google.com>
Date: Thu, 13 Jun 2024 11:28:05 -0700 (PDT)
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
Subject: chrome-platform/for-kernelci baseline: 89 runs,
 5 regressions (v6.10-rc1-19-g77a714325d09e)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 89 runs, 5 regressions (v6.10-rc1-19=
-g77a714325d09e)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

mt8195-cherry-tomato-r2      | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-19-g77a714325d09e/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-19-g77a714325d09e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      77a714325d09e1527d865dc011ef91c4972ffedd =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/666b2ec56b2328bdcc7e70aa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-19-g77a714325d09e/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8=
mp-verdin-nonwifi-dahlia.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-19-g77a714325d09e/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8=
mp-verdin-nonwifi-dahlia.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/666b2ec56b2328bdcc7e7=
0ab
        failing since 15 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first=
 fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/666b31345e5e4bd9b47e7171

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-19-g77a714325d09e/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-19-g77a714325d09e/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/666b31345e5e4bd9b47e7=
172
        new failure (last pass: v6.10-rc1-18-gc2a28647bbb4e) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8195-cherry-tomato-r2      | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/666b3062d550fb65ac7e708f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-19-g77a714325d09e/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-mt8195-cherry-tomato-r2.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-19-g77a714325d09e/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-mt8195-cherry-tomato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/666b3062d550fb65ac7e7=
090
        new failure (last pass: v6.10-rc1-18-gc2a28647bbb4e) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/666b30f4e843ce47197e7103

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-19-g77a714325d09e/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-19-g77a714325d09e/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/666b30f4e843ce47197e7=
104
        failing since 15 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first=
 fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/666b316f2db1e85a217e7070

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-19-g77a714325d09e/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-19-g77a714325d09e/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/666b316f2db1e85a217e7=
071
        failing since 15 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first=
 fail: v6.10-rc1-4-g7b44d5381e541) =

 =20
