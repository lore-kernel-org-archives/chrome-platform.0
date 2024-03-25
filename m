Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC1C12FF73
	for <chrome-platform@lists.linux.dev>; Mon, 25 Mar 2024 05:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711345075; cv=none; b=ncTwvISTTYZ7UDPkuXKVOhWWhG1Cq9L8VQCxVzi0aF8OUy4tAlA+X30asStzmHmxSUrMgsrR2Rk1Tv7bHQ35BLuc2WgggM0zOfNkOk7Cr+PfoRfsYG0jPA0OKZ1PSAV5HxIapmDsSXv2GOARxDZ+W45ip3LJkiossgOeb0FN3VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711345075; c=relaxed/simple;
	bh=di0UUN2RdMfyVw4DE39HW867Z4rkzMUeyAUqKZnV2Ik=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=X2IzOWVQrmI6eDrGfXGuW+NwxNK2S1w9eEDtqcOVH0LxatJvrT74PC0S9d5JAVB/mBeUTADCk6zY/wjbF5YYc/EaVIB9cgWfA6cUc4Yfw78Hcs8qRJmQqlgG6bVzyU9ikagzatEXnUAFXm+pKHObGOJ9ZXn5kvbq+7md7340aEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=iA1aDNhm; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="iA1aDNhm"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-229a90b7aa9so1842334fac.1
        for <chrome-platform@lists.linux.dev>; Sun, 24 Mar 2024 22:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1711345072; x=1711949872; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oAZt69YiFtuhVbaI71IIHXngFCNb3XB0wyBx/AVZmgo=;
        b=iA1aDNhmNQnB3osFlyR2iqIbh7LsaflmpMDsMY0sRx8GuKfoLz2rmvZapGzNBY6dH9
         +2htLyiqwMdmn0Itc5ZIk595bmZGRqX+f9wBBfP/VPqtD4x/wIExwMYnCnTotPdKCPPC
         PSJZyJ7fgDdJHj6Hzb1LRZhq9ZzexKTwaWaAKKxVAtsLTKyjt/bKmN7DkQa/YhxaT0jZ
         pSpQ/fiE0/S8G2ENX/U3RgXl/jxcoYhZ3nFz6hqDSkt9/N0QmgsXhiaKWX9tfb5njSeD
         41e/XQhv9IZe5ZFvGj3yQfowMe50wWJMBjv4M7NX10lvSlawNkZNAz1dY/dxL7vIY1/E
         9/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711345072; x=1711949872;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oAZt69YiFtuhVbaI71IIHXngFCNb3XB0wyBx/AVZmgo=;
        b=ehZL5xTFO3obwqoNhTHCOxQb/cS7Efb41DjzWv4jMhG2SUwpVja2C86u57AcWTLI+R
         Bw4tSfu2BLu0aEDABXB0imEb9sAPDGO395k9bzraWFACarSDXLWKeqtikjZCjub2FQkQ
         WORMPt74jJZfpqxPRnqHy4xuwrnE7Od3jsIrDTuQqc+aW/RivqWkcbi+s3rlyg7wV/6p
         pFiPARj318xdGb6p4ctdjN8X6C1bzNe16wfMgKaMAkUG3Av9eEW//INquJa6oN5hTl1j
         cCoXakEe+QfMobVnRH3JOaWHd28gNAHHfqErg4rdo9Vua1KxmuND6mMpiswx37MV/E1R
         iW4g==
X-Forwarded-Encrypted: i=1; AJvYcCXWdq9u1Dj4vtWMVGsfQUQV9WU7oN3jUNrvb6Z4hQ4reXGSWMOy0/HuC8LGmdo/juE9g/L7X9FR2PXx07jbOGJM12VAAxusGrkf0AhmUEwT
X-Gm-Message-State: AOJu0YwmKUEvjn3v4C/AZdfA7rUT0UmQWEM6RH5w1bvkMYs81prQJoa1
	EVku8u9vsEW1eT4p7fZDArhL1NUc+sUfHKv2Dk/fUNab3g3a81U0jnByuT/2HYc=
X-Google-Smtp-Source: AGHT+IFFuxtaWB7ecakPyNwOiINrtw3R6b51aCcnfirYmQnQ//S9kn54tmDGseuFPXhkkFfQOq/xcA==
X-Received: by 2002:a05:6871:68f:b0:229:7d01:7e03 with SMTP id l15-20020a056871068f00b002297d017e03mr6028745oao.43.1711345072568;
        Sun, 24 Mar 2024 22:37:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id n1-20020aa79841000000b006e689b25e38sm3544210pfq.90.2024.03.24.22.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 22:37:52 -0700 (PDT)
Message-ID: <66010db0.a70a0220.65382.8375@mx.google.com>
Date: Sun, 24 Mar 2024 22:37:52 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc1-1-gf7496450528bf
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 49 runs,
 3 regressions (v6.9-rc1-1-gf7496450528bf)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 49 runs, 3 regressions (v6.9-rc1-1-g=
f7496450528bf)

Regressions Summary
-------------------

platform             | arch   | lab           | compiler | defconfig       =
           | regressions
---------------------+--------+---------------+----------+-----------------=
-----------+------------
acer-R721T-grunt     | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig=
+x86-board | 1          =

hp-11A-G6-EE-grunt   | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig=
+x86-board | 1          =

hp-14-db0003na-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig=
+x86-board | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.9-rc1-1-gf7496450528bf/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.9-rc1-1-gf7496450528bf
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      f7496450528bfe9350c5a62d180b4926b96f571b =



Test Regressions
---------------- =



platform             | arch   | lab           | compiler | defconfig       =
           | regressions
---------------------+--------+---------------+----------+-----------------=
-----------+------------
acer-R721T-grunt     | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig=
+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/660101578201c77e664c42ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-1-gf7496450528bf/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-colla=
bora/baseline-acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-1-gf7496450528bf/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-colla=
bora/baseline-acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660101578201c77e664c4=
2ed
        failing since 0 day (last pass: v6.7-rc1-4-g57eb6dcd32cf6, first fa=
il: v6.9-rc1) =

 =



platform             | arch   | lab           | compiler | defconfig       =
           | regressions
---------------------+--------+---------------+----------+-----------------=
-----------+------------
hp-11A-G6-EE-grunt   | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig=
+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/660101448a45af444e4c4333

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-1-gf7496450528bf/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-colla=
bora/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-1-gf7496450528bf/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-colla=
bora/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660101448a45af444e4c4=
334
        failing since 0 day (last pass: v6.7-rc1-4-g57eb6dcd32cf6, first fa=
il: v6.9-rc1) =

 =



platform             | arch   | lab           | compiler | defconfig       =
           | regressions
---------------------+--------+---------------+----------+-----------------=
-----------+------------
hp-14-db0003na-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig=
+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/6601016d8201c77e664c430a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-1-gf7496450528bf/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-colla=
bora/baseline-hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-1-gf7496450528bf/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-colla=
bora/baseline-hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6601016d8201c77e664c4=
30b
        failing since 0 day (last pass: v6.7-rc1-4-g57eb6dcd32cf6, first fa=
il: v6.9-rc1) =

 =20
