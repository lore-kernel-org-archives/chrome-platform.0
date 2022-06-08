Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9462F36
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jun 2022 12:04:45 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id e66so18669455pgc.8
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jun 2022 05:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=BykE/tJVPk1jXosehfd3QMhQkMJctpHUETcVw6rF0WI=;
        b=sAyyVEMoGGdItixlcqEYTzM8yG2+eFiJGTj8C6cKDhPoupAVit1Rnuwf8H/jlnXVFl
         EHptrj/FyNinH5VkV4Ek1ikYnBlaQwutjIrAcMxrd5XPxzhmrs1M29lkds4TzRXDRVG9
         wDfDfXgv+5wy6aBuKOyz5g34Cbf4gesGrSHpS5uCTMGHyR2DKCSh+JHCZz9F64OGOFYJ
         iTAzlJBHJBzCZY8BP7ChnZwcmFeXetu0H8wIOiBe6OKR+xnwGQvh1lucKF92BlABcW2x
         fp8R3vBkN9QOdjcV0Hth4N18iKjDoluNWJIeeImikjj5LuPCqBs0BuIlc3yZkeV9HIKB
         yPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=BykE/tJVPk1jXosehfd3QMhQkMJctpHUETcVw6rF0WI=;
        b=h6q0RPf9gs+3nPIEz45QrL3ga44VZTSvHipNIFGv+50IJSbf2TXzyBXUBkIx1YM5Eh
         PRaQP0fnJYmllNpe5hDn9ITzNYOSd/bTuSWALE1EiJmTI7s7SHEgRaBoSXSx7TXPbnpO
         I+nvorM+fFES+vMCpyzXVy1KIYF7OUZcjhLEr9pDG9Z+CQ4OITooizizvsK/UZUfeVzG
         0qfu7Wpvt50Ls5h+Wsgn/bRTfG/wF/fxNhaB6gQt43S+qLHGMgLbEtkYGnVvkLm0dL6L
         1kw2I1ti40+BF6VlJA/TvjJTcPnw+IKI2EqWHV2Di8RN6uTtLhJAvdT3wKZadD5GdHdC
         ul0g==
X-Gm-Message-State: AOAM532aiL7Z2NgChWfj3njIrXineA7i2KwoS5r1eLRJFRCJmYS9fCVL
	4Qg4RvudN31ulG0ED1dihtvrJA==
X-Google-Smtp-Source: ABdhPJxppYiAxHLoRBFJcZ9tOSMGVvUP4jKGjT3JTP7xp60ysKiBhCfDJrjPN0Z3bG6BdJkw1R1mng==
X-Received: by 2002:a63:f244:0:b0:3fd:a384:a5f9 with SMTP id d4-20020a63f244000000b003fda384a5f9mr15176360pgk.354.1654689885289;
        Wed, 08 Jun 2022 05:04:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u187-20020a6260c4000000b0051bf9159d2dsm8815419pfb.208.2022.06.08.05.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 05:04:44 -0700 (PDT)
Message-ID: <62a0905c.1c69fb81.95968.0f72@mx.google.com>
Date: Wed, 08 Jun 2022 05:04:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.19-rc1-9-g2e042d202474
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v5.19-rc1-9-g2e042d202474)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v5.19-rc1=
-9-g2e042d202474)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v5.19-rc1-9-g2e042d202474/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v5.19-rc1-9-g2e042d202474
Git Commit: 2e042d202474336c941d8c22a54c60ceb97aa623
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
