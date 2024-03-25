Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59CC23181E
	for <chrome-platform@lists.linux.dev>; Mon, 25 Mar 2024 03:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711338353; cv=none; b=qMnv5u9gNKymOctcvBDxtZILQFzOdJh+wWRQqE3aD0nubBFQy3qOQIxDFrDboN85rGj44jOuoraMFgCHmK0DPMvIt6skJTC1IOOdAAT+dUjwXA/56i3ejoVVHH61PY4W7+zQN0tCy6yaQNmFRjmmMOw+0yodCktEibprbDnnGAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711338353; c=relaxed/simple;
	bh=TIULjEXahAdiDASVxPNRH7VEELHhJsnNtB+Msw3rc6Q=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=a1VlMpD63moXYb94XMnqQs0Sw5fHivJ9NxBw1SR8iVLs+Q2ewDojqUqE6dt/N12nszx/TR1nnR0YbZtsVevUXdMaaYDiTB5JZMrp1IK+utTi9MWx0KotpwjCFyAw8M+oDRkzqFfXh8rc9xB8rH7OQMfUCCVYVwA89Yy881p4TyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=VzzN8zgK; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="VzzN8zgK"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1dee5daa236so28656065ad.0
        for <chrome-platform@lists.linux.dev>; Sun, 24 Mar 2024 20:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1711338351; x=1711943151; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JEgNovSla6Gd4+eoDtvjcQR5eDF9QkAmfr54zyo+w8U=;
        b=VzzN8zgKNjuwzLjVcvT5iGbiAtgvVMmlvq8PAQ/e5uvex7m7C99OrX5Ullq4voMN6E
         //yQ36UVDx769U9jIlfiYH+D9uyjKAMwP/FBH3hI9cWlBrFk9i/t2OgT2XtWXJQo6Ypd
         VyBiXUqh84wl9hcHKpR0DqVP0dqN/O/Qbtr0cQyJ0wyEd/YH9WaNMSDJIutp3kYvSMND
         q0wLzPnK17BmtrcIiKpJ3VE65b7f/FZo3Li/CHsKIIlIWfPnKxnh/wWTtzag8ILckdO1
         J6UM4Dk/qXGD6wf2LA1o6XTV8hixF746WqDxe/owcwfgtWjBF6vcwBhj40eRULP69Kan
         oRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711338351; x=1711943151;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JEgNovSla6Gd4+eoDtvjcQR5eDF9QkAmfr54zyo+w8U=;
        b=US+AUy7sk6bDkVYjly3MnH/ejOACtV/u2WiFpyVSgRj5lL6Hekvt1S3i0aa0sTkbS0
         vaboOFHyQataAnW3I5Ybbj+gRaTKqVOg4UCLwBwq+1/0zA4wFNvXd7g4QgXC/hbp5vYo
         mw66uy1pizrG9OhBOqkktHN8zrdD3BIpAViWWPsh+p78Z8+DlgRGPoLbv9aRWxO/c4WI
         65PJhoThy9K797sLdMkWNARVkUqNAgS+bEXq+Z1GfjUUyy5iEUgiG13NziA+YMlBNaG8
         b/ThU2d4cBbyPUaJFB+X78NWVBaDCRcKvn46USdsZIYEsy07oTKPC3PoQH31hbAKUCRt
         Pubw==
X-Forwarded-Encrypted: i=1; AJvYcCXUf/TUIdMj7zgdcukFVX5zPRXXhgljm5bQBznVfwNAF/8melAqPdhs76FDXH9YJdsGZcq23baFLVym9IATWLf5wnJ0LxDnoB8kgkakDn7c
X-Gm-Message-State: AOJu0YzhZ5sjI3hVMJaJC4S2xaXQCvIVVOaBxD6J4wntHvXBzEXDiEsA
	NAriZIWtSRby/zHLI2Y1b2bBmciL4XJ2BSaJzCn0oBNvTJOb3mCCVHOJCxJJYrc=
X-Google-Smtp-Source: AGHT+IHhpsmzI88+pBC1QlGbbnmjgFFX4ML/hQ/adBpISYqKydrTYdKkvJFYxOZidlu0ggJLrm+XKA==
X-Received: by 2002:a17:902:654d:b0:1e0:98a3:e5c4 with SMTP id d13-20020a170902654d00b001e098a3e5c4mr5969113pln.67.1711338350887;
        Sun, 24 Mar 2024 20:45:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id s3-20020a170902988300b001dd0c5d5227sm3747971plp.193.2024.03.24.20.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 20:45:50 -0700 (PDT)
Message-ID: <6600f36e.170a0220.f3366.8f6f@mx.google.com>
Date: Sun, 24 Mar 2024 20:45:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-firmware-kernelci
X-Kernelci-Tree: chrome-platform
X-Kernelci-Kernel: v6.9-rc1
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-firmware-kernelci sleep: 8 runs,
 4 regressions (v6.9-rc1)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-firmware-kernelci sleep: 8 runs, 4 regressions (v6.9-rc=
1)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig+x=
86-board | 1          =

