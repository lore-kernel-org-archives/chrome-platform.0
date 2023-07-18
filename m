Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A2C10EA
	for <chrome-platform@lists.linux.dev>; Tue, 18 Jul 2023 08:12:08 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-666eec46206so5501390b3a.3
        for <chrome-platform@lists.linux.dev>; Tue, 18 Jul 2023 01:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1689667928; x=1692259928;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgvRPBPcOXHa1MhJppMcQk4RcztMbB5n3PFWcUO1caQ=;
        b=mDUVnrc8Dz8fxjKNjmCIEWQKtNDZlkr6fLrg650fjrpqA5RbS/x2V3abgTxp41B8Xq
         sgFjUYtNBScnkcVMJGBobgwgvXZoIJmL8athkd1LOe+NuOR+RdOIZoIXjR7vVjD+DYJl
         XvM0B+RVTCiEcnBf94kEtH3AWgeReTm10oqRepYIaWyv2+V3s80B5E3x0Fm4/gPl9SNZ
         JhBv3CBeCYCKX/I/V6Jf3r0U0iQJYfNO+uw76tMZVCgKfNP+1ELUziJ5/dWsrjrh0Fdu
         2Ie9iV45IJ8D1POYNQv2Naslu+hUhj0U59338MaywhO16hV4RHDwwfLbx2/Zctk5PKv/
         0Hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689667928; x=1692259928;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZgvRPBPcOXHa1MhJppMcQk4RcztMbB5n3PFWcUO1caQ=;
        b=T6B8l5/363XwyrGzeirvKbEW20dOJgDMdY/NL2d3u2P13vnqSBwhji8XSrLAQZQzbp
         zVaOOYkMuBfJxVBDETg4hh5x3C4UK6J964DeOc62wQ6ffjrfQjDVUskaUpchS+oLBpz9
         SdEKNJFJ/S+FJR+Np8l4enyTxOxh6YuLRxoyi9zIaq7m+XUXF8a3FQVirJLd4b+KQJqB
         MNWjlI4t5+F4PrBfk1EGVb2NNaNhuMhoc04PcJw/VkF4YjnzlAv3t8N8/kd6lXqSrkzM
         e505yt/0zGTK1doBS54fPQlwg9SOvJD2/EX/GDMcJYnjRvu45arFxXM+Q2Bd5V/QVhZR
         0R5w==
X-Gm-Message-State: ABy/qLbsoenreODhUMMKQnS4IyE26zfcbJlXXxaf48RdtQE9P5sA4mlF
	8dIdRkLUsi7NMyHEJaYDtt+dyQ==
X-Google-Smtp-Source: APBJJlF8csvLZl+VCijHXLCLobMvWtDRPDO7E4I8d33Y5dv84hohBVuefk8/e8eJ7OyjRIALjaxYHg==
X-Received: by 2002:a05:6a00:148b:b0:681:50fd:2b98 with SMTP id v11-20020a056a00148b00b0068150fd2b98mr21572399pfu.31.1689667928509;
        Tue, 18 Jul 2023 01:12:08 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id j13-20020a62b60d000000b0063d44634d8csm982577pff.71.2023.07.18.01.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 01:12:08 -0700 (PDT)
Message-ID: <64b64958.620a0220.ffa6c.23a1@mx.google.com>
Date: Tue, 18 Jul 2023 01:12:08 -0700 (PDT)
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
X-Kernelci-Kernel: v6.5-rc1-1-ga6edd5f5d9cc
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed,
 6 warnings (v6.5-rc1-1-ga6edd5f5d9cc)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed, 6 warning=
s (v6.5-rc1-1-ga6edd5f5d9cc)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.5-rc1-1-ga6edd5f5d9cc/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.5-rc1-1-ga6edd5f5d9cc
Git Commit: a6edd5f5d9cc4ae3bc9f77123d1bd7ebac38bb9a
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
