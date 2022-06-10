Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4876D362
	for <chrome-platform@lists.linux.dev>; Fri, 10 Jun 2022 04:59:40 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id a10so23107824pju.3
        for <chrome-platform@lists.linux.dev>; Thu, 09 Jun 2022 21:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=OULzv6ZmT+Q8hVXvWeMnTGR9+4upRX2klXdJlolBRiE=;
        b=YQffip7Mp73GeWnv4ZK9w5MlPscvKd0Ov+GdhGgPwj7CFLdvV1qVW+iWmwiVErnGc9
         iC5EGgDByxWG5crYtBDbLc3aSaFRSipbXpRsoKYMPEVT6bFmXolM4Nvt432QY6lRPYEs
         OZLu9GGl21u2YHeMhYfz5oZveeuvhSVFUjnHar63jPXUtxCnil6CQtCnwV0gN8oivfzo
         vVgwJXlTzMCdlB1hdJTuHMkOTrZPdxGpkiGCRbouv8BeYXarTOreO887lTS+rhI6cXhU
         nRiTWWsY5cbDEer6SyTlF8mqRR6A5Y+VcZ51JUcAQYutSg2aN4/04OGN6ZxA9CVMu5f8
         LlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=OULzv6ZmT+Q8hVXvWeMnTGR9+4upRX2klXdJlolBRiE=;
        b=xrtGPWAvasATZ8gHCPcoJx0t6hJhs2GA4SOUbR8xfpF68oTmHYCj6s2ezUFXQ8mOqP
         HlVSadvuDdrXBYOvYrpq7yClQEyyXndC5auinLgKpCPCQaZ0sXb4L3YeWrMhQztTDW2B
         IV5CCmrhq4XvbQC8PJdTUJpW2vI8V1ifOgx297BvLj5qUUJDPHwzr+QVUpqXeBJNjoyL
         r26YDGrhNCpQyKppNSTlIE+quYLgxhk2PrrsRV2e8wNX+2aVQMB3DqOrB2WC9mb3dhAl
         rFUjkewX86hPLUo22Z7FqSaiiO/jWwhxB22jRgLwzHMjcQfRyDbdJMdJfTy8/021IXQ+
         O7Qg==
X-Gm-Message-State: AOAM532QGU+e+bQjJuKJh6za5TBq/dM01GrPqq+CylyYVWPg6BSw7Wal
	fWHI6h3YaZ2nUSOEv3dNe6qDAg==
X-Google-Smtp-Source: ABdhPJzByuoYeOd8am7LuwlwfxM3V+e9LyfZYZbwPahS3MCa/MVK8+ejtehOCHp8jjsKRw5G+nRy/w==
X-Received: by 2002:a17:902:8b8b:b0:167:4e55:2dac with SMTP id ay11-20020a1709028b8b00b001674e552dacmr34842394plb.132.1654837179662;
        Thu, 09 Jun 2022 21:59:39 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b18-20020a62a112000000b0051c49fb62b7sm5474231pff.165.2022.06.09.21.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 21:59:39 -0700 (PDT)
Message-ID: <62a2cfbb.1c69fb81.6fc88.7409@mx.google.com>
Date: Thu, 09 Jun 2022 21:59:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc1-35-g412b193d93912
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci sleep: 5 runs,
 1 regressions (v5.19-rc1-35-g412b193d93912)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 5 runs, 1 regressions (v5.19-rc1-35-g41=
2b193d93912)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.19-rc1-35-g412b193d93912/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.19-rc1-35-g412b193d93912
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      412b193d93912055f2389500102f4bd75ba9b144 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62a2cbfeef005db481a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-35-g412b193d93912/arm/multi_v7_defconfig/gcc-10/lab-collabora/slee=
p-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-35-g412b193d93912/arm/multi_v7_defconfig/gcc-10/lab-collabora/slee=
p-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220603.0/armhf/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/62a2cbfeef005db481a39bce
        new failure (last pass: v5.19-rc1-6-gc1db0861e8d02) =

 =20
