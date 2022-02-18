Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D0D4C9A
	for <chrome-platform@lists.linux.dev>; Fri, 18 Feb 2022 22:28:30 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id q11-20020a17090a304b00b001b94d25eaecso9799746pjl.4
        for <chrome-platform@lists.linux.dev>; Fri, 18 Feb 2022 14:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HZJd4oiQOg0OXo4RIHlf4tu/trbhsDzDz/Vrc/Pqlls=;
        b=QHlw7XtL+gm6UHmklEd/2XdW8tBp/8ZxviGcaY0V4/24SJ52nyuRYpq+sBytw/zv8r
         DvcJmlukGM1W+IBucEgMBHTGpDoUG/XkjRJXXKKFRL574QFgeBrRziRdPySwnatq56FK
         7VNgLt74wgqD+8EBEtpvxn3iHvIGG5JsdPfOT7eX1qg8jPCGBCOSqK4HwEKjgihIqPay
         WeUG7U7dJMhsu2Mi4svR/pGgU7wymAf8WdT99E3YQTDg0fMXYtkJ8IGwy8Fabtpw3Xte
         cEdyPlwexgp1MurS+43QzNRvZVsU0LKv+c4Z4mOHgUeVFwcSaucRjUUC+fruqoQTZ294
         n+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HZJd4oiQOg0OXo4RIHlf4tu/trbhsDzDz/Vrc/Pqlls=;
        b=ch8gmIbzBMSyDE2Wb5npmnBIYtL+ermJmD/tcOjLOt9F6p8bJhGH2IFkbdBooUm+z5
         ZvRlRJinyacMXbJ9HAiBHAznE5zjvRWAWEi21b/IdADl8JaVOkKW8SuQ97A1riOMTI3l
         NTtshMc/Z3bh5AI26NYTcDs9ZKplIL6050xzcLd2pNIcTnlSzrAHDNjl8qE4JE9Pl2Yz
         PJBSir7EKyNfVsXj1nxZfHMyriIqjXbN2gVpLeTdBDHt2CApnEkW6U56HNwIw3sHwNYG
         6qm4ctQiV7+NPdzuVS7havrf1JaOopaESeDJQyRcLI6KAJT9qTjhojdsFRLDWmtaN//M
         z6sg==
X-Gm-Message-State: AOAM531bT/rPkpAhEcT+k/Ppw4I/VIbSoIG+1mmt6DIbFxtMUd1nyYsW
	EWZRr804Kl1/akarAG72+ovpww==
X-Google-Smtp-Source: ABdhPJzQzDdix9W3jatiSDcm7BGvjhDW1mcoa4iVoJL7Nu0OtpHyLIPqB6W2i3iLT4vBPZO9TFTDUg==
X-Received: by 2002:a17:902:e551:b0:14f:1636:b2c2 with SMTP id n17-20020a170902e55100b0014f1636b2c2mr9181499plf.65.1645223310000;
        Fri, 18 Feb 2022 14:28:30 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f16sm4068848pfe.52.2022.02.18.14.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 14:28:29 -0800 (PST)
Message-ID: <62101d8d.1c69fb81.2d58d.c237@mx.google.com>
Date: Fri, 18 Feb 2022 14:28:29 -0800 (PST)
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
X-Kernelci-Kernel: v5.17-rc1-10-g0ef49b25b7cc
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v5.17-rc1-10-g0ef49b25b7cc)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v5.17-rc1=
-10-g0ef49b25b7cc)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v5.17-rc1-10-g0ef49b25b7cc/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v5.17-rc1-10-g0ef49b25b7cc
Git Commit: 0ef49b25b7ccd4b0c97b043bea3da976784044c7
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
