Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1621EAD59
	for <chrome-platform@lists.linux.dev>; Tue,  7 Mar 2023 16:20:06 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id 6-20020a17090a190600b00237c5b6ecd7so17021558pjg.4
        for <chrome-platform@lists.linux.dev>; Tue, 07 Mar 2023 08:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678206006;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/E2VcvrCi3URrQtcinQ5FzjK9f68dOGtTWUjTpHdqs=;
        b=VzUS5AmQesozkG2+0x5+O58ZDMMs6h9iH57abpB2GztVfXpEebzvLAnCfZvRC6MxgO
         hcXXCaRcE7guOehVtZlX7irxZ8fbpC5DeIrCuEVJWchqD4WI3WcIA0rTfVKoeinpsIer
         GhnSrcUF+GGZVijDmz2R9PNNeChWKxAyhE5zvW00HAb57AJM4Q7rj4QgbR1Bu9YBBlF3
         AbmzcCjUIf5i5rVO43IXoFVhw1C4eOjzObWK0eu0rIMNYYntIew9V96XRtnHkxtXEl2o
         FkBVEiNURNXZ9udlC1aVT54kTpqVZXnKRLSU7Z5CBquTRte96YuslnD9K/xGuOz5iB9o
         hDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678206006;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/E2VcvrCi3URrQtcinQ5FzjK9f68dOGtTWUjTpHdqs=;
        b=oq1QCd3OoEGjdSekErLgicQyCxX3ng0xw8Xnw4ealmsAnCqGhvaoyiP5Zi9HpMblT+
         Ff3IaFBC+iy3eNfd01jy+WjehlAgZ7HtTnd38+Zbdrc+oGRIF1PSRlUFooz0+mGvJ5WS
         MoxL3ABwxHo9fXBt6xck7jWTYnyVdJIjEyJhtjESlz/T1s10rpxc68a7Tt//YpY4KTUT
         Bsd1EQ1hKH1DMunK7HcBPIEY/yMU4TkWzZGtqiSY9GX0ty/DfQtcTRCRqS6Ydnd/6ouB
         z/QWVe3/ay3Vkk8+N0Q818xjTaFN54kh02rPzABOPHR0IdQzsd1nbGE3mDCTh/OqXHtU
         JaOg==
X-Gm-Message-State: AO0yUKVqkh9++KTeBuFTcAcDFJKK1WvwAlYhcseuU/9IZRNBxOF71ELu
	khYwftQ4Wp7RxV1xMC1q17A3gA==
X-Google-Smtp-Source: AK7set/fSl11JTHhYl2cdak5pu02Z/tPOGthbHVRE0GED6z3AETqeQl/hRwu6U9GEVzn7phgeCclZg==
X-Received: by 2002:a17:90b:1c12:b0:234:157:a264 with SMTP id oc18-20020a17090b1c1200b002340157a264mr16227971pjb.43.1678206006471;
        Tue, 07 Mar 2023 08:20:06 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id jx15-20020a170903138f00b0019468fe44d3sm8600578plb.25.2023.03.07.08.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 08:20:06 -0800 (PST)
Message-ID: <64076436.170a0220.d8a24.f3ff@mx.google.com>
Date: Tue, 07 Mar 2023 08:20:06 -0800 (PST)
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
X-Kernelci-Kernel: v6.3-rc1-1-g22181069e867
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.3-rc1-1-g22181069e867)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.3-rc1-=
1-g22181069e867)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.3-rc1-1-g22181069e867/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.3-rc1-1-g22181069e867
Git Commit: 22181069e86761d2d834434da741bc56a45a2705
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
