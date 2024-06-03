Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A070DAD5E
	for <chrome-platform@lists.linux.dev>; Mon,  3 Jun 2024 03:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717385434; cv=none; b=VHB1cp7zw3WkkXi3/id6nnwNMw3kkuQx09ZVsYuE9hUDtBobKpGM/N9Q/Uk5vVrcpcQWmGenhIjxTVPYAejFXYTVymwFhZOnKU9T4W+Ebi93WpH5TglsKoolWK4eVY67DqPLNGd/eWUZqNZxRL9ZP+2kN68U0zfFGHyAl+TUA8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717385434; c=relaxed/simple;
	bh=M63Jtt7I7/PnaETmAUpJR9HpAaelNFxEssS+5ETJp+o=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=WceefmPlkK4ZcGbMuliigWYEBitJdbLD3GC5gnmtu2Pq0Z4oyDtgG2KZ/OIulqAMxSBG105aB6dW+jIChA8U2rQIfEqSXl/oh+j8zFGC6V6OJM0e9KVmm146gH8E+un/b6h0GAVcsmgPZyuIMR/u0pauKXbO/LeCl3CjUi3XdEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=11qEXf4j; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="11qEXf4j"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f61f775738so27461305ad.2
        for <chrome-platform@lists.linux.dev>; Sun, 02 Jun 2024 20:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717385431; x=1717990231; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bdy+lOqAd5YNqxowJlTmIoyO/EVOKI5yhPNIuG8twH8=;
        b=11qEXf4jWHzg60eU9eI+aTI4802W578EdIvQSaIiEXm3yz6F1wZftJaSIjM2YqUAtg
         QkYmBvDLIEnaW/9cHK90NXj5wAC9C5r/rTgAYnF8tazwwfkk9DnpJBq7K0Oxn0hMYJ+b
         LbFQ/Z4Llca1ZnS5s/xdRpMRDwJ3/QUYuPlpkvfwMrYvMZ228YYR7dgqAYoijzevamB3
         gwI+ELg8BggY1J5GdaSc6wE/SEf/kjBtLIwj9+JwBU/T9+8o/LCy3gLG0uR0YnyIYI8X
         DjwKCI61CYKGBO7UaavpCsaS8Aq9WBAdIm96ELY8ARgkNv4wA8T4PmYkujcIgI1A4IJ8
         LSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717385431; x=1717990231;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdy+lOqAd5YNqxowJlTmIoyO/EVOKI5yhPNIuG8twH8=;
        b=Nlf0uhCmC9oCMej7zTHxC8i7FQ28LkFUZ6uNKSoG68m+3Qx2LLgMC2u7TxQKrzXbj1
         zHYsNAtyaoD2QQfE+KK7q4bF9Oc66IToel5RbdDrVVpeIPYjla1ScN5YE4YCeb0ls8Y8
         eXApVwzr9/3oedEfCKyvXTAez3YbnvC412hec5JsuDClDCcLM/AhTNt2PcyXG619HUAv
         xHyR5KCqZWhMHTsmEDa3tdKcQ8HUPmxN/kH+qArUxu4SL1V6x9jgckgG+LX95rOqN3AL
         cJun4lu8ug2Jo8G0CRsBWyou/hfAhpumlTmh78TDCba0/vbWR+Z67iItnjzpTxhrlfnS
         dV/w==
X-Forwarded-Encrypted: i=1; AJvYcCXwa4Lu/z7yUTh9B4qkxKjT+HERg2Xs4tprV9JvyJ96jLRv9l6xp5ECFcREIx09ZZvqC/hqROx93kJ75QTB79Jj9DKKtmI4CSGZe7o2cdjt
X-Gm-Message-State: AOJu0YxFKDipnmAI/JCJWA+Zq+uU9A3xs9rHf5NtkjL6msUGDQu+rcfQ
	MPYNNivESzzL6m6bm3CxDgdq3mRa2c7l2rCu/vtEpjeEvLnq6rVw0lObpdjO/M0=
X-Google-Smtp-Source: AGHT+IGoBxuWYhY27QRgqas9YBWJwg5sJw490iL+6HoL+v6pOdJhE/4h67x9amnKzCx/lEwWJzI7Tg==
X-Received: by 2002:a17:902:e5cf:b0:1f6:6cd5:d030 with SMTP id d9443c01a7336-1f66cd5d520mr33272605ad.1.1717385431087;
        Sun, 02 Jun 2024 20:30:31 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323ebaebsm54276685ad.195.2024.06.02.20.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 20:30:30 -0700 (PDT)
Message-ID: <665d38d6.170a0220.114a1.d81f@mx.google.com>
Date: Sun, 02 Jun 2024 20:30:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-6-ge8665a1723789
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci cros-ec: 10 runs,
 2 regressions (v6.10-rc1-6-ge8665a1723789)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 10 runs, 2 regressions (v6.10-rc1-6-g=
e8665a1723789)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-6-ge8665a1723789/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-6-ge8665a1723789
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      e8665a172378986159ce8aaf45712c43472f5866

  Test suite revisions:
    cros-ec-tests
      URL:  https://github.com/kernelci/cros-ec-tests.git
      SHA:  fad9423ae3c64bfd48c207de34a1177000d45fa8 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/665d244369c65157117e708f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-ge8665a1723789/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-ge8665a1723789/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/665d244369c65157117e70=
90
        failing since 4 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first =
fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/665d26e0af6adab2b57e7088

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-ge8665a1723789/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-6-ge8665a1723789/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/665d26e0af6adab2b57e70=
89
        failing since 4 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first =
fail: v6.10-rc1-4-g7b44d5381e541) =

 =20
