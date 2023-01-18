Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FA915A8
	for <chrome-platform@lists.linux.dev>; Wed, 18 Jan 2023 04:45:41 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id v10-20020a17090abb8a00b00229c517a6eeso1089278pjr.5
        for <chrome-platform@lists.linux.dev>; Tue, 17 Jan 2023 20:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s4yw5qAbOKm4Xc7yrFVCRS9IfPImdYpgqfEKwjLnu8U=;
        b=klXujviBCiMqTIY+2Rs3j3cY73o13rlJTkO3pCBEC3AwpL7DKMipVR3K+ofQqyXi/T
         Wtlz6amu3n5p6UcdiRK8u6yqWl0lmSxlsZaF5Lf8eJYyhpKGUCqv0kHUTHF6+USRJpvB
         Azm4GRjMHEuTQJUZXyFO9cFpd6EFeh+CgIN+D+r1F5NyGoeH2WqUStq7A6UM3e90y8vs
         EC9K86ujtMh9krDYJgja8XARHOgKuJEOC3HQB02KtHf/udyS32N9scKPwzkUmZ1VUOsY
         O3e3r5+f35gDAoop/4Ee9ZnAzc5ETa7TtJtvNEfcyrNTEzSf5/QIOFeFy+mgka6/D07S
         ythQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s4yw5qAbOKm4Xc7yrFVCRS9IfPImdYpgqfEKwjLnu8U=;
        b=F0K6j7JiEs8uXq6LEXGHwR+PPYNN0dv982UsaPhUecRaANwOT/vJK2mXj8B8JFS6dl
         Vx1ibOolJmgCeqiv7+MwuVwfATYWy83+DnFVY6EG607kgvWuDErzk0cZWamGejAZiFf/
         JYrUt2YbKW3oaGHilysV5XVhOAwnVo8FMOWJ9E0nBkUUiTO0iFpy1DjfYbaEqWL7zwZO
         27xQBqz68BSzmQhkf5f2FazGUT2wHUyJBf9OrBK/Ip0hs4KAyyyyMOByCgeLgVXk5IGX
         8U42Yvmid4dQswo453eT8m6swqMoZI3hF3qLgfRav8K7U6+nOnQPujC1RYu1IUAOt+Ok
         xmBw==
X-Gm-Message-State: AFqh2kpDa/dEUQLb1u55l2W9Nboyw9YQS2aGB0+hRFTWvapqiY+6EL4W
	SYdjijS48FjBdMraoMtQx09k2g==
X-Google-Smtp-Source: AMrXdXtPSrYczZbj5rn83DeSxxCfEVKPPXES1qMOBxqMRXQfnisoY7NeDRG2X+BbiysVGue3ABizSg==
X-Received: by 2002:a05:6a20:4c9f:b0:b8:694c:201 with SMTP id fq31-20020a056a204c9f00b000b8694c0201mr5342119pzb.11.1674017141343;
        Tue, 17 Jan 2023 20:45:41 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 207-20020a6218d8000000b00580d877a50fsm20981108pfy.55.2023.01.17.20.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 20:45:40 -0800 (PST)
Message-ID: <63c77974.620a0220.5a749.1e5f@mx.google.com>
Date: Tue, 17 Jan 2023 20:45:40 -0800 (PST)
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
X-Kernelci-Kernel: v6.2-rc1-30-gf2fe7d2bb64e
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 102 runs,
 2 regressions (v6.2-rc1-30-gf2fe7d2bb64e)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 102 runs, 2 regressions (v6.2-rc1-30=
-gf2fe7d2bb64e)

Regressions Summary
-------------------

platform           | arch  | lab         | compiler | defconfig | regressio=
ns
-------------------+-------+-------------+----------+-----------+----------=
--
kontron-pitx-imx8m | arm64 | lab-kontron | gcc-10   | defconfig | 2        =
  =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.2-rc1-30-gf2fe7d2bb64e/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.2-rc1-30-gf2fe7d2bb64e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      f2fe7d2bb64e9d2369f2348ccc77f8de19ab58a8 =



Test Regressions
---------------- =



platform           | arch  | lab         | compiler | defconfig | regressio=
ns
-------------------+-------+-------------+----------+-----------+----------=
--
kontron-pitx-imx8m | arm64 | lab-kontron | gcc-10   | defconfig | 2        =
  =


  Details:     https://kernelci.org/test/plan/id/63c76f031920d77c97915ed3

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-30-gf2fe7d2bb64e/arm64/defconfig/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-30-gf2fe7d2bb64e/arm64/defconfig/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c76f031920d77c97915ed6
        failing since 5 days (last pass: v6.2-rc1-23-g93899a4cb7b1, first f=
ail: v6.2-rc1-28-g24ddc3b53a9d)

    2023-01-18T04:00:52.500943  / # #
    2023-01-18T04:00:52.602941  export SHELL=3D/bin/sh
    2023-01-18T04:00:52.603400  #
    2023-01-18T04:00:52.704933  / # export SHELL=3D/bin/sh. /lava-249345/en=
vironment
    2023-01-18T04:00:52.705592  =

    2023-01-18T04:00:52.807008  / # . /lava-249345/environment/lava-249345/=
bin/lava-test-runner /lava-249345/1
    2023-01-18T04:00:52.808106  =

    2023-01-18T04:00:52.827988  / # /lava-249345/bin/lava-test-runner /lava=
-249345/1
    2023-01-18T04:00:52.844042  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-18T04:00:52.879911  + cd /l<8>[   15.523544] <LAVA_SIGNAL_START=
RUN 1_bootrr 249345_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/63c=
76f031920d77c97915ee6
        failing since 5 days (last pass: v6.2-rc1-23-g93899a4cb7b1, first f=
ail: v6.2-rc1-28-g24ddc3b53a9d)

    2023-01-18T04:00:56.938390  /lava-249345/1/../bin/lava-test-case
    2023-01-18T04:00:56.938777  <8>[   19.748397] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-01-18T04:00:56.939023  /lava-249345/1/../bin/lava-test-case   =

 =20
