Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8921CEAB0
	for <chrome-platform@lists.linux.dev>; Mon, 14 Oct 2024 19:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728934969; cv=none; b=GSQVylPlgVexa9K6Uc3Iomqry8ebKyR72/9W2kfIzhsHHGxMYPI/3JYDHGokFPaqdw0xm+ZrD3X6CUtaPknRJrLPXyNUaOOBrSDQHtYPvrqBsXlVk474mg9+esRXyeRrQU/wC9rGWu5xH633/DIqQOga8ombaQ+qh3eYBFCOBmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728934969; c=relaxed/simple;
	bh=rqFgCXceD+qNov+dhRkbM/NdVUo6yEm+GuGSvw03exw=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=nSWuieC4Rj2uewIqqQcBAOGOPO2xT4mnQkIBgI/U3SI+JZyOOiTE3I25UZubK1Xmi460+uyGjVsasEUdTEf5Gy8bYJDqxTEj+eE91DymyhlFcmQeuCg1rRpuoyR6OPJ/5/Iu+rNwBcf/k2+3/cHpY1/A1CQ97paO51ppyPDVwMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=oITS8aRK; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="oITS8aRK"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7c1324be8easo3831688a12.1
        for <chrome-platform@lists.linux.dev>; Mon, 14 Oct 2024 12:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1728934967; x=1729539767; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ulL+PFsbXLFRyq0/XGk+F9UCFLwFoIFFKVFoQGde7ko=;
        b=oITS8aRKjU7he+dUZfwGNZ2rtvnuZS5L8T5m72nbP8OdDXXcJNRGf7Wur1VtdDNrtM
         O+xYWMCrFZr//u+Jn1aJDKlOVdnZGWBXHRZhjn2+feswrJ8uGettRR3LGGLwn+wAMPtu
         aJIXPWj0QlcKAfrD7YeKCbQZ54Dqzdy48R37H6pNhwZ7rhZU7mCjCQ9vkN69G7w6CIz1
         fwNP7ion0Bo3zlMfbWZv0vuKq7c4NFnJtLW7n8FuNOixrdcEpqWM8xHX9Q1ay0E4bqGQ
         Qfyydha+74MQBftMtB+0GCXNrpaXTEneDfLZSR6+az2SL3dazj3bLoG9s/8u1lAL/UKZ
         NkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728934967; x=1729539767;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ulL+PFsbXLFRyq0/XGk+F9UCFLwFoIFFKVFoQGde7ko=;
        b=RGcFsT/U7qR7BaBLPfJRIiw5W+LOOWMz6sDXtY/prJF1iR2nXq6ev7kBgjw7mIG1RV
         HIy/DjQDeXS3VS0nXtfIgjWgCD/am58eO7t9r8qisrUfA2TbvGT6TkvRXks71B3wppZ1
         qrVUjFfqaY6efd4XgvPf2ZswZKuRZs0JDHgbQpLoL759LBhLOSKQls1RMHF45C9HRcyr
         dyhmAeRTVGEWFPLqKxJVzlpoc+hPE48c+JfUxpngN0sk38Y4rTbkwFFipclFV7YtFxHc
         mIqAez9w7UZs/zbcWJGMH9pVbzkvX1fXzLOn5SPk+5CFQo9jxIcYx41QMZBD+ND/ezs9
         uU5g==
X-Forwarded-Encrypted: i=1; AJvYcCUxwDzNEau9KDYnsjDYkFjTo43YcJGTlluXu5xMkb8MxKT2MxztCqaAjUfC4vwMUiFAeUpuS/zKkE4AsnVIOPQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzpmlr2hoHvFtK97VKinUUU3SUSnVJAYXFlQ5ibuxf5RdlAMIaR
	4PZ0sDa3lFDElb+VhbtTQlhHpt60LXGMa8ZadLYP9p/MXAW88CVvM7zaCutY19Q=
X-Google-Smtp-Source: AGHT+IGCZTWrRigoO0b/evZwJ9kXp00b0NdIkaGOibp6dZSsl9ER8FMK5vH6+evtmbXbVfKchw1BWQ==
X-Received: by 2002:a17:90b:3844:b0:2da:88b3:cff8 with SMTP id 98e67ed59e1d1-2e2f0aa5610mr19549493a91.6.1728934967298;
        Mon, 14 Oct 2024 12:42:47 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e31d9fbba1sm5713151a91.46.2024.10.14.12.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 12:42:47 -0700 (PDT)
Message-ID: <670d7437.170a0220.253345.b64e@mx.google.com>
Date: Mon, 14 Oct 2024 12:42:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.12-rc1-2-g9c41f371457bd
X-Kernelci-Branch: for-next
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-next build: 5 builds: 1 failed,
 4 passed (v6.12-rc1-2-g9c41f371457bd)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-next build: 5 builds: 1 failed, 4 passed (v6.12-rc1-2-g=
9c41f371457bd)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-n=
ext/kernel/v6.12-rc1-2-g9c41f371457bd/

Tree: chrome-platform
Branch: for-next
Git Describe: v6.12-rc1-2-g9c41f371457bd
Git Commit: 9c41f371457bd9a24874e3c7934d9745e87fbc58
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/li=
nux.git
Built: 3 unique architectures

Build Failure Detected:

arm64:
    defconfig+arm64-chromebook: (gcc-12) FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, gcc-12) =E2=80=94 FAIL, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-board (x86_64, gcc-12) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---
For more info write to <info@kernelci.org>
