Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84FC17F3
	for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 05:08:06 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id l6so9473684pjj.0
        for <chrome-platform@lists.linux.dev>; Sun, 30 Oct 2022 22:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3XHDIgMudyr8gTiZi0T0+Xmu4iezqFmlL+yo8zArU7Q=;
        b=3rMedvbENv7UqS4GRu1+nd4o/FGId35ocqg3qeCe86dXhaHBplxyA2GrSB8cobUF0c
         v8gxT3mdLu+S3KKHTMtPesykggkfsZ16ZU/WSDR8aFZnou5XKjMAf75zrZmJRK8L+cqQ
         rQq30IdcYVko4b7cW7LZ2dVKxz1wsOdweNNyfgS5okuKwBg3TjqHen7XPK6wM+tQ7Wkc
         LT/ngMGApoPYpuI2b/vECVoTyp9Wc+uc6YqNSR6pNCXrz3Cyy8Yvq0X1+/kjVCaEQaZE
         /vlsZOuqXkS8T1alZaSTf18LsGtNv+HhAYmdfygf4akWzYGczshjti4xiOzm0HB2+Jxd
         OaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3XHDIgMudyr8gTiZi0T0+Xmu4iezqFmlL+yo8zArU7Q=;
        b=BACdx3VHRygWlG8CYpMrdS1MQVfIAPXSpFsDOqYg9hHpg71esFaBL5+H6+xWvAHzKF
         DfEn8Sa5CV9+njKK3oHbDCw0HgBJXrlQTChWXGNwjWuhkAuZSiAUgOO5h8A/FUjrbyH4
         FXVkzid2l+LsCK1L4ULvMSbV6gjHEB1CoEjZr8X5g2bFov7Yj+T/V8YFYLFY+ZSDhB2W
         gflYntdKaLOtiCUYH7nJZksa2P70mJjfhkCNxtYSpcG46owy7dng2uG6cLCVbFF3eOUB
         nEbJ1+bcTcSjRPCuIJbZamcP2YyLWgsgcNC/VVSZDHY4X/kW0PfGm1hzeGxjn9I37Ghb
         eSQQ==
X-Gm-Message-State: ACrzQf1/1IvjIScaMVxtY1rD+BlLUJNbIKzjlvwqgC74j168H+PYNWao
	wmz1bGTU8+CLITzUasFeLgu4BA==
X-Google-Smtp-Source: AMsMyM52DQ2m67jO93CGyKLbHAh1gQnCIfxPwzVPhnp1VDpoGpxdNclAQSMhlyuBzrdgNuXtJoQ/qA==
X-Received: by 2002:a17:902:7786:b0:178:48c0:a083 with SMTP id o6-20020a170902778600b0017848c0a083mr12614382pll.125.1667192886023;
        Sun, 30 Oct 2022 22:08:06 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h8-20020a170902680800b00176b84eb29asm3446888plk.301.2022.10.30.22.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 22:08:05 -0700 (PDT)
Message-ID: <635f5835.170a0220.40ed7.59b9@mx.google.com>
Date: Sun, 30 Oct 2022 22:08:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.1-rc1-5-g27b86a65cd16
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.1-rc1-5-g27b86a65cd16)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.1-rc1-=
5-g27b86a65cd16)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.1-rc1-5-g27b86a65cd16/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.1-rc1-5-g27b86a65cd16
Git Commit: 27b86a65cd16b0e94ef69196b008d701a53feddb
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
