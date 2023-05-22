Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3959FEA8
	for <chrome-platform@lists.linux.dev>; Mon, 22 May 2023 04:08:08 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2537a79b9acso2122377a91.3
        for <chrome-platform@lists.linux.dev>; Sun, 21 May 2023 21:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1684728487; x=1687320487;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VCZTRU5Sv92L0b11CatLESzYo0SmTryuf0/2JQ0w/HE=;
        b=dbr+1jEZxuLFIc2UDIe8vtWrm3BSxrVmLhQD2C8CXySEV595LizVmlRwtQ2Bifa/l9
         K4y6JgPj8GEFX/k1vGEPbA33ECHo1q8vPsKgUoBBP1E8dE4Mvo80GMo2VxYK0NubNvay
         FAv8oJAOSPf2kjl5jpTKBhnlvqe1WsL8ssX7/Ulw5i29sERem1DH1LfVoF4k1uMWlDCX
         szo14eF/6AOJ252l7i/MdPlHTdm67zD4Rbtqi6BcIVTHEJ06rzNVQLW0htEqmrYh4wXv
         b7LWW2H2eDKq7FZCZF7X+GUefjZsnL8cZSEUYGOUXR8E70LVDj1bnuIkp6QfnIVEdBSg
         e5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684728487; x=1687320487;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VCZTRU5Sv92L0b11CatLESzYo0SmTryuf0/2JQ0w/HE=;
        b=R83xkae8+/jdDhk7fFrP4vyjZJRV4CFL3JLa7IPZWR8fV3MabfKGcF+7DT8+b8aKQX
         V3NtXixxFnKIY3d9Lu6Ns2v0KPt5ICs1kha0LvzcDPsdYIpZVuNv+dZvAgjST6QfJ4uy
         roDvpnegezmqzygg10TDPzaVAzstw3ZMSMyeTWihH2OMpFc2+YtJMSMWy6RfkVNdPhB8
         eb44m/Pp/lrArTQVorsWSdp7RGcD3Z1BpN5sVSFqA/Ne3UqqLI+FLIWJCAjz0uTMQ9Jh
         rqc086Q6o8IfCSfls2KT9qiCX+o1F2eNqlFm6c7wzBpHDEf66oYBclh3Q1quyX13TExI
         C2sw==
X-Gm-Message-State: AC+VfDwJdJTaO92h179kVYfR2MYJBObDuTzbazdLkibgKEOaQK1VC6FT
	cc1nutt8KaHvx3L7xgAAIaRVGA==
X-Google-Smtp-Source: ACHHUZ7ILi97XSn4jisOm/c2J/jdKrJXJuSc13SPvxdYxqj30iDpF9vC1nGhPrMV+y4uvH8EbDoy4g==
X-Received: by 2002:a17:90a:5b18:b0:24e:1575:149 with SMTP id o24-20020a17090a5b1800b0024e15750149mr8273536pji.48.1684728487563;
        Sun, 21 May 2023 21:08:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c21500b001ae8587d60csm3674433pll.265.2023.05.21.21.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 21:08:06 -0700 (PDT)
Message-ID: <646aeaa6.170a0220.35fae.5ad2@mx.google.com>
Date: Sun, 21 May 2023 21:08:06 -0700 (PDT)
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
X-Kernelci-Kernel: v6.4-rc1-3-g4b9abbc132b86
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci sleep: 8 runs,
 2 regressions (v6.4-rc1-3-g4b9abbc132b86)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 8 runs, 2 regressions (v6.4-rc1-3-g4b9a=
bbc132b86)

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
ci/kernel/v6.4-rc1-3-g4b9abbc132b86/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.4-rc1-3-g4b9abbc132b86
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      4b9abbc132b86e2ce65090798186836f48f33382 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646ade1667df45f4fb2e8639

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/sleep-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/sleep-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/646ade1667df45f4fb2e863a
        failing since 13 days (last pass: tag-chrome-platform-for-v6.4, fir=
st fail: v6.4-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646adf7e6492a254a62e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/sleep-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-3-g4b9abbc132b86/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/sleep-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/646adf7e6492a254a62e85f4
        failing since 13 days (last pass: tag-chrome-platform-for-v6.4, fir=
st fail: v6.4-rc1) =

 =20
