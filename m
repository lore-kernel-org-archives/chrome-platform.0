Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF6216F82F
	for <chrome-platform@lists.linux.dev>; Mon,  1 Jul 2024 19:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719861211; cv=none; b=XEww2vxAEYuR54muym4zR6cSEySHObbwsZ6dJ29ykKIWBRtZ1Dtl4Jvpd01k5hoE4ZrOEJXIvl08gu/YumP6SZR8lkr+O7x32IxEhY1qrC7/jNgDY/XuOoDHS9nprgL9P6mEkNtBWb6/0+BT2ZKiFCnIlPSFZOfPSdBYDuUP5XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719861211; c=relaxed/simple;
	bh=AIGAgM+I68Dy6kGW9Z32WY9REcOn+9ncE6lvbqVvuY4=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Z7j78TdJnqEASuafymdCli0GHRh0nO1wt+s5xo+2pwQ3WVT0xRIGb39584eMfwFW8318CLaJg6coegcb6B1xN1VX1lSvRBr+W8JXsfcVi+gXrdpAd2A9Sn//dstYldlbThJ4tBPhrajsSr5124nvx93qJIfuGR+BaVSOlVWA89g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Wi99obtd; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Wi99obtd"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-701ef03185fso1936549a34.0
        for <chrome-platform@lists.linux.dev>; Mon, 01 Jul 2024 12:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719861208; x=1720466008; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rPeUYCCsiiKOanJ4AbGg3LDrRGljbog4GDRXEfW4jiA=;
        b=Wi99obtdn446GlixBPGN2DBoau3ycSv9/NEVRfSRr3XXOjNPELYscajfqaHtujSxKE
         KoR3wH/oWyZMG5occxDZqwZKpOswc6gpLIb90YWmTLryOyclVAYQWIl0H2h8kFtCUDjE
         xbja+uPRoWabZ1fhe35UDdmdtfeG3kH63PLIr9Zqx2jn/J8/gh1Mlkx6lKkXcbxjd8xv
         MmDTDBHLiVXo2ivlqJgbPQocOKR43Jbn404ehxX7Rt+MLpK6rRKztAaoReAxC60pidie
         4qS7BxhmRQ1ObVoniXiIQtgHE/DbLTeTtWxTJxSz91/f0uuzk7Z6lgLm/86EYnlZWeJi
         AsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719861208; x=1720466008;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPeUYCCsiiKOanJ4AbGg3LDrRGljbog4GDRXEfW4jiA=;
        b=l99UrwDy2kDs7Dz/puxRDfVA1SmiG87wjb5/YwY556wXByX851cly76iWhI2lYt2LE
         Jy8t/uJr8xweSeZqobE7/Jb1JrhFvMgW8LEBCh1O1xTUADJ/Ivn9WwGqgGtB2hfyvLEu
         3VH6nVo+JR9e7LW36fv3KZqaPax1/gJ+8LNuIkScKINPxDP28gTe8le6StExYLnCSa9+
         R8zgnj4G8nfaerSqrCcGB1RiitVvkHTGbnUtRraQANO8PvmesQOK0L2sYcC7EwN30PAd
         lCDSRrqTnjGneLOVIB8EjW6hQMO1VsRm5cIiVYmE+n0afdtIYEnoO2QhiyYdsa2zmgtL
         cGnw==
X-Forwarded-Encrypted: i=1; AJvYcCWCxZcWv4JjKQrjYl+0YI5DR/H85BKHkaBYBK5QxWVcKRi/q+ox6PDUBwXTw8AG0LZSR+0b2SMq1I5Z6bLATcpnu2V451+H5Glira6xOKqk
X-Gm-Message-State: AOJu0Yx3BcmbgNLaDiJTJkQaZyLq7/Wls1fW8Si1n31Lqtmma/3nnbTg
	xt9Yu3NbTZqcBHmGO+Ayzk9aoNFv/d1/KVpW4ALzbXOqHDxCwQv6jz/tKyJ0r6I=
X-Google-Smtp-Source: AGHT+IGUUJv95tN/eB5/d8UzvqjuCEkf4T4vS7zM5HaG+pADnp1MnSfBSeAZQPtd3MTt4qMbhjs2qg==
X-Received: by 2002:a05:6870:63a3:b0:24f:c7cf:17fb with SMTP id 586e51a60fabf-25db33c64d9mr5657040fac.22.1719861208418;
        Mon, 01 Jul 2024 12:13:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-708044b0de3sm7125837b3a.179.2024.07.01.12.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 12:13:27 -0700 (PDT)
Message-ID: <6682ffd7.050a0220.77210.82b4@mx.google.com>
Date: Mon, 01 Jul 2024 12:13:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-26-g3664706e875f8
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci cros-ec: 7 runs,
 2 regressions (v6.10-rc1-26-g3664706e875f8)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 7 runs, 2 regressions (v6.10-rc1-26-g=
3664706e875f8)

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


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-26-g3664706e875f8/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-26-g3664706e875f8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      3664706e875f84bd4e3fa25ed1c6e46934cb32cd

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


  Details:     https://kernelci.org/test/plan/id/6682f8231967472af37e708d

  Results:     2 PASS, 1 FAIL, 13 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-26-g3664706e875f8/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-col=
labora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-26-g3664706e875f8/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-col=
labora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_chardev: https://kernelci.org/test/case/id/6682f82=
31967472af37e709c
        failing since 28 days (last pass: v6.10-rc1-6-ge8665a1723789, first=
 fail: v6.10-rc1-6-gbc3e45258096f)

    2024-07-01T18:40:09.811182  test_cros_ec_chardev (cros.tests.cros_ec_mc=
u.TestCrosECMCU.test_cros_ec_chardev)

    2024-07-01T18:40:09.817541  Checks the main Embedded controller charact=
er device. ... FAIL

    2024-07-01T18:40:09.817652  =

   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6682f5dc3983b251207e7072

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-26-g3664706e875f8/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/cros-ec-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-26-g3664706e875f8/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/cros-ec-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/6682f5dc3983b251207e70=
73
        failing since 33 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first=
 fail: v6.10-rc1-4-g7b44d5381e541) =

 =20
