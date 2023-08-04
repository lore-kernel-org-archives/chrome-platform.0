Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A431101
	for <chrome-platform@lists.linux.dev>; Fri,  4 Aug 2023 03:06:12 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-686ba29ccb1so1128586b3a.1
        for <chrome-platform@lists.linux.dev>; Thu, 03 Aug 2023 20:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1691118372; x=1691723172;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rM3a0omuzCHpSzXi1EXDMpL83g2DxidOibwy6TKzQgw=;
        b=gBc7F91G07tuWQ2GwitWv5MBibwL1EW0g/uxnmIPfQ3UnaHqeoECorGh0Q0y+Q65xk
         z99cb4aCyR0n6a83pcMbr2fWPgSkOkMzeFlmeMLAv7HvXjmpCfixlG+Up7jTLZ4ep4YO
         iMy4rUKO1WnqAUCxHO5jMMJhRLXIa6yhqUXhunuC4gdUf+0TRG1j+D0EMeAoLjMsDIAx
         xR0hacBKMRYSq/Iq6dC54DTbPpYM49ZyS571/Ztd0jvUp/jWMK+cigLDB8quauRUeDko
         udfwdTFul4XqimGFgUc2hQnPkaPrkrBlVxfwFcMujaGwvh1ZOQdcMyEqyFhhX7Mefs31
         Mqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691118372; x=1691723172;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rM3a0omuzCHpSzXi1EXDMpL83g2DxidOibwy6TKzQgw=;
        b=ZzdKTSBzzh6K7FLYcj1MC+nCMxy6OILOq81fxrJ/71SvUuR3xCu40Sg6wAo8DWskN7
         gBNE9tahrZComDQIS2dLXOyJpvQsWwe2tTFv/7s5UI7r3Rc0Sew4w1CUnowHBrbVWJ6M
         kw/5fJILG4iYIhKPuSXlCe2Qs2PQXgoivEb2cYB563N2kHAJPM5E66YK5rPmBpLUBron
         u7VP7nOEBROGzBjQjx42SrDWL38evuDR+oOUN7B9mS6wVnCZ8qGd6MY9lNLHriJ3cRmb
         asp9DKFMTyjIXGeMZVjoZnNQ1zKNLK9480bHF0IAPeqzgUZTL7cBAUEseju2iAp1Sgx3
         bxtA==
X-Gm-Message-State: AOJu0YzDAWk+oGG4DG0stPHNj5s2qIMXXPYDqk+LwFIOv4MgV2NZ0PoQ
	AmhTb2mINlulXlM/hO294b/ELw==
X-Google-Smtp-Source: AGHT+IGBzr2mij5rwzdZfD2Z7LMnAu/g1xT6QGMhQZebFCaPojbud8DJYiKKD5XicHCR6zeZaizq2g==
X-Received: by 2002:a05:6a20:7620:b0:13f:b3b4:1986 with SMTP id m32-20020a056a20762000b0013fb3b41986mr472864pze.12.1691118371751;
        Thu, 03 Aug 2023 20:06:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id i3-20020aa787c3000000b00682d79199e7sm512887pfo.200.2023.08.03.20.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 20:06:11 -0700 (PDT)
Message-ID: <64cc6b23.a70a0220.e27dc.1a11@mx.google.com>
Date: Thu, 03 Aug 2023 20:06:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.5-rc1
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed,
 6 warnings (v6.5-rc1)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed, 6 warning=
s (v6.5-rc1)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.5-rc1/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.5-rc1
Git Commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
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

    5    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    5    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    5    vmlinux.o: warning: objtool: .altinstr_replacement+0x178b: redunda=
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
