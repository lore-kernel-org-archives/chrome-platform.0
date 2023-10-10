Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E4038E
	for <chrome-platform@lists.linux.dev>; Tue, 10 Oct 2023 01:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="dV4lsGrx"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-690bd8f89baso3815502b3a.2
        for <chrome-platform@lists.linux.dev>; Mon, 09 Oct 2023 18:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1696900642; x=1697505442; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=j9Lqb4u1H0DRJtqL4MW419an2/YmkYP1WufyQBbC8d4=;
        b=dV4lsGrxH9QCNGU9kxwiVSPRAIEijdGRRZn4uo76H6bVkY7rx1ge6lhV0KJHdARyis
         isDpfHOHIS3lA5jps1R/yf93xWyv9QaRGYI4F+PDkNK87I0AOAggBqVr7ieTeFfFj9Uy
         91Bml7b1cS7LBVasWN8vzXh0Qk3af35m3FxrSackHYrJ423DQXyM75qSI5uygwgDQ8zq
         Ox2Lsw8DeYHeuk2d+rmnMUOKCguwIGb6wxSZnV0jXPZAs8+1iVtvTu3mxAnO/obT1UlF
         oIdBFDF/tyTysb9g5yLIz6866iMNfIsBwpuMNLY0O8uLPdC8xwPogEDnnTJ5OAr2RntT
         Kc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696900642; x=1697505442;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j9Lqb4u1H0DRJtqL4MW419an2/YmkYP1WufyQBbC8d4=;
        b=bRruICfQiv/503aRWsnPskqCZRDAEoncO9NOIV0YKB0PxilEWqaCRl7HT2+ux6T1u3
         JyGY3I1+wvUyL1MnbG4u0bjaAvrdWemTuM8ElYPcNuROO9ONsaT59iLpF2Eu4ofuzqB0
         jan5ETSEZkUBAR/W+FyBj+GYDqkTj0bB5Yrn8n3nmQSixQpKCdASkQiUMSTJhlcE3hY1
         b4/6C1VCmMUEbye0wI7vZy+rsg471FMRrIFhj88ZdK6PfqZgChMh+5VGAn7pg6rEUUqB
         AtcvXB1qvq4mfqRvQsXpSCB1+J6mO0V5iLJJxxIUZbQdyJHIBF7WYV7sVy46DBQl8oZ0
         CVPw==
X-Gm-Message-State: AOJu0YzXinLRrLM5f0Xgb5cwAFaUFLxeNk3E/pXJdkB99fu40gQ/LEfv
	0p5InTxcm3oFGNBHoxMxud3p3A==
X-Google-Smtp-Source: AGHT+IFdJYugtsfBi3YA0sXWqmUkM4PcTf7ofT17WRoUjAVs4kgIfYzoTWqhKjw5kwAKmOrnxbwXxA==
X-Received: by 2002:a05:6a00:409a:b0:69b:5395:59ab with SMTP id bw26-20020a056a00409a00b0069b539559abmr9238090pfb.8.1696900641913;
        Mon, 09 Oct 2023 18:17:21 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id gx9-20020a056a001e0900b00692b2a63cccsm6996055pfb.210.2023.10.09.18.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 18:17:21 -0700 (PDT)
Message-ID: <6524a621.050a0220.74df5.1cba@mx.google.com>
Date: Mon, 09 Oct 2023 18:17:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-rc1-20-g466f70fb1b10
X-Kernelci-Report-Type: build
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.6-rc1-20-g466f70fb1b10)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.6-rc1-=
20-g466f70fb1b10)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.6-rc1-20-g466f70fb1b10/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.6-rc1-20-g466f70fb1b10
Git Commit: 466f70fb1b10fd139582646285e587fb38a9ff2c
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
