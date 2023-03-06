Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7894A20F0
	for <chrome-platform@lists.linux.dev>; Mon,  6 Mar 2023 05:40:45 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id 6-20020a17090a190600b00237c5b6ecd7so12025216pjg.4
        for <chrome-platform@lists.linux.dev>; Sun, 05 Mar 2023 21:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678081245;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Zl72hG19924qVtvDHaQDfHgESvJpkMOqTi4M4fsKtA8=;
        b=6NlA4ElFQKC9CVvZseuDnMQD5J5+/qgALcmpOxB1sF26S1MlQyAq0AmEDAhdXeCBbg
         hLayawWdI2mhWUMWGXVpui4TgslXRKtbuna7zaad5zquPo5bMKonV9jdvuw+OfOFLvGW
         Kmliab9DMveiEIddeVthjN7NUGw7z2Oi+R4ujJK+DcB7cbnPKyGYPg3sxQjRGPOn8Tzc
         if6J+JHXmwr3YR7D0cyijSZbxKGQCjNoxIQcI1/9mZxPXS2QgrOGHCtiVvGlClpc5kHc
         AYAliYcDR37fC0JLoguZCfJzLhkL+8QrdP2K6D5FpTsvBmdqVAWEPN12PTYrrTscCH/Q
         T3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678081245;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zl72hG19924qVtvDHaQDfHgESvJpkMOqTi4M4fsKtA8=;
        b=jjryFu+uXNiKtZZ9Rpyv2JL8Cd0RS5DP6DknDiLEnnHEv7R9ffSRCW+q0zJrJ+N9d/
         hUBUsn72Legp1EpQzqBHNYqB8eZNoLsZWQMsp2cjL5rCQ9zMaEwZAYySCvGf7XZg3OFP
         uNA1GecPs4WaL/++HpgsVU/aZtojh9wk8cYcmew1zTHXXmv6Vo79jgK3qyyhTNoLOwLw
         5Hf5MzYxQXo7HBHVzaKgUqfVrzuYh8RdcpzC1IMpGutR6bBsM7V4SVPSrKLIARgys9/L
         NUbNT8MMhSKml95aVS2tC/gNconOlJ6Nhug5h30xJ9uIV1JlUUvgR0XhWzR67+hqSq5M
         MtJQ==
X-Gm-Message-State: AO0yUKX6VkfmnqhKxuKEKU3BlbHYBK/03hVgWyfA0/ktgVCGluXncGUy
	w+0ZE+lmxV9ygUGo6yXydW8yyg==
X-Google-Smtp-Source: AK7set8fVJPAU8Mi76q/WYosOSD38goppTOdWRdIiqXqBbXe7gwqBHv3T8fQe5snWQOin1OCpjSjZw==
X-Received: by 2002:a17:902:bf06:b0:19c:ff15:5bd8 with SMTP id bi6-20020a170902bf0600b0019cff155bd8mr8198019plb.46.1678081244872;
        Sun, 05 Mar 2023 21:40:44 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e80400b0019d397b0f18sm5621302plg.214.2023.03.05.21.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 21:40:44 -0800 (PST)
Message-ID: <64057cdc.170a0220.e054d.a0f9@mx.google.com>
Date: Sun, 05 Mar 2023 21:40:44 -0800 (PST)
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
Subject: chrome-platform/for-kernelci cros-ec: 11 runs,
 1 regressions (v6.3-rc1-1-gad79d30ce40d)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 11 runs, 1 regressions (v6.3-rc1-1-ga=
d79d30ce40d)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.3-rc1-1-gad79d30ce40d/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.3-rc1-1-gad79d30ce40d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      ad79d30ce40d8c5edf5e93b1d334162af3a15aac

  Test suite revisions:
    cros-ec-tests
      URL:  https://github.com/hardboprobot/cros-ec-tests.git
      SHA:  f6c0dbf63842d5751000c5527808aca38354db55 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/64056a7f3aab98a0b78c86f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec=
-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-1-gad79d30ce40d/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec=
-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230224.0/armhf/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/64056a7f3aab98a0b78c86=
f8
        new failure (last pass: v6.2-rc1-35-g75a273974d7a) =

 =20
