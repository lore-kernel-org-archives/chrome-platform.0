Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FD723A0
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 05:59:52 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id cx11so11998091pjb.1
        for <chrome-platform@lists.linux.dev>; Sun, 05 Jun 2022 22:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=X3c1ieI6fUpRRPOQIQX3kj64swv+31iChX83c3sa+8s=;
        b=pYqk0eSR3Az4R39Ze/jv4p1tnUeIMJHbtThRS164d6lSzNfKJ/crtLenRLknDmriGi
         +hVKu0k+TisK/tv0eb4GdC2JHT3wRpQ+AVfBApbe32mobvrWTHqvax2XLcZNmG3SQQHS
         b/BmnEAq2MBoNa/qIW3eQPvZAMQC4cI5ZShHx+TWKdLhf/dqU+7g9ugonr0Tod6o/tpc
         +Jj9Oftqe2/GSXDssxY3ySRXoptFOa/xx/vyLDYqu1VUvAA7xB4YEEfrMy7di8pK0eB9
         11EDJx7Kx/XuMcaWAcMPDf6VOLaDX9vHY5nwgm2IOFw8/tjW+sn5APGtYD01JdpI7lne
         98UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=X3c1ieI6fUpRRPOQIQX3kj64swv+31iChX83c3sa+8s=;
        b=YUGYsV3+ekoLXKNjpYRC3kxdCgRZeSUrJtqc9WtccxjRbCGoyrKSGns6R3PF9m8woY
         o6NZiNhhP02PoN850UzZpn8lcKZfDMJ53dbF/jbTUnNzpIFgWHLlbAr4TtZYv1qFqFo1
         owsNqGxSo/8g932jfvtuaOvMdbNUmnIgrFdDpGgwH6OXLjjkQyxNYp3HIsOD2+GLH1vy
         tgE2kHA6fD3lkA5lec+XzkgmXElgS3nzBI3TJwNtYHAkKuxcJGOzcmskgzLLyIyjrbFq
         CP7JGMtyMu98kCvIIsXZ0NbZFzaRUVrh7angQCDX+Z78lPRek6+0MTUDuhYum0v2mYyh
         Yt9Q==
X-Gm-Message-State: AOAM5313ZIryDoNJ0JHyTAo1Fqd0rJtd+dS9txBNBoWiKG3+InL4eNJn
	jmYjC6YwrQyqLPUfeqR1Tx4uaA==
X-Google-Smtp-Source: ABdhPJzVla7Guy1Ruxf1XFVTJT1DaiXVuYF+rqdaiP9YxfmdfHVlR4REOp0Wr4g/XborLRFFA8mOqA==
X-Received: by 2002:a17:902:ea53:b0:15b:1bb8:ac9e with SMTP id r19-20020a170902ea5300b0015b1bb8ac9emr22071231plg.45.1654495192037;
        Sun, 05 Jun 2022 22:59:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 199-20020a6215d0000000b0051b9c0af43dsm9809465pfv.155.2022.06.05.22.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 22:59:51 -0700 (PDT)
Message-ID: <629d97d7.1c69fb81.2afee.6644@mx.google.com>
Date: Sun, 05 Jun 2022 22:59:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc1-6-gc1db0861e8d02
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci sleep: 9 runs,
 1 regressions (v5.19-rc1-6-gc1db0861e8d02)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 9 runs, 1 regressions (v5.19-rc1-6-gc1d=
b0861e8d02)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.19-rc1-6-gc1db0861e8d02/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.19-rc1-6-gc1db0861e8d02
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      c1db0861e8d025ee5b2e0a83f6691aa9098f2f18 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/629d8d00865aec3ba6a39c1a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-6-gc1db0861e8d02/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep=
-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-6-gc1db0861e8d02/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep=
-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220527.0/armhf/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/629d8d00865aec3ba6a39c1b
        failing since 0 day (last pass: v5.18-rc1-24-gc2d7e384924d, first f=
ail: v5.19-rc1-5-g4a0e708bb23fc) =

 =20
