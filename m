Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3382FB3
	for <chrome-platform@lists.linux.dev>; Fri, 13 May 2022 19:15:06 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id iq10so8912271pjb.0
        for <chrome-platform@lists.linux.dev>; Fri, 13 May 2022 12:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2u6LhwEQjHncR6iDng+YF4EwdQdmn4d4IRt3EYqFVTc=;
        b=1alLERPKElJ1QKw35XmTMofYPk4Xc0XSet5ZyGS66118pN3TxHhFQl+7d2WnBBKncv
         u5xUlyEJKYDHJINEe6IY+tBdyAIuTYd1Qw9ZFj6rK89RuoYCU8c4LdmajubG9X62sz9w
         CNd0+oH16DpkNkCz1hNCm4UIC+/w2vHnwsSPCe/o0gri9aDJ+rbL6UwVA32ZtkGku/lW
         5GLnPc/ejF7Jyir6NM6VNlxs4KLWW77/i2j3aAoUQz1zxrVBtPNuazlM6eSxf3G5nDKW
         CRJToGfxE94IgwqlI3zZ2c6t2BhtnxPl+S0OGSZ3CPCTw5gzDsLg8pt47FfaVGC2kyAH
         M3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2u6LhwEQjHncR6iDng+YF4EwdQdmn4d4IRt3EYqFVTc=;
        b=1BepGYkBycPgcH+KlpL+eYHe+rb104DfubMrp9hQFpqenRI7V8/5tWhisVose3RUGW
         hFjqTL/V6FN6bM3TMpJkIxzTbuvCJuEs07iS0QV0gygP6dj735kMFJrFrbDjvhvz6xnV
         xJoMXw6ilSo/L2B4m3yNWurnv3Y02NF9fhorE4apBrfzZlDHesyXhgFXY2Qa2kVrSd6a
         h9as4dTaE0sQRQIdrj3EmWglz4Pwu+SyKv+IlcHDivNlwCCAO7GFP0mfadwvY+x+SRwL
         2bRWXjFFusz87UMcXeuZT7US3tkNAzVjSp95nh749ieDUNh3lRaLNqMMAcTeCbDwz8O0
         A9Nw==
X-Gm-Message-State: AOAM5333Bxk3Kvo9LxUXU7ZnDXTvxta068guNORK+01yzv//TCjS2Nf7
	OJOtB+p2ZWHnHT6zhu8emAKAsA==
X-Google-Smtp-Source: ABdhPJwjPYwGw4KL4M/WgoB/5tec9YagBb9EtOmCYPF6KAc79b6p5jC1zaMnJKRPUqfT5D2lLJNbJg==
X-Received: by 2002:a17:902:d1cd:b0:15d:1483:6ed6 with SMTP id g13-20020a170902d1cd00b0015d14836ed6mr6459936plb.58.1652469305838;
        Fri, 13 May 2022 12:15:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u1-20020a1709026e0100b0015e8d4eb1c0sm2283724plk.10.2022.05.13.12.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 12:15:05 -0700 (PDT)
Message-ID: <627eae39.1c69fb81.b65ee.5f9b@mx.google.com>
Date: Fri, 13 May 2022 12:15:05 -0700 (PDT)
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
X-Kernelci-Kernel: v5.18-rc1-11-g6c942e3f424f
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v5.18-rc1-11-g6c942e3f424f)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v5.18-rc1=
-11-g6c942e3f424f)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v5.18-rc1-11-g6c942e3f424f/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v5.18-rc1-11-g6c942e3f424f
Git Commit: 6c942e3f424f0a31417cb333bbb933517b313715
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
