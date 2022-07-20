Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E7F1FBC
	for <chrome-platform@lists.linux.dev>; Wed, 20 Jul 2022 05:48:28 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id 23so15453996pgc.8
        for <chrome-platform@lists.linux.dev>; Tue, 19 Jul 2022 22:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=NLWfxlXytNEMM4zqzO8QhV5LDiy4u7E6BEw6Z1qs7t8=;
        b=Mr7eteEDCcoOTNXUkbwkNlJlUcCii7vWqVDBWCkNZIRAYHEBZnkgd6ystxUGxztpSq
         i1TlL+yJSWKOabw+/vOlA67y1xX3yfman6AB2EI1D5I3y0C1aQp5wFym2Pn59AoimT7u
         rweGrRianHyQ9XM0DI5KRYjP8MWXQTSBbmd1SdfShR3CBQRLT5XL5x4XqAUQHheRubQI
         FcgNGtxKLWcH29avWvnC/g6aFt+kgsbs7pNF6r/xPUqTLAbH1RsegCSvXJB0/G9VzYIB
         6b9huDeg+xuSwEdszWXFNVbKPfC9F6CfeotiMc7mElUfE6cd+9kiI1TDq/iJ6j0c6B3y
         Ss0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=NLWfxlXytNEMM4zqzO8QhV5LDiy4u7E6BEw6Z1qs7t8=;
        b=l3DUG1XeqOA1Crfwe6xg4Co2bhXzBjVnZqJhA1P9O3ooRUOhSZePkeUGWNkoGR+Hx8
         G9kFwVkLhRWYODYxScTAhbx5MOZORTW1E5YI7S6J+Zy1gfZphym0cmmPNhLQcuc+9EEv
         2hM7sT1NhTdHKANXza97rIYTV3N10iM6qoYsr/DSfcNqq+oYywdeNupHx4VQz7QCOtt8
         vU0c4xo6LvHw0QfXMGOSMMCqoShbnwBRTpurzMoY4iiJfsy9dgRZuzntR/DBzp3oQjOY
         6jlNMdYKtn/U2V4GyAUK9KhVV1yVr6qHaDCYAVRBCX4q9t0hP32/b5rNedGeagJ5Yqxy
         twqQ==
X-Gm-Message-State: AJIora9alIeuvJOKqqL/Yas1mdwi3FWC2T+4JL4kqmIYDxMZXOYtaq26
	9U9nPTOhNCRU3JGIHc9Dsno+iQ==
X-Google-Smtp-Source: AGRyM1sU5ph9VAiIe6AGSi6LAap/oDu7mn3hKXZ9N7UJZGRMKtpnSCJ9QwX8ZeajR1KS6x66U5I13w==
X-Received: by 2002:a63:4d62:0:b0:41a:49fa:2bd3 with SMTP id n34-20020a634d62000000b0041a49fa2bd3mr6693979pgl.393.1658296107645;
        Tue, 19 Jul 2022 22:48:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t12-20020a170902e84c00b0016a111c83cdsm12955985plg.119.2022.07.19.22.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 22:48:27 -0700 (PDT)
Message-ID: <62d7972b.1c69fb81.3df78.39aa@mx.google.com>
Date: Tue, 19 Jul 2022 22:48:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.19-rc1-58-gad1e2226017a9
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v5.19-rc1-58-gad1e2226017a9)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v5.19-rc1=
-58-gad1e2226017a9)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v5.19-rc1-58-gad1e2226017a9/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v5.19-rc1-58-gad1e2226017a9
Git Commit: ad1e2226017a9e56e242029f834a2cfc14f6fa83
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
