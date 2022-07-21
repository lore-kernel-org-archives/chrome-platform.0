Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2D128EA
	for <chrome-platform@lists.linux.dev>; Thu, 21 Jul 2022 10:02:17 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id o18so1198262pgu.9
        for <chrome-platform@lists.linux.dev>; Thu, 21 Jul 2022 03:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=/KDWxJ/Dz8MYUfuSQLDIiVPiphUBsKYbHbWCf3nKlzM=;
        b=BeyPy0NAqqbZAyQY0gSLY+PnN4h2zZZYYjU+NfCDurVr9jAts+7GzMCJWU5wzNNkoH
         u/xSqs+P1pWjdeOjUhBmUJfpQNCjU3/ReaSBQovxahz8bBly0db29AWfgP2g2S8Ug8yD
         fbUzY3TEhCrb6OK7zXZ8IFH5TSLS8VMkIGnxVVSKgexfy89CkRh0BHqRKUb+lM0+qPNc
         Hq0wMb4qLJ0irBixl2NkqMwCJBUOcBpiLaqztSSPu6JsK6u4k4HNGtpXU4RgRmRq6MD/
         uK81RwECIqBuvfHi762gjQrvVNe9YnQQMfNw8jdssGiruQboH1CjQ+qphplea1lKRAte
         ghSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=/KDWxJ/Dz8MYUfuSQLDIiVPiphUBsKYbHbWCf3nKlzM=;
        b=K1H/hUaj2y/X6Z1RlWqpxKicqKqyqithaI9vRj4Flt/62JFi/oxEZ3RMf8ElHEF792
         JL6SzJlKTWqfGeWbOlHZNcOByXUKFhDuwSClB63c3KTIUuTbGPhafIb11KFEMcfNZeSp
         6KxMa/IMUG+Ru3qLMV0NWN9orPUBE20Z3fbboOO2j/w/qvTXI88jtBu/w3KDHvMV3gwH
         /U7+ErI3Nt5QNX8u6PuJM95EFzNWbTYtZbnle5zXA1OfRhx282XRmZSt36oZmLwrfs3w
         Wo7dy1fNo4mO5pM5oPfI7s4VfLiXhT1C05trB42WqHzInofc81sxuUe0V7Yr9jV2ST+j
         gE1A==
X-Gm-Message-State: AJIora8uI7PtDwdJ+rG5mqytmhacj2WCWXs3oGWW0xd+OLk9Fj7fbuDG
	ydPNrA7DglyfN7JYkzmMOrgJ3w==
X-Google-Smtp-Source: AGRyM1vqTa1qsYK6DnOndgXkkNCCsxnIZSK30J6ve/xMPaMrC+b3zXxOptNOh0Q82kSZ+ukkI8oZNw==
X-Received: by 2002:a63:854a:0:b0:419:64c6:5f9e with SMTP id u71-20020a63854a000000b0041964c65f9emr38855178pgd.139.1658397737347;
        Thu, 21 Jul 2022 03:02:17 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b2-20020a170902650200b0016c0b0fe1c6sm1280264plk.73.2022.07.21.03.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 03:02:16 -0700 (PDT)
Message-ID: <62d92428.1c69fb81.76bb4.1f58@mx.google.com>
Date: Thu, 21 Jul 2022 03:02:16 -0700 (PDT)
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
X-Kernelci-Kernel: v5.19-rc1-60-g088b8107e603
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v5.19-rc1-60-g088b8107e603)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v5.19-rc1=
-60-g088b8107e603)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v5.19-rc1-60-g088b8107e603/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v5.19-rc1-60-g088b8107e603
Git Commit: 088b8107e603c7561ae41ebe65d98d2981d4f122
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
