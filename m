Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA5518AF0
	for <chrome-platform@lists.linux.dev>; Mon, 31 Jul 2023 13:52:30 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1bb81809ca8so35801905ad.3
        for <chrome-platform@lists.linux.dev>; Mon, 31 Jul 2023 06:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1690811549; x=1691416349;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9QKXQVwU1kjMDjk/oTOqO2n56gTaM2G1CIEVSW/NuUk=;
        b=FILSxIMN+DqnDxAXGejMIaUUZiAFiPi4Jl+/F29yBg0KMhvCGNCGe5toTj01m0Riec
         7oEk6DgBEKQOWUEHPzNJzT5zb5LAtW9XHNLvb0MpwsKNvekM0qCuhsHpb49Oxe7YX4J8
         988ip3bP8l6xiFUzPVr0LZinfXEba3B3/zIHjedjpNSqO6i2rQTt9yh8hilPG9pWFR8v
         XTU6khOm79lAEkr7rLX8kBKrzQd1wCjm3J/h7uBykdsOj/wKP5FAATtCnkAt7pEc5EPf
         Tm3McpgUdmoXMXWnEC1EIq+GYWGuWeTuGykci1pNELygV3t3qZmwiZwxVdqnqAqtP/2m
         q96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690811549; x=1691416349;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9QKXQVwU1kjMDjk/oTOqO2n56gTaM2G1CIEVSW/NuUk=;
        b=eIFPSx8REm/2tuBLrD10YNpYNcs+7ZPubl91h4ud16uc14gxTR0XyDJ8QU2UYAGWpC
         iH5he+dr3n6rrn8Hi7B+YtFu+KFpRz5xVWUjJO1qG11yDC8LiMlBJ7D1zgoAl2W2+HRb
         PcTzW7W110UJuCOqYIzeHuZ2ORL+ofVbNu8N+4Wa8Z3Es4gfR4j4BFPvdC5v1u6RTrSM
         DKOj8r6RBukno44Fhhs12s6qOTXXVIRB+5D1iYxLfNe6ow9MLPTFotw4Zh7SKltlTGe+
         Ka/wzxgRs667UBLsptZWQROC6gN9GjhgOfvg/K2Eewz4+v28BZgVrJsctNhTMVdlAuET
         0yXA==
X-Gm-Message-State: ABy/qLaeppsMb64Ybr9LcpKyz39R/4hSqn2lCBfRoywTD44LLtaXcNwi
	mwg7vsjz/XA1gHV7IHAVRmWWRQ==
X-Google-Smtp-Source: APBJJlE7IDwM4NevdTL5SnYWUWPWQkOX3YGRbXdKImMqDwjzUlbmNFqoLAp7k+p7OoDCxvJPcJbRGA==
X-Received: by 2002:a17:902:eccc:b0:1b8:1335:b775 with SMTP id a12-20020a170902eccc00b001b81335b775mr13019234plh.0.1690811549668;
        Mon, 31 Jul 2023 06:52:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id e21-20020a170902d39500b001a9b29b6759sm8633537pld.183.2023.07.31.06.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 06:52:28 -0700 (PDT)
Message-ID: <64c7bc9c.170a0220.cefd6.fdc5@mx.google.com>
Date: Mon, 31 Jul 2023 06:52:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-firmware-kernelci
X-Kernelci-Kernel: v6.5-rc1-1-g0979e7e3cfd7
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-firmware-kernelci build: 5 builds: 0 failed,
 5 passed, 6 warnings (v6.5-rc1-1-g0979e7e3cfd7)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-firmware-kernelci build: 5 builds: 0 failed, 5 passed, =
6 warnings (v6.5-rc1-1-g0979e7e3cfd7)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-f=
irmware-kernelci/kernel/v6.5-rc1-1-g0979e7e3cfd7/

Tree: chrome-platform
Branch: for-firmware-kernelci
Git Describe: v6.5-rc1-1-g0979e7e3cfd7
Git Commit: 0979e7e3cfd7b479c34dc0f7217beb0c30f8028a
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
