Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A3516728D
	for <chrome-platform@lists.linux.dev>; Wed, 29 May 2024 06:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716965079; cv=none; b=IGQxuF6FHGaMX1ZMBeI8fruXziz4S6KVudhcWDlvNUckJfu9Vuk+y0kHBIFDanzJLxOnfmIO8E9MEEtpcpLlFYlGSNFjIDSIGQATAESRpad/1O5jkMNfo6clnY1V6EDO4W9zjmBAuXqwyEkPTTEeRtu7LPNyR4BXxyI3F/NtZj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716965079; c=relaxed/simple;
	bh=DyE6yn4w29YYEKwdqYvWtbQoZCuM8UFBE4tbsa5VI/o=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=GD+v3sJs+poi8KsJc1K6ELQNCF4hCytpmO5mwHEOF9E/3DqoiQ+s61woXHjN7l/sQCi5RKPDb2OAEJDhh5VcDXH70up9KFC9cKNYB2GBhIMqtc/F3/BJOrU0VHSMuoQrfRdu+BnIqk46ivTOkQvyyTihosJWcv8MMf+nhHMgvPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=EkHcQhb8; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="EkHcQhb8"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3c9cf863a58so944659b6e.2
        for <chrome-platform@lists.linux.dev>; Tue, 28 May 2024 23:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1716965076; x=1717569876; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mPFVF4XAGK6cs0panay8ire0D+EvROxmQrWFBEsHTdQ=;
        b=EkHcQhb8gobhd1olLQcQzoj9usg0xgfFuN9Hd0r4XVqlSH+8uklJgJ9cwsQbtJ0MGm
         3uBA7cmjsrf8FcVaXVH4fCy7rUyxaOwYcRV/0zdQlVIrveOg/sDJGofyFWjxCYXTvKwk
         bGtxQfw/ccbnOIffYSFsEb4fIB5nKPCY0cmsldKyw2DrLVsVf3uVZtc38q6Pz7CLtnsO
         0iVjyVFWUH0Ao79ZkmS+85+uOA+iAvvKYFkM+/JTjP+B2w1NqiR1AYI4DsUSkvdqiFhW
         VTtJQ6To+8nJ605JDlp2Vpl3Uc8o30fZHa3zPHWb9929nTKsSpH8Et5NsdRWQoGpGyWD
         E8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716965076; x=1717569876;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mPFVF4XAGK6cs0panay8ire0D+EvROxmQrWFBEsHTdQ=;
        b=mjiSgy5yVz6kMS0SWqRo0cbi4B8xbhyvenMilnVx+6fWE+phZzNPTxqqOQNVVYNVNu
         zv6ZdfcSQ1iQqBzyazlcY4+rgvcKKawQ7vsfP5IbTmAuL7EN6rYqragg/QwIUDaYCq0F
         iR9p2M4mPzHkIYUiypU6uWl4uYd4izfm4WVnCx3mIDyQbzZ8ZgmtJ/R0WAijNznLEdK6
         2KVcmQ3VzLDzlQlTcamc9nhJw2jUvCZJtWKNk6B14DQMejS6lwAfSP0kqKFeeexguyAL
         j1qmk2Qfs8j1lG0W5cxiVLKRegjlL8yyZ/hK6KBUbNhEEwQU50GRiYUjpyXe4Gd0Tz4N
         Lxjg==
X-Forwarded-Encrypted: i=1; AJvYcCU10awzfhGSqrZ/wlbPY9wHl7/QGb4jU83Zy+0Xizg7sO60aZmbVhMrl0nlF+gQBf2VlQiEi3EgHUSTBRDhjXKV8fpvlbfbRgP8ywfZ9XLR
X-Gm-Message-State: AOJu0Ywde/k9ODEwnZTC+I+9/VFOF/2wgtjD2Z/EiA0RBvc8vPTKPeM1
	Gk90rnDXGBSQQWPDck/lIQu6D1WzJLGZWKpeCUTxEkII5MH8F3dCsiLH2ilY7Vc=
X-Google-Smtp-Source: AGHT+IFBy2O9WaVd48IBcfe5hSF3ipBpmU3qyx3RJPvzqBZmQW693r3/gOuy6xOcuhQcLaA6Wb4rOQ==
X-Received: by 2002:a54:4481:0:b0:3c9:7499:898e with SMTP id 5614622812f47-3d1a538c55amr14159845b6e.2.1716965076138;
        Tue, 28 May 2024 23:44:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fd4d878esm7411245b3a.190.2024.05.28.23.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 23:44:35 -0700 (PDT)
Message-ID: <6656ced3.050a0220.922a2.3451@mx.google.com>
Date: Tue, 28 May 2024 23:44:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-4-g7b44d5381e541
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci baseline: 93 runs,
 4 regressions (v6.10-rc1-4-g7b44d5381e541)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 93 runs, 4 regressions (v6.10-rc1-4-=
g7b44d5381e541)

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
ci/kernel/v6.10-rc1-4-g7b44d5381e541/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-4-g7b44d5381e541
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      7b44d5381e541de3da3cee2e948456b250f41f25 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/6656c5e2303b91df547e707a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-4-g7b44d5381e541/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8m=
p-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-4-g7b44d5381e541/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8m=
p-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6656c5e2303b91df547e7=
07b
        new failure (last pass: v6.9-rc4-22-g2fbe479c0024e) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/6656c3faf1fbfacf877e707e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-4-g7b44d5381e541/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8m=
p-verdin-nonwifi-dahlia.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-4-g7b44d5381e541/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8m=
p-verdin-nonwifi-dahlia.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6656c3faf1fbfacf877e7=
07f
        new failure (last pass: v6.9-rc4-22-g2fbe479c0024e) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6656c5d287c35563237e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-4-g7b44d5381e541/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-4-g7b44d5381e541/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6656c5d287c35563237e7=
06e
        new failure (last pass: v6.9-rc4-22-g2fbe479c0024e) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6656c5fde045e9d01c7e7076

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-4-g7b44d5381e541/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-4-g7b44d5381e541/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6656c5fde045e9d01c7e7=
077
        new failure (last pass: v6.9-rc4-22-g2fbe479c0024e) =

 =20
