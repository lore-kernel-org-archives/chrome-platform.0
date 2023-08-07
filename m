Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56ACFA41
	for <chrome-platform@lists.linux.dev>; Mon,  7 Aug 2023 04:06:02 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-68783004143so2744297b3a.2
        for <chrome-platform@lists.linux.dev>; Sun, 06 Aug 2023 21:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1691381161; x=1691985961;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XefFv3B4vJROes7BqPmi+9sk12geo+5rT+WI+Q41gEo=;
        b=0FdImuylN7ApCAHxkjIN1z6GnpyhGew+ReohHu+k4n7VMdWXlUfct3IScorbe5ZkZb
         JI+Z/krtx0VBQXgGcBxdplqTmleLYS5zvN6zp+TsaqTwWVhTQDWu7yFmLTtLkYHceoeN
         7NYkpuOst8+7Xyz+TljKnQsWzRoOfaU+RkleOSepvIdJ/Nq70pYw3y2ZLaOCKssGj3XF
         GzbvzfzcRanoFIDdbO/ndmHRYnyHS1h2gm9qhALUzDSIxg29IvX6/mXPGaGYuFTX8tzm
         sEsn0o4K6AGHx52SwNJjw4C8V4+v6QkHAB3xmQ+PjC1hG5wD68mfKz6/DiTY43Hqgdb3
         cu1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691381161; x=1691985961;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XefFv3B4vJROes7BqPmi+9sk12geo+5rT+WI+Q41gEo=;
        b=WHVgRACZQ4zXD4d39xhG5PkXcx+9JevApAgN2317m3TqPAvyoE7xRwsRBwVy0dVIrB
         FUX05ozme4zO87PVD7gnA4P+TVj1igTfqRype1xgqaUulDdnirdvGyOZT3dSN1dvjWlY
         DUyyOUNOn7HHHKpM42oHpaivPcZ65yWEqYdbDaeT0OhslxOwS8MPKGsJK2Pdm+mXi0rs
         +5ICPik9z4mprHCgHshp2D2Qy2yoW8fHaqrGDuJx8zBNsR4W/j6qLyfMeZ5tg39kHpwV
         qJyXJK33YNhMHIvMuTOZwL4P92G35LLKeroV/HypcofiQNdlarC77xaHIoryUuONFUtr
         8wRA==
X-Gm-Message-State: AOJu0Yw8k4qA9/bDdAb2jb13yopcf3hzR88epDNlMfjwl7e1o+nzHc0J
	JQrJ//sshdOhUVTe4OP70jCY2w==
X-Google-Smtp-Source: AGHT+IFp295XTUy4LcSXwIqS/vMVQki7n7rlyJFqMWK3tPGymo1eE8V+bBizmipSBcS0ve7SmoqJpA==
X-Received: by 2002:a05:6a20:1053:b0:115:5ed5:34d3 with SMTP id gt19-20020a056a20105300b001155ed534d3mr6977777pzc.20.1691381161541;
        Sun, 06 Aug 2023 21:06:01 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id e11-20020a17090301cb00b001b9df8f2907sm5621123plh.264.2023.08.06.21.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 21:06:00 -0700 (PDT)
Message-ID: <64d06da8.170a0220.51187.9e59@mx.google.com>
Date: Sun, 06 Aug 2023 21:06:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.5-rc1-3-g703e77134ebf7
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed,
 6 warnings (v6.5-rc1-3-g703e77134ebf7)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed, 6 warning=
s (v6.5-rc1-3-g703e77134ebf7)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.5-rc1-3-g703e77134ebf7/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.5-rc1-3-g703e77134ebf7
Git Commit: 703e77134ebf7d99acbd0f85f7c94cfb408f4bd0
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
