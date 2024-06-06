Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0601E6BFD2
	for <chrome-platform@lists.linux.dev>; Thu,  6 Jun 2024 07:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717659149; cv=none; b=dKG3EK2OMqfUF9tj89wHbtrgwT9bV+lSqmU1dTcs+BnkQfSg+Hp6c2gJZay6pF63ZZTuXJiR0ozBeMZIpddcwFxKfewg/S585tEIhr8T5Ciz3zSpxMl4vafkbwpYXikUiTi+3GqAGmolvT8NRkxm99Nmxxkm4QrPzUKZVx4+wgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717659149; c=relaxed/simple;
	bh=6VncgpulNalxOzQ8suYvtTzH6jsLQjSj3Pk3fdGNTcQ=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=fGdsx/SKwLSh96n5yUjWHkGRVxUbEeJidpw7iWQmxv8mEScl7cGgD2Z/tcAkawjYMwBbX13i3SKpbKWwtiB9VXMsOqyMYd7qOoFDxf+BCMTIMXViNw7W56D/UyqnyNOMDfCNtueJIqCKUyLi8ihUocTzTTMBZ3u/oTuQ4BYmXwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Cs7/q00k; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Cs7/q00k"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f62fae8c3cso5876455ad.3
        for <chrome-platform@lists.linux.dev>; Thu, 06 Jun 2024 00:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717659147; x=1718263947; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uXAE+oFJ7NlIMirtqseuo8pS4WHwz8JAXvBwF1K6fgU=;
        b=Cs7/q00kwr+ax/n2JuzkcSmLZ2W3/hqueF1Qoi3sWNapKq39IjGsZFlpOh/UCZJi0I
         hivwx3swfgSt8FWdaTUrIoJdjnqwZ5ZzyYk9v8hTEt/uuqWOwSWym68y0uvTnAmAQ+We
         O9fHoCbKOYeDOON/6CKkmKWhkkjt8xRRaUF6g/EbXYAH5JY/LUVsLnISRfEWA86b+o54
         vyU/jfl1Jtn0WTlY085mqO/nGwgQ6aO9bJ2LblVzVCfdZlLDWOhFvvHtJb9QxqqsNLbi
         1I3IUkS7U2Xei4KD84Fl+SwjG3v0lS//Fx/TTP+B+EDgCFbpb3CBCuXdTD8J2xSejaC2
         L4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717659147; x=1718263947;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uXAE+oFJ7NlIMirtqseuo8pS4WHwz8JAXvBwF1K6fgU=;
        b=F5yEXfwzLcHZeDnALEIbwhvuCk9LzczSrpATcEC4rkfRveMwzeLJWO/3BZP3bAbR3l
         C0LCRxm513C679kr/om4QDD6CHPZEye0cXm3FtbyQ4DedU9Y27ffV9XJc0EXc5H6R5l5
         gBUxjZYJ7d+58lJRE2mpYCvWlcSEZ+idwHvFX4msSqbsH+Wk4ZyfKGnBX3R5e5UoTvdQ
         KKcqtZ+mnVHt8m4Mr+tWGW34kPfaJvwIHYLGygaO7mfAjJaH3D9v/owJqciikA6yYY+X
         q98zsUlmgBszvBhCpMhX4gdybgjyWI+fcR8NpuXtllzjyk8fAa9wf9ZTQOfC4qV/InAo
         vFBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYA0DkzzZVT8fXsvN/Q/M1Jev9nJeyEAqtzr3vPpQ17kLSr69k34mOnVgQXnVU/cyC8NKLrk/4zn/WDzIItRXel6IZ1b5QtaeYaAP5ULMG
X-Gm-Message-State: AOJu0Yxuq+M07gVYTdRsKqrFtAg8xfdPO7ueQGdnuYn2SfJSwCoz4IBP
	l0L938vsC5O360I18DxoUOAT5rsJC4lwMh+hlpMC/DyfflJE73/tyb9sjJrfniU=
X-Google-Smtp-Source: AGHT+IFQsr/FPuq4vUUYUIKfZOOSd8b1EAG8W11lZy+utjb+8qNvdN2S3wgodz0QNiZ0Y0uUuezQnA==
X-Received: by 2002:a17:902:e84d:b0:1f6:7fee:8fda with SMTP id d9443c01a7336-1f6a5a86ac4mr57491605ad.64.1717659147262;
        Thu, 06 Jun 2024 00:32:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd76155csm7739455ad.43.2024.06.06.00.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 00:32:26 -0700 (PDT)
Message-ID: <6661660a.170a0220.21f875.1c7e@mx.google.com>
Date: Thu, 06 Jun 2024 00:32:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-13-g04ca0a51f1e6
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci cros-ec: 11 runs,
 3 regressions (v6.10-rc1-13-g04ca0a51f1e6)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 11 runs, 3 regressions (v6.10-rc1-13-=
g04ca0a51f1e6)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-13-g04ca0a51f1e6/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-13-g04ca0a51f1e6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      04ca0a51f1e63bd553fd4af8e9af0fe094fa4f0a

  Test suite revisions:
    cros-ec-tests
      URL:  https://github.com/kernelci/cros-ec-tests.git
      SHA:  fad9423ae3c64bfd48c207de34a1177000d45fa8 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/6661586d20646ac3e87e708c

  Results:     2 PASS, 1 FAIL, 13 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-13-g04ca0a51f1e6/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-13-g04ca0a51f1e6/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_chardev: https://kernelci.org/test/case/id/6661586=
d20646ac3e87e709b
        failing since 3 days (last pass: v6.10-rc1-6-ge8665a1723789, first =
fail: v6.10-rc1-6-gbc3e45258096f)

    2024-06-06T06:34:17.138604  test_cros_ec_chardev (cros.tests.cros_ec_mc=
u.TestCrosECMCU.test_cros_ec_chardev)

    2024-06-06T06:34:17.144819  Checks the main Embedded controller charact=
er device. ... FAIL

    2024-06-06T06:34:17.145328  =

   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/66614f1cb2aee051a27e7079

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-13-g04ca0a51f1e6/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-13-g04ca0a51f1e6/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/66614f1cb2aee051a27e70=
7a
        failing since 7 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first =
fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/66615e32d1dd9ea4287e7099

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-13-g04ca0a51f1e6/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-13-g04ca0a51f1e6/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/66615e32d1dd9ea4287e70=
9a
        failing since 7 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first =
fail: v6.10-rc1-4-g7b44d5381e541) =

 =20
