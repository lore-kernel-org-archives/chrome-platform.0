Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFF517D3
	for <chrome-platform@lists.linux.dev>; Tue,  5 Apr 2022 11:31:58 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id kw18so5350381pjb.5
        for <chrome-platform@lists.linux.dev>; Tue, 05 Apr 2022 04:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=d5j7/YjOIKjenu9bC6vHrnt3yPu61v1ZMRh4x8a+Qlw=;
        b=qKQtwIgR94u+XjJfsP5KdhvUpo5CmVT+Dr4xmHPYpVySfiLKDhYFfRNm2EHFwcuzy+
         N9Uq3K4cLnJwW2/rN/1B7haxtfaIkbCn8g+C2AP4jDYzlHXAMXJW3NMGakHtoY34NHPa
         wBcykkT1Bz7mvdx/g6p0nbXTbG+Q9VpuIIWdbFY9TzaHiO2tSEyqmTiz0khl+6/0B7Fh
         2UTlbMNbqxiiV5ixBLHgeSVZmtIGNBr+jwJPSHg+HWp03UfNs+IJWhyuGbBH2vQhDb/s
         Xvj+Wp4jSWxf7jNPvD1UVaZJljjTUOURNvK9VIJV4UEbytE7t73/LszeM3VTZ0SFMnLw
         fN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=d5j7/YjOIKjenu9bC6vHrnt3yPu61v1ZMRh4x8a+Qlw=;
        b=ioHr299J23OvLPqX6p5v+g/pbz5dSMSdLgzxEzngqD083xM6XH5Hrry+I9DXdV6QiP
         MDhVsHCNd1eYzTw03qaSk4J6utVDkUpJjtF3eyjf8BNI1TsXrtpWmzDtC4X44qJBNa+x
         BiY5pDPZj/OuneBcCQUdHA5VSo5KIHcHqHVMiYV9SFBtou+lA4Zr347+d1qrIjsb3SKe
         Wkl+3dCz6IFJ/SGKjtpV+fzl91Iefpavx0mEA47FRns8p/js0XvK7FtqRJq+4bFeAsnz
         tWIwiRWjtpTi3rkJH3VBx5lxj5bSjqjBlc4lVK6Ax5qIIIuGklZlIv+xY/iGEXc2dcRi
         NAmg==
X-Gm-Message-State: AOAM530CJEak8yj4t4u/tQt4JNq9uEfVmE+wB3+WrOx0o0JpSsz+KE9B
	1jEKJrlG3REOc/nPZqF2RH/t2A==
X-Google-Smtp-Source: ABdhPJzR5ZN05g682xnbUdbJBuNvSuUTz5JWfLGVvIYhhGvC+1aE9OVuzi+AfpvJIptsh8BpCsbSPQ==
X-Received: by 2002:a17:902:f542:b0:156:b46e:2403 with SMTP id h2-20020a170902f54200b00156b46e2403mr3088687plf.62.1649158317640;
        Tue, 05 Apr 2022 04:31:57 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d21-20020a056a0010d500b004fd9ee64134sm15345515pfu.74.2022.04.05.04.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 04:31:57 -0700 (PDT)
Message-ID: <624c28ad.1c69fb81.47c44.7e0f@mx.google.com>
Date: Tue, 05 Apr 2022 04:31:57 -0700 (PDT)
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
X-Kernelci-Kernel: v5.18-rc1-1-gbf84b10d9901d
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 35 runs,
 1 regressions (v5.18-rc1-1-gbf84b10d9901d)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 35 runs, 1 regressions (v5.18-rc1-1-=
gbf84b10d9901d)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.18-rc1-1-gbf84b10d9901d/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.18-rc1-1-gbf84b10d9901d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      bf84b10d9901ded51d33411499079ce64e0c4ae7 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/624c25dc6a7c137aa7ae068f

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.18-rc1-1-gbf84b10d9901d/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.18-rc1-1-gbf84b10d9901d/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/624c25dc6a7c137aa7ae06b1
        new failure (last pass: v5.17-rc1-10-g0ef49b25b7cc)

    2022-04-05T11:19:40.109905  /lava-6025967/1/../bin/lava-test-case   =

 =20
