Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BB22907
	for <chrome-platform@lists.linux.dev>; Sat, 15 Jun 2024 02:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718420184; cv=none; b=OJCVNEk4LTo0UMUkwhdatBrEqUdIaxNYB6LVtaeO0zwXvIOGJmg2tjOFeCkq8GVk1X+i2zVmnIOklHaN6WCgUBdP83pH/c8dErJTGQ46EKNFL8egdxwW4gMah/iKt2mKNmswI+N/FYUO4lgSzTvvDDmOXxsXpy/6zw+Gt4cW02U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718420184; c=relaxed/simple;
	bh=+CvBjs26wbFPVHbVyJpi5Ftg+bTPuYLFXnO/IgTQlaw=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=u5XSHL+YYrmn8EQrnfIrU+9es/RXYIT1e+9skCTAWMuqcHVOa7GcGjaxX80Ok6Rfx6rmsGxkbX6RwFWpGGpZ6DAhD6whQT2rZctjfq0h6M/rQxF95jzKqRglWvB2O6meJWW25nV80hAzOjUDjbb0iqTVpUh985gNkw+hyo/0K5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=NHLQWBCO; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="NHLQWBCO"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5babfde1c04so1271840eaf.2
        for <chrome-platform@lists.linux.dev>; Fri, 14 Jun 2024 19:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718420181; x=1719024981; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PYYJ2gQtbenUbltzZ/u0D7b8CQK+mEdnucTPVmW+Tk0=;
        b=NHLQWBCOWm+nO187wPlDA0MYcCJQzV63OMhTdLzsLwef88zY4ciAjw7I8bNWSEjx7y
         2P4VtRxqkVWkyMIv811XDlZMUOvN6iR4RX0tXTVDNBLrT8ZIoZKKKMZ2DtqCuVoqxbvL
         duHsquo/cVM5540PFZUitD4HeahA598dXZH8u4OrkGEBcIeTiwFWZSBz/DvaaVO6OMV6
         1oLYn4Pt9A7mIYRoNkN7A6itrrd8OkNh0Bz3L3iEKF1p/5/7XKbtU7UbDeEr2/2p8Gda
         hTWQ6SXiQAtkYEWVXQMpkHdQH4w3930WECfPNOelLEOGoESZWxJpOctiVk+Nt2FV84gR
         PEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718420181; x=1719024981;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYYJ2gQtbenUbltzZ/u0D7b8CQK+mEdnucTPVmW+Tk0=;
        b=hMRLkDSE+3LUJ30MnIMjukuwGZ2IDTTKzvQ8xRk3nHfIOuxwx23npJwTrQ9bfR57He
         igoZ9+yVyqyLmlcSAB8K097S6zxfAfmxtrBg3c8Oj6ExtASi0UH9xfxfr0mcoiVTpo5J
         IKwcJJHAIupXbzyg9Hj3yWKwZOrHIvCpsWW6afYnz473WoPYTCmkw1a9w5bJ/sw1V4t7
         qENx2A9BK0aBKWeZimRkgH2MxYk25ZgZ9mQc0xoNWH/Xp4QZ8rHCk8wWed7Ky5y2mNq5
         GtJT7sLjmJQmihtdOlnuNQ8Ys3VUaw2X/KiIBW57zrEoczDmVsGOiqZmQLIKB87nFvv1
         BtOw==
X-Forwarded-Encrypted: i=1; AJvYcCWjMdkvdepTv2y/GgFXsce66MXoSJ3jLwoJBE2cgNcMiakqOI3J9QEyV916ZaVq4Wboz8lAbagZtTCEAxXj7srwBR2HwxKvDFgQTSMUGSPj
X-Gm-Message-State: AOJu0YwfndjOGF3WbGu0q2uuf1pb5QfbQ2UPmXFWlzdcMaYMghB8OHmx
	z2un0es1TSH2Hlrp87zgDXC9Zkr7zkPY9SuXiU9CTG3uRmyrKEyXJJBiq0nD1dg=
X-Google-Smtp-Source: AGHT+IFWzxS2NuBdbC2ZRr8OkrNTzxk2W6xnDzrIO6oLTLKs5c2T2YSFtHvYE4kSeNoQjsNSzMpKVA==
X-Received: by 2002:a05:6358:718e:b0:19f:5305:cb7 with SMTP id e5c5f4694b2df-19fb516103amr589565555d.25.1718420181139;
        Fri, 14 Jun 2024 19:56:21 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f1af16sm39858865ad.246.2024.06.14.19.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 19:56:20 -0700 (PDT)
Message-ID: <666d02d4.170a0220.26a12.cceb@mx.google.com>
Date: Fri, 14 Jun 2024 19:56:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-20-gb57cd5703a16
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci baseline: 91 runs,
 4 regressions (v6.10-rc1-20-gb57cd5703a16)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 91 runs, 4 regressions (v6.10-rc1-20=
-gb57cd5703a16)

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

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-20-gb57cd5703a16/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-20-gb57cd5703a16
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      b57cd5703a1618e87772094ac12c5ee7d6c35e2f =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/666cf5a30b2662147e7e71b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-20-gb57cd5703a16/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8m=
p-verdin-nonwifi-dahlia.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-20-gb57cd5703a16/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8m=
p-verdin-nonwifi-dahlia.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/666cf5a30b2662147e7e7=
1b1
        failing since 16 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first=
 fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/666cf6bb4d13042d857e708d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-20-gb57cd5703a16/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-20-gb57cd5703a16/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/666cf6bb4d13042d857e7=
08e
        failing since 1 day (last pass: v6.10-rc1-18-gc2a28647bbb4e, first =
fail: v6.10-rc1-19-g77a714325d09e) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8195-cherry-tomato-r2      | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/666cf6c2a5e1dde06d7e708e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-20-gb57cd5703a16/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-mt8195-cherry-tomato-r2.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-20-gb57cd5703a16/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-mt8195-cherry-tomato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/666cf6c2a5e1dde06d7e7=
08f
        failing since 1 day (last pass: v6.10-rc1-18-gc2a28647bbb4e, first =
fail: v6.10-rc1-19-g77a714325d09e) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/666cf78590ff9658ab7e707e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-20-gb57cd5703a16/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-20-gb57cd5703a16/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/666cf78590ff9658ab7e7=
07f
        failing since 16 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first=
 fail: v6.10-rc1-4-g7b44d5381e541) =

 =20
