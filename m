Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CD215A7
	for <chrome-platform@lists.linux.dev>; Wed, 11 May 2022 01:00:36 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id n10so743467pjh.5
        for <chrome-platform@lists.linux.dev>; Tue, 10 May 2022 18:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bAM10jYIaso5yNQ9hUAnTXypL5DIHJ8T6DoMd/GG3YQ=;
        b=B84cRcdpgG/hBl99TaaYNeBRh+tF8rtFHGVI9deXRGd+T5tIl8NZPiLRcDcaeprT5Q
         0fOH3t7qshVJ35lIKCPqd0xVvwbi0zN43C6XDgRFsjJx82pub1mo/HLxasrdR9mdZK6N
         42EaSepwiTIGWqaNtGdyXNdcJ/0T7JBgigyn0lpTNwnlFSBbiylsUyKkE8uuurFOcTXc
         hBn5y2LIx4v0SWaTpC8sSQf3EMZY1ryKmZnAwQg292CYqKXWdrjMj/Rg3Ol55UQGCctS
         6JaubKE225+TftxVWeOoY2a9jkv8uf+keAHo6F0q1FVWQELNEz+5+ZrkDGn4X9zLzYQs
         c6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bAM10jYIaso5yNQ9hUAnTXypL5DIHJ8T6DoMd/GG3YQ=;
        b=nn0py/YS+j+Io97Tn2kNxVSLy0sdmL8jVKrnBJ39TTSTVQrdEI3twIcRrLYyz1/5SM
         Mh29itMXnzBez1eBfVUnkmFKH2TAKPA+0Lp39gY8UM5R5/RAtYXmVyINCJJ7TRiHzWUd
         l2q+gkqYFGae8lcUyLybDNGX9DBui58yLBUMzhcpBqrGPhQYgIpdFiwq0hKYB9ZQH1fp
         uHFNxaIha3WFlLQILtFTFWMZ5/VpM3D5IXSaJieiyqYMxbaI8CfYc2uMWS8C2LRF5epA
         zQ5Yx0ZN6z0N7NHShyt6bWw69kVbBIS/EhL8iudCrEsMel6Wn75HjSqghQrT9X1kqD6Q
         xuuw==
X-Gm-Message-State: AOAM530CFtmXys9m+5G1xPjbVwi5EuKf01PS2ksZyyEQ502JoRhHfJcm
	CbP7Gd9fg4P9EuMpW2FWWPrJgg==
X-Google-Smtp-Source: ABdhPJz7Ty/tLKMaMwxE/n+zBP9WMeVQUjTKDF1CfE7R2EpG1zUzEomFZlj6CTJrgnH38uNTDNQAyA==
X-Received: by 2002:a17:90b:1b03:b0:1dc:9dc9:2eec with SMTP id nu3-20020a17090b1b0300b001dc9dc92eecmr2590706pjb.37.1652230835625;
        Tue, 10 May 2022 18:00:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ha18-20020a17090af3d200b001cd8e9ea22asm2492960pjb.52.2022.05.10.18.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 18:00:35 -0700 (PDT)
Message-ID: <627b0ab3.1c69fb81.f0415.62f5@mx.google.com>
Date: Tue, 10 May 2022 18:00:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Kernel: v5.18-rc1-10-gecc9e81aff49
Subject: chrome-platform/for-kernelci baseline: 73 runs,
 1 regressions (v5.18-rc1-10-gecc9e81aff49)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 73 runs, 1 regressions (v5.18-rc1-10=
-gecc9e81aff49)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.18-rc1-10-gecc9e81aff49/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.18-rc1-10-gecc9e81aff49
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      ecc9e81aff497d77e77430ac0ed1fa9ee1142a49 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/627b09ecb91997275b8f5725

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.18-rc1-10-gecc9e81aff49/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.18-rc1-10-gecc9e81aff49/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220506.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/627b09ecb91997275b8f5747
        failing since 35 days (last pass: v5.17-rc1-10-g0ef49b25b7cc, first=
 fail: v5.18-rc1-1-gbf84b10d9901d)

    2022-05-11T00:57:02.769644  /lava-6333631/1/../bin/lava-test-case
    2022-05-11T00:57:02.780586  <8>[   33.703348] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
