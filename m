Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9E314A85
	for <chrome-platform@lists.linux.dev>; Sat, 17 Feb 2024 02:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708136198; cv=none; b=Z/H0lNyvdCReiEPCrrzayN3QTN+bXo82MzzqsdW32qD4AdHlwII8E6IAgndD0rylajJOhstka5nn764IToFrMElvr9BjUL5RgReoMoaPfwtqtFeSzThV0N0lAcXz3i+4ZmeHX/bBDO6AcxsEgwCXxfMvbQWNCn7cxrsaJSFBbbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708136198; c=relaxed/simple;
	bh=qbJRPkOP8QHx3TMsxzWdAGkMVnmLlpLPnCEeeJrpY2Q=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=jvYDUtw4PQfp5SuSMm7a6J2Yo+/ZMdnp5QTLoTXQ14lI72Q35dsTmOWtqyWoBkrOkqxicUj0iye31qLek8y6Up8AWmfrUUsXM25Qt2H7e8LuhnoOvfzaqfMJx7WlillLpDvGbqA0doAENNgczihfGIXTjDqtrBTo3gitZnecmzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=kzRJ4Ip4; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="kzRJ4Ip4"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d7393de183so23869765ad.3
        for <chrome-platform@lists.linux.dev>; Fri, 16 Feb 2024 18:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708136196; x=1708740996; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GOAUGoL89JOkZVU9Y3eilD+Ocola9JoKW4b9u0aoOww=;
        b=kzRJ4Ip4K2WDuKXTKxx0PZWtSQT5GJCn7/QsuoTYf9uQgoJ9KXZ09y2oezoZ9VjRqy
         afikcbVTAZGtBZNa0dMmBbtMRSiS21uXQVsOqZCK/FdHIrM2Sux2k9Wlwenx622SReu9
         ygRkqjF92lv0XuqwRnzb2Y6y9AzyU2tym2vBoFNGP4DdNfDWwpVinGZFs4rQLvC3Oiid
         VUOJ+3Z1h6ivDs4ih/mpa5y37TEP/p+AoC8VzsOohCeHfoFuJDUA9bY/vhXnkX7lIBUv
         eCmqIEJQKo76CT5KZV9XKoMuw5VqH5Yo6NG/SzaNAkGY7RpGuFY/LGWi+7RfjTVYWa1K
         8acw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708136196; x=1708740996;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GOAUGoL89JOkZVU9Y3eilD+Ocola9JoKW4b9u0aoOww=;
        b=AANPW8wDvTtmzpB0jus5WK9IiiAHfo1QF4mNOcTrp4pXhWXon8VEHRm22Aym7mnFbm
         aMwJYunwhWd35hzw7KX6jMhNAB71Exum5SKidyDNZ17MZITO86bjy47+eYVSeZwurNF/
         muBsbyYFDEpWZGPj+bwMQOD5F72Al6HAhm4EF2sLLQGexn9d+80s656AjfDOXjp2FxsO
         Q7/JqE9cmeCO0838ZkS1LN3q9hbKyZJG0R1EvWxrhlN6YteLBrCNRk/iIxwcZf+HnY6u
         TH97zPxTG3EQefn/vN62Bci8su5tN2LzfXBy8DJi2Ci598yG34fq3yKoply6ib88/47+
         +gdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYrBffinY2/f4/5nGm19SAb2FkvIppqXh9lOBDCVcV25M3XV68JJRRu2EBBjGmPCOALXjbeMHoDtlc6jOuXPajckf1ynjmQG8OSwvTuBVk
X-Gm-Message-State: AOJu0Yzyq9ptftkEEEdEzPlD91/mX+IhknT4+hVMUG9ubp0l1BwjPXkR
	NNDVy9q2/mU0P8wNDPCS4vzknUBvT/n3FTCiXPIm8ZUco+HCipv9T7mByrVRNS4=
X-Google-Smtp-Source: AGHT+IFVBRTkYA0gLj+hE2njCKO/qnvchIPsp/ZeqcsDU8nYiGB64Dn0SklZFR06nwgYbD5Zkr1H0Q==
X-Received: by 2002:a17:902:778c:b0:1da:2bd6:a450 with SMTP id o12-20020a170902778c00b001da2bd6a450mr6053234pll.32.1708136195847;
        Fri, 16 Feb 2024 18:16:35 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id r9-20020a170903014900b001da105d6a83sm482747plc.224.2024.02.16.18.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 18:16:35 -0800 (PST)
Message-ID: <65d01703.170a0220.f7ae6.31f0@mx.google.com>
Date: Fri, 16 Feb 2024 18:16:35 -0800 (PST)
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
X-Kernelci-Kernel: v6.8-rc1-4-g8a0a62941a042
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-firmware-kernelci build: 5 builds: 2 failed,
 3 passed, 2 errors, 4 warnings (v6.8-rc1-4-g8a0a62941a042)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-firmware-kernelci build: 5 builds: 2 failed, 3 passed, =
2 errors, 4 warnings (v6.8-rc1-4-g8a0a62941a042)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-f=
irmware-kernelci/kernel/v6.8-rc1-4-g8a0a62941a042/

Tree: chrome-platform
Branch: for-firmware-kernelci
Git Describe: v6.8-rc1-4-g8a0a62941a042
Git Commit: 8a0a62941a042612f7487f6c4ff291f9054ff214
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
