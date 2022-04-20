Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679331867
	for <chrome-platform@lists.linux.dev>; Wed, 20 Apr 2022 17:29:12 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id j6so259068pfe.13
        for <chrome-platform@lists.linux.dev>; Wed, 20 Apr 2022 10:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=wMukHUUmk4Do2xc7tXQxlJQKUgm1Pk4DS1ziXa/QcWE=;
        b=c5fB95vnCrYZc61+6XKM6XoD1qnfDRXdABuRehhkfJ2sBtxecue9zk0R6FkShsaBem
         i+YJIRYQMGjZqqxVA7tygevDh9B+31Dy4Gop5egJbrPmZ4tplcGrzlXcV5qK9myBYjdg
         wkWcRBxrOFCh0BmmOBvdVDQsLj6PJmEs02FfEQ5vlTqHyZmw8XFxHNHTWjMRt/F3QTCF
         0CffCjC2EgJyPPtMnX1BBByUuuxU5AYWGmN3QDLf6rSD9P5D/oO8kpo6d6ED+QVk0CZ/
         aV0yjkecjtJAD0Eidwk3y75yP//7QhTbDSZokrazDC3C7ZHvmhatqG4DatpoADp2wCln
         T8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=wMukHUUmk4Do2xc7tXQxlJQKUgm1Pk4DS1ziXa/QcWE=;
        b=OaJgHjw8AZst9hdDXjN4JreD2CMg9qWFh7W5PLmhds2BPwN8dQ5H2TScbDT8FXO73U
         UtVW0yNdyQUusrgG5vNI68l4nr7kymaGLd+6tAOPfR3JH4peZEmFYrCCq1gllOOi0qTj
         r5YmZlxOc/UYMGTxUhGo0Xt0Vq2FVT10P602/419d+GnhbBhVKToQTkB3SfTp34i3ISZ
         blXUVw3L+xEUBhbcXiJcesIVEMMybJv0o808zMF4P2JGPoETktfOWeZhJ+Ada8Sao8bk
         4IW5sD2s6X33vo+badGx0K/oU63CZUrYc4EkWo+T9FzF160AJEGBcgeTCmG+v34diGVr
         JNNw==
X-Gm-Message-State: AOAM530yf333vbmhQ0ylegjhfM4OKAHZNMNnKV81lujClQsJ/PVw3xC+
	2tBxVf8gLEUQmxz1OtvTWBGoog==
X-Google-Smtp-Source: ABdhPJwUtCfYFYbmsXKD9/dpcAabTt1aHJz5fi/zsmF6MQK0C0aiZYuBm6UMYoKjrwinhha4YWbWOQ==
X-Received: by 2002:a05:6a00:2349:b0:4fa:934f:f6db with SMTP id j9-20020a056a00234900b004fa934ff6dbmr24332758pfj.44.1650475751792;
        Wed, 20 Apr 2022 10:29:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g15-20020aa7818f000000b00505ce2e4640sm20226439pfi.100.2022.04.20.10.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 10:29:11 -0700 (PDT)
Message-ID: <626042e7.1c69fb81.8048f.0441@mx.google.com>
Date: Wed, 20 Apr 2022 10:29:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Kernel: v5.18-rc1-8-gc881e7385cfa8
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 4 builds: 0 failed,
 4 passed (v5.18-rc1-8-gc881e7385cfa8)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 4 builds: 0 failed, 4 passed (v5.18-rc1=
-8-gc881e7385cfa8)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v5.18-rc1-8-gc881e7385cfa8/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v5.18-rc1-8-gc881e7385cfa8
Git Commit: c881e7385cfa84b27f1489446176aff8a9fb3e8c
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
