Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D675189BF
	for <chrome-platform@lists.linux.dev>; Wed,  7 Sep 2022 19:04:41 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id jm11so15475023plb.13
        for <chrome-platform@lists.linux.dev>; Wed, 07 Sep 2022 12:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=bZMpYBmDM0diHa4jtWwS7eC85PU6gCvJaenoC5LEoGs=;
        b=eKzoMclMT2ZU96e2SVO1AUHs7JeloxNxXig4Z6OtWiXAVhCeGNP4+4t3MrFSkZCuX9
         VGy6I3C0knwbtPHH9yy/FDuSCflHK6ujxpI8+Hb/p9gl2YTMA+E/AVgDyGCPKdOca1Ro
         F1e6AIVEjW6E7ZzopMmnhNKmb/Dj1SmubQBf049Dwvlb656t6Ue68eL+y9GZdrEhc0ex
         tXce69BiDkUG00UF1RlP7Tov7VlmJOyjroQMa9Bc7hdPiWtTMuxGlEoJCcb/9FhPkrC5
         dr3C7wAo9PICYulTe03uCcAsP+P6go1rFV26SCDd+plF7OJbBs9oXSnOxgngGLx3onzJ
         AvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=bZMpYBmDM0diHa4jtWwS7eC85PU6gCvJaenoC5LEoGs=;
        b=By8u/HgwgLa971gQqnnWxrCe62h8ky4jU9ywBigOayUUydnna2yNsJ6VdMBp0dh4ng
         hkTPTJN4Cph6YoK5GSgyVd4wgifgZn60zxInVdnh6B2Q/fwoHYH25+pgfo2P9qR/EOZg
         y7gmv9+yyztUqzKZ/bQKeeF3LjK1GPGqFjTG4dk1pUWHZZ3iX2Aibxlb8h5ufEualMjj
         rpKRb0VsZqXZgFdll7EBeImvxbGaiCchsAhpLqaGqAOBnV4LDB+P3uJZJZ6SNHIVUIbM
         IJCUmyvUD/d8z/ML88iiMmsVwJA5mPM7r0mnDaAhUuJ/2u4gAlQGnpsSGh2MZq717KgV
         fe5w==
X-Gm-Message-State: ACgBeo3eeaSbsIlMWJ0TzF1PEUvm5B36PUnJPpTPo/c9yg+qfam9cUGd
	aBbBk/arJ7hVrKNzNsMuhznAeg==
X-Google-Smtp-Source: AA6agR4Odf0Rgka1iX/rozwSGLbXn5ZlpcxRJRkT2oCt37lN3EyS4owO8y6dG0eDCe3qE1mMG5cnOw==
X-Received: by 2002:a17:902:8603:b0:175:5d74:757f with SMTP id f3-20020a170902860300b001755d74757fmr5403106plo.99.1662577480524;
        Wed, 07 Sep 2022 12:04:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h2-20020a17090a130200b002006f15ad4fsm6173373pja.10.2022.09.07.12.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 12:04:40 -0700 (PDT)
Message-ID: <6318eb48.170a0220.80707.9d7f@mx.google.com>
Date: Wed, 07 Sep 2022 12:04:40 -0700 (PDT)
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
X-Kernelci-Kernel: v6.0-rc1-19-gd378c6f0456c
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.0-rc1-19-gd378c6f0456c)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.0-rc1-=
19-gd378c6f0456c)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.0-rc1-19-gd378c6f0456c/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.0-rc1-19-gd378c6f0456c
Git Commit: d378c6f0456c101563fdac68c11e64c3a00ad3c2
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
