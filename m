Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF545664
	for <chrome-platform@lists.linux.dev>; Sat, 28 Oct 2023 09:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="bXFy4SPl"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6b709048f32so2634697b3a.0
        for <chrome-platform@lists.linux.dev>; Sat, 28 Oct 2023 02:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1698483868; x=1699088668; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZV9HcMtQEnQq9BIkGLj1GcyJw0W2s7Masr9gOL+d5tY=;
        b=bXFy4SPlo0ANUW+pr25ufHEB+Ek2pSGSH0NZDmhzbWDHesAQrv9sJSVnA0ffAH/g5m
         TEoy6J0RQuvPS+gyzWQXvtQzJXLTOJSVyQBpPBDq71C5WzCyA5J83/t8phCgwWVQ5QxG
         3xk00FkRyNqErXAN7huYNNm1OUfgA1ky1lrpFgfFckzx1T4p22rPlVeDVFRNkBJOycHE
         VIdYW6QVyBOGK0dsysRJwGdF515BK7WZCO5F2WE6ORmK/xY3nz7bynIJedkDUuNxMzny
         zckukwDMPzGsUu9lXFb6WKzSwGP6Gj0N+NONZti0n6xW/YE+AM6LHP+/qz0Is57UQZFe
         llvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698483868; x=1699088668;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZV9HcMtQEnQq9BIkGLj1GcyJw0W2s7Masr9gOL+d5tY=;
        b=XKQytyqX0GRtBep9Bu7h8rHb8fA7V3Juq0cwMk8h0fJJO5iOGxMpbTXBVHO1TXRsKL
         HC9UaSqVAoQoMf0y3m4H3cIj1E4j9pwLWL2q9Oj1xGnEYmal/j3YaPOXObintceuxicP
         8gD/J9oPsKLKDCvqKy/z3TANOmZIMVjYaMz7BKO+H3T9dwa5CW7vATtiWg03MCmMd3I9
         JC5O7QQgvHBF1qYGwpB4UtkKO/T97JIj9wDSW/AWW0LoqA0xkYe6xgKAzr1bQJPZ0acK
         CIxqYXc9HRHJ2/+Ls0LYxUwsie5kc8Jr8hIyBCMrW1D0W74NSkMIS8hW9tfV6MjSein3
         D2AA==
X-Gm-Message-State: AOJu0YyeXP3KJY111Zy+HGm6z7jF8j1NLYNDwdKHuh8Cy6ICOQhlrfkr
	hM8EHblqw/vpPH4RekSB3+GiSw==
X-Google-Smtp-Source: AGHT+IGdOIt/vmDfJU2kzAlnMapQFBxSTd7J02FeKMAsYzsoIyWhLp9weitX8sPIMQMmU0Xin0xKrA==
X-Received: by 2002:a05:6a00:cd5:b0:6b1:bf32:4fc3 with SMTP id b21-20020a056a000cd500b006b1bf324fc3mr4920723pfv.19.1698483867852;
        Sat, 28 Oct 2023 02:04:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id x17-20020aa79571000000b0068bbe3073b6sm2555665pfq.181.2023.10.28.02.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 02:04:27 -0700 (PDT)
Message-ID: <653cce9b.a70a0220.4c058.879d@mx.google.com>
Date: Sat, 28 Oct 2023 02:04:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-rc1-21-g47ea0ddb1f56
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci baseline: 79 runs,
 1 regressions (v6.6-rc1-21-g47ea0ddb1f56)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 79 runs, 1 regressions (v6.6-rc1-21-=
g47ea0ddb1f56)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.6-rc1-21-g47ea0ddb1f56/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.6-rc1-21-g47ea0ddb1f56
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      47ea0ddb1f5604ba3496baa19110aec6a3151f2e =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/653cc48338a2ac4e77efcf5b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-21-g47ea0ddb1f56/arm64/defconfig/gcc-10/lab-pengutronix/baseline-im=
x8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-21-g47ea0ddb1f56/arm64/defconfig/gcc-10/lab-pengutronix/baseline-im=
x8mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/653cc48338a2ac4e77efc=
f5c
        new failure (last pass: v6.6-rc1-20-g466f70fb1b10) =

 =20
