Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A756C17D3
	for <chrome-platform@lists.linux.dev>; Tue,  5 Apr 2022 10:48:39 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id x31so11694905pfh.9
        for <chrome-platform@lists.linux.dev>; Tue, 05 Apr 2022 03:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=AMUydYl0p0BPPRyhri/+Xsk8my4BLNpNJYGVKbe9kPc=;
        b=I/oj5WVrqbHTDYRiEjnxijmri7DJG9Sx7OUxMdr2k9u8uVaSN3lo6yx1Q38zNc2TLD
         5Ny5IuDCwNmubtv4SzTErVusg6EVuQWf8eDfR+zK/7w4oiUqEdsUMKOP72mYZEG4/sk+
         F7a7bY7+tsdQ7VNf7g5rfLCDHyQaAhnflJyeEwVtsYqUtcFkYOKtORxcM2QUJKgnz/C7
         l5ASP/pJlSx8OOpIBG3X7ebMPjnS+blxLR333qLCB5dMbHT2DmGT7z5mfnrHVkboouEO
         uiRt0GGxVOyUHWnxxjve1pgmlMHrX+juJtwxlFdrMT5iQmQrDUcDQFnF8GAWZr2x5RLZ
         5Ntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=AMUydYl0p0BPPRyhri/+Xsk8my4BLNpNJYGVKbe9kPc=;
        b=PaoVFV4s1apwOs0kTedfCIz/VHheJO/fHG4SA/PU4aEpaRsn0OfYyKie/4huo++NoV
         yk65tHNMDVzp/q0cj7c9KmCwDNesYHdG4ApXZMRW2U1vCMZ4SLwSWBnjAElz24AadCgo
         UUZ7rHa6Q2zn3TKFSSd8gVk88+7jOG2jUq/CrvvYxbKjKyaHK3E14W0U1ZrDNF1nAZig
         lxObDf/Qx1iN9hQfOM431ZBp3xG9q+LBTLyDUILC2WpMaCVUZbhgKQ5KXuzRNI2Y/6ss
         uJgWD9FY4LkFa06ZZ97+6+bOyjFflp0eZrUZhImNBB2H5j4pEC/oC7JYlbmf/H1QGO+4
         TGHw==
X-Gm-Message-State: AOAM530zZAniIvgxkTXdX2df/BNyLYgrd/vbRBmEZf38WGJvLZ/qmjd0
	AeyS24sPPaziTbWRQACRCaXEJA==
X-Google-Smtp-Source: ABdhPJxVWJmLXfK2RlAAlzNPJWazF2ZAEEhQY6iMSQkFF+B4Kw8+58cJRs+vN1eHJLZl70bXNBFvTw==
X-Received: by 2002:a05:6a00:a8b:b0:4e1:52db:9e5c with SMTP id b11-20020a056a000a8b00b004e152db9e5cmr3067742pfl.38.1649155719049;
        Tue, 05 Apr 2022 03:48:39 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d16-20020a056a00245000b004f771b48736sm15964045pfj.194.2022.04.05.03.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 03:48:38 -0700 (PDT)
Message-ID: <624c1e86.1c69fb81.351f6.95d8@mx.google.com>
Date: Tue, 05 Apr 2022 03:48:38 -0700 (PDT)
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
X-Kernelci-Kernel: v5.18-rc1-1-gbf84b10d9901d
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v5.18-rc1-1-gbf84b10d9901d)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v5.18-rc1=
-1-gbf84b10d9901d)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v5.18-rc1-1-gbf84b10d9901d/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v5.18-rc1-1-gbf84b10d9901d
Git Commit: bf84b10d9901ded51d33411499079ce64e0c4ae7
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
