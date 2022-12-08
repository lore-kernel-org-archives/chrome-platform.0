Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFC062C
	for <chrome-platform@lists.linux.dev>; Thu,  8 Dec 2022 03:05:31 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id d82so214928pfd.11
        for <chrome-platform@lists.linux.dev>; Wed, 07 Dec 2022 19:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g1SevoKdfSxrB9zf09Z3dJonc+0z1iOvlE85K1R19zM=;
        b=Db09OM2pquE+v1qn4tFcrqM+VH6JmDjR1r4Fcm2pwzboNUOQ/jwpX5Jf09eXUu1VRf
         ikfQLCqmMDSpXgChB6ArEu33jfBLICIhzoFgfuMp9CfIfP6Ldf3/U15fYRwGsYwscpa7
         Y9Ahp7as63+buw3v4NeCjIWHHY9ycZk20Qu8N4xN1zGaE9n2T4SrV/ITl66xDKN/L/mK
         o40ueqa+x1SFYdrgSop0DJ9Q8x3APb6O3v8ZeMuZh6dAj5qBRnOcPt3xpSe3aKtRqkCK
         BIrMtUOdb2L7YiLyVDK+rcMwkzS1RLtgZB+nD/5APJefYfoUoSW2EzzQu5b/z6avF+LI
         VZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1SevoKdfSxrB9zf09Z3dJonc+0z1iOvlE85K1R19zM=;
        b=u3A19mwQHX29+TEQVI+V4l4MevOPVRXb6eftF5u+E7jBrFB1u+X9uC+tpL0OHSNWD+
         l4siJPIzufaVHFivX9ivlojL1loXLyzMOpUXbQYLrwKVpsQgZeDeGLeiky59h1H8TpTD
         BzTJA5IgipSaGm+IK3t69H1NLMempdOG14QDNqAIW03qMqDW6Mi30psCRDSAt5bU6UEu
         gXZZANr+v0tRGRoKSNjC0j0PKwNyo/nwN2Ozt3o4R5755mVTrVNE+HHFIpOKKoLUHahs
         8DkiliPwieI8cvWgLFoc8qwIXddQql1Mv8qB6/Lyb9P+dTQLS7v0cn6DnXDtLsp2npHW
         c3vA==
X-Gm-Message-State: ANoB5pmfpxGbv/XaPFuzg/XTta1x07PlL+yxiqtDChvdqBdz2xkhELg2
	1/PKn9uarFjhRi/iaYoDRiEwbg==
X-Google-Smtp-Source: AA0mqf4wOyci42kx9fHhmCoVV84rZIWmEnKGBOYgJLuv3cmYhnyAA2Zxb61P03yBWQaeaHOeZfn9FA==
X-Received: by 2002:a05:6a00:26e1:b0:576:84ae:59a with SMTP id p33-20020a056a0026e100b0057684ae059amr1052268pfw.3.1670468730757;
        Wed, 07 Dec 2022 19:05:30 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y69-20020a62ce48000000b00571bdf45888sm10684288pfg.154.2022.12.07.19.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 19:05:30 -0800 (PST)
Message-ID: <6391547a.620a0220.1455f.4ffb@mx.google.com>
Date: Wed, 07 Dec 2022 19:05:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-kernelci
X-Kernelci-Kernel: tag-chrome-platform-for-v6.2-2-g5990db2d66b3
X-Kernelci-Report-Type: build
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (tag-chrome-platform-for-v6.2-2-g5990db2d66b3)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (tag-chrom=
e-platform-for-v6.2-2-g5990db2d66b3)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/tag-chrome-platform-for-v6.2-2-g5990db2d66b3/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: tag-chrome-platform-for-v6.2-2-g5990db2d66b3
Git Commit: 5990db2d66b3445e885affcd284301fd2cc14ecd
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
