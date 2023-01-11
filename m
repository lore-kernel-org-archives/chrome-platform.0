Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C1EB45B
	for <chrome-platform@lists.linux.dev>; Wed, 11 Jan 2023 06:45:56 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id p24so15774995plw.11
        for <chrome-platform@lists.linux.dev>; Tue, 10 Jan 2023 22:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YIkB2+RxusU+UqA6I+r4LX2dSKWDnbqe83m22HZtzyg=;
        b=RPhDD7WDS4yNaXR/7Jmf/6ASGjX0zJdKIMNKmAcUdzqgZFGx1tscTqEmt1jjaKZ+tf
         nZ5sHbr3zUL+9+krgtSE3L3pWq7kcOz6xvOUPpjzmyXmtBsKGhGbMTXetFVpn1tCG53+
         kl13CI+EckTZRtwC+xUrVqbxJqKrClvPs1UwjVrmTJWWwSgEv0AYvXo2APJa4uDgeYZJ
         54r5ND8VA6yE9xxCxR52bY2WCUdagWkak9brGTNi3E7PVuf/C4JJSwqwQDuiyW9qHfHr
         1ufJNi2j5zALbfdOIHHvYrEMiQf3h3F5ieoQQ64/mvOA1aLFSOlk7jruA0lHRhH59rsM
         tBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YIkB2+RxusU+UqA6I+r4LX2dSKWDnbqe83m22HZtzyg=;
        b=RwpEIhWGKkLeZ3I2TlSvYYYJlsBYyh5z5d9Uryb3prOHuyLpW965G6lS+9xzzuQB0q
         IsoK/aXc70vCd0rEQQQCDz0q7eei/5keTkdcqvYyntgN7dcTaNc2HUXMFFaPBnhnvSJD
         Pnc2XsIWXD2enqHp0iCceuma72qgGH3HnzJdtWavHptpeLYDqGwI5+4+Wq3tmkFeX/HB
         9Nmccf8d7Z9OwsdgjN4LpmNKmVmXh3eeQAVpEnh9wALg4Wqfo+78AA/ndCGvV+gP44gC
         L9t0oslRFk0KejdR+Q7uLyvS909yILla8Pua9DxNvXIhVQBY5PS3tscg1cS1ee4rVoBW
         pRTQ==
X-Gm-Message-State: AFqh2kp8N55DWQL1NwljutYnHaVByLtsWVpKZD6NZr2BZ40jhPDQr6jz
	j8UfZkHUsnjcbpmR+eIb8TRtOQ==
X-Google-Smtp-Source: AMrXdXuFYVl/iBzldl1OL5kABIbQmQP4gN4BA77HNx0Wc0puOmLZ/d+lCknls+xEudQ21D2Af0XqrQ==
X-Received: by 2002:a05:6a21:c011:b0:af:fcb6:2ee2 with SMTP id bm17-20020a056a21c01100b000affcb62ee2mr87515555pzc.47.1673419555849;
        Tue, 10 Jan 2023 22:45:55 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q20-20020aa79834000000b0058134d2df41sm8069028pfl.146.2023.01.10.22.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 22:45:55 -0800 (PST)
Message-ID: <63be5b23.a70a0220.88384.d705@mx.google.com>
Date: Tue, 10 Jan 2023 22:45:55 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.2-rc1-23-g93899a4cb7b1
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 77 runs,
 1 regressions (v6.2-rc1-23-g93899a4cb7b1)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 77 runs, 1 regressions (v6.2-rc1-23-=
g93899a4cb7b1)

Regressions Summary
-------------------

platform         | arch | lab             | compiler | defconfig          |=
 regressions
-----------------+------+-----------------+----------+--------------------+=
------------
imx6dl-riotboard | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.2-rc1-23-g93899a4cb7b1/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.2-rc1-23-g93899a4cb7b1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      93899a4cb7b1f587d89db47dd6553c816a98564a =



Test Regressions
---------------- =



platform         | arch | lab             | compiler | defconfig          |=
 regressions
-----------------+------+-----------------+----------+--------------------+=
------------
imx6dl-riotboard | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/63be50d1287dfb5ef91d39dc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-23-g93899a4cb7b1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/base=
line-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-23-g93899a4cb7b1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/base=
line-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63be50d1287dfb5ef91d39e1
        new failure (last pass: v6.2-rc1-21-gd6c3ad38d6f0)

    2023-01-11T06:01:36.468415  [   15.031365] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-01-11T06:01:36.475066  + set[   15.041208] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 877204_1.5.2.3.1>
    2023-01-11T06:01:36.475503   +x
    2023-01-11T06:01:36.582537  / # #
    2023-01-11T06:01:36.684470  export SHELL=3D/bin/sh
    2023-01-11T06:01:36.685085  #
    2023-01-11T06:01:36.786304  / # export SHELL=3D/bin/sh. /lava-877204/en=
vironment
    2023-01-11T06:01:36.786863  =

    2023-01-11T06:01:36.888181  / # . /lava-877204/environment/lava-877204/=
bin/lava-test-runner /lava-877204/1
    2023-01-11T06:01:36.888780   =

    ... (13 line(s) more)  =

 =20
