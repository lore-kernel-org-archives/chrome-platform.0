Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DCD15B0
	for <chrome-platform@lists.linux.dev>; Wed,  4 Oct 2023 05:08:08 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1c60f1a2652so4419935ad.0
        for <chrome-platform@lists.linux.dev>; Tue, 03 Oct 2023 22:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1696396087; x=1697000887; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fRkfJc80GgawRjdQCD5lE4wlbhzn7ye0V8+JeaBNJSA=;
        b=p8Yey2ptZdkpeqL/J93wbYxTMEQou2gPZuZXGiAb2wQuGU4fQm8ROHgNVYzoEoA2Vj
         kl5gMyi2CquifCKsvb7f8M0ddBLYgmaquhe8ht28/aViHNktNB5Qmf9ipl6oWbSXi75w
         sf4pCwc3hOiKGimlanheE04dESGCp+7ISCdTCUMm9ppRcGT9Q1hFV7oC4HRXxmG6pVxd
         2kBL1gq/wOpllfDWCdZnMD3fpjH8RuxGvnEtJ/CwsFUW4BwyBkAhTGPFRRpzEYu8fglx
         PlsLkarGew16Oc3/ydNUbOn57vi8Un3iVKqhnbVYUp/+BHitZb0rhho/BnHVXbb+cVmL
         FJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696396087; x=1697000887;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fRkfJc80GgawRjdQCD5lE4wlbhzn7ye0V8+JeaBNJSA=;
        b=G9ETO8RURPw6EWq4Zpa0YsTVMSZVpeo/4h5WJK/RZKNA1R2IVHjw5rXlF3hTQFYUgx
         XliUk6Z9ZyVgk/LPFP+08vLZb37GmF86RfBtrwwj1pC0AT1KU0Z3xDgNOnIMxGWDq8mK
         AIzFJj/RTxAaZPK3/8apQ6K/MdUOVEWjNgm4e+dw9RkAhMGJ5nTYqN7nCvfo3djBLvQY
         JkM/GfqvLaigYZMYn3IpgptViNUPHIEvzHyVtsupYX/Gd03dv7CliNShqhNAvgs1RvBz
         7NkmBDxhBOJo/l117GGksnmJpwN7uJFvseHw43+5aw3mwgkB0Vn3y05mj2wA8rAQPDoO
         hsdA==
X-Gm-Message-State: AOJu0YyIW1sjEPg7sHKUJtyYKDM/csJ/vgr2bS3Y8hHuP64Zd2d2bQnB
	hJpXUb3Aol6Y02Honi8lOhoJ0A==
X-Google-Smtp-Source: AGHT+IHQgEqZPkTNVBVpUeeS4mBaW8bn2mMAu5+TOhOOke93y27ynXudq25C3sx3ed7ttfs1K/hnaQ==
X-Received: by 2002:a17:902:ec90:b0:1c7:27a1:a9e5 with SMTP id x16-20020a170902ec9000b001c727a1a9e5mr1957981plg.33.1696396087598;
        Tue, 03 Oct 2023 22:08:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id i1-20020a17090332c100b001b7f40a8959sm2572669plr.76.2023.10.03.22.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 22:08:06 -0700 (PDT)
Message-ID: <651cf336.170a0220.d5445.776a@mx.google.com>
Date: Tue, 03 Oct 2023 22:08:06 -0700 (PDT)
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
X-Kernelci-Kernel: v6.6-rc1-17-g2f3dd39e2b49
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.6-rc1-17-g2f3dd39e2b49)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.6-rc1-=
17-g2f3dd39e2b49)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.6-rc1-17-g2f3dd39e2b49/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.6-rc1-17-g2f3dd39e2b49
Git Commit: 2f3dd39e2b492bec366487a2c9bcbdbd7792f77c
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
