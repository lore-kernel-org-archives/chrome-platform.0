Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C54A29CEF
	for <chrome-platform@lists.linux.dev>; Mon,  8 Apr 2024 07:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712562748; cv=none; b=jzKKdFIKVNojxIzkYk6kLrLqXHpPKR/6qVQ7SA/QIuT82UBNMjqGAaqoX7aJLyo0EKN8pXqAywkbBGynXDSjaxwze8XuMLjg2+3B2LZtThVRseNM8DFjaaYgfWoe8RcqO40ikMU8u3cPJLhsTGbpbmesi6u33z7UtAyNbalO5Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712562748; c=relaxed/simple;
	bh=3w0Sw+hV/WeYMt1A9EyCyF7W8nEw3MPot3XKlRWZ7tg=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=FyztrhZzPsOQZ63K/CQrpN+5ENUUdIFsHQgTWWqIea65mKW2qYRUvGiLwBO2N9l6EcBtRElCXjYjQnznCnoYZ0rBbFdoFme5DCqnTtQRjDdQ95AWZ0d7gWoZYe+xFdC9MoOAsMDBc2MyzTqD+yvKceK/6ozf+yFTHAmzQpCO9F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=iWvM4MMA; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="iWvM4MMA"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e3e56c9d2cso11739725ad.1
        for <chrome-platform@lists.linux.dev>; Mon, 08 Apr 2024 00:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712562746; x=1713167546; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gCPMkYSwuz+zl9/AigOv7j6KERzVmCoUHsC50tO/iKk=;
        b=iWvM4MMAU8jB9urEFDoHLeRSsW1R0Z6GQHOouap6hMsQUEvYtTyqdRy+nI2HjZnjXL
         EbI4Qi/vqbo4OobLHcvD1YPOi/MesOGdsy91VGYC2hHJIv0Vt+pePfxa+XC4ROOJG5BM
         zyACVfY5OeIfVuQaB/AUDlwQ8C6J6WCwt3m9Mid1K9JUFJXZDSKo0T0dPpt5kAdB75db
         BYfHm7Hfg8w0TbEKATU4nYtjXy36Dq/ylmSdeqqtRZPx5G8s0WXqd7PUuyDbA30n9I+8
         OWAP0TSiaWGtgcVFbfCeqDSBhhUcsCXbcfTc6oGTx05W5BQcjSWQu2TOgqXdQF90Sd05
         GcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712562746; x=1713167546;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gCPMkYSwuz+zl9/AigOv7j6KERzVmCoUHsC50tO/iKk=;
        b=Jnz09vIvDcYByD/B+9lHa5QAOgfy5+0f05a8pI+4WlOQRqZuzijCb22OOOY/CseJly
         PpcXfLUiwlWNX9tLzrlZ/kAravMikluJRocT5Gy238dMxwKEHC3N6s8EViPPudaQI/KB
         fI1MPLFOml1LSi4XnFDNPK5kLI1brvG13tQGMgmI3v7iv+roChBaED4vMPyiaobx/fDc
         QhKuqceSsItOgJwzKFqG/pHWHcLM7UwVj0zJdeFGQHec6IbX1HPUwpezv8gLCneXpsbt
         Mt5HekGwdS01UmgyEbHaIIB4QCj4bPnQHtvLmaJAzBBk/auj2N389sKQqzaSOEUiOJWH
         KvXg==
X-Forwarded-Encrypted: i=1; AJvYcCUEyQqP6bPyMMGpz0rdA2qSMqNzQTgk2h9Isg/qY7VSdmUQmT/dN2ODjKV+CDtZEW67isnP/musoVGJZ4cqU6zs4Ro2nDqG2FuuAn8e9ERD
X-Gm-Message-State: AOJu0YysJYuz1ZpvS5aaCKgew0TrVfqdlNEgoeuYH5n1fGEt1xBidype
	BvV/lRF4UYbnDnMWT3EUsHI2dMU+Fc3DdVTpmRyuyU+8IaWI6ZArh6aaX3G3RLQ=
