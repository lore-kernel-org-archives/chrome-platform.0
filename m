Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0157C
	for <chrome-platform@lists.linux.dev>; Mon, 29 May 2023 02:05:25 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-64d2ca9ef0cso1864305b3a.1
        for <chrome-platform@lists.linux.dev>; Sun, 28 May 2023 19:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685325925; x=1687917925;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GGGhXlQ2pMpD3Rx8DqU39f9YEOhKk8C4dxp2JiB9UCs=;
        b=2uGNj5Cz9PrTrvoN2bpRjSY7DpotNI6QekIV3SOw6zM/Wpw8nB3u+CkzGbk+4aXv6K
         au3CBs/8XVlw3Gho/+ggWo+h9YWsaP4nwF3IKdUhxJiC+HCIBj6W3+eqftJCuGtZIauM
         pw9PoTj109Tvb837Vrbos+ATZUMh70KvOEuVT0lWfY2o9+jzgxVGzOFVJ3Fgfi9TOXUa
         qoHyLznIlo24rJMvRMKgwH6ak3hOcqJ8VEpNzU256empwfRtYJBv2oBDKWiyHZFjy1K4
         u4dbCo6dGVa32uJsKqocPWt6w7qGZwRiT3gyxpvu7NWfwWkpkEusNK7hOdjLy/cHQagq
         GGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685325925; x=1687917925;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGGhXlQ2pMpD3Rx8DqU39f9YEOhKk8C4dxp2JiB9UCs=;
        b=C1qM3AFkbxI/0Wh+pMvl5vU7taSh+nasX/TTkEprco2MHiKqoSW+s6yZCxMgZ+TQ+1
         b1SpbM2PgyfXrzwFyBVqagRoz21dVUd0f0Q1BE7UhK58qxaJVQ9G+UBBNAtYUP3wTYoC
         EcmS13oVl/pks1fPFRMqUPUjeD382EtSMwXEMzkv0VlEg7wP7d8syVMNN9cE3AKMMImC
         FR9m2DMJ5u+XN6KF4OuVqKCgeH7UlTOqTuhCyhPvq/sigkxvyd49cBWMfHaNutWLRnUP
         f8MUarQoLQ9wRJESLjDcrTMpZJ7oAKuOTKQiFW0HonMBB5O8J8I8UxiFI1rq6bS0ygUZ
         2Vzg==
X-Gm-Message-State: AC+VfDx8YOecmKUvEDqIQdW27JQ3/myNL6IscQFT+5Kli0vmmQCb46of
	yRKduDesUk3WXCRI0htbTCVWOJ8SWyZ2rvOTys7V9w==
X-Google-Smtp-Source: ACHHUZ610ZyF9Kxdak7XUturKWEoPqT9gi/GzTkQHDZrBWULb85XjLS5b6HbYNQrpa1uVns51ctZjw==
X-Received: by 2002:a05:6a21:3399:b0:10f:c81d:f18a with SMTP id yy25-20020a056a21339900b0010fc81df18amr7359736pzb.49.1685325925484;
        Sun, 28 May 2023 19:05:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w18-20020a63d752000000b0053f5ff753e2sm2876233pgi.23.2023.05.28.19.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 19:05:24 -0700 (PDT)
Message-ID: <64740864.630a0220.f9d33.4b4d@mx.google.com>
Date: Sun, 28 May 2023 19:05:24 -0700 (PDT)
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
X-Kernelci-Kernel: v6.4-rc1-4-gf5bb4e381290
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed,
 6 warnings (v6.4-rc1-4-gf5bb4e381290)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed, 6 warning=
s (v6.4-rc1-4-gf5bb4e381290)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.4-rc1-4-gf5bb4e381290/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.4-rc1-4-gf5bb4e381290
Git Commit: f5bb4e381290883a014a9e865ee2c430447ef953
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
