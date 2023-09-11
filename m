Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D34420EB
	for <chrome-platform@lists.linux.dev>; Mon, 11 Sep 2023 05:12:23 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-570a432468bso3547514a12.0
        for <chrome-platform@lists.linux.dev>; Sun, 10 Sep 2023 22:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1694409143; x=1695013943; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mMiy6eJvKyQ2/LEX+g5Ksa+EwlVGyIrphe7JEk3ZzT8=;
        b=ffJ6VKY7YrlYV8NIKZwyViTi8Qcwj4g3cTV2wn193n30hFMlgz+Ty0V3Ttp2s+cbUp
         wAOjbAVfzOc1EBaDyI7+ZfJRphKCRzpowiEpxLlKIF89jj+idgBFW3ADJhH2miWfb7+S
         FGs0LMXiMRpVxDhDsEfCcmDGfEMOtrGp5Ano68HTmhwi1/zR47RnST3FNQUVvrIHPT+r
         ANdZAhAdZq3/lhRBI/nwRq5QoSy+BRpPE/v/ioVt6RTo+Sg5reLF3yal4Rnil7sKhyh7
         Xq78Z5qFpqLZ9TRVUbTsOXFnfSB3vlzy02lAeDfsY/5YB650Jy/TeHuC1vTJ2nO6OMsS
         9nTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694409143; x=1695013943;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMiy6eJvKyQ2/LEX+g5Ksa+EwlVGyIrphe7JEk3ZzT8=;
        b=CAndDFWOs/hSa1CSwc5tdIQfDcmLzM27YS91mICm0m7TPr2HyMS4Nxgf01QUU7S8+V
         44fWcZhP5ikjTJ7dVPYwpTZnkWBrVvYcLKwxGrHUE7UWNGrg/ej0D2BOASSkvrfteadA
         kp+FM04/J9AMpnLWOfWfPAQlK8YG4Pepqn4NWG0oVgYW+21aBtK9lQSsi5yQmfrdSDBi
         Sst/D2m3Txceld4FBApniSKi593bORwKv9BbosiSDVuyuYUUMNQzFWNi4sJ+0ZPtkzET
         Oi6kAUQ8OyWPdWaHK4fAAVy8JXso91Um6dzqpac5WzaNj9Vi22uCukc9OHkRBpvvYWDG
         HiDQ==
X-Gm-Message-State: AOJu0YzzWBU9mYDfsxgMDsCD2o8K7Go5M7adYyaJZocDnPTPpNjRiOaO
	IIWKbMl/ziWLfVg8THS5GgNU0w==
X-Google-Smtp-Source: AGHT+IEAfI7+KFIZAgTJEH9Ld/ZfHNCj+cyY8/iVsjYrK1x0jjtkG8ttBOopyh4vDedOzHjLO6mZcw==
X-Received: by 2002:a17:90a:fa0c:b0:26b:535e:fc12 with SMTP id cm12-20020a17090afa0c00b0026b535efc12mr12310749pjb.7.1694409143158;
        Sun, 10 Sep 2023 22:12:23 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id s1-20020a17090ae68100b0026b4d215627sm4763905pjy.21.2023.09.10.22.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 22:12:22 -0700 (PDT)
Message-ID: <64fea1b6.170a0220.9d520.a6d8@mx.google.com>
Date: Sun, 10 Sep 2023 22:12:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-firmware-kernelci
X-Kernelci-Tree: chrome-platform
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.6-rc1
Subject: chrome-platform/for-firmware-kernelci build: 5 builds: 0 failed,
 5 passed (v6.6-rc1)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-firmware-kernelci build: 5 builds: 0 failed, 5 passed (=
v6.6-rc1)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-f=
irmware-kernelci/kernel/v6.6-rc1/

Tree: chrome-platform
Branch: for-firmware-kernelci
Git Describe: v6.6-rc1
Git Commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
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
