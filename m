Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3476748A
	for <chrome-platform@lists.linux.dev>; Wed,  8 Feb 2023 20:27:31 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id v18-20020a17090ae99200b00230f079dcd9so4227251pjy.1
        for <chrome-platform@lists.linux.dev>; Wed, 08 Feb 2023 12:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JjKJL2r/1F8KnykLFuvRsUJD+7xJ2IgC0X5qg8mIpKM=;
        b=oYFPRDASjrQQJK29r6I+c0VimPmulvqgO6HqSDrZcp/axbcEOMi2ZuGaOYMi6ii4MQ
         QSQ1eYJTPPC6v5P3CtpzGaevU/maufkXpk2pKhayhKF/2q0b6mKtzQeQV9/ldMfoKwMe
         qhh0VQ965xi8hI1dOzlhajfh5lPcVakZgUMhNUnPqD3PiksnDY4teG0Y0dzP4FZR5GUT
         jrpBn31YKqEfiXrngIiFL7F0o0XkIWAW3JXTgh0v+UZn+qHMoqQ+11+3GcznqvATkEs2
         JTdbyVALclLEC18OnR5fG+A098SlOS3Pa/pXlwkjteLdAPJ8t0UrExhJTVg1vFYRbTTe
         G2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JjKJL2r/1F8KnykLFuvRsUJD+7xJ2IgC0X5qg8mIpKM=;
        b=Wss81ablXB+qxWIhYpneUwhRJRHgCCjlJ/W+KnMF3FVHgW/77AKnFpsdezxrb9mKef
         1Qu2g9DTdLrfvvwrwXAhT1XURGNR9lLVfYJYu77BdCLTif1vvlRDl7adfkWwZ+uNVuqv
         vl9MKl5aY3Ihk6jQapg9eA8hSkXZGESst7Ju9CDISeOZmgFFTElXClF0xmH2bpF/iznR
         RtebmIVYdL4gQuZj1JXm8LOrytskQK6j5eDPSvC83Y+wfimLcyNoyejr2KtVPveCGxM9
         4mURjq11NFvSnoGI/mRht+t3GtBEoGrhFroLMvmsm9V0vQ/lXUNtheseRipIzh+fQJu2
         3UHw==
X-Gm-Message-State: AO0yUKWLy2nJsqZL7TKRu+/HwoA38SGDezxTsd4TtPQ9CSCSuFTR8J+Q
	h8xSyDKPBmJMwfY1RTnhrSR9Dg==
X-Google-Smtp-Source: AK7set/Vu/AajEtmORKHo0+wHRyPfUucm1WyFEigXpo8Ky4egQ+84bxbeYvKIRg4XkHf8r6IVJr3nA==
X-Received: by 2002:a17:902:6b81:b0:199:bcb:3dae with SMTP id p1-20020a1709026b8100b001990bcb3daemr6850262plk.56.1675888051169;
        Wed, 08 Feb 2023 12:27:31 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id jk4-20020a170903330400b00199556336c2sm500622plb.158.2023.02.08.12.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 12:27:30 -0800 (PST)
Message-ID: <63e405b2.170a0220.fd0b1.221a@mx.google.com>
Date: Wed, 08 Feb 2023 12:27:30 -0800 (PST)
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
X-Kernelci-Kernel: v6.2-rc1-35-g75a273974d7a
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci sleep: 7 runs,
 1 regressions (v6.2-rc1-35-g75a273974d7a)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 7 runs, 1 regressions (v6.2-rc1-35-g75a=
273974d7a)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.2-rc1-35-g75a273974d7a/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.2-rc1-35-g75a273974d7a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      75a273974d7ac814b655eda546c62064a4b41d34 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/63e3fa49bd52e2b2a58c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-35-g75a273974d7a/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-=
rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-35-g75a273974d7a/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-=
rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230203.0/armhf/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/63e3fa49bd52e2b2a58c8630
        new failure (last pass: v6.2-rc1-34-gfcc9e52d591e) =

 =20
