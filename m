Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF0619D890
	for <chrome-platform@lists.linux.dev>; Sat, 15 Jun 2024 03:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718421083; cv=none; b=orj5NsPpJo4irphvyEjghuGwSBFRyHgasLiAbMSu04zwTP5hBX+QDxXOtjrs8y9U6O6Jm5Lhgz+b/gEshx9cp3Yy3txNmJYnAyifRZ/N77oKyRxYrRNi9VlM8A4hSjM8//Bb95cPLJ/qCXn2x1CyL1cWyHNNyxnOiUL0Q8YqYe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718421083; c=relaxed/simple;
	bh=gTjvemVchtumRMGW5xWqHqu3x/fG/Y8cbCF0kKdeZew=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=qr0abAUo6miU0r+v1bNkiJcO7LdeZqCC7pkhxqLxo7YjZtR6kmWT6JEIYYdTOPGu2aBsTgTWPpZ4Bl9h6snqrXeveQFB5G55H5LvZOD2Y7NskF8vm3V2GeUmo939K8+3efDo37KfprqsPR6Lhgzvr1n50Co1eqY1q6j8Z7brR+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Lv81FNSs; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Lv81FNSs"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6f4603237e0so2044376b3a.0
        for <chrome-platform@lists.linux.dev>; Fri, 14 Jun 2024 20:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718421081; x=1719025881; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wuwU8bewevg06SyZGMyQdTotW3js/9CjjBJZ+RU1jsg=;
        b=Lv81FNSsp8Q29sE41pvq3ooH9FCfFEDWy1Pe9s98vSQMlY3GIC2lEWaChIg/1O9iST
         buoURYDhIp449onhDNaJeLdUd06pa19d1ARwcBiRLp+0cJPZVqTFmqvVchSNgnJKC1EM
         /Y9UNXN1RLjLbcJRWxtWZ7D0DeEsV5pIcSD4vwTIAfvMK68avitibNe+8yZcyw7gsMGc
         c8c+FcVAaTjENLjVnUYhOumrWGxqSRLJSMu7kmU4SnUPBwI9mzxCseqmi5yGUBqFow6k
         DBnjiRkKE8+wBssyDoPMZ2x3eO1yPsFgqcvDaqIZXIXD28Dwbv/LcYGDZQM0NDqnVtrU
         R/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718421081; x=1719025881;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wuwU8bewevg06SyZGMyQdTotW3js/9CjjBJZ+RU1jsg=;
        b=W37h4jkPr5JNi9xuzK+owtiXsICwndtPV0NnkBaMGHGJRXo1mNOENCMRGK630LgJ/9
         hzbTlvpIX/yBX5eC6VOT4TF0aoVfVKQlEU+U8wm3PEwlfm3Mti/XJBQuCTClClmYxhHP
         o8Uf+F3bFctPd0cLy52+BlIMEbk4zGspbFFn506sfTVyXqHd8Xm9eJZVO1+icCnOAGIq
         0qhybKq9txRWOTU9YB8+/alC2awNq0p47/m28DRW3VBu9ZO5p6l26LjWusXUgWDkKkNu
         Bi/wGNx9g79vl86vhltBfvcr8qNzH7o9Yx8d6/L/PEcFtNlgNmuHvH3aomVpkMg07DaV
         nDwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzbNYboum09zM5jHMGpLPZcdE71YKlsZVpOfqQ6h2hrmDdzEpYgqLLFZpFo5qWCeOmMuE2TeDsUucYJCRl4C+JRZBUgOAVjj1DJLBaZahR
X-Gm-Message-State: AOJu0Yx+obWTT9rDCWmG7dZ4stBHpox5fy8qr2tLoLmJu4arngSp7+ao
	7s1Ovl0LglnAQvdeH5K9KNRytrOTlmiS89iqHxirxduFurRazT5PTPisirFjCcE=
X-Google-Smtp-Source: AGHT+IG99i0soI6oB/fLLFAHKrClN+BlU9iuasfaTWHEoW52XScbJ/HHOQy7qmr0PRfLIeDncwGcag==
X-Received: by 2002:aa7:8a41:0:b0:705:9669:af1f with SMTP id d2e1a72fcca58-705c93fa07amr10278411b3a.10.1718421081052;
        Fri, 14 Jun 2024 20:11:21 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc964acfsm3769946b3a.45.2024.06.14.20.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 20:11:20 -0700 (PDT)
Message-ID: <666d0658.050a0220.d41cb.c434@mx.google.com>
Date: Fri, 14 Jun 2024 20:11:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-20-gb57cd5703a16
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci sleep: 7 runs,
 1 regressions (v6.10-rc1-20-gb57cd5703a16)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 7 runs, 1 regressions (v6.10-rc1-20-gb5=
7cd5703a16)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-20-gb57cd5703a16/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-20-gb57cd5703a16
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      b57cd5703a1618e87772094ac12c5ee7d6c35e2f =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/666cf701504cd4b0fd7e70c2

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-20-gb57cd5703a16/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-20-gb57cd5703a16/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/666cf702504cd4b0=
fd7e70d7
        failing since 81 days (last pass: v6.8-rc1, first fail: v6.9-rc1) =

 =20
