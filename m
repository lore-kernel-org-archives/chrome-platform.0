Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B860917EC
	for <chrome-platform@lists.linux.dev>; Fri, 28 Jul 2023 03:05:21 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1bb8e45185bso10810455ad.1
        for <chrome-platform@lists.linux.dev>; Thu, 27 Jul 2023 20:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1690513521; x=1691118321;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6vPgkrFnCVuZLDNzIZ4zFNgWypmClE5ypddC6MlUEr8=;
        b=xrks30o2mNoabWZ8nqaN+N3XnLFUW/RqmrHU2Q+JxlJHTA0zSx6wMuN64Mo9F3ugzs
         f9xem7MEYuSNSAgrXjLQCn1DN3pBzn5TKshMENuqIHbp2YNbuRW8TCBagW3JYyNmD6Vh
         6r62l9nqTcFHWFvWQc4HfM1XL3fo9Hb1vshKistUt8Z7ftkIFeMrzqTwDVBf/GgxX3u4
         tTgg85ls2JgZoL/Y+818YQowovyp+Vo55idjEb2rct1CjR5qnFz+X15u1kwYy70Ac4eV
         aXHGseEZw3V7Zl3wFTf8yq1SXjPVD3/T4Ewna/smBdNyNE6VZCT7sR+nuHztuOwBdfKi
         x9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690513521; x=1691118321;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6vPgkrFnCVuZLDNzIZ4zFNgWypmClE5ypddC6MlUEr8=;
        b=O+k6QnMmsZWnGrckX7JrDyaadMmWxCgzB+u1Yyh4jRdSpzFwodOQ/jBluIIH7iG/I/
         rbbTNAf4ppkC2A6uwotm3eaC+N39jjHBiZQG9Ii0Aywt+9jLaZAlXCNyXVTJ3b2Ib7j6
         y1vOFDTKS53llbF81GyctAk9wPWXZhv6eMJ27zc+WF7pgUSKfFresoACUA6uRa4ql5Nv
         JYY4vtY8fCIy20Xlam2TQGB1/6HniRvHREU26HD/Zdi19BHyru03gnhjqXA9oH57zWHt
         zaSYw9NCeZj3xCp7ObqWnM+y5CfALGur63ja834XvKTdzIwrmC27Nxfd4pM1q2kUeRI7
         5oKQ==
X-Gm-Message-State: ABy/qLY70i2MCDf59jVzHoyPp33b2eQNGLHSKIHO9pYNs63H4B6XsLcn
	WSNg2DAkZSlkF0EVi67EiAECGw==
X-Google-Smtp-Source: APBJJlGW0bWeS2mijVlCg6wx5dCi9CJc7r7T8Y1otahTv3zwjYXzKiIKxjNeVB5sDLd3dUhGDaU3UQ==
X-Received: by 2002:a17:902:6b89:b0:1b6:ba60:77f0 with SMTP id p9-20020a1709026b8900b001b6ba6077f0mr350474plk.10.1690513520884;
        Thu, 27 Jul 2023 20:05:20 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id w8-20020a170902e88800b001bb1f09189bsm2339707plg.221.2023.07.27.20.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 20:05:19 -0700 (PDT)
Message-ID: <64c3306f.170a0220.5d5ec.4d2a@mx.google.com>
Date: Thu, 27 Jul 2023 20:05:19 -0700 (PDT)
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
X-Kernelci-Kernel: v6.5-rc1-1-g0a329167220af
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed,
 6 warnings (v6.5-rc1-1-g0a329167220af)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed, 6 warning=
s (v6.5-rc1-1-g0a329167220af)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.5-rc1-1-g0a329167220af/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.5-rc1-1-g0a329167220af
Git Commit: 0a329167220afd2b28584594d30a0643d8a18dfb
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/li=
nux.git
Built: 3 unique architectures

Warnings Detected:

arm64:

arm:

x86_64:
    x86_64_defconfig (gcc-10): 3 warnings
    x86_64_defconfig+x86-chromebook (gcc-10): 3 warnings


Warnings summary:

    2    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    2    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    2    vmlinux.o: warning: objtool: .altinstr_replacement+0x178b: redunda=
nt UACCESS disable

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
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x178b: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, =
3 warnings, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x178b: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---
For more info write to <info@kernelci.org>
