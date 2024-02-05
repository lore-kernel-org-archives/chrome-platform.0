Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC348F49
	for <chrome-platform@lists.linux.dev>; Mon,  5 Feb 2024 03:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707102556; cv=none; b=gF6hC/sMbM9oAG4bCez7Rv98bB7tbto8NA+exs6jccJEYukBaou5AyOM1n0d1hC7X3Xlaay4raAkazJ9NPfPw3j77KNXVUeMHGqd3q8KDXuG23uTgC8+cMhwzY7xbJFB7AE2SLx8BRMdA0T1Rv74Ds3Lbe0Usj3VF2HUeBnB3DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707102556; c=relaxed/simple;
	bh=aw0aDYcA99DH7FJ6n+ZjXSYZ19ljrTRLsJyAfNWHHGs=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=JfYA6dqVk8gjBKygwSxGmfkhVQ44W3Mb+YyFAm8wHw186Z37j0Azv5nEgTS3Tb1uMUKPufb83E1V2vtqToIcKlZ5JBei8Pz/Sb2cmplbhgpBBT4I7zQP690X1hQUWW00KQf9dzVHgt1Ry85j1QHmZoApECn31yoT10G4XngGZNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=V6E3Al/7; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="V6E3Al/7"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d70b0e521eso29940925ad.1
        for <chrome-platform@lists.linux.dev>; Sun, 04 Feb 2024 19:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707102554; x=1707707354; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6XenAS1Ewy0Iy/1iosXGcxG+HM9fBP999hzcgsXI3DQ=;
        b=V6E3Al/7OkPKaApURpFwPmRKNNl54Yp2q6eyWcBhuumShxTGk6e8NBGzazBcs00WIx
         qk8eodXv3DuqoGHrjjzWjfXMtnBbMRB8nk2KZiiN86mkHQTvAWiOiaPUYyW8j1ELxVcM
         6eMzZbhkNV81mKKeUFLYzFOnqXtzgYE5sXX3duJm1JTwMKv7QA1T9IZ9lBLlWoeCs3XO
         4Vuwm2+OMMSpK9p16bUSUOvhJL1hW0IpB8adCBsPE9CgiKkyexj1e6QG1laq/pcmj39a
         gFy1QIJI4IL/TbsijC3j7Vx/7p+/u5hWPp2pRBmeDmakXOTClis+BI8Fty/tOWF+h/uP
         zXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707102554; x=1707707354;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6XenAS1Ewy0Iy/1iosXGcxG+HM9fBP999hzcgsXI3DQ=;
        b=bibVbOjJMXpdTf/yt+87eyLWwFlaH1Gg2Mb9ckgPYX2yapb1EvmdlRn60nEel4uNOs
         ixiYQ9HGL1czVmePeO5AEjMMOjQjJJYXlutAvbq6KgPRDO9pMvK0EuMG1+qjQI5UgNJJ
         Nvg5lq0jI1uGltO2CKc1kgEehY8eAWD3Wh468qq37sAPvbXLNPMMxajkRFuFEJ8UwtkR
         GOKDCA3Etq+FkBU74t12ksoyKeD3AxtTNSAGfjCr6nNr+KGErG0xR8ipClQ5MRvdn7sf
         cGS21seaZYnbm3jcAHBuHLsvHI56uARFPEPhMnd9J7kfWANIZN3s3rbECFTBJCITv9AY
         PXwg==
X-Gm-Message-State: AOJu0YztrwS0nhJT7QXCzGpXzdnXmBDVe6q2mKZqbZZeqy8WiWn8H2YY
	XMxyL5oOVL3ntNT00j0lsOVZYK9mIQTbxDgoah+g7nCF0tZNIBkb/ojabq14/Pg=
