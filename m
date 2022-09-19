Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3B77C
	for <chrome-platform@lists.linux.dev>; Mon, 19 Sep 2022 04:01:19 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id p18so26765506plr.8
        for <chrome-platform@lists.linux.dev>; Sun, 18 Sep 2022 21:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=iMQ69zfTc1xFFEWrQBUqhybpV5WrMUajEaJUEkV5l40=;
        b=CUbKz+GHYJihqU8rabhvVreqJbGbg7fb/S2t/qpQsFMRn5/tI5ma8PYpazwidYi7D2
         peIi6K5vL0v0UtJSX1CkjL2EJzMGKHudawnnCj1J4o7sZH+mCJkvbv7epxDBF6P7WnYH
         dKV8StBaj1Ye06oBoC4n/nWVQPq/VIWVhLYc9i+FWJi9vCJoc9WswwIFajSyRmGxep0N
         bn8Nbdfi15VIXHAR9c3GIBzCAjbECfTlAgJQHSKRSCdac2uqxR1mqMrdYjmMbIGsu0s4
         wuGjVrBwa1e2lPabhgegrhZKQv9JCeHVOGeGjYhKt4zCRuxlKP8JrS82BU0Z7poybEFY
         hGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=iMQ69zfTc1xFFEWrQBUqhybpV5WrMUajEaJUEkV5l40=;
        b=1poPsLz8DpRzuFWmIvf1FnXLcEpDMd0qjdwZbNKnzkwEG1tVs40+uZ/zT7Dgtfu7Bg
         CuXWgH2Y0Q7ODGZKFcoMuZf/JANmE20oZIiYue2o2KKVfvgj5Xaat6OnM1AbS6Fty7a7
         DTOUNupUkZkjEXjVoAqT0OWIQC0vZaDpwPpKdgRwdCxvrAlci5wgSu7wDe7cwW0h4vem
         j4NU9tUXUliL7v7aSMBKKXCvQgkQVe/YV7rjcqDNkz4fcpWe6Jqb1gHuBHIbPMuJeZWQ
         5q/NpaXM0sXC/1t/nws+uPl8Cf5kwdiVkhZBVhZpNcThNO3USBOB3/uznoHFj9OqBT07
         zF3g==
X-Gm-Message-State: ACrzQf3vvHP8yVLqg7tZUKtf8vDMbhVahGGp13j5DcIQCtnKP6Kh8yDR
	b9e3TMg90HDkTIuOSDXyG7HmJQ==
X-Google-Smtp-Source: AMsMyM5O3HNJzY7DO2JP+UIwSyhd1M4apSJUP4ifxyiHFEW/zhXazjJsgxG9shQei1VBWm48U0VxYw==
X-Received: by 2002:a17:90a:1b0a:b0:203:6731:4c98 with SMTP id q10-20020a17090a1b0a00b0020367314c98mr11691125pjq.10.1663560078843;
        Sun, 18 Sep 2022 21:01:18 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t15-20020a17090ad50f00b002008ba3a74csm5522130pju.52.2022.09.18.21.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Sep 2022 21:01:18 -0700 (PDT)
Message-ID: <6327e98e.170a0220.9e734.9794@mx.google.com>
Date: Sun, 18 Sep 2022 21:01:18 -0700 (PDT)
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
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.0-rc1-20-g95a789b97c72
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.0-rc1-20-g95a789b97c72)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.0-rc1-=
20-g95a789b97c72)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.0-rc1-20-g95a789b97c72/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.0-rc1-20-g95a789b97c72
Git Commit: 95a789b97c72e00d7be6951ebc3fe537803003a6
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
