Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D81EB8
	for <chrome-platform@lists.linux.dev>; Wed, 28 Dec 2022 05:03:16 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id n65-20020a17090a2cc700b0021bc5ef7a14so15083489pjd.0
        for <chrome-platform@lists.linux.dev>; Tue, 27 Dec 2022 21:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k/cBQe+MmCH1Z6re0Yanm+SovTE6y1XTmj8FvEociSo=;
        b=Fyi79rvt8R2urKDbyc+LrcRdi3foRgJ2yZGJtWxPY+i63xOL1KVwUW2aews8DF+YfT
         9/jkidOjwqjFLo+KpS3nVgXiNqMECjxFZy4oQMAz/sOai/fL0GzJHGW30GnVoYXReGHq
         Q6Ura+paIuQes8CUAJBL9Fs9mIeclSBkVqZ8lunZaJydmX4VNnNe8b9dsl8WqD1hvvl/
         ewiCZyy0D5aJ7LxJhqL1JxelR4SEZ+bqe7gQNRpu8mY8t7iNjKex70m5zTa6uocWzeGT
         ndzUDaNDcCQveoA4p11qjonfUHQG9C+Z8OlNuG9pSItd4KgvaX28PPel1wRjqhm4mYiB
         VhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/cBQe+MmCH1Z6re0Yanm+SovTE6y1XTmj8FvEociSo=;
        b=ZtE7q9TPtdv0xXKXYJ+hamuh/JfqNgWatUB7bOeHzLlg8hW6AjOIlEQ3ySM+x+DXNU
         DFUvt2BLrRU2ylRCf6szu1rp1iQmKNVKoQ0RAw60tUD1Caua4sEbe4ttJJbzNlZWb4p+
         NR1IsQbfGy9qnun4H6xXU35z3NuexxCGxGBkQNF+fSA04dhbm/u5KO5n39vEYUC+2rNh
         gOdRTRn8xKpqO9VMTgKu4d5anFq+Qi0MA1O9YP9t4mG0twBIhd1NLqHY5xvrIWG8ttGl
         hRmpqy12XC7y+YdxomIXR0zZ+vLREQSV4D6UZ4va4S0rdITumUtyvQAWJnDSyOfoS0Sf
         +iUQ==
X-Gm-Message-State: AFqh2kocI32ZldEd0pf7+xIWvw3FJ3MMTozceLUBPVtemFfDrtOK2Wz5
	9W5KJjTdRO8o6JLXrMjYU1nKew==
X-Google-Smtp-Source: AMrXdXtlh8suYt74NciZTqz2nsMIIOs4qrZLmPIaWkyn2UmESTaVL3H3/6vdfbRq83nC06X4mJnocQ==
X-Received: by 2002:a17:902:8f86:b0:191:282:5d6c with SMTP id z6-20020a1709028f8600b0019102825d6cmr28656116plo.61.1672203795943;
        Tue, 27 Dec 2022 21:03:15 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b18-20020a170902d51200b00188f6cbd950sm9889296plg.226.2022.12.27.21.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 21:03:15 -0800 (PST)
Message-ID: <63abce13.170a0220.b3854.1c8d@mx.google.com>
Date: Tue, 27 Dec 2022 21:03:15 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.2-rc1-6-gba409cd491c6
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.2-rc1-6-gba409cd491c6)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.2-rc1-=
6-gba409cd491c6)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.2-rc1-6-gba409cd491c6/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.2-rc1-6-gba409cd491c6
Git Commit: ba409cd491c6f13d48a70a5d2c28d340dabd49dc
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
