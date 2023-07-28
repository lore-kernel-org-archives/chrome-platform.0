Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1570617EC
	for <chrome-platform@lists.linux.dev>; Fri, 28 Jul 2023 04:04:05 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1b8ad356fe4so10604895ad.2
        for <chrome-platform@lists.linux.dev>; Thu, 27 Jul 2023 21:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1690517045; x=1691121845;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1XTEgHlXPH8mLma697BceRo9wmeuL7zeJ+skFwaYxNk=;
        b=2aTrS3JdmKh3bts/hgHBmgHOaQ3PQ11VwuGxsvE0ScaZlUHKj3cWH6bxw/LybkY/Ru
         oq1wrT0uQhgT+RnEQHAfX4QbyL+uCCwGM3dYwYkdJ1XtCwFnjERoYfmLM4EGSqrgAxcJ
         nkDDtKfuMfG+qWLUf71P3fErYCANA1mFIBtZLGlgtOGmIfrBKSWNKBw+EXWBDMtyUk/C
         6a85ANdIx3ookfXGE59Ltp+xZS6vTrIYFszqDPDxIfp9K5W1a1FUByoPIOTdYBNXPXAK
         tp07rj/iyVZUOYi1PwGi35J+kIxsi4r9aM3TJU/1rLmmsH1MToPPRwoZydIhBLkBsIMh
         0AoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690517045; x=1691121845;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1XTEgHlXPH8mLma697BceRo9wmeuL7zeJ+skFwaYxNk=;
        b=clEEo9SD9V4/y3gwkmlS4bhaeRzgFx/PVaU5lNgo4uQe8n6NXVOpS1bU7MhvypRK9d
         H38aPVzsgvp7w31mGcw4+dBEUFc6uKdFK8voVXH3vhPPHqwP8tatG87VeTWtFLFNCYeg
         f/fL1b/YUMKCJwLmRIFeD+wmZqFhaE5io+6mtl1XAYYt96grktqZrBssm0Z1vMj4j+Jf
         xkEFxKDDA4/RwQk8FOea6k7ktfSaXbW/PaOdAIolTO8vjvb7GF+B8vJnlR/Swa/0koyU
         S2UFnMPmEq6JTas0mgRYb/dfM9TC1Vyw1nlRDxkeWxkC30HPoTL+It1fTxtshd0IB79K
         Gp1Q==
X-Gm-Message-State: ABy/qLZ9t/l1SYhUMiuTHhW0Dx5xMz15jDi+nHGbhU1zI4S4Nl2Ge4uQ
	y7GlNsV9jO/w5x0KvVTQZ1gZ1g==
X-Google-Smtp-Source: APBJJlHmfqm3Zw8+B6W3Qm7DdDujLVNTxcs7rZIAIxUGE2r1IuQqNcTLPCq4YFl4dItw79vN3oO2Zw==
X-Received: by 2002:a17:902:968e:b0:1b1:9218:6bf3 with SMTP id n14-20020a170902968e00b001b192186bf3mr481691plp.37.1690517044988;
        Thu, 27 Jul 2023 21:04:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id y4-20020a170902ed4400b001b06c106844sm2433409plb.151.2023.07.27.21.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 21:04:04 -0700 (PDT)
Message-ID: <64c33e34.170a0220.8a2ef.51e6@mx.google.com>
Date: Thu, 27 Jul 2023 21:04:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Kernel: v6.5-rc1-1-g0a329167220af
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci sleep: 5 runs,
 1 regressions (v6.5-rc1-1-g0a329167220af)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 5 runs, 1 regressions (v6.5-rc1-1-g0a32=
9167220af)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.5-rc1-1-g0a329167220af/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.5-rc1-1-g0a329167220af
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      0a329167220afd2b28584594d30a0643d8a18dfb =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c3320bf84ca461948ace23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-g0a329167220af/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/sleep-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-g0a329167220af/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/sleep-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/64c3320bf84ca461948ace24
        new failure (last pass: v6.5-rc1-1-ga6edd5f5d9cc) =

 =20
