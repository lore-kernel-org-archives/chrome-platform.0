Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418FD290E
	for <chrome-platform@lists.linux.dev>; Mon,  8 Apr 2024 06:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712559257; cv=none; b=XxiNU58T+vIhlYy87OXIK6WoHsQV3qQYRQnmoSMBVY3Ou6kgJpCVYT8Jg9LV6bso5PbAJStf/5SZxZlDFldHFuYqX8NRZ+lQAWnnKBnlynZom4Cwgg9qO9/KMZJKD+cl+RvEQfv+kC9N66+69bqZ7npxbUUyAfmB/TxsLJB64kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712559257; c=relaxed/simple;
	bh=aMeijPcEhOCOy+LxQzndc4JmQSW1Fs9PVQgeYtq57wg=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=ViWOqgZOjLewjaUthehW03mfsKPXYTBTHwW+SztiAnm6Nkf07+hM4wz+Kq1yxaRCjcEnV0VI9rxEHJ0kHpHu/wt0DbXXK8RkN14tMflZlj8WL0ahRmPiir/RZihtWvXmnDF8qRIcx5sLuYEakPZpkdQvoyIFLZNGFyUiZgqyn3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=2yw82Ze2; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="2yw82Ze2"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1e45b9a5c53so878795ad.3
        for <chrome-platform@lists.linux.dev>; Sun, 07 Apr 2024 23:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712559255; x=1713164055; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vWHOIOgTtIpcbowi962Q6R1gBaZss0tYlVPOuuezdWE=;
        b=2yw82Ze2AF5t1IsNVR/LzOdIgTAz8oL2eSR5FcQwNGSUFqIUGtHS09kH6PaRS+N3nO
         SnJ2/XU3FyqOcYxTD4QhFePauWnI11zsxkZh72r5JiP/BM5KCbsSEjLsOteG7uKcqeua
         sLV2T2e0KYrOjSCtKSZs9yEUP63vrvgOT9PkpmUjmOIE1uN37hF0wiRcQremjG5pFD2/
         p3OAgvsNPkk35YX58eWvDozT8C5NkhfvCy3Wxa+H299E8hrNbUZiTHHvcVvkEQJxDp34
         kFwzdFpKcLLTwxf/dBVnQpJVTUjn6Yg6QWU6XKey/K4775BVtvVKPwI3s7lzW7Ffcihy
         ui0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712559255; x=1713164055;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vWHOIOgTtIpcbowi962Q6R1gBaZss0tYlVPOuuezdWE=;
        b=qplw5vPkE4VfKPhiCrXg3K5o+Zx+wLABRxmtXduQh2o4gBXUpEuwVb0FQ3WZGc6PAP
         ZosTe0NiqOH0BpYMjqF5nIoECmpDEiPU47ZDlpvafieuS2mRhk7Cf3rWW4T186PC2nRg
         8oYTeb39vwbvwhGqd5nFtfRaAUf/yPYNYI5kcU4HA2dHnibsXRSGYup5qPj5AW0ZQo44
         4F7apN3Vlsy3AOUgKQTCDg4hTSxSYy3y6YJINvJh86plryufxAq/pPA25V8duWjNVHb7
         v85lUnmEAaH9S97PJtrDjW7wjPqc10Kot2RniwnqUEgX3V2vAOVi+BSYw6MgK+WY6+C0
         55qg==
X-Forwarded-Encrypted: i=1; AJvYcCWhgmsObDHNzMFBFBhOdeher44+ql7vCVm6SXXhRbFH7GIimoQT1eVUI5edS28uQH06vyL44YPvjjzI7pwqlDiB3u/b3XZAJKkRReXdjE6k
X-Gm-Message-State: AOJu0Yxgy2ktxsRYNy40LZjMd5HjYgcS4VKwHygHMIBvoLxht0h6h9EK
	zJ/sl3JBGDfW5synA9oESORsdtSJEBoxz88mHC0vdcv1jIo51/vBZ5iNZyaBicM=
X-Google-Smtp-Source: AGHT+IEYzbJVRfiXYWVm8zG1uzG94MTrz3bEpxWBNB4JJivFtI0YISrsPFoQmD/ExbL57Uti/BzKHQ==
X-Received: by 2002:a17:902:ec8a:b0:1e4:fd4:48db with SMTP id x10-20020a170902ec8a00b001e40fd448dbmr3173454plg.43.1712559255495;
        Sun, 07 Apr 2024 23:54:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p11-20020a170902e74b00b001e29ac7cc64sm5999225plf.231.2024.04.07.23.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 23:54:15 -0700 (PDT)
Message-ID: <66139497.170a0220.73781.ead9@mx.google.com>
Date: Sun, 07 Apr 2024 23:54:15 -0700 (PDT)
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
Subject: chrome-platform/for-kernelci baseline: 94 runs,
 4 regressions (v6.9-rc1-16-g1af853cb6e4da)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 94 runs, 4 regressions (v6.9-rc1-16-=
g1af853cb6e4da)

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


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.9-rc1-16-g1af853cb6e4da/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.9-rc1-16-g1af853cb6e4da
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      1af853cb6e4da2d1eb339de95d5cf38ada02b993 =



Test Regressions
---------------- =



platform                   | arch   | lab           | compiler | defconfig =
                 | regressions
---------------------------+--------+---------------+----------+-----------=
-----------------+------------
acer-R721T-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_def=
config+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/661388b67b255d14594c431c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-16-g1af853cb6e4da/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/baseline-acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-16-g1af853cb6e4da/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/baseline-acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/661388b67b255d14594c4=
31d
        failing since 14 days (last pass: v6.7-rc1-4-g57eb6dcd32cf6, first =
fail: v6.9-rc1) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                 | regressions
---------------------------+--------+---------------+----------+-----------=
-----------------+------------
hp-11A-G6-EE-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_def=
config+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/66138904220df077dd4c43e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-16-g1af853cb6e4da/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-16-g1af853cb6e4da/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66138904220df077dd4c4=
3e2
        failing since 14 days (last pass: v6.7-rc1-4-g57eb6dcd32cf6, first =
fail: v6.9-rc1) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                 | regressions
---------------------------+--------+---------------+----------+-----------=
-----------------+------------
hp-14-db0003na-grunt       | x86_64 | lab-collabora | gcc-10   | x86_64_def=
config+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/661388b773428eef8c4c42fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-16-g1af853cb6e4da/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/baseline-hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-16-g1af853cb6e4da/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/baseline-hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/661388b773428eef8c4c4=
2fd
        failing since 14 days (last pass: v6.7-rc1-4-g57eb6dcd32cf6, first =
fail: v6.9-rc1) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                 | regressions
---------------------------+--------+---------------+----------+-----------=
-----------------+------------
mt8192-asurada-spherion-r0 | arm64  | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/66138ad770782a81d04c430f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-16-g1af853cb6e4da/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-16-g1af853cb6e4da/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66138ad770782a81d04c4=
310
        new failure (last pass: v6.9-rc1-14-gd8db2c6d7b0e5) =

 =20
