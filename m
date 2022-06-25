Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD537C
	for <chrome-platform@lists.linux.dev>; Sat, 25 Jun 2022 13:37:16 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id 128so4912540pfv.12
        for <chrome-platform@lists.linux.dev>; Sat, 25 Jun 2022 06:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=60P1DPg6O3zZiyzUO3Z2f7cEpznax49jY+Mn+S8DUmA=;
        b=aVYU+9MoVs9MJQVs2DdT0eUdajQzSS5LzV4FqhcCxoIbcFCEZQnS/ubXv9aBITP8T5
         4yz6zTaD0N1vg89MgV/cecAIXJ38RK9kOMibDxcy/zup2nORFe7alOaaD/tvrJFFAF7L
         /+NnRea2yaRX+ji3ru1Q05xemZP64Ia04DSgUFT0KgEw2hc9/9/95IINhcFG1F+ssmtP
         CMOshGzE3gnSQllPWX3EY+a8vzCJpDbsn3v7KJCXIxAbQ/JcGgmj3Md8uP6PkRRWtk5h
         GcGD5JUJ6yB+FtwIfanodO3bHpRtSPC6unTt2kBgMqKgntEVRhKoU+zLO/XNaiu8OLeE
         mZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=60P1DPg6O3zZiyzUO3Z2f7cEpznax49jY+Mn+S8DUmA=;
        b=5gb8TkwK2zn41DMoaKYX0e4J3n/qtxOpR/ir+D0AhfErz+NLTT9ARWJJMiVvG3/EiP
         saTb+je4ukcvYUqfArVWPEPqjRtuTEn6FHyLLxHXuMgsSXZHgs8KkcxC/DsnwgY5SVHd
         iIfY0yQ7H0r8qx1uv4n+Cn7Yei/SoE07fkwSxLcGQshPLL1r3mkzLUZ7Nzktn66mggSl
         hvKsYgaTf4b3iD1MdOGJxdAH4jyFYgJXuU6JIcfYvIrnpiQajzI6dSMvvwqjYevMsE+u
         lkUGPgx6js6VoIG0fVLmk8KcR1HP/OLGEr94W5Al/SrG6U7hD8IK6fxmuwZsWQQiWfbL
         /fjA==
X-Gm-Message-State: AJIora+p/lrz+PF6WNIvAe37HRdA9itMd1+MVrBEwn5yNdZOdkSyOtw8
	euUZN+mp3Es8U/DM/0FYSWIUXw==
X-Google-Smtp-Source: AGRyM1v9jaB3XA5k+y3zCNDK8gk1ovQ5bvo2fpNdCyGynOKRdclpJqI1jSRUxOPRKlv3iwHUkvD2SQ==
X-Received: by 2002:a63:340d:0:b0:40c:f9c1:c82e with SMTP id b13-20020a63340d000000b0040cf9c1c82emr3756347pga.251.1656164235888;
        Sat, 25 Jun 2022 06:37:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id iz18-20020a170902ef9200b0016a7d9e6548sm557556plb.262.2022.06.25.06.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jun 2022 06:37:15 -0700 (PDT)
Message-ID: <62b70f8b.1c69fb81.e4b55.0945@mx.google.com>
Date: Sat, 25 Jun 2022 06:37:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.19-rc1-38-g15288cf9f149
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v5.19-rc1-38-g15288cf9f149)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v5.19-rc1=
-38-g15288cf9f149)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v5.19-rc1-38-g15288cf9f149/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v5.19-rc1-38-g15288cf9f149
Git Commit: 15288cf9f149a0264eddd61c0af5d5dd9aad34d9
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
