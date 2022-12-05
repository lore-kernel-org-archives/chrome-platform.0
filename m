Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D5D7C
	for <chrome-platform@lists.linux.dev>; Mon,  5 Dec 2022 06:59:26 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id r18so9667313pgr.12
        for <chrome-platform@lists.linux.dev>; Sun, 04 Dec 2022 22:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d2U7Cpa+g+cZ3UrFJ9EzIICrxKxYeIug2wN/FS22dhQ=;
        b=tghbj9OyCouUD03y9HYxvFuCPq27JKwWYXnnNL54cRcq+ZBk0u9jCNjehol6KbaRvX
         PsAMOtMh4m0XoP5o3jAFCyZFOlWkr0iQZHmIaVjFe8w9igB85kfCg6hqjL94Xa+e0jP9
         SVTZnsyMxtMLF5CCEZBcLPRBDoPb7HMHhqoGyyxm/VxnaecehBQDWwK6j5PJ3DlzMvaB
         qx5MIJIZGgOyWkdwoEaMA6namnmcXBTAJPoGBBA1Qn9YcqrkTCKTpeGEQLI7wK+y17R0
         uWHq9uySqawd6+03NsDOB+rd7g61sKbup4xq68D5iLb4OAA9SvfcPdN9uFo16UBE9lit
         IUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d2U7Cpa+g+cZ3UrFJ9EzIICrxKxYeIug2wN/FS22dhQ=;
        b=VoMs36/cHdmge2cEniqTtMcOQF6v4buDjgZT9JabUQac6hY34gZ98fyuxJad//knZW
         Hw8TzHrZj7iI3Ia/LXgXEE6AgUXSy2sbUouGMjhLWHbjFKhIBlmtMoqQgw8dKtVuSXtl
         oy0bNmFlpYXt9e03v2XQvA+sKZxcLtJa+AAGQ1zB4/HAGGBdG93NHjj8wBIh6rdX5eyO
         fYh7UPqdn/YY1mnRocV8DIpXUX+5z8toDMEqQA3rdehHbNQK4KUACXox16/NWn1Vq32C
         afY0L/9UXQX90DRijTR26wRrzS10l5PxrPfNL6uN6r2r0O0S5cXsSXIFozrtRKQDlw0A
         hLuQ==
X-Gm-Message-State: ANoB5plC/5re+bPVoIO1dLcfV06tXiI+4ddyJ7d7cO4M4P0xPQ5DPihm
	O0yZC+mGk3VJKiXw8q7nwjt8Hg==
X-Google-Smtp-Source: AA0mqf6o5TR4GTQaMKY7Sox3llrMdc59Cu5ez1uzjjzB+ZPeqYFVqVgOPmUkjrkBxrG1RRlUVLeMIg==
X-Received: by 2002:a62:2941:0:b0:573:6a8d:dd15 with SMTP id p62-20020a622941000000b005736a8ddd15mr73511306pfp.2.1670223565954;
        Sun, 04 Dec 2022 22:59:25 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v124-20020a626182000000b00574e4fe6118sm9065046pfb.162.2022.12.04.22.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 22:59:25 -0800 (PST)
Message-ID: <638d96cd.620a0220.ab59c.0adf@mx.google.com>
Date: Sun, 04 Dec 2022 22:59:25 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-kernelci
X-Kernelci-Kernel: v6.1-rc1-16-gd74fa18ce5f0
X-Kernelci-Report-Type: build
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.1-rc1-16-gd74fa18ce5f0)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.1-rc1-=
16-gd74fa18ce5f0)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.1-rc1-16-gd74fa18ce5f0/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.1-rc1-16-gd74fa18ce5f0
Git Commit: d74fa18ce5f0fc462d93edd1514e6daaf55f804c
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
