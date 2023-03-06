Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A59D30E
	for <chrome-platform@lists.linux.dev>; Mon,  6 Mar 2023 05:10:45 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id p3-20020a17090ad30300b0023a1cd5065fso7812811pju.0
        for <chrome-platform@lists.linux.dev>; Sun, 05 Mar 2023 21:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678079444;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LU8HrLuTIDh/IYTFj49Trz4zQkB+fpFgD1SA57ImkOU=;
        b=BazmCYEvr3wNPK38s7xCjiye7rDoywIZkSs2E+5smEb9s9ONt79DdAhTOVMaiMQEhs
         TaQJFPV6X1EIDjcltzhIqumgxVuGSoe1ZTFQaviGYduCRjMisG3xo60M1O8txC/qPL/o
         Yma3OMsFCsixGAzThAUJ117vTn2oP07iWRIvWkIrY5MvZY4wb45eN09eroqO409Bt0xx
         3XbE6C/66Tx4CzzVeHAIk7ldN51bTKHzFYqO8Oar+NQ1SWbRT2BFTtQqHxjndo6gquie
         Z7r+Gn3hf4EekIb9yRT1d8YlB/IUqoUaVQC/R6fsSx8Wyrq6K+pAVuM7G4IhkhbvVxbL
         bnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678079444;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LU8HrLuTIDh/IYTFj49Trz4zQkB+fpFgD1SA57ImkOU=;
        b=Pqv2yMBWxmZs2uAt02Z6O1an+/lXSpcvhbU8qziZUwqJn+OCBmItaDKrvZdH/uCLVd
         pk+v4dF4Bb1krLImSVmQtUSjTNUKM2i5d1hqzpJ6iSrz/cqPne+S1tBillsU/HHBJ9Em
         KPWpMt0L+ypGvCtcMb3TWlN6QJ8HpRG5U3Ruqig9B0FhVSTZfLIUlJpCoZTtAwoTVI8x
         tLCYxvmQH2Zo7tac532PCsyrFhH8y7Z82ogmHyh4KaBXKhvbLPudvXGoe9W/L+nlqSsK
         ABee6KapWrSL2LO1x1iMM/egeuUppTLFQ0dyfJKi4Q7SX3lEiI9lBvmXekv/eYiygtFj
         IWBA==
X-Gm-Message-State: AO0yUKXAeM3uCjDkWDwlRWUCQdWlNJWTnicXnrQS6SnxF3ma+lNapC21
	SUTfXvB1cTmEhfGRJO9gk7K7ew==
X-Google-Smtp-Source: AK7set9N5zACBUIFO3in5rxyPbDsZ1uTWLRouaPtiwWmCO6DEOAiBh1sjhhm9COnnXtfgH6GWB9yPA==
X-Received: by 2002:a17:902:c40d:b0:19c:e3dd:db3c with SMTP id k13-20020a170902c40d00b0019ce3dddb3cmr15717451plk.20.1678079444505;
        Sun, 05 Mar 2023 21:10:44 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902768900b0019ac5d3ee9dsm5606672pll.157.2023.03.05.21.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 21:10:44 -0800 (PST)
Message-ID: <640575d4.170a0220.69899.a369@mx.google.com>
Date: Sun, 05 Mar 2023 21:10:44 -0800 (PST)
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
X-Kernelci-Kernel: v6.3-rc1-1-gad79d30ce40d
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci sleep: 9 runs,
 1 regressions (v6.3-rc1-1-gad79d30ce40d)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 9 runs, 1 regressions (v6.3-rc1-1-gad79=
d30ce40d)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.3-rc1-1-gad79d30ce40d/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.3-rc1-1-gad79d30ce40d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      ad79d30ce40d8c5edf5e93b1d334162af3a15aac =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/6405688bc6365578638c86f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-t=
egra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-t=
egra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/armhf/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/6405688bc6365578638c86f1
        new failure (last pass: v6.2-rc1-35-g75a273974d7a) =

 =20
