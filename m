Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC37B2415C
	for <chrome-platform@lists.linux.dev>; Tue, 13 Jun 2023 09:27:23 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1b3b974fffeso17997875ad.1
        for <chrome-platform@lists.linux.dev>; Tue, 13 Jun 2023 02:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686648443; x=1689240443;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e7mL4VdOQ35w8NEmtvFCI1Jaua6TqRWmz0qbXZ6mteo=;
        b=LqDUGINpg3lO/eUz1J4e4CC4ODx7SmDolusAVTDjVg9ANIwtlQ8KFH+UWR3QKdy1zF
         r3UCfm3YYVTq/tSfn1DpLhfHtPXwlVYLQi3cpwRABYWUYGbgb9WhJ5Ee7f6Dttemg1x0
         Zn2HuLC+oHDvHcmmJe/siVtoGdqWzU95sUNRTMcT3Fgjy4YfQ4cebZc2JyAWJK4dsmXy
         tde1JguDZQBr22wSv66xAQo4vtXY3gbv8ISXoW9RbQejacvS7CiCFWr0CCuXLv+oDWMI
         UbQlM1785lluuoatenKSlqVfmvCG+fB1vR8ylu77VlcvXoic++NQrAuIgRTCmO7EtT8v
         h6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686648443; x=1689240443;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e7mL4VdOQ35w8NEmtvFCI1Jaua6TqRWmz0qbXZ6mteo=;
        b=dG2Ea9WZ9oGLCQQ8WCGcGMO4RVMUS2aWIYlbHbVuWhBgy53RDv/tah9uzoCC+SKM9g
         Rd/4Jh+QFPRcbhhaeJOn/pa5HjoX2gDm5fwXEoogiqjvZ+lIEigY5wbZxMVPmEoYRumZ
         3x/alZhYrerPx1Jp4WyqPeZ7dlLhLEwU+ybKiwIY3baGEm7uPlbdwRk/Qsx9cSEMlIVD
         sul+M8rMEn1Xckld7z+pIJu/eRCQV5nV7k2raGshXSFNOpqVlCR2gY38DNRWfwy8odGK
         /MHLQli4/RRN1P/zDfCht+qPAlpaQSe9xL8Vvh9+lXGNyqbBNQgvQ1slgRZUxhWkpKne
         T3sQ==
X-Gm-Message-State: AC+VfDxblE8EtzdaUddYseMLOasqosndQ9mwUJqnVNvgEZhFBZrvsLIK
	TWTVMrqjOf8ta92kaEEaNkYcLQ==
X-Google-Smtp-Source: ACHHUZ67al+3NVvzPdz5D29SuOqI8IelYA9wmdBqSi6ZW/zKxvWKNe9xvaJqZS26KCK0zHhGdPe0qw==
X-Received: by 2002:a17:902:930c:b0:1ab:19db:f2b with SMTP id bc12-20020a170902930c00b001ab19db0f2bmr8105633plb.36.1686648443155;
        Tue, 13 Jun 2023 02:27:23 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id t14-20020a1709028c8e00b001aaed55aff3sm9661286plo.137.2023.06.13.02.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 02:27:22 -0700 (PDT)
Message-ID: <6488367a.170a0220.55294.3563@mx.google.com>
Date: Tue, 13 Jun 2023 02:27:22 -0700 (PDT)
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
X-Kernelci-Kernel: v6.4-rc1-5-g2b8cc5858a07a
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed,
 6 warnings (v6.4-rc1-5-g2b8cc5858a07a)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed, 6 warning=
s (v6.4-rc1-5-g2b8cc5858a07a)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.4-rc1-5-g2b8cc5858a07a/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.4-rc1-5-g2b8cc5858a07a
Git Commit: 2b8cc5858a07ab75ce98cae720e263e1c1b0d1d9
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
