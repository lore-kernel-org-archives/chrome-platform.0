Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BAE1A70E
	for <chrome-platform@lists.linux.dev>; Fri, 15 Dec 2023 09:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="CubH0RR3"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3b9f8c9307dso433530b6e.0
        for <chrome-platform@lists.linux.dev>; Fri, 15 Dec 2023 01:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702631539; x=1703236339; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LnugKKgqhcz166yKzH23meFi0hvV/M1CDwNlnT456fY=;
        b=CubH0RR3fQHB8glIaopT8vZNBEr7crN70zXOwGSt1mH4OfdRAGUPqgp2cmfVg68jum
         XXDefiVr6X7OKdhre2/A+u+eJh9grkADad3oqpZqYOPvsi9nQB999weNsy88I0olqP+3
         snq+Sxu+ZBWUHJgksIjnfo5JyFTwvLAAsntvC/cQLNbz305kgvsj5Vsf+oQjJxe2pF0s
         mIR3O3qbdUXz1L+3mS+Cqzk+84R4ld3rgewQ9ixQX+I+Ahm38dWdsPpI0JZYf7XI960q
         N+iQhuE3d1r0a1weQ0XUP+hC+99EqlLTrG3eg8QFfLZnz7KUz31LzJIHyhIERqCTPmj8
         KPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702631539; x=1703236339;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LnugKKgqhcz166yKzH23meFi0hvV/M1CDwNlnT456fY=;
        b=ms/jzAdPPJWHC85wEKU706YNcbSfhkwlmoCc0cOVEQTf2l+bs/2p5rCvVG14cJl4ca
         mRWHCZsSjYq50pOWfau/uszos0S+07WDa6iQP338nkhVugu8TOBjfcAW3OadXp/VlDxF
         bxBNj3MRHPFCANxxg4SYH1Cn7lJOKOlYgmLFViynjyjKTJ5yIKf2A/wVpRtSw+/qzwOh
         NH+ATvMLIEn6BWw84Zc3kH0BwuChNAWrYtxkrCh8cv2SnFpK7E+o0/NoJL55Nf97cJWt
         LazEZZ9nJPUwVOQqo51bORcemrmlVENQcjmp43xT0/ekrhrqyP/51KGtDWem8F8bPqc9
         Wmxg==
X-Gm-Message-State: AOJu0YwDkRWsK1KWlOhrvCbJRn8Ny5GKO3j9KY0Urtc4mX2n7GQo2b7+
	VUYfbpXJxQjcZjuVCuyXOfCgmw==
X-Google-Smtp-Source: AGHT+IHEk7C4jj2RbDnzXqINfreQ+Vk/vfYUJgB/pj1f90vQdas1+I/2S5DXYTAN75W8/YOnZlGpUg==
X-Received: by 2002:a05:6808:3309:b0:3ba:231:cd4c with SMTP id ca9-20020a056808330900b003ba0231cd4cmr15545295oib.40.1702631539555;
        Fri, 15 Dec 2023 01:12:19 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id y33-20020a056a00182100b006cc02a6d18asm13116359pfa.61.2023.12.15.01.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 01:12:19 -0800 (PST)
Message-ID: <657c1873.050a0220.60e47.976c@mx.google.com>
Date: Fri, 15 Dec 2023 01:12:19 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc1-3-g59a9ccf19ee03
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.7-rc1-3-g59a9ccf19ee03)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.7-rc1-=
3-g59a9ccf19ee03)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.7-rc1-3-g59a9ccf19ee03/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.7-rc1-3-g59a9ccf19ee03
Git Commit: 59a9ccf19ee03179faf047822bbec76cac7467a4
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
x86_64_defconfig+x86-board (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---
For more info write to <info@kernelci.org>
