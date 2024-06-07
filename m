Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06F915B560
	for <chrome-platform@lists.linux.dev>; Fri,  7 Jun 2024 11:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717758157; cv=none; b=KaMMgAx4v4m4E0zbpR+s8/+pmGN9Bl3AYYY7t0K57GhWvVY562jP6/7BctoeYlDrC/Ua+yQnn2d+ZtrDwpBiTDTcmkk5VTJd3xeHMnMcPY/0PciUs31/RMxJBWggRMzogeXzkmEoZR6VKzoIVY9S6gyAWlEntjxoGeIC7lXk5fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717758157; c=relaxed/simple;
	bh=5nWq3FLkDLW0IhBOmdIjgbIj4v/UNyCCSf9aXVcUCgE=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=c7QLpnUCLa12sWEiTxBGQ3Mry/bqcD91HcEENKswgOZm+/CLAQTlAKHgI2RunX5xsbLFFl1NEaBkdpokW6QLlK5EyYov/J9sYFNXMteYNshZpJx/b0uN0sLzaQxBjgz/i5KvWbnwPPqglsNnpbd0rAv9yZwGhoOTsrCbitaoZa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Z3Jti7d/; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Z3Jti7d/"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6f9611fc320so65694a34.2
        for <chrome-platform@lists.linux.dev>; Fri, 07 Jun 2024 04:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717758155; x=1718362955; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5nWq3FLkDLW0IhBOmdIjgbIj4v/UNyCCSf9aXVcUCgE=;
        b=Z3Jti7d/bC9DfO9y0IZr1mpcS/94iBrbKZU7wkm+M2nVObr6MphYZ4Omc3fnHQpP9u
         71ejCpcvRIi9jPrI+4zmsUkH/VxpAB1odYRH6hffGttaYcqzvBBeGLnbBuIKT5FfylIA
         /ZQXffNGiqz+h6MatwCRzTtSqoEaUlPaAm2j1ZVUtTfSol0IUbGXSCAsIg90KFvdPQit
         s8ruMNtH4Xg9UyERBxMthpl+JMm0wIByvgd/Zv+5+XTeZO3s9kAvDrzSY05uRlyB3kkn
         8qGl4DUty8cVI2BWz0NXrAz3NFF771sBaiYr8yeYPOv4hXBTPbHlTmgfQrZFO/0iT6pg
         6GDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717758155; x=1718362955;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5nWq3FLkDLW0IhBOmdIjgbIj4v/UNyCCSf9aXVcUCgE=;
        b=agm5ptJeqyeK1CnvTvLJscRrme+3z2gvUD88qpKY9NCJg4uz+ruOPLzvG0qlv3rnJ2
         YvmfI0sD4b9ESLWP4NWqGea9NtiHlJyQt779xVohvdsvCYtbubAWLGx4E4f62pIvi7+e
         nLKOKp+TofVdCKbCOsLR8FU9Fvto0GF+5Sy/I9PDrIoPusvLIPlf4DszClYMFAWEYO8o
         aktQTopy0eroRLUFoSZOLMhyJRtr5KiHBmsdZfu1XMyfiDFJI/ZDu6Gemufn3kMJlygm
         BtvFAqtgTliVWFh3KANxBAYelWzFKSuL+3Tl1OYUPYX85+A+7kFGa/O3bwjMr5neLrBL
         kY/A==
X-Forwarded-Encrypted: i=1; AJvYcCXUpdFXl6bKGZirLdosl25pqTPJ7ujFz/vn7g7MxDfGcxULk4dvSd+EbGVfS+rU1HMB4MqCaIHfbV04xvZGcco0z1RM5NMa3OFMyMbzFwWs
X-Gm-Message-State: AOJu0YwInlUiSLyf4Yd3Kd9CVLpBlqiQ+djYrjqfxMRGSHaugqcLMUjp
	VjEwuQRu7DWGcsvxM9TKPeG+DDgE9gSqat3pLTsJmZugnSb+Kxke/sRgXZqiSos=
X-Google-Smtp-Source: AGHT+IEuEmb9BrrE66QA+r2GC77iwo9Po2DSXPe8qk8TKUbQVIlUpIZcvQ8ZH4u+GUw0uMTModieXA==
X-Received: by 2002:a05:6870:a11d:b0:250:89d5:7f2e with SMTP id 586e51a60fabf-2546444874cmr2386714fac.2.1717758154407;
        Fri, 07 Jun 2024 04:02:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd3b303esm2451922b3a.93.2024.06.07.04.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 04:02:34 -0700 (PDT)
Message-ID: <6662e8ca.a70a0220.119a9a.66d6@mx.google.com>
Date: Fri, 07 Jun 2024 04:02:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-15-gc8a4bdca928de
X-Kernelci-Report-Type: build
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.10-rc1-15-gc8a4bdca928de)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.10-rc1=
-15-gc8a4bdca928de)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.10-rc1-15-gc8a4bdca928de/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.10-rc1-15-gc8a4bdca928de
Git Commit: c8a4bdca928debacf49524d1b09dbf27e88e1f18
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
x86_64_defconfig+x86-board (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---
For more info write to <info@kernelci.org>
