Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABEF391
	for <chrome-platform@lists.linux.dev>; Mon,  3 Jun 2024 02:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717382723; cv=none; b=IxtyOB1sdGuko6VWeIrYzW+plXEZCGs5yEWxbnGPV6TqyP7zKSUEMZnte6KecJbhk1B4ndKZNpM2kLDdr7qEPpUaP0lgNW8KH+6B8UJO/k/gmIWvwgbgmMGOCmz4WIakaPBT5hUzlNsuy4TGDmUZwAI/PHs/gZtE1QnZb1xjP8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717382723; c=relaxed/simple;
	bh=3FBhCqbR5aHko72kwMH2YesDiRALYhDUBeEPozspw+g=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=tuEXWjDTQ0a4GIiaUt+P52yo525ZLWLYLFnUXJkjZfFOfz2q22oAeV4KKwIGIvzdQ2rCTk9Rs0Hdj5ss6EOuTRe1pDa6e82fin2I49ir5+7ZPqbMypRbgH3F3HY/spow7OkeCCH7Ey2PKRHB9kjo8piJJBcAU0NozHsZlE39PZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=bQhv7JwD; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="bQhv7JwD"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-701ae8698d8so2913741b3a.0
        for <chrome-platform@lists.linux.dev>; Sun, 02 Jun 2024 19:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717382721; x=1717987521; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o+bIW8a9PqpNXWMHrFrerBsF0bWjuj/lcd6rmP+0GTk=;
        b=bQhv7JwDYrPC1d3cxWpd+3KTw0J/+aTgYiv1SxqXN4Me2Qhe7CRpi4iOlDR8pbmKUf
         e1XNqfeNl8JLQzCmGeAqlx6DTy0FiXifgpsZjfFNa2omf24jo9Ad1j32JfEsM8IkBnUS
         5wDSAQBkmqe/Y8nDqedagVy5B4v/LSNkt3KDMDI8i5UqKZcnHgCxiUtao8S4pI7o77/O
         kyukGNM3K+z/nwq0zT20uFQ5hPZXXFY8xY5HwKHIALIM2sUQbiq8qX6aVGoASbP5z9ln
         25Y8u1iErSonAN44AnCARs7PtIEkt54Qhzh8TS0QbSGGsUJi11DgjIYqSJz+Kkz99hFh
         Q0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717382721; x=1717987521;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o+bIW8a9PqpNXWMHrFrerBsF0bWjuj/lcd6rmP+0GTk=;
        b=YH0aAukXXNcYg8VpXr0rN2MnbtEfzNq4j+6bRQ9gX/dH5HpJ9DIVQJwfhBAgQCrjy1
         xbrynUAhxeQn3kPeh9LKfaf/oCbum3JaEvuJWKOjZJCLQolCXQcGnkTyQEL0JZO0+shW
         Ol6R+1P/crpTi0OPOOno7BDFWOgVyW1TIgnMZ9UD3snOrgdVK3Nyojqlr9BzSHe0+Q+w
         CS90CQOq/AaQw0xkHuD0X9eX9sszsBLQGL5tnXBCFj4bfzTDsQvLRtVgIzG04xH+ULDs
         47bMKeTxbDH1+VU7uh1lmrl/P4+F7oQ6bvJKYUYvGvf0E/gRMUsIq6L8d2gCOSyqA1V2
         ZGRg==
X-Forwarded-Encrypted: i=1; AJvYcCXSbYkyysqjOnEIHAv+D0dooGpBGbDk/U3KLAqge+d3GdQ+nrmkjFPIiMe8Yg3DDecDmED83uFYqGNzf2E6li+iO2k78tP2dIlLsPmWkdYd
X-Gm-Message-State: AOJu0YzmT0hIQfyWPCXdk4DFKdMi/5H/yvgAMChGiot7TlrVBWlstILT
	w7+Wkx+eip2VpxlN8dVGKbh6aRCRW5u7XOevsD7lhMGGQUyprhTSDScP5p0ngIQ=
X-Google-Smtp-Source: AGHT+IG9ypDYK+f9t8x9fwYRjBTjRo2qcnltFPDn8GRXRcuzMrc8lQsxqqa69Xh7gtQVLOqA9GrL7Q==
X-Received: by 2002:a05:6a20:1582:b0:1b2:512e:7db5 with SMTP id adf61e73a8af0-1b26f17e326mr8948922637.30.1717382720785;
        Sun, 02 Jun 2024 19:45:20 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1c283164fsm5376209a91.37.2024.06.02.19.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 19:45:20 -0700 (PDT)
Message-ID: <665d2e40.170a0220.38bb4.d793@mx.google.com>
Date: Sun, 02 Jun 2024 19:45:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-6-ge8665a1723789
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci baseline: 93 runs,
 4 regressions (v6.10-rc1-6-ge8665a1723789)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 93 runs, 4 regressions (v6.10-rc1-6-=
ge8665a1723789)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =

mt8195-cherry-tomato-r2      | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-6-ge8665a1723789/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-6-ge8665a1723789
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      e8665a172378986159ce8aaf45712c43472f5866 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/665d25413ca353980d7e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-ge8665a1723789/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8m=
p-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-ge8665a1723789/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8m=
p-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/665d25413ca353980d7e7=
06e
        failing since 4 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first =
fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8195-cherry-tomato-r2      | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/665d2398a26980d03b7e70d9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-ge8665a1723789/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-mt8195-cherry-tomato-r2.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-ge8665a1723789/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-mt8195-cherry-tomato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/665d2398a26980d03b7e7=
0da
        new failure (last pass: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/665d2441ea1df725087e707e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-ge8665a1723789/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-ge8665a1723789/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/665d2441ea1df725087e7=
07f
        failing since 4 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first =
fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/665d2456dd8a4f3c127e707d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-ge8665a1723789/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-ge8665a1723789/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/665d2456dd8a4f3c127e7=
07e
        failing since 4 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first =
fail: v6.10-rc1-4-g7b44d5381e541) =

 =20
