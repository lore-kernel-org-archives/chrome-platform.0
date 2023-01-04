Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3CF7C
	for <chrome-platform@lists.linux.dev>; Wed,  4 Jan 2023 03:04:00 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso37751894pjt.0
        for <chrome-platform@lists.linux.dev>; Tue, 03 Jan 2023 19:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2tYdvqVyc9/SmHatF4Q9ywniP1ayZDMbJBJYnxvDU4s=;
        b=s7Y8C8cBOFVQC1NxuxuvfYoSdJZV8VFSH3XFGWNo5QZnMv81VoqP97WF5zF9PZqz9T
         otstY1nTZw0U5uQ62UcqMiisFJqhaJBtFUo17VtgFjtuzdaPGRk4v5q/shlAtX9sAq8G
         rxOwm3LYBCXVej0juwFDIgK1vc9/30ggI6kj1eGYp9vxvuN0Zwtw75YQdiKaIUzQAFgb
         B+yvXYLWIru6lqWnC2i2WyrXdl1bqNH9IUbJ+BXq14XssALV/CCmvHuihiSytS+84eCX
         cga13K9AnbNIi35YpiKxwwtbfXn5f3RUn+YWCzhFD9nQIMU55+lTLjNsX8iCQpPE7+rj
         Yfag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tYdvqVyc9/SmHatF4Q9ywniP1ayZDMbJBJYnxvDU4s=;
        b=xrZIBWEdmax1m9TyMt8BXkK/MnvwMD3dNh5TnZUFRIa4evHfVkUJuoTBYhI0dxqFd4
         ySenK9Pke3yvFG0SKLk8fUENiIyWzXooGXbvsfWw0nfS3wGtIaGF19ZzaN8i7OuWtpuQ
         JAnD8ZtLrW3HS5DaTJ+friQQEtcY+/Q3ee5ML4DDKbt67NF+F2c5JEHdym25tcbvHxD+
         oiStZl122dquTL2Xu/bMSEENtgbCUvLlxKN3oEezbDiXD7fEl3k26PtvTd7PT6Xp6WRR
         pGwK1zRTVlT3SM+NI730TzFmclo6Zkku4hw7uOnY5Ekj4MU9uJG+A1qbvaMNoDz9bojx
         RzNg==
X-Gm-Message-State: AFqh2kpoKtBUZJ/bQ6IMYemNo1GUfODlHEPhB2ceu0A1H3ViCT3lSgaU
	B6ag9u8KGqF2KejTQjCstl1JJw==
X-Google-Smtp-Source: AMrXdXtjS7oYivjQbLP5TOX2r3wI/RpyzwSL926qlkUWEvd4LxfkqohOKWY0G2R5AgSS+7kA0ODz6w==
X-Received: by 2002:a05:6a20:4660:b0:ad:79bb:a417 with SMTP id eb32-20020a056a20466000b000ad79bba417mr48155344pzb.9.1672801440228;
        Tue, 03 Jan 2023 19:04:00 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f3-20020a63e303000000b004790f514f15sm6748912pgh.22.2023.01.03.19.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 19:03:59 -0800 (PST)
Message-ID: <63b4ec9f.630a0220.9c7b0.994b@mx.google.com>
Date: Tue, 03 Jan 2023 19:03:59 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.2-rc1-8-gf9a0ae83af2e
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.2-rc1-8-gf9a0ae83af2e)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.2-rc1-=
8-gf9a0ae83af2e)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.2-rc1-8-gf9a0ae83af2e/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.2-rc1-8-gf9a0ae83af2e
Git Commit: f9a0ae83af2ee586e38850de121f25382427a23c
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
