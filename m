Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C368D208D4
	for <chrome-platform@lists.linux.dev>; Mon,  3 Jun 2024 05:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717394012; cv=none; b=dQ1flVub5SNgHgEkpMNSGRvlRDFosKNaKZLWw26v0fIt1KbzW9gPO6+1iqmXhrLZ4EUbXqeTuOgF/GHoJo5meoJuum4KpDCh84wgLlTmH4mVvuUqindSDVXT5DXXfaEdadnaGDUT8kFFFhCIEZYBCj61jfj/nvRgyorYL8AKgqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717394012; c=relaxed/simple;
	bh=lU4EdtrvXDQOb3SxJiPJ3Qb5mMnGo1QAw0n2R0o7jQI=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=QpGV7WCo1kkoHbM4AslivBgcu6cGHSUooqIDI6dlLBozePwOEW8FdNCykPw0DGLK7ZuZjw2x2mFohPR5cFwMA85Je0ckukQzQsGYTKvEzZZNsFESJAEfYx9n58O52cnxvxjgJebg5khSlQUMlILpR8DiuUj53LQzo5IJcRJES8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=RLG6bJOs; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="RLG6bJOs"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70260814b2dso796958b3a.1
        for <chrome-platform@lists.linux.dev>; Sun, 02 Jun 2024 22:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717394010; x=1717998810; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=98+ZZ0aUaQTW486TWVhjme8yuSyWWjUbFpVw3GB3BKQ=;
        b=RLG6bJOsGt+nXTUmANK7lOqJnpzI/ENxcehGbj4ac7f2HorOvkaatMldxGOrH6lZLp
         lM61mBQ31oEmQiH7ECRO8uo8E8z+w/2l5m2+9D4KgzIkAHTuGEBGTOzdPL/6rrkFC0rL
         Zvew/badi4//2WGIHkizros+SK7xu6IX2JcY4frlf/CLCp2mhck7ZAnAz3tPYC37Guu8
         kBzkEzzi5Kv6gCJsZ6c8Ytthb5X2EZnutKJ891dUpHLCQO19bZaLH0dCH6qaoJq+dBbE
         oKoF2ntyk4+4Ecc5WkWPs8YlIlC5WVXdq2yV9mgh188cZkRK+B6XOYcIvNmM7mAY4wpS
         bUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717394010; x=1717998810;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=98+ZZ0aUaQTW486TWVhjme8yuSyWWjUbFpVw3GB3BKQ=;
        b=gtJAp2G0/1q/gLUcnEC/NU9yOe/N6zaFuApz27T3NYFEvS0mzkdwXwyhiHCKt131SE
         G/fGL27u1lMWMDn6NQ8LgRYtJpr/PslSNCpUusvh+63IAYQYGyXM2QQHl0JCv3kDwygl
         l335SLj05D1g6BgohVolmMPYplaLO85BL1coECKstqQS81fqS7SZdEsufNnd0dkCWoJN
         DbCOOs7qXt9T8447s/K3JlmrXHfBmjRd5onQ5UufSBrtWWpEKrl1W6mAmefBGwLt7Y9x
         K//A6xhmm6bL2wFjMfSl573p3PiXStlrT/uWAaons/hk3xQIfydEE3kpLM0z4q1QDlZi
         F1QA==
X-Forwarded-Encrypted: i=1; AJvYcCV5E9KOV6mKwq/jVMkSejOrdSo3GqYib+W4fYyITDj8UhPtgm/z2hOFhpx4qUk68AC/fY5OB1EIuK/gI2S1LjZfY7P7fxn4tZsfCuLHfo7j
X-Gm-Message-State: AOJu0YwPw64PbNmGLYfaRC8/aCLCGg+mrq4HtbEsS7BORImoLjyIXkQS
	dGvpeiqcJ0SDavHpaHv+Bp1l+tg2hSXq8Rl2ID9lmm4GTX4lCI8PgfLtxly8YQc=
X-Google-Smtp-Source: AGHT+IHKFYt4tBgzo2urKq991NEVE+K0jMK6Adk1EvG2TIE/jsBBJ/1IV4xJQcc8f07y6ISQ/CWZhw==
X-Received: by 2002:a05:6a00:8784:b0:702:548d:a875 with SMTP id d2e1a72fcca58-702548da9damr6828930b3a.11.1717394009962;
        Sun, 02 Jun 2024 22:53:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70258347aa2sm2766135b3a.180.2024.06.02.22.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 22:53:29 -0700 (PDT)
Message-ID: <665d5a59.a70a0220.2ae426.5d5e@mx.google.com>
Date: Sun, 02 Jun 2024 22:53:29 -0700 (PDT)
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
Subject: chrome-platform/for-kernelci baseline: 90 runs,
 4 regressions (v6.10-rc1-6-gbc3e45258096f)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 90 runs, 4 regressions (v6.10-rc1-6-=
gbc3e45258096f)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-6-gbc3e45258096f/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-6-gbc3e45258096f
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      bc3e45258096f2ea2116302abefde4b1cb9bc3c1 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/665d502cb4bc0cfb2a7e7088

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-gbc3e45258096f/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8m=
p-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-gbc3e45258096f/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8m=
p-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/665d502cb4bc0cfb2a7e7=
089
        failing since 4 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first =
fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/665d50f6a434a0943a7e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-gbc3e45258096f/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-gbc3e45258096f/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/665d50f6a434a0943a7e7=
06e
        new failure (last pass: v6.10-rc1-6-ge8665a1723789) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/665d510f7ed29e16fe7e70f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-gbc3e45258096f/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-gbc3e45258096f/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/665d510f7ed29e16fe7e7=
0f3
        failing since 4 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first =
fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/665d512cb479bc7b337e71d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-gbc3e45258096f/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-gbc3e45258096f/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/665d512cb479bc7b337e7=
1d6
        failing since 4 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first =
fail: v6.10-rc1-4-g7b44d5381e541) =

 =20
