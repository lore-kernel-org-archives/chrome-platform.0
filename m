Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B730C23A0
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 05:01:48 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id s14so11244219plk.8
        for <chrome-platform@lists.linux.dev>; Sun, 05 Jun 2022 22:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=gpe96G6Y7SCvTVRzNIr9ZLdbBQA+MwrhL95guq+E/Vk=;
        b=dd2XyCWCVWKS0Qzxjzpoym44dU0PaAnnN/1up8jonzq49G/8xQ7E4/z56pFSMqRTZk
         +jEKlVjOAup9Yc9mVlbalT5+90lxfo40JwPEyQqT98WIWMoK+wzddNGcYU7i/U01/rrJ
         ehHMY3Vnz0G50Sg0mSBrRxiOmoABuEWH+GbRcTp7akif3B0HkrkhCYBAGflSTszPQ4DE
         UH7JiPkkms6Whc+lRiz3anh6HiO7wbucRXnS+5AE27zUAZQcE64Lc5dHsjTslx5Vt3+O
         SzegjJKVwhyHwbAZiNJlMO57K/TDhnGYiFy2Fen1NPoLrWiCKWf92ZncdcTkbpm/xIdx
         lvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=gpe96G6Y7SCvTVRzNIr9ZLdbBQA+MwrhL95guq+E/Vk=;
        b=ljmuOsCwW19CuPr+JHFZNj4q6CI2sRIMwQv/ZHCI+A62tpil9OT5/p8rw1Hmhk9NFQ
         LsNeyiuw4fbOTQj5V2phBZ8JQpCVxEQdwPOzol4PIHMIIQuF/GcOe+K7OTOgrqlhDLYI
         +H7fYbjr2Oiy+Ou3WUcOc9DoroIkoxc1ZicZpSqF3BIRyXScp0zwdraMGHiJsn87nc5Q
         mv1We4Th/+1bgXyHc0nwpyn/uqZDvhSKlbHtqgCE3IWF3wzKNAMmzO3uf0TsNu21maYS
         fPMVdZxvumRZp2Zq1nkREswZgJ2NQqbRoyqsTYt4EEC4SHKamjI+pzyU06M4Ax+5yEya
         0djw==
X-Gm-Message-State: AOAM530tHJbDjQOcspfVz0I1NSxj+TdZmsm04XzNWFZNrzU5LhJooYQ9
	vj1axqXXpOog+48MkuKIfN6MoaHQ1si4Jujz
X-Google-Smtp-Source: ABdhPJxI8ReW/tNKrifXxItN5rrcBUAsRDgSLJ6bsDph0UsnxEeRXXMD59+YOJeez6EumMSClMHM7g==
X-Received: by 2002:a17:902:db0a:b0:167:466e:b72c with SMTP id m10-20020a170902db0a00b00167466eb72cmr16315370plx.172.1654491708168;
        Sun, 05 Jun 2022 22:01:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b82-20020a621b55000000b0051ba8b742e4sm9648953pfb.69.2022.06.05.22.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 22:01:47 -0700 (PDT)
Message-ID: <629d8a3b.1c69fb81.3ad16.6191@mx.google.com>
Date: Sun, 05 Jun 2022 22:01:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.19-rc1-6-gc1db0861e8d02
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v5.19-rc1-6-gc1db0861e8d02)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v5.19-rc1=
-6-gc1db0861e8d02)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v5.19-rc1-6-gc1db0861e8d02/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v5.19-rc1-6-gc1db0861e8d02
Git Commit: c1db0861e8d025ee5b2e0a83f6691aa9098f2f18
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
