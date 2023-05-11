Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B49F17727
	for <chrome-platform@lists.linux.dev>; Thu, 11 May 2023 22:09:36 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-64389a44895so7455644b3a.1
        for <chrome-platform@lists.linux.dev>; Thu, 11 May 2023 15:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683842976; x=1686434976;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/tP6uHBFhbv89gAJFvXepms6tkv2gs5/R1f2MIXYZBU=;
        b=FyivS/ejFb+hp4VWhZCXgZTTyuqv1xuGan4deCi/lBlZ3hAo0xBX5bi53uEezjcpz4
         Ii8Tis9umW8d71GEU0l6xHuUoM9pc6Q9bhWHdZCvMX5XZIutH99UmFrIbqHUMFB1QJrH
         HyTnmUkh7Hp6RXK4DfZGB8MX92vlHsffd0/SMql2hLOsJPo3uu/5T/Kw85vzBhs5MVL1
         gyClHHpex69koKOdNiZcFK0/qFFIcdpGQwH0nwyhbar8z02qqo/wfQq+gJ6Y0vbB4dxq
         ZiBjdeVznv0jYuBro3IutjRguiiRFh3D0z4JXhgzUvu3fNZRjwgXi56Ow7WmpaXhFXdY
         zDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683842976; x=1686434976;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/tP6uHBFhbv89gAJFvXepms6tkv2gs5/R1f2MIXYZBU=;
        b=PhRl/YZeyjCVA+Sxj2NfzKNXSu2cVxzkiYts7xz92lWqSxstrTqkbeibK8fO4POM+3
         2ocQUcomyd6pcFTrmYnegQa22cXMz3jMoJRr5e5EzmGdkxD5SE/MZcncYGXa2pPfN7nd
         1CnbSTwccOmFQilyHTV7hlxnGUPFHmhpwt2ZPIUZ8CfvRE6Kq/EIrN0m8PZEczxIK7qK
         i+SS1dKZY7W7nXoVLHC171gJv6Lt3W/8oTt8u48LvTmimq9tlsijjh8bZzDfnDopd4NO
         75IlgxoybmNfzyorxRwB2H4CHeKhIqMJwBwGUOl7WRCedlDQTEF2wJO2wc/V6tJDxqL/
         yizA==
X-Gm-Message-State: AC+VfDzH5DWLsD85z1sLuzRp0hDbirlsmmVVZLnWl45tmMNM8IWGeSXp
	kcsxAQMBSYGaqSdVptlUUV3/8A==
X-Google-Smtp-Source: ACHHUZ5robJe21QWjmOm5MiHTob39UeEbxxnWoitGIy1bg66cJcaYo1LbK9Y/EOmpNbavU70UN4GZA==
X-Received: by 2002:a05:6a00:801:b0:648:d20c:37dd with SMTP id m1-20020a056a00080100b00648d20c37ddmr7618371pfk.18.1683842976519;
        Thu, 11 May 2023 15:09:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c16-20020aa78810000000b0063b7b811ce8sm5725940pfo.205.2023.05.11.15.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 15:09:36 -0700 (PDT)
Message-ID: <645d67a0.a70a0220.491a1.d132@mx.google.com>
Date: Thu, 11 May 2023 15:09:36 -0700 (PDT)
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
X-Kernelci-Kernel: v6.4-rc1-1-gc9f9c6c875d14
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed,
 6 warnings (v6.4-rc1-1-gc9f9c6c875d14)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed, 6 warning=
s (v6.4-rc1-1-gc9f9c6c875d14)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.4-rc1-1-gc9f9c6c875d14/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.4-rc1-1-gc9f9c6c875d14
Git Commit: c9f9c6c875d14a107dabcf4579fcab95ed30af31
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
    2    vmlinux.o: warning: objtool: .altinstr_replacement+0x17a8: redunda=
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
    vmlinux.o: warning: objtool: .altinstr_replacement+0x17a8: redundant UA=
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
    vmlinux.o: warning: objtool: .altinstr_replacement+0x17a8: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---
For more info write to <info@kernelci.org>
