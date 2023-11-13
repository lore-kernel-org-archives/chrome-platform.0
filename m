Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794688C0A
	for <chrome-platform@lists.linux.dev>; Mon, 13 Nov 2023 04:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="yRNMP0r7"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6be1bc5aa1cso4162013b3a.3
        for <chrome-platform@lists.linux.dev>; Sun, 12 Nov 2023 20:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1699851272; x=1700456072; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DHe/6X+zqO2OGWePYUxcBq1AH1HKw/FmjJ21ihvK1ZA=;
        b=yRNMP0r7Uy5QCofY+a5Ph0cpi94r0NW8ANIMhCbmzbrUKmxGd0GbWbPBkPiixoYvek
         SI1ckhXXvrRmpdDt0oQqztSk3ySLF7Lb2hznu2wAwYbWqbE6187wPnO6w5kKmEyn9ahW
         bVZ9pd60p+okGaxBRsB8/3COW/X0H0PE1nE93tUpnH/UT4Yp/1NPyk77ws7BzuhkQlR6
         Ay3pfMd6ky4SBUG/7ehj2rqToQAFhX2f/BBiI+/2xKhJVGL8BnJBx40zyy5u5xxC1q8a
         j1d+9TbKtdK+CaEHyZGAONNzQhplRsyXuRawb9ToOyCXSaFfH/I0PnT4NBvHBbfseJp3
         a+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699851272; x=1700456072;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DHe/6X+zqO2OGWePYUxcBq1AH1HKw/FmjJ21ihvK1ZA=;
        b=uw1y0+0iDC/yc4KKucctC30YlL26Ib9wA/StwqpzWgzyK93PqzSWo119n2JYeBiLjH
         LE6Eimwh0aI373rY7dxdkdbCv/TQxh5A+18cftSC1kTpyYian+CGCKgLXN4tQsQ6+bE4
         TAU1/8/rJYXU9ANS28VGPTmLht8R/DvYTPxn5hY57dMlnXF3rtSi1LUavStT2W/LW7nL
         7j2Ckg+ULZU7vkbOo4mO5MefJW96igyeXrPyfO6N7eo2NPhwe1yAd2/U8UHWIBvaFOT7
         wg2z1xfMpmEvoGBjI1R+xk6XlL02PUBgqIBNmFKzZ7tXgMDJQ1EShXyJa6lD09G8uefW
         AeAw==
X-Gm-Message-State: AOJu0YyK+tL7vGGG3qungaBPAUTQTYcqZI4vKRRluUZLpCH9gdi7fwjx
	qzJJrUMKJ6qFqnCv0MhLKe2z+Q==
X-Google-Smtp-Source: AGHT+IHgk4XOHqH2zBYPreZA+kkOLLYnBPVs8hdjmnX4GQq9hkuam+Fv7TnoY/530w4CEU0WZJ2y0A==
X-Received: by 2002:a05:6a21:1a6:b0:186:8318:6b5e with SMTP id le38-20020a056a2101a600b0018683186b5emr2793315pzb.20.1699851271792;
        Sun, 12 Nov 2023 20:54:31 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id g9-20020a170902934900b001cc50c5699asm3262326plp.301.2023.11.12.20.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 20:54:31 -0800 (PST)
Message-ID: <6551ac07.170a0220.4a9a5.6b28@mx.google.com>
Date: Sun, 12 Nov 2023 20:54:31 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.7-rc1-1-g49e380795414
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci baseline: 36 runs,
 1 regressions (v6.7-rc1-1-g49e380795414)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 36 runs, 1 regressions (v6.7-rc1-1-g=
49e380795414)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig | regressi=
ons
------------------+-------+---------------+----------+-----------+---------=
---
rk3399-rock-pi-4b | arm64 | lab-collabora | gcc-10   | defconfig | 1       =
   =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.7-rc1-1-g49e380795414/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.7-rc1-1-g49e380795414
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      49e380795414039f7b3bd44c121104f31738dcf1 =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig | regressi=
ons
------------------+-------+---------------+----------+-----------+---------=
---
rk3399-rock-pi-4b | arm64 | lab-collabora | gcc-10   | defconfig | 1       =
   =


  Details:     https://kernelci.org/test/plan/id/6551a2d483969a4f29efcf0c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.7-rc1-1-g49e380795414/arm64/defconfig/gcc-10/lab-collabora/baseline-rk339=
9-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.7-rc1-1-g49e380795414/arm64/defconfig/gcc-10/lab-collabora/baseline-rk339=
9-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6551a2d483969a4f29efc=
f0d
        new failure (last pass: v6.6-rc1-21-g47ea0ddb1f56) =

 =20
