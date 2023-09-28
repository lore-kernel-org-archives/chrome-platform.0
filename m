Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DB48467
	for <chrome-platform@lists.linux.dev>; Thu, 28 Sep 2023 07:06:24 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3af603da0f0so1046516b6e.3
        for <chrome-platform@lists.linux.dev>; Thu, 28 Sep 2023 00:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695884784; x=1696489584; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cQaq8iU369OAxea/rF272Ip2qwpIvmlOl8F6WBPfpMw=;
        b=WACmc9Q8V/LFQ2Uc4mxdFCORi/055m/gXxTy83OmzfQRznbYsk3qt2IZTDykpG7bg+
         xdwcoka4a4i2bhuRh+wp++amy2EuNW+qzoibbt7o/U3k5GsXnkxoLzQ7ZKVtv9Bd/Egr
         s7iee9QuJagienv6a4XIMhwR4V/PrlBdoDA6pOov8nXIuvnJzbPuSCamW7cBLMANjVTP
         Us1g9bJwPdR/T+X+VBWwZO8ZHY5M+AdD1hPif/C10TZ909j7IpaRAVz5K/OgtL+fSJAG
         XZMieglPOCQ2hL6NEpYUmrYXOc2ZBDFnecQ17nvNurAMgw28SWMdQymqxELw+lBsPfgr
         L4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695884784; x=1696489584;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cQaq8iU369OAxea/rF272Ip2qwpIvmlOl8F6WBPfpMw=;
        b=SpCMk4lZxUe8wEiOIsV4zqu/zfpQlJC/UL8amzM1EvJ9/1PKHjZ7evGRN1DVUO5m3e
         BNW3WrtqRDrrtdbsjXGBhrEMGpSH0m0M/lOIUCLuxb+6UB5YPSRc4mRJEWEiD2myw9sW
         84ex7QQoZBmPRZQCVhIsinY42VlsKW5mw1gMHgRrnVR69VZzrAHwIZKQRJ1R/bE+Hs0K
         EtNLihDHt/0XKNAY1JZbcvu4Dz65aK3DbjxjYeiwZ989WNlnilv1TyrT9lO9q1xxAb85
         B+ECMHUoaqIGJBuNrCCbNY3qK5u5SUCjLeDVx9xowbjbQgDni/rjRGzEBVPtLiRDMm+Q
         HpiA==
X-Gm-Message-State: AOJu0Yz7MIG6oHKzgwU7Dkx2S0WqvlO1MCjP8rEYhpnifqtPN3VdhQoq
	3Bh3LhXyQj+Nm3ZXqc+FksArwQ==
X-Google-Smtp-Source: AGHT+IHFg7LfeIS5E4S8dbYUE5Tjyfgx6h9yESFWLfWF5tyoZUZU4IA0W7mRjbAlAooacyJchPu5UA==
X-Received: by 2002:aca:2315:0:b0:3af:658f:14f9 with SMTP id e21-20020aca2315000000b003af658f14f9mr388625oie.41.1695884784212;
        Thu, 28 Sep 2023 00:06:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id m13-20020aa7900d000000b0068a6972ca0esm12758511pfo.106.2023.09.28.00.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 00:06:23 -0700 (PDT)
Message-ID: <651525ef.a70a0220.9cd23.438c@mx.google.com>
Date: Thu, 28 Sep 2023 00:06:23 -0700 (PDT)
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
X-Kernelci-Kernel: v6.6-rc1-13-g7396a5b980fd
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci sleep: 7 runs,
 1 regressions (v6.6-rc1-13-g7396a5b980fd)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 7 runs, 1 regressions (v6.6-rc1-13-g739=
6a5b980fd)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.6-rc1-13-g7396a5b980fd/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.6-rc1-13-g7396a5b980fd
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      7396a5b980fdeb2cb97136db45405b4fb5d21dfc =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/65151969e8d8de97228a0a70

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-13-g7396a5b980fd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/sleep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-13-g7396a5b980fd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/sleep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/amd64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/65151969e8d8de97228a0a71
        new failure (last pass: v6.6-rc1-1-g1aa8df90f456) =

 =20
