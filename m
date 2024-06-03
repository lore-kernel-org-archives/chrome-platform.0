Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA46920DF7
	for <chrome-platform@lists.linux.dev>; Mon,  3 Jun 2024 06:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717394912; cv=none; b=FBRiIyR1A5LaJJmCHFzY8FrzAALbMsxk6hVnaNv50G70heoZBpi/eudCzPDLRbuPR2OHbHhBglUV/D/lUJT8donnWn7skG+ZADNTdQoihuKygbKSxL14qYQLRZ6Jhb1G2mkG3EbII7i9q1L6T5FI6L4zejyUHqjk5/u2IpQfUuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717394912; c=relaxed/simple;
	bh=l1EVb7d6QsNUZMIS2hxJKXBgcam9mInm0SzNxfG7B1U=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=C7Ac8hHKNrE+M5lPSQ9Gp+/LKWwnIBS6Ks9/mNDJGbuYqjSO2wwsQ15B73SeodrQxdrvfZtHSRVwYPhTLuI2VQ07p4AMmBiHGvDWRRpPSkWmpQbwmRaGMTWlYRsuipzga+Ov6U+pbtOv7VIP4ZhP70/Bju2c+DIwmHbGt6huHQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=E+vXfa8r; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="E+vXfa8r"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f4a5344ec7so28794215ad.1
        for <chrome-platform@lists.linux.dev>; Sun, 02 Jun 2024 23:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717394910; x=1717999710; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8OZnO0f4rqdN86Cxe6bh96EhHqRLiq3Pqj7yVSLpeH0=;
        b=E+vXfa8r4U1zLW6elrVeQTsAvd7/UNdzcYaWe7oIVEVZxI9qRfVef/CyxsDLxX4Hph
         ezPmQ4deg+LWEtHj0HEzAeY0YcNjDQ32dhBMcZUe7H/VGgbKqlyvEoD8VqEL6UU9TMfy
         khcfCP5kqRWXvn8gQ/SdtIxnBc/qEBmT8Lu8Y5uDk0I95l0a2fCbNTonUuLNdxtmhTF/
         F+AZWwE6t5QEHYP8KsNFgm2lMluUx/5ldK+EttECYNhhtIO0kHH4EFJMLpWEBi8mNlN9
         05nFcSiW023ur4omuSdpCMSREYpLRUV3yJetiXJt0f81t3/ARIAu50QFjnBrfeKE9dHA
         makg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717394910; x=1717999710;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8OZnO0f4rqdN86Cxe6bh96EhHqRLiq3Pqj7yVSLpeH0=;
        b=QwjQp/HCF3S1jbKyuBcEXFPrQ7tNjPnlNjwZrqF3JffOUKJUxSHyyO1ww6c1i7DF31
         JH/BtSxv3QgtFPvNvanmNRdnbnJTuvk1ilrvogTOvoLizgB+GvzlGG49mIDzZDQngJ1C
         pcg7xmI29RyWcs6jGUNeqSRwDayZOI5xbFhZ5bdubkRZut/j3Fngvlvv5Kzz0dnxAwno
         oEkji7EHV/p3tfKGxhEE+KVbqLre+UxYZNDYnOcjLqECu6o7giEq3OBG6gVSqL7FJOJk
         5Zu281ATqUhkimym5h80td2K5SC+IFL5bUuBW781ydDnalotHK0cLYoLyXiQf14SmO6B
         W5fw==
X-Forwarded-Encrypted: i=1; AJvYcCUlAiZf4+swyOkt3qwgprLKP98Mq/n7ALkKUhqHv8dLAxiZ2O5udzCFh4jhgJ8ZiZQ8JwpSd5KP2q6KhceZyfBqXjPLGszmRrK1e4YTnrkF
X-Gm-Message-State: AOJu0YxCPDUFG6R/kROVibJ+XxwHL/7rwPtGHHe9svh2rgPCrT9i/RMw
	qGDl0goLWO6NWphO5Cu5gSlXOLYADYInA6+TSDcJcEHT7EvZH2fSGr+2GUaL9fuk6kQBkS78NVI
	b
X-Google-Smtp-Source: AGHT+IECVxc+wbvMaBv7YVVpp4Mkf6KqwcWXeUyt3uH71X/LiNNu7rowThet74jJz9bBWH2JaE6yCQ==
X-Received: by 2002:a17:903:2d1:b0:1f6:3580:65c9 with SMTP id d9443c01a7336-1f635a51266mr122440955ad.26.1717394909793;
        Sun, 02 Jun 2024 23:08:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6324115ccsm57032475ad.268.2024.06.02.23.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 23:08:29 -0700 (PDT)
Message-ID: <665d5ddd.170a0220.4e210.e591@mx.google.com>
Date: Sun, 02 Jun 2024 23:08:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-6-gbc3e45258096f
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci sleep: 8 runs,
 1 regressions (v6.10-rc1-6-gbc3e45258096f)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 8 runs, 1 regressions (v6.10-rc1-6-gbc3=
e45258096f)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-6-gbc3e45258096f/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-6-gbc3e45258096f
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      bc3e45258096f2ea2116302abefde4b1cb9bc3c1 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/665d51617f231351a67e7071

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-gbc3e45258096f/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-gbc3e45258096f/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/665d51617f231351=
a67e7086
        failing since 70 days (last pass: v6.8-rc1, first fail: v6.9-rc1)

    2024-06-03T05:14:24.057406  rtcwake: assuming RTC uses UTC ...

    2024-06-03T05:14:24.063187  rtcwake: wakeup from "mem" using rtc0 at Mo=
n Jun  3 05:13:03 2024

    2024-06-03T05:14:24.080636  <6>[   16.981315] mtk-mdp 14001000.rdma: dr=
iver registered as /dev/video6

    2024-06-03T05:14:24.084142  <6>[   17.195271] PM: suspend entry (deep)

    2024-06-03T05:14:24.089206  <6>[   17.206304] Filesystems sync: 0.000 s=
econds

    2024-06-03T05:14:24.094643  <6>[   17.211634] Freezing user space proce=
sses

    2024-06-03T05:14:24.225660  <6>[   17.339518] mwifiex_sdio mmc2:0001:1:=
 info: FW download over, size 717068 bytes

    2024-06-03T05:14:24.986190  <6>[   18.102571] mwifiex_sdio mmc2:0001:1:=
 WLAN FW is active

    2024-06-03T05:14:24.991147  <6>[   18.103018] btmrvl_sdio mmc2:0001:2: =
wake by bt

    2024-06-03T05:14:25.002190  <3>[   18.113329] Freezing user space proce=
sses aborted after 0.897 seconds (1 tasks refusing to freeze, wq_busy=3D0):
 =

    ... (5 line(s) more)  =

 =20
