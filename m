Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0350715ADB9
	for <chrome-platform@lists.linux.dev>; Wed, 24 Apr 2024 11:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713959986; cv=none; b=iUfjOfffhqxvpzwUNU0yb5tExsOq1DmN3tzb+eRaURUJmqF8ZL9XUAiul+HEVwiVciwOD+AzJXUsqlUwsq39MIAg5IgZMSLzA2gfJvDmW1JQtoF72fDQjRoYZ8fc9pwa4JQaslYaLnX9EiCtXxVQgMH8rTsFY5tsg7fWRlHHK6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713959986; c=relaxed/simple;
	bh=CTNLNJCzssEBPrLBmIjUwAVrBx5k3+i3f15WTz+ieo4=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=nl2tHLx6xh9od66rKm4ohbk04Xc/Oz3J4QzhklMm+Cf/eVngFZqL+g8sT7i5mVGAzRLU8A4tZ8Ps+jEFR80sHtXp2TvV8Fa7uVdxqLHUO/fC5BV6YjUxKkynxGYnONNpTB8Ayzj31dKkbtgaVxkbsYqeKRtwfUY+Fx/Mm0+TnjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=QGpn4ptS; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="QGpn4ptS"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1e834159f40so50581005ad.2
        for <chrome-platform@lists.linux.dev>; Wed, 24 Apr 2024 04:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1713959984; x=1714564784; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2rTjuUoKzT1cLFVMgm/Y0kVnmcDZDcso7AGNSFDnd1A=;
        b=QGpn4ptSqcwfej9uubYozf6kkeLn1rcYn6etAapEgZ+k0Wymc3UIbfZtmMA1oBRsQp
         C0ef19jm06K+Iv1bcHo73hnx8zssWr9beWytXf+bHr3RRF4MDRd8j5EF8P+4JCp8LkOD
         ZPp7Z+WNyT7vVJ7Y/ogiavMjuEmEfYaA2lJI3IoYbZR2im+u8vq3G5wAH8trDc0YdeWk
         6/HMO+GZbUnNpMXq3dvu9BeeYAiMTxKXI0TMlTSSNSYi9g3zaWl94gBMWFQ2IqRvfNtb
         YY7IS7lDUEmCXC7eY4kCKg4r96jMhUuRc52UO99Wx6gyn96ruJswZ2UDws9Hdj2u4Xu9
         LMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713959984; x=1714564784;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2rTjuUoKzT1cLFVMgm/Y0kVnmcDZDcso7AGNSFDnd1A=;
        b=GfYRNoxt3vjglmR+bQi60M76HCPiGHJp2y1Yg+KAUW7mGV+CbfCfvHYSxyCvvGbcSc
         YLghYVU3P6v5i+8Z1Ym+RSv2/qPGzNV9+gQLsFPFjonKZC2Us+P95jhnpzTpEo0ByTH/
         gjrNJtreygdaJz9QPoF76w/lz9imaItHVN168fQcWjIox/SWsKR1Q4ibz7dZZg8+DReB
         42riZqcSrttmd0uoAhgzhAT8h429G0WbuTE8Pfn35Hy5hyGSr9jDxMGA82qOQ7CiKuuj
         eCWtVqjNTI8AdWWkVDkWnFENxIXTg79NDWByz42tZoJikKevDATrYS2rhmy8N3ZvOvh7
         uQKw==
X-Forwarded-Encrypted: i=1; AJvYcCVrvnieIug2TrA9aS8Ol7xYUpRsa54WUwvf+fC2XLP1uxPktDtSYah3QXZMKuIqOTtnv17wNVOX7l8NH1fmMmJz42WXwc12qThgiA4MFzQa
X-Gm-Message-State: AOJu0YwSWQgZUGSL62ovyDieVvJ5hCAn9lZD9HvJ102RIQrKcjv4YVki
	Agan4A198MICdSb+xcMgTqKUwFsUT2Km0lbJgwNcisq1/3ijcZjXa7ZFNq0uGms=
X-Google-Smtp-Source: AGHT+IGWQTaRoOa5hszeqt1o+BytwLbQx/FUh7UkCQfCVYn1NXNPkRLtFvT08fFoqqGoGjAgltDmJg==
X-Received: by 2002:a17:902:ea07:b0:1e3:d8ae:df39 with SMTP id s7-20020a170902ea0700b001e3d8aedf39mr2247503plg.50.1713959984203;
        Wed, 24 Apr 2024 04:59:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id y24-20020a1709027c9800b001e0d62e077esm11759156pll.247.2024.04.24.04.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 04:59:43 -0700 (PDT)
Message-ID: <6628f42f.170a0220.3b339.7fd2@mx.google.com>
Date: Wed, 24 Apr 2024 04:59:43 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc4-21-gc8f460d991df
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci sleep: 5 runs,
 1 regressions (v6.9-rc4-21-gc8f460d991df)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 5 runs, 1 regressions (v6.9-rc4-21-gc8f=
460d991df)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.9-rc4-21-gc8f460d991df/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.9-rc4-21-gc8f460d991df
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      c8f460d991df93d87de01a96b783cad5a2da9616 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/6628e47ae5bb2da4804c4302

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc4-21-gc8f460d991df/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/sleep-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc4-21-gc8f460d991df/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/sleep-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/6628e47ae5bb2da4=
804c4317
        failing since 30 days (last pass: v6.8-rc1, first fail: v6.9-rc1) =

 =20
