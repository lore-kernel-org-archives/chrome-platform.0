Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8950101C8
	for <chrome-platform@lists.linux.dev>; Mon, 18 Dec 2023 06:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="0oVuWP9G"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6cea5548eb2so2587919b3a.0
        for <chrome-platform@lists.linux.dev>; Sun, 17 Dec 2023 22:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702882656; x=1703487456; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O5Z6hw99RpUe0YOPB+UlcLUnlw+6RakNfnQLHYKypXE=;
        b=0oVuWP9GMb/9a4CYbjdFIJVe+puurGocAUNa022rQD98Gj10a3NSum6AaYH0MGSddg
         rofgJ7XNTfiFLATFsrxT5kvABFfE9t/9n9KWOkSPYDyAVevVAHBO2vJ11WVHVcDEXXv6
         5CO0BPsFbvOXKhzCBss1BUVIMEKdeNISK3wVylq+eF57V6P8CEbAFZo1igVj2rgtj36v
         JAkbO7xFBgVHcWhj/cziTKA/of3NWV6LzTYP9upyAXFtQqGh/8WtuBSlASn0zrHsrylt
         k0ssdQykJ+qO3WBdD5Sjnw5aIOCOxQFmrzLU3gkyf7jL0EwjfTknGWtLTzIklxNnXNYU
         NnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702882656; x=1703487456;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O5Z6hw99RpUe0YOPB+UlcLUnlw+6RakNfnQLHYKypXE=;
        b=b4+A2Spyl0Bk2j5EerDauOaCmRUsvxDJr+PEMAuh3Up5KhRLpQJjCHfyIiqnEZZB1F
         kigct1IE0W4tR0Z/O0yw5IiRZo2f8vYecKDnsDp05eoOfE58CfxNXxqulg06gGv8HRv/
         +73Lxo7pXAjFkxewh3ObIXPac9cKDu93iHwtRPWd4t5PLlaHJd1RFwJGxdeGXYhGyrcA
         WozhgZUM0or2VPO8qbDOvDcNRPlKqglpxUeeDdMAooHQxsFq4avn+Q9ryeMMwEhw4HCr
         wXFn6em0+1EnqGNm0qUZSxTIyEH5+TMn4OOObCMUx0zh4NN/NvQFuRdavDN0pslXFVpN
         mpTw==
X-Gm-Message-State: AOJu0Yx2Lwtt6avyouVWtpQh6CrxIHthLJVOyrY7fCA25O99dXAM8hZ6
	at6PEEbARhPGoroyTh3eNEc3Mg==
X-Google-Smtp-Source: AGHT+IGrvkTxCUmSgAo9CzPjO6imoteQdXgTri+d9qyN+6nW5eYHGrRKL4y5jxmIHTO8iWKgTb7Osw==
X-Received: by 2002:a05:6a00:a23:b0:6d0:99da:3d32 with SMTP id p35-20020a056a000a2300b006d099da3d32mr16381439pfh.41.1702882656210;
        Sun, 17 Dec 2023 22:57:36 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id s16-20020a056a00195000b006cb574445efsm17509298pfk.88.2023.12.17.22.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 22:57:35 -0800 (PST)
Message-ID: <657fed5f.050a0220.d2223.4f56@mx.google.com>
Date: Sun, 17 Dec 2023 22:57:35 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.7-rc1-4-g57eb6dcd32cf6
Subject: chrome-platform/for-kernelci baseline: 88 runs,
 1 regressions (v6.7-rc1-4-g57eb6dcd32cf6)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 88 runs, 1 regressions (v6.7-rc1-4-g=
57eb6dcd32cf6)

Regressions Summary
-------------------

platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
mt8195-cherry-tomato-r2 | arm64 | lab-collabora | gcc-10   | defconfig+arm6=
4-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.7-rc1-4-g57eb6dcd32cf6/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.7-rc1-4-g57eb6dcd32cf6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      57eb6dcd32cf6b49c38eff81e60e8fd471aa05a8 =



Test Regressions
---------------- =



platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
mt8195-cherry-tomato-r2 | arm64 | lab-collabora | gcc-10   | defconfig+arm6=
4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/657fe37c42993aaf98e13876

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.7-rc1-4-g57eb6dcd32cf6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8195-cherry-tomato-r2.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.7-rc1-4-g57eb6dcd32cf6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8195-cherry-tomato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657fe37c42993aaf98e13=
877
        failing since 2 days (last pass: v6.6-rc1-21-g47ea0ddb1f56, first f=
ail: v6.7-rc1-3-g59a9ccf19ee03) =

 =20
