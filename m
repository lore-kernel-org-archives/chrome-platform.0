Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF57AD22
	for <chrome-platform@lists.linux.dev>; Fri,  7 Apr 2023 20:04:31 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id c18so40801316ple.11
        for <chrome-platform@lists.linux.dev>; Fri, 07 Apr 2023 13:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1680897871; x=1683489871;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9hfmcMyyzqtx9vPUzJ4/jJwBLSWk4Rrkp93B3Fb7590=;
        b=F6DBrCZHqJ23UUHVtdieYiC+631ed5VlMoB64ffrxS17gAlhyE9jk+DADitxMvRZFO
         z2iiU2TWP5b9ERUaMfz9x+ekSmLVBNdktgWyqj1fkjUrA2VDvvZ/jt0kvizf4fwForRx
         TeFRDMicNLktl4q/ZhS4kGASVDOBMtuzwoAXa43/addYJrD2/gB8IEIC0UpIj4WJHF8W
         LQjkG8zI+wO1MJYJ2MX3TgvYATpNTE7hgCZpxl76Qqob6JuT7MgxEgdWaFfpXkpzpbiU
         Vje+bFNXSzdvqC4puUQvyOjQh+NZosGjFg+yWTNNSgftzSeWja+PX7cKpg9Hjp0wEm8Z
         ABzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680897871; x=1683489871;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9hfmcMyyzqtx9vPUzJ4/jJwBLSWk4Rrkp93B3Fb7590=;
        b=o6b7DJOBzPlnmxMF8ctp4b2ziK58z0LBWymkF1SpRdFll27s6XkInqoySSOq8fd37W
         RIkW/grK5JtfDqtp1QL6zCuItODf6LWwjmIrNEBiV/cSanVhCi8/AgZHd2RSJyyX+4nw
         MZ4mYCrq4nH7S4oc3Lh4B3f3wz+Yx/qMrJLUMDMOLpnPM2fMQNlmWlKWZAtdYEzrfiSt
         0cpcLrU9MrDZEgTCcvnNodMTKJ2WHU0fgq4uFoHXzcAWrsIer2nrGSyNI1bxr5djxauv
         4Fk/4fG2iyGZ58aYOOSeozIUcALm3QOKjRIDUqlTIjyPdHP58eSo5OMtIBrWqIL9LmuX
         +eew==
X-Gm-Message-State: AAQBX9cbh7kiXM3FQODvir2j+BgnMbVR+YR7AOLVo+Fa1f1J2LjO6t21
	Szp43JiMs05yNxh5n0FeWHmL/A==
X-Google-Smtp-Source: AKy350YEGJQWm1Pzjh12IndvqD0bANjXLcNkAKxAy7Q3jODKvJ7crolYBX+51xDfbR7OvB1xv5GG5g==
X-Received: by 2002:a17:902:ecc8:b0:1a2:23f7:20f with SMTP id a8-20020a170902ecc800b001a223f7020fmr5135261plh.28.1680897870797;
        Fri, 07 Apr 2023 13:04:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o15-20020a655bcf000000b0050f56964426sm2964904pgr.54.2023.04.07.13.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 13:04:30 -0700 (PDT)
Message-ID: <6430774e.650a0220.d8e65.610c@mx.google.com>
Date: Fri, 07 Apr 2023 13:04:30 -0700 (PDT)
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
X-Kernelci-Kernel: v6.3-rc1-5-gd946c9118047
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.3-rc1-5-gd946c9118047)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.3-rc1-=
5-gd946c9118047)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.3-rc1-5-gd946c9118047/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.3-rc1-5-gd946c9118047
Git Commit: d946c9118047e4338567a98c1b2400859abfbafc
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
