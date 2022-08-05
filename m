Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DAF7C
	for <chrome-platform@lists.linux.dev>; Fri,  5 Aug 2022 04:03:11 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id q7-20020a17090a7a8700b001f300db8677so1652808pjf.5
        for <chrome-platform@lists.linux.dev>; Thu, 04 Aug 2022 21:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=hhuEQBm+2UG1Va7dh7xmSHG1p7MdBjFAc2Q4dQTQabs=;
        b=piIxrwhqkOdZ+j++zx4XCvUyjWsrLjsnG/TMGzSti7PKGk1zxPTTLvQHEnep4NpYAf
         rsFEvI7FSMyVbtN83lekuXRwvdVtXlgyDKqU5OYmKJs2nvp+XJ6q+/Bzu4oNYi2kHJYG
         dWk+aXB8HwE82ewns3ibH6wVuH6gU9v+djdF4UAedTMC7OuEA1UuJEwvfIsVTA7dUzFL
         sahSOltbJ0szFMHAn9iewRtzsEHWJeu0fQs6L0IquRfFWxBzj7DRE+1HSGqbnDwnhiqF
         w8fRLht1ysoxJsqcbogooBXI9N7g0jAYtIe4k5M77HbxGS/IOWJrfi+biVykiTK05LoT
         6wPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=hhuEQBm+2UG1Va7dh7xmSHG1p7MdBjFAc2Q4dQTQabs=;
        b=kOX3jkfGgZFa1dFmbb/9/LhYoNlnIviInH2uv78odpQTYy6FVzuObfM+tDqTEAOgDx
         yAVi10W1HLcbNlzEaHd7ayR/BKlxfoOmMMM+Ixzq6BwaBLwju+p9lr0YgpQJYef5i2tp
         DkIHqi+WD089WY/eYlWncrVjLmtyKWGsywvKvcpov1tCDeWV5s7WGlsAQkbkSnMx8vfx
         WPI6zSapVsR1wGuE8Y5f1lGbXhxDefs2v/Vv+Kr1C7rwcjE+CyaUKxS9gM48xxYvUnqW
         Jf7Mqc60j5ShjEFJaG6z1CLCLBQp2OGd2reJqZafTAon1M2uhqRjR3FdMeEwKOqVgAXc
         t5rg==
X-Gm-Message-State: ACgBeo08wOomYDays0HQlFl/kDBdK7kaFMyeB9NM1ZuHJtHUVz13GKdY
	7dwLppv9NyxLIIS7CXMStYficw==
X-Google-Smtp-Source: AA6agR47ZmpVo7ZXjohwLBFgHKWspgusywF5m17ztgxJ/KbcFx43F1dAwBvdAeoSkKBoKyO7s41s8w==
X-Received: by 2002:a17:90b:4f47:b0:1f5:6919:8868 with SMTP id pj7-20020a17090b4f4700b001f569198868mr5433119pjb.131.1659672190893;
        Thu, 04 Aug 2022 21:03:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 5-20020a620605000000b0052ad6d627a6sm1759925pfg.166.2022.08.04.21.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 21:03:10 -0700 (PDT)
Message-ID: <62ec967e.620a0220.84837.3b9a@mx.google.com>
Date: Thu, 04 Aug 2022 21:03:10 -0700 (PDT)
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
X-Kernelci-Kernel: tag-chrome-platform-for-v5.20-2-gddffaa3d76750
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (tag-chrome-platform-for-v5.20-2-gddffaa3d76750)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (tag-chrom=
e-platform-for-v5.20-2-gddffaa3d76750)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/tag-chrome-platform-for-v5.20-2-gddffaa3d76750/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: tag-chrome-platform-for-v5.20-2-gddffaa3d76750
Git Commit: ddffaa3d76750278e5a0804fa173b3c8c16ff42a
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
