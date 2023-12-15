Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8F9199CD
	for <chrome-platform@lists.linux.dev>; Fri, 15 Dec 2023 09:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="t7pONPYS"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d38e2be167so954295ad.3
        for <chrome-platform@lists.linux.dev>; Fri, 15 Dec 2023 01:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702634138; x=1703238938; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zehWTEWyOKOhoDrdHVrn9DV2gQl1zxNQYfsM3EQaThw=;
        b=t7pONPYSzMMnLXPhhiaJPgtKpIO7DIcPyZJJMseT/Yy7McLx+Iue0//yI0LyWAlrz8
         dv+oz6y8oy0bwMfLF77vsasTY4eKqEZaItQ3zammDeLi0Uk7tAEMfY5hwKCsmA9eQwYI
         UDWyupuKzjBUEhuS7DZc0s1y/AQU/OFDl0qmSaVecUqQo1M5fZuiiKCPVav206blMjeU
         432w2vF+01g5EC5tUX5rFj914htekdfmsfNxJoHfNIrvUFSkv3jXcIAwc2ba2+S6ZAVE
         Rgw1kJda2hXgm2OiBTMp4YSU3Xr4oYtKvTP3sIhDrTIJtiPXlIsMCOMg1KKyk460m8BB
         8psA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702634138; x=1703238938;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zehWTEWyOKOhoDrdHVrn9DV2gQl1zxNQYfsM3EQaThw=;
        b=WR0Xe0b86F8c6NR9ElMmObVCxoYCtvGxEXs1ePY8LkcDNbcJVWonFUzr8TSLt0u/UD
         KPSffwNElT5YX5l94Gi5qrA3E5w3bigjX7uYnf3aOa48S993sChG19mCeu3lGxP7z7uD
         WlThJg0zFQIPFLBmvHSzmaLuLykhiHA/td2ATKADyUTotKa25e+yPQSHHvpmLldEIeC4
         WzVDJQetHj9eovuxUrh2pCxNlq7FNpjzd3NMZaSy/l/QGcQZqEQcfye0Qj26wjzHu6am
         mXZfaORfBum5banpkm+vBw/76oZFfF5sPZYDQ29mBrpOwIXfHfCb+dMEBOLOF+Xt6q6t
         zC1w==
X-Gm-Message-State: AOJu0YxBlHgYaeM6+POJA+TS5Se9plOn4Q40yAbnk4d+KJIF+MOe9ftK
	BiVvkGkESTh7ni5lnP/pWZzuEg==
X-Google-Smtp-Source: AGHT+IFd2VPe8/fbeGfDsxnVsl3+O/Gr/LHOIUoNvwHNK8h2sk5njVfw4xDxR4lrZMhG0oghq0apSQ==
X-Received: by 2002:a17:90b:368e:b0:28a:f2c8:e168 with SMTP id mj14-20020a17090b368e00b0028af2c8e168mr1881787pjb.98.1702634138122;
        Fri, 15 Dec 2023 01:55:38 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id st5-20020a17090b1fc500b0028b11757032sm2559300pjb.29.2023.12.15.01.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 01:55:37 -0800 (PST)
Message-ID: <657c2299.170a0220.22d2a.7600@mx.google.com>
Date: Fri, 15 Dec 2023 01:55:37 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc1-3-g59a9ccf19ee03
Subject: chrome-platform/for-kernelci baseline: 94 runs,
 1 regressions (v6.7-rc1-3-g59a9ccf19ee03)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 94 runs, 1 regressions (v6.7-rc1-3-g=
59a9ccf19ee03)

Regressions Summary
-------------------

platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
mt8195-cherry-tomato-r2 | arm64 | lab-collabora | gcc-10   | defconfig+arm6=
4-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.7-rc1-3-g59a9ccf19ee03/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.7-rc1-3-g59a9ccf19ee03
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      59a9ccf19ee03179faf047822bbec76cac7467a4 =



Test Regressions
---------------- =



platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
mt8195-cherry-tomato-r2 | arm64 | lab-collabora | gcc-10   | defconfig+arm6=
4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/657c19480e2a81e926e134a0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.7-rc1-3-g59a9ccf19ee03/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8195-cherry-tomato-r2.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.7-rc1-3-g59a9ccf19ee03/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-mt8195-cherry-tomato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657c19480e2a81e926e13=
4a1
        new failure (last pass: v6.6-rc1-21-g47ea0ddb1f56) =

 =20
