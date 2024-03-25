Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E33D136E17
	for <chrome-platform@lists.linux.dev>; Mon, 25 Mar 2024 06:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711347775; cv=none; b=p5A89CfCAn1T5rEn6KnxVU84lwJe24+0vlYDEg67/3ZdOmdM9+taVtwQuK3Cnkjff9C9flAHJYqVYWwPTABIx2ATLRSgEeBVKrnouLnT1d7MolVGT7Cx54nE1wXjZf5dGHb3DRKc144yn4jcYDYj7v6I6VSKm0j0ud55A3VQJ+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711347775; c=relaxed/simple;
	bh=YN/LZZPI80eG6Wlb6mo3RfZXqy0IJpq2YGso7Xzomq4=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=UZWeYx9cRCl+LjuzCWDPNBYL811hmjnPC88HpOOoyJ/jJoMrJMZy5C8esNoVAA7LzVDNxYBy6BFHbK8rW6VZQBgOcAhOqeH0ENBMPFjEHIkJe9k5MmyYc9RJbsE9gG1Qnt+rAhIGhoEPsXzdQAL8XUL7m2G7rh6LLFfoQGUTkpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=o7etdo7E; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="o7etdo7E"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3c3acf4b0e1so2440923b6e.0
        for <chrome-platform@lists.linux.dev>; Sun, 24 Mar 2024 23:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1711347772; x=1711952572; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tPQ0ZOqDucxuojUe+MwCmDB6iNJJcrnMwiTVvmTvLYY=;
        b=o7etdo7EAqQl7Qzi1fcd0ZPGFT8RYXIN6O5ZgrRfjRBQbAI88axA4YF5rM/apZ5zFY
         OiFRgl1zo0F6BPuz7RxSpnTCgiYn/oEof5zuoDbOq/a/6ola3QrJ6j7RWTG8ectqWEJS
         5OX4SCFRLINoD9I17UACjwRspm4zoto4H31ly6VcDWYmaxPig2k5SOj3m83Sg+XurI5J
         DTLH0iLNXruSJ7A6hGGGGYnlD8WFSyDRzQYM7oUbtrITNsW1+XzhLiVdksQyktcrbUpl
         C6O1BsFu//6JcfTJYLjhWoptt3DJCRAcLhCJNepJ4122Hm8ujIsBsTewbztiFRvNzRCZ
         kY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711347772; x=1711952572;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tPQ0ZOqDucxuojUe+MwCmDB6iNJJcrnMwiTVvmTvLYY=;
        b=wMAPy0QQek1HGrEh8YRe7DghzFLaqMIk3YYz1jk4yUlGIIHWp5DMJR7oCgUcIau/ZO
         DashfZsxQonIc1GjdvtmgmYucvUzMcIQVhylwMXj+uzBFGwJ/YhEJWAkjk4IJnZ27VkH
         6AYgp8EnJu03aiWNymgqCu81Y7RaPMHXklgxVCUhwUJ84m62QXEccE9P070j77yWGdKo
         EBOvLZhYd01Y2uKjTnj1TdAhkWuLk/RMHqcGs1uLJRjWDAzKPKOKCTJS5V+N2CBLjjwL
         l6CZfcKDgeB1eYgnqpiHKSaeyOpfyIiJTrsZ7AJ1GqLyNC8RD2WV+6u6LSxJJEXD0DVc
         fIEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq7vYkrpuulGubuvEWgQXWVp/Mn938Ks8VXOcdg1qP9vajF8lpKsxZPoO6avZmtyqm+C4Nqt4jssNdIxC68XTU0DXBe5HxDmVSbzg8LjqU
X-Gm-Message-State: AOJu0YwNRR4QGYcA+5fO6AguVHZRPsluzz8vh45GQ3ZkrbLzsClO91TO
	lCY9EN0FowSTzCFHmPDDIAIRgZp/IvdAQ+KCSQWdgNkMVVNp5Fltd2970fYIxfs=
X-Google-Smtp-Source: AGHT+IFrhZE03LYKND1Hm7WY95a7uG/lXLS8f1LYikbheFiFDVsm37zDT9Gkc/tp4xxZlH/zT88L7Q==
X-Received: by 2002:a05:6808:2e4e:b0:3c3:90d2:c6ed with SMTP id gp14-20020a0568082e4e00b003c390d2c6edmr10008948oib.21.1711347772407;
        Sun, 24 Mar 2024 23:22:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id q18-20020a62e112000000b006e8f75d3b07sm3517799pfh.181.2024.03.24.23.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 23:22:51 -0700 (PDT)
Message-ID: <6601183b.620a0220.5fd98.846b@mx.google.com>
Date: Sun, 24 Mar 2024 23:22:51 -0700 (PDT)
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
Subject: chrome-platform/for-kernelci cros-ec: 5 runs,
 1 regressions (v6.9-rc1-1-gf7496450528bf)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 5 runs, 1 regressions (v6.9-rc1-1-gf7=
496450528bf)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig+x=
86-board | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.9-rc1-1-gf7496450528bf/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.9-rc1-1-gf7496450528bf
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      f7496450528bfe9350c5a62d180b4926b96f571b

  Test suite revisions:
    cros-ec-tests
      URL:  https://github.com/kernelci/cros-ec-tests.git
      SHA:  fad9423ae3c64bfd48c207de34a1177000d45fa8 =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig+x=
86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/66010586341998ff2d4c42df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-1-gf7496450528bf/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-colla=
bora/cros-ec-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-1-gf7496450528bf/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-colla=
bora/cros-ec-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/amd64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/66010586341998ff2d4c42=
e0
        failing since 97 days (last pass: v6.7-rc1-3-g59a9ccf19ee03, first =
fail: v6.7-rc1-4-g57eb6dcd32cf6) =

 =20
