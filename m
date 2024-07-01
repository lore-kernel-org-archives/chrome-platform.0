Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753514206C
	for <chrome-platform@lists.linux.dev>; Mon,  1 Jul 2024 18:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719858510; cv=none; b=WCyABlo2qhyfgccV94Nz7G01XJtI7iayMpq8rp8TiZnk/GPyAcqj0zrpXFLQ+co4yfvCwzq9KGsfnvJOxSovbmG9TOYtUgOXpKtbS2CIuMV7ttdZcCw8pTU01roCRqVAF7isYGZ61cfFZU4h/47QQNjYKiUvL+zKfvGEGUAbsOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719858510; c=relaxed/simple;
	bh=X1aWqVVCJmqyOpxOTy7ZwH1h/tCEzRDBn3epQFVywjE=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=AuRsDh7szRpRlTRRwlLSnIEkddZ/lY4AKnVowMcpjP8IOKetQtRDm6dFbgkEVkflC2Pf+ln/a6HY6SxwFBMuJ0orm16xuQeKLiTyB60nKm79DuCmB5oPK2irZRIXK/3ObHQ+R/RAOzoj10/q+R7lHhx3uLTZyIAaoLzzTFu/YDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=uLmDWPF8; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="uLmDWPF8"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f9b523a15cso22275555ad.0
        for <chrome-platform@lists.linux.dev>; Mon, 01 Jul 2024 11:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719858508; x=1720463308; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7Co7sJLyzzpqdTyTTx8nGcI2zdk+p168B7fEq6AfL6s=;
        b=uLmDWPF86kEUYhO1kMw6mI4MhPbBmB/OBLJR1rR6TyN3dSdiTCh18bgh7A5Eqjsu1r
         04Nf/ADAqMF4aY75T/HfwyGZcTrOQKDHz4Sk+b+n+g5N5/hbQ+1syxOLQNj78usHlDxj
         aOVx16XsYVdUFGRJ5OUreQqCpr7lzrK9V3e3WUMnhs12G6hMTiqkpCghrTFpJ6Nsa1yJ
         5YFp0Wnh3h5G1UXYqosVZCxvsb45lSIFhdXL9HeA5YpcH7G/uLC0QWFU8s0AhD7Ga9fb
         jEiuXeVD8AAMJgy0JRcCJfjgf2NKevR1Vr9wwJpJ1Gco65SkloLLQf16rygB7X7w4XDf
         HZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719858508; x=1720463308;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Co7sJLyzzpqdTyTTx8nGcI2zdk+p168B7fEq6AfL6s=;
        b=dqR3QPNtN+m6SBJFh6KSDyOgpdFHXDBBVzojUsJ+vNAnRfjooJfEuPPLWNQQenE1gM
         TrrJf9/7pjPmE1gtMXtmdjxwrXQEXhVchX7yEOIdAc2UIDj5MXdgk5lTW/VieoolvJEG
         jGmEpO/S3pvCd3YvKAHRwfaxXnNBDAHBt4SYWdGApcZM5GR+7E5jH8BdW39RalVtffaz
         M2P7vdcfZ0qm+wav132ZmcrYOM1sihTtbMhUmlo06tRDLuH9e3n0ixeEPpzE6emSz/Ql
         KVBBeWEzOaGQHm/eNfR66zsPF5YqdrWePmtl+JT75ZBGsEraCYOh11VF8R3bGqawEplI
         XQHA==
X-Forwarded-Encrypted: i=1; AJvYcCUTDtZkbl+W9OjjA2YWthLMtwJsuU7WAynamydFuuWJ9wFaDEt6oul6MUaTulBhrTBHU9khesJKViyByvyykbEJb3w5ZrkXchsWEZkKs7mg
X-Gm-Message-State: AOJu0YwKJVZ82cVR/lO+Oll5OiLUeRZ93DIsZGAM3S4eRkbK0kTxD2DG
	dF10GxHI2/iWcH+7a8vyw7/6u6bX7uK8Vc66CfP1OZArNCWlr0diFcFEPNYqeQM=
X-Google-Smtp-Source: AGHT+IGATKKMO0TcKiq3esfBYqrU/uRUjS8kmkMqLUs/JKr4WNdZluZIqLEn4AUxHVRF8WIk5Bu/Sw==
X-Received: by 2002:a17:902:d48d:b0:1f4:a04e:8713 with SMTP id d9443c01a7336-1fadb4d08e1mr129118795ad.28.1719858507664;
        Mon, 01 Jul 2024 11:28:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10d1b61sm68222385ad.57.2024.07.01.11.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 11:28:27 -0700 (PDT)
Message-ID: <6682f54b.170a0220.876da.714b@mx.google.com>
Date: Mon, 01 Jul 2024 11:28:27 -0700 (PDT)
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
Subject: chrome-platform/for-kernelci baseline: 82 runs,
 3 regressions (v6.10-rc1-26-g3664706e875f8)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 82 runs, 3 regressions (v6.10-rc1-26=
-g3664706e875f8)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =

sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-26-g3664706e875f8/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-26-g3664706e875f8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      3664706e875f84bd4e3fa25ed1c6e46934cb32cd =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie   | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/6682edbe354f9e65967e72e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-26-g3664706e875f8/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8=
mp-verdin-nonwifi-dahlia.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-26-g3664706e875f8/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8=
mp-verdin-nonwifi-dahlia.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6682edbe354f9e65967e7=
2ea
        failing since 33 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first=
 fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6682ec47518ecf56957e70a2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-26-g3664706e875f8/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-26-g3664706e875f8/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6682ec47518ecf56957e7=
0a3
        failing since 33 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first=
 fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6682ec425b57651b537e7089

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-26-g3664706e875f8/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-26-g3664706e875f8/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6682ec425b57651b537e7=
08a
        failing since 33 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first=
 fail: v6.10-rc1-4-g7b44d5381e541) =

 =20
