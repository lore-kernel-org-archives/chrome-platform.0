Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D692A1361
	for <chrome-platform@lists.linux.dev>; Mon,  8 May 2023 13:29:19 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1aad5245632so31802705ad.3
        for <chrome-platform@lists.linux.dev>; Mon, 08 May 2023 06:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683552559; x=1686144559;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=03yiJl37XMVIW9EPJmNqoAwnRs9DvxP0U9VcT+Ci1T4=;
        b=PpqN+2Z2PfGjhK1amOs2Yfv64OHD1Zzy64xYeF3wgWAUJCSjlEZtrZvNtSnaEmyZWT
         dt86rPw0oVO6C2Kp/jWqwJ72NiEKwDPZFA+8Oy8LonI4/lX2gKkdwARfgKLAhfSjJYlP
         lnwny3cy1lSGUhW3+POJP2uvtTj9MHrYUR/bhfY7xv51dg3siSxeEBPuhCpZx20YExnf
         9+Q+5Ogi+Nsxu+MNZWB+s08r3WeCGLH+GYOuvQbeQbYpqhUHeHBnQvSOwTsALy5cag5q
         h3iHf4h6e4LqV0P9KQNpUa92maoLhC7h3faQ48iHc6eN9rrCzL+NYeQi2ejVaDBEr/LP
         efkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683552559; x=1686144559;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=03yiJl37XMVIW9EPJmNqoAwnRs9DvxP0U9VcT+Ci1T4=;
        b=CxjRx8eGbbE/Ld/qzL8+4pwtNgTvFhIxUA5czlgGdIjljjoen4cYjZIcuXDj+MqVcG
         uUzTZ2k3db+WHgDHusBE66MLu+JIOBtiHKYOk6CEaMvNF/Qbv3q/obv75PA4pR3sEUzV
         qpvTkQC1caxIAVC5M2dmOUIOyRhkrrpVTThWQJyliSPyw2o9/Oo4CqszPwGMGjsmfdjk
         eTjXmvEydrro50HwAKs5vtHBvdcrn72yLIcBsTyXPLOOunboRJwTfWlMmRzQdT52Ny4F
         w/8t7Cx0N4RpYrzrUDI3uKEqZ0RHExosrYNgcuF765HAbKLi3MV6kxXqYpkFc1mu5K4s
         MDNA==
X-Gm-Message-State: AC+VfDz1QTS3+W5MK8IhBreEGadvwmzvB7KnWEG9QcK70JXHtrTAKnfy
	zHXx1G80441rrkdUd4aj1M405Q==
X-Google-Smtp-Source: ACHHUZ6E0iz0N7o6QDt+sIG5qES55uco7Ur2sJeq9tqG++pO+eUMRlM4b0BYq7yBPNK8H0llA8LIeA==
X-Received: by 2002:a17:903:294d:b0:19d:1834:92b9 with SMTP id li13-20020a170903294d00b0019d183492b9mr9915855plb.56.1683552559267;
        Mon, 08 May 2023 06:29:19 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id jk16-20020a170903331000b001a526805b86sm7237077plb.191.2023.05.08.06.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 06:29:18 -0700 (PDT)
Message-ID: <6458f92e.170a0220.75625.c252@mx.google.com>
Date: Mon, 08 May 2023 06:29:18 -0700 (PDT)
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
X-Kernelci-Kernel: v6.4-rc1
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci cros-ec: 10 runs,
 2 regressions (v6.4-rc1)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 10 runs, 2 regressions (v6.4-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.4-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.4-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      ac9a78681b921877518763ba0e89202254349d1b

  Test suite revisions:
    cros-ec-tests
      URL:  https://github.com/kernelci/cros-ec-tests.git
      SHA:  fad9423ae3c64bfd48c207de34a1177000d45fa8 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6458ea2ef48070a6cb2e860c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-ec-mt818=
3-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-ec-mt818=
3-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230421.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/6458ea2ef48070a6cb2e86=
0d
        new failure (last pass: tag-chrome-platform-for-v6.4) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6458ea08ba8d493cd52e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-ec-mt819=
2-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-ec-mt819=
2-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230421.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/6458ea08ba8d493cd52e85=
f4
        new failure (last pass: tag-chrome-platform-for-v6.4) =

 =20
