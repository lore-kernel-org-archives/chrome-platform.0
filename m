Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0C217BB35
	for <chrome-platform@lists.linux.dev>; Tue, 11 Jun 2024 13:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718113502; cv=none; b=MCcnNCBmlPNw2SH8LWhrAcDsi2fnuua1zIjz7wFXraMrcyBTBK1ji1TwjMCJb5KduFEfXF+VWMD6og5RPDnZuDs6hIhltbk0Ceu8QS57xjBDHRLvcXrfLIShwUn3cezzDBuk24Jq02RjQBYgQT5ri5OC2/Z3QkuefOMgT25hJ+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718113502; c=relaxed/simple;
	bh=nloGd3OnqgnD37c33AEbQqXWFDx0R2djgf7dlsj/2hE=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=oOzYINRqlKlqHsnllIcZqIsCzhUYEZa5tAxtbRV6gicNw/ZsJSbl78600yYaxKBH7Ib2eIY8qnAzY9EHfkvAoC8AiX+XjXX0urL4IfBZ2WPui/ZX2Cf/g9fUcrOFSmkkZyDfG2STsjiH2FCjlBQlORsW5Yo+cb/sGnQuQdOrNuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=qPFzYhUA; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="qPFzYhUA"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6f9603730d5so2000849a34.1
        for <chrome-platform@lists.linux.dev>; Tue, 11 Jun 2024 06:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718113499; x=1718718299; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AFPSV341b7GgGdex0NTn7H/kQPMILLf//lJ/zbbnsIg=;
        b=qPFzYhUAl73trFeG13EIvpQSwyBpArF0ei+Ndd6rPMC57cX0rAINu0pVX8xSD1YG4b
         ogkE5ykCol41hPIkN0fGETJdj7ehe0S11HgX6gjRH0RCN6iD0+4IgFtd1hmjDUEOp/zC
         WGpMvA7GXvW05s0lW0ybUPztsXPo2SxSxRzJjB2LaVDQ+q8FM8yv/red9Uo0gKS3k2Rb
         6jHa+RN1EauEYNWM+Sj9Wy/cztA4W0vh24H/HsPYV0Ab5FHXm+RmI7CjOGNf9B3kPAHW
         NeXvjJ6fYGyvW9GzAsMBoSw1bGEImAK/DVrkS7XCE3Y5LF8G3aqjVP5GdM4vw2lpOIo7
         wavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718113499; x=1718718299;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFPSV341b7GgGdex0NTn7H/kQPMILLf//lJ/zbbnsIg=;
        b=v4vKR4XpoGUVu/p1PuCA7DlK7frvOmj6hDKU31Ap2ukuYQ0rBtTvQZ78HE2Q/plq5M
         xXNY+ohX6cM2uIpjiD7lm1VDEdei6g35O5rPwtTSLigwgxn0nIYkqLd02EESKL6jDUjE
         KLpXv9qN2IFWsJddEdjlP6xphA7zlO6g9K9DfCQw2cxrnKw/KqHVJbvUGXCD/lKtBrya
         o8oveH/yWbECSFUwe58XwEIlDpRfdVtjclSvfF7aLPEtVovny0l3glxuVcLuoEcAHLSU
         vEm/MIGyTX3U/sx3kbNMBas2sjHb9fvizz6easAGcC9zkKj6WnCXqJjIsrBwPbByi63q
         vraA==
X-Forwarded-Encrypted: i=1; AJvYcCVwUGMI5gbbMgafz/BkoGUHTkVIE2KW8Exdms4pPL8a6CQIbvGP246Xgse0WOt3HBTA9o0174z2YtygCih8nM1S0Qci8ryTWg2h16LqkHp3
X-Gm-Message-State: AOJu0YxmfY1B4g4iYINFnrQPgyZYP68koQHBb1YE0Xtl2+ajk9Lvgv8q
	E3YRq9fkkAtgxBwW5j7EyQ0EUlv6cPGCf6lowhiPdNlj1Zpp8D/WARVZpCLkPN8=
X-Google-Smtp-Source: AGHT+IGkyREl3vqyoXhZRWHjZ9cjjiorsNRMvO8M1gxcIZkmzQa2xJc7XEYA/0uTVjYR4ZGSWImMcw==
X-Received: by 2002:a05:6358:59a1:b0:19e:e5e1:adc6 with SMTP id e5c5f4694b2df-19f1ff998aamr1568079055d.25.1718113499261;
        Tue, 11 Jun 2024 06:44:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6ea8d5191f9sm4160619a12.21.2024.06.11.06.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 06:44:58 -0700 (PDT)
Message-ID: <666854da.630a0220.1b9dd.ca6f@mx.google.com>
Date: Tue, 11 Jun 2024 06:44:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-16-gd11c00292a31
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci cros-ec: 11 runs,
 4 regressions (v6.10-rc1-16-gd11c00292a31)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 11 runs, 4 regressions (v6.10-rc1-16-=
gd11c00292a31)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-16-gd11c00292a31/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-16-gd11c00292a31
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      d11c00292a31537ae1e46ddea8f101f8822ede34

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
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/66683f6bff3588b1387e7072

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-16-gd11c00292a31/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/cros-ec-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-16-gd11c00292a31/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/cros-ec-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/amd64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/66683f6bff3588b1387e70=
73
        new failure (last pass: v6.10-rc1-15-gc8a4bdca928de) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/66683daa777f1270327e717b

  Results:     2 PASS, 1 FAIL, 13 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-16-gd11c00292a31/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-16-gd11c00292a31/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_chardev: https://kernelci.org/test/case/id/66683da=
a777f1270327e718a
        failing since 8 days (last pass: v6.10-rc1-6-ge8665a1723789, first =
fail: v6.10-rc1-6-gbc3e45258096f)

    2024-06-11T12:06:48.709171  test_cros_ec_chardev (cros.tests.cros_ec_mc=
u.TestCrosECMCU.test_cros_ec_chardev)

    2024-06-11T12:06:48.715758  Checks the main Embedded controller charact=
er device. ... FAIL

    2024-06-11T12:06:48.716222  =

   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/666840c47536779d147e7078

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-16-gd11c00292a31/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-16-gd11c00292a31/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/666840c47536779d147e70=
79
        failing since 13 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first=
 fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6668422d1fe84536777e723a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-16-gd11c00292a31/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-16-gd11c00292a31/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/6668422d1fe84536777e72=
3b
        failing since 13 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first=
 fail: v6.10-rc1-4-g7b44d5381e541) =

 =20
