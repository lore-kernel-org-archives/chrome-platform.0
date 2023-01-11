Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E7FB457
	for <chrome-platform@lists.linux.dev>; Wed, 11 Jan 2023 06:02:11 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id m7-20020a17090a730700b00225ebb9cd01so18880946pjk.3
        for <chrome-platform@lists.linux.dev>; Tue, 10 Jan 2023 22:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LatwSzwBxXQVu1L2DX16bMk4cg7F4vl8NBfyGBcAcEA=;
        b=ZJ4ofzO/74ynCx3KqtkjQuriRWnmZc2GnO0MIQ4+dNRbH4NZ2eGIW0s/4s1nojF+rI
         c3s52f5E4IUfF1l/sKufdGDn+8cjC88VjSsmSUIMJK0xngyw/3poyBc7fAtGEA0GPGFy
         0w8qGrtHGDP/O3SHM4gW3ZlSHwH84yxvWvcEztQiF+i8wDzyzhFOH/I44d+D4+uIOx6e
         bRqUgNN3M8HWuebTczuJp/tAVAGFEVaLT7u653W8r+izAdZ4LAxNCR31pJ04t/FhUt+m
         B+OzGcdbgDGEaVf54pOIUtgNI63n2agsXFYMcp8onByLQdHAO34P02mX+MWTIAdx+TkB
         lY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LatwSzwBxXQVu1L2DX16bMk4cg7F4vl8NBfyGBcAcEA=;
        b=sqd34/smXikGoqvKD/zVdblmOxlUECujBNzoOcR/R1IwLgcTiQzbLFnJsx8SCww8E0
         7sO/vizsCrcTFlUXJUJYhxScIS4/cTrcrlAQHuHuFe/ot97F8mHdsvGchcVf7/d7Kq7c
         IdD5BIYpz5q5+vX4DbjKI7CqtFgCn0E8R9rasdD6p4I7ob0FFYRKiV0uSCnr4kk15hmA
         TlOwWJNzDgkzXqUO948nMutdEinpRN7Oll9BC6C4WKtg1XBv12vD8NoF7IWwYMEi7GZ6
         DITGHynqDN87L7/sRokS34piDADbF85l21r/r0HQEzo0RSU3tkZwzVg4PAkYgT7hMx1U
         Rvcg==
X-Gm-Message-State: AFqh2koDJr2iddXE0FaBoklF/X44eulx2DsnaIqjq8YZ3n5zwcQbzT1h
	zeNRWuEfa8d/hWwyHLeuWttAU5xKnALHjxW8SMmT7A==
X-Google-Smtp-Source: AMrXdXtg8hQvDpFzx5599mVb/U+XR8byBniwaG/HPgzUvCs9p5QJNN3Be/Woo1CrlALcnm0vzkfIeA==
X-Received: by 2002:a17:90a:e2cc:b0:227:13b4:6f27 with SMTP id fr12-20020a17090ae2cc00b0022713b46f27mr1269553pjb.38.1673416931095;
        Tue, 10 Jan 2023 22:02:11 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p2-20020a17090a284200b0021952b5e9bcsm9962432pjf.53.2023.01.10.22.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 22:02:10 -0800 (PST)
Message-ID: <63be50e2.170a0220.7a17a.0b79@mx.google.com>
Date: Tue, 10 Jan 2023 22:02:10 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.2-rc1-23-g93899a4cb7b1
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.2-rc1-23-g93899a4cb7b1)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.2-rc1-=
23-g93899a4cb7b1)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.2-rc1-23-g93899a4cb7b1/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.2-rc1-23-g93899a4cb7b1
Git Commit: 93899a4cb7b1f587d89db47dd6553c816a98564a
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
