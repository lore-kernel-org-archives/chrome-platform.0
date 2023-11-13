Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA6BC131
	for <chrome-platform@lists.linux.dev>; Mon, 13 Nov 2023 04:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="X5bxKnfc"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5a90d6ab962so46133047b3.2
        for <chrome-platform@lists.linux.dev>; Sun, 12 Nov 2023 20:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1699848679; x=1700453479; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NFFkZ4EZQSD1u6M7e8VV04mjzbxYggwsZWGwSNQIQ7I=;
        b=X5bxKnfcHSLLIprWb0q7DRwfQSa5UsIsITt9Nm4DDYtD7VwO3tiUgL1akwOpzpooPI
         fe0cAhL6AdG5hiOnHpLLqXruaBc3yIWh3dO26ONd5wnNraeH2IkXEkQTUd1eHZRm+p2r
         Ekr+kIbzFp8KRWzHs0O+4FlyrIJykGET5b1LZ1dT7JY1F9Orq7tSyWNoU8z9WAatdv2Q
         dYtwzFEbYeovXHZCroARUM4xJqs3APo5XxfZK0KYZkfthCFp3xHKliGnJaMOd4V4LMdV
         973rMZOa1Qbk1hyD+1viLvAhyO5XgHwmBhg1Wh3AhaDAHksmR3u2lkuwA33vqEeIhh6+
         rVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699848679; x=1700453479;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NFFkZ4EZQSD1u6M7e8VV04mjzbxYggwsZWGwSNQIQ7I=;
        b=URZ4o2c5fdCEvEz+U0vfecgWsoRq7togrry1NgE3NgWId1QmhdzUNbKBAcKWu+o13N
         BeehI1XjvCT9x9M/CcFYOufQrdnOehittlRKjWEDNVjPyX+ZhNuwvQo1gFGc6NiloeMO
         6TgHe55rnpMARfrcT7XupaH+UU68cuZ5hE2dWK6c+zO1wdNvLjATY2OpuETvvZ/zO56Q
         Hs4ueGOCXGa2l8Nzqk1DLGOouoRui8L6bttolzQqJ77blwJ+UkAkhx0exiWnEsYgqfF8
         AR/V6hLA+lSBfH5cvZpPz6xuSNJijWTo/ZTl4vCh8m3rGgaTCBJe9m5bXfmD8qeKyCg8
         rIeA==
X-Gm-Message-State: AOJu0YyySQV4a/Qg5Q2O6ibaMMyesymRdIJTqH7S0D1rtHV3STG2gYxE
	BmwE2Dx4uI9unT9OfcK4bMlu6w==
X-Google-Smtp-Source: AGHT+IGMpQh3bfDfBB1K/oJP15WMoYWdCdzpgIfV7B0hIKI+LouZQ5zVVUWrO0RFTYgurA8DQgbp6A==
X-Received: by 2002:a0d:d403:0:b0:5a7:cc02:68b0 with SMTP id w3-20020a0dd403000000b005a7cc0268b0mr5603630ywd.23.1699848678735;
        Sun, 12 Nov 2023 20:11:18 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id i24-20020a056a00225800b006bdc8bb2ed5sm3041869pfu.82.2023.11.12.20.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 20:11:17 -0800 (PST)
Message-ID: <6551a1e5.050a0220.98d66.63f2@mx.google.com>
Date: Sun, 12 Nov 2023 20:11:17 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.7-rc1-1-g49e380795414
X-Kernelci-Report-Type: build
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 2 failed,
 3 passed (v6.7-rc1-1-g49e380795414)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 2 failed, 3 passed (v6.7-rc1-=
1-g49e380795414)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.7-rc1-1-g49e380795414/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.7-rc1-1-g49e380795414
Git Commit: 49e380795414039f7b3bd44c121104f31738dcf1
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/li=
nux.git
Built: 3 unique architectures

Build Failures Detected:

arm64:
    defconfig+arm64-chromebook: (gcc-10) FAIL

x86_64:
    x86_64_defconfig+x86-board: (gcc-10) FAIL

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
defconfig+arm64-chromebook (arm64, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warn=
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
x86_64_defconfig+x86-board (x86_64, gcc-10) =E2=80=94 FAIL, 0 errors, 0 war=
nings, 0 section mismatches

---
For more info write to <info@kernelci.org>
