Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4711817BB1B
	for <chrome-platform@lists.linux.dev>; Tue, 11 Jun 2024 13:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718110802; cv=none; b=f0HACbvTA85KqwNYE4gJrRsK08phqwgJ1bMtg8kT6dV4U0scHgSmn92h9LbcHHZi/c1MqP9NkfZ/fAL0jEdf7Fc4pUfj0kXSfUx8kPujhNmsJEO25oRF83YLuyrebSQhH8GuLytkDjN0o8HMzW/GBd84tCzAx3SS2FnZDe2tQBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718110802; c=relaxed/simple;
	bh=JlyLkgZ2EMFb71fuk4j2EegxfPprJGOj6vayYKzIp1U=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=sO3Fk0diL/484qiXVDN0l2rcH2aKJD2waCGV79+sOAJj+Qr9qk/o0DyXLLusHFJ8gMIeuECMJktu2kX7WLnNGlTmK9tjP7E/QFuGya2O0eYHJ/avujw4agBogPkzX4DJKOtF/emESYxyoWllnEBvqxeixwXFINDTCMD+HAPPpPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=SKsbFaE8; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="SKsbFaE8"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2c2fe7f07c4so2116180a91.2
        for <chrome-platform@lists.linux.dev>; Tue, 11 Jun 2024 06:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718110799; x=1718715599; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8bYrt4QmdJNyv/IdCXhQRZm408yPgJ6nZKdNmLgzV6k=;
        b=SKsbFaE8OBF7o82gfkbYiytooqWtwb4NINDqRXInaEgKduLJVQ5q9+Jdw0NlVMGWot
         XOr2hWpwWzDftO4rnrjh6l2yyDDKPlQUFH85KIgawve7HDCuIhJqjLF42vgUFUG2arpY
         qgrm+eUd30CY8RwVUml28IWddVQ4JpGdtGAnp0UarKBFILluwhnzPgYHRKYFQlfeE8ET
         ryro1m8ft/4MamGD587LDavleWE1EjUnrK0c/wp/X1b5xbVi88B9ZG1SPqrdtXy88QBc
         JNxOUIZi6PuruqDZhXqcdE/xeUH5A4hHkuE+WRXQwMBMRnGP22GhGASgVy5kXkPj9L5Y
         YRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718110799; x=1718715599;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8bYrt4QmdJNyv/IdCXhQRZm408yPgJ6nZKdNmLgzV6k=;
        b=JSggDvghw47BY9KcLjQuJihfVJrOGXXIU5Gv6un6LZvuFV4156Kied1d7plXe1JUNK
         UVxUxBOcHdgd5E4E2NmrTONL4kHdgDOBQyzVOIqtfYIApTFU54uCNKwWjO4KRS6kzj2E
         mBOioCzfxYgi1XqxwZqXk5jnAQn4m7fHlhPLrMVQX+9Czji4nPz2CKtZmkPeFIu+P8W9
         xABQzb+p+yibYcJfrivl7hwsUCYb23PNoTP5jMBtxI+TBNmv+b/3R4lD7QFwwgzbFkKs
         iS/mZvAJEW1ZMBY0XrzcmYQ6hiBIQtGzQyiOHipTuSctkzD4IAKddtY1VZnbKV44l7/N
         x5og==
X-Forwarded-Encrypted: i=1; AJvYcCU0zTQcZMtOb81utKGeqM/FUho3quo14wBf+q3gsGSJ49taTiF7h8OoXXMrq7l5CCstWm2JhiW5/XPgClkKbPm273xTwLd1RuKXbhnioPOs
X-Gm-Message-State: AOJu0YzLMtgxZjaOCIuf5paff5E23PPLjAk3oE3IpdNVvGXcVH4tRPJP
	VXPmpBsR5g8/zvYo/k03zYmFryJTwL8bhEtFmb7S/nQtUg1/7aIXjLRuT0smUUg=
X-Google-Smtp-Source: AGHT+IH5m9Jm2JivsE3s0ny8bOCeel1wpYmVQhInY/e9ZMzL0MwjNg6Qr0lXP6xZrZUXEni5ltmNWw==
X-Received: by 2002:a17:90b:4389:b0:2c3:2377:73f2 with SMTP id 98e67ed59e1d1-2c323777453mr3148701a91.39.1718110799461;
        Tue, 11 Jun 2024 05:59:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c3069c8ffbsm4448164a91.27.2024.06.11.05.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 05:59:59 -0700 (PDT)
Message-ID: <66684a4f.170a0220.5c52f.d2d5@mx.google.com>
Date: Tue, 11 Jun 2024 05:59:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-16-gd11c00292a31
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci baseline: 92 runs,
 4 regressions (v6.10-rc1-16-gd11c00292a31)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 92 runs, 4 regressions (v6.10-rc1-16=
-gd11c00292a31)

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
ci/kernel/v6.10-rc1-16-gd11c00292a31/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-16-gd11c00292a31
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      d11c00292a31537ae1e46ddea8f101f8822ede34 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/666842a125bccbabdd7e707c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-16-gd11c00292a31/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8m=
p-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-16-gd11c00292a31/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8m=
p-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/666842a125bccbabdd7e7=
07d
        failing since 13 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first=
 fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/666840a379bfd8125a7e708a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-16-gd11c00292a31/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8m=
p-verdin-nonwifi-dahlia.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-16-gd11c00292a31/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8m=
p-verdin-nonwifi-dahlia.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/666840a379bfd8125a7e7=
08b
        failing since 13 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first=
 fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/666840c5d7f1bef7657e708f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-16-gd11c00292a31/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-16-gd11c00292a31/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/666840c5d7f1bef7657e7=
090
        failing since 13 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first=
 fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/666840c64b57a90c517e7126

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-16-gd11c00292a31/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-16-gd11c00292a31/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/666840c64b57a90c517e7=
127
        failing since 13 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first=
 fail: v6.10-rc1-4-g7b44d5381e541) =

 =20
