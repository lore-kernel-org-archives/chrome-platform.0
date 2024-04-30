Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D0474E11
	for <chrome-platform@lists.linux.dev>; Tue, 30 Apr 2024 08:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714465367; cv=none; b=PX3Pw8G6sFfJ7HMec/ltc8VYMSTdBYi84iNO9+aYfy3VAfBaomBtEQX87/x9cn8u8JjPlhcSfxhf8wZ8soyz1qrqttbrhUyBiYAExBxcnP7zYst0gZTOMjupTDD05LkwdcNd1uSBfUbZr2puXO97HizC6t1f/dsSGIZYl/gFDjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714465367; c=relaxed/simple;
	bh=iTviy3ySMQgwp1J9VK+HZ/2IRmjO6p9pfmko1P5XRPM=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=uH57JSeTkdRvBhrTrgIUN3iBtDl1GKBmWzLL+oUoJBtHJy6GpcAMmiwxB+iG2B3s4+BpL3+kzDpqZ9Xpl5/6g/9UQ6eaKI5C/kKVw03GiSZGofXJd+7VeY7OI6k8VYG9UXQ1PzZ+8KuDS21Ywo2NL2qY6CODqUpbnkBuG13cmIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Jdj4ci7T; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Jdj4ci7T"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6ecec796323so5131668b3a.3
        for <chrome-platform@lists.linux.dev>; Tue, 30 Apr 2024 01:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1714465365; x=1715070165; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wnIIR6SFhlaQ59TLKk++qsPjpevh1PoAAv2U5Bx0QE0=;
        b=Jdj4ci7TkFe6M3D0JSoHGXyguKSutZBOIuZMwaAUnV2eTF3edQwF3nyOlmi2mJjGjD
         eqGFpgLGum8cYtUgri2/HWvXAPdOLn24mrNM21RhYubO1sNbgnnfztfnmRPAdB2sqicx
         lrwiPIAkEoXata2lwp5okigcpq9pR3hRD3DUqesj9juW82BimTY9ZxrGeOS7aczQUhSr
         Ii2JnuRzQbNDag2+hbC02tIRKM15/sx27QQjbvaoDDu26yyIZsvaRZyS+f7c/MLjIPRN
         8hBkPleY6JfwAGqDnaG6FBv9GBxyVPK0rlf/yhI5RFGtHYARNHfZM6bGe3xP8hRpCvBF
         ultA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714465365; x=1715070165;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wnIIR6SFhlaQ59TLKk++qsPjpevh1PoAAv2U5Bx0QE0=;
        b=FkxLBrmXPkm+tEqjbxdrC3JXw4NPzj+p7mSkk/ehMRLKD/4ljm9vwpCdFfEJgOy6to
         Txu9iQOxb2jrS6eg5v/brxF6FHrIeNvls2ir/TYuIdL6HwsDwsj5zJ60h8C1+NjQqt/Y
         wWOhjnWUA0DzX84HbkN2Ho7mTmTTxnyA4z/FGHc3Ua5n0SV6RpllD2X2zNZNzfTThOBx
         AJljBDz1G5r4FGd3ycP7z9zstq1FVQTIWtPn/ybvtGwuZklD5pME8494YYs6F2wc/O1d
         4bI4xtxTtvGgvJk3peZj4ptXN4ti65WS2G69v9EvLNtH8Nbbxi19sW3w+5xOZ4UBQfF3
         VunA==
X-Forwarded-Encrypted: i=1; AJvYcCVFgKMY9HexPlx2vkZGL3sFBxrQUrPkTTscUFf+72YqgWfHE3SJczvi+LpdeST3k04GVvsaRmurlKUdv2/yP1PJ5XZUTW1GZxbgVupxtE4e
X-Gm-Message-State: AOJu0Ywcr6TaKCyy1nvu5ifrZIJ9ZBBTNA/4bZJjOJXGlozjLVpRjeLe
	NBAzf8Fcguup+KXolfbE7Fg1Zo+/CpzBy4NyssUbRun7qiMKMdIeVRBlSpq8+rMfjB/pmry9h4Y
	eETo=
X-Google-Smtp-Source: AGHT+IEuqWtjhKNcWYj28MF2b4cnhGcBxI1ewfWr5zmNZmws4cDpQX5lkJ1qxrP/aYJzc9vinYtJCA==
X-Received: by 2002:a05:6a20:244d:b0:1ad:27ca:6347 with SMTP id t13-20020a056a20244d00b001ad27ca6347mr15960890pzc.43.1714465365095;
        Tue, 30 Apr 2024 01:22:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id fj32-20020a056a003a2000b006eac4297ed3sm20527123pfb.20.2024.04.30.01.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 01:22:44 -0700 (PDT)
Message-ID: <6630aa54.050a0220.69e9.bb1c@mx.google.com>
Date: Tue, 30 Apr 2024 01:22:44 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc4-22-g2fbe479c0024e
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci cros-ec: 11 runs,
 1 regressions (v6.9-rc4-22-g2fbe479c0024e)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 11 runs, 1 regressions (v6.9-rc4-22-g=
2fbe479c0024e)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig+x=
86-board | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.9-rc4-22-g2fbe479c0024e/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.9-rc4-22-g2fbe479c0024e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      2fbe479c0024e1c6b992184a799055e19932aa48

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


  Details:     https://kernelci.org/test/plan/id/663096741cbf5850c34c4506

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc4-22-g2fbe479c0024e/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/cros-ec-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc4-22-g2fbe479c0024e/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/cros-ec-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/amd64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/663096741cbf5850c34c45=
07
        new failure (last pass: v6.9-rc4-21-gc8f460d991df) =

 =20
