Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BB7362
	for <chrome-platform@lists.linux.dev>; Fri, 10 Jun 2022 05:29:40 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id i15so5189033plr.1
        for <chrome-platform@lists.linux.dev>; Thu, 09 Jun 2022 22:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+PW9au9Zn1vCbKf474o4QIDcpfoKqwqlP6Ap2wBX4Ns=;
        b=eKjOfZM/5QvjIBWCDKl9f9g3URtF3rRX/jJ3RFaQjFNyc8WFW2mi/Obten+yB+NVtJ
         jA/HgiYHgDneZulxoAYDCZbUtMIjcyCOTCB7Gd/WY4GGxX89urVYAiazwPiOjVJs2S4P
         lAR0B1qAYlJCW3wuHPyOwzMxFx0DNY4Q3UWPribSxYPFB9SbBm+L+7dFdRd6ODRR+vOE
         5Kc2DY2B+RKw2n1lfQkiBtMuMA2Tu2aXNvyhrf6a56OcdiAAeHUWd+YBiuSECqfq9d4t
         Od986XgpPs3XHvy1O2HCEp3J/qPQVY0tDigr4qedKvp5WoHu/lQyI3IDAHREanVAmgfv
         wjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+PW9au9Zn1vCbKf474o4QIDcpfoKqwqlP6Ap2wBX4Ns=;
        b=uME64KV+pkREzDmpaZM0lv4hwdu5uGPrI+L5wmXfnoQwnfln1KiUXagdUZfo88un8r
         2yRYG9wdl2/ylTOmJrdvCwvxY35+UjPPo+201mr11qI2vF26Lc44mSTnie23YVPa+Ghb
         j/NX+xdT06LS5brINTpNav9mN1s0Ty1k5/hqYzYDR6TGctQf67Sm7NJX2x96pKaGrEXc
         FI5kuhMMNqCqougca/3913qrRx0pJzLpSYOA4ss82SC/CtxX6vdeiMZiegffNE9+zSzR
         nbfTpyWdFgAtoi03+rx9/QceBFgapx4nPkz4Ps4ixW8k6A3BOrjXOwyIIyF751HVymyz
         5YfQ==
X-Gm-Message-State: AOAM533oz9qGW7eiobWMJEpCH6js6XZgwiaqjLLuqcawGOhSpK7qH8dR
	4pxalR7/cGCO79ZGQG8Xd+FYQA==
X-Google-Smtp-Source: ABdhPJwm6gNlFYiDqF1pyeCEGyeAwMbQCepwqPhvOJAWMihO+SPlStOt5xqJibIz+EqEW070IWfdSg==
X-Received: by 2002:a17:90b:1bc7:b0:1e8:317d:6b3b with SMTP id oa7-20020a17090b1bc700b001e8317d6b3bmr6935969pjb.136.1654838979973;
        Thu, 09 Jun 2022 22:29:39 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s10-20020a17090a440a00b001e3290cc2c1sm680887pjg.34.2022.06.09.22.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 22:29:39 -0700 (PDT)
Message-ID: <62a2d6c3.1c69fb81.effc8.113e@mx.google.com>
Date: Thu, 09 Jun 2022 22:29:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc1-35-g412b193d93912
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci cros-ec: 4 runs,
 1 regressions (v5.19-rc1-35-g412b193d93912)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 4 runs, 1 regressions (v5.19-rc1-35-g=
412b193d93912)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.19-rc1-35-g412b193d93912/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.19-rc1-35-g412b193d93912
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      412b193d93912055f2389500102f4bd75ba9b144

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  86181a7fbd379fc42314c450740d2cea8cdf04c1 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62a2cae6409419d199a39bd4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-35-g412b193d93912/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros=
-ec-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-35-g412b193d93912/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros=
-ec-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220603.0/armhf/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/62a2cae6409419d199a39b=
d5
        failing since 4 days (last pass: v5.18-rc1-24-gc2d7e384924d, first =
fail: v5.19-rc1-5-g4a0e708bb23fc) =

 =20
