Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84581534E6
	for <chrome-platform@lists.linux.dev>; Wed,  3 Apr 2024 22:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712184726; cv=none; b=sGfKqz172BomTlN9xxZIL0RsNecGtYFgDk0HzHvcs+ua4gFbXkBIQomNqSTdqa3PKfH5z3bpbtLozBhTbnyRpSFS89a8wiP1lMBcumhnb+zk8qr9RUsKq7Zuq+gYPmslyqx3zA0tesW20twuvz7i/Q64C2QYsWEWZEx3RB9jKM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712184726; c=relaxed/simple;
	bh=WuMOEdKDTkQiQL5LWRoqf3ZYZH+h2q1mat7tbzj8/+M=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=MVYmtokcFRuBU+YSFL9WElVbBJzOatWpr+cgxI+DELezvw90hQw8QipVd3F5l6+q1eitX0hCMxJSnhGrkSMD3EPFbRiR64v6c+E49l2EWzOSGJR+GDb7SzMWI7u45+gVyFhlXMddoAI8yG1pcblYdlXlBv4AohPOGActfLpPHo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=TSHYixrl; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="TSHYixrl"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1e2232e30f4so2957065ad.2
        for <chrome-platform@lists.linux.dev>; Wed, 03 Apr 2024 15:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712184724; x=1712789524; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tzUduKlgW08XviJ392/tcd8parpKXZNzO21BQymoIoE=;
        b=TSHYixrldxXFdhuZ2jWodwmSwRwyKjE09a1LI/KRtC5bCeFB+ZhQfuRJ6HYQQUyvXW
         v+upQfUVT/bNjVWuLGeh8O82+a1QbgG0RfJ5prz3DOiw/aWuyhlMN1YVDni+QYUMmsEH
         5yFNhG804h+y2rNi9NVa25QSase7uNxYBxW2Q94BBa/Knd73ebs0+eCybGb+efKZGek9
         4kwLu8qlOHxhwveitmr45b6VuGeiRbHUwxFXtXdBBWN5DD/GZLgF1JqvMGxzLtD1QmBG
         /yNGKmvfuxkFawB65KKeH1P85nJ3m0C4xxWpFGEpZ/oggq5Ee3VdFhZJNKwmxVecAfrl
         E7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712184724; x=1712789524;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tzUduKlgW08XviJ392/tcd8parpKXZNzO21BQymoIoE=;
        b=V/8Jf03u75kL/m/vnDqNu4TtMnO1DAJHUnur2zos3pUNK7df35h709L81wXenZ8s/0
         60fvJddItCuw5KEfnAnZWDEJDbTnZ4wATRcazBcmpJPNM8GMHGaVo9+YRo/1t3ge5m9M
         K8MfIXf8ljrKsuL800b7Dzez1kCWUiFpoG7dwm6GKZLlPNMQ6lhHkCL4R/WbOKOk1ut3
         o1Wa+pXEWGhJcIdru7pV6b63zVVhOkgPqPadQyABoEAhxfM9vHjKtcrBpXjAE5wuyQ+W
         XIvtchByNBfI9TRAiHo1bOgmrUH8Jt/w2GowthJ4mLmrPVCsrjvaEe0l1zaLLcRWecLC
         DMNw==
X-Forwarded-Encrypted: i=1; AJvYcCUyIrTTw6DWxwTfNvLzmcWSlJdmW7xg28HDQXsxEaxKFuMU3OlcgZa9bc5EixXXSHrdy29XkP6U/vVz0XQV/mfZGsSv0yAXXmB4BqS0JHIQ
X-Gm-Message-State: AOJu0YwMDpPzU3bDgkpSenALhntv+Ijq6wlncPC4s/JiNetuS4UQz8ZY
	uUeDfmKeKgfeL5f8f2iZQ+PR7FmwzbULOc9q++0I9qymAKYHX4cnOvHya3+diRk=
X-Google-Smtp-Source: AGHT+IF1jCpmAfPt+qKGx4rkYdJ+K+1AE8NZXZX9E5fqYtpASNsBzFN9dsVTcF2/aktbTgs4pL9vRw==
X-Received: by 2002:a17:902:e492:b0:1e0:2335:8f77 with SMTP id i18-20020a170902e49200b001e023358f77mr515813ple.54.1712184724062;
        Wed, 03 Apr 2024 15:52:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2-20020a170903230200b001e2a43bafbasm544792plh.216.2024.04.03.15.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 15:52:03 -0700 (PDT)
Message-ID: <660ddd93.170a0220.6ef2b.3508@mx.google.com>
Date: Wed, 03 Apr 2024 15:52:03 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc1-15-gd91ca83599cd2
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci sleep: 4 runs,
 1 regressions (v6.9-rc1-15-gd91ca83599cd2)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 4 runs, 1 regressions (v6.9-rc1-15-gd91=
ca83599cd2)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig+x=
86-board | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.9-rc1-15-gd91ca83599cd2/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.9-rc1-15-gd91ca83599cd2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      d91ca83599cd2c0ec3f7638a5e8ee712102d8fc2 =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig+x=
86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/660ddd3242311403994c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-15-gd91ca83599cd2/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/sleep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-15-gd91ca83599cd2/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/sleep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/amd64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/660ddd3242311403994c42db
        failing since 9 days (last pass: v6.7-rc1-4-g57eb6dcd32cf6, first f=
ail: v6.9-rc1) =

 =20
