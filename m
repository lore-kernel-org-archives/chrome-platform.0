Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43E11C2E
	for <chrome-platform@lists.linux.dev>; Mon, 22 Jan 2024 04:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705896509; cv=none; b=Ky9ehYJfsGlJb8eJsp5TBu5Fn1qe06IXzZRxFCE5eQM5xplnthpwtc9ik/Od0W7pPrgX4xYT+0rjHY5M6dsCJFdetxIgwhvKn8839jBnqC8oUIEwneeIjI04b4ae/V6IMeRA9j2StHRn/swb6DdQHcybuAvwQMMpdDq7Cmw9NNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705896509; c=relaxed/simple;
	bh=ejvGKHeG0aOBMLRUabqQxhbknimdDcdlNMlEpE7aWTo=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=gSwlM7Dpbel0fQuP6m8igneAP3fytdevMsTVpLzzOgoaZhS8iJiO1nEiXHxphBc9PgiLfYGzGm40gR6g+T7ef6IUmSyCkfMb+YNg7P+CTO8N6O5jgzwW2W+1ky076q7RI+Sjrw6jpvuW4Ff7U3fi90SAl4OA+G/SwkIm70hiFeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=fzBBuhNr; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="fzBBuhNr"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-29041f26e28so1088852a91.0
        for <chrome-platform@lists.linux.dev>; Sun, 21 Jan 2024 20:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1705896507; x=1706501307; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sn/Th8zp6/KUSYdvqlowFALIK6qu7vsPH5SC9MsI40U=;
        b=fzBBuhNr9hHkVHiXrriDVhig6RU81DFkAX3o+x/UEoVqNMwAbCT8PHE1yyathkX+ao
         uk0E6XPsRJt9hwTiWGZytvXg3Iaewv5V9KfJn69K3/g6Yk62jomeqF0V9JvFhDvGE+3a
         t1uTOmH7Efz735BXPaGX0Zo2v+JnKnTmg2LVpWyo41SbDNFkqSrH19KQvCTGbbUTY2q0
         AP4txJqL0mOxyXrU0m6I4/xiNxHxkCp+yslDfUOralEHYtK6yuU/4r9H0Nco9IrrJ8OP
         xGwVazvGVseQtXtDAhYTz7T0aww4sIzlMGSq9FTyidBiOrrFAM6rcpl8f2ECFJwsQ5I8
         GFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705896507; x=1706501307;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sn/Th8zp6/KUSYdvqlowFALIK6qu7vsPH5SC9MsI40U=;
        b=hxjqQl1mOwLvXjyIJuPAOjc8n+ocngCOocGR1htD85z8FVYXZUan8nQrG3r5XgJ/lG
         M8wKs7Qc1w5GdjfJv2+tVWOTXgMCr4ZJLhxMSDguiZdvJ8uKBSYjKjeCHwx2o33h15yK
         1toGlimsmQvBPKyf4zd2+PsXe2TtGEAjJBSj4kzpBIjJ+L1JrJvHDZeFnx2yjvYzjDtR
         aqkQ0bRVif2m1peT/Ca//N5MfknNafsXtjibJ8qERb+ox+8cH6a5xco01ISYdcJ5Vgzg
         BNMtkE6/uoB6/av6EyT1EVIuCnGSnMCAvTJiTvyuKGsQi3bksLY+x2COoqvIz1WK7hsg
         yyjA==
X-Gm-Message-State: AOJu0YxXIvJV71KftxXWmgnrz67ffB/ni7tbYm5dq7aorxi26zPFo37z
	VfLjsyEowdZg+CBVnU90Zwj8lZnD1buFgODHu4TvYawjl0YVS7Wpt1Rh3tqke/M=
X-Google-Smtp-Source: AGHT+IFgJDHe7ZbYCBy6sEERgJzMjVaiApVTafH+2Hr8RGICHp7lQs8HIS0i3F0Dq5bDWpevkMu8Dw==
X-Received: by 2002:a17:90a:8047:b0:28f:f829:7959 with SMTP id e7-20020a17090a804700b0028ff8297959mr791013pjw.30.1705896507138;
        Sun, 21 Jan 2024 20:08:27 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id sb3-20020a17090b50c300b0028ffc524085sm8481146pjb.56.2024.01.21.20.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jan 2024 20:08:26 -0800 (PST)
Message-ID: <65adea3a.170a0220.a69af.d431@mx.google.com>
Date: Sun, 21 Jan 2024 20:08:26 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-firmware-kernelci
X-Kernelci-Tree: chrome-platform
X-Kernelci-Kernel: v6.8-rc1
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-firmware-kernelci build: 5 builds: 2 failed,
 3 passed, 2 errors, 4 warnings (v6.8-rc1)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-firmware-kernelci build: 5 builds: 2 failed, 3 passed, =
2 errors, 4 warnings (v6.8-rc1)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-f=
irmware-kernelci/kernel/v6.8-rc1/

Tree: chrome-platform
Branch: for-firmware-kernelci
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
