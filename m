Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F64628
	for <chrome-platform@lists.linux.dev>; Fri, 13 Jan 2023 03:03:36 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id q23-20020a17090a065700b002290913a521so3395175pje.5
        for <chrome-platform@lists.linux.dev>; Thu, 12 Jan 2023 19:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tynuTF8jB/0e/75Hkskyhhoy9My5hVTFaXLcBG7jRaY=;
        b=nQok568lHwUx0wO8cZR01c+PymVtaeAF0cAplMw7HJIg4uZOsJym60/nA10VFRPpEo
         4eJoUHtb/fVolFjyoD2Y2djNSO3OGHT75TtjmHH7+LstGfamMY8uElgzN12rD2uO2/Md
         gs87Eejl5S1PEcbnCM290jGYVTiuy2Pc/vACOJvkiD+gOwuJm6DbuygsggEeRjF/8Yro
         iRWjV5BJrSzpfDjDOVQmQYUALLNCEBKZiDfgbjoh8mIi0TmhCU83EQ8Y+HryWA4bzffe
         Z2QOg8Kb1wlqQPYfMUlgxy3ZBPdxBCQn1rftBPdcMRZ0v1prKg/65UgAKfb4vl2fWQn7
         slig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tynuTF8jB/0e/75Hkskyhhoy9My5hVTFaXLcBG7jRaY=;
        b=Kzv9LzZUvvP9QX+5UIfna5pf3wyvKFVNlqC6eOUaV/8qkQq0WyPrbcBVLKXU+4eLqE
         lovMUAhm5YrOnLe+7Z7Xcvl/aJ5lYLCuan4mvyPAdI5Fwb1cTHpxxOQAkvNOCbg8o8r0
         4fQeLZFLnKGOvuTkuisXVg8BA1ow+ee4Gxumymw00FSWmkVV5SvbjyPdaEd5c4sdJnq1
         rfEjXEp3+iHszBz1YXYxefziHlROgIHyZ2uQy8ZVm8MiFse53mp7qh1iI5cafwCEVfbi
         HfqitCm8kuaUT+8V/lIx9bDnIJu4Xuvsin6JVWh8PBG+K8t213/jc1Iqrx2syoz8dENB
         qFdQ==
X-Gm-Message-State: AFqh2krlUIp0k+3w+4KREetXnemMIojRYwO2TprBeu9QW+HrVPjCOEt9
	MeDAXKmhoH5Erqa/xJsCJPpIkA==
X-Google-Smtp-Source: AMrXdXvhv8+2vkxV0Lrgt1ebD/z2Echs5uO/8APVkicwRI6SXxfeF8BUOIClY+hZoUZEgXjPqoyG7g==
X-Received: by 2002:a17:90b:17c2:b0:219:b034:941c with SMTP id me2-20020a17090b17c200b00219b034941cmr79376735pjb.18.1673579015924;
        Thu, 12 Jan 2023 19:03:35 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id co9-20020a17090afe8900b001ef8ab65052sm11469824pjb.11.2023.01.12.19.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 19:03:35 -0800 (PST)
Message-ID: <63c0ca07.170a0220.17330.2d87@mx.google.com>
Date: Thu, 12 Jan 2023 19:03:35 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.2-rc1-28-g24ddc3b53a9d
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.2-rc1-28-g24ddc3b53a9d)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.2-rc1-=
28-g24ddc3b53a9d)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.2-rc1-28-g24ddc3b53a9d/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.2-rc1-28-g24ddc3b53a9d
Git Commit: 24ddc3b53a9d05b5fb5ee367afd1758ac50e7861
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