mt8173-elm-hana    | arm64  | lab-collabora | gcc-10   | defconfig+arm64-ch=
romebook | 3          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-firmwa=
re-kernelci/kernel/v6.9-rc1/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-firmware-kernelci
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


  Details:     https://kernelci.org/test/plan/id/6600ea1d55ca3722bd4c42e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.9-rc1/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/sle=
ep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.9-rc1/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/sle=
ep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/amd64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/6600ea1d55ca3722bd4c42e4
        new failure (last pass: v6.7-rc1-2-g09aeaabebdaf) =

 =



platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
mt8173-elm-hana    | arm64  | lab-collabora | gcc-10   | defconfig+arm64-ch=
romebook | 3          =


  Details:     https://kernelci.org/test/plan/id/6600e8174d1104ca1e4c42de

  Results:     20 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.9-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/slee=
p-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.9-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/slee=
p-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-10: https://kernelci.org/test/case/id/6600e8174d1104c=
a1e4c42ea
        new failure (last pass: v6.8-rc1-4-g8a0a62941a042)

    2024-03-25T02:56:32.663965  rtcwake: assuming RTC uses UTC ...

    2024-03-25T02:56:32.669732  rtcwake: wakeup from "mem" using rtc0 at Mo=
n Mar 25 02:56:38 2024

    2024-03-25T02:56:32.683257  <6>[   36.107974] PM: suspend entry (deep)

    2024-03-25T02:56:32.688366  <6>[   36.112765] Filesystems sync: 0.000 s=
econds

    2024-03-25T02:56:32.696693  <6>[   36.120149] Freezing user space proce=
sses

    2024-03-25T02:56:32.706394  <6>[   36.128152] Freezing user space proce=
sses completed (elapsed 0.001 seconds)

    2024-03-25T02:56:32.712194  <6>[   36.137726] OOM killer disabled.

    2024-03-25T02:56:32.718154  <6>[   36.141964] Freezing remaining freeza=
ble tasks

    2024-03-25T02:56:32.729663  <6>[   36.150195] Freezing remaining freeza=
ble tasks completed (elapsed 0.001 seconds)

    2024-03-25T02:56:32.736633  <6>[   36.158546] printk: Suspending consol=
e(s) (use no_console_suspend to debug)
 =

    ... (8 line(s) more)  =


  * sleep.rtcwake-mem-7: https://kernelci.org/test/case/id/6600e8174d1104ca=
1e4c42ed
        new failure (last pass: v6.8-rc1-4-g8a0a62941a042)

    2024-03-25T02:56:06.644760  rtcwake: assuming RTC uses UTC ...

    2024-03-25T02:56:06.650231  rtcwake: wakeup from "mem" using rtc0 at Mo=
n Mar 25 02:56:12 2024

    2024-03-25T02:56:06.663751  <6>[   29.387316] PM: suspend entry (deep)

    2024-03-25T02:56:06.671399  <6>[   29.393546] Filesystems sync: 0.000 s=
econds

    2024-03-25T02:56:06.678732  <6>[   29.401987] Freezing user space proce=
sses

    2024-03-25T02:56:06.690147  <6>[   29.410474] Freezing user space proce=
sses completed (elapsed 0.001 seconds)

    2024-03-25T02:56:06.698284  <6>[   29.421507] OOM killer disabled.

    2024-03-25T02:56:06.707181  <6>[   29.429495] Freezing remaining freeza=
ble tasks

    2024-03-25T02:56:06.721068  <6>[   29.440928] Freezing remaining freeza=
ble tasks completed (elapsed 0.003 seconds)

    2024-03-25T02:56:06.733108  <6>[   29.452728] printk: Suspending consol=
e(s) (use no_console_suspend to debug)
 =

    ... (46 line(s) more)  =


  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/6600e8174d1104ca=
1e4c42f3
        new failure (last pass: v6.8-rc1-4-g8a0a62941a042)

    2024-03-25T02:55:46.419182  rtcwake: assuming RTC uses UTC ...

    2024-03-25T02:55:46.424877  rtcwake: wakeup from "mem" using rtc0 at Mo=
n Mar 25 02:55:52 2024

    2024-03-25T02:55:46.431775  <6>[   24.363656] PM: suspend entry (deep)

    2024-03-25T02:55:46.436928  <6>[   24.367758] Filesystems sync: 0.000 s=
econds

    2024-03-25T02:55:46.442274  <6>[   24.372957] Freezing user space proce=
sses

    2024-03-25T02:55:46.620872  <6>[   24.548248] mwifiex_sdio mmc2:0001:1:=
 info: FW download over, size 717068 bytes

    2024-03-25T02:55:47.379988  <6>[   25.309855] mwifiex_sdio mmc2:0001:1:=
 WLAN FW is active

    2024-03-25T02:55:47.386021  <6>[   25.315929] btmrvl_sdio mmc2:0001:2: =
wake by bt

    2024-03-25T02:55:47.396755  <3>[   25.321850] Freezing user space proce=
sses aborted after 0.944 seconds (1 tasks refusing to freeze, wq_busy=3D0):

    2024-03-25T02:55:47.401187  <6>[   25.332869] OOM killer enabled.
 =

    ... (6 line(s) more)  =

 =20
