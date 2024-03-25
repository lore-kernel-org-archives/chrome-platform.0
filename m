Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1B114E2FE
	for <chrome-platform@lists.linux.dev>; Mon, 25 Mar 2024 03:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711338734; cv=none; b=ezOx0N0HeJhZw7MKttjangLC9CJbGclMDGa8KFwNr81OrANhyVCA2hJIJCJMrOPMgXuL3nDp8qfvlWAx4Pj3i/N3s2fZ193TJWX4Ect8yHY82bPyrxf6OjdPQBgY6/tj4/rjDGTkzhcmml7WLHNoofVCKtI5W8pIIX85kiigcX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711338734; c=relaxed/simple;
	bh=mPJd+rx0DqLnTwDy2K/DvmShT6Lb6tGmVi4VEPQt2v8=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=PyZDpXWwOMk56Bk+dJrisbZICLMOTDOZyMBEdlUrucF5TZan/dKo7eNlqT281bS75vch9xXp9LQ0P9LfUABKE+tjIPVh89qoTnejw1aNDIk7G6g887NSdR5Ra0t2V4Upf6Jhsz+wgjku0Qb5N8rC/UYoY6/gCAmvJ3k0H21/W3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=u66rCprS; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="u66rCprS"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3c3ae53f662so1635416b6e.3
        for <chrome-platform@lists.linux.dev>; Sun, 24 Mar 2024 20:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1711338732; x=1711943532; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GY/3wZwx1u3uN/6nKMpshvSMvFZ8loCKdmncQ5T+dS0=;
        b=u66rCprSsqjl0eVnFRI8NBjTCNXJQVo25G+qEsenEHB7KRP0nrXT9Hiuykb9scFMaV
         1h74vWcYg069J0Makr4GoEWMJdPqOCzYqXPgPuGPEAzf08LPDyHq6megy0NmHxPM6DcO
         3sta+URtYEhza1vbvtANgCMBYbeT15objt7lt9lZXSl/r2iSdFxsV8jfsHD2q7sk/syk
         PMWO7T7qFU3DtnS8DbG5JpCd+MQLXB12D1Vm0aVe16nTP1tVb3mVdnTWPkICXWU5WD8b
         njjy2tBJ+w2isANaXyTBhjWeXluLb2IAaISVgygwsr8sPHtp5g5ydKVytRnVl0EcmEbl
         HCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711338732; x=1711943532;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GY/3wZwx1u3uN/6nKMpshvSMvFZ8loCKdmncQ5T+dS0=;
        b=aVZLG6MvRHMU+zi2V0elC+4a8QO/YFRgtksh7BuJrLUVNnrRU7ULasq6tTjoHwETP8
         axhSnPjUDRl/lrCzlTVN/ySlHK4bA2J9tAtocF9Co/H3UkIN2gUL286RZJ22hnUI3qzN
         3WD8f2R6JoOSwd9y0zIhXyD4aC2hooONjF7Qbq7y1ElJyhcaL9tPQT1XssbNsdB7jKy4
         o9NrMW8eTxIod5rJ7jfm/RDGeof04yGhRpVucX4S2g7PbakNzSb2q9mD2bQ8RiHqNztP
         j5Axe4xQZ9T0S6B3QQ6+MpRl1VureVXok25Q8Tst3ZH+H474+XN6gTkBXNGvzl4UIJDv
         wRbg==
X-Forwarded-Encrypted: i=1; AJvYcCU6r08TPUTCkgrie9Vehn+ZmCr0ah1lGDqyFl9LmzR3tAk5sgOPaC5LZY3dEpCtKGnQjIq6QzJ4YxNVvopqjnDA1j4Fod9JN8e0mWrs9FAH
X-Gm-Message-State: AOJu0YymL4vKce4/WU31FJqfZiEyKtWi5nrfD0Ce3PgPnVENyD/Xiia8
	Hd9NlugD3D1X1MiNj2L107+HteZGaiZm5TUAsJIo2RmSv/afiKFTsDGEOkP4qRY=
X-Google-Smtp-Source: AGHT+IH8OhJI4heiSEu/pGUmjpxMCnwVpkQCc5H8ru7CbDMvdCqI44Z2ILzJOs4KgnGuMNmoCbIYig==
X-Received: by 2002:a05:6808:640d:b0:3c3:c157:5522 with SMTP id fg13-20020a056808640d00b003c3c1575522mr6826462oib.37.1711338731942;
        Sun, 24 Mar 2024 20:52:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id gx1-20020a056a001e0100b006e78f563f91sm3306178pfb.118.2024.03.24.20.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 20:52:11 -0700 (PDT)
Message-ID: <6600f4eb.050a0220.c3249.7b78@mx.google.com>
Date: Sun, 24 Mar 2024 20:52:11 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc1
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci cros-ec: 11 runs,
 1 regressions (v6.9-rc1)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 11 runs, 1 regressions (v6.9-rc1)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig+x=
86-board | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.9-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.9-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      4cece764965020c22cff7665b18a012006359095

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


  Details:     https://kernelci.org/test/plan/id/6600e05830fba145fd4c4331

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/cros-ec-hp-1=
1A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/cros-ec-hp-1=
1A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/amd64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/6600e05830fba145fd4c43=
32
        failing since 97 days (last pass: v6.7-rc1-3-g59a9ccf19ee03, first =
fail: v6.7-rc1-4-g57eb6dcd32cf6) =

 =20
