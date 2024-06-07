Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2322837F
	for <chrome-platform@lists.linux.dev>; Fri,  7 Jun 2024 12:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717763448; cv=none; b=bCHubsSqmzHYnd5IGHlUAnYMA25bgT1CwZwJE0b3ePARkopqcCIJcr+nf81PMsgtVHIBZdTNqH9U+JC/iuUURA+pVn/iIbznn98z8X+dN8+dYQlUer3QOFlW69DrHL/kehvWDnhwy/HaoeL08J5k8V/tOSKyforjyllvbwuK3SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717763448; c=relaxed/simple;
	bh=DwzBKpBUTGhB9pvte2QChabPqZFInM+VTjdpl4aT+9E=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Rj+wCYRwN2AucyDpwZcIHd86h1sa/sffkvjq7S9KFkeFkpkw48i+Oj0/FXbT8YEeygncGsmzZUFZaL3kyiKAn3HW9aY+f7lUg7Ws8G+1otTjRbORZo4YHAeBcxqf1Ptwip3UAxwTqRrQAeyvIl28c5FwRYWLp0jQnLKYfRT0c9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Lvtda/y2; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Lvtda/y2"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-681bc7f50d0so2221756a12.0
        for <chrome-platform@lists.linux.dev>; Fri, 07 Jun 2024 05:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717763445; x=1718368245; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XdGgSDeNadIfT4KbffffR3uCQW6UvqYu7wRUoTJC7QI=;
        b=Lvtda/y2B74R+1Lnx+7Ip89fi/qNhxKOORmlG15ng+ZJpI82Shx45SWjbNtvy4KBVW
         cVn09//DHSFUCGRc89m6xumpRLXQ4h2Zc4Cj6tCSL2KRyBnlRJS5AIV6on/EEHLnCYWa
         C/MFdFmU63UxVYHqlIZCIoBgkVB5zKwZlXOFh0PUkhO+Bv3AkxPUJhbHqGKMQltkHEKh
         IPYO/TsMJNKFjboHk2ey+0s4nOY0SByKudFAuIC3cOIjdM9F2B6bpptTn1z57FUk9MT+
         1o3w8scs9ArVIOREVd/KkUAXT+GqWCLr6ozL9rKvfjrBcOQKVaz35zG9RZbomR8RQmN6
         3Csg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717763445; x=1718368245;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XdGgSDeNadIfT4KbffffR3uCQW6UvqYu7wRUoTJC7QI=;
        b=c+Gmd/qVF0Btlt/joiwQgUxuDDo2674wSWgcmSVckeMnZrdkTyfzlA0vefdQsW81bk
         coMr3Fw2viPDRvsf0zLuYGh52TsRog5XJOV8TnKk6dofwh+JVXk3Xofu4zoD7sHaQrfO
         60xT8aZEDWQuuFxQJZbvNDqd2tnRx8KwFGW3K5qMFSiN0TWoYHnz4Y3vl+KyEmIfd06V
         NKCcZwl64/ZISyqV1eqPM+2egyaXX81y5Lkkl46f3b5PSByT4BDS8g0lqFh0gWxfvDFq
         wD0DUyIRPGMQ5p1ONOm+KR6nwWP3bD8ET3G8ZxGhlvWMI00Y6HhltkGzNov+BUVGIdZ8
         nBqg==
X-Forwarded-Encrypted: i=1; AJvYcCXb368T21WbKOTJslxUSrvysjxUu5kNwuflRsY405iu5p464jKJGDGPGk4IUR2sIwVhrTLMxbb6bwwv8zRiqg2P0i/Kl+NBH6e7FaoVi+ik
X-Gm-Message-State: AOJu0Yx1AMXBdT6W4blwbDAOOH/hagNF6/hMoYlYZ+CMp8Ksxd1V+bJ4
	Gc8fKPktqjYUl966mTnuVdoA0C7xT9os17xnogmEb3ktlUzBx7Kmt6fZqfq3tc8=
X-Google-Smtp-Source: AGHT+IGlVvjiJGq5SRR7rJMBJouv7H5tSS+g+VF5+bGTqV75WOARcxzUdTXz+5j2nvkwU0R/rwYUZA==
X-Received: by 2002:a17:902:f641:b0:1f5:e4ea:9869 with SMTP id d9443c01a7336-1f6d013806emr39104445ad.9.1717763445502;
        Fri, 07 Jun 2024 05:30:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd76ac0csm33467055ad.70.2024.06.07.05.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 05:30:45 -0700 (PDT)
Message-ID: <6662fd75.170a0220.a0065.8a88@mx.google.com>
Date: Fri, 07 Jun 2024 05:30:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-15-gc8a4bdca928de
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci cros-ec: 10 runs,
 3 regressions (v6.10-rc1-15-gc8a4bdca928de)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 10 runs, 3 regressions (v6.10-rc1-15-=
gc8a4bdca928de)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-15-gc8a4bdca928de/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-15-gc8a4bdca928de
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      c8a4bdca928debacf49524d1b09dbf27e88e1f18

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


  Details:     https://kernelci.org/test/plan/id/6662ed4fafe002a5547e706f

  Results:     2 PASS, 1 FAIL, 13 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-15-gc8a4bdca928de/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-col=
labora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-15-gc8a4bdca928de/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-col=
labora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_chardev: https://kernelci.org/test/case/id/6662ed4=
fafe002a5547e707d
        failing since 4 days (last pass: v6.10-rc1-6-ge8665a1723789, first =
fail: v6.10-rc1-6-gbc3e45258096f)

    2024-06-07T11:26:26.495185  test_cros_ec_chardev (cros.tests.cros_ec_mc=
u.TestCrosECMCU.test_cros_ec_chardev)

    2024-06-07T11:26:26.502235  Checks the main Embedded controller charact=
er device. ... FAIL

    2024-06-07T11:26:26.502338  =

   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6662ee03305982b8f27e70d4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-15-gc8a4bdca928de/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/cros-ec-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-15-gc8a4bdca928de/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/cros-ec-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/6662ee03305982b8f27e70=
d5
        new failure (last pass: v6.10-rc1-13-g04ca0a51f1e6) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6662f68777ea763ca87e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-15-gc8a4bdca928de/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/cros-ec-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-15-gc8a4bdca928de/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/cros-ec-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/6662f68777ea763ca87e70=
6e
        failing since 9 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first =
fail: v6.10-rc1-4-g7b44d5381e541) =

 =20
