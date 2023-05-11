Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F338B1640B
	for <chrome-platform@lists.linux.dev>; Thu, 11 May 2023 23:08:18 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-64395e2a715so9270852b3a.3
        for <chrome-platform@lists.linux.dev>; Thu, 11 May 2023 16:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683846498; x=1686438498;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KUCB9lbFE+R34yjgxt6IMaBJF/fnF685/o90pD9cA64=;
        b=XeXJr8wjiuvYZbISl4yS4CJW/CpSh+SNbD3QdYWjipqgTgY8k39q0hAo+1dstwK4Qb
         wAZ2XLH7fc7tZb1EzbYWQrbBga+gLDRIl8kM9RsU24Ls4mQzsjPWrC4UyeWhN7Y8IVns
         IhLH9HqSj/JuYlaXS+3d+fr7cerZoXssDB9moVLZsvkyr1XCkDMBbONWZVCfN8DQV0kc
         cJ2wyOX28BQu8OXAr7RId+4DMyheL0mK695xfTU/B2tbd7J+OYWoZqe7XUGmAW+fi3qh
         Q2dP+w9kEWqNxLSr7cRpM19j3Rq4UbUDeP5fyqcmQyNjl9SYEgTxHzuDTrsnYPZAOrF8
         BVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683846498; x=1686438498;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUCB9lbFE+R34yjgxt6IMaBJF/fnF685/o90pD9cA64=;
        b=ayrIs+JIsz17t2lWL7SbqsxMXXvjkMp8b1oYHdNXXMBRie9oZdLit23TY9d2XU2DQ2
         xKEuBFX6RkQErhTOcvfSiF9ZOPW1+Gx4jiLgdXlC2jtz5+GL7459m74TPEBkDX9oimEQ
         URAB0JpHUTgLO/9Alhoc2SZjTPwIHk/tVwVm/a35rdAkd3Syk6+RvFuWsOuDvTT+48Sl
         atOingpvlJH1afPK3uTO61a2QHokfdXajddFP4qxGcA+0mSqc/+yxpEowbcjkd5yX7bS
         pXs7Hz+Q2RU+UGMDeye/rDeZ4DtajgsLf/JvIdGi65UmvuAatIl5lN5U6SNH0dXRfL66
         qXDw==
X-Gm-Message-State: AC+VfDy/mY9pkNjXM8rY/7YrreOVSrByRHqlFeJwXgn79xhj+VxkSwXQ
	eQlJm/4JwTc+DMcYT9TY0StBow==
X-Google-Smtp-Source: ACHHUZ48DYRGYBoFuYQIzL8FoBzsUC6G01Vos2hEXSAvKPJ4rHaEv7yQ+/VRtIUCoSCdHpAJXWLyOA==
X-Received: by 2002:a05:6a21:789c:b0:100:607:b986 with SMTP id bf28-20020a056a21789c00b001000607b986mr21634561pzc.56.1683846498395;
        Thu, 11 May 2023 16:08:18 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7810d000000b0064305676b61sm5732306pfi.203.2023.05.11.16.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 16:08:17 -0700 (PDT)
Message-ID: <645d7561.a70a0220.3ab4e.d023@mx.google.com>
Date: Thu, 11 May 2023 16:08:17 -0700 (PDT)
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
Subject: chrome-platform/for-kernelci sleep: 8 runs,
 2 regressions (v6.4-rc1-1-gc9f9c6c875d14)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 8 runs, 2 regressions (v6.4-rc1-1-gc9f9=
c6c875d14)

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
ci/kernel/v6.4-rc1-1-gc9f9c6c875d14/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.4-rc1-1-gc9f9c6c875d14
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      c9f9c6c875d14a107dabcf4579fcab95ed30af31 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645d6a2ae8002e64d92e85fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/sleep-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/sleep-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/645d6a2ae8002e64d92e85fc
        failing since 3 days (last pass: tag-chrome-platform-for-v6.4, firs=
t fail: v6.4-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645d68c3f1b4f5c89e2e85f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/sleep-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-1-gc9f9c6c875d14/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/sleep-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/645d68c3f1b4f5c89e2e85f8
        failing since 3 days (last pass: tag-chrome-platform-for-v6.4, firs=
t fail: v6.4-rc1) =

 =20
