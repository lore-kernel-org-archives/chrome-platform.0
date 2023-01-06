Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371B07B
	for <chrome-platform@lists.linux.dev>; Fri,  6 Jan 2023 05:03:20 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id n12so482827pjp.1
        for <chrome-platform@lists.linux.dev>; Thu, 05 Jan 2023 21:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PHPqtiKK2MUdK2N5WiYSqHfOCIICmAZmpSIe7UEBOFA=;
        b=3vSxbmj7YkFc5WHv2MAvR0mis8YlUh8rOl8O27enQWa2CBP3WujbP8y9Vos89USypL
         9rWnEvbFgzWtZ8MigkchvEPgESrCCd1GcEyQRWPExzoDklGSWFSC5AbL8x/Bcgzvpr9J
         qB3ev1o6s/1o/OppmPPwEabh6c36v7C+r36FGtUNrzKd1ECPefZeDjP6dYmB8bpb5XYO
         HEexC302waf7pWf0bhs8ykutraS9FNtBGHCPeiPOR95tzdWv12ReluUgXKXUgJhgBAN9
         gKhExNh5ToCQPgNrtRi1MMhbZNFfPcpOtGr7cXWWD/ElD1EQSZIqTXWr//IWYVWBWfUl
         WMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHPqtiKK2MUdK2N5WiYSqHfOCIICmAZmpSIe7UEBOFA=;
        b=MHtSPfS4WJ3Dcg7YpDsnjbwivWWn77+sDtzGdO0q3B3bCj6Uzp2ycpiURNb93wji1+
         w7SXj4TrNxprwuwIleGUoJU6u1/FPeOkMN532tiqbplHQZWc3aeptbwTAJd+9CPWi+ep
         35kMgaUrWFlWjWK9BarBGUYAHuFHBNychzvw9Yc1R0Ty157KgtroMVpn+nb6O+rPHG8d
         QobWwv4gQmYyQvb9Ar8MvCbgEHZtmzf89qhpfEZBZDnE+ZB+M1mqZSft6rpu+EQmgwJ6
         is8u+ISfc3baZOR3yJutdRu8RNZfRCy+HuPZttowaQ/wSVBAlfDbBBTb5WiqucK7LaV7
         7Wow==
X-Gm-Message-State: AFqh2kr5D1uiePexhMJv6tH8dIn63W7b9vDnnHUDrxMXaPgKHt+RBn0S
	l8FuIZdu5pv2v9ZJuN3Wq7OZQGGxQwUIOtCbipmemA==
X-Google-Smtp-Source: AMrXdXvVAQwoQJsB91J0cAPLDNNo22yc9SRjhK7RAmh0PdVP1netCx2YxOUEI6m22I6Yp1gz4WamFA==
X-Received: by 2002:a17:90a:514e:b0:226:ca91:3979 with SMTP id k14-20020a17090a514e00b00226ca913979mr4643462pjm.26.1672981399649;
        Thu, 05 Jan 2023 21:03:19 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id lj12-20020a17090b344c00b002190eabb890sm2087293pjb.25.2023.01.05.21.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 21:03:19 -0800 (PST)
Message-ID: <63b7ab97.170a0220.a833d.3cd7@mx.google.com>
Date: Thu, 05 Jan 2023 21:03:19 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.2-rc1-9-g44ff064f160fc
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.2-rc1-9-g44ff064f160fc)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.2-rc1-=
9-g44ff064f160fc)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.2-rc1-9-g44ff064f160fc/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.2-rc1-9-g44ff064f160fc
Git Commit: 44ff064f160fc66fe5a8b39722eca03bd47c61a2
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
