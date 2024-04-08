Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFD51C0DE9
	for <chrome-platform@lists.linux.dev>; Mon,  8 Apr 2024 06:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712556668; cv=none; b=rdRqbycg5kemza8xcx89gDQYSa4QPBubi7WRgRjbr3xTDLLJ31GlFY7jDj5cPcDR91ALdeoz9yLDcSVr8bxUupjqIkkOedlQo80VSSp619zZgydOZxW0YSUZGXOjcpSjRTbdOZhEIigNhzsoViA+zkl6p7LuWPfdP6tUGajezgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712556668; c=relaxed/simple;
	bh=Ypitq5oMjzFhoWWgdMLZbbnh/ma3GW1pDtt1xCneoS4=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Zuu2vkM3p6xPGI9qWJSArXcuqdFYPoHxZEliO8YBr6yV9WsZ39cFjD2V5DoYBGOkF3FiIbyn9bLXVtD/SDGbtgGGDQ0jYirX5st9KXQe2m76UH9tKg4nf3wZMAq4ntI4h6hTNJWinjJvx/3nkyr0o9UYuL67KcJz+weEcBusUFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Cc5AVS5R; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Cc5AVS5R"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2a53e810f10so87291a91.0
        for <chrome-platform@lists.linux.dev>; Sun, 07 Apr 2024 23:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712556663; x=1713161463; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ypitq5oMjzFhoWWgdMLZbbnh/ma3GW1pDtt1xCneoS4=;
        b=Cc5AVS5RbWgiSJNNrBhGyl2jN+qIb2fQOZdvT185NB7ftzWQ71KNVniGw0qFTJ7W39
         5sOTZGkk7qudjAaOSRi1SwpEv88lY8t7WIZCRe527nIW6b/2JWi4tNxhnyyvWnjAU9eM
         edjGYnKCFtTfxfgAYluFGzsjNmCQg7NhYDNKpsGkc/bxntb2wR9Sl97idUbColuctEXl
         YoWN4dlbMZ623kOnyw1i4mVL+QyC+OvSQ8E2iVpmiKQmtVPPaF/DckZHrnr7aYqk2iuI
         Nv8HGKINwx8fKpe5X26dlp6ooOTKEbVv9knk4Ch0lki+ueFae85Lu4BpAII7T05lgRW1
         arpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712556663; x=1713161463;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ypitq5oMjzFhoWWgdMLZbbnh/ma3GW1pDtt1xCneoS4=;
        b=YEM5cVZJ9GxsNTJGUp12xE2ZeT/t2sB2jhb9qut4IeRaq4LqV1rAJ/SfsziIDWnmCg
         gN7rvH91Kdjj025m7bc8VxeuG8t+nt6QFogHD4/jNgpzeuxwur0u8Tv+7RgSq1vgP3mK
         5FAio5ekdTMewQLvChlTMA+k1QcGOJRHlX9ltCUBKqnFz5r6Lrd/aFSRNbKL7kYBjZ4l
         p+NlvmtgtmiP8d4pwVxEcBGpRI3ESs1kCQdkalrZIICwPAp/tqPzpQ1+nDruDWsQjUrL
         EFyscxr2ZARYGXp0KwC96VEFVM3xEidwa3j36VOTwByMCoZnVq8H3QB1Ugw/kGk3EM8E
         PeIQ==
X-Forwarded-Encrypted: i=1; AJvYcCURs9LE928XmxyRBAhFIRzU/H9jDthJPFyzaozU5BgtKF/ePY6HqJZCjKvoOmyjOKR1YpN8NXLbYncJbiBV1dVtMAWc6wvS3F6P+RlT7BSU
X-Gm-Message-State: AOJu0YxJv3X2tnf6ZxgfIyyCFDadOtbfv8y4iXDbfoEEHKEtmSLNd514
	E7G/l0RVgpd0RxXfu++D8uibVPJznQmEDIVY3TpR+3RqTel9LxeJ0jwF9hqwwSM=
X-Google-Smtp-Source: AGHT+IGdDEjx5Mk6H/w9LIRUrTAo/CHHhdJcI/fdWQDelgb/8UX/qscspjOgXwguCv0AnsjKA5aeig==
X-Received: by 2002:a17:90b:8c6:b0:29b:b3fa:b7a5 with SMTP id ds6-20020a17090b08c600b0029bb3fab7a5mr5029518pjb.7.1712556663261;
        Sun, 07 Apr 2024 23:11:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id t15-20020a17090a0d0f00b002a24886fa5asm8110175pja.36.2024.04.07.23.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 23:11:02 -0700 (PDT)
Message-ID: <66138a76.170a0220.ec1c1.6f55@mx.google.com>
Date: Sun, 07 Apr 2024 23:11:02 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc1-16-g1af853cb6e4da
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.9-rc1-16-g1af853cb6e4da)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.9-rc1-=
16-g1af853cb6e4da)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.9-rc1-16-g1af853cb6e4da/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.9-rc1-16-g1af853cb6e4da
Git Commit: 1af853cb6e4da2d1eb339de95d5cf38ada02b993
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
