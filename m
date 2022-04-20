Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0881867
	for <chrome-platform@lists.linux.dev>; Wed, 20 Apr 2022 18:12:50 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id l127so2698924pfl.6
        for <chrome-platform@lists.linux.dev>; Wed, 20 Apr 2022 11:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8a3xCL3xQgHjaO+6pjARlSJsYVYuwRr6jA65x1yDBWo=;
        b=XJKdB/8WusllpfI6azjlmp3AH4FC3vSjYfC+mYPSnrwzE7pKKgiOBN5iQqLQ5P4A0B
         IsTnBv8jv20mcs+FDxzXCcb+ffsauDuPHuPzcfWWC5s7QNvhMDjjHU2ip7NyiqV160lA
         jJiPWKk6pXvm3tgK2LmhbdluXoMgYIG/pNMg/8OC0zS9YSCOY8FYyfnfAXdsqdyAU2w2
         OX0PK7Y30RbcDsvbbmsuQWNB1uecB1QgPQlRr/rDxwN/c7WKzYq44uc20TYchE++yBg4
         UQmNtfsOy8BF4dx9cr6Lacc8A+UKdWBtMvXTqrw13QR6pmsKLTPjkYwXQ0L5tXtNRrhA
         Lg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8a3xCL3xQgHjaO+6pjARlSJsYVYuwRr6jA65x1yDBWo=;
        b=pwk6Cs2qJcatD1LUxK28jthq/7y76u+LFZoE55QbIvKAjoEjYCIJ92lcq+5g+8cIE/
         CogcJcAdGOznHzSCc8yI852npW1L4978PDfmh/78RFJ5Rq72Udbxg4K8DoLU+BDOSAZJ
         PqD9aAwCnAYxljcpnPugiBZGZwxPFYDozEREpubPa4KDHEDfjLO+lkPssea78z+HoRX1
         oK2keooVDf5X7FhFlfbLc5PydkswJgh3dD4XoU/ChnlUyjxo7+aXATi1RYNedlnrjlmQ
         mRhjVnW+E8SbFVVzJneJA9NEduULuf13cVmQXHOTcCqzXkvw6KC86EQRllI8ld3xfqPF
         hjpA==
X-Gm-Message-State: AOAM531pOTW2HCoqYDgSJEq83lMC7tFKe2lvmmaMey+hQu9uN7EsJLMm
	2rQ2DlPeEERQZTMp5DQLBDzCXg==
X-Google-Smtp-Source: ABdhPJzql3Js5LjRufYCuvdHS+pCOy2kddtN3/+E3HwqmtCy2drCZhd6MfyP+ZZpGBM6ruUBi6hrDQ==
X-Received: by 2002:a63:4c4b:0:b0:3aa:4af8:9ab8 with SMTP id m11-20020a634c4b000000b003aa4af89ab8mr6789879pgl.430.1650478369810;
        Wed, 20 Apr 2022 11:12:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p34-20020a056a000a2200b004cd49fc15e5sm22731871pfh.59.2022.04.20.11.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 11:12:49 -0700 (PDT)
Message-ID: <62604d21.1c69fb81.fe749.44cb@mx.google.com>
Date: Wed, 20 Apr 2022 11:12:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Kernel: v5.18-rc1-8-gc881e7385cfa8
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 56 runs,
 1 regressions (v5.18-rc1-8-gc881e7385cfa8)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 56 runs, 1 regressions (v5.18-rc1-8-=
gc881e7385cfa8)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.18-rc1-8-gc881e7385cfa8/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.18-rc1-8-gc881e7385cfa8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      c881e7385cfa84b27f1489446176aff8a9fb3e8c =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6260420c244adc8242ae06c1

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.18-rc1-8-gc881e7385cfa8/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.18-rc1-8-gc881e7385cfa8/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/6260420d244adc8242ae06e3
        failing since 15 days (last pass: v5.17-rc1-10-g0ef49b25b7cc, first=
 fail: v5.18-rc1-1-gbf84b10d9901d)

    2022-04-20T17:25:24.425960  /lava-6134102/1/../bin/lava-test-case
    2022-04-20T17:25:24.436994  <8>[   33.830525] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
