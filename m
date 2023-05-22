Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0D7A2C
	for <chrome-platform@lists.linux.dev>; Mon, 22 May 2023 03:09:20 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-64d2ca9ef0cso2324713b3a.1
        for <chrome-platform@lists.linux.dev>; Sun, 21 May 2023 20:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1684724960; x=1687316960;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SB0Q4w0wy4ge5bgOqIFHIXYAGhpWXM8wx2qNlzUBjYs=;
        b=GBh3PMQTnz3oCtrzXRo6fUlqQX9odsVhum3RbIXfv+4/oRP+ZzoxQZxxec3I+ut8l2
         m9heAfuI2kBnnf5XY/iXWqTkhI5LDOK8YD9mZWc4fAqsMvptmaodjbd2kXyb0nWlF7W/
         8dIlPCtxPssrxzwMbRFFWZ3gLdYBZ9MlgAPritm01LKPHIoq+b86KD62HETkAgjcNyfz
         CUCf9qF0IIxAyk1uzJga+JwWbbQF9z9yXjXApRuZfQe7czllxkNI04Rvk0Mx1i/mLWUB
         q3gBz9R/LyDTca5tB+aP0Ypgr7ACXhf0VClNb+5f9F+A0RwyVztLuCI0fVyou0glKoui
         xTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684724960; x=1687316960;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SB0Q4w0wy4ge5bgOqIFHIXYAGhpWXM8wx2qNlzUBjYs=;
        b=hrLCA6RmW3gflqGVEMo7DMBT9elf8N7scKrObEq1Elv3kVyR3gCvu44Qofbk1REXJj
         ISepCk2MZaQqbSgXbjRrX+NPky8rsGmVZsdZlkMlVKpPDx0CbylvzLjD1BtV/q3vC7fi
         TONPuUxyQQQ4a925tpvSEVyXBMMxJDzSq8QxssReiRmEo9xcnD/fXcIskorKXUhm6tXu
         MgJmgmUAfUTVJc+TET7HvZrgqiDUK5CDfqQuK3HAtcuylcAfD42TThXd4NDWPUjs4f6l
         4x+3OlDFkzeFMsI0qWu8HJtAtJTHg5rASDBYfhouyaXoTkmZmKAENZE8nTNRwQ3xkdR2
         kgJA==
X-Gm-Message-State: AC+VfDy2I4L8eH7kbZzU5Vf3Ennze8YUFXT9QTh5XHcic3h6DFNamJIo
	2Iwwl/bqxqdzEtr1NvL4YcDyyA==
X-Google-Smtp-Source: ACHHUZ6ObVckcApdeS2X/rFIem7Mk150uNnU4FSKj9EScdXuDRn8gja4bki7A43HS6vNxcJXGFRG0A==
X-Received: by 2002:a05:6a20:2d1f:b0:103:4c5d:667a with SMTP id g31-20020a056a202d1f00b001034c5d667amr8918990pzl.4.1684724960360;
        Sun, 21 May 2023 20:09:20 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q19-20020a63cc53000000b0052c9d1533b6sm3380142pgi.56.2023.05.21.20.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 20:09:19 -0700 (PDT)
Message-ID: <646adcdf.630a0220.ec2c1.517b@mx.google.com>
Date: Sun, 21 May 2023 20:09:19 -0700 (PDT)
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
X-Kernelci-Kernel: v6.4-rc1-3-g4b9abbc132b86
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed,
 6 warnings (v6.4-rc1-3-g4b9abbc132b86)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed, 6 warning=
s (v6.4-rc1-3-g4b9abbc132b86)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.4-rc1-3-g4b9abbc132b86/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.4-rc1-3-g4b9abbc132b86
Git Commit: 4b9abbc132b86e2ce65090798186836f48f33382
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
