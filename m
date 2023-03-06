Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D576919B
	for <chrome-platform@lists.linux.dev>; Mon,  6 Mar 2023 11:14:30 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id i5so9898586pla.2
        for <chrome-platform@lists.linux.dev>; Mon, 06 Mar 2023 03:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678101270;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rqYbIJZKSZE6CCwp5UxxekaJdVKQ7PWPbA39iCgqDIs=;
        b=wKPmeipWWKSm/Bb1IdoANfgGav0Yj6+1k8AqC+sEFY2vigiXoJClHq2mPXokSeqwyp
         C2/f8RKrShHkInMnRUeejDArhA3phz2veldcFnsCdE4cZiSB8QWDA8wOBxgSsK8IgMh8
         DOE05Hmq1dzNNgzlBvc+jcvAoLVHoIQLxSk6N330noiT/UvsQxhmfWlzVMrqzG1KctZr
         qh/GVYrls5fOU19H7gN1B8xt3mNeDsdN0DQXb01EDOVzaEaMAAFF85nPeuE/jaFJyBWw
         pbDnzWnMsEWJ5g9HfndXv6C/1MCWvkp9k/R3SMl6/NoY35p1iPD9JWdoEHpcoieStGB4
         Zs8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678101270;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rqYbIJZKSZE6CCwp5UxxekaJdVKQ7PWPbA39iCgqDIs=;
        b=5URNDrpDSltIeYvuNJhGgHW/MSqu3KabZ7CxpABiuuVGukJ6Ws029chCk+aa3q7cb2
         OsK+AWk1IcV5lKgpcoRxWPhd56Te/HHx9Vt3vwAWBJdCN+OGpq+6SdG4nKfceCYYa08a
         CQoNUDtUUt83yWrGX/ffyRTG6IBkFHE8FDRiT5oHep++oe6uyAIdgl6hCftXXhTKVvLk
         PvQNJpJgbZyKuv1oPi6WURF4CiakVQewr8DmczUHcxhKLSJceX+BAn1mwaM0hAfxAwYU
         IOH29NAQJAyIxocDprek8oq5K51wLV7qKRYPhmgjWtIgFtjKvOBtahkNfdTWC5e3nD+/
         Zw4Q==
X-Gm-Message-State: AO0yUKWckd8Cezic1U6rfcCZZ+eG5MnY+ZWyK0FBMvZqdsyvazSJGqbA
	g7rcMfM9XkB094ZxERh0bIfdTA==
X-Google-Smtp-Source: AK7set+/Ymqoam8Tu+jX5mO47NxvrMN08lhvt8MieJk+JdZf4UqFpqEGn8pvNhBCdgcrGmTme4IT/w==
X-Received: by 2002:a17:902:ce90:b0:198:9e29:cc4f with SMTP id f16-20020a170902ce9000b001989e29cc4fmr13395597plg.43.1678101270060;
        Mon, 06 Mar 2023 03:14:30 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f2-20020a17090274c200b0019b0b6a1d5bsm6434184plt.273.2023.03.06.03.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 03:14:29 -0800 (PST)
Message-ID: <6405cb15.170a0220.38001.b0be@mx.google.com>
Date: Mon, 06 Mar 2023 03:14:29 -0800 (PST)
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
X-Kernelci-Kernel: v6.3-rc1-1-g18cc5124a241
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.3-rc1-1-g18cc5124a241)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.3-rc1-=
1-g18cc5124a241)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.3-rc1-1-g18cc5124a241/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.3-rc1-1-g18cc5124a241
Git Commit: 18cc5124a2417b94cb8402963c67b492210b3d38
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
