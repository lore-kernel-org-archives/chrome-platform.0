Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CC515A2
	for <chrome-platform@lists.linux.dev>; Wed, 11 May 2022 00:17:29 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id s16so362432pgs.3
        for <chrome-platform@lists.linux.dev>; Tue, 10 May 2022 17:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Pu0XOt3md/+QHEH0odz8Kb0LzaQgmlJPQFA+XbLmYmo=;
        b=xEHd0bCmbHMX0QcYw1sdvKSceoNVlMU53emfH1LNRlXY+LWZMOhwmYaSgTENMkW7Kx
         ax1MeUOkiz2ygLCyUH3CZhNg1fAUrCJIdb5ynTvt0DcmlOZ3aPn+xMOIPsmNsA/LqT52
         /3xPNsbt0Bwl2m2eGWUvMWGL9dv73iX+qtoGyksCFOVaY0A/fHVinX/FR2kzT2OStmuo
         1h8rX3cQSgu+YHl9zVW2Ykyo7cG1I2J4zfGAFx/93jFXpLHH5EdwBrS0oefLo7CI0aIn
         ugmBboWrArwifWJ3bpv4VtuszvgCMkJ2NGuKGj9SDhRBMaW4aTCzZGh03Quw7Z26IirU
         3rmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Pu0XOt3md/+QHEH0odz8Kb0LzaQgmlJPQFA+XbLmYmo=;
        b=bAt9smXFRlqkEj3/E+dw9M6SvJIhe8HLQxbyVb9Uc4zRAZrLyY1rP1HZ6RQ3dpkmp4
         nXTIDV7k1FDwoxdp2Xz0E2CGFUSSMddYyw/JO0jDPPSwGpvZqdYQwMM+a+1DTufXqw3K
         uNdEulI7Yc8Ua+6HndIX4CnrD1KjghqI7Fo4USZyTWplV3lEsoaNprXWXKtEC2KkZVRL
         Cf345j/uYNyTfqHGC+4Dy2OXRGU8BRnI+VF4FkjYRbQVzrYZBHy4y7JBK7bG+PZ2RPWF
         wUd2j1MVGwgVM0SQo6A/eGE46tIEJxFVk8raOXBHRlPTVlzdStZDKukZZnH5Gu9drP7e
         Ktag==
X-Gm-Message-State: AOAM5335sgojah8B8Gu26jOfPNMWy+mMswh0NVHoCSmpXwmmyAB1YMLP
	3hNonowxAH2APqdlG9SyEqRsvQ==
X-Google-Smtp-Source: ABdhPJyNngUd3085y3JMPqVlFhv4zijQiT/tXlEslGRZGVPOcN73JGL754IQM5DxjqX5kwxVOYXqww==
X-Received: by 2002:a65:52cb:0:b0:3c6:82f4:a01 with SMTP id z11-20020a6552cb000000b003c682f40a01mr14143453pgp.282.1652228249014;
        Tue, 10 May 2022 17:17:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d14-20020a621d0e000000b0050dc76281b0sm131501pfd.138.2022.05.10.17.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 17:17:28 -0700 (PDT)
Message-ID: <627b0098.1c69fb81.a4864.07d5@mx.google.com>
Date: Tue, 10 May 2022 17:17:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Kernel: v5.18-rc1-10-gecc9e81aff49
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v5.18-rc1-10-gecc9e81aff49)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v5.18-rc1=
-10-gecc9e81aff49)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v5.18-rc1-10-gecc9e81aff49/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v5.18-rc1-10-gecc9e81aff49
Git Commit: ecc9e81aff497d77e77430ac0ed1fa9ee1142a49
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
