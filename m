Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDEDA4D
	for <chrome-platform@lists.linux.dev>; Thu, 10 Aug 2023 04:06:51 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-686f0d66652so424029b3a.2
        for <chrome-platform@lists.linux.dev>; Wed, 09 Aug 2023 21:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1691640411; x=1692245211;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Mo0TWalRGiGJEa3c0G+d9Ekoq1ikf6jE0BHLtXWVlUI=;
        b=KSFGI/mcqa2+85i6v5GUsbvV6O5bpj3xUvqL6z69aFA+l8v2lw09TeBtrs22PiPa8E
         SBVxSt0yev7miIO1UFOIH2lL6+Zl7EahNw6G5Ke1rKoNt6tXWD973/L8aMJrzn29NOeN
         vUXeQ+LIn0C+v8WRwdWmcTwXKJodNVVKuga2Mfb7IrALd0tdrbRfIxG13VAVUXmnq0Ny
         V7JMZE3Fz2v0viTGg1vIxsR//JR0oZOypjWh2HA1K0wEeQMyR5vV8SfiGJBxDSu+KAof
         N/ORo5HTtQcyJM4VBiTvaaQbCkwN/BpO1/+QuVc28g3/Y1ICpvxnLBM6nK4s68EEH6th
         Uv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691640411; x=1692245211;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mo0TWalRGiGJEa3c0G+d9Ekoq1ikf6jE0BHLtXWVlUI=;
        b=i0PaPg7nj4YJo+hsKIAc8TZW8AJppd2jUWN/r7vYldJt1ez0v3kebGOIZkcccyQtM/
         FvLQ0zFB5Um04DeodRIDGeVZRSNIkfHbG4304fI2TRLGVRzYi9YbS+eTRPxCOa727JqR
         t6ofl4pQW00953jQqx0OzmunvtbIOXns6h3o3pYE4cCczbLGzHrDQ8Q6SMMQXXkGnH65
         R+lrvT6cksMhwOpBMLmDzb7UaobBHaHPA7gcT+Obw8bt9NwsT3ea1YFWTd06pcaZ0Z1c
         2zBaUIRkzwHMAfhQvLbh+Nl4o1QabKfF6TV+tdcCwnmwoZNxQUbPfxCMpHKciF3chKXq
         OolA==
X-Gm-Message-State: AOJu0YybBofGZmUT431IlVVqC4btR+TSIDrwwMA0nabSZmhJMh/hhNcY
	QlnWGYAikSd4VjlPw20U7ruzVw==
X-Google-Smtp-Source: AGHT+IG3BqAtXBcVoN5HPSlyTBNWd9OUNIVX+jtdGaB9j1dj/H9c+Znq11Uk5lCLhv6m1ADzEj/uiQ==
X-Received: by 2002:a05:6a00:b4d:b0:687:8417:ab58 with SMTP id p13-20020a056a000b4d00b006878417ab58mr1623705pfo.32.1691640410703;
        Wed, 09 Aug 2023 21:06:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id x25-20020aa793b9000000b006833bcc95b0sm404509pff.115.2023.08.09.21.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 21:06:50 -0700 (PDT)
Message-ID: <64d4625a.a70a0220.dcf0d.0cf1@mx.google.com>
Date: Wed, 09 Aug 2023 21:06:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.5-rc1-4-g0820debb7d489
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed,
 6 warnings (v6.5-rc1-4-g0820debb7d489)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed, 6 warning=
s (v6.5-rc1-4-g0820debb7d489)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.5-rc1-4-g0820debb7d489/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.5-rc1-4-g0820debb7d489
Git Commit: 0820debb7d489e9eb1f68b7bb69e6ae210699b3f
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
    2    vmlinux.o: warning: objtool: .altinstr_replacement+0x178b: redunda=
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
    vmlinux.o: warning: objtool: .altinstr_replacement+0x178b: redundant UA=
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
    vmlinux.o: warning: objtool: .altinstr_replacement+0x178b: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---
For more info write to <info@kernelci.org>
