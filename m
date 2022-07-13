Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D942317C8
	for <chrome-platform@lists.linux.dev>; Wed, 13 Jul 2022 20:33:15 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id e16so11213767pfm.11
        for <chrome-platform@lists.linux.dev>; Wed, 13 Jul 2022 13:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=g1ew4FXmlg3R5P7gNZwx7pYTjtVIRzZJZ1HJuANdpOo=;
        b=3SouDvxeewqgB+SA9GhQ7E8c+6USJ8KVhNCYmWMBCHQ/1aypCgTbRai93IuAV3JMf3
         MfGZt2wz3GPLekqqdbL/nTcMn9VOAkzZsxsPzFznWlGhcSoMuMlWfbThnpDgDtTNGIiH
         YHRvNXm48MA+34YGb8S4eqrj3yvQtEWJwMJNRGPbuPYT8e0TnnLiB+Lk13eFAw1r/OZn
         Lrovy4FE/mRUTk7XyEzt/BfSAinVcn3VT4FJggxa1siG1aNQfgSGECp7gs1YCuTas5Tn
         YJGgRe3F87dsv4Fnq9rP3t6x+YG07aMPuglKUzQLhohcqWh8ZeMBpmvcEflw5zDHGAuh
         5x7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=g1ew4FXmlg3R5P7gNZwx7pYTjtVIRzZJZ1HJuANdpOo=;
        b=jUjy/cXu0sOsaQBg28aQ3hUEH0OI/+qESiEU23ozwywrpiZxZrK6babDeAD/+CU8Kg
         2OGUiRWBMeu5Uc7aNUhZIaf+XmMja+CLUDkzl7bI+DlKCP5CE5dDWCA3R07qmiW+GPbQ
         eEThV8VnxE41kgNft8tSaTqD/r13v3LwUGndjIC7XgezuLf/qvPhJdl8zi4MK84KuRGf
         IxGtLrZoBnR50OvUh/pTH+RiyeYhkwQ0q6tDxNtvkviPb33alkpthhwMC98CXIbYNQb8
         J35MNTvdzZ1bpVvCm6R6iQri8WbOyZSWxIqMUQ/vWmNOJ+SKAfBlWZae4/buxdf2ZmRt
         CYzA==
X-Gm-Message-State: AJIora9UU2wiuenqPu7DDo9etu+hoH9OpB0G1dh/7cBY3Q3qKbWq4/Rj
	LygyU7ejFheIio9X+or/ICmw3g==
X-Google-Smtp-Source: AGRyM1v4s87gPUkaiQ0bc6gGvzUYJdbu5cnJwwld15LRK4UaVEPN0HI3wrDwTcWITphFE7+9QaYdXQ==
X-Received: by 2002:a63:5cc:0:b0:412:b2ea:c6fe with SMTP id 195-20020a6305cc000000b00412b2eac6femr4418522pgf.596.1657744395315;
        Wed, 13 Jul 2022 13:33:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 63-20020a620542000000b00525161431f5sm9264842pff.36.2022.07.13.13.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 13:33:14 -0700 (PDT)
Message-ID: <62cf2c0a.1c69fb81.a87b5.e3cf@mx.google.com>
Date: Wed, 13 Jul 2022 13:33:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc1-39-g5ffc0821f4df
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci cros-ec: 8 runs,
 1 regressions (v5.19-rc1-39-g5ffc0821f4df)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 8 runs, 1 regressions (v5.19-rc1-39-g=
5ffc0821f4df)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.19-rc1-39-g5ffc0821f4df/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.19-rc1-39-g5ffc0821f4df
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      5ffc0821f4df12a904643030172476b7f537508e

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  86181a7fbd379fc42314c450740d2cea8cdf04c1 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/62cf17336eaa7ef48fa39be5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-39-g5ffc0821f4df/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-39-g5ffc0821f4df/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220708.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/62cf17336eaa7ef48fa39b=
e6
        new failure (last pass: v5.19-rc1-38-g15288cf9f149) =

 =20
