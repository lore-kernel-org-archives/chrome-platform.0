Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998BDA56
	for <chrome-platform@lists.linux.dev>; Mon, 22 May 2023 04:38:07 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1ae87bdc452so16483265ad.2
        for <chrome-platform@lists.linux.dev>; Sun, 21 May 2023 21:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1684730287; x=1687322287;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l2RT2Owz4qx/KcMi/a4TkbUNJTUsNB3sEyGIGI8P7z8=;
        b=QFmtk/leIN+nDCJlwUeCId8VywKIijPg5NqA60ehSIWqFHjWDiuop6iltwff9KpGuQ
         JB5ioqq6g6FkdGvIS88egYn1WKURvjReLZOIKxf/913cqtL6BOl/lz6+mGYqBfpTXnBC
         DD0gzzOrALZYhm07WXGGbW3vFvOQe6W0Ag4AxNgUiMoiDkNOXay58aNCKB7fCTamKkZf
         pCBiOw778telZ5kRYaHXJltgQlz0ODw+zapdbBmi6Y3U1a2nEz8NAUcJ7lh5K+Go3Utp
         +7JIhKyIgepVk3D4hift1hkmK2sb46L7BECTbeckqXHVQ3gLAc0FsQQcxx1WY/z81g93
         REOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684730287; x=1687322287;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l2RT2Owz4qx/KcMi/a4TkbUNJTUsNB3sEyGIGI8P7z8=;
        b=D43n7wvA7P4G9DKw4SzEI51GaK2gv8JFIa6DksrajgIM2qYtZbR6KPL9j0/KpgD7QD
         EAateMjIuab7I/IFtoZfQddSO48mNDgW1dV3BgbK6Lfb9CqDYd9sySQENC9l5tTGJIom
         5fOGA5iZkHos0VV2sLCTdu8SU3hnZZKuSnJknkQF+7gjEglsVwq18tw/x+/Cr2m4aeqj
         hDU9LsXIiZxEwLCVmu5E9Pm9N7sJUOXZFkhmTZ5p+MEN7yt9xFkUyhnkMAguS/NuOeMZ
         011YqojatzCtIK7SxLU8xvlNMADqIPdJaOERIdqAmAO7fbyu5vB66JwS614byi5jbcQR
         uVbA==
X-Gm-Message-State: AC+VfDzHf1ZNLjPg9qLk0BrdD07A1EK6ae20FkGoQkyIESKYs+WE14Pt
	8HWstXTWhsiiiDbS2e0KdWutsg==
X-Google-Smtp-Source: ACHHUZ6teDvwRAy5Ja0oL2DjkEogcBSQQ1+yYyhUOd4XvP3V34bzqXbN2QUHEuPp2mNylLd03/Z1XA==
X-Received: by 2002:a17:902:c407:b0:1ae:7421:82b8 with SMTP id k7-20020a170902c40700b001ae742182b8mr13206689plk.28.1684730287023;
        Sun, 21 May 2023 21:38:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902eacc00b00199203a4fa3sm3719888pld.203.2023.05.21.21.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 21:38:06 -0700 (PDT)
Message-ID: <646af1ae.170a0220.71f80.5bc2@mx.google.com>
Date: Sun, 21 May 2023 21:38:06 -0700 (PDT)
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
X-Kernelci-Kernel: v6.4-rc1-3-g4b9abbc132b86
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci cros-ec: 9 runs,
 2 regressions (v6.4-rc1-3-g4b9abbc132b86)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 9 runs, 2 regressions (v6.4-rc1-3-g4b=
9abbc132b86)

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
ci/kernel/v6.4-rc1-3-g4b9abbc132b86/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.4-rc1-3-g4b9abbc132b86
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      4b9abbc132b86e2ce65090798186836f48f33382

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


  Details:     https://kernelci.org/test/plan/id/646ae0094e597bc3a22e85ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230512.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/646ae0094e597bc3a22e85=
ed
        failing since 13 days (last pass: tag-chrome-platform-for-v6.4, fir=
st fail: v6.4-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646ae0b2bfeb24ecdf2e85ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230512.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/646ae0b2bfeb24ecdf2e85=
ef
        failing since 13 days (last pass: tag-chrome-platform-for-v6.4, fir=
st fail: v6.4-rc1) =

 =20
