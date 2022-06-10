Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B237C
	for <chrome-platform@lists.linux.dev>; Fri, 10 Jun 2022 04:01:30 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id 187so22777983pfu.9
        for <chrome-platform@lists.linux.dev>; Thu, 09 Jun 2022 21:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bqbg7Dhls0hFgodzVME4yjWhJnO2qZYs1zLw2ZnxBG8=;
        b=PyOeBwriaPman98l70k9qd940JSbs9enivAT5VGHKVMUC5I5s+witEjU5+eouoU3pI
         dZPGIulbKRk83LBVAoAjz+6VbDBTIzQjJSKZEkO4kJjdmsreIXRsaIdncUXqwsq+wtaJ
         A1dym5sslqkD5BFfztHbfI02NDFwAsbALOhswL7ROlB+agsg3Dq8LfilY3Q1BueOVmG7
         VPdcm4ckZF1cSG7jleGn50LBAeX9xDSCc4rlnlir7p4Yfb0ffMLbNpgLd6RtrAf6Ku/O
         DmJ8nRxWWvnQKB7HQsc+AgSiCmKHuM0mhRqNJHMNhFOtWZ1m7ttKnSHAfiYPexzqSwyj
         gv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bqbg7Dhls0hFgodzVME4yjWhJnO2qZYs1zLw2ZnxBG8=;
        b=kuD8/ODhH3CzfL6MomSNN2FRjtdMjj9el8sRvdk//aSSLSI9w1QIyFhf+nnR6EEK1P
         QliTdcEVYTAHJj+SIZHNkACU0QxbgpPr0SB9JEc1NKhFdPGpim1zVI3eGulL2R7l7bVS
         bgAFXcYjglgluno8JtjTQSdcw8MRTEL8HLWDYZfacB0Qf68RXkBw/SzECsNq/knmuBUM
         Va8lWJEFgGMLXZu9WqIDUFDmaQWK4i5rHBbwvXvS/djr5dhgUd4K61p3iNtgFHqJY+Uv
         8IVyx7y1B3V6nPFNAaPi2np+cxadty0EjPk+e1O/nSEc8mdjW/uN94ZOlMI5Bt3lL1hj
         UEjQ==
X-Gm-Message-State: AOAM530lx7n/hObZhWXpC/ApoDlIIAxGvahpCrcqrx0w8TBuS1uBkvTo
	FkGuFICgpiHmmsjHDTqp0UT+GQ==
X-Google-Smtp-Source: ABdhPJwjzYMPaJCRo/5WW6dBzM37ZbbPix3qYPg0Q8CAD5yy5hT5GUcvDBjIuibMNFTegyK9Y5k+iQ==
X-Received: by 2002:a05:6a00:1344:b0:51b:ed0d:dbbd with SMTP id k4-20020a056a00134400b0051bed0ddbbdmr34231408pfu.45.1654833689749;
        Thu, 09 Jun 2022 21:01:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p13-20020a170902a40d00b0015f300ed0b7sm17644366plq.76.2022.06.09.21.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 21:01:29 -0700 (PDT)
Message-ID: <62a2c219.1c69fb81.a4665.32ec@mx.google.com>
Date: Thu, 09 Jun 2022 21:01:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.19-rc1-35-g412b193d93912
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v5.19-rc1-35-g412b193d93912)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v5.19-rc1=
-35-g412b193d93912)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v5.19-rc1-35-g412b193d93912/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v5.19-rc1-35-g412b193d93912
Git Commit: 412b193d93912055f2389500102f4bd75ba9b144
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
