Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846AD5235
	for <chrome-platform@lists.linux.dev>; Thu, 28 Dec 2023 05:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="iboOiszG"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6d9aef87d44so868819b3a.0
        for <chrome-platform@lists.linux.dev>; Wed, 27 Dec 2023 21:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1703741974; x=1704346774; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X5uX8TIA/Dc3cmgQArBTlbSAKqh8ucMipf3AKbo/q1k=;
        b=iboOiszGa19PDcZyS9VR5ZuZGrlMR9CXPnv3Cz7QfjfQ9bm0zKdpElEBoLjQODfN59
         qVDVLEPg4U5sZ9zxRW7rcsB73uy2bJkc5fIJshEgj3aprY1CwA+jjJcVjRB1MW3BYCgE
         zXvUC/fZCOpqIzmoHSK/VEhaa+4Q6B2BDJExjMjSuiiChMLHp6zd4x8D8LwONVx4+pOC
         38ncbsYOfdT9prmxMV/TxKRZXmxvu7qG+QmMwUZf8UwIlVPiH8TdG+lS208f6VSSYF1k
         b8jAJ/TqEyRRbz1jgv+vw4hF6DTV7o/d9coBsrMqW1/ueF9JZIl12BHE2ED8vM5QeP5O
         tnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703741974; x=1704346774;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5uX8TIA/Dc3cmgQArBTlbSAKqh8ucMipf3AKbo/q1k=;
        b=h+Giw3NkrymOOFyivbL6jdunyviIPpuxEjLNe6VP+9oTD+iTc5R+oY5Nq0F2DzDIkX
         Mrr21WLEVob9fLwrJ6lnI1iHRdMYEChxP7j/OOcyY38YBhEqQpaZkH5qEsZhBGK7Zstq
         ORI03jQ46Dj+3kpbHQnRV5hmhFre7/gtVNITHALpnx7/svCekWmSndMvVlvwSWwBJl5+
         4xZfcSlif7OIyPAyurIJbT1gfsD6YEQj9IGiJ5vcf3G3zunq3mZeD7qFAp5dh5yC/iLo
         vrf8x3K9NyWB1mQolmqAv0gGnAVi6RuDsTEdMP1MtbVrJrEE6Pwo5PUcPkILSLUtTebe
         JflQ==
X-Gm-Message-State: AOJu0YzN6+deid0in4aj+UbVOqT7FkEqtdn8jw3lZAbZGvRPLL2X0FnK
	8u3IFAKLkMAfgfYdgVoBvciUnFMC1J7/CA==
X-Google-Smtp-Source: AGHT+IEv/oJUryVLILT3ZLHlN1d1Rtua0TuWtDZhEsZALAq+GYPbr8HmEiAg37YWt13ovqoOK58ItA==
X-Received: by 2002:a17:902:ce81:b0:1d4:4a30:1a82 with SMTP id f1-20020a170902ce8100b001d44a301a82mr3464084plg.96.1703741974699;
        Wed, 27 Dec 2023 21:39:34 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d5-20020a170903230500b001d3ebfb2006sm12987083plh.203.2023.12.27.21.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 21:39:34 -0800 (PST)
Message-ID: <658d0a16.170a0220.46166.eb7c@mx.google.com>
Date: Wed, 27 Dec 2023 21:39:34 -0800 (PST)
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
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.7-rc1-2-g09aeaabebdaf
Subject: chrome-platform/for-firmware-kernelci cros-ec: 11 runs,
 1 regressions (v6.7-rc1-2-g09aeaabebdaf)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-firmware-kernelci cros-ec: 11 runs, 1 regressions (v6.7=
-rc1-2-g09aeaabebdaf)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-firmwa=
re-kernelci/kernel/v6.7-rc1-2-g09aeaabebdaf/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-firmware-kernelci
  Describe: v6.7-rc1-2-g09aeaabebdaf
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      09aeaabebdafbcf4afd1c481beaff37ecbc6b023

  Test suite revisions:
    cros-ec-tests
      URL:  https://github.com/kernelci/cros-ec-tests.git
      SHA:  fad9423ae3c64bfd48c207de34a1177000d45fa8 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/658cf8ceff7bcbf167e13519

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.7-rc1-2-g09aeaabebdaf/arm64/defconfig+arm64-chromebook/gcc-10/la=
b-collabora/cros-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.7-rc1-2-g09aeaabebdaf/arm64/defconfig+arm64-chromebook/gcc-10/la=
b-collabora/cros-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230623.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/658cf8ceff7bcbf167e135=
1a
        new failure (last pass: v6.5-rc1-1-g0979e7e3cfd7) =

 =20
