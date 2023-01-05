Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A532EEB0F
	for <chrome-platform@lists.linux.dev>; Thu,  5 Jan 2023 17:49:15 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id n65-20020a17090a2cc700b0021bc5ef7a14so2771025pjd.0
        for <chrome-platform@lists.linux.dev>; Thu, 05 Jan 2023 09:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PqdoKUWFdb5cRXoA+CXVbGBHeP2BFTAtwhFQThV6VCA=;
        b=8Jx726fd+TSI1KIAeJpVeW7WLujJzhjalsxG0oOgZ5T4z3TRYJ+ZFqet2RYoExQQQ+
         vhy7ef4wGKyOef8RVpsaJxLe6GL8zUSP4AGN4xRtG4iI/0QoNdR0+N+UYzkgLJHYn/wu
         jE495XRpmy+z/9xUlZWNTL1evQ5PW3Y6eJ8RNwZjBHaqJV0+mb06LHhusAWvl8hRMp2d
         SwkjgbwW4JPW0QN/18e1znQHBr6rJlx9R0ObqtbX2UrX0CylLfzbyx95jL9odg+zk4BQ
         ngFaB7dMkXOpLFX8gGT0/CM2mxMBjhuOY6DUCT5zs/HdBcAwEI51ReGr35hlLhxUp/2J
         RaNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PqdoKUWFdb5cRXoA+CXVbGBHeP2BFTAtwhFQThV6VCA=;
        b=tpoYBMSwj6wZWwD1x+RqbFaCBuvsvQIYaL7XRSc8/jehpHTpWtpwm4wN7hwF0FHWa1
         deIxn5VTen6FyvXNrF62cbr67cNnClzmq3/GFZS8xuwLccOnfnqu2d63Il9idPNvWIbW
         LVwpLf+xSgHIWLqfxD3vdeFleur2964ycwuTMBR3ForPhUpeGRDN1b/ziHg7iegFlyDL
         o/2FWIwfNymD7V1jNer42OVxfdA9ihwwEbNBTR/9qy544NYav4Cqt2+8KVn+B1TmQ72S
         ydrOH8l2D7sWdlZWT17ETbZ/hlXid3CAHwveQfF8oEKpYBL2joA9cCtVMy4ZCkxeQN4f
         KRWA==
X-Gm-Message-State: AFqh2kp4/td6hwGW4tPM9hVnj0PKnyg2KDx58+z32gBBK+IKCDT7b7fi
	zwgqyLGZqAyPl2lqB9fkiqFMfQ==
X-Google-Smtp-Source: AMrXdXuyvFp5946VuZVFO3M+qnJ26HcDFZtlj5aZC6IQLDJ1BCGxeB/ceCL8m6Cwk7xI1haOkHnvMQ==
X-Received: by 2002:a17:903:11cf:b0:192:9550:339a with SMTP id q15-20020a17090311cf00b001929550339amr42627229plh.52.1672940955053;
        Thu, 05 Jan 2023 09:49:15 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u6-20020a170902714600b00189c62eac37sm21612020plm.32.2023.01.05.09.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 09:49:14 -0800 (PST)
Message-ID: <63b70d9a.170a0220.aeee.0b77@mx.google.com>
Date: Thu, 05 Jan 2023 09:49:14 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.2-rc1-7-ga31a107a10f0
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 81 runs,
 1 regressions (v6.2-rc1-7-ga31a107a10f0)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 81 runs, 1 regressions (v6.2-rc1-7-g=
a31a107a10f0)

Regressions Summary
-------------------

platform         | arch | lab             | compiler | defconfig          |=
 regressions
-----------------+------+-----------------+----------+--------------------+=
------------
imx6dl-riotboard | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.2-rc1-7-ga31a107a10f0/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.2-rc1-7-ga31a107a10f0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      a31a107a10f0178f66880c4e6ef2347a2d7db302 =



Test Regressions
---------------- =



platform         | arch | lab             | compiler | defconfig          |=
 regressions
-----------------+------+-----------------+----------+--------------------+=
------------
imx6dl-riotboard | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/63b700188b2e71e9304eee19

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-7-ga31a107a10f0/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-7-ga31a107a10f0/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63b700188b2e71e9304eee1e
        new failure (last pass: v6.2-rc1-8-gf9a0ae83af2e)

    2023-01-05T16:51:17.923532  [   15.020190] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-01-05T16:51:17.930005  + set[   15.030037] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 872590_1.5.2.3.1>
    2023-01-05T16:51:17.930173   +x
    2023-01-05T16:51:18.036081  / # #
    2023-01-05T16:51:18.137859  export SHELL=3D/bin/sh
    2023-01-05T16:51:18.138433  #
    2023-01-05T16:51:18.240047  / # export SHELL=3D/bin/sh. /lava-872590/en=
vironment
    2023-01-05T16:51:18.240452  =

    2023-01-05T16:51:18.341677  / # . /lava-872590/environment/lava-872590/=
bin/lava-test-runner /lava-872590/1
    2023-01-05T16:51:18.342334   =

    ... (13 line(s) more)  =

 =20
