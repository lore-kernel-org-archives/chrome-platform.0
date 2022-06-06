Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8CE23A0
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 05:00:56 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id w3so11221282plp.13
        for <chrome-platform@lists.linux.dev>; Sun, 05 Jun 2022 22:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=xfO3ysww8tSdKN4hBAaO8p6lmhuiPMzt6wGj12j+Cnc=;
        b=GgpJt3MnVBFGo+2Rs0QWt0qY4EhQjd9rWi/63htr3gk70LlRBxNAIevoYRgvAzKHkU
         MdR3+yV33/CIBhr5DxsDBAwMt6epYB5FGGIopyp9DHB9yIojrZW92vCYWxKa8iNxNP28
         /r3VNVE8tIkTPW5XcYSYm/j9b1f6NY3Zcv3OuU5UXFug1BQyt+hdsbVYrIzqNYHBBook
         F1K6W1R0eKiu7G1n1mIOxgU5TPNhpgc8bdvCvXLqqKMAIdiqONahQ5i4PZ54AgJqxp4U
         PRZA+mJenPYO7k9pP9t4hHcgxSsuEL1YB0mKt0LAnx7tceTVo5TwNWq7JRirqQegDK6w
         +NrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=xfO3ysww8tSdKN4hBAaO8p6lmhuiPMzt6wGj12j+Cnc=;
        b=Enu2oxOT3Pz3aA6Y4qT+/2BiF1Ay0fTIeXeLV6kUg9Ls1nd5GuAIFEmsho92fedzc0
         nOBlMNgKxMqgZFeh+ow8neRvV0G9qyj+VjmWR1Dl92O4RduaaUrlDEttdyPI0ILrQdxY
         9fjPQtKHlpTifR9wkF61MFD2Gjs8j9qZpfcVtC3jUxTiXCyRZ1LuEmRW12wQRHMZ3gJz
         f5oG7ALKghgFYfLwr6M8N0SW8cHRRZE2HZMPg7SqO03eq6PNh7UgrqoBAirRBzGOTkxK
         Rs6kcD5jv/fBvf6ppMrlWFOkC4NuolrfWMaEhprqnLO01dMS0N40tnk1jG1UUmFROFEX
         YIrA==
X-Gm-Message-State: AOAM530SoBjTkzeaCAr5B1Bbx5dwdhFKsGzZtxyL5DQ2oviaWE/5k7XZ
	f0Zpv/Yc+GgCxOxerQ+CALe7qXhqllqALVdk
X-Google-Smtp-Source: ABdhPJwfILGOcydtnZu/i/INYPvUMNVV56udkKLgp6hlpurhzqEFD/XGxrRg/9kRSG5nKZUicqkLMA==
X-Received: by 2002:a17:902:ecca:b0:166:3e34:4d01 with SMTP id a10-20020a170902ecca00b001663e344d01mr21400530plh.97.1654491654810;
        Sun, 05 Jun 2022 22:00:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z2-20020aa79482000000b0051be7ecd733sm5361385pfk.16.2022.06.05.22.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 22:00:54 -0700 (PDT)
Message-ID: <629d8a06.1c69fb81.f9c10.bb5a@mx.google.com>
Date: Sun, 05 Jun 2022 22:00:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc1-5-g4a0e708bb23fc
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci sleep: 9 runs,
 2 regressions (v5.19-rc1-5-g4a0e708bb23fc)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 9 runs, 2 regressions (v5.19-rc1-5-g4a0=
e708bb23fc)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =

tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.19-rc1-5-g4a0e708bb23fc/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.19-rc1-5-g4a0e708bb23fc
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      4a0e708bb23fc2fd10c7320b40ab9af2cf619f5f =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/629d810b01f62f85dca39bdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-5-g4a0e708bb23fc/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep=
-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-5-g4a0e708bb23fc/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep=
-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220527.0/armhf/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/629d810b01f62f85dca39bdd
        new failure (last pass: v5.18-rc1-24-gc2d7e384924d) =

 =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/629d8138bd4bc8421ba39bdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-5-g4a0e708bb23fc/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep=
-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-5-g4a0e708bb23fc/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep=
-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220527.0/armhf/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/629d8138bd4bc8421ba39bdc
        new failure (last pass: v5.18-rc1-24-gc2d7e384924d) =

 =20
