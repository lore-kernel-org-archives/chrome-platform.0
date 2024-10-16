Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A3521E3BA
	for <chrome-platform@lists.linux.dev>; Wed, 16 Oct 2024 04:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729054093; cv=none; b=qHg9gM7kU2Mgg9AOSN/0CN6Ub9t0noEIiJdOCbuqsGmRupWomrePb+QvvMPB4CQHAS5b0uG9qaT5PYYnZY2VeCBEeiKs4qO42/FvbVf2USaLu1pHGF84fe2AtUCsZsfdAbX1lEzjU+s2ZVdREpJmw4wsOefyPjahgH/EfUyw9VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729054093; c=relaxed/simple;
	bh=QoOXD83MifxITQuCHbwG2wQq3V6tth+YkURMrtocFx4=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=XuGz+Ms0I6Eh4Evv15vp4Z5tQQA85Sj+9VuP3r4cEaNWoNurOzZ2nMel2t/vERBLBfw+IStY4Tuxyo+W9cc22esOXwRqhysDJy6DZbiBOGWHmVdzDtY/kb2GBFB0sP2L2lh3R9eKITHHJFSLtjxz9PDLJ/ZDBljlEFjvaeNDVTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=RjFUiGm9; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="RjFUiGm9"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71e7086c231so1615278b3a.0
        for <chrome-platform@lists.linux.dev>; Tue, 15 Oct 2024 21:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1729054091; x=1729658891; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UuMiUApMKqsOWc8DJHbb+3pdCLGeo1+w1hOp6XKF2sE=;
        b=RjFUiGm9w0Jc1Jri3/YT9ZqB0Yx7wiJMyjL2yB3pVxOO/OgejJSmN6WITezg24PWG2
         3CuS9hblrEFLylRr911L9KPEqSGZklwvHcvUaCeorki1L7KGrO7AuMJlAMjSLvyYesDp
         9/6C8F4k0ApuPlsUY8pRPnwCFbazGgFKTgK/7HUIziELqWajFnimFtb9sIjqKR0tvcb9
         BPNsSbeL9+37j83pltfG+z+uTEYph8rpwIzV4i8/ORDOiDytB8etmKs8VncgjsMFmAFd
         xG1EV0pPw5+55X19OmlW8npUmjARADO6VoWl9B9XTZgRB6h3tVO+mE5w8b7piSPq2zs+
         J42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729054091; x=1729658891;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UuMiUApMKqsOWc8DJHbb+3pdCLGeo1+w1hOp6XKF2sE=;
        b=uoX2ievwxhlHNEmD++QL/o66nFCzn69gHC2YptKIxVcCyXS/YrxN3oyAc9wMWKr946
         78yTYmERIG6QOUiMg4d2B8UbM7GZ2i6UGkBb8c4kwhDStm9pgTBWzonE5BcRwtFh7Svn
         Ca/lz0eKoYKNtPE3eMC1uUYTd67JIXO43BVolMCAbNCL6t6mRONobqU2y2fFNQRvAX89
         HJ8xE1LOELVAd/zxg37rBtNPikuizQyFzx+gznN3WIaeZYJDmZ59t6MlwU1pajw8k3IH
         pC+EVSahVPLWxatCYUK7OQ3BJU55IQsc9jSJMU3+OYQO0YbqnzpvmkFp/ZMEaSU/3Ls9
         B3Mg==
X-Forwarded-Encrypted: i=1; AJvYcCXgvYnOKagozy1UlBkNQpXCkRtidp7q1tbz/fGcjcDPVK2YNkjBQ3odBsDf/W+l77HTesUqeEIKXMlqJyzP7yM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzpLKCeSzbE3L9+yXL8DxHfVO+8PrrMaJfmkwovs/w/V3zkh5DL
	s0Tpsf738S9ELxJmXIauRB/le5FH2ZofE5W5Bdavpkiw+2vwpKypiu7Ec1Jyy6I=
X-Google-Smtp-Source: AGHT+IGPrFsdyF208PbeCZnz7FTjnbwNczfh9NzYD8vbif2P8Gg2aX6Q68LV2wCGvzWpE7+UO03eTw==
X-Received: by 2002:a05:6a00:18a3:b0:71e:780e:9c1 with SMTP id d2e1a72fcca58-71e7dad896cmr3916905b3a.18.1729054090938;
        Tue, 15 Oct 2024 21:48:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773a2fafsm2204216b3a.61.2024.10.15.21.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 21:48:10 -0700 (PDT)
Message-ID: <670f458a.050a0220.e0b41.8975@mx.google.com>
Date: Tue, 15 Oct 2024 21:48:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.12-rc1-3-g32b0901e141f
X-Kernelci-Branch: for-firmware-next
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-firmware-next build: 5 builds: 1 failed,
 4 passed (v6.12-rc1-3-g32b0901e141f)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-firmware-next build: 5 builds: 1 failed, 4 passed (v6.1=
2-rc1-3-g32b0901e141f)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-f=
irmware-next/kernel/v6.12-rc1-3-g32b0901e141f/

Tree: chrome-platform
Branch: for-firmware-next
Git Describe: v6.12-rc1-3-g32b0901e141f
Git Commit: 32b0901e141f6d4cf49d820b53eb09b88b1f72f7
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
