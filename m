Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D935A25632
	for <chrome-platform@lists.linux.dev>; Mon,  8 Apr 2024 08:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712563648; cv=none; b=SYOT0pvXSa72vzGuQn4Hu9G3SXja+o/MvvxRMrJWR/cWjhZsYc+o/n6AWlstoDDCcQ5wgJJe5xkMa+ak+cR8YXoeaeySSd4Xn2ItHCY/ZAXF8mO5Xij5XO2Q2pgIvfHuO0+EAHks8NzhgBltzBJZZsTaEwsENSgf3lFGhvd0PO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712563648; c=relaxed/simple;
	bh=ATKQTPLPw7eNfJ6/RtBN9+6CaQ+hxEaDhldnkXxNaFY=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Zlph41cen+2+Vu0K/8QggNXtc4Q1upfXeMoYJQb896GXvd+bGTeY1uBOrO4n4Cuiytj0d18Fi/Q07okxXf++osO9ex/qQpvYqAa7ESaHlXmB/bPUikfSelDemU8oe8zDXJ4OZI6ebihcXf1RV21D+bua/XP/KkMdnmyCGJMwqDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=iXmMRzXy; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="iXmMRzXy"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5dbf7b74402so2464228a12.0
        for <chrome-platform@lists.linux.dev>; Mon, 08 Apr 2024 01:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712563646; x=1713168446; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gCITpp1pkWWJSWq8V4kEKbdGvS09qEzXMRS95QtL12I=;
        b=iXmMRzXyEesMyA0IxUmO2/KSN6MLeHansRT0Zob7Gy0t94vdygDty0fhFLEqViQdRS
         EyY8j9AniTdfui8HtC1Zo6+ZenwnJQ2y/kK3UOX8Cm7crkGx0c3EFqlU5m+jTUdXSCmt
         dAnY6ouLaULR/nge5HF5/ti5KTxtsATsvnuc2qVvcLx0SQvid5y6c4CC27W+WY8C/Bs1
         hGtqGOwou1qLaK7S+qiOyCetNxSWzt6FBrF+v1c2HG9QF34gYmDKCxdvRecuc8PN5SCB
         UFKzVNhtaslYepuDBzQ+RpY/fqHgyP415hIR3UTEbncomu8uVSnt+cWvqZAOwcKAEW7w
         YLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712563646; x=1713168446;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gCITpp1pkWWJSWq8V4kEKbdGvS09qEzXMRS95QtL12I=;
        b=eDb0O+9w2AuJYV1fFTCTY00bNIRJI1EXBdQplP0lqkaVveDKkMNbPCqH7v1EOe8jp8
         6ZXbK5lNyCw7KMrLtZPrKIN2XzXon7rNnX13ombsLChwzHdOWH7rXlT6Z6OVHdm5w/k7
         JR40GOdKUMfxQloXe27yn2SBxiD0a8wmF4G9LVJoI/13UrUzdUM99RgHSfWs4ScjtsN4
         H3a34/gaSaW+rEHE1ZY0/WGg9I6XcFiIyYqouhJS5EKAPaYZ2SjfpQjQHYdcJ14EMXNk
         0YcDobiJLuoZExRe017+3cDE8UBDL1ISP0/6NOAZ+Pnjd0bcldMJ9nZxjoC3YcAqjrnr
         GdsA==
X-Forwarded-Encrypted: i=1; AJvYcCVX/a+wgSzKif8SROaRZf0vbonhiVVkUs2P/v9bUYD/Tc8mc0yYm72tiQB5GhEMW7q9OTD8opdaQD/CD6aYP7e621q/HTTuV24pD5NkN9CA
X-Gm-Message-State: AOJu0YxxPaVW7JlKCbHxzCbtaF6czjhlwuQbQvpSsJUjEacQOB5z2BML
	XGBL+BJjtiKgNUaYMsenecHmOWhckJNmMO2Jg5dkn8Fs0VdBpZMXwHMCAP61rzRoBIYhK4nNvyG
	d
X-Google-Smtp-Source: AGHT+IGAbrk2VXFa8oIrXZe49vxzPsH2Ilpq3j1qdk2wAIHyb86mIb+14XigN6wU+G0V/3UOh3RBXw==
X-Received: by 2002:a05:6a20:ce49:b0:1a7:528b:33bd with SMTP id id9-20020a056a20ce4900b001a7528b33bdmr4527357pzb.15.1712563646037;
        Mon, 08 Apr 2024 01:07:26 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id fs8-20020a17090af28800b002a2c3529127sm5894352pjb.15.2024.04.08.01.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 01:07:25 -0700 (PDT)
Message-ID: <6613a5bd.170a0220.5a29c.ee58@mx.google.com>
Date: Mon, 08 Apr 2024 01:07:25 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc1-17-g3b89336c9ccf5
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci sleep: 8 runs,
 2 regressions (v6.9-rc1-17-g3b89336c9ccf5)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 8 runs, 2 regressions (v6.9-rc1-17-g3b8=
9336c9ccf5)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig+x=
86-board | 1          =

mt8173-elm-hana    | arm64  | lab-collabora | gcc-10   | defconfig+arm64-ch=
romebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.9-rc1-17-g3b89336c9ccf5/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.9-rc1-17-g3b89336c9ccf5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      3b89336c9ccf5961e9ec9521868a4c48bd6dded5 =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig+x=
86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/661396cc3e0d22e9154c4321

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-17-g3b89336c9ccf5/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/sleep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-17-g3b89336c9ccf5/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/sleep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/amd64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/661396cc3e0d22e9154c4322
        failing since 14 days (last pass: v6.7-rc1-4-g57eb6dcd32cf6, first =
fail: v6.9-rc1) =

 =



platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
mt8173-elm-hana    | arm64  | lab-collabora | gcc-10   | defconfig+arm64-ch=
romebook | 1          =


  Details:     https://kernelci.org/test/plan/id/661399ac9eeed9e6d14c442e

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-17-g3b89336c9ccf5/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-17-g3b89336c9ccf5/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/661399ac9eeed9e6=
d14c4443
        failing since 14 days (last pass: v6.8-rc1, first fail: v6.9-rc1)

    2024-04-08T07:14:32.046474  rtcwake: assuming RTC uses UTC ...

    2024-04-08T07:14:32.052206  rtcwake: wakeup from "mem" using rtc0 at Mo=
n Apr  8 07:14:37 2024

    2024-04-08T07:14:32.069237  <6>[   24.864541] PM: suspend entry (deep)

    2024-04-08T07:14:32.074245  <6>[   24.869128] Filesystems sync: 0.000 s=
econds

    2024-04-08T07:14:32.079148  <6>[   24.874371] Freezing user space proce=
sses

    2024-04-08T07:14:32.123886  <6>[   24.915672] mwifiex_sdio mmc2:0001:1:=
 info: FW download over, size 717068 bytes

    2024-04-08T07:14:32.884422  <6>[   25.678038] mwifiex_sdio mmc2:0001:1:=
 WLAN FW is active

    2024-04-08T07:14:32.888980  <6>[   25.679374] btmrvl_sdio mmc2:0001:2: =
wake by bt

    2024-04-08T07:14:32.899841  <3>[   25.688869] Freezing user space proce=
sses aborted after 0.809 seconds (1 tasks refusing to freeze, wq_busy=3D0):

    2024-04-08T07:14:32.904615  <6>[   25.700879] OOM killer enabled.
 =

    ... (6 line(s) more)  =

 =20
