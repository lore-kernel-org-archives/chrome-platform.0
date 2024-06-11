Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F6617C7C5
	for <chrome-platform@lists.linux.dev>; Tue, 11 Jun 2024 13:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718111702; cv=none; b=Xufl/dKrBm/dmJMZuqgjvHsgH+ekgLeq+Jxrykdlaq1plqEah4yTOf20cP8m9sMl4SjkSfMfvuLDQpU+JRZNdU0OswVJrrjqOpeIyEJJuFrtvUmD004AneqYfDIDsDI87AjGE19qak/nu6kmO3AXxfj1JYCe0lS+dB/dp8eOMfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718111702; c=relaxed/simple;
	bh=bS5rZXy/VFfLP0t/Jez/+NzchwQj6kQqFGqyBxnX8w4=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=p6kyX+QRyMBs7//gXXF6vTzUiTYcpvdSKKRbX7VrGoladzdYIyfBWJ0Fb3R/vaNj3lZQAIGJ/Ij4SysJkErrLvpIJcl/ihO3sDITdH/esuXy/CoGRB9u+F+kXxtQSG8yw2wzENlc0R2lFMjxjmRCwqZUIorM8y3fhJRtgWB9DI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=uIh/hrRg; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="uIh/hrRg"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1f47f07aceaso48058385ad.0
        for <chrome-platform@lists.linux.dev>; Tue, 11 Jun 2024 06:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718111699; x=1718716499; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Mc07jzObAzYg1Aagk5MrGrwmD84Wbg4bORtwDPoa/rE=;
        b=uIh/hrRg7aYJ4vzjqNcYUto1QdzcwHOcLtqlqePWYrV8W19/rLL1lJfE7pU6dsUUSu
         NOKdlTV8UjtHvj1dbajNrN2hfDBRtFxlPMjtDyHiutMhjR7oT8Nap+ngmmxRTDsTQkWP
         0oZT9zwAu3o91J/Lc0P5EZ0RfchzpeSE/K4Agx0l/a20CJ3O7q2ZgFkxLfw/mC0wufEe
         bFXgUaVfFtTidu+eAiSkY6vJqZecPmKbqhIamyrQMUmScaQo4p83k1bvy461h4wB1gHi
         uMOHy08+8xJjpDUxGKf3LOkzAAfgyDFUU88i65tcTZrbrhaNaEC+NJotzZavq44NXYF9
         E+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718111699; x=1718716499;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mc07jzObAzYg1Aagk5MrGrwmD84Wbg4bORtwDPoa/rE=;
        b=Pt80be1ac9bh0Rj5iaIEUu9aH9BdNhGnT4siAL4MAiskp/+rkYdL/68Ht7g0X8tY6k
         7+kO+QxCU47eOlFXNXmiCSUj6qB3ixXIs6PVvadaxK0mP1whai7T71NJw0bsREbq6rUQ
         TeWR30hYJLVqkn//kLwuqAVH6ovC8n6RX6cs8NRhpDpl95UwFTamdnP/iYHtRTwPxSLR
         n+7GOXfl91UElyEyKW1zVVaQIs0g+Uwfrhq7BCg5031/eN8BUqOzqpLxHbFk455KmpIq
         OSfofa1FqRsV5yOzKzVVSjk/IlyXBbM2w3ueImUBswZe6IqqNr1jKxCvXHMuLHRMfXJT
         zzvw==
X-Forwarded-Encrypted: i=1; AJvYcCXOAgG8Ba1IHc6/iswU8TNnV4Au2Og5i01nLP+33IK41+eqnCO36rxRNU7yNgPAFWf6JKmELs3P42Gk8VSoI4shqHXrg+Im7O/oCjGNHnWu
X-Gm-Message-State: AOJu0YwdhvpYfpCHnIf2jNcQC29SwAGR6H2g8StXeDnWre0bjoSdtwAt
	wavFbMFI0bGhBrJLcctTb2IXm4g57F1F/p/Je5BpeXDgwkC3PAdMU1Z3el3cEjE=
X-Google-Smtp-Source: AGHT+IFtelYv+fDi1gl4DAlvCAB2+KDi6vLk2GVTcqjZ8jgMSXiI4yKu93LoH3JyGKQPYUsfKjQXVg==
X-Received: by 2002:a17:902:ce89:b0:1f7:42de:e7e5 with SMTP id d9443c01a7336-1f742def02fmr1107745ad.45.1718111699502;
        Tue, 11 Jun 2024 06:14:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f7064c1105sm46326075ad.225.2024.06.11.06.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 06:14:59 -0700 (PDT)
Message-ID: <66684dd3.170a0220.3e90d.d49e@mx.google.com>
Date: Tue, 11 Jun 2024 06:14:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-16-gd11c00292a31
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci sleep: 8 runs,
 1 regressions (v6.10-rc1-16-gd11c00292a31)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 8 runs, 1 regressions (v6.10-rc1-16-gd1=
1c00292a31)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-16-gd11c00292a31/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-16-gd11c00292a31
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      d11c00292a31537ae1e46ddea8f101f8822ede34 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/666840691ee9b97fde7e706e

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-16-gd11c00292a31/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-16-gd11c00292a31/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/666840691ee9b97f=
de7e7083
        failing since 78 days (last pass: v6.8-rc1, first fail: v6.9-rc1) =

 =20
