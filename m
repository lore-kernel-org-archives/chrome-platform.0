Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4C82F41
	for <chrome-platform@lists.linux.dev>; Tue,  3 May 2022 22:45:48 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id t13so15108174pgn.8
        for <chrome-platform@lists.linux.dev>; Tue, 03 May 2022 15:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=oUJderePdpwxVjYlztlmyGyD938LeSBeYGuj0sSHb0A=;
        b=wQADWhnLyywHkvu8ouUZgxfNKlobt2cG728L55LHpMqD1DJ90+F6WwhfzG38iYQIHl
         KLoxOOJ7A+32hiVnWBDjExh2tqe4HFrGVo/P2vWOrgiDikCNYPfYtDXHFYXWs0Cq8ky3
         xD94rVVT2+/dZyu6/tWKtlay1zV67eCGY19W2cEdGOOlMAvB7CDzatQD0toxffDjjVca
         pEwb9w8jl5WNKmmoJV2dDAZlDDhMZwQAOn2ivHKowRfzWVF18YIlCl7MukD3lW54jALx
         cuwpCKhrO/jBeFLDs2xKAI5xOOPEKicDFpvDdn9Go7ZJ2vkKYuAdAw86pylxNmGFWV6b
         PPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=oUJderePdpwxVjYlztlmyGyD938LeSBeYGuj0sSHb0A=;
        b=lPD9RgbX2YRStsW89/70U/lQPibe9UzjjO0Zv1k3hmQTSAnpEhztq/+0eQ0HgFLKB7
         TJ5mJthrYkCtmpmdPgTsFUYU4I62u31UMR+0FN19y5kXTT2ajtyw8PELQQuORd8JE/yo
         +knFZfh1x8yqXrXP7lxCgnRy9B2lpIVRiyta4kR1APPx8g/fHx318X/areeLTqQ/gyi5
         4S75CU9OSZPltMAVNPqc0u2hFJzXLDZo0xwv1G5OUYNKx/XR9oFkG5PLhbKydhnOlmkZ
         31GQq/9bYmv3AuHxcYp+ZZIlE3xtT0Ulg46jNNdjBBgUxytSTzd11jRGGvrPck0/CiUe
         v81w==
X-Gm-Message-State: AOAM533TOBYpTDt56mUjKzZRTT/0McviwXhw5EGK3QmJGVNclkS5AYyt
	KapTqrn3TBtiOAWMD0veJVB3pA==
X-Google-Smtp-Source: ABdhPJzC4nfJNGTMf4HLZ0QOC09GcrSPa0wWu9JV1kv8ihISiUdbqrp8RXuoqNGcCiv5SKVnW/6uEA==
X-Received: by 2002:a63:224f:0:b0:399:4a1a:b01f with SMTP id t15-20020a63224f000000b003994a1ab01fmr15809971pgm.123.1651617948278;
        Tue, 03 May 2022 15:45:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f4-20020a63e304000000b003c14af505f7sm13153088pgh.15.2022.05.03.15.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 15:45:48 -0700 (PDT)
Message-ID: <6271b09c.1c69fb81.47f1a.0e0f@mx.google.com>
Date: Tue, 03 May 2022 15:45:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.18-rc1-9-g647ca66a238b
X-Kernelci-Report-Type: build
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v5.18-rc1-9-g647ca66a238b)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v5.18-rc1=
-9-g647ca66a238b)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v5.18-rc1-9-g647ca66a238b/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v5.18-rc1-9-g647ca66a238b
Git Commit: 647ca66a238bb661523362bde8805c45019ad88b
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
