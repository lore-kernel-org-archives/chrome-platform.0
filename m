Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC112F29
	for <chrome-platform@lists.linux.dev>; Tue, 11 Apr 2023 11:05:23 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id w11so8127809pjh.5
        for <chrome-platform@lists.linux.dev>; Tue, 11 Apr 2023 04:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1681211123; x=1683803123;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bIubKLN8i+iyTLoWyJpBhX9NqrRyuQMk+uzkmfhlpV4=;
        b=Aa50DpAcSBTG66xV1Tk/DFTXf6cLg0BTxfWVi6T6SKjeB30aTcDz7dLkvGU+HMS8b6
         34trueh6faN7tu8fCLPLnMDELsBCF8g+/HbKWg5vtc/nnFXCvs4ash9BP6JbVnD0499t
         jM0heD1Qqm9XnyVHqZii0I4um+fPhGafp0gPkUlVLvqvocqfHPZL1XbqGZCm1Y/0M1UU
         uUlUT2u+4BKArGfI8+QPFVtYXwWVFN7mSmry27ZnTEUIu6xUwwoSH1uNS/sV9MMt4Ncr
         xKfp2Zq0dl68aV4m2MjC77prOrxzSGpxVEED6GvgrOHt4LIRhuTknrxCsHH56kYPY7Oo
         ZmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681211123; x=1683803123;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bIubKLN8i+iyTLoWyJpBhX9NqrRyuQMk+uzkmfhlpV4=;
        b=4nYNmWjnST18AWytkUep+B3cBwPAhhDMQni9tWwuF4yzac5dje7y+sImbxooh8Fi0I
         ZTJC/0VjczHX8FCYVtMHLujFwOqmCk4E0JS8SqYWYhRtmS+zsTIEsjTMoa2km7MRnLEe
         kCWmLviY6ftsnNXoKdd/NgdlcrVILdrMzMf6JCJ+k0jqQdhN7iSz8VUuBSmPIDzztCDx
         YBShoFOwcYORSKBg0+q9d3SnSKMaZSSoerK8BwB2bzZo3pKdnOcb+aG3fSSJ0SNjaoAo
         oVeUZfuU8tNXvnl8xpX4D4c3gdH/cSM9PNJuYsne36t5evii0Z/dAPsU5JvwJ2M499xR
         tx6A==
X-Gm-Message-State: AAQBX9fi5mpox/JNVa+LmDMWzEcKS3fsKjRpMztL/bLVyJOTaDBvmmBL
	0kK7zpEMzHxY6U78UmHpyCEWMQ==
X-Google-Smtp-Source: AKy350ZPxeruhx2r7RvdGMba/vUYOdJfmnkZUqi09Wl7lDO6+6opCNR4u9bgxxZtZV3n18iDnNWSlg==
X-Received: by 2002:a17:903:230a:b0:1a6:3ff9:7bfa with SMTP id d10-20020a170903230a00b001a63ff97bfamr8778918plh.57.1681211123086;
        Tue, 11 Apr 2023 04:05:23 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q5-20020a170902788500b001a1a8e98e93sm5657330pll.287.2023.04.11.04.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 04:05:22 -0700 (PDT)
Message-ID: <64353ef2.170a0220.545cc.a4cc@mx.google.com>
Date: Tue, 11 Apr 2023 04:05:22 -0700 (PDT)
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
X-Kernelci-Kernel: v6.3-rc1-7-g419346a03810
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci sleep: 7 runs,
 1 regressions (v6.3-rc1-7-g419346a03810)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 7 runs, 1 regressions (v6.3-rc1-7-g4193=
46a03810)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.3-rc1-7-g419346a03810/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.3-rc1-7-g419346a03810
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      419346a0381034fcc0866be9605108c8612847de =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643533f7da8fd141f92e85f6

  Results:     12 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/sleep-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/sleep-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230407.0/arm64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/643533f7da8fd141=
f92e8600
        new failure (last pass: v6.3-rc1-6-g14bb09b32f43)

    2023-04-11T10:13:18.710107  rtcwake: assuming RTC uses UTC ...

    2023-04-11T10:13:18.716460  rtcwake: wakeup from "mem" using rtc0 at Mo=
n Apr 10 01:08:33 2023

    2023-04-11T10:13:18.730290  <6>[   35.747416] PM: suspend entry (deep)

    2023-04-11T10:13:18.755101  <6>[   35.770695] Filesystems sync: 0.000 s=
econds

    2023-04-11T10:13:18.770950  <6>[   35.787824] Freezing user space proce=
sses

    2023-04-11T10:13:18.794286  <6>[   35.807298] Freezing user space proce=
sses completed (elapsed 0.008 seconds)

    2023-04-11T10:13:18.801670  <6>[   35.818737] OOM killer disabled.

    2023-04-11T10:13:18.809611  <6>[   35.825928] Freezing remaining freeza=
ble tasks

    2023-04-11T10:13:18.823267  <6>[   35.835522] Freezing remaining freeza=
ble tasks completed (elapsed 0.001 seconds)

    2023-04-11T10:13:18.833472  <6>[   35.846964] printk: Suspending consol=
e(s) (use no_console_suspend to debug)
 =

    ... (15 line(s) more)  =

 =20
