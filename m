Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B464721373
	for <chrome-platform@lists.linux.dev>; Mon,  8 Apr 2024 07:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712560158; cv=none; b=KPsWa2pcPvGnEDJkh+KWwIxGcfQs6kYz+1uL3GT+9r2YN1gucMjc9c2kZbeOnb2e7qncobrpPSGwcp/578rxsLnoQx18bZ744blyb1hlzJ86boaYEvVppLE+uod4v7JCVG0ltp8tmVd6KvBP7p78nLO/MHkHZQVq2+x/ry8HMNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712560158; c=relaxed/simple;
	bh=47eEnLhJ+N2+bO5xZPEPaMek4gaD23VkD29MyHy9W7A=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=QIdUvXlghU/1cYHNCPq/S1FLFnKoTj+yOhwr5uuPfHi8LB2LhyPHzJy3mqFxCaWBs62Ku2nfik7ziRM8rLUakTNLEsqCqTEDyoXSA/uzMx3gnw3tVcph5lUIGGXtl8UtZ0r+sf3OvrOj2ZlPBmmhAzsyicmhPGYPn33PevcfP+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=oc0Qabjv; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="oc0Qabjv"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6eced6fd98aso3634903b3a.0
        for <chrome-platform@lists.linux.dev>; Mon, 08 Apr 2024 00:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712560156; x=1713164956; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UWeGFSC5fXR8xVDWfBbAo7raT8cj1dU9CC4jdmvJRKE=;
        b=oc0QabjvO+b8JIoBlEKF0dVai/EDpMM8ET5Y6ikEpkwJXXI3QyCznSluwWRRBpzcqC
         KOAMPzDDEa5IKSRrJNHWLu7yJFXMqKosoRdnHFirrSKeyLwOYGATaxhxY9CII9N4ykgq
         nf6/MbASbJ8YwRvQRpV1OmEd6utGsui82hQK5mOlgFs8WPOKB5Th6rrhRHnTjBAyXx+1
         U7beZFQdR/AUfZWAufoFJ5kZUXdQFv/1bmR+hXk30NK0arGgnkSYbsqSoz3XgJGodVM+
         jLuxFXgCFkmONH9c9lVIms7CFnWguOCByKQMZfsHg0R+vE59qVbCzumtwSNwtXj0dr3S
         XrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712560156; x=1713164956;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UWeGFSC5fXR8xVDWfBbAo7raT8cj1dU9CC4jdmvJRKE=;
        b=QnWfLHJqFRHu0liXon/2IdEFcADT6G+35ypjhKR8g6SIPco5RCaZioziviCzB/uAJL
         2KSMMWC90ccjhjGy6aq0V4Pp5m+pPFWbhDg6BLUinO1l662p+r7IOQjd+8/iKadZgzNY
         wQS6iDUtRKGck7y7yOslV9Iyi70xHvxmLeVxZ0ZxZQzalr/QMR+V51N0c77ACN0vtGlE
         QcV9H1OynG/Hct8Yk+CUq7+ZGv1KqTi+/Yw0Y61lUJY0tWbDW88d9qm44fzm2TBR1+oa
         UPnluhUr8lyOBDX4tSvekLOGfDabb2o/tn6nQHQHtuLr1yaBTqtG24I6oh1k++ZOc1lM
         642w==
X-Forwarded-Encrypted: i=1; AJvYcCUdzZf60uduR85UCWKgNrWUZk+E+qTUdu7PkMV+ThWc7JX/UtgplphHV5i3SUx7cMYZ/3qTyiGV0D1feB9Gy8SnPXsoB2F9nMUNvWbfxW3R
X-Gm-Message-State: AOJu0Yx4GVnI+B132S499NKcWbF0gFFA1+Yq8epFiQNsemmtMO/9SLpK
	+XzHZsAxJCaBX6HSQkZETtrJ+bTbq77J+OGk7blzSfvzjRdW3n258kykaSUfarE=
X-Google-Smtp-Source: AGHT+IEQvK2nAV+1HDrAD79pRmUgqSY8Rodj2OIv8PPXJsKHWMUltDdeiReRhgn8JxBTmwQ96bb4mg==
X-Received: by 2002:a05:6a20:c892:b0:1a7:4f8b:6439 with SMTP id hb18-20020a056a20c89200b001a74f8b6439mr7330410pzb.34.1712560156024;
        Mon, 08 Apr 2024 00:09:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id k17-20020a635a51000000b005dbd0facb4dsm5053962pgm.61.2024.04.08.00.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 00:09:14 -0700 (PDT)
Message-ID: <6613981a.630a0220.2092e7.b723@mx.google.com>
Date: Mon, 08 Apr 2024 00:09:14 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc1-16-g1af853cb6e4da
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci sleep: 8 runs,
 2 regressions (v6.9-rc1-16-g1af853cb6e4da)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 8 runs, 2 regressions (v6.9-rc1-16-g1af=
853cb6e4da)

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
ci/kernel/v6.9-rc1-16-g1af853cb6e4da/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.9-rc1-16-g1af853cb6e4da
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      1af853cb6e4da2d1eb339de95d5cf38ada02b993 =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig+x=
86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/661390a29aa0d1b3ef4c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-16-g1af853cb6e4da/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/sleep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-16-g1af853cb6e4da/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/sleep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/amd64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/661390a29aa0d1b3ef4c42db
        failing since 14 days (last pass: v6.7-rc1-4-g57eb6dcd32cf6, first =
fail: v6.9-rc1) =

 =



platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
mt8173-elm-hana    | arm64  | lab-collabora | gcc-10   | defconfig+arm64-ch=
romebook | 1          =


  Details:     https://kernelci.org/test/plan/id/66138c9baae891f9bf4c42da

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-16-g1af853cb6e4da/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-16-g1af853cb6e4da/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/66138c9baae891f9=
bf4c42ef
        failing since 14 days (last pass: v6.8-rc1, first fail: v6.9-rc1)

    2024-04-08T06:18:53.240187  rtcwake: assuming RTC uses UTC ...

    2024-04-08T06:18:53.246545  rtcwake: wakeup from "mem" using rtc0 at Mo=
n Apr  8 06:18:58 2024

    2024-04-08T06:18:53.256528  <6>[   25.231932] PM: suspend entry (deep)

    2024-04-08T06:18:53.260716  <6>[   25.236284] Filesystems sync: 0.000 s=
econds

    2024-04-08T06:18:53.266625  <6>[   25.241754] Freezing user space proce=
sses

    2024-04-08T06:18:53.344487  <6>[   25.316479] mwifiex_sdio mmc2:0001:1:=
 info: FW download over, size 717068 bytes

    2024-04-08T06:18:54.104104  <6>[   26.077675] mwifiex_sdio mmc2:0001:1:=
 WLAN FW is active

    2024-04-08T06:18:54.109029  <6>[   26.083450] btmrvl_sdio mmc2:0001:2: =
wake by bt

    2024-04-08T06:18:54.117612  <6>[   26.089983] Freezing user space proce=
sses completed (elapsed 0.843 seconds)

    2024-04-08T06:18:54.121183  <6>[   26.097367] OOM killer disabled.
 =

    ... (11 line(s) more)  =

 =20
