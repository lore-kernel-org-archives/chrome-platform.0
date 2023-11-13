Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C72F9E0
	for <chrome-platform@lists.linux.dev>; Mon, 13 Nov 2023 04:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="qYj6jblA"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1cc3542e328so27822395ad.1
        for <chrome-platform@lists.linux.dev>; Sun, 12 Nov 2023 20:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1699848852; x=1700453652; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X4/bE+/C5fulgVbsVAq3AO2aT663zzXN1COxl/JGefU=;
        b=qYj6jblAoiJnfykHDBra+Z75WxvvW8oVOfgT8/IQ8PeN9MCmv+3zyhtbr8FaVGGbQU
         t5jpjlZFZgu2PAIMvk/+CkjVBmYI1XGCp5GoX6pWkDeTJ096yl76usvg4gYS5ABQ7DCn
         3uYGZfehOe6DCLvsf7I/p2QBhKIACb5MWQvUDigT3vyVFUtB9ilVLhEaIkhp8iYwSKHR
         ZfPv2GCM7hAdUOuyU88tBgdagyAybtppcnQhfamkGdzWHj2lswJpxr+sgnpUaN8S5JMX
         xnnDyqfySHBFP1hYxXsK9wypejflqvYRnUqgupoRO+sO3Iya8kQss1KWIX7PqKzCDRjt
         JRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699848852; x=1700453652;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4/bE+/C5fulgVbsVAq3AO2aT663zzXN1COxl/JGefU=;
        b=K52pIhrXG7IhWJhiGa66kt9SXCBNUcmo2vrQ2MGbmBkFmDfGDszwtnrSS1VsSiDvYp
         JDS7BUNiK9xwAS2EWJLzon62un9ggNZAOFdriqLIIEjOaWzNM3PkDDNvN/j0DYrWK0U5
         +Qe8gmR7WEllLVcsUMtMtR9ZocnceZ1mnBuwVwrUvcl9gNM+CNHYtHb8RrmM35Wx0bsZ
         gNX4oPJA+SoZe8btzhW8v1XsMnOszlJWtMDpCF45RFSnFLutfW8vpbRXx7ngHXwl2NgP
         gE/rn1u6/WbH2Z/NVd0P3Uvh/D6RTIZVxCyKVrMd/aV8jiz0mwyO+RCW6CfgLZnuG61E
         HdQQ==
X-Gm-Message-State: AOJu0YxuzoKduNOQyjyOQZAUV3BiXxhNF4TlvEFk3GpLv/WG9BjuMxwA
	dmPLYNlXgmKc9qVox3OYlqY1yw==
X-Google-Smtp-Source: AGHT+IHCSc/7jzIuxCPSVg2qiR06e7If5q35cj7xPdxbVLM9RzpkV1Lgbidcr14Sp5oNnsWsBBOzjQ==
X-Received: by 2002:a17:902:e892:b0:1cc:dade:2789 with SMTP id w18-20020a170902e89200b001ccdade2789mr4711019plg.20.1699848852490;
        Sun, 12 Nov 2023 20:14:12 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id e6-20020a17090301c600b001c61df93afdsm3216396plh.59.2023.11.12.20.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 20:14:11 -0800 (PST)
Message-ID: <6551a293.170a0220.4d46.68a1@mx.google.com>
Date: Sun, 12 Nov 2023 20:14:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.7-rc1-1-gecea08916418
X-Kernelci-Report-Type: build
X-Kernelci-Branch: for-firmware-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-firmware-kernelci build: 5 builds: 2 failed,
 3 passed (v6.7-rc1-1-gecea08916418)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-firmware-kernelci build: 5 builds: 2 failed, 3 passed (=
v6.7-rc1-1-gecea08916418)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-f=
irmware-kernelci/kernel/v6.7-rc1-1-gecea08916418/

Tree: chrome-platform
Branch: for-firmware-kernelci
Git Describe: v6.7-rc1-1-gecea08916418
Git Commit: ecea08916418a94f99f89c543303877cb6e08a11
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
