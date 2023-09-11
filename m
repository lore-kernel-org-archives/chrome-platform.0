Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385AC23A8
	for <chrome-platform@lists.linux.dev>; Mon, 11 Sep 2023 05:12:24 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-68fc081cd46so445435b3a.0
        for <chrome-platform@lists.linux.dev>; Sun, 10 Sep 2023 22:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1694409143; x=1695013943; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7eh26PzoZ/8o10oBBn7ZHWkPWJZXcWf18Q4owb2JNm4=;
        b=X0YCqCSzxYA8kWR2YfLy7YiKxkk9jyrHRVfwBDtKiXIw4T0cawVn+vkQg+qTQvyQGC
         HIOf1L4Stoi8S9Th/wBlImAXHrQtGFE8GnQyK5zEAAaWqoY6bcNVm7844vJkf1Gd9P2C
         VkOi1FmN/9Kw2m6ijBUXSypucnhXDSmDy5GMaOxlQIVAVOBt4EV/xi89YbcH0jFjqye2
         RYhVPpsZXUaAaoYUXhV4e9MzXj5QlCyET0qdpY98qe58kNcSqRIkn+o8vzxvWTTK3FQC
         PSuI+QwUDpNICxucUEq5jYRSKwW1RbENfDtxYJPHVzNwwu4MlXQeeTE+QJcdHs9v84/v
         8NNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694409143; x=1695013943;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7eh26PzoZ/8o10oBBn7ZHWkPWJZXcWf18Q4owb2JNm4=;
        b=QqTYT0HNQmYH3IJy0yFwUq2Zm6BWfHRlVqVXvaOa2Gfn81NkPeZs6YiLj0eKi1e3i5
         0gmH14ssY4s3sIO6dpfCxcSYfrq6/amoYVcS5doclaALzfiS5AwqfPqBhIJFDwO9h+mi
         TlM0IncLQjvsQ6+Zbn1oHjQWqnENokamCDLwtJc7ZSLRghX2eCSrQqWs+/s32MAaG7iS
         BVqAhPH1yqG93ZrUf1/BXDlCkhvo9QGGqVMrDiKx/we0o/yD+k7HtyHvi+NXKvC/Icwr
         LLoRsz/512iR8wD/8VDowqMvywj1SsnTGyIqH+xSMz+MCpRCYHouYaS8QCUpH8F1N354
         MXCQ==
X-Gm-Message-State: AOJu0YwB7IMQ9dlFPvFpG/rSTpsKsp3WtAkigO11ALTtHdTjddgHKGkg
	JE1jCgS9EuoZNnLYNMlX32GVUw==
X-Google-Smtp-Source: AGHT+IFdaelWuDTvd8POx/u9GeDzvFew4rslkHjuFkty+QkuWqqP5fxGNnyj27emyJlWBgz+3bZXyA==
X-Received: by 2002:a05:6a21:788b:b0:14c:c393:6af with SMTP id bf11-20020a056a21788b00b0014cc39306afmr8513087pzc.0.1694409143591;
        Sun, 10 Sep 2023 22:12:23 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id t5-20020a17090aae0500b0026b3ed37ddcsm4738970pjq.32.2023.09.10.22.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 22:12:22 -0700 (PDT)
Message-ID: <64fea1b6.170a0220.7854d.aad9@mx.google.com>
Date: Sun, 10 Sep 2023 22:12:22 -0700 (PDT)
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
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.6-rc1
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.6-rc1)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.6-rc1)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.6-rc1/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.6-rc1
Git Commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/li=
nux.git
Built: 3 unique architectures

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, =
0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
