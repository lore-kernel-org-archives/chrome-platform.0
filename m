Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9BD16936A
	for <chrome-platform@lists.linux.dev>; Wed, 12 Jun 2024 06:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718173686; cv=none; b=kWyeyRrCApGiRMeO/qBfRJuf2Ye2zpjyk/uu1zQhUj7XQaZxEZRqdcx3jR2WEcE2Hc+675bbkCEEpbaIk7D10m2fw9NpIVopoWkUrIYzi9zoLZplXlmtaA9HP+Xa+OxSgN4ADc5RaUme0aKPfSw6fMeWXrSLqvAchKT+fMYCSjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718173686; c=relaxed/simple;
	bh=lStqaHoKo3cMSNnsQ23oc5a7650XGc/DFqmtSckFqKM=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=BvO+kpDdp1x1R5jYUkJOmufmsPEKyZl1at2hR644fbTm+yvRwgsLguVisimCx6Xk9Mm4gsdYw8hYKCKbrfUBJO7ubwQhmtWCEfY9ftsPuzRrIzABFl1Ep3fva/nLEUO64BrOCcc+xTApHEcV9W1x+HxCOd3Q7IFhf/R9HFkIQqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Ri1otjMO; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Ri1otjMO"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-704261a1f67so2034939b3a.3
        for <chrome-platform@lists.linux.dev>; Tue, 11 Jun 2024 23:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718173683; x=1718778483; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/DnmA0Ww1UpiMaZmtqUWwTL9/HV+5/uxvCvGeegvLOY=;
        b=Ri1otjMOUomTGx46GhsgLTNVFMyb6EvtsAbT7KaI2Ur4jLeetAgSOWXoAlriBBX/Ea
         uL4F6nijJCOVnhLJggzRDDQDSK2GgZbrYvy5zd+7fRXUeemMINfCwgBJCLaE6jCjQNcG
         vOEvEmwGIgqhqMA+3Xs4q0CyCYWMNazd03+7iPYikfeJ8eoV14okHgHxa/UyoTqZarg1
         F2OyxhETXCdtSeGDDl7quJw4ArZpL+IBJljrM/UnF7YphzwXgHQ6JYXtm74knUAgr6Xx
         Y6JFqSoFSDB4Jb7QqS6EhASigW9r5gYNkL94swRUdInNHJ8IkxhIcOTonLr3GuDUsfLv
         Ujdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718173683; x=1718778483;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/DnmA0Ww1UpiMaZmtqUWwTL9/HV+5/uxvCvGeegvLOY=;
        b=Zt9kM53qHRHegoOVSweS7qe0lKIwmNcOM9zJdh87OzuNpO4jxDZnNy0XAp7CkQLWTL
         mIMLp5827/gO936P3YcGSZ3oVWGFwUaogxEj+hoh2FBXSdrjvY20wRHgxFALPaaVBvaQ
         qGYAPYuAuOgtn25eKmhgr586mQFMw09Z5F3xhY1jcTNduUDafaS2stwIRIgBrAXoPOMX
         ZGGYBw2a9LJ4LeTmONoVIUkH+jdALMKG+2sUbZAbd+5Qi7SphlnPP594TuSael831pdY
         ATBYNiqjJBEmvsm4Ts8iky/LocA8wM5qpyWZ6wSCJHub+zhCw1Wc46LLXEj8mpEKFP1k
         FI6w==
X-Forwarded-Encrypted: i=1; AJvYcCWqKNDkkgnZPuYDfvxwcsJb02se1kzV8G28bLiJ82kM0qpbOI2gsogflS/Yg/4N6OAij9nbBolPDYrXpQnw7N+WhM2VpsYLhXIsTsux0gyz
X-Gm-Message-State: AOJu0YxaoaQaPGizxDFc3I8ffIEYMUU7nozNTKKX96h9BtHd8dsqIRwn
	ZXPC8ukR5Ny6Jt2NEIMPU3Y4T4O7tNSad7i/AaPv0YwP8ySCpKAJfCB3HB2Or0E=
X-Google-Smtp-Source: AGHT+IGsdrJVlEln1p5dUygldm8FWUvk2dbvwxpTXu0z3dpNEXNOBOZo0IQWUoZU4Fyscl+pvwijFA==
X-Received: by 2002:aa7:8893:0:b0:705:a0de:6155 with SMTP id d2e1a72fcca58-705bce99b5emr973551b3a.25.1718173683239;
        Tue, 11 Jun 2024 23:28:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705bcbb6514sm661313b3a.43.2024.06.11.23.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 23:28:02 -0700 (PDT)
Message-ID: <66693ff2.050a0220.e044c.1c2b@mx.google.com>
Date: Tue, 11 Jun 2024 23:28:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-18-gc2a28647bbb4e
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci cros-ec: 11 runs,
 3 regressions (v6.10-rc1-18-gc2a28647bbb4e)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 11 runs, 3 regressions (v6.10-rc1-18-=
gc2a28647bbb4e)

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

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-18-gc2a28647bbb4e/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-18-gc2a28647bbb4e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      c2a28647bbb4e0894e8824362410f72b06ac57a4

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


  Details:     https://kernelci.org/test/plan/id/666930f931c3c81fd47e706d

  Results:     2 PASS, 1 FAIL, 13 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-18-gc2a28647bbb4e/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-col=
labora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-18-gc2a28647bbb4e/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-col=
labora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_chardev: https://kernelci.org/test/case/id/666930f=
931c3c81fd47e707c
        failing since 9 days (last pass: v6.10-rc1-6-ge8665a1723789, first =
fail: v6.10-rc1-6-gbc3e45258096f)

    2024-06-12T05:23:59.651980  test_cros_ec_chardev (cros.tests.cros_ec_mc=
u.TestCrosECMCU.test_cros_ec_chardev)

    2024-06-12T05:23:59.657944  Checks the main Embedded controller charact=
er device. ... FAIL

    2024-06-12T05:23:59.658046  =

   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/66692c452575696d7e7e708c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-18-gc2a28647bbb4e/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/cros-ec-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-18-gc2a28647bbb4e/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/cros-ec-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/66692c452575696d7e7e70=
8d
        failing since 13 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first=
 fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/66692e9ba8906b59f97e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-18-gc2a28647bbb4e/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/cros-ec-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-18-gc2a28647bbb4e/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/cros-ec-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/66692e9ba8906b59f97e70=
6e
        failing since 13 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first=
 fail: v6.10-rc1-4-g7b44d5381e541) =

 =20
