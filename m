Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3183D60
	for <chrome-platform@lists.linux.dev>; Sat, 15 Jun 2024 03:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718422884; cv=none; b=FJxATIxtFpcRwLfXSQvh+U3+0jeem9XVdTRc8AHH84SwKeqIEIi2MTqq2XoIy3JL3WoU6TWtUhgHSaFTMI11s6xE/NrVVqkb1mDjZdxL4CsTq8SDGeDlvi6okm4sgAHkFNd2KAS5rEkbXgGQbHWBgHTQ+WBxXtL2pNs+WhO9AGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718422884; c=relaxed/simple;
	bh=DtR8MzIoHh0q0sBumTMiIsWYmb4MrPX5LN2LgjAgcEM=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=F0pzIZM+2GHusE2a27UVwrytwNC0PzS9WWCtZf+HKmyuayoeZqtceXRybeobgw1aFTxTJcFyo5BvsKGohURKqmjiA/wU7xFha0T8gCWmWIdEknC5Ft1T2SZF+Bk3nWspl3P/8zQrTIdPn//VHNPVA+s8lI23D0tvgvzEQbnYYMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=xeIYQyTv; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="xeIYQyTv"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6fb840d8ffdso1182727a34.1
        for <chrome-platform@lists.linux.dev>; Fri, 14 Jun 2024 20:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718422881; x=1719027681; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=USIHyVroLmgEtF7XHVDUmANgxIvUz5JhbAudg7MrhMQ=;
        b=xeIYQyTvar2XjIR4SfDFbU74FVqaPGmWy/ICqASRaW8e4m7Lu29S9QnepyS2KuGfPU
         BfjPwy83bNlWUO3cAR6ENoIIX+Ph78Z01n/6pBEMWdSzr99KA+RpaQ2UMN3L6yGZPb4C
         tBaca6OXt1k5fV8YCaVnerRaCsbB1rDaSywpHaytb9arMw0kyPSbOPVlREgIAyMlB3+7
         58GxjZNsTbA3ACkH4XzAK+eRejYcWokA4L3DnbcxXBldbidrFMGuEplvyGrPVj7ep04O
         gLBrzetafkBseGmKbYYIoFOoYkSrFDUCZ0NZw+fqoKzs01In3IQI3EzAgj7CTt5eD6Tb
         hqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718422881; x=1719027681;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=USIHyVroLmgEtF7XHVDUmANgxIvUz5JhbAudg7MrhMQ=;
        b=XrIoJemF6BaPR++1+7u9qM1bVH7FqzhFIMGHI1Uz8+5875GLBhHc9hj5WsTpaEyMhf
         MWE7QwUjA4MTzLFDMI2sm6ltnizKqDDulDvEgQi19Ow9mHYGdTDdCbSPH07x7vO/i+UU
         mEmHN/OKrLNMnIKi47FNnpaz3UMH/JI68cYLaiLzq2+quIKM35EyjchfHCiFwrjUt2i9
         HfS3HSwx8WX4z3SM0liU+55NVnpScmfTI0gob0fXegjiKnNZuhjp71RXCscT1IkmzsUU
         qgb4edlb8NA54spfzGU8xhLSAH8UvcwfGpSGJ+t6RMfgxqQgBErCsCljjVBBhe1T7X9A
         SrGg==
X-Forwarded-Encrypted: i=1; AJvYcCVzaXh7LxAQySj4Ngd87aV40O5t4199PJ811HJLntMFKjhpvVrMOAW5/hCg5pG/4c1wGA2iCg4uFz/1I/N/kbeYAur55yDMeX8Q1brydxVf
X-Gm-Message-State: AOJu0YwIZBiWn88MLNYWkWho9dYvpUkfSVzxJTkz1lmMMzMzs0EgdMNl
	ynbPX2LW5C2jrXqSB2NUVxtSiqa0f9bOacYrc7RgB8OSCDbLfZwQ3WgmaHXmIRU=
X-Google-Smtp-Source: AGHT+IFSv5Uy0A27AAT96GtNcDH+bUG7g9wtnmhsmWgBTMihwy6DArsDEUag8yfCcy/SKVJjT2ylAA==
X-Received: by 2002:a05:6870:14cf:b0:24f:e8f1:675b with SMTP id 586e51a60fabf-2584297b81bmr4937247fac.30.1718422881486;
        Fri, 14 Jun 2024 20:41:21 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb6b1b2sm3812902b3a.156.2024.06.14.20.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 20:41:20 -0700 (PDT)
Message-ID: <666d0d60.050a0220.2e129.c2a1@mx.google.com>
Date: Fri, 14 Jun 2024 20:41:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-20-gb57cd5703a16
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci cros-ec: 11 runs,
 4 regressions (v6.10-rc1-20-gb57cd5703a16)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 11 runs, 4 regressions (v6.10-rc1-20-=
gb57cd5703a16)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board | 1          =

mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-20-gb57cd5703a16/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-20-gb57cd5703a16
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      b57cd5703a1618e87772094ac12c5ee7d6c35e2f

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


  Details:     https://kernelci.org/test/plan/id/666cf95a4b0052f7467e7077

  Results:     2 PASS, 1 FAIL, 13 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-20-gb57cd5703a16/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-20-gb57cd5703a16/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_chardev: https://kernelci.org/test/case/id/666cf95=
a4b0052f7467e7086
        failing since 11 days (last pass: v6.10-rc1-6-ge8665a1723789, first=
 fail: v6.10-rc1-6-gbc3e45258096f)

    2024-06-15T02:15:43.974465  test_cros_ec_chardev (cros.tests.cros_ec_mc=
u.TestCrosECMCU.test_cros_ec_chardev)

    2024-06-15T02:15:43.980376  Checks the main Embedded controller charact=
er device. ... FAIL

    2024-06-15T02:15:43.980452  =

   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/666cf7d5799847cbe47e708b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-20-gb57cd5703a16/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-20-gb57cd5703a16/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/666cf7d5799847cbe47e70=
8c
        new failure (last pass: v6.10-rc1-19-g77a714325d09e) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/666cf7653a24a76ee67e7142

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-20-gb57cd5703a16/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-20-gb57cd5703a16/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/666cf7653a24a76ee67e71=
43
        failing since 16 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first=
 fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/666cf7670e7507fead7e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-20-gb57cd5703a16/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-20-gb57cd5703a16/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/666cf7670e7507fead7e70=
6e
        failing since 16 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first=
 fail: v6.10-rc1-4-g7b44d5381e541) =

 =20
