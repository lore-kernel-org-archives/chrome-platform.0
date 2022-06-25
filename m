Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DCD7A
	for <chrome-platform@lists.linux.dev>; Sat, 25 Jun 2022 14:35:32 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id a17so4507767pls.6
        for <chrome-platform@lists.linux.dev>; Sat, 25 Jun 2022 07:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=PX1QyHOfmSzwVX+Jt1FlSp9TzpUf8GtOsKfDNz0Bm1I=;
        b=VYwyCLKnUEP37iClfZ8DA9prCJ0j+Gz3sPMhOnZjJmkr2lWfT0KuukbGYaPIwHTiTA
         Sts07CRDqgA5nn6ryYoDvqjVUhVLzWrKsWlrYviu0nF3ECj3w8hpXjEWNtivxJ0iMyLa
         e/pY1k0OuhJJ1O+SBsnOGIgYRh7rFha2PyZLIdb1sVEPyTF16IJGME7+O0xTaYPmazTp
         lslZwMShed+kZD9rwrBCjOwMK3D/wqpNLPtrA5ra986Rnev7CXVlsN4q9ngXvA4lbBfE
         Lzso8qbnX3+04S3ojcpDVx09rFAzUPeGLq2EVTcD3Cp40mHolDYuYyUV5+cphcvdv6xu
         98DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=PX1QyHOfmSzwVX+Jt1FlSp9TzpUf8GtOsKfDNz0Bm1I=;
        b=aOquMJss7DgRLswicUX96pde3NV5cvYJCx4vdr6Zg4kKLy6CC8JHeJrhGuHnmS/x7R
         N68jwFP6IJpkt92LBOV9mdsiAMuZdaSWuhq7b434m4Bb/NzM6lna55xRdouB3hXYrFNk
         3E2CNLwY0YeR7qJIuEnCxE5NA7ocUIVg9wfEqmGN/7kX9QmSor4gPXKOfSxIOLyYVtXb
         D02TOyzGRSeRU4vpMRV+PZqCC0qTorKRc3kRhtiOXkYhiSdZmoOesHpQIfAwjCbGgMsk
         bM+AA8cH5zUou0G8jlpVndKlqhbPNc+cReoVeru/GxhtLrMY9zhUBYhUgPF39HSKERpa
         dBig==
X-Gm-Message-State: AJIora8hLVR9WZWmgDc/upNFd5RClJI7M4Z2g0XbDgecVMRNGbkZDZ+W
	UxES8Ni5nU/rlVdCphJIu4WkFA==
X-Google-Smtp-Source: AGRyM1u8W4llztVXw+vKRuyiZvWMPNSOfsQP8wADBHDWEyTLpZMuxwxjeDqO+CK6trDCE1ffC2Mw9Q==
X-Received: by 2002:a17:902:7c06:b0:16a:755f:86dd with SMTP id x6-20020a1709027c0600b0016a755f86ddmr4630515pll.82.1656167731582;
        Sat, 25 Jun 2022 07:35:31 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i5-20020a170902cf0500b0015e8d4eb2c5sm3776620plg.271.2022.06.25.07.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jun 2022 07:35:31 -0700 (PDT)
Message-ID: <62b71d33.1c69fb81.f4e77.53b2@mx.google.com>
Date: Sat, 25 Jun 2022 07:35:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc1-38-g15288cf9f149
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci sleep: 7 runs,
 1 regressions (v5.19-rc1-38-g15288cf9f149)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 7 runs, 1 regressions (v5.19-rc1-38-g15=
288cf9f149)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.19-rc1-38-g15288cf9f149/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.19-rc1-38-g15288cf9f149
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      15288cf9f149a0264eddd61c0af5d5dd9aad34d9 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/62b711518f43a72b03a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-38-g15288cf9f149/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-38-g15288cf9f149/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220610.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/62b711518f43a72b03a39bce
        new failure (last pass: v5.19-rc1-35-g412b193d93912) =

 =20
