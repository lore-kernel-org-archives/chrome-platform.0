Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D4913957A
	for <chrome-platform@lists.linux.dev>; Mon, 25 Mar 2024 05:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711345975; cv=none; b=YApW3wwEHNCA8A0iO85gkQdA2vFQBj8AZkBY4t9bAUHbqzfcBkhtNKArOHvBQ0QgCx0jIGp6b9GBYvjbVU1tnFkf0D9dID6HRaY/GpkZyL16a4pa9RL5dHUBG3uPXB2kKReaYSSDP8iURFeFKxb1HZkw3SnxysBZqQteq3qEofo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711345975; c=relaxed/simple;
	bh=C0W290sLCiQdnU5u4lQQ/4uUPDRZK7xiV4l8a1qZIOo=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=UGCbcGOs3740dY7899abeN9nDAesA5nTMyUyRC9HeDEmZg6yNqRBGDGrtv58AAifzFSAhXsUFoQBp4F8QVuRoGOv0sGT/A+3qY+8u44kgZ/9Q6OoFeq6Z588K+7gbLbbgBIQVV1qV/vsKycwRG8DRA2hXsfVyuVH4fs0y2OEgSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=QuatPGx4; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="QuatPGx4"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1dca3951ad9so26041345ad.3
        for <chrome-platform@lists.linux.dev>; Sun, 24 Mar 2024 22:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1711345973; x=1711950773; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GCkopBzDUBorH62fyVM+Oy3Dsa58XzUZ0j/BtL4GPmo=;
        b=QuatPGx4fpFJt8x1nFaKlqeDHeYvK62hRcVDi8XpgwdaP9bR+vpoG+G6AyjnwBIf0H
         s+htqr/CJxfj5+4LPneGxTHgpJvshZfn9TvsDs1EyczhG0dkkXiMQaEJLM383RjzEiV5
         lcS5xF4Z7bmTIyjYjn9AocbSQebM2uGGGlrnCHz8QoWqFhPVkFCB/daq0YBM6txM9z0G
         ixJcVDp6eTfEJU0d+hx65qWd5iBknRhhHJkW4KLjVjjQYaUBh3MIENW4zRxdY9O8NRrC
         9z/QbC+je9n5TCCvqAD4LU8GSe8MSqlPrsFYNES2IDzWvL0Xkvm4vOqCr7+MxkFbC8cl
         SbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711345973; x=1711950773;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GCkopBzDUBorH62fyVM+Oy3Dsa58XzUZ0j/BtL4GPmo=;
        b=uN2ekidURMh312DMQbA7A/Y+IpQYZ0WXh5Zz0BhLWoLD8/tWnx/41/bM1cUfNdiTQ/
         qadqNqLQvc3vjrxrb3675E8aVd6Z2kwlzqSKKv9sueVNKr7Y7DBNS9mu0MfSZpyXRvbQ
         KW8H4R7Kbf4GaDbYWTXZuNUD5jr7xK7cqWhBNOMrmh9yd44lO94ORHNKnKbnbq9D/L4Y
         o5F/PmuUX5T3SNASSlIHEo1WUyWNO0scI7A46QlvL3yDHERmOQsVzJdv7CG437lqeA0p
         rSNgKOqseQgCy1h58ubEKJZlQAr0yN4buLx+9MmBl/eE/vdlM6i8ETFXfZ2pjuCKfvBh
         ghOw==
X-Forwarded-Encrypted: i=1; AJvYcCX7KPC5VaTjPVBdsw4uUZ4o6SUa5yCvV7l3kFGEM/hZz09Og/b/D2eAbpIEswGPMroQIwZbJT4YfdvbLsqq2ZTxmiDiz0heMu30n+JGRF/B
X-Gm-Message-State: AOJu0YxtbJDit84bku2vNlZHuvHvBQFOvNZFC+YpBIqoSPKruU7RBzEt
	reVaWHntTD7ckAlUE8Nt+sa1akPyDiHEl7r6avc0kAL5Ssmdp9PyB2iVFwwJvgw=
X-Google-Smtp-Source: AGHT+IFCjIHZAR7A2gFykCT2fV+PG+iNEIAcd8BgIbEa1E0/dxvu43HMWb3mMw4Dfd2pTR2/pX7xrA==
X-Received: by 2002:a17:902:ecc4:b0:1e0:185d:16c3 with SMTP id a4-20020a170902ecc400b001e0185d16c3mr8727787plh.12.1711345972827;
        Sun, 24 Mar 2024 22:52:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id b21-20020a170902ed1500b001dddeb10d83sm3970196pld.223.2024.03.24.22.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 22:52:52 -0700 (PDT)
Message-ID: <66011134.170a0220.f43cf.921f@mx.google.com>
Date: Sun, 24 Mar 2024 22:52:52 -0700 (PDT)
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
Subject: chrome-platform/for-kernelci sleep: 4 runs,
 1 regressions (v6.9-rc1-1-gf7496450528bf)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 4 runs, 1 regressions (v6.9-rc1-1-gf749=
6450528bf)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig+x=
86-board | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.9-rc1-1-gf7496450528bf/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.9-rc1-1-gf7496450528bf
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      f7496450528bfe9350c5a62d180b4926b96f571b =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig+x=
86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/66010353baa5dd0bc44c430f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-1-gf7496450528bf/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-colla=
bora/sleep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-1-gf7496450528bf/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-colla=
bora/sleep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/amd64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/66010353baa5dd0bc44c4310
        failing since 0 day (last pass: v6.7-rc1-4-g57eb6dcd32cf6, first fa=
il: v6.9-rc1) =

 =20
