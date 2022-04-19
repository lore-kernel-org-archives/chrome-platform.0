Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41186ED8
	for <chrome-platform@lists.linux.dev>; Tue, 19 Apr 2022 12:16:32 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id o5so15249644pjr.0
        for <chrome-platform@lists.linux.dev>; Tue, 19 Apr 2022 05:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ayEwnBd5aqxIQWWsQgtaNfd9m4PNsGk+OYOBrBmZd5Y=;
        b=J1lY8uIeudNKmkNHPKd4R+hEkl5TRWWNIbLmhRXqznZQ0AF1zQPHi2ChV0djw0k50j
         gnftNGazdZ7D+qX1pmYESWLYAFV0zwWBzael2N9K2wrbxNihe3RWwQ8p8cJCiXVgUzE5
         H/2UUhC8W36jFRs7axbS3QrFt/J2vqfpvBWPCJZfSs2oCwl3qcI5c0b8FFCOFbnisPVY
         iieuu6er+Uqx+3zKfi1+Sg5p7SWpl+lhBtGAt2S5O7JKA9XfjSDqNTsvgxw07HHsInMs
         TQGJvyan5JKCShEe0dGYvMeGi51eCJGCRj5gZB5UKH+khuZN1zompN3l4v04pzfbVCRh
         64HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ayEwnBd5aqxIQWWsQgtaNfd9m4PNsGk+OYOBrBmZd5Y=;
        b=P/HfsHNVezF+aTbqucoyOGrfh5adBu49QlxmnlcE45o76jQKZNYdbR5zXwRo6bgyws
         4PV+o9Z4gkxTTeHcJITuGtpM0q23OSWzmv9deaStf2Boniqct2hdGF0SLwTF7CuzQAou
         kbhriz7CSEr78DhyhvoFgAXoQd6UJDokkF+xOOATO1+w4J4CYAQJLP/56GGSGP9Wh5rc
         IX76Ki2nQWQi3EZErYR1efUU6Gcft0eMNzC7rToFiTZJGGGCpHbH/QsX0f+vTeGUwxFQ
         2HbStoRpbaso/QgtXPeTvh5NA7qZN3E1tdUf+VDNCvl88WDJ4n/zVCGvyf+ouc9af3XX
         teJg==
X-Gm-Message-State: AOAM532zV1KNyIj6Y6aImi2A0Lnicafz+WciMXUXUKjEYD/l2JL0tvOQ
	yHAiHwH7UstI+9ZKwVyXZ500nA==
X-Google-Smtp-Source: ABdhPJzGjspUmqvM90MUqf2VNdcqWIRnVxbK9Y+aMmgKKwLRVH4zBrUT1XlClfuMWZI582TlvF2SJA==
X-Received: by 2002:a17:902:6847:b0:158:fd26:1b97 with SMTP id f7-20020a170902684700b00158fd261b97mr9289834pln.17.1650370591704;
        Tue, 19 Apr 2022 05:16:31 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b13-20020a056a00114d00b004c122b90703sm16884831pfm.27.2022.04.19.05.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 05:16:31 -0700 (PDT)
Message-ID: <625ea81f.1c69fb81.40a06.6888@mx.google.com>
Date: Tue, 19 Apr 2022 05:16:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Kernel: v5.18-rc1-7-g27d5486ca020b
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v5.18-rc1-7-g27d5486ca020b)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v5.18-rc1=
-7-g27d5486ca020b)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v5.18-rc1-7-g27d5486ca020b/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v5.18-rc1-7-g27d5486ca020b
Git Commit: 27d5486ca020b03d12410d03fddd7403dee7fc2f
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
