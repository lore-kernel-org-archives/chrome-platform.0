Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B69614B94B
	for <chrome-platform@lists.linux.dev>; Tue, 20 Aug 2024 20:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724185540; cv=none; b=cgjhkXNO8NLvt4z5usSZvgx7Vyiu2nxmNAgilo95mSbbtMeYDZc9Gd1Ct42q9nrHPtAhobdo0KpxXYZ3s6AVK7UQKkmqIFce2Q9fEx/fmCjIyBUyPOIPz9ZvT240Jx4ML/sF/c33xcDunzwgyfOsIwA4vComEjprFAUijXW4tgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724185540; c=relaxed/simple;
	bh=AqI1C5EjuyTx71MVxjDa02XZNUsMk+OUnNi8/Wi2468=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=OICEvpGTecHc5cYVyO1k0ol9DBp9YkOb9molEPo/XHjoUPAXAVmBxMr9gu18WUK24hq3XnDZ13cr0DggpWUXW/s7DD9g9+KTIF0ZBQpZUuAWhBWcCXq7NgE6R82Gc1cAgAcTF1W9+Ku9EnWUYTX3yKV0kEyjCU18CApJWkzv6EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=tV9weGbP; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="tV9weGbP"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70f5ef740b7so5347381b3a.2
        for <chrome-platform@lists.linux.dev>; Tue, 20 Aug 2024 13:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1724185537; x=1724790337; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Jve03Pbz3pn/xUySS5E7SF/leCO1kDANNY5w7UV3mTs=;
        b=tV9weGbPggXtPqwdEogWNIhKuppFawvAJjXz4LWozmzWtdwgK4AXpx9BcAcHrI8WR3
         c5dag4Y5H/19L0Hwhg0/V8076aiI28gsTpZCoa3Pc9ZdjfYt261Oz2gznAmNxjPAQ15w
         +D9oH+2Y6Gq+ML/RLoT6fK1g4E9GOJIYZZkDwsa/pRYJeDbQF0GJ0lYLK+XP/aGe+Dcl
         O5YtlF3YWbGIj3lCLZ449QNaVgwwyKaEottBRoZTDED/8nx837X+ctJLiJfQxSy5xWxH
         0o98G5ZGUxWS2RX4hSXOZhHljoVqD6+xSY32+GP+2LIMRK06JVgiQraFI0vusxqqit8O
         Wveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724185537; x=1724790337;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jve03Pbz3pn/xUySS5E7SF/leCO1kDANNY5w7UV3mTs=;
        b=AjuTAxSNNk1JlAViQNYqYHlAHJxGUyg/ge3AKb0wFM7QZZL+hV1N8cgyQC4BdLmAZA
         R9CQER/j1NcuLlaOb1NTtGzSaqrju0H5WMfnLf26RhwTRPUAtpV6GX6B20zzsU93Nimn
         Llx7NqaUFEo86z+mWgCPMP+1MsDAq1KredHndMM2WbSoyUHNe4YTKXR8xZNlPbwtM1kL
         lmLhicSxF5wG/GEzj5AmJrggcvR9VVEswD3FRlTJvcfgtJ/Nmb3tI5Bqye9ZZa9LJ2qJ
         LlYiR7TJp81UL4iQ8NU/aYLXFXCtkibADUoUODqdUyHkG37l8qqoSG/ChvXCR8B0an0Q
         M8eA==
X-Forwarded-Encrypted: i=1; AJvYcCUEM9GjGRN8eYsZLhnUgGwlmIOMgpLkXe9oWlOTk3MReWgewRfoaJDLqu8ToIqVz0RAqa7Br3WTY+jU8vuDv78=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/f/kSrQI5s7okRrE1RZkJDzWUxD7pKXtd7enV+x4TRmiAKGff
	JuT7GIHG1oJGbLUdHlhza4G3WacucCYQhO7rD0Wi/VhUQz1d5VBQ3LT4vUHS81g=
X-Google-Smtp-Source: AGHT+IEfV5LkRkIk9qj+N9rSPSBMmyliZQCwEOGxeJuKVSKfsJbBlouZ57f+qdQ2ejOFZmypz431UQ==
X-Received: by 2002:a05:6a00:9286:b0:704:2f65:4996 with SMTP id d2e1a72fcca58-71423469f76mr377235b3a.11.1724185537390;
        Tue, 20 Aug 2024 13:25:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127af1bd5asm8936662b3a.177.2024.08.20.13.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 13:25:37 -0700 (PDT)
Message-ID: <66c4fbc1.620a0220.2f672.fd73@mx.google.com>
Date: Tue, 20 Aug 2024 13:25:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.11-rc2-2-ga1927fbbf74f9
X-Kernelci-Branch: for-next
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-next build: 5 builds: 1 failed,
 4 passed (v6.11-rc2-2-ga1927fbbf74f9)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-next build: 5 builds: 1 failed, 4 passed (v6.11-rc2-2-g=
a1927fbbf74f9)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-n=
ext/kernel/v6.11-rc2-2-ga1927fbbf74f9/

Tree: chrome-platform
Branch: for-next
Git Describe: v6.11-rc2-2-ga1927fbbf74f9
Git Commit: a1927fbbf74f9f61eb5c6d1414037c97a8d942ab
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
