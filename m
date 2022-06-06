Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E19D1FC8
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 04:02:51 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id o6-20020a17090a0a0600b001e2c6566046so16850252pjo.0
        for <chrome-platform@lists.linux.dev>; Sun, 05 Jun 2022 21:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=s2UJPEFK9mdsn4lspIGftnjMCGr3AuI1BlQBXGGqBJc=;
        b=4ORIUmu/mwQfdQP+s/EwCkHQkyaVxhmIZ4grzm2D7iN4zDV1hgU3cSuppx42SXc6ex
         KK/UlCKoFL/GJysLgZMaPgg90KoMou2vgiCWEHnXzr4w/fUJusY3bY9LTisudqn5PrCS
         QjdEPl+K4AxxlSGo1sJXH916XaVgOOxfOtxOQloMjLAcKW038Naj/t6x8f2ac5wRwmpV
         IjfifkWPuTcO6nCiUo6YslfGX3HdnHaLiA0WChbmHbXDNMHuZfRtDvCLcWZxfyWY4HuK
         7du9r1/ByQtA7NxxllFgJteyh6zP6dqHGC2MOgv05hWtQRbbZGEofbdMIIGXo9DaHdYp
         prFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=s2UJPEFK9mdsn4lspIGftnjMCGr3AuI1BlQBXGGqBJc=;
        b=Nzs6/M58TTMe/j6TjdHPqkkze0vdPweUhyOCTwOVCxGo3434GOyFddclW1bT1HqeuB
         uK0PRH3MZN2But/LqFmUzQX0g3wat+bqHBGj1WkMk526qjOE2SLVkbxygm6PGurCC5uS
         83wkzWByvKjUuvsEEKRVo4FjPhvN6ITlgBLnZuOD53qX/6LHjmfn1UlwO7HezXSQWGcT
         4M7lYGb3c0zPJdVD4eWzzVWcj6mZf/JzPANGzKKxAQ7z/fm2yhin+49rIiTFVljBverf
         bNnpJkzOii5K8lSFbwjmuCxJ2b8WTSgHfIwz/LQkFj2W0vSYmYXKSEfmAK8+SlNrkai5
         QlzQ==
X-Gm-Message-State: AOAM532qTuNyRIKfcQ2YgxvBuup1h6wzgiCvxBjHriH+svj5byhTncQv
	XsdBu4tdfjxz1jjk4VErWFGQjA==
X-Google-Smtp-Source: ABdhPJzuxdi1N+qRhHjthbNVXrPA9mSLwKw8WHos6Y7XvAsvfLojVrmrSDydL4TtuNQCrkFR93TfQA==
X-Received: by 2002:a17:902:e80c:b0:163:d222:60b7 with SMTP id u12-20020a170902e80c00b00163d22260b7mr22585741plg.54.1654488170988;
        Sun, 05 Jun 2022 21:02:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z14-20020a170903018e00b0016368840c41sm9506392plg.14.2022.06.05.21.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 21:02:50 -0700 (PDT)
Message-ID: <629d7c6a.1c69fb81.b727e.56c4@mx.google.com>
Date: Sun, 05 Jun 2022 21:02:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.19-rc1-5-g4a0e708bb23fc
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v5.19-rc1-5-g4a0e708bb23fc)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v5.19-rc1=
-5-g4a0e708bb23fc)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v5.19-rc1-5-g4a0e708bb23fc/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v5.19-rc1-5-g4a0e708bb23fc
Git Commit: 4a0e708bb23fc2fd10c7320b40ab9af2cf619f5f
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
