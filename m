Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAF9692FC
	for <chrome-platform@lists.linux.dev>; Wed,  3 Apr 2024 23:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712187622; cv=none; b=ZvNY+vBA3a4fF89D2KcpCW5+Ug+Vcw7s9de/6AKd5i5X1shtv9RfX2dsuP9G7ojvkzwehLT59YG8OaZ3KyG2S/fqPwdyRgF/hMFypaO8D1jKZYXM/kHFowCs3PhJTxxJPhSDhgBMpEegPBWrLmhn959ppLgtTqKddhpHIkGLhQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712187622; c=relaxed/simple;
	bh=8xTUu3dwxTqXsksW9NQtursV2TMUFXuwS0L7LKrQoSk=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=iliHpMiM8Bfly+ImZZBCnBNMvblWBvZFw8B8da+ywr/OXG5NbXs/YIbAstJISqAhAiLlm/goUC8Y1iwQlZsf6oSIkLoy4OEsdaGe1Fze5yirYTRqEFiGY1EhMZr7RoOXW2jC14Mua0hnzu63tH2NOuOlf+nHsAPZwHDGrOPvjLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=RWi2L+kY; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="RWi2L+kY"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1e0d82c529fso3632075ad.2
        for <chrome-platform@lists.linux.dev>; Wed, 03 Apr 2024 16:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712187620; x=1712792420; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r7AUXpjJu5R6EE3dn9PuHd2bXcH+SH57OHiAt/fdePs=;
        b=RWi2L+kY4G39dMmaMabIr54/WA5nvNUXa/1yHp5tac+sDJmMc9EduvNi7y7EUmGfHK
         kyqVkzoBzV2dS0mQhnAbQh/cuSOpwdcym0Ezpa7a1fTs8ABpDD7KpxrmNSYFzM/7b/LV
         VEi8SAkg4/zEmZp04oFjSabUg06vThPZvmFbn7DEvIHUX5VRzkk+pUSD+mxSXyoJfmUx
         A+DOfIUK4Yc+Dlp6V2WdxTZ28GlYM9j1dOF+byCfQBsifki0qLYBuv+Fs+5JShTc4FGA
         o8ypRTxxSYQ3Wr2qkE1LaXOppLHiFs+v7JsCZ+trUj+0XwO5DBlm6pt8ZS3CO9oP0abG
         55Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712187620; x=1712792420;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r7AUXpjJu5R6EE3dn9PuHd2bXcH+SH57OHiAt/fdePs=;
        b=XBH+MmHbHJ+RVwCU4pb/HOs6A4wGlm3LNJe59ngdW0FXtlOutOsZXM5goRKxwman4W
         DN7KHQonTiVEOMtXzby91LPdTNdzIF7Qoi1kfA4IfznQyP/yNzYgERd2YNLCdnOlYZ5e
         EvNr7dAp0OdTIknCQwdVITHQPBsKobPT8Of59+dlOVSkwdqD240tucHDQ7NzpkKi13Dj
         c7W3Qi/PLyZy6RIP5wzt1hvN9eq+QmO84f6zSBiFu24jxzi7kOdtahWvGC6sll+jsw3g
         wwN+D82jWQ0ZQlp2Yep2i5I1q9I28hbwJutNiWg+Q3rx4YVfwHnEy2zu4LBmOr1YFI99
         Xd6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWoqh4FQDjV9qV9jK5p8JzzcvSlFuznUyO2DsgvA7LVghjXAR6jcEIjvJpkFQgRK8jA5CGpDXf9ALvDiIPj6K0dNhup4OpJLugm8KOoPvlD
X-Gm-Message-State: AOJu0YzdVh1I3+L1th3e41CT6ohDLh9fit1OZy+dqMlMCUCNOLACia4r
	G5V43WoSn/s34EOSM/8KKo6qGkrSWYeweo+DMjTh6xx/cQcd/5tgw6X1VQlzioU=
X-Google-Smtp-Source: AGHT+IE3PbiUVIih9JePxQXyUC0otNEubmId7YFOAlKKsC40mC8wZaurietFFcS0UhZQPF+x9iRakg==
X-Received: by 2002:a17:903:204d:b0:1e0:e2c2:5712 with SMTP id q13-20020a170903204d00b001e0e2c25712mr629486pla.3.1712187620288;
        Wed, 03 Apr 2024 16:40:20 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p16-20020a170902e75000b001dd7a97a266sm13881615plf.282.2024.04.03.16.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:40:19 -0700 (PDT)
Message-ID: <660de8e3.170a0220.57fd5.76b9@mx.google.com>
Date: Wed, 03 Apr 2024 16:40:19 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc1-2-g7f20f21c22aa2
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-firmware-kernelci sleep: 4 runs,
 1 regressions (v6.9-rc1-2-g7f20f21c22aa2)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-firmware-kernelci sleep: 4 runs, 1 regressions (v6.9-rc=
1-2-g7f20f21c22aa2)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig+x=
86-board | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-firmwa=
re-kernelci/kernel/v6.9-rc1-2-g7f20f21c22aa2/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-firmware-kernelci
  Describe: v6.9-rc1-2-g7f20f21c22aa2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      7f20f21c22aa22e488530f66bf4fc168e427f5bd =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig+x=
86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/660ddf15ca4f9171d34c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.9-rc1-2-g7f20f21c22aa2/x86_64/x86_64_defconfig+x86-board/gcc-10/=
lab-collabora/sleep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.9-rc1-2-g7f20f21c22aa2/x86_64/x86_64_defconfig+x86-board/gcc-10/=
lab-collabora/sleep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/amd64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/660ddf15ca4f9171d34c42db
        failing since 9 days (last pass: v6.7-rc1-2-g09aeaabebdaf, first fa=
il: v6.9-rc1) =

 =20
