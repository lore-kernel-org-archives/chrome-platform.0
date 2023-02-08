Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430BB3C3D
	for <chrome-platform@lists.linux.dev>; Wed,  8 Feb 2023 19:28:44 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id on9-20020a17090b1d0900b002300a96b358so3352928pjb.1
        for <chrome-platform@lists.linux.dev>; Wed, 08 Feb 2023 11:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hmvLESvDyCLI9swYwZSnFmVS0SFiF7xNUatn5SF4FZU=;
        b=5m+VQpkaSjHoHcjPIXKzB36Q6+srU7fRtRc+dVPhb/ilnBEwF3p4dWOpv8IiTOZi4v
         HJEARkIeBqi3Jy9O6oU2zWy9ftgIdw30aoXMoR4fnMyMPLrjoDMMvDyqXjgc7G9mnSu8
         DXozOmscN1hHxMsmmU2/9Hrg/WHDhhgdejxKd9oPl95P5ohlDFmZNtnxRtyw9+XCPjEK
         oRGNY4xHAthwfAIjkAUzdWPZJR9xj0LJlCcoWiu9thBToOmLbvZJ99fJ+R+2TWPgMVvl
         oskBKfvkwpVo0IN0Fy/Kzy3I3ubtq19MJ6KG9uAtH1P9Yi+nCp0pX7uNEsJ9I+MSygRG
         kNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmvLESvDyCLI9swYwZSnFmVS0SFiF7xNUatn5SF4FZU=;
        b=A0DIRLX/H3X1c92Ix6KQnraaYxbfBJcFbJywn6V90UjT3Mm4lqgITQOyOClbxHGSPD
         K3RO570odjQTWBLjEB9iutJCgkLNH11CpMEJrU/JUrBq25Zyg4hEu1sfOReQomdWu1RS
         Z/M2HcRNUUE6HoPOL2viSJJpvGSjVrzqLpLWMKWqJ//6B0hOZKhzp/fRPqnoXG3Kl13H
         T7iVLxjUCo25Q7e/C0rT+cNo5fMvZjoYzuDN20jaMxo+FSZcgMo9/uCRKy4UrVA/Wr1f
         R2lY2CL3Tl2fHxiSKIjlKa8baPSbJyjspnDDUlpQG6eDUyTjjdpUFJ69hbhChCb6+0yP
         v76g==
X-Gm-Message-State: AO0yUKWpMzt02lQyhsCBjjamIwBSPGCHluxlVafz/E5SwCyF6q9f9/F4
	oFX5//r/uZNb7VKKXWgtTCKO8A==
X-Google-Smtp-Source: AK7set/7s9/4v2cxUSSOs3JB2nIS0lG8TKdZsspz/wW8kJjPd9dwTgPIEDOaTc0oOmQwDm1HAhNKBw==
X-Received: by 2002:a17:90b:4c88:b0:230:8300:d290 with SMTP id my8-20020a17090b4c8800b002308300d290mr10034824pjb.27.1675884523621;
        Wed, 08 Feb 2023 11:28:43 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x3-20020a17090a1f8300b00230e733599esm1874281pja.48.2023.02.08.11.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 11:28:43 -0800 (PST)
Message-ID: <63e3f7eb.170a0220.4a74b.3174@mx.google.com>
Date: Wed, 08 Feb 2023 11:28:43 -0800 (PST)
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
X-Kernelci-Kernel: v6.2-rc1-35-g75a273974d7a
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.2-rc1-35-g75a273974d7a)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.2-rc1-=
35-g75a273974d7a)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.2-rc1-35-g75a273974d7a/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.2-rc1-35-g75a273974d7a
Git Commit: 75a273974d7ac814b655eda546c62064a4b41d34
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
