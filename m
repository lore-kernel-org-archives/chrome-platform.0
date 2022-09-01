Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC599A3D
	for <chrome-platform@lists.linux.dev>; Thu,  1 Sep 2022 05:56:30 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id mj6so11120743pjb.1
        for <chrome-platform@lists.linux.dev>; Wed, 31 Aug 2022 22:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=jWQHV6SoWsQwfG2Je/Ft6Zj84im2gTjHjUCXCBT09IE=;
        b=4obEiPPWuUGFf3DojH+RYqmBVg2O6omKj1gtc+qJpwOvxKYKBe2x9O/MDPNxtXvjSB
         /EmRci/WbkMAIb8MOZmT7lJ5m7UyT2xECcSEUkqiqq/rr5UNHeq0ty9Eh3qENihbzIlW
         eUsmCo3/bYILy0FDQRcqjHIBmPVEIP9MYHJJ9jVszsEbeQJ2j9GROPhVByJ+521XgZly
         390ZJJVnnPcfDZyDB7rJ3r3qHGbPyeO4kwMo3nDJ5mw8SR8UKF/78d6fRnW2tOUaNFeU
         5fwRcHSWHRma0Pu54NxoLoG/4NWIeNq3sHNamUrBqsZxYIyN/LS48upwWypUBVXBX7Qj
         +KiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=jWQHV6SoWsQwfG2Je/Ft6Zj84im2gTjHjUCXCBT09IE=;
        b=OitcZfcKeFA6GwSi+/lR77YJXJ78wDX6q2HwvJnAb2qgkmesAHkRvM5M3ekOW8yWcG
         oS/giPQI4t5Ohxk8aa8LZs893EdbtVCO6hA/+IHOxmAxmNr+7xSowlBsKIZd5Ylra2Zk
         nZT0Yc/TqVz7aRIwZd7G1MGVjamQoFFjPL+uos9n5e0sItI0gIe2CHpLhcXS0y/LAz9u
         Tj9k1B0Mg4gL1muHTTJATzlbJilZo09IfIkwaSXUaPbRSczXBUoLbgHWWSsNpnOq1rSM
         Myb4QT7+QYglnj/yrNsDNcuJi8DFhEOh+egOrgUTyN0uplPy0rtjDyK2GHLKr1y8NgQW
         maJQ==
X-Gm-Message-State: ACgBeo2o6zasUKEX4p7AU7zEF/lHzw5FwUYO5Wx/UL1FKFubGMsqaKTH
	GLgZ/0Gl8mFEr42IGB1q36N7ag==
X-Google-Smtp-Source: AA6agR6NUHRl4rEA0G3R4FENgy/awgwwTpqL85oZbI+DXGxbR5GojB9EpIfloegOmInyRutg66keMQ==
X-Received: by 2002:a17:902:8f8a:b0:16f:975e:7c6e with SMTP id z10-20020a1709028f8a00b0016f975e7c6emr29599612plo.136.1662011790197;
        Wed, 31 Aug 2022 22:56:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x17-20020a170902ec9100b00174a69f69b8sm8915389plg.51.2022.08.31.22.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 22:56:29 -0700 (PDT)
Message-ID: <6310498d.170a0220.ac4e1.1b9e@mx.google.com>
Date: Wed, 31 Aug 2022 22:56:29 -0700 (PDT)
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
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.0-rc1-18-gf36a064d1483
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.0-rc1-18-gf36a064d1483)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.0-rc1-=
18-gf36a064d1483)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.0-rc1-18-gf36a064d1483/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.0-rc1-18-gf36a064d1483
Git Commit: f36a064d1483ddc1fe9faef38d370b68e632654e
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
x86_64_defconfig+x86-chromebook (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, =
0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
