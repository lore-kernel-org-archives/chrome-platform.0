Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151F7524B4
	for <chrome-platform@lists.linux.dev>; Wed,  3 Apr 2024 07:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712127672; cv=none; b=DT3UqlA3ilQ/rlz44WRyZ9IUoGDbU+BDaouEGvp8jZZNi1IKOWnEbx8+aoHZlnXI3AYiPHuHey0E6SnmE01/b/SA2JnxZsFlX5dYZ5Mh127pzIyPyPPsBUbd9/oE9tO8iAFNIwXSjTjE1A8wS3yYgDweP2BtgHPstK6WhT4vhDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712127672; c=relaxed/simple;
	bh=F1v+G1l4NuKhA4HXqYqPoqPkhQtXFqM1my7Z08hKQxc=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=hzi68VB0qfdxrNRMz9FgBAsv/SsywwCcHfsCU/rhV8r6I7P30yBJv2exI5pDG5DxgpdbKZBdsZAKMPRFE9IryBS0hhMQSZXwjEhjYfxU+ZeLUZqFtXJkMcLNHNlbxo++uTE701Z8soFw219t+xFcuK2Xi5RzuU+VhzGUJ1m4MYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=TwkYAVnv; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="TwkYAVnv"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1e2987e9d67so720935ad.1
        for <chrome-platform@lists.linux.dev>; Wed, 03 Apr 2024 00:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712127670; x=1712732470; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BCOYSGuOUPYcUcaMNZDt5R+x2Zgt7K2Iis0OGuQ+AS0=;
        b=TwkYAVnvtI2nfCH+MUuUIemRlbzhmhF1OGTVigKcWfs2s43D7Q0YbUIVeYAlnSGkrj
         Tneuuhdyoa5gLEhjaUjcBieuCKjeKDDLCitrm3zXPYTYh6EX32x8gp66bkmLblxvFea8
         wUofNoF6sHLe0vZcCA9KttlcpP5PWwCyz6/Qsx3N27sJYvYD57Zuznx0H4o/spGKvoNa
         0FJO5VecZMkkdbTd63mtQuXHCm5e7iJDSfloF9edYYyXajJUJWyN7kRQL2oKB0YmWMgJ
         8STUXW1OiDJY+4DP2I33wFsSG7dgUo7gJ9xvUwWGoHeEjlG68jJjtEHS7EWdk+IUpCAZ
         qDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712127670; x=1712732470;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BCOYSGuOUPYcUcaMNZDt5R+x2Zgt7K2Iis0OGuQ+AS0=;
        b=nXNUKDIOnebQxHZtI/gckPLOYlgcKG9hpn428TVfvWrgCEyTl6W25CncogqA+QVgp5
         glQRbyNK4XesGCZCtiZ8+Z7gj0fbLkfyhkteUQ7Anej9D26f4ONQ2wYPMCQhNs0NZuLC
         ZHTZn+16oUvxr6AyQ5udeucwYx7f/v00dXmBWZMcWtcXW30dD++dFt7uyFytlPLx7KA8
         37tC7+I5ckYcrf1NsY29F/17W0Y15MHRuAOD5Y+YqFYS0aufnq0XaWKARdgSel9BKTXr
         XnnotR+C3bAT7ALD5TpGSey/4lKvxotPiPfiCAU+WRBU2qJ06NPLr2L3K9+CYxQGl9TQ
         vIDA==
X-Forwarded-Encrypted: i=1; AJvYcCWvwZfVzl4qV4gGfaY+Jx1mC9a0lZ8uBMdg6QWLjY2/CDWK0cTRYKl6bDDE/T4DsMjEbrz4QpQHu33WLlydhzTPxHDqQVx+mQSWdMI9QSIv
X-Gm-Message-State: AOJu0Yxr1dT/xOOTd+uFsPbxR3vX+HGviee6kFHWd1Os4paBylF3JLk/
	UaIqxj5K5l4i2nGzQsj3M3fj5cpXlu15h6c9CKfiTBnyfGIF24KA/Ec/DAxYYkg=
X-Google-Smtp-Source: AGHT+IH/eushPhVHkxd1zSctvg+zUhCyLIlFO4n4oR310R/911AgtughXwuXc+HXab5EasEIb3dmoA==
X-Received: by 2002:a17:903:181:b0:1e0:e85c:72dc with SMTP id z1-20020a170903018100b001e0e85c72dcmr2290346plg.19.1712127670234;
        Wed, 03 Apr 2024 00:01:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id w4-20020a1709029a8400b001d8f111804asm12386006plp.113.2024.04.03.00.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 00:01:09 -0700 (PDT)
Message-ID: <660cfeb5.170a0220.5f784.138c@mx.google.com>
Date: Wed, 03 Apr 2024 00:01:09 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc1-14-gd8db2c6d7b0e5
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci sleep: 8 runs,
 2 regressions (v6.9-rc1-14-gd8db2c6d7b0e5)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 8 runs, 2 regressions (v6.9-rc1-14-gd8d=
b2c6d7b0e5)

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
ci/kernel/v6.9-rc1-14-gd8db2c6d7b0e5/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.9-rc1-14-gd8db2c6d7b0e5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      d8db2c6d7b0e5ca5e64c747236b2464d0c1661f3 =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig+x=
86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/660cf25777b4ece70b4c42f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-14-gd8db2c6d7b0e5/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/sleep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-14-gd8db2c6d7b0e5/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/sleep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/amd64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/660cf25777b4ece70b4c42f2
        failing since 9 days (last pass: v6.7-rc1-4-g57eb6dcd32cf6, first f=
ail: v6.9-rc1) =

 =



platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
mt8173-elm-hana    | arm64  | lab-collabora | gcc-10   | defconfig+arm64-ch=
romebook | 1          =


  Details:     https://kernelci.org/test/plan/id/660cf1e26d82fae0fb4c42e7

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-14-gd8db2c6d7b0e5/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-14-gd8db2c6d7b0e5/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/660cf1e26d82fae0=
fb4c42fc
        failing since 9 days (last pass: v6.8-rc1, first fail: v6.9-rc1)

    2024-04-03T06:07:02.481812  rtcwake: assuming RTC uses UTC ...

    2024-04-03T06:07:02.487740  rtcwake: wakeup from "mem" using rtc0 at We=
d Apr  3 06:04:13 2024

    2024-04-03T06:07:02.493905  <6>[   26.225514] PM: suspend entry (deep)

    2024-04-03T06:07:02.498805  <6>[   26.229764] Filesystems sync: 0.000 s=
econds

    2024-04-03T06:07:02.503505  <6>[   26.234630] Freezing user space proce=
sses

    2024-04-03T06:07:02.535713  <6>[   26.263491] mwifiex_sdio mmc2:0001:1:=
 info: FW download over, size 717068 bytes

    2024-04-03T06:07:03.295875  <6>[   27.025999] mwifiex_sdio mmc2:0001:1:=
 WLAN FW is active

    2024-04-03T06:07:03.301287  <6>[   27.030060] btmrvl_sdio mmc2:0001:2: =
wake by bt

    2024-04-03T06:07:03.312149  <6>[   27.040302] Freezing user space proce=
sses completed (elapsed 0.801 seconds)

    2024-04-03T06:07:03.316439  <6>[   27.048096] OOM killer disabled.
 =

    ... (13 line(s) more)  =

 =20
