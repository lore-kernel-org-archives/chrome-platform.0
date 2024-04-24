Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F4215A4AA
	for <chrome-platform@lists.linux.dev>; Wed, 24 Apr 2024 11:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713959086; cv=none; b=jWcp9aYna+1Ie/pV/hJh3ytHoprcjnp4Fs3Qvy1N6Wv/bFA+URHhechEPf/UaDpkrrQHIefvLSuw1q6j1n7g4/TL1OZVn1qufGNeBwyYayvmFf3g22p8jClKitdlKOL2gdxKu5fMxfC1b27qakzTqfn09vDIyfwbZU7in+gv2Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713959086; c=relaxed/simple;
	bh=Pw8K6uuzdcz1rdh8gzazG60PPWuPEa/IOe4+gigrnIA=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=XfCLMKFkPLabbHjySPud4MPy8lCumrqW3WfelWL6CwhROia85qKZ0+COfr9CSa8rMH4JntlCEIfU2qmQ8xE0MWVVnXxFP1miFygD6Z4Je3EoAXs8Qf65ioPGecRASiYzI0K9dImOgZWjRlZ0TsymMZE5KpCj5ABGOpGzGNOwxuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=BuRsC0P9; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="BuRsC0P9"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6ed5109d924so5736322b3a.0
        for <chrome-platform@lists.linux.dev>; Wed, 24 Apr 2024 04:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1713959084; x=1714563884; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bGnsT6fwN28iW4EDn2WXtUAFjtP7lPI3cYh2dC7NYe4=;
        b=BuRsC0P9FgDPv+6QgUEHjr+FQ1BsZaRrZfvtJiank8wtEd69rrf4YcbWI+5DaRZ1zh
         QNBkm1wX6J/346RGosUkLgQtdCrxtTw6EaOJ3T7oQq4XyCMUhR9uejO9Lw3/yfyta42Y
         /s6KO8qLInS9WlW9hECWV4BL5Ab3E2uagFo1/PLO7YNrxOuLDFQt58a81Dli4CTP6M5N
         sEh2jX48jUO9g/yJDHpQwImY2eZ1QRu57DDNfsdJFcFkO0Htn7Pzx5fIa3YxejilumUy
         gDBZjb2xcndb4jjbs4q3yHJPd2i6TWZ+Wh3u8l0XkDpJ9mkBdUuxT49nzmo6J5snnrsK
         E1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713959084; x=1714563884;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bGnsT6fwN28iW4EDn2WXtUAFjtP7lPI3cYh2dC7NYe4=;
        b=pkqQDgVWzTgcAEFG/5L0NSr7XZCuAZH/7i7MPSw1dpxeAQUZzk+QY1jzbIu/30v68L
         ycH5QnmBITczGYc8tUD4fXD3ji76ct1lnTS+JrywOlmDM7JFyFmnWUEbsTWjHW+nE7Ev
         Per/aCoeHLnZbvj0lPwi/ipKs4aBX2QEpnqzWbgggjEMDZgPUru8m+Bz1/U3e5jHSRDt
         XaIO2R9rngr7dFnxGvuFpUXIEqqiPNlzezIpYZWN8KdeEBehknf7iFeQ6kZeSgdHzTfu
         MjE/dSbbYOtt6HWGulnWsSKSrwPxcVeV7aeD7OiknVwAZBK9fZE5TkDZhk9VHvs6Ib8Q
         VQ1A==
X-Forwarded-Encrypted: i=1; AJvYcCXltoYy3bBMIkEwh7LfDMCJ+2QPLPQcVutbP2GOQp+Z4P9mlKOfLFkTT4b/ctXsJ0sbg3WuEo4Q+dfj7hWmdZmMSoWPK70UCleTfK8MdK7w
X-Gm-Message-State: AOJu0Yyb/zuxzTbSWWv0PQjfjmsx3ewg1UcjdDpoYVXXYHgAnUOd4oub
	BzIqntatOw1G/rDAyCZFlOMcyYjl300Lp2aSjOsSfuTbUYrR/8zlJEkO45TJEM8=
X-Google-Smtp-Source: AGHT+IGBlO+Rve9JqNuFHthbhZHNorIO2T1goYn8KmAvXr2t/TeZH4qPNPF2QzVc6tq+5RtkJfhGZg==
X-Received: by 2002:a05:6a20:787:b0:1a9:3287:9180 with SMTP id i7-20020a056a20078700b001a932879180mr1707595pzb.52.1713959084582;
        Wed, 24 Apr 2024 04:44:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id i14-20020a17090a7e0e00b002a78cad14a8sm11090918pjl.30.2024.04.24.04.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 04:44:44 -0700 (PDT)
Message-ID: <6628f0ac.170a0220.51a7.550d@mx.google.com>
Date: Wed, 24 Apr 2024 04:44:44 -0700 (PDT)
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
Subject: chrome-platform/for-kernelci baseline: 70 runs,
 1 regressions (v6.9-rc4-21-gc8f460d991df)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 70 runs, 1 regressions (v6.9-rc4-21-=
gc8f460d991df)

Regressions Summary
-------------------

platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
juno-uboot | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.9-rc4-21-gc8f460d991df/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.9-rc4-21-gc8f460d991df
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      c8f460d991df93d87de01a96b783cad5a2da9616 =



Test Regressions
---------------- =



platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
juno-uboot | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6628e3f6fa33b295754c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc4-21-gc8f460d991df/arm64/defconfig/gcc-10/lab-broonie/baseline-juno-u=
boot.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc4-21-gc8f460d991df/arm64/defconfig/gcc-10/lab-broonie/baseline-juno-u=
boot.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6628e3f6fa33b295754c4=
2db
        new failure (last pass: v6.9-rc1-17-g3b89336c9ccf5) =

 =20
