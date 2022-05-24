Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB3E629
	for <chrome-platform@lists.linux.dev>; Tue, 24 May 2022 01:57:28 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id nk9-20020a17090b194900b001df2fcdc165so826930pjb.0
        for <chrome-platform@lists.linux.dev>; Mon, 23 May 2022 18:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bfYmfU4P/xHxDopTz4JUuaYQ8OQj5SGJEzScDYkdwLE=;
        b=M8m9UmFrmIT7NUDwCFNjU0gj2Y+XyxZlD4ouJww77O78g6r8p+G1Jt+5lfnOWGqlmA
         hl8eyQZHH75QQOxlvYXbjqHS43g7A2sPouVjIdXqJfsG35QsUYwE8NJ/Z6mE1f8Dk6F/
         Rjbi0LXG33YqsYPs8GJs/GRxVv6vtDXFoKw6sml4E27OIEQELPWkTEv8UQ/fpC3+nwjy
         qVymtwHi6erJlSlMw0GdwsE7y7M6i77EEXpouUhfPkpAcBioVfR4Cu7GTqtRSHp2AJ+W
         CtiZje0MdV17EO3Tco8psnh7SpgOnEGWo2ZKr7bKk7Fj2wz232r9GUNqx68SU8j8HG5y
         Y/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bfYmfU4P/xHxDopTz4JUuaYQ8OQj5SGJEzScDYkdwLE=;
        b=qt0DF9JqiCEV13wu3+ACP8cMmdG9vYaxuGeUcGHUI0lJrs3MvEOnI3+d58Q/GAoins
         530B4iPQrLkoPt0CCSSsTTBxrN0gGcz+o3ZCZnf69BC9DPzfGOJr1QLEnKNE6qtIYjHG
         lhKUz7AGrL1QctXJHYnw0amzXRqwvW6qFpQXnCwU8iAsIPOWJkB1CGHDWkcMqYsYUepZ
         FG2Bob1Dnbkx3fzt2sP8JCN/J8z1xgGqaH718PwHxZtPzBXSe5Bgi5HBlvEnmnsulPZT
         KS2flqGBxNuMtqhF3NydzMGDVwPLnu0O3gwRHRFXCB4n2zx5PdKBuJIpG/o8Gwqsamjp
         pFmA==
X-Gm-Message-State: AOAM533E+id/PklzTnZRwwOzKXa5y0aRNK9G+Hr5tFeU90dbKKkyxRbu
	7qe67R7ftr1ZMEtNxlZJ0yxnDI9KMCoCfOudNbg=
X-Google-Smtp-Source: ABdhPJwjTU2cNwCwMStWUthYXyp5jgx0cFw86BCJZFHvDECPLYVjs6oH9VdSOWkjW4jN7cyAdEWkNg==
X-Received: by 2002:a17:90b:1c0e:b0:1e0:b53:f4a3 with SMTP id oc14-20020a17090b1c0e00b001e00b53f4a3mr2028387pjb.3.1653357447713;
        Mon, 23 May 2022 18:57:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a13-20020aa7864d000000b0051829b1595dsm7921857pfo.130.2022.05.23.18.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 18:57:27 -0700 (PDT)
Message-ID: <628c3b87.1c69fb81.51da8.39a2@mx.google.com>
Date: Mon, 23 May 2022 18:57:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.18-rc1-24-gc2d7e384924d
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v5.18-rc1-24-gc2d7e384924d)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v5.18-rc1=
-24-gc2d7e384924d)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v5.18-rc1-24-gc2d7e384924d/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v5.18-rc1-24-gc2d7e384924d
Git Commit: c2d7e384924df85db92e45390ef0c00f2b89d9c2
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
