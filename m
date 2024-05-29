Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7002C2F56
	for <chrome-platform@lists.linux.dev>; Wed, 29 May 2024 06:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716962487; cv=none; b=UAAni5FPhbXubyXicXHHgdC7wKjncy0MpNg2YPStc9aeO8ddBeAwxvyRmGysSJ+Wnnu4C/A2r2PM9GecpC3GgZJm+csMXgetMpQ2ez+MttvMbHQDgFY7Vszs8I3M5TyTOCuuF5O2+yoLj6lwm8ZzFb/T8KiU4ut5QQxd01YwhnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716962487; c=relaxed/simple;
	bh=X8ZO9rZaefTJLOfox8IwV5x+nkszn3iSo+plWio9v98=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=tMg4++rVdN2KpFXSABFVXzga57zczYl73tPq4qohYQJcXdeHawymPUsgRq6N7LEzgQvVIkRl0jjK/w9lO80mOMRb7W3jVpD4GzC+pr/7df119cf+8clxph7tnwJ9hQs6sDeCa0ivJaU545mOYkOmxjGWESfyPoQeyndPkOJJAl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=dCdJs5gu; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="dCdJs5gu"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2bfc7471028so1331361a91.1
        for <chrome-platform@lists.linux.dev>; Tue, 28 May 2024 23:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1716962484; x=1717567284; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X8ZO9rZaefTJLOfox8IwV5x+nkszn3iSo+plWio9v98=;
        b=dCdJs5gufk3rF3QvLy41UqFqmuIbquOJdYQ75shma6hSQxpBa6Mr85hTb+hmyDWDVE
         9y8CmZ/VbLiGdIYS4w4YxF1gx0WBW+Zw+dyKU3SvmiIGPpX0YHQbmL1dAplf4j/IQLnh
         EByq9uxZMh6GL2azICvckpPis8VnRHnOAHQavg+xK/eSwnolB7PLVVm+YcC6+SiUT7ga
         vlV0OJKP0iMGW6pPAO61Esm4Nfu2WBtuvXZGM7YOR3iJbkktVsIhTzzq7H8T/fXIRCdR
         dZAy8d5R7R9qy9wHf354JWCioQP3EHAw0Bzmpvvwmfm0Ky1i/Z2JEJAb6AgOVwUv5iCP
         emTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716962484; x=1717567284;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X8ZO9rZaefTJLOfox8IwV5x+nkszn3iSo+plWio9v98=;
        b=fKPxEJT7rdjk7djtgjFN3zLFo3WG4x0QVo7plRTy3D0yhdvrjpZ1x71qWQXoqHL5Dl
         DZwNc3nDu27/mdsWl6RuiQmkpSbvCiqZmP9LFYNe3vub/Z4CbZ22kUoMP8YHoItEbKCY
         AoR+Ivn9GsEzcj99YrXrJ+zKSgjk78K1GQLRJcuSfS/caDQ0TqFYdKZ0j7MW3cnkT+/7
         HqIwt+Yjtl5rwntBsSHyniT8lsYUMSYsMrZO7NDfl0/Myp6ksiO115h+HC6MTfwKmf/D
         /2o62vZuOEydv8T8Z+vdpquFOgJTBE0MrmPWYco7zBj6tY1dvW+bE3xlAjyKOYUNIQt9
         rqOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh8W1Ixv8lBRKmFlf0/hgR3SqdMmOk5NUMhB+1SxenBdhKMKhPIKFJ/JgZw1NFMVLEnDmSEq1eTHAIzvs0zXNoYvHHJv2BYEE5R5YCQ0Fn
X-Gm-Message-State: AOJu0Yy4XbmCPDMeK3uL5QEMaBdPLihyqKozC3o8mmDKCSrT01zHFmUF
	o+cOJS5G6HiOg8PbgkQYkd45zgw5qwnzlXCzC0bcVT9A1wAxUiFB3Pi+/BlTXTo=
X-Google-Smtp-Source: AGHT+IH5Ze8NypgQqIdLGOD+54Xll31iwQSaboq0yQGYHbM53PAhIG1hFtkOFc61VEY2JwWbgqGnKA==
X-Received: by 2002:a17:90a:ba8b:b0:2bf:b2a2:5cf4 with SMTP id 98e67ed59e1d1-2bfb2a25ecamr8246825a91.18.1716962484528;
        Tue, 28 May 2024 23:01:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bf5f987a7esm8745759a91.35.2024.05.28.23.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 23:01:24 -0700 (PDT)
Message-ID: <6656c4b4.170a0220.b389c.6bba@mx.google.com>
Date: Tue, 28 May 2024 23:01:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-4-g7b44d5381e541
X-Kernelci-Report-Type: build
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.10-rc1-4-g7b44d5381e541)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.10-rc1=
-4-g7b44d5381e541)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.10-rc1-4-g7b44d5381e541/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.10-rc1-4-g7b44d5381e541
Git Commit: 7b44d5381e541de3da3cee2e948456b250f41f25
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
