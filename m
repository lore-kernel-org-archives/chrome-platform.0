Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED0B3FDF
	for <chrome-platform@lists.linux.dev>; Thu, 11 May 2023 23:38:17 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1aaea43def7so64678065ad.2
        for <chrome-platform@lists.linux.dev>; Thu, 11 May 2023 16:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683848297; x=1686440297;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MrhxFL8dPU1RRiftRdfy56Qu4Yq8NvQ+d8zPgLXi0Ww=;
        b=3lacmkx147POOBGkSqCe5Tieb2T+hBW3/kbH0kcBrwnlhDmHPpbsEbcq5axk0nUuOI
         /j0mDZib9fx/YQR32jrM2xoy86yT/W8CMeWBJgqYP+CIXtIKrQcrybTq7Ph7uGbHuaOq
         ktae/g9Xw19/TOTOEoLBCNUXza/d3mGj0pcpZZ+Lr3OmnRCbtBq8sYW1SpiOrkP9kCW5
         gMeBeG+6K7UKb5jlACeU6sK2KykuFh64cNGotHLRGP5lg0UNEvEh18pvoqv0cJRxvJJw
         QXs6NbX1nwj27DBuVxkxxSGjtFzbgH/hmPVVkmaFGvLbOjqKC9mcpVt2mCFidQUecHYM
         Odww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683848297; x=1686440297;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MrhxFL8dPU1RRiftRdfy56Qu4Yq8NvQ+d8zPgLXi0Ww=;
        b=CUDqGAcfTMlzpZAasYE3nR+RoKIzbBVQ9MOW3L+oERqsuI0iiaBWBzoLGBQajEz43a
         LWWXKn+MZyKxQG0BTDCHjtP6JCzJZYAhMl+lXXu3Oqa35ecqqArG4/7bfPJlaK5+aPYn
         l/EgSGv5SzGvQPjE8X0u+fgUsOJ8fSEoxLs+yLdc0CVuK13awtzXC68n8xxE7Rb78Dwj
         Haa7OMhtoFxuC1c0Llmy4t7lHxSYY7NYy3iBQcPyilnbAPwcn0UiMGj3LTn/OyAGZPJ8
         heaI/iIqc7i4CEpEzml1ibQ0U0K8dsN7EmINk23dToyqGlRPR1oeBjQ0RaZ5yubAhBp5
         clLA==
X-Gm-Message-State: AC+VfDz7emCcnyEpyyq8cvuQCiWL8cURCe5KX0ycisFmOBv+FSOxu+Cb
	2rLsJvtnorBKZsB9t0ShL0OhZQ==
X-Google-Smtp-Source: ACHHUZ6CwaVSwkCMtKpXbRf9JPpeEfEmYaoTMYcfmuQHHqELj0CivfYPcfyEcWhn4X9s5VbcK6Mjhg==
X-Received: by 2002:a17:902:ced0:b0:1ad:c736:209a with SMTP id d16-20020a170902ced000b001adc736209amr4417668plg.56.1683848297473;
        Thu, 11 May 2023 16:38:17 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c22-20020a17090ab29600b0024e49b53c24sm15675939pjr.10.2023.05.11.16.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 16:38:17 -0700 (PDT)
Message-ID: <645d7c69.170a0220.4056f.f4f3@mx.google.com>
Date: Thu, 11 May 2023 16:38:17 -0700 (PDT)
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
X-Kernelci-Kernel: v6.4-rc1-1-gc9f9c6c875d14
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci cros-ec: 10 runs,
 2 regressions (v6.4-rc1-1-gc9f9c6c875d14)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 10 runs, 2 regressions (v6.4-rc1-1-gc=
9f9c6c875d14)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.4-rc1-1-gc9f9c6c875d14/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.4-rc1-1-gc9f9c6c875d14
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      c9f9c6c875d14a107dabcf4579fcab95ed30af31

  Test suite revisions:
    cros-ec-tests
      URL:  https://github.com/kernelci/cros-ec-tests.git
      SHA:  fad9423ae3c64bfd48c207de34a1177000d45fa8 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645d6a2adf0d1efb0e2e862e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230421.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/645d6a2adf0d1efb0e2e86=
2f
        failing since 3 days (last pass: tag-chrome-platform-for-v6.4, firs=
t fail: v6.4-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645d6a47a775c9b8ea2e85f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230421.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/645d6a47a775c9b8ea2e85=
f7
        failing since 3 days (last pass: tag-chrome-platform-for-v6.4, firs=
t fail: v6.4-rc1) =

 =20
