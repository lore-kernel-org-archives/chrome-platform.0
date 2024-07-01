Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FEF4EB51
	for <chrome-platform@lists.linux.dev>; Mon,  1 Jul 2024 05:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719813040; cv=none; b=TsfpXO9+zPEKB04wZ95nm8Ccij/nIn4GW3lKBZ4Xb3+T7NF6tML8ME0BZNZVOYlZS9CbUzaQuVF/xaO0COH7NV6J8IVPi0mTJAOPHQxslIb/HRu9L57P08UTFm5GKTW/1n8Hs9iDjZk8dxiEOMeLiCh8fKYSNZZQMKpex4ShbDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719813040; c=relaxed/simple;
	bh=gVykTMsl79C8KSjQS3vaNgfgf+mImeQ2N5o7ewgcBN8=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=FyvqiXRM/ESRMajOUosOSobPo+VpEN2hX36tohSWLh/b3ZdYyVpQAGvVNjOCKqaFISpEnSDpZFMoPZicozVYBXzGTdBMfS+/4KijJIdnOUtYWM2SGYkAXJNrYHaXm9ii2rqUmlQ0tzxvvaG/YnOBLWa7gTfvnA+zk03+Wi2fTno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=JfMpyigj; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="JfMpyigj"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3d56285aa18so1181125b6e.2
        for <chrome-platform@lists.linux.dev>; Sun, 30 Jun 2024 22:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719813038; x=1720417838; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1wG1v5ffuwCsa9rhEWa9j9bR8waicAwZPJerIUuG1Wc=;
        b=JfMpyigjLcTij2+RH5gqR/DCJ+OYfstvkCKlIKN8SQ+K8VsCt/MgRp9brHKhfKJv7m
         0qY/QSsLWvmkTyJBg1Tr0WVCJR//bfJrynwJO/DrUeIu6YLuz6bFQ7ljTEal0VnTutve
         GRIUV/fZlZ3Olk5N4NgS4WK3SnHjndlPCJzzDlWp+rTjR9jk8jM4YJsH7dIiGneEvatR
         hP9xO/fq+aVP6l2iFg3XZZ9y6D27+2pNA6Ku0H62AIO9jldIzjcqqW7o/F8fqqi1tMyq
         oFxd3mdv/N0qg5uYST2MCx1y7w63tQJHIqNNNiSbOuBxP5MuA0vY5y7LEaKPeIjqVWmN
         pLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719813038; x=1720417838;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1wG1v5ffuwCsa9rhEWa9j9bR8waicAwZPJerIUuG1Wc=;
        b=OiEmmSfQ4QMdjldhnxclesYYpecVGEeSaGSqqkItpdkfoOmccih6c/bynFqKLO6tBv
         k6yUX94LaPA8Qz5fUnnceYztC72zA0QJbA90kIznrVabgZp8cxKhGuB0k19szMtmyok7
         rGfqDThs/+yo5u9lbS/LH8qZ9PHTeCveXZkwMRQOMQ+XXfYkk/Rc1l3EQjvm/mVRt14r
         rS/zEXoYi0dHKK9sblDzzqHsXq/FJ0CIgDQj/AyMzkDlI4dDZF4u5rN8nhuAzkrIH6Gn
         rwQQaAGYIIvIwyeEC801qXpQ8UlEnGGSq7E3LpKWwmvjV0WeyeXFzixiSBrOzTCDywkD
         R4dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwqwKQQmQzdz9AewxMxR2mHWJNMM9MWrxbhYZ1B7qYNV1NnrL6UhkIe5aZNcdTBt+pD+uwpX6RzgiOZqTGucl97NnqqQ/CtpwL7Fi8jq2u
X-Gm-Message-State: AOJu0YxrFzKuWwyPVh09u/uv7QZ2De6kMSIsWZPm6iofNn1V2k3JJLPa
	atVyrUXz3nINkLIbONWP5bwIPEFObQA4lGyfkrTD7ntjubBXY5haBSXk032F3Oo=
X-Google-Smtp-Source: AGHT+IFnqrOI0TNTGCEy6Ua2IJOVIwAqg1C1oUpS1SEVu0l0bW3hyXaqOapQ0ol8yW6yA7pi5SobtA==
X-Received: by 2002:a05:6808:f8d:b0:3d6:32b4:b8fa with SMTP id 5614622812f47-3d6b30f45cemr6599377b6e.13.1719813037971;
        Sun, 30 Jun 2024 22:50:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6c8ec943sm4431770a12.69.2024.06.30.22.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 22:50:37 -0700 (PDT)
Message-ID: <668243ad.630a0220.1d649.d111@mx.google.com>
Date: Sun, 30 Jun 2024 22:50:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-21-g5b8feca8dee44
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci baseline: 90 runs,
 5 regressions (v6.10-rc1-21-g5b8feca8dee44)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 90 runs, 5 regressions (v6.10-rc1-21=
-g5b8feca8dee44)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =

imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-21-g5b8feca8dee44/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-21-g5b8feca8dee44
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      5b8feca8dee443055049c8ccfdd97f64a0e1d2b4 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/66823c2612780e25b67e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-21-g5b8feca8dee44/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8=
mp-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-21-g5b8feca8dee44/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8=
mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66823c2612780e25b67e7=
06e
        failing since 32 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first=
 fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/66823a155d7e67c4577e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-21-g5b8feca8dee44/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8=
mp-verdin-nonwifi-dahlia.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-21-g5b8feca8dee44/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8=
mp-verdin-nonwifi-dahlia.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66823a155d7e67c4577e7=
06e
        failing since 32 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first=
 fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/668238d4af465a5b627e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-21-g5b8feca8dee44/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-21-g5b8feca8dee44/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/668238d4af465a5b627e7=
06e
        new failure (last pass: v6.10-rc1-20-gb57cd5703a16) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6682399f7e3a59b7487e7078

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-21-g5b8feca8dee44/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-21-g5b8feca8dee44/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6682399f7e3a59b7487e7=
079
        failing since 32 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first=
 fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/668239f0ab4284f89d7e7085

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-21-g5b8feca8dee44/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-21-g5b8feca8dee44/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/668239f0ab4284f89d7e7=
086
        failing since 32 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first=
 fail: v6.10-rc1-4-g7b44d5381e541) =

 =20
