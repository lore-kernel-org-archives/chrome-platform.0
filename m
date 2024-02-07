Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EAADF46
	for <chrome-platform@lists.linux.dev>; Wed,  7 Feb 2024 01:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707269096; cv=none; b=UEi+TufWp0GaB1VS/5NHgFDaza/d1pMuKlzMXVbW+niYeLFs8ey8OkthzKyMAlm6gHL9JTyvDwpYnhFdV1wvB9FyVoA0t0q2PhN1/yangfnH8CptKVvKHm0lavxB2vknX/9U+DXNVC5hoTYphaVGPcWfXIiYw7ujmNHkC7IVJyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707269096; c=relaxed/simple;
	bh=xRX2JZkOq3BlmQx+N37SmJLeFSh5NDn2CJ2K5hhMfCs=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=PVCtnYno/+ltfjk3GpIk2Nziu8YPnGJ7RCuQpwpPK3U7wSXX1BXckKHHjtUQK7C8sV5QUJM3Pbf30imG1m+1mCCpa5NBD9U8AZACLL2Xyo1csbgw+frnkL84KUtaGIAupsZfprVfavtzgYlIjhGX2yUJ7HzOww1+B/4gfV+xlzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=EGuuGn4g; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="EGuuGn4g"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-363d942478dso333575ab.2
        for <chrome-platform@lists.linux.dev>; Tue, 06 Feb 2024 17:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707269094; x=1707873894; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2udzSDy/jsut4hqbmMI1aVaH4EboUWqjjLS35HBPHc=;
        b=EGuuGn4gnGvo7hsTs/94h9EbZtQu+t0i2RDJVL7sWLtjjakoKA+xziYu1NoGoK5xcm
         NBDTgzfbDgUn1BIi88Qo/F6vNxRKB3VGbKf2av1MpO8XtbGoFcg6bqyvIsCR12NPFsjX
         b8XUP8bC/eBDGriO0SdtIRAjoZ/PBO9IaYSTwHEO5FKgI3fQgKnrg7wAYyRjEuVLcJDX
         s7asFsYzlFRAu1frwRAAl9X+fL2L8rvOz9eYGDW/BNyYxsS87hYg34jjuUeE5QmxRSFP
         kBOTKiS57OeOF3F4J82mjUksn72s5ji3eUvPIKBDr8d9ManXSrCvqEANTlQsfdzlMwDF
         KDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707269094; x=1707873894;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2udzSDy/jsut4hqbmMI1aVaH4EboUWqjjLS35HBPHc=;
        b=hKaS9En7pu1VNE1JgHlM70UY9JlHouid2LayPIOLVgvg9sdY8U6rt10Na7fAm44KCx
         OFK7aRlmgKHJAO3vRy/hBjD9AOWNZWDDaMhhi3IynWt0nIBs7pgTWf4/Bx2rYIowkY0k
         cidtB8QXagLL2p56pupNSN9kRMpBNqcyhXpa9IWhIYu9Lha2d/jkLbg+/CcGn7dg71kD
         PGZXjYfGUOYEl0EP5SL3iSNIytBozcciXlu590FYBAsIXEQdT8wKb1v6Y9l1FBgZkhQ9
         WrG5mW9Nitd00P8j9z1T9HJ7UrKNYy5NL/u+6sN5jSS2JtzC1ANAvZfFUEundvi9KXw2
         2Xmw==
X-Gm-Message-State: AOJu0YzzN56ONEmceM7+NkLhwvNrwTeG4NntX1nu3F325xZQGwheuIf8
	Wb4yNiCfaM7Ljx47fx/YeL5ZQ98hltFnXhmDvSu/KJmcMKE8vsNb3hp78p263LM=
X-Google-Smtp-Source: AGHT+IE148gWIBECNb1O4dv3l5Mk11/4DQlJXYOvEp/9XbknLe7+M9ueBCapFbswZF/wqYzf0m9kqw==
X-Received: by 2002:a05:6e02:1143:b0:363:ab28:7d14 with SMTP id o3-20020a056e02114300b00363ab287d14mr4126876ill.31.1707269093840;
        Tue, 06 Feb 2024 17:24:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX5gh28Kg0s+/JHlXdPjIOprY6Q5iLwkDvfcGdOAEPXCA/v98iX9PK/TW5fsJicdRliDrkhDkoNDsvRt0fsOwctDYqeOqpfzid9yqmdHBb1aUlVp0V7Zb5+lg/Pg0fHzpYE0t9jSWHD7dDCwduldlYrMVQSJ4GSsSnnxefX6q3yr+YUJ/7tTyjhyABpSdHYHrwECr8qPM+Ho/JwpaMqzeg9zwtg7ve2XN84PrTTqthfgqlkPwpJzcWaZU8FxjfEQKA=
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id by24-20020a056a02059800b005c6617b52e6sm108086pgb.5.2024.02.06.17.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 17:24:53 -0800 (PST)
Message-ID: <65c2dbe5.050a0220.803eb.061a@mx.google.com>
Date: Tue, 06 Feb 2024 17:24:53 -0800 (PST)
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
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.8-rc1-1-ge3c5df138169
Subject: chrome-platform/for-firmware-kernelci build: 5 builds: 2 failed,
 3 passed, 2 errors, 4 warnings (v6.8-rc1-1-ge3c5df138169)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-firmware-kernelci build: 5 builds: 2 failed, 3 passed, =
2 errors, 4 warnings (v6.8-rc1-1-ge3c5df138169)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-f=
irmware-kernelci/kernel/v6.8-rc1-1-ge3c5df138169/

Tree: chrome-platform
Branch: for-firmware-kernelci
Git Describe: v6.8-rc1-1-ge3c5df138169
Git Commit: e3c5df138169b5494a16b20e74db1ee14b1901ce
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
