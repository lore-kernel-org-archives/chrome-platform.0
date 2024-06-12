Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DEC22092
	for <chrome-platform@lists.linux.dev>; Wed, 12 Jun 2024 05:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718170986; cv=none; b=HkhUEIpKGnAgrygoepzKy2FD9buNyh8T/fAuHcMXlR5QnUhtzsA0Gyzh2OaSckMepYHY+KegpAHAYqu1ijKTmOHoC7UCP/7stotrKC2+lpz01+Fx/BTFQUV1vmhlrP6QyTJG/IFhwWIQ/VaVLngCajcwm0gbnyyHf8i5sH/F37M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718170986; c=relaxed/simple;
	bh=6WuNzXH2mny+SGXOiED1nKilhqAen60R6ircxWfLv7E=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=LUEHg7xDpXngwZTAfh1KA1izHX8b8OuoOQBzVO6KreH1oUtaNHTykHF1kz7a9ljXu7767bfnek3saUTp2jfRCAsDMoLuPLQZZ+9Nwp1GKGWNYbbOjBU5I/nkAhwX1HP85xGXU2K1iNIwuR5AxIkm6t6LgZq/DypSsOCz2ty+Hns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=3feyKVqH; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="3feyKVqH"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f47f07aceaso55880285ad.0
        for <chrome-platform@lists.linux.dev>; Tue, 11 Jun 2024 22:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718170983; x=1718775783; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NNZLZfhtL4KKjMZUmKkHB2dnrgMTWdCPwTjR01RhoLA=;
        b=3feyKVqHDk6SIZwpHFSIoNKdiqR4J/bZGGnpOa/MFiZg/2mfYpnnAGosjQ71aBWUDc
         9/iTDM+CNQ4gx4/3XlzBKFNcaThOJ2UpKH3lo7WXDWIboy6eymMtexqRF0pWZT5DpaIQ
         RtOUH+dfE9+AVWccwqzdUyjW262w5L/Ymmbhae5cHrGZnUM8rxk7dq9Kc42bLXOYVqmX
         vNt+/hnPN0UNkFa07DDQN6YhZvtMDi4hTtYkuJelu2YkccJTBZjg3ldkhgy2C4AXN1/3
         +iQ5YP6cCjWSThz5npkNwQOPm17taZHJEvZWM/+E8zgKZ3mzfmMtObgZPS0g2/Xz8/OF
         YlmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718170983; x=1718775783;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNZLZfhtL4KKjMZUmKkHB2dnrgMTWdCPwTjR01RhoLA=;
        b=RyVk5NQMZYG5PBqFzDioLn4i9vU9PVbctdBHXfLenU+64bQIxg4XjTNI3SVfD8f+H/
         nF1X4qwp6XHAxdhoNRyFunzglG16eLTwjBNQRaQLxv5fKZsDm7K+rDTv/Nn7rC9Oj1GW
         BkdWnSycrGKUPUuiUb3orbHNIjfXlkKqgJdH+XJYi929JcfmMsS46tLS+VqCg5jwcxst
         OEtU7bnvVOe1mcVyEfZUOXsg+N+Fw6s+biXCbE061zMwwotqrnMEwyiowilQtyxNa4T+
         d8ohh15z6q4+Ie41k2uh5fEutkNukS4eLAaDYyD37nRFC4EnaBj7TRurMZf9oievZD/A
         Z74g==
X-Forwarded-Encrypted: i=1; AJvYcCVDjpLf0phBId2lnRepfGx57To7CXUTWRyB7nStFi3TipohXx6iu6d/fHu0Zu8JTspiV8s8xrRyEDwMhwOTM6hNxHGsKY9O99OzaMSvvdQr
X-Gm-Message-State: AOJu0YwTyiA62FbR3uW1SG5f4fvjTFf8nybbqEmy9+vCbTmJD1XfNHwn
	EHJGPyhY7gTac74cRO1kwtUg77pWhNmzwyil3r1YM+L29Cs8XnRCvr+FvCU+QOI=
X-Google-Smtp-Source: AGHT+IE0UqD4P6ST7OlOoZfRO3CcgsCA9AT7qhpqry4Iys3nJ9i6KiSdwRZPr2Rju/yuCyDeBr+FAg==
X-Received: by 2002:a17:903:2282:b0:1f6:a43f:5b38 with SMTP id d9443c01a7336-1f83b5178a1mr9347565ad.4.1718170983345;
        Tue, 11 Jun 2024 22:43:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f84064dadbsm3386205ad.292.2024.06.11.22.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 22:43:03 -0700 (PDT)
Message-ID: <66693567.170a0220.fb738.0a70@mx.google.com>
Date: Tue, 11 Jun 2024 22:43:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-18-gc2a28647bbb4e
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci baseline: 89 runs,
 4 regressions (v6.10-rc1-18-gc2a28647bbb4e)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 89 runs, 4 regressions (v6.10-rc1-18=
-gc2a28647bbb4e)

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
ci/kernel/v6.10-rc1-18-gc2a28647bbb4e/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-18-gc2a28647bbb4e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      c2a28647bbb4e0894e8824362410f72b06ac57a4 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/666929d64f3670b0297e70be

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-18-gc2a28647bbb4e/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8=
mp-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-18-gc2a28647bbb4e/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8=
mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/666929d64f3670b0297e7=
0bf
        failing since 13 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first=
 fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/66692a303c2703a8757e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-18-gc2a28647bbb4e/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8=
mp-verdin-nonwifi-dahlia.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-18-gc2a28647bbb4e/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8=
mp-verdin-nonwifi-dahlia.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66692a303c2703a8757e7=
06e
        failing since 13 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first=
 fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/66692c4d4e62ceac787e707c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-18-gc2a28647bbb4e/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-18-gc2a28647bbb4e/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66692c4d4e62ceac787e7=
07d
        failing since 13 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first=
 fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/66692c5c2575696d7e7e70a0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-18-gc2a28647bbb4e/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-18-gc2a28647bbb4e/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66692c5c2575696d7e7e7=
0a1
        failing since 13 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first=
 fail: v6.10-rc1-4-g7b44d5381e541) =

 =20
