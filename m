Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D574A0F
	for <chrome-platform@lists.linux.dev>; Mon,  1 Jul 2024 06:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719815740; cv=none; b=QQLUjOT1/6MMSuN6n2/UMZT7GsJjVOo1EsPMavxQ4AmosVUiLtcAP8AXLCR6yukNGSuMRy12Gver/N+36VoELrNo8YfI4JIFQTo0ySOD9Q2wVkwI9aPIEuM1Xe0eBsHp+vh/Ioll4McROtKnnjG7gfC/HrwFhXtiSTC2yD9A7EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719815740; c=relaxed/simple;
	bh=TTQB8GYd46gsuKcC4eeLOeLBR03oQwzRP9KODtvcRJ8=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=faRHly7LTn/wKnRM1lYrNDWFfPpxnfQZ8yYtvGLJx2YIwn4xb2T9luJVZcktEEp7j1OG4v7BBUcsOv3ziL9SWM6wvJcRz9KJ6GzTotSJAmxTOM1c3PGQP/rCYDosmPG6NQufD+Z0/vvs4gYQF5nHnBWudtGlV90uyo24NFCHgjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=KOMKY/C3; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="KOMKY/C3"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7082dd9bbf8so1685721b3a.1
        for <chrome-platform@lists.linux.dev>; Sun, 30 Jun 2024 23:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719815738; x=1720420538; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LCDsoj/1CFlRS+EZ5lqBUXa8KKS3MSoiyT1R6NKyj5c=;
        b=KOMKY/C3/lyXHdlB6Jpq0an51UM/Frr/nfD5KG5/UX4IkWspnNBnVYBT2vMqMNBUHv
         F4UW+AA1TT+W0m2FmjbczvuVLWBDEY3Nu2GeXWeS/DvqyDim3MNAXJrnsnOJOb3UUmJX
         ysr+VqDiR4VWDAObH4MYkbSScTZIFXHJZhl3XG5m1+VRMqcNulvU7nefR77Xq6ovo9Bg
         JAA04QP1Lo4RCHVwJJ+hw2MivymN6vE8Axp6FUE56YzncthoFnFPoOl268xtlmrwgpVs
         nOKaB99iebSnCVPwDPHrbMQiyqTW5/Uu85aRVoVgm0ym9vt7R2//mFeFxHNACRwQHe5m
         /tKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719815738; x=1720420538;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LCDsoj/1CFlRS+EZ5lqBUXa8KKS3MSoiyT1R6NKyj5c=;
        b=UPLo/ZH/w1dhD7hEaRvUQrQOt25BnzZclk82AzskgxEbXBJn0IYPEksFt55f/dg/KP
         dC9EGbd+VuiE6gJI3qXE21e1GmmEkG7IuS9nLTn3xHgPKJQy2ON8wuz1IdcxojBe5xIT
         eqmKNrmTMzI3eaPvLL2/FqAwyAv3vb2zsm6eWZnZtUCTrLzJ48Lhr++q86VznpjGPq43
         dAsZjxLUxCQ2U7402k8hq0AGct9cXsf36qV5Lq6XjP6Ohxp5mcDMV8w/+YwpmntrnD+t
         lgVJErFjRvAUuoBjnbJDLdzbtTnddPs0PCDRueUmk8bYdgIV+AL8s/Ew/oDGgMTb4Uhi
         KwUg==
X-Forwarded-Encrypted: i=1; AJvYcCXigxBOryR36GGrssNDbThbcjc9Mne+pzhAs5rRh8wUrRcv95lnoiMi805yNPVkxXUnohKMqRCYRNcUMe4lu+xtfbIbSwhxgIDNwINTxWm5
X-Gm-Message-State: AOJu0Yz9hCC/r2czjqWibz4tdOzBp6vL7pRHf/GfTyc57cOeR5TOlfwd
	nAu+49fVwqEac0+j15BKKLstgD+QxFNjycQzzKYkRZWjz8imv9oWUtP0JG9nJ2c=
X-Google-Smtp-Source: AGHT+IFGqwqzFrOprfpqD98PIjgW/Zhv+MtuUU7DuV5n7FrI13FX4pq7tjZxqBgeliYyCAyJPPYz8g==
X-Received: by 2002:a05:6a00:2295:b0:706:755a:d1d1 with SMTP id d2e1a72fcca58-70aaaf32f60mr3443119b3a.33.1719815737943;
        Sun, 30 Jun 2024 23:35:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-708044ac424sm5655727b3a.161.2024.06.30.23.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 23:35:37 -0700 (PDT)
Message-ID: <66824e39.050a0220.2d066.020e@mx.google.com>
Date: Sun, 30 Jun 2024 23:35:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-21-g5b8feca8dee44
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci cros-ec: 6 runs,
 1 regressions (v6.10-rc1-21-g5b8feca8dee44)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 6 runs, 1 regressions (v6.10-rc1-21-g=
5b8feca8dee44)

Regressions Summary
-------------------

platform                  | arch  | lab           | compiler | defconfig   =
               | regressions
--------------------------+-------+---------------+----------+-------------=
---------------+------------
sc7180-trogdor-kingoftown | arm64 | lab-collabora | gcc-10   | defconfig+ar=
m64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-21-g5b8feca8dee44/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-21-g5b8feca8dee44
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      5b8feca8dee443055049c8ccfdd97f64a0e1d2b4

  Test suite revisions:
    cros-ec-tests
      URL:  https://github.com/kernelci/cros-ec-tests.git
      SHA:  fad9423ae3c64bfd48c207de34a1177000d45fa8 =



Test Regressions
---------------- =



platform                  | arch  | lab           | compiler | defconfig   =
               | regressions
--------------------------+-------+---------------+----------+-------------=
---------------+------------
sc7180-trogdor-kingoftown | arm64 | lab-collabora | gcc-10   | defconfig+ar=
m64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/66824db578800d5a477e706f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-21-g5b8feca8dee44/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/cros-ec-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-21-g5b8feca8dee44/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/cros-ec-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/66824db578800d5a477e70=
70
        failing since 33 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first=
 fail: v6.10-rc1-4-g7b44d5381e541) =

 =20
