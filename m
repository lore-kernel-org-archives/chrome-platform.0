Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69316171AE
	for <chrome-platform@lists.linux.dev>; Mon,  8 May 2023 12:00:59 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-24e4e23f378so3118876a91.3
        for <chrome-platform@lists.linux.dev>; Mon, 08 May 2023 05:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683547259; x=1686139259;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=baVbUBtqX8kxHi6LyRnaXVgkqPRbv4/YuJJqY3QgxKk=;
        b=zGwQiYylelosrHw5TNVHGoE9RRON9G5HSvYzleRMkY+kFO14wQ8Q7GfaRPVfFWVRcp
         HXzdDaFuHEgNVOGRrCC1dH0hFVkj93u2lRr1SFhB125K0cUNJlJ1czXJtwS04buv7sL0
         Jmg9coWFqjH8fq9NyOVs32WQ4gzR7yMeiCco5lZaubshcHa9ptczERPWTj+MkRd5PNK8
         RageivMYszTB5X7YWLOYaHG/dEj2yzglIeZ1qXaugZmhIXVdE7AAFP49l0tXxr5YxlUA
         S5OT3Enc7PYRpy2/eCkZFwuvvCBz40MidY54AZBM4645Hne5iVNqIwts1IHVZo/gACCZ
         QHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683547259; x=1686139259;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=baVbUBtqX8kxHi6LyRnaXVgkqPRbv4/YuJJqY3QgxKk=;
        b=EBKP9lScccQ+d/YRege6BAKOqfch8HQysexyeEVLbYd4y0P5TLEmT2mEHIXLh7n0Jz
         +E/nha8nKK77aVmx32hpMh/zddN5a5GEM55q6x17VL4O3Wf9C4oVtdF5UGYc+CL2kaA1
         yZ6Tg28vpBobD9ugKPysh8rX3EpiDWtCN6vzVAOdf1/V6yCOxd0lU3MguWFj6rz7pdYq
         les/gEGiEk1yIHF/ZIqgcEakGoNyZovVq5PFbTt+N+sdvyCNnABOnAhCUs8PPE0NNAKL
         N13VcNkqAopvQTPNu8wuRN3QkMTI594PPSAQwvolJpsu7tNU8E1ajxUE7+mIm/lRhQfu
         prAg==
X-Gm-Message-State: AC+VfDxgpVXwbUA9OyIGmTyBC8dtO7nuZFjP1adB1Xe0ZFlwHFkUA20O
	8BlOr9Cn9HD25LQmFfmakKlb1A==
X-Google-Smtp-Source: ACHHUZ7VDn+oN1gCEUM3obgYAWJaTOmHisgzeKcufwfcRd8YbMsmlOgrJPdh9QcfdX74uuQsYyQibg==
X-Received: by 2002:a17:90b:3910:b0:250:2ad4:b459 with SMTP id ob16-20020a17090b391000b002502ad4b459mr10016355pjb.39.1683547258768;
        Mon, 08 May 2023 05:00:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id cq2-20020a17090af98200b002508f0ac3edsm1520877pjb.53.2023.05.08.05.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 05:00:58 -0700 (PDT)
Message-ID: <6458e47a.170a0220.53ae8.2575@mx.google.com>
Date: Mon, 08 May 2023 05:00:58 -0700 (PDT)
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
X-Kernelci-Kernel: v6.4-rc1
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed,
 6 warnings (v6.4-rc1)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed, 6 warning=
s (v6.4-rc1)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.4-rc1/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.4-rc1
Git Commit: ac9a78681b921877518763ba0e89202254349d1b
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/li=
nux.git
Built: 3 unique architectures

Warnings Detected:

arm64:

arm:

x86_64:
    x86_64_defconfig (gcc-10): 3 warnings
    x86_64_defconfig+x86-chromebook (gcc-10): 3 warnings


Warnings summary:

    2    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    2    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    2    vmlinux.o: warning: objtool: .altinstr_replacement+0x17a8: redunda=
nt UACCESS disable

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
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x17a8: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, =
3 warnings, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x17a8: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---
For more info write to <info@kernelci.org>
