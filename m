Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5E417DB
	for <chrome-platform@lists.linux.dev>; Fri, 24 Mar 2023 04:07:32 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id e15-20020a17090ac20f00b0023d1b009f52so3926126pjt.2
        for <chrome-platform@lists.linux.dev>; Thu, 23 Mar 2023 21:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1679630852;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PWFEUbM0/FD4jPttt24xbMjpZUtZiyHn+yXth5anFdw=;
        b=6kZQTuAFOi/+8giidb8oPsUbOqRL1AqEN5rdXEwXGYL8v5BPY5ptYO0NUbGScOXIFm
         8WPBn1CeBvfGAW+4O11jRDLcoy4tYcmTAmyMhtzBg3R/T8v4q8dFdZzOjlYeup1Glb5k
         EeQtMpUqncENdrEg97lbuWfoYjlIFUUJy8hwE44N0Hl/OJ0fi8Y4ZmxArTTZ+PqOvbOB
         qB4wvpyzymXborqStAi7BJ6RbyElh8fkhV0WwtUaqx4JHinInYERm9mQQP9dlZzth3Zt
         Ci9fM9Oz+tQv7tpqf350SVdSQHND1hBhu3nTKZO9nXnN94DxAmh/eYdgfj/jZqBl25Y7
         9hfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679630852;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PWFEUbM0/FD4jPttt24xbMjpZUtZiyHn+yXth5anFdw=;
        b=pPjUeUFDZUGH4yxV3O5CL7/9FLdFAYrSP6oXvL4pQ/jDhJQ5yXutjC8NkUUqf/hcvK
         Xq2JAN4w1SoY+1agQIXzPHMUwGEg4exHqx1862eQ9Q+RhbdxmvDqYKBXEMaw7tmTcrVx
         edtlA9iWc/QPDLtpG4Kp//G3zjRyK2mxZtZ4t2A08rfXyTBMwJgg96OWJVIzBIzmOTL8
         ji0y8LVK+HmSVwoR/rSTi8ba70n1Lbcimx3lg9mRUkZpm905P8/2KRTs78cnxb11z/0q
         o1GAsMbyoYcI5fT55br9CloP2MEJOC+yUa4bvPm+ctBE4Wr/YpJ0SQf1HDakLRFC+Bgt
         +MaA==
X-Gm-Message-State: AAQBX9cI7aIaZOWb8S9zbMRYgXhzvbQV0+v9yCH/7ZnNfltRA5hpMsVd
	W7+F2SV7TsjefqMFWhJUxpY/jw==
X-Google-Smtp-Source: AKy350Y1JZVafKqhxknLqmXlMjGvtFfmV8ZPkDCmy+m+VfOhrdp2MsFexDml5Wm50jZtTAvr80aMQQ==
X-Received: by 2002:a17:90a:4bca:b0:23d:2d91:ab71 with SMTP id u10-20020a17090a4bca00b0023d2d91ab71mr1586616pjl.6.1679630852199;
        Thu, 23 Mar 2023 21:07:32 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b1-20020a17090a800100b0023fd6615283sm2005344pjn.5.2023.03.23.21.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 21:07:31 -0700 (PDT)
Message-ID: <641d2203.170a0220.29525.3f73@mx.google.com>
Date: Thu, 23 Mar 2023 21:07:31 -0700 (PDT)
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
X-Kernelci-Kernel: v6.3-rc1-4-g9ce5f3b3c18e2
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.3-rc1-4-g9ce5f3b3c18e2)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.3-rc1-=
4-g9ce5f3b3c18e2)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.3-rc1-4-g9ce5f3b3c18e2/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.3-rc1-4-g9ce5f3b3c18e2
Git Commit: 9ce5f3b3c18e231aa58d4cf3f8a968e311d454de
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
