Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C6A611E
	for <chrome-platform@lists.linux.dev>; Fri,  7 Jun 2024 11:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717760748; cv=none; b=IBTKkt1/alFI2W6mavCnxWHeS7OELBbjmxCpTx2XxaRXr23ccGrgW+8jZVzUp8W/nqb8+SK4uUoJ+E1TO55rop/D21gHiXW1Ugm3KHRxk4kmJFgqhZTDxfdq4ie5Q3jrm/fSAp2HbPuFXRTmaQRxPsNkw1OFKjui3zM4hPUBVf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717760748; c=relaxed/simple;
	bh=wJq+0Z8GtzS7IWd1Y9t0lkNvgUyVqObIlZqtxBt+Iag=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=FxuBd6IZFzfz6J5MyVLjFm2RynRrie2VDCbS+rOsMcUwZI6V2Fwm2YNrHGVn43zdbi8PG/4NId24mwPd6/5stEOONu+emh+Tgdgkv96PabUdibiHbaMieelGyTDkaYp+mgZ+WX+bQmf5HX+msFuSU6aqAzslmsDKIQPUAdizldk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=cFic5++Y; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="cFic5++Y"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7041b6b7be0so104063b3a.1
        for <chrome-platform@lists.linux.dev>; Fri, 07 Jun 2024 04:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717760745; x=1718365545; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=es/CWswXwC5VSlLo6N4OzvlVgQSITn2O/Ut7F3G6ZNU=;
        b=cFic5++YLybcyQUDNQ9gDflTrJ0kbMltrZKi1ImQWdQD+mnsMUCxmIFmJGyuREcqxH
         ubjcsyP12IrpBwYWudI9pZYMIEpXUHyOsNL5KCwwd7L0LW99WfN9Si7ltc730nXeq+b7
         RG8KaADJy840+G2tLtnmsqNn54oqnbdlwgd5neFyc/P/2fGu9YTIY6bPC7ili/ZrPJU+
         L/x/HJh0wtcVXDpCBogHzM2huY7UCbdPLkg6qNvA31GFFWsOppuGvKeveNzHSZddtoP2
         EktDXUr9Jkueuph0akbefhBQIo3qpIyv5qI3ig8b8+w0KNFu0CNdrKDwCo2SDLBi8V+l
         wwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717760745; x=1718365545;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=es/CWswXwC5VSlLo6N4OzvlVgQSITn2O/Ut7F3G6ZNU=;
        b=bMBFYUnDg89o2sS98zQpynPL4ivKQ1KZnzbP9tnRf7XQaTp81nhwCGVvpKpOxrNrTa
         V2XcIl2w/pKgioDO09IhCPH9sga9U7RvxxegfSBWYIqqGgxdpfrOFJ3jb4u0LTN9EjD7
         cn9j9fAaRNL3TfwNP1k+Bx35rO6r9+GlS+xq3UEpRlVgAk5zaJCbiwCkIPZEmrrvXcrC
         kcHxwpfwJUUPe5LBPD94R6Vwvnu4o+FKXGSZG11WWfGmUyuZrKtaDJH8l4CLmtTGC2Ah
         HCJOgP/iJSDCxSzTj2qGgvsU1SookxDDYpD+WkGDWW704HjLfTt+HC8TXDbvB29T50dn
         cbFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFV8BdiO1c9u823zE/Dp8mDaAySUsw4dOLz8VbvELpmUdTjH0DAMz8qnEFgDSPEDxx2qi3iGhoK/e2ZQMo2/pgf7Fuv9qPsQw8vPxFoMdT
X-Gm-Message-State: AOJu0YzUqwUE7vNHxq7cI4pJ1Nr0Te9nPqx8IacU4IFZmhSTVSnEtycM
	GtDxd/IIPwjk1egCjjea2IsTDz+VWIKsCUIWXPEWjXf0vYZn5s+0KX1ltxC4uVw=
X-Google-Smtp-Source: AGHT+IG9kaA0TH7Y+AeNgDvW+1682YP+l7qjUh3o5Kk1Wma95OVv0uG+cxNPfrF3UY/Neqa/64ztPw==
X-Received: by 2002:a05:6a00:6908:b0:702:5b22:531f with SMTP id d2e1a72fcca58-703f8625750mr5971376b3a.8.1717760745278;
        Fri, 07 Jun 2024 04:45:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd494fc0sm2423721b3a.127.2024.06.07.04.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 04:45:44 -0700 (PDT)
Message-ID: <6662f2e8.a70a0220.afe5d.6928@mx.google.com>
Date: Fri, 07 Jun 2024 04:45:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-15-gc8a4bdca928de
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci baseline: 90 runs,
 4 regressions (v6.10-rc1-15-gc8a4bdca928de)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 90 runs, 4 regressions (v6.10-rc1-15=
-gc8a4bdca928de)

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
ci/kernel/v6.10-rc1-15-gc8a4bdca928de/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-15-gc8a4bdca928de
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      c8a4bdca928debacf49524d1b09dbf27e88e1f18 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/6662e92f37f692750a7e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-15-gc8a4bdca928de/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8=
mp-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-15-gc8a4bdca928de/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8=
mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6662e92f37f692750a7e7=
06e
        failing since 9 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first =
fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/6662eb49c481fe23727e7072

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-15-gc8a4bdca928de/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8=
mp-verdin-nonwifi-dahlia.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-15-gc8a4bdca928de/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8=
mp-verdin-nonwifi-dahlia.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6662eb49c481fe23727e7=
073
        failing since 9 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first =
fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6662e8c8ad99ea13277e71af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-15-gc8a4bdca928de/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-15-gc8a4bdca928de/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6662e8c8ad99ea13277e7=
1b0
        failing since 9 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first =
fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6662e8d7fa30df417f7e72ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-15-gc8a4bdca928de/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-15-gc8a4bdca928de/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6662e8d7fa30df417f7e7=
2ad
        failing since 9 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first =
fail: v6.10-rc1-4-g7b44d5381e541) =

 =20
