Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF3D1FA1
	for <chrome-platform@lists.linux.dev>; Mon, 22 Jan 2024 04:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705896523; cv=none; b=o0BH5R9t49UE67CmUHpEoxICURkaS2k8T1bY6bq24hCLxz6m+gz4ldVT1XyHaNonXg5zNxngiuoEUgidRbCTf4fScaagf9J7qTFcsz9FGqS+hUPkgDHAS4yUaDfSBTMDZ+vq4F9zYV5I5p+XU3UCv31EdzJ1HW2nE5MbmYFDQs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705896523; c=relaxed/simple;
	bh=e6gmgqjlHhXw/gH+1XqO6nXP36rKwdeaFfK/u/U6+vA=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=ESnSkCQpXyHQ/tcld0NRZsRNC7I/OwV9GLlamF6c8dPqt+Xo7lDgheguK0N7u8+/rBH4bnRY/3kn6SZRWpnscsPKECUpEc6nusSCd1QyoMLZmZM787SUdZHl82psTx8X6cw7y3eGlET2bPABzJb+cBtuNNGf93IfYq+k/qx2LeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=yzgl7TGK; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="yzgl7TGK"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d70b0e521eso19496885ad.1
        for <chrome-platform@lists.linux.dev>; Sun, 21 Jan 2024 20:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1705896521; x=1706501321; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p3gEZ5ClcY59kDrY50rfCGTmQ91++cxDKMJqCOW8yX8=;
        b=yzgl7TGKxq4ciWde8r9NJao//jVW3rHYe3xUvqm+ug4tB85oBdNKkmwZEG8WwdvP78
         zBdQotE64nvJdfcLyUAbM4mZv3BMdTnPX864zybRQc385iuTiB94pouHklYe3y0LJUJz
         xD9telrXs20+Ts4fHnR0oCrzDNuybaRXSBBZ8e2gAhUx/Ex0GIzFoVkcXUgVGavfnmML
         8ZFdRrvh4n8wtWSX6AX0TX8YeXZf3FPNUOl7WDhv/X0CVhpfJkL0ZtQbTdNWF9LlDUXt
         7fmDQd3aARPwZh4O/imkFVXzwNRQY0/ZsJhYa5pJ5MIOvfTETCnAYfDv7hZ4MmE0CyTp
         fe0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705896521; x=1706501321;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p3gEZ5ClcY59kDrY50rfCGTmQ91++cxDKMJqCOW8yX8=;
        b=MLI+LGjQL7ztjUGvu9NYh3oSfC49trPbqZOF3F+EtuCo2NCf63y1M0HszUNrjvscID
         VEbNgEA5CDaKFThcnfYh5dkCXRQpYVh/utjEia/dBA3ovyiaK2dvil1AqTrIXc9TA0zS
         fsA9C85LTlFnfsxEgC4gb08iIxdOnq10JNqJ77Yc+ewz4MPldB3YG3LsjTFwPxjDPKNi
         0NUbKLJZGh9CaByz13YKWr4dmtQAx2CUSW3WIGe/o/jO31/hY0dToPFv9PP7LNIT9H9h
         rHWiwYfGHMHk4UnbxIpvViuaQqW8o/fqxAdJWx5Vu98VWDv4uS8/xOVNfSKyUNziZDSe
         Xgsg==
X-Gm-Message-State: AOJu0YyGmg/TnkLI9KObohTWNAPVHP64jH8WvDUVWPk/I2mYdMdkrUze
	sq4JFuP8FN4l+SPdrBMTL81YcIQUseDODtoEglaOsUAEBRLwf7D8COEcnBVW73o=
X-Google-Smtp-Source: AGHT+IFdnvp5H1pToRyQsDRFXtlCrFe0kRt7n1oZJNTOtj57P0G4Rag1M/AcQWiq4bzRAt58PBYNZA==
X-Received: by 2002:a17:903:200b:b0:1d5:f10d:2ac6 with SMTP id s11-20020a170903200b00b001d5f10d2ac6mr3047170pla.115.1705896521009;
        Sun, 21 Jan 2024 20:08:41 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id le11-20020a170902fb0b00b001d75da799b5sm143673plb.17.2024.01.21.20.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jan 2024 20:08:40 -0800 (PST)
Message-ID: <65adea48.170a0220.9eaf9.06e0@mx.google.com>
Date: Sun, 21 Jan 2024 20:08:40 -0800 (PST)
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
X-Kernelci-Kernel: v6.8-rc1
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 2 failed, 3 passed,
 2 errors, 4 warnings (v6.8-rc1)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 2 failed, 3 passed, 2 errors,=
 4 warnings (v6.8-rc1)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.8-rc1/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.8-rc1
Git Commit: 6613476e225e090cc9aad49be7fa504e290dd33d
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
