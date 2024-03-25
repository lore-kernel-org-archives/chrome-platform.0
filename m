Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92943548F4
	for <chrome-platform@lists.linux.dev>; Mon, 25 Mar 2024 02:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711333437; cv=none; b=WmeX1PIzl+SVcMK1fTePiO3aN8PlzqsHaguRZ79KViJF9uZMxMuGFHSeUovL9L2+hnHgmvgUhUTz2611GANmt0OOeUKQ5IfGp9+CvJsafT8xacnR0KX+AvNmIBxTOD7m60xu+69A/grsPVZZURFxVBKPGMT45c234GQjv/SKKLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711333437; c=relaxed/simple;
	bh=ZHs8Z3Tp6AM0QYyl6zOQFSSxWYyltgmVvzPrJwkAHDg=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=N7pA6pSjfAsGVTEiDQ7/JuOZ5VUWoUR60w+5445DzgxPgeXV3sizPUFvADnvjAIm8/scATHbmiuKIcig7olDq5AXYlJvb/KPttgmSU7kheHhRHpEW26Lqx4hTY6fgp4xpJkmlOgnonJLjcV/dd6j5xyq+OTZZDGt6vL56cz92Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=ctknYzwb; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="ctknYzwb"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6ea9a605ca7so587839b3a.0
        for <chrome-platform@lists.linux.dev>; Sun, 24 Mar 2024 19:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1711333435; x=1711938235; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHs8Z3Tp6AM0QYyl6zOQFSSxWYyltgmVvzPrJwkAHDg=;
        b=ctknYzwbDyh9QEZ7Y8QPNES6GQcjY5pGUCWSWcv4H3LNghaL7rUQoDnRD3zbW0L5pt
         4EylkHXBR4BF9cxbzrjIUc9cv7CTyRYyo5aYdbCcPTdZQEdb7LcPIPtwYUBGHhsWlHLT
         fkV8xL/jHKPOD0OihDOmYgAsRtChL0Btf5uQ628GNGO4KkF956qcvjGyh/kj61+DQYjL
         rPEUpb46/nUW3XJ9nKxaE6pAqXdTP5YruJNVHvS6e2RrZ7kH/sDu0dl1YJgYjn2fk5mT
         ImjuHl8VQmeyRTZqEoHDDpg8BvHpm5IimdCLYUNkyEs5sImbQEjPtPgv/1k4leEN3M+P
         h/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711333435; x=1711938235;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZHs8Z3Tp6AM0QYyl6zOQFSSxWYyltgmVvzPrJwkAHDg=;
        b=qPeRW2pqlAxhx+Rqk5c+8L+kZzq1GRPT3IGhljfQYbacf5RUP8JjLrs/tw5vwhMyCw
         9xSeWY3JtAI2L0/eKhFhlYsJ/eieRL/6PzasgeHBWwqose5l5lCnSbV+F+V6KgtrvU8D
         vzle1kBNTELPIs3SDZ1qQTliBoMPj9qhe8vDUjw2g+/9sRx4RKW0hHyd2jsmmHZG0Vkg
         3LH9UqVelGu/Ih/cxhzofoT4HH4+HCWM1H/6IPI1lWHygHjbG5I/cZT2QmuaFItiD94q
         /c+pQ4l8U7F69xVR4fi31t7Fl2Yvzx3vZYpI0GF8H7BxM6xa8lRph7BjFWS+mBlqsSaV
         xuBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlmWVNWo+HcAARLLJRpqKjakutoMGxcYD+jU4XKwyljh/q1W6oDm1HZ9FVJINrJYFrymzf0XVmSJd8RnhT/eqcwEsAmG5xsoqG1EYlCUvw
X-Gm-Message-State: AOJu0Yx3b58e/HcG74SYFZjoSFEornGKBaAWZo6F3jnYWEC2pHwbOz7m
	UxKtQg6qSMT4xgNlGJrQ/1eSjCNFfuvqxTbngh0zlMiut3+N4/o34agbpY+hdRs=
X-Google-Smtp-Source: AGHT+IGk43IGqr6DunApay7w+/KpqEryBXPRBkMYLYf3ZmRYJmrWu1KoPLQUOqF4vHSKoccg8p+3dQ==
X-Received: by 2002:a05:6a00:981:b0:6e6:57a9:f8b1 with SMTP id u1-20020a056a00098100b006e657a9f8b1mr7732024pfg.9.1711333434700;
        Sun, 24 Mar 2024 19:23:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id c9-20020a62f849000000b006ea916eac02sm3207771pfm.42.2024.03.24.19.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 19:23:54 -0700 (PDT)
Message-ID: <6600e03a.620a0220.bad22.78eb@mx.google.com>
Date: Sun, 24 Mar 2024 19:23:54 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc1
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.9-rc1)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.9-rc1)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.9-rc1/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.9-rc1
Git Commit: 4cece764965020c22cff7665b18a012006359095
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
