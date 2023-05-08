Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A012D1361
	for <chrome-platform@lists.linux.dev>; Mon,  8 May 2023 12:59:19 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-64115e652eeso34323608b3a.0
        for <chrome-platform@lists.linux.dev>; Mon, 08 May 2023 05:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683550759; x=1686142759;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NIod9JzLzkDZekaFHoOkqIhdIhI6ZD2h9Htaq9F1oM8=;
        b=clcSnc+XOy3QKegrYQGrC/atABkKreV+gHU4sn5lHPc63bglkLjXeSkD2NP/0nZWgr
         0f8wKgbKSjDcPA/3NqRkXWTKd5i2tM8cfKy/8H3x6JAd7fN5LCZH8cTvfEjW4SCBT96V
         9Ep1JbMhM+ggx7X8zApZyqTs3F4yMIH//IwqM+RQpYjjVrQR/jjxcGvatgUXDQGZO1Zo
         UY/mFqwj0s0DGQ5/Gce7uFioh+lrrsg4e8Zvkns2vcT/wS9IaFNogs5WIdesrKnBb2Zf
         MGkWz034iy2Z2oppI/YkY8dDuuQxbvnZAln4obC6nnyEO84P8dZ1H3Gly5qwVulnde4Z
         f1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683550759; x=1686142759;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NIod9JzLzkDZekaFHoOkqIhdIhI6ZD2h9Htaq9F1oM8=;
        b=apT0rTQnA5Vd2qY6BHttId81aEguMf7Xcy/BY23t7BrlbVdCvDFh93tRTn9w4tWdK0
         5hqJ3hm9NCFXxeQSP9YHV6k1D4SeN+zONdjuwYNwaoi2LgR3KWi6uQdNwUJ6wmxCChG+
         rcCBjPk2dVpoEBeBV8YESPC6uDkHxAzh37ofASfDfwHVFCeRBVMc2pf6bddCKBZLBfUx
         N+y8atTjMVaCGDLUWp6s69x1cpxqgrFrfMn758XjMHK4H4f2vXegduaM6ARmu8QzCc/d
         HY6u0aDySGXpjKCl7G7jhEYmag/JRtX0vQYgtbtPQeF88zPYTUcTPMzCcrIODXZq5z25
         5EZw==
X-Gm-Message-State: AC+VfDxb0BDSBhWNjggf1SNgsuK0s0DFyoDiOZGvMFmkp/jiptkNKEIj
	jJpJKfn/5hDN/K4Je7BCXJf+kjsghevVyAW4nlB1BA==
X-Google-Smtp-Source: ACHHUZ7FQxopy2YZDXqw/4qB8B8xHsvhDsjj60OUUeEGip2KeB44sT/IIjQNloGlj3aMrvA9Li8NcQ==
X-Received: by 2002:a17:903:192:b0:1ab:1260:19de with SMTP id z18-20020a170903019200b001ab126019demr13407397plg.11.1683550759113;
        Mon, 08 May 2023 05:59:19 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902b71700b001ac897026cesm754012pls.102.2023.05.08.05.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 05:59:18 -0700 (PDT)
Message-ID: <6458f226.170a0220.810f7.11b4@mx.google.com>
Date: Mon, 08 May 2023 05:59:18 -0700 (PDT)
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
Subject: chrome-platform/for-kernelci sleep: 8 runs, 2 regressions (v6.4-rc1)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 8 runs, 2 regressions (v6.4-rc1)

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
ci/kernel/v6.4-rc1/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.4-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      ac9a78681b921877518763ba0e89202254349d1b =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6458e90962ac6b7b6f2e85f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sleep-mt8183-=
kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sleep-mt8183-=
kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/6458e90962ac6b7b6f2e85f7
        new failure (last pass: tag-chrome-platform-for-v6.4) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6458e8a128095b15582e860d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sleep-mt8192-=
asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sleep-mt8192-=
asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/6458e8a128095b15582e860e
        new failure (last pass: tag-chrome-platform-for-v6.4) =

 =20
