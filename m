Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8531F321E
	for <chrome-platform@lists.linux.dev>; Thu,  9 Mar 2023 09:01:40 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id qa18-20020a17090b4fd200b0023750b675f5so5345861pjb.3
        for <chrome-platform@lists.linux.dev>; Thu, 09 Mar 2023 01:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678352500;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wQxop2fMkwxHBQ73ToWaE6J4Q5fBTJAsHx1UHqpyTrY=;
        b=Apd4KIuoMkxSynbWjxz+WQESjWh02dQB3fMw3mrGL9Oj85naG7iFP6fDWR945/F7Jz
         0fUwSMGY/5BsfdbiD2kCe42uCm3hDpIzGPOjN/o3roRzLYEvRCjBu/M+syicGlZN3+T4
         HX7u6JcU00mbzZUTjAtXagdr2137i7pdaj8RFGKtbFDLQacpiJMriZM/30tP+VC+2697
         NqlV4026kv1oqNzCZnDo1BK4SC6vTFyMN+yf1UODG8S0UUN8xlgxCOSKr+j9+PRQ5air
         FnfgzIDb5yZdyKCtr7qd3ej1jc7mWKIZ4oohl0oEzKDdxqYfiGoeblX9e3eeTvD2YgNX
         QtQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678352500;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wQxop2fMkwxHBQ73ToWaE6J4Q5fBTJAsHx1UHqpyTrY=;
        b=umAuNJodE1IfZ30yIoZEs0s/WUgRymdsvxTl4Z+8moLHnD/KYrILGjj+nKhbziNmWw
         /HW2aPXG9nqQDfwOg5A0VEqrPkwI1LDdmwPlsz6LQ4EShffEz3j4TFJ80LqUy2fG75oR
         PDlt8LOcw70yDnBt2vorj1mBkntS2m8Gp5ak3DBCGp+eNzP3SVbP2yGp0UOOPgYgDZW1
         K2KfxA4NJaisNQoQe+f9xfjFWRdNp3kurAPwkuphF+HW9OZQMumUFMv7LKoSkf42EZnx
         xIQF3CMIG1Yx0v/bVSWx94e3vsk17MpquS4qxDsCAS4BYHDCU+Fs6Yr2EPH+BNmThXaH
         LPjQ==
X-Gm-Message-State: AO0yUKVJxGwgKkMm4pgfCTN6dmOijLROYZFQe1L6VhjHcTI9RQoB1oT3
	BYYpirL0gpfBRnWUsRYyncwEmA==
X-Google-Smtp-Source: AK7set8JAWDLGY5oga0b/TIp7li4Kur20UpPjYP//wUQbuhiFw7ck98tdY04jI4wE8xxFWODcreThg==
X-Received: by 2002:a17:90a:19a:b0:230:ac12:a5ca with SMTP id 26-20020a17090a019a00b00230ac12a5camr24998526pjc.3.1678352499893;
        Thu, 09 Mar 2023 01:01:39 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b9-20020a63d809000000b0050300a7c8c2sm10523773pgh.89.2023.03.09.01.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 01:01:39 -0800 (PST)
Message-ID: <6409a073.630a0220.586b7.30f6@mx.google.com>
Date: Thu, 09 Mar 2023 01:01:39 -0800 (PST)
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
X-Kernelci-Kernel: v6.3-rc1-2-gdb7df0cfaff3f
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.3-rc1-2-gdb7df0cfaff3f)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.3-rc1-=
2-gdb7df0cfaff3f)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.3-rc1-2-gdb7df0cfaff3f/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.3-rc1-2-gdb7df0cfaff3f
Git Commit: db7df0cfaff3ffe5c125f8b79bcd54a4ad163b37
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
