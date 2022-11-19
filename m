Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEEA630
	for <chrome-platform@lists.linux.dev>; Sat, 19 Nov 2022 07:59:26 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id k15so6991957pfg.2
        for <chrome-platform@lists.linux.dev>; Fri, 18 Nov 2022 23:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XjwgzjuQZE8mAeGC78Q0jrYrf/3ENwZn1dsQ2AVX7NQ=;
        b=uOl9cjwE+vmEYmH/qCbFTEDuWlbU1drlsIU4nCkZBjGbYSkgSdt3C9EenvGHZXqbZY
         m9JPn7axbSxNSDYxWXZUrWMrLmuc3C5Ga8eP3G/EGBz6BvdbWmzumR4Nc7AiAUlIqKJw
         HgnhkS+MdSc2CWc3CGuBvxQdSzbETlEW4F+ekL4YxFCwta8uwiuvad4avX+on0eUnKkK
         Jn4iZibZi4CqcwWO/hfO0nX4Z2SORBapfViejZehGnqN6/3jz/8EAA6n51NHK5d1ADBJ
         lNWGHGaA9g50+iFqZYJrQLy4LkYvfnqLxG6j2Z+bMXs3HTWmiqlcpMfKdlBaFQlEDuen
         bufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjwgzjuQZE8mAeGC78Q0jrYrf/3ENwZn1dsQ2AVX7NQ=;
        b=JwLGp6x07eaREtPiYbq/XZfNHV+7fhYlXwLEBDUwVtIekRFcZmeKk4nMOViOMw9m+m
         ttuG72M8auzUh2+T4vNx8IaC6lwEh9j77/tUbu9KwPMb8l07vSgpG+jYq7Vpw1Ku6FvT
         n2cdQxCUe5DAmR8CJ6BAcjk9NYaVibMXlGNJXuevdp7v2MJ/F5S1+t7Ux+LhqB3Rm9ni
         mkcw3UDp9Iz0KqfPPxwgod7NIc8pw9V/wSI2C59Dc0sHP3TetpcOs2mkeZe6CS9BcTI2
         qs/CmrDX3iSg6Z8jXl7XxDdrFDy9bZKZR7RFEQ0ycypsm4vLeORadDRSd2MTGHQXbv2o
         inOg==
X-Gm-Message-State: ANoB5pn2Z3QI9qscy0kIwUFwXJDlXj95yzt1ryx+PhTmBmImkNmQIBWj
	pbPlePxTgCMrWwhWAF4NShG48w==
X-Google-Smtp-Source: AA0mqf4IcsrJVIV8Xl9Ipvn/N0n6+RHrj4pHH5E1M5+S5uO/RsgpfGMsm/QUnrOIJF4k1L/ZqLNWiw==
X-Received: by 2002:a63:155e:0:b0:476:95a8:de91 with SMTP id 30-20020a63155e000000b0047695a8de91mr9797159pgv.102.1668844765822;
        Fri, 18 Nov 2022 23:59:25 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q19-20020a170903205300b00183c6784704sm786590pla.291.2022.11.18.23.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 23:59:25 -0800 (PST)
Message-ID: <63788cdd.170a0220.832dc.1199@mx.google.com>
Date: Fri, 18 Nov 2022 23:59:25 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-kernelci
X-Kernelci-Kernel: v6.1-rc1-14-geba771858c2d
X-Kernelci-Report-Type: build
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.1-rc1-14-geba771858c2d)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.1-rc1-=
14-geba771858c2d)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.1-rc1-14-geba771858c2d/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.1-rc1-14-geba771858c2d
Git Commit: eba771858c2d4ae4c3ab4546174072195578ac3f
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
