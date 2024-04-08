Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9337A2BB0A
	for <chrome-platform@lists.linux.dev>; Mon,  8 Apr 2024 07:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712561957; cv=none; b=LWyCXu2U1dQzm1R3iuZSSufJgr8DpLAtxMdIi0LOeAJmRDBrg0whhbqtEHqvX8femSQlywfKpu3jF3ATk+DJq7dfUTgP8ctgHTHaF6Rv1LXinzc2nJWpcn3A/MZaLpvWKeU2QDomh5OPWDV7eDN5MswZ2iZNJJx4ReV2D7CqoPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712561957; c=relaxed/simple;
	bh=AaZil2Z9+cY38/px6ZP6bXyJ74sL79zJxvOq8o01AGw=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Pld4K/IKTViDIRIWVkHLV4bQyOfWqj1su7valiKX2UgIObZEInCp2qN/rADZa1itMjyLPyPaF6xjCsuZS2zeFhEpK8InCAQxtFbIK7y7/1apNDFOgSqvRo2M9mcB6IZgGbi3bmcL/M0T0elB51lDmNWeMqj7cC6D5HG4QuQqyGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=FhufmkZ8; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="FhufmkZ8"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5d8b887bb0cso3529692a12.2
        for <chrome-platform@lists.linux.dev>; Mon, 08 Apr 2024 00:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712561955; x=1713166755; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EhSbLpVESB2UAetQ2CMXOzldqMgy8+/mXKri3mI0lsk=;
        b=FhufmkZ8znx7o9oiQVsI4ujgS+VTXe7C3DSKCQKHtj4YgUWqEwviLcb5wMQcVXsCQ8
         ZsKf0DfLeOqJ0FVw5GeVgnmhQpcAPYo5x1XQ9nBEvJF+8sZ1Pl4/k7/Lgy9HbXcLdDT/
         /uDv3jgn+GzlMPkLeJrmWF7TX+J8/wDgU8N5GnkuPImT2AlGIrW7Ty2O5mFNmqgv7BuG
         KEzOwHZZnz5dWnO8kFuXkADY47Qn5MIeI7iRYdLBYZqCs7IcS3v8423lbsQhLF9qJ06O
         64SIOoUJIStY+/4H8k9wZMiavp5EddeH/S+0i3v46JPgix1QHI4ulPQeolAB2mHX66RO
         Ftug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712561955; x=1713166755;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EhSbLpVESB2UAetQ2CMXOzldqMgy8+/mXKri3mI0lsk=;
        b=tEjayxJrUJK4FyX26CJQ1U4+oGz8W56bee+yDpRSjMK687xODFzRhHaMsm9QAeqyMf
         FvKeAbeVJyw6fiQZeAqmWzeqGTM4kemWivZ7KHcAKgfq5X/PE3eo7Ncu6JT51FfvilXM
         ykVaPEX7bWEs+398SlTkzu0PWbUp562S9P2nXbjZMr/DNdgm8ovR3CNbWgCRUcRJQP2E
         gy8yRyuDvXCPC7noEixvgcBBzuxcK2jRDRHgGDwlr9ZhqWLcalwDNCq4/lTedVJxrc8R
         RM3SCqnqol8P/NuAOXCFGbmLGp+SUyxpL+6FJt15ngvBuJaWqtmzXKOa71ySPSW40IDp
         f9zw==
X-Forwarded-Encrypted: i=1; AJvYcCVYp5537yt+hTOOuf6hJwjO1LpQBfyMmVSWsCnrmCYwLujrr8i/usbvMWSXcDTmYdsrb2Tljtfkct3woe8vf3CEqIt+Orjo+WD9gOkyNhtF
X-Gm-Message-State: AOJu0Yx2fVWIlHzZt1j1sYTlc++zOiZtVSXy0HwKmJjriJsQYbEbJUaf
	BHWtAxT+XoMtfc1hDjNqVbZBDmFrO0kI9VLOMvO9WEO40GUgLsScr6G2W/N0XYs=
X-Google-Smtp-Source: AGHT+IEog1vOVvcQQNCvecvLbLv42uURAuzD9jynchqIA02iG7ttXTORcdnnhNlLFq55MHz0pE7kYA==
X-Received: by 2002:a17:90b:1191:b0:2a2:930c:9a8f with SMTP id gk17-20020a17090b119100b002a2930c9a8fmr6848248pjb.32.1712561954844;
        Mon, 08 Apr 2024 00:39:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id a21-20020a17090abe1500b002a09b929f88sm5719950pjs.9.2024.04.08.00.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 00:39:14 -0700 (PDT)
Message-ID: <66139f22.170a0220.30940.e06b@mx.google.com>
Date: Mon, 08 Apr 2024 00:39:14 -0700 (PDT)
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
Subject: chrome-platform/for-kernelci cros-ec: 9 runs,
 1 regressions (v6.9-rc1-16-g1af853cb6e4da)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 9 runs, 1 regressions (v6.9-rc1-16-g1=
af853cb6e4da)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig+x=
86-board | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.9-rc1-16-g1af853cb6e4da/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.9-rc1-16-g1af853cb6e4da
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      1af853cb6e4da2d1eb339de95d5cf38ada02b993

  Test suite revisions:
    cros-ec-tests
      URL:  https://github.com/kernelci/cros-ec-tests.git
      SHA:  fad9423ae3c64bfd48c207de34a1177000d45fa8 =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig+x=
86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/661390c79aa0d1b3ef4c42fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-16-g1af853cb6e4da/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/cros-ec-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-16-g1af853cb6e4da/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/cros-ec-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/amd64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/661390c79aa0d1b3ef4c42=
fc
        failing since 111 days (last pass: v6.7-rc1-3-g59a9ccf19ee03, first=
 fail: v6.7-rc1-4-g57eb6dcd32cf6) =

 =20
