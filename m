Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067B63214
	for <chrome-platform@lists.linux.dev>; Tue, 10 Jan 2023 09:52:26 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id bj3so8560781pjb.0
        for <chrome-platform@lists.linux.dev>; Tue, 10 Jan 2023 01:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wGRhYgUxTwd2//gkTA4WmR+0PAQgeOYvTq2ugMx9oa8=;
        b=vx+2zvne+pc3wE7sYHVBkuXuBLy3jVzkLDr5CrOVk+0VljC3pYrQXvYStmvCKuBvHA
         hh82jr8tub8MGd4qzvwai+CTAlVk7uE9LMaGPmbmCBf3BsbHeW8W/YiiDyKRieSO2136
         RCdhOVsKkMXkiGF7THm7VdK25fqHjAR9L92SU0+Wus2/LsKMzOjAaIBSo1qKOBSn/E0s
         af6a5+jJzl06E1niJUYIzfPqrCEN/XY6PqihXWohHdID5xLh6L78muDpdO9sbp8prNXN
         Cv1gpl+T0xVHzF+jnxzmzhXozz/MJc2vhZTKX++Bj1OWDuzVaIf3Z0xdQaqK6j1ZLK7t
         mA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wGRhYgUxTwd2//gkTA4WmR+0PAQgeOYvTq2ugMx9oa8=;
        b=aYjMkJ5QQfphguJSJLsxgR+uOxUScZXBm45vd9/EDyR8lF98/InQ1Oq0B/OCCZXLF6
         2W/ehfP+oiqHN0d2DUQQQOhlW9rWf82Py932IvmB5iuSnewc0lJifC1ruoRrsoYrAnQl
         lcrlErOjFkuXVr60PnhyArGLORIL1X6hulXoP3G9V9kQ9mfBR7qcAFn8ta9yPQxiZ+Nd
         ik0LEjyOUTQ+uC7lkDPXsN1l6/HAsVYVKMjcLw2Sz/tVrUOwpShN7D7Bj0X5i3AiseVS
         tURL49Xpyv5qLKqjr6dfkXqXCjOGOnjJSyJWgj0CnVHqxhhMKpfSY5a8UQoNQMtVN2J9
         Zr5w==
X-Gm-Message-State: AFqh2kq7brCbqIGsL1fSFQ/atJPCuNC1emLQOFDoSlZY4kUKZI5A11pz
	PDeVhKLyzxZkzeBvMkZjLdgYwg==
X-Google-Smtp-Source: AMrXdXt429Dq6wOa6hXkyGQZpb6djdvXk1h4QQMuaZlwFa8XyMoL5DPvcNnJncgHbm4sDY66Vs5dzQ==
X-Received: by 2002:a17:903:2348:b0:192:fc57:23dd with SMTP id c8-20020a170903234800b00192fc5723ddmr28587868plh.17.1673344346445;
        Tue, 10 Jan 2023 01:52:26 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d22-20020a170902aa9600b001871461688esm7648624plr.175.2023.01.10.01.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 01:52:26 -0800 (PST)
Message-ID: <63bd355a.170a0220.f168b.c045@mx.google.com>
Date: Tue, 10 Jan 2023 01:52:26 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.2-rc1-19-g7b6d5b3800cb
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 47 runs,
 3 regressions (v6.2-rc1-19-g7b6d5b3800cb)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 47 runs, 3 regressions (v6.2-rc1-19-=
g7b6d5b3800cb)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =

kontron-pitx-imx8m | arm64  | lab-kontron   | gcc-10   | defconfig         =
           | 2          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.2-rc1-19-g7b6d5b3800cb/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.2-rc1-19-g7b6d5b3800cb
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      7b6d5b3800cba45ff486737a5a831a46f1196fb1 =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63bd2a596d23b6516a1d39dd

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-19-g7b6d5b3800cb/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-19-g7b6d5b3800cb/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
3bd2a596d23b6516a1d39ec
        new failure (last pass: v6.2-rc1-9-g44ff064f160fc)

    2023-01-10T09:05:04.044922  /usr/bin/tpm2_getcap
    2023-01-10T09:05:04.080717  ERROR:tcti:src/tss2-tcti/tcti-device.c:286:=
tcti_device_receive() Failed to read response from fd 3, got errno 14: Bad =
address =

    2023-01-10T09:05:04.088611  ERROR:esys:src/tss2-esys/api/Esys_GetCapabi=
lity.c:307:Esys_GetCapability_Finish() Received a non-TPM Error =

    2023-01-10T09:05:04.093807  ERROR:esys:src/tss2-esys/api/Esys_GetCapabi=
lity.c:107:Esys_GetCapability() Esys Finish ErrorCode (0x000a000a) =

    2023-01-10T09:05:04.098581  ERROR: Esys_GetCapability(0xA000A) - tcti:I=
O failure
    2023-01-10T09:05:04.101185  ERROR: Unable to run tpm2_getcap
    2023-01-10T09:05:04.101448  =

    2023-01-10T09:05:05.097598  ERROR:tcti:src/tss2-tcti/tcti-device.c:286:=
tcti_device_receive() Failed to read response from fd 3, got errno 14: Bad =
address =

    2023-01-10T09:05:05.106735  ERROR:esys:src/tss2-esys/api/Esys_GetCapabi=
lity.c:307:Esys_GetCapability_Finish() Received a non-TPM Error =

    2023-01-10T09:05:05.116521  ERROR:esys:src/tss2-esys/api/Esys_GetCapabi=
lity.c:107:Esys_GetCapability() Esys Finish ErrorCode (0x000a000a)  =

    ... (47 line(s) more)  =

 =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
kontron-pitx-imx8m | arm64  | lab-kontron   | gcc-10   | defconfig         =
           | 2          =


  Details:     https://kernelci.org/test/plan/id/63bd326896a12dc3261d39d3

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-19-g7b6d5b3800cb/arm64/defconfig/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-19-g7b6d5b3800cb/arm64/defconfig/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bd326896a12dc3261d39d6
        new failure (last pass: v6.2-rc1-9-g44ff064f160fc)

    2023-01-10T09:39:28.660450  / # #
    2023-01-10T09:39:28.762547  export SHELL=3D/bin/sh
    2023-01-10T09:39:28.763050  #
    2023-01-10T09:39:28.864432  / # export SHELL=3D/bin/sh. /lava-243269/en=
vironment
    2023-01-10T09:39:28.864867  =

    2023-01-10T09:39:28.966283  / # . /lava-243269/environment/lava-243269/=
bin/lava-test-runner /lava-243269/1
    2023-01-10T09:39:28.967227  =

    2023-01-10T09:39:28.972203  / # /lava-243269/bin/lava-test-runner /lava=
-243269/1
    2023-01-10T09:39:29.037088  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-10T09:39:29.037440  + cd /l<8>[   15.287058] <LAVA_SIGNAL_START=
RUN 1_bootrr 243269_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/63b=
d326896a12dc3261d39e6
        new failure (last pass: v6.2-rc1-9-g44ff064f160fc)

    2023-01-10T09:39:33.097504  /lava-243269/1/../bin/lava-test-case
    2023-01-10T09:39:33.098391  <8>[   19.511455] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>   =

 =20
