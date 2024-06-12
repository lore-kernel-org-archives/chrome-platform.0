Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7006F4D5A5
	for <chrome-platform@lists.linux.dev>; Wed, 12 Jun 2024 05:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718171886; cv=none; b=hA6IoadFsx+a8kNYx9nc5AJHRsJwY0PCdOCw14G3yy8vr5LfUPvcRozYeXL7cpI+4V9lCG8bO26qZ5A/Xyzyhg523S3+0j48toxvsSqoq8/sM951mQfmyyfALbLYy2yLwpkDM6HskpZzVdq0phlfkTXAPtmn/LBQ5iIpFxGNKyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718171886; c=relaxed/simple;
	bh=zVNajK622hhUXEN5Mrt+1VEv7sgQQPceRhEg0yh8BP8=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=g4lKPDXnwqJ1g/9vequzDC/LuNTmU3CeZZMvcj9ihrz+2+Ok9UYICoXnhVLcPpFZpTNQ9ZcTYiZjCcb7Z97DAcQ9ZwMDfi1QZRYm4Zq9dBQvzD2j4Qe5UeWS2ZDSqjFH2HV0hyOoZgCHioGuKZCcXEs2gXaaTSCXFvWoiS1FGRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=rAYG8MHo; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="rAYG8MHo"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f717b3f2d8so4137985ad.1
        for <chrome-platform@lists.linux.dev>; Tue, 11 Jun 2024 22:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718171883; x=1718776683; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mtgVsPmKJieAaBaF0y2n92eyGFC78Qs4yvTF8TqWtLA=;
        b=rAYG8MHoB7tNAAipqOirADVwY84WBqKwL4/RpDFpN2earpMX/sO6voTTMiZuRqn0hC
         emik4OQdTnazkpRwlV42okYjjuEA9bJrdgJJ5cMf7jGMbqJN8ZZ4TXEewtuQpjGYlobW
         kQbnbTs5wNWnJfZI3e8SjGnfzvoU7FKAfMsBZprDwfdAawq9aZg8KNkDn2IRjyJsHiMn
         mZrP0WRKwYBhTGtn8LZOIrqFTE0sHwPSjmca7LqP+GaFcLwmmtkooxSJM85BsjLsf0gN
         0YVJKtlMXneNO+SiGzGzoNiJ+yQ7pRSmMwEPQaD04KW2w111bOOajYU65DUQo43rCHS2
         t7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718171883; x=1718776683;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mtgVsPmKJieAaBaF0y2n92eyGFC78Qs4yvTF8TqWtLA=;
        b=H3pB5Z+QLHLSSPkV5rBpDVBVmj0PnNrVVNp0PTWNtFWYHs6fflPtu0htM+pld+VoA6
         5l5eja/do4KkGg3eJjhJtTYlHJ0EKHx7D0hmxkhEIhxnsBbPsKUwJVJH0uuIGGyVf9Br
         t2PhjIJg5z7moifn9ycHUhSdR4iBtciToVnz08yWaCf/Erdb+s00cdGZNjvmSTX/Yjp4
         +nb4IWS5poOgAT3zhIytxfl82Iu1HOUb7OWfzOOuJOJvWl6YQEF1/n57sZAPLUh3hdhs
         MF7RLw2UPt9vwybBmIynGLEP7/EyVW74V094vjtM3BvOYIQWlditT+XD+1h6Ys+y5M0v
         ImLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMZ+9Ge+WD+b8UleYNxySYMU5PGKJwx4YXrB0IDITfWaiKkC/vLtLM60nM4O7HIErnO2HQek6hjvBSmRon/1kyrNpNtMbcHxq3ly7gXu5D
X-Gm-Message-State: AOJu0YwgvfR0oJnFRgm4rr8WT343UDE7eRXt5jjBcOMYOE3qnUPolelB
	M81YD8oVGwTfbBSlU5psWrBV9BFQ/UJnFF+YHWguSJruAn4BTYogKzTzeJb7COuVJ71BGeMp2D/
	51j4=
X-Google-Smtp-Source: AGHT+IHNMpvgtvp2Vkqz5wSQSUzDxQ00wNtCI/3LV0PJ12HEcqg/ydeJQtbvWLode++K0oYPly36eg==
X-Received: by 2002:a17:903:1c8:b0:1f4:8a31:5a4c with SMTP id d9443c01a7336-1f83b19c23dmr17374465ad.24.1718171883618;
        Tue, 11 Jun 2024 22:58:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f728a74f8csm28956025ad.77.2024.06.11.22.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 22:58:03 -0700 (PDT)
Message-ID: <666938eb.170a0220.7a19e.a0a9@mx.google.com>
Date: Tue, 11 Jun 2024 22:58:03 -0700 (PDT)
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
Subject: chrome-platform/for-kernelci sleep: 8 runs,
 1 regressions (v6.10-rc1-18-gc2a28647bbb4e)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 8 runs, 1 regressions (v6.10-rc1-18-gc2=
a28647bbb4e)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-18-gc2a28647bbb4e/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-18-gc2a28647bbb4e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      c2a28647bbb4e0894e8824362410f72b06ac57a4 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/66692ca7e53488d1bb7e7073

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-18-gc2a28647bbb4e/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/sleep-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-18-gc2a28647bbb4e/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/sleep-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/66692ca7e53488d1=
bb7e7088
        failing since 79 days (last pass: v6.8-rc1, first fail: v6.9-rc1) =

 =20
