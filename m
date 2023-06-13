Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B683C25
	for <chrome-platform@lists.linux.dev>; Tue, 13 Jun 2023 10:56:11 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-39c7f7a151fso2945835b6e.0
        for <chrome-platform@lists.linux.dev>; Tue, 13 Jun 2023 03:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686653770; x=1689245770;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4g5/tin6q3k7S2vplcVJ0cfbIIcDOI7k29TXcQ+7YVQ=;
        b=Zso9lsRy4MZgSKDIpGbvtfzHJDjCZ3h/oYZTNccDoSp+OLbukV+T7YLkZQkewhIzbK
         5gH3KCZNg2ZrO1bRnkNL4c6CNYy+a8gzJBLq87Lbq2xhs1YBBPZ6rjjV+h1QKI83KnwM
         SZJ1b6yvwasRRIXGY+8n4M04rceWbBf+vn9hh/NKEGO9M16LrXbkk2QAb7QHGczy1r9q
         T4YyDJBfrwD2usxk2+ep8LSh2Kruqwli6Yfiz4Y9eCVT0LsIiiGCOjuK9MLrbOT3Bk5P
         nkYUiSRZh49XYzCjUrXEUJ9EWv5du8wPM1K3SckPGdMgnhMtLRuXrhZsLJ4c0WezL/eC
         zaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686653770; x=1689245770;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4g5/tin6q3k7S2vplcVJ0cfbIIcDOI7k29TXcQ+7YVQ=;
        b=YgB/VVYxXl7JrRYt7ObrRqcq+2oFWBnYTReb72VpLhoVYUFQdcTKGG3/gShnrmSuAr
         KdUbiFbl2RtzNOMsnJ3O/AUatX+vvXJ8dbGdsp2vDA1AxkM9MfiwlaobIh8kIxrynfrP
         rS7KjqIunOiw3x0kXpgmJ/HwtOW+s2+tQUJqS7j7wzE0qQR6Lj7AqUWPYXqzKAXgJPwM
         /+FdwklUekMsEbWuWgqAfk9TUhxXXZha3mubrp/cUIRcIki3HKNJSjLPbUbFPJZVbiIJ
         ljRCM+/OJCoSILD23KVP1kbTDrxMPZQvJiKUtgEnb6kKqSob9S+kmf4A5w/YgiGCNzG1
         006g==
X-Gm-Message-State: AC+VfDy/dVISM292kdxfsmEb+1xXsuYA6ejS+bLFtsLAfZ0kgkwfPHz1
	7kKKptnJidpTKucd/wvr8BtpFQ==
X-Google-Smtp-Source: ACHHUZ4UjPKxHyJkuf/stDKtYbGBfEaEo0L1x+GX+lw5PSylSi2GPOaPRapi6erIiiiPbooEBbOtMg==
X-Received: by 2002:a05:6808:7db:b0:39e:5892:8535 with SMTP id f27-20020a05680807db00b0039e58928535mr331512oij.34.1686653770566;
        Tue, 13 Jun 2023 03:56:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id v11-20020a170902b7cb00b001b3c66f806bsm4290626plz.217.2023.06.13.03.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 03:56:09 -0700 (PDT)
Message-ID: <64884b49.170a0220.329e2.7a86@mx.google.com>
Date: Tue, 13 Jun 2023 03:56:09 -0700 (PDT)
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
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.4-rc1-5-g2b8cc5858a07a
Subject: chrome-platform/for-kernelci cros-ec: 11 runs,
 3 regressions (v6.4-rc1-5-g2b8cc5858a07a)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 11 runs, 3 regressions (v6.4-rc1-5-g2=
b8cc5858a07a)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.4-rc1-5-g2b8cc5858a07a/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.4-rc1-5-g2b8cc5858a07a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      2b8cc5858a07ab75ce98cae720e263e1c1b0d1d9

  Test suite revisions:
    cros-ec-tests
      URL:  https://github.com/kernelci/cros-ec-tests.git
      SHA:  fad9423ae3c64bfd48c207de34a1177000d45fa8 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648835dbdddc95ff4c306170

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230609.0/amd64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/648835dbdddc95ff4c3061=
71
        new failure (last pass: v6.4-rc1-4-gf5bb4e381290) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/648838ea77db897630306173

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230609.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/648838ea77db8976303061=
74
        failing since 35 days (last pass: tag-chrome-platform-for-v6.4, fir=
st fail: v6.4-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6488377870c0a4d2a630612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-5-g2b8cc5858a07a/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230609.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/6488377870c0a4d2a63061=
2f
        failing since 35 days (last pass: tag-chrome-platform-for-v6.4, fir=
st fail: v6.4-rc1) =

 =20