X-Google-Smtp-Source: AGHT+IGeJdiVyEdLFO65hHg66wjnUnZ5bJRVrAuEJCeOLt9SM14SZx9HZhrJQppZDctKGu2pW/IFSA==
X-Received: by 2002:a17:903:2305:b0:1e4:51ab:fffb with SMTP id d5-20020a170903230500b001e451abfffbmr706414plh.25.1712562745647;
        Mon, 08 Apr 2024 00:52:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d18-20020a170903231200b001e43c7fc443sm1031048plh.208.2024.04.08.00.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 00:52:25 -0700 (PDT)
Message-ID: <6613a239.170a0220.2296c.25b9@mx.google.com>
Date: Mon, 08 Apr 2024 00:52:25 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc1-17-g3b89336c9ccf5
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 91 runs,
 5 regressions (v6.9-rc1-17-g3b89336c9ccf5)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 91 runs, 5 regressions (v6.9-rc1-17-=
g3b89336c9ccf5)

Regressions Summary
-------------------

platform                   | arch   | lab           | compiler | defconfig =
                 | regressions
---------------------------+--------+---------------+----------+-----------=
-----------------+------------
acer-R721T-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_def=
config+x86-board | 1          =

hp-11A-G6-EE-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_def=
config+x86-board | 1          =

hp-14-db0003na-grunt       | x86_64 | lab-collabora | gcc-10   | x86_64_def=
config+x86-board | 1          =

mt8192-asurada-spherion-r0 | arm64  | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook | 1          =

mt8195-cherry-tomato-r2    | arm64  | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.9-rc1-17-g3b89336c9ccf5/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.9-rc1-17-g3b89336c9ccf5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      3b89336c9ccf5961e9ec9521868a4c48bd6dded5 =



Test Regressions
---------------- =



platform                   | arch   | lab           | compiler | defconfig =
                 | regressions
---------------------------+--------+---------------+----------+-----------=
-----------------+------------
acer-R721T-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_def=
config+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/6613955fe1915b8aee4c42e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-17-g3b89336c9ccf5/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/baseline-acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-17-g3b89336c9ccf5/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/baseline-acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66139560e1915b8aee4c4=
2e2
        failing since 14 days (last pass: v6.7-rc1-4-g57eb6dcd32cf6, first =
fail: v6.9-rc1) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                 | regressions
---------------------------+--------+---------------+----------+-----------=
-----------------+------------
hp-11A-G6-EE-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_def=
config+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/6613956f08bb6e0bf24c42f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-17-g3b89336c9ccf5/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-17-g3b89336c9ccf5/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6613956f08bb6e0bf24c4=
2fa
        failing since 14 days (last pass: v6.7-rc1-4-g57eb6dcd32cf6, first =
fail: v6.9-rc1) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                 | regressions
---------------------------+--------+---------------+----------+-----------=
-----------------+------------
hp-14-db0003na-grunt       | x86_64 | lab-collabora | gcc-10   | x86_64_def=
config+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/6613957608bb6e0bf24c4305

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-17-g3b89336c9ccf5/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/baseline-hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-17-g3b89336c9ccf5/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/baseline-hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6613957608bb6e0bf24c4=
306
        failing since 14 days (last pass: v6.7-rc1-4-g57eb6dcd32cf6, first =
fail: v6.9-rc1) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                 | regressions
---------------------------+--------+---------------+----------+-----------=
-----------------+------------
mt8192-asurada-spherion-r0 | arm64  | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/661398a60095e905b94c42e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-17-g3b89336c9ccf5/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-17-g3b89336c9ccf5/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/661398a60095e905b94c4=
2e3
        failing since 0 day (last pass: v6.9-rc1-14-gd8db2c6d7b0e5, first f=
ail: v6.9-rc1-16-g1af853cb6e4da) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                 | regressions
---------------------------+--------+---------------+----------+-----------=
-----------------+------------
mt8195-cherry-tomato-r2    | arm64  | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6613987da98cd977de4c42f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-17-g3b89336c9ccf5/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-mt8195-cherry-tomato-r2.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-17-g3b89336c9ccf5/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-mt8195-cherry-tomato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6613987da98cd977de4c4=
2f3
        new failure (last pass: v6.9-rc1-16-g1af853cb6e4da) =

 =20
