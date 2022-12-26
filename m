Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8027B
	for <chrome-platform@lists.linux.dev>; Mon, 26 Dec 2022 07:10:54 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id c8-20020a17090a4d0800b00225c3614161so6958740pjg.5
        for <chrome-platform@lists.linux.dev>; Sun, 25 Dec 2022 23:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=00JrAyulsKdMLJeYmPQo7WzhspqbDnsCWiw2BR+guNA=;
        b=Gw9slLxYpJmCsg1CI320t/HB075uKbhQur+Mt8EsFymeS0fmquE9vqCZXx2Dxnzi6Y
         VsugyWcS+JscFCPuwHzY0QkRpS/L92iUxY89BmCuZc4wF/ZhK+VdTZXGY6F7v9Ic0vZZ
         lF+cfTltf6GOO4HbkS1Xv69jR2Nv7sGXqBlLfbeSl7i1swR+ywr9oheZb/mIHxm+v+Yn
         3GN3cmcH7dHL1Mq4qTeLNjx8o+huAGtD+wjXIekgFdcDjJQCV4tuVhTx2GyFd/lnp69j
         oCrNEU5krRoS1hBLK6URVZ793eE/w5XLGxvIHfrj/WnS9I4chZP2BAlfV3zzb/brimPl
         KuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00JrAyulsKdMLJeYmPQo7WzhspqbDnsCWiw2BR+guNA=;
        b=VWqfFBCPvad/JFm4p8Uic9syqoxNTar/I7QWzlR9ecsRbUuyxdp+Bxt7WFfrTdGA8W
         xx2On6oqKPp0c1KlcRQxoyfqPW4HoR6VHYkEmkPFWR4qbDzwSeXCagdssKV9up1nYA9R
         Mg4NoveJb4ILtPoNV1OtuI9pMZF6q2zSyRMdkBdVn2AGtOS+8xhk+P3T1xaGdiORExtg
         dCoaoaCaD6nZeIMgfjghdcqkN85+Jfqg6TeAxHxc9ZMwqomb+bUsrkTXgA/HJEWU8d+S
         VrCyeSPMK1amAAEWB2vk0Q5Pu4yIyiTX1zAnJVeqfpjl1bFx0LT4zxlzccvPD0advXeT
         HYBQ==
X-Gm-Message-State: AFqh2kpt5yHNFi2XNX2JqaLTy66AMDqMwnBnBJjf48rnWpbpmrmHfK9m
	ERivrCmbyGPgjKP4q+cej8IEzQ==
X-Google-Smtp-Source: AMrXdXsK+JCVA2ezbBLj4MypIGzcSMr+AKvdRChK2ZATfye7UBghwvHFmyQHnZN1P53YcY0l/F+sig==
X-Received: by 2002:a17:903:2012:b0:18d:b86d:41c8 with SMTP id s18-20020a170903201200b0018db86d41c8mr17337661pla.10.1672038654234;
        Sun, 25 Dec 2022 23:10:54 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r10-20020a170902c60a00b001869b988d93sm6334862plr.187.2022.12.25.23.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 23:10:53 -0800 (PST)
Message-ID: <63a948fd.170a0220.209b6.beda@mx.google.com>
Date: Sun, 25 Dec 2022 23:10:53 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.2-rc1-2-g65291e76da37
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 99 runs,
 1 regressions (v6.2-rc1-2-g65291e76da37)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 99 runs, 1 regressions (v6.2-rc1-2-g=
65291e76da37)

Regressions Summary
-------------------

platform   | arch | lab           | compiler | defconfig          | regress=
ions
-----------+------+---------------+----------+--------------------+--------=
----
odroid-xu3 | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.2-rc1-2-g65291e76da37/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.2-rc1-2-g65291e76da37
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      65291e76da37b896f54a2948431f4d6ea28767b3 =



Test Regressions
---------------- =



platform   | arch | lab           | compiler | defconfig          | regress=
ions
-----------+------+---------------+----------+--------------------+--------=
----
odroid-xu3 | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/63a93c427508e306724eee3c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-2-g65291e76da37/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-2-g65291e76da37/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221216.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63a93c427508e306724ee=
e3d
        new failure (last pass: tag-chrome-platform-for-v6.2-2-g5990db2d66b=
3) =

 =20
