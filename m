Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7C12D250
	for <chrome-platform@lists.linux.dev>; Tue, 13 Jun 2023 10:26:10 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-654f8b56807so5444521b3a.1
        for <chrome-platform@lists.linux.dev>; Tue, 13 Jun 2023 03:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686651970; x=1689243970;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Xnj4dCPxRABC/7Htn8obAwk7VbeRekR7KQXlEKrRLl4=;
        b=Y/RWMu2WLi64gJOw2hsnSVKMzXaFakGMHUtFYtVnY00FqRtiWrEsscUTfbzeTFJ22R
         NF2RlQHAq3kR0iQS7UYPkqILlpxLn1/tytxf9puKZU0StzAuPV9gRMF5sfZ3DopJzexO
         1PPNpQrlNAaa34GYeZApRt3ZbGXzux9JTESsRyEgLxPF89dLGvpSBzjqvmWmkhX3xsPJ
         /LqcHmpoAeWjBNVos/A6y3mOOYruha81yjO+aZO2rN0mJShumPQpaiaOmBiuDgUnB1/J
         VdLWNlaIgq6IZYd+mgwvuKKRptUXn8SN04W6CyXwAugGM0uR9bklCEv8gwo28DGlfwNK
         R7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686651970; x=1689243970;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xnj4dCPxRABC/7Htn8obAwk7VbeRekR7KQXlEKrRLl4=;
        b=AYC3Y2w75gBK98taWecKi4V/lEJLd7m83AHnX2T7hWkg3MWuJIfsGD60/MRlB6PvEj
         dlpCh5ZX3OhBgd+uNiVK3QcLdn+OT3kxdUHjkZqViigxatuTxYSUyGyGFnQuP/IUsliS
         zx920oecXdZKI9Q3TAYxVgzRtG3kPyOmeS7t/wzAZC42Id1tdL8ybQuD7OvxWAep6mOx
         2CRk03J9oy5DqYbTBnw0uQ2RxPcFNX7SumRG2ZBfepc/G5ZrHqBPC7E53FP/RXeCEKDP
         ww3z+JN8nJF0dqbWbVyjpEWAp301A6LVn8pjJYqEjYv2u7uQbQeF8M+4EbLD25UBQinM
         DyRQ==
X-Gm-Message-State: AC+VfDxe9WJtQ5Gg0fGcJwf1gPuHLZoniz3CRPLAopIW+HWnBF7Kff3a
	3p8OSlP8W93pYfe+udPS0rJlbQ==
X-Google-Smtp-Source: ACHHUZ66Yx7ywW9I+dZTDG3XTFrmIXUTjcgi6nilquDTir3tLc9FsdQJpZv0WpBlwZEenHNXw43iAg==
X-Received: by 2002:a05:6a00:1995:b0:653:91c1:1611 with SMTP id d21-20020a056a00199500b0065391c11611mr14152905pfl.14.1686651970379;
        Tue, 13 Jun 2023 03:26:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id x17-20020aa793b1000000b00640dbf177b8sm8390815pff.37.2023.06.13.03.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 03:26:09 -0700 (PDT)
Message-ID: <64884441.a70a0220.b2fe4.02fd@mx.google.com>
Date: Tue, 13 Jun 2023 03:26:09 -0700 (PDT)
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
X-Kernelci-Kernel: v6.4-rc1-5-g2b8cc5858a07a
Subject: chrome-platform/for-kernelci sleep: 7 runs,
 2 regressions (v6.4-rc1-5-g2b8cc5858a07a)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 7 runs, 2 regressions (v6.4-rc1-5-g2b8c=
c5858a07a)

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
ci/kernel/v6.4-rc1-5-g2b8cc5858a07a/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.4-rc1-5-g2b8cc5858a07a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      2b8cc5858a07ab75ce98cae720e263e1c1b0d1d9 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6488376d6ae502e5ce3063ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/sleep-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/sleep-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/6488376d6ae502e5ce3063af
        failing since 35 days (last pass: tag-chrome-platform-for-v6.4, fir=
st fail: v6.4-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648838f377db897630306195

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/sleep-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/sleep-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230609.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/648838f377db897630306196
        failing since 35 days (last pass: tag-chrome-platform-for-v6.4, fir=
st fail: v6.4-rc1) =

 =20
