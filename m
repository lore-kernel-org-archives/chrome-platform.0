Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8217E12B83
	for <chrome-platform@lists.linux.dev>; Mon,  3 Jun 2024 05:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717391420; cv=none; b=o3T9Zg9MlelkA4QKmI7LGW6FvWiJGm6RSFRKP709aMYq+TsyL+d2MoKgKvHLUfPqBtSGRt2LYnxLDeGNvbtK5JOUZq3Nfxxhd3Waeo9xoaaYwneRY5nunrlsfXkI7c/y1zSIWeKyyfoBRtFjIb9OlbYZ9S3HAedZQqPYVzbE7RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717391420; c=relaxed/simple;
	bh=rU1QTyTn6Zt8lKbVJZd+bQpcvSmWOM7TWfHZeAeQYSM=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=WFClvfbASblUjaNhPxzOJSaCXPxuHTkVnwzVIQbWeolpraSf4spH3ySgwreMdQqBv61ZIBoq0UX2IaMIGNdLnMU8IHRXYBUSTogKIG03zrD9nAUoU7kxWHxStKHFgA5LYJH5W0pgZZZwGAtAI38mQp/W9QgB+Igv26gP/uyFJxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=OqUZdncs; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="OqUZdncs"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-6c9e8c0a15bso659368a12.3
        for <chrome-platform@lists.linux.dev>; Sun, 02 Jun 2024 22:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717391418; x=1717996218; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rU1QTyTn6Zt8lKbVJZd+bQpcvSmWOM7TWfHZeAeQYSM=;
        b=OqUZdncsEVVG8BqGEiobiXXNSxXOvSExCqnZTZwWWRcoMz3wr7wvfUhfFd2D2CXdq9
         tWBdukQ5AWCEuDTQUFmC+8lNPXgyKIlVgoZH9reMjWFh+PR1N9bb8J2RhngTIrc2kNEK
         RsbA4pEKkXTBhbVDA96gTGjxOT0pemFr1el+hKHsdLqcc2yEQkSWbRzkFpNO1o8ttCdv
         9NdxBp7KaTFMu4AerAknsYpvJEXfR2Z4xPdbgnNVkpteb2uIr2D20JyCtfmP5RcpBpkc
         S77CUlPABr9GAunSPQkaGJypkB3W/R2GlxdJ/N7tKaB60Mc1rQm2QtbBlfUv9gp9LGBD
         Mqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717391418; x=1717996218;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rU1QTyTn6Zt8lKbVJZd+bQpcvSmWOM7TWfHZeAeQYSM=;
        b=HjtDt3y8FusOpcNAZm66YBM2nYWs5VX/Sf0q5E0bvzTGzlQmTCm+Nl+ldpuDMpV5JE
         GHc8NZk3Wlz4l/wAJbvJDKPo13PnnSg+wE+rSpxLi0JHN6rQw3AqJ9leHwZAC2zZPxxN
         sA4G5fstZLSEczJUGXWyesZ+v0wdp04NYWQoEcd/VP2/GW9eVy/586yHcEJGKA5y/hY4
         J9muEpL4fnChPoTAzqDsyOUIBpz+v/si5+XWDulxDzacR7bShpeknsMjqCVaNqotU1RJ
         mEll2Bwy7G2+NYDAbmrAtVfjrHZG5pLTx5uf2WDGy3EFCckCHNIpVXXcozcA1QLj2oJY
         Ob1A==
X-Forwarded-Encrypted: i=1; AJvYcCUIuU2vnI7Hq+Y7PFKhYdJFrsXkqLptPpTlMLs+gaTcJA3PeqCEBsogsx1tQ6BZmBN9BM5SUmfrKpdVXeGuyxzOGNeOZCrc8xYGFWbNFM80
X-Gm-Message-State: AOJu0YxDheB6HxrQ2p5RtsKZK0GjTvk5hzBLyx+y9dgm6DyZIbJ68zjp
	2mvAfnjK6YPl+t3YM4zUzMTNS5TOqA2cQEi+HMdPjgXGCIHtZDfBIvaK0J4WmhY=
X-Google-Smtp-Source: AGHT+IE47euZU+D4G1f3pf03WQdjrrm4+/4kxHMW9wBu7TulQZmOXlDBGGAcLG8W/x0Qvas40CiWWQ==
X-Received: by 2002:a05:6a20:7486:b0:1a9:b2ee:5f72 with SMTP id adf61e73a8af0-1b26f187bd4mr8478517637.36.1717391417822;
        Sun, 02 Jun 2024 22:10:17 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f632338af0sm55117315ad.55.2024.06.02.22.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 22:10:17 -0700 (PDT)
Message-ID: <665d5039.170a0220.117e11.dabf@mx.google.com>
Date: Sun, 02 Jun 2024 22:10:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-6-gbc3e45258096f
X-Kernelci-Report-Type: build
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.10-rc1-6-gbc3e45258096f)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.10-rc1=
-6-gbc3e45258096f)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.10-rc1-6-gbc3e45258096f/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.10-rc1-6-gbc3e45258096f
Git Commit: bc3e45258096f2ea2116302abefde4b1cb9bc3c1
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
