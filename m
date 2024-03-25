Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9771C17167C
	for <chrome-platform@lists.linux.dev>; Mon, 25 Mar 2024 03:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711336934; cv=none; b=Q5LZ66zaU9Moo11+Luix/CNknZCw5nmLiWRaLuu0CFDIllKwr6u+bi2RjJ6y+w3iq2ADkeLuGt+jrD9PI1Ngv6fs3XjM4uDjudEelo6/bldhZSEUrhOkPR/O02fCEdGVWyVjrNV2TrnGdt6Piu7m58DJC0smgm/kIEdliIxLwF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711336934; c=relaxed/simple;
	bh=JYOX9hnoKRc/WhFyTnR0Zsj605qgVV1Uzl6AXv5fpn8=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=JculKnOgBxoHvmVXPgAQ7sdzzc6wV7iBKL6iaCMj7q4qq30N3ssnmApVK6bpWQOA6tLJ9YxvPkCTmHgRNQ0icS0a3G1CmcK1yYQJX3/lbUQLatztk1wgDdFbZhqI2Wv0XlILhKyfyHUx757ipFPr+f17jyoWFJ+SQ22q7fb4eOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=3E/G2j6Z; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="3E/G2j6Z"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1dddbe47ac1so30705805ad.1
        for <chrome-platform@lists.linux.dev>; Sun, 24 Mar 2024 20:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1711336932; x=1711941732; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cESpiTUUZiV+B2w91uicePYfDrFhftKVjV9k5W8nwn4=;
        b=3E/G2j6ZX58s3EKdpgwOxq0jPKQMOK4T4kpLMWNHIrBR5yiniKec0wRSHL/SFMex2J
         jZl+ndiaBcNCR2/wwdwT93QeAokNDLVjfnaQSMam3o02yjzkbMDYUdIWOg1V90I6ifc7
         3xMZmGkX9CH9ww1P/rVIoYUwkj7MyRILBLH5iL9y2yQ9wOMj574ZGNPBgZo+ct1KwrYo
         DSiwUzXh32HfpWqBiiUIwOfw2S6dVi+L4hIv5eauUpCmJ/eGWkDDkIcMM+Nw47J6098O
         LikVPM5WsURdvngVvjsp3Ebd5b96pvYPHpuHiULtHwp1UN9u6KzdeveprPUU8MUgaAWa
         +a2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711336932; x=1711941732;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cESpiTUUZiV+B2w91uicePYfDrFhftKVjV9k5W8nwn4=;
        b=Vd98oPniTiPnUnh9SdXTC7OspkXeEnVXlBz9uozHnFcCQ60/dcHWdp+xmR1T1ZZ1od
         ERdMbfzxSGbfp+Jd8HkPgDjCydnFbBrT3s/+RxZYQ9u4fyrjruW23Qx8tOLXpyjZyQGp
         VGYhjMAWSGK0LsENk/es27jynjdp/f5HiogdVAXItTlyT6i3z5/SHigUZQwWHrkqy+24
         /4M8orIJvZt4eNUhZ1ucMowoAdHNHZwEff1m9KtbOX1gdjhX+Ckl8Oi+mtFaQYvLqVGH
         K1kn/VNxjTAFikYVpQxV8yA8koVIurXih0xvoT3mfwpNcIIqdG8Q51VX8hwmEO5btWTB
         xKnw==
X-Forwarded-Encrypted: i=1; AJvYcCW76fKcqxcFwY7jVnrfWXWkxZgaGXAB24kGaWGY+3fVMGsctr7sjDGLmDDYqIzfZS+UCFFnbLUrVyshk1zbroUeze2kd/ueZursGKJRY5Ws
X-Gm-Message-State: AOJu0YyFnK2kWUaUgGb6U4nYC325Ad+JeLByoHkufB7WmaUpFT2XGTsy
	lapRYLiR4W4inLXBtFGygb0IjqPOmk+Gs4d494e2CCM8HgsHI3v8xbhDtogAtbc=
X-Google-Smtp-Source: AGHT+IE3Lpb7PJaeBJz4saJKGP+UKqmkmMnwvKLnJ3p9I7Zh9VObvEWRhaSNiUA4h4sHAI0OwufqxA==
X-Received: by 2002:a17:902:d4d0:b0:1dd:df89:5c2 with SMTP id o16-20020a170902d4d000b001dddf8905c2mr7881781plg.22.1711336931882;
        Sun, 24 Mar 2024 20:22:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id c1-20020a170903234100b001def1ad9321sm3777235plh.252.2024.03.24.20.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 20:22:11 -0700 (PDT)
Message-ID: <6600ede3.170a0220.69e6e.9635@mx.google.com>
Date: Sun, 24 Mar 2024 20:22:11 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc1
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci sleep: 8 runs, 2 regressions (v6.9-rc1)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 8 runs, 2 regressions (v6.9-rc1)

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
ci/kernel/v6.9-rc1/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.9-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      4cece764965020c22cff7665b18a012006359095 =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig+x=
86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/6600e0750c633f6dfb4c42de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/sleep-hp-11A=
-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/sleep-hp-11A=
-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/amd64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/6600e0750c633f6dfb4c42df
        new failure (last pass: v6.7-rc1-4-g57eb6dcd32cf6) =

 =



platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
mt8173-elm-hana    | arm64  | lab-collabora | gcc-10   | defconfig+arm64-ch=
romebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6600e1d66c1d5b5e984c4378

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sleep-mt8173-=
elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sleep-mt8173-=
elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/6600e1d66c1d5b5e=
984c438d
        new failure (last pass: v6.8-rc1)

    2024-03-25T02:29:06.160713  rtcwake: assuming RTC uses UTC ...

    2024-03-25T02:29:06.166451  rtcwake: wakeup from "mem" using rtc0 at Mo=
n Mar 25 02:29:12 2024

    2024-03-25T02:29:06.174560  <6>[   24.611004] PM: suspend entry (deep)

    2024-03-25T02:29:06.179526  <6>[   24.615359] Filesystems sync: 0.000 s=
econds

    2024-03-25T02:29:06.184690  <6>[   24.620773] Freezing user space proce=
sses

    2024-03-25T02:29:06.610016  <6>[   25.045397] mwifiex_sdio mmc2:0001:1:=
 WLAN FW is active

    2024-03-25T02:29:06.618043  <6>[   25.051364] Bluetooth: vendor=3D0x2df=
, device=3D0x912e, class=3D255, fn=3D2

    2024-03-25T02:29:06.623340  <6>[   25.059346] btmrvl_sdio mmc2:0001:2: =
wake by bt

    2024-03-25T02:29:06.635272  <3>[   25.064902] Freezing user space proce=
sses aborted after 0.439 seconds (1 tasks refusing to freeze, wq_busy=3D0):

    2024-03-25T02:29:06.638921  <6>[   25.076244] OOM killer enabled.
 =

    ... (4 line(s) more)  =

 =20
