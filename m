Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11B27E
	for <chrome-platform@lists.linux.dev>; Mon,  6 Mar 2023 08:38:35 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id h17-20020a17090aea9100b0023739b10792so8168668pjz.1
        for <chrome-platform@lists.linux.dev>; Mon, 06 Mar 2023 00:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678091915;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o0LSnUIrTFFqGIOk/UUdBd1AoK5MtZ1FYQ6h9cyOCsY=;
        b=4LZx7GxdrmExwhb5EF/uvVawWOgbC+Ltg/yXTk7WLD4EnoRKDzKyJD4zrtoPNxop56
         fzca/j+kqwaa++iS90CQ2DCML3t4yKUwhpQQTNYg5QGsYqYgKkX7ij7IlSd/spuptYvs
         MBh22DPRAcjwnVdjPEXhJbusn2/C5LsOApWQDR544Tq8VZNqJFiaZ8M+TcDoT84u08fm
         kGKdQhcMnUDjeVnvn7Ux+zqNH5/cYS6re3zmDiwnGUHweGuBVbNGrITDf2ZsXYX6P9bq
         yk1M6mjrxfLDyRLe3MlGBaRADpT0FjzulRDJQic+lCLoX587BL+mV8jwEmEO28Ypq9qs
         eI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678091915;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o0LSnUIrTFFqGIOk/UUdBd1AoK5MtZ1FYQ6h9cyOCsY=;
        b=Y+jdWgPSDxxznBdcoI+VWyany8C6PWsdiK5Kfr0UuiE2EN4oUf9yyU6nFY889McqHK
         sj7F6AWs0aqg3d6pnDg6CmUCNqaKNoi02z89u97UI5W841Z1fupwNR20RdD7S0hMWnf+
         pUA9Y3KEGW5lhy+v5Q7/kLgkr7n6QsxdlZuQlQZPFiyNH/ktV0E7aypz9yKKFDqgjWAY
         Hi7H/bUCn4QWSV20/V3kiFXHo/9guXUVbnnBNuOBhQAPina/3rQ+qTQCdBx0fwWTTe0D
         aubuTad4YHkx58w5Nw/+4+ckFPlXiQWwCEdEaDFbxi7b9aAuGvdhEr+BtiJLDSIWlDUx
         WqAw==
X-Gm-Message-State: AO0yUKW/5EysmqoT2eF+H0hln+b559WFZ4wItkA1539FGme4ElJNFFzL
	9BBvPG8V1p0VrbeOReXW0xUUiA==
X-Google-Smtp-Source: AK7set9aa64Gk7eKTUU886gWlXKbvnLwgR1KXCVnnCXrh1K0aEBTjaT8OqLf8oHJSjgcNT+JjrXC6A==
X-Received: by 2002:a17:90b:1b08:b0:234:148:4b27 with SMTP id nu8-20020a17090b1b0800b0023401484b27mr10746806pjb.17.1678091915136;
        Mon, 06 Mar 2023 00:38:35 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c14600b0019aa4c00ff4sm6057480plj.206.2023.03.06.00.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 00:38:34 -0800 (PST)
Message-ID: <6405a68a.170a0220.91463.a7eb@mx.google.com>
Date: Mon, 06 Mar 2023 00:38:34 -0800 (PST)
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
X-Kernelci-Kernel: v6.3-rc1
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci cros-ec: 12 runs,
 1 regressions (v6.3-rc1)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 12 runs, 1 regressions (v6.3-rc1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.3-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.3-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      fe15c26ee26efa11741a7b632e9f23b01aca4cc6

  Test suite revisions:
    cros-ec-tests
      URL:  https://github.com/hardboprobot/cros-ec-tests.git
      SHA:  f6c0dbf63842d5751000c5527808aca38354db55 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/64059326b6365ad9798c886a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec-tegra124-nyan-b=
ig.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec-tegra124-nyan-b=
ig.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230224.0/armhf/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/64059326b6365ad9798c88=
6b
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d) =

 =20