X-Google-Smtp-Source: AGHT+IGINk9Fr2wFHolF9foshja2192bk1hlpprcveHZ/P6iick0ZoZMuupJWHb6dwcnmhgWJ7YrIQ==
X-Received: by 2002:a17:902:c404:b0:1d9:6d99:10c9 with SMTP id k4-20020a170902c40400b001d96d9910c9mr12804219plk.44.1707102554174;
        Sun, 04 Feb 2024 19:09:14 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXlZ0IBVFResPdoDM8HLTvfk1ATPVhlMJI+oh7Ast38N9WETovTMB0tD6sYYkjUmaV49FizblH5olRSyvmS+S50mljbKOxhsixVZIBvbZ03lfL0AEPtKF+e/eG37vdPLXuWBPtxmdfBExr46LewWfe/WR3uPDVS3sjoRpJT13xfWttBSJ9i7B0vFCpzEglUgMZmGmp0xa9MrAMPFuvgr1+Mnm+74dYW5fMAm4eOBmwPIzz+sGJVpMysclJu7sD5/9o=
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id y9-20020a170902b48900b001d73228cd88sm5170660plr.255.2024.02.04.19.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 19:09:13 -0800 (PST)
Message-ID: <65c05159.170a0220.80ebd.16d4@mx.google.com>
Date: Sun, 04 Feb 2024 19:09:13 -0800 (PST)
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
X-Kernelci-Kernel: v6.8-rc1-1-gc6b0a4ceb7c9
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-firmware-kernelci build: 5 builds: 2 failed,
 3 passed, 2 errors, 4 warnings (v6.8-rc1-1-gc6b0a4ceb7c9)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-firmware-kernelci build: 5 builds: 2 failed, 3 passed, =
2 errors, 4 warnings (v6.8-rc1-1-gc6b0a4ceb7c9)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-f=
irmware-kernelci/kernel/v6.8-rc1-1-gc6b0a4ceb7c9/

Tree: chrome-platform
Branch: for-firmware-kernelci
Git Describe: v6.8-rc1-1-gc6b0a4ceb7c9
Git Commit: c6b0a4ceb7c9d8bb014d2967c97c8c7cbf60b006
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/li=
nux.git
Built: 3 unique architectures

Build Failures Detected:

x86_64:
    x86_64_defconfig: (gcc-10) FAIL
    x86_64_defconfig+x86-board: (gcc-10) FAIL

Errors and Warnings Detected:

arm64:
    defconfig (gcc-10): 1 warning
    defconfig+arm64-chromebook (gcc-10): 1 warning

arm:

x86_64:
    x86_64_defconfig (gcc-10): 1 error, 1 warning
    x86_64_defconfig+x86-board (gcc-10): 1 error, 1 warning

Errors summary:

    2    security/security.c:810:2: error: =E2=80=98memcpy=E2=80=99 offset =
32 is out of the bounds [0, 0] [-Werror=3Darray-bounds]

Warnings summary:

    2    security/security.c:810:2: warning: =E2=80=98memcpy=E2=80=99 offse=
t 32 is out of the bounds [0, 0] [-Warray-bounds]
    2    cc1: all warnings being treated as errors

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    security/security.c:810:2: warning: =E2=80=98memcpy=E2=80=99 offset 32 =
is out of the bounds [0, 0] [-Warray-bounds]

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 1 warn=
ing, 0 section mismatches

Warnings:
    security/security.c:810:2: warning: =E2=80=98memcpy=E2=80=99 offset 32 =
is out of the bounds [0, 0] [-Warray-bounds]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 sec=
tion mismatches

Errors:
    security/security.c:810:2: error: =E2=80=98memcpy=E2=80=99 offset 32 is=
 out of the bounds [0, 0] [-Werror=3Darray-bounds]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-board (x86_64, gcc-10) =E2=80=94 FAIL, 1 error, 1 warn=
ing, 0 section mismatches

Errors:
    security/security.c:810:2: error: =E2=80=98memcpy=E2=80=99 offset 32 is=
 out of the bounds [0, 0] [-Werror=3Darray-bounds]

Warnings:
    cc1: all warnings being treated as errors

---
For more info write to <info@kernelci.org>
