Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2EC15C6
	for <chrome-platform@lists.linux.dev>; Mon, 24 Jul 2023 07:44:29 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5638180156aso2310380a12.0
        for <chrome-platform@lists.linux.dev>; Mon, 24 Jul 2023 00:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1690184669; x=1690789469;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BpyrcPv8iueswBpTydLc4GM58layvdzbpDW0ErayyrQ=;
        b=pdPmZhlRTn6TTBC5MLC57YJsCrRFzNMGVHoOCc9KFQlklLsTxOsxi4240xbiTti5/k
         HNoAXhuk3fcUUOS2kJ7hKKRwE/VUnQ/y1ar5DHgLSUBs4pV3Y8B1aU6NFIfi707pDh8w
         jQtm5DUf3UrGRQnCDdhyywyQCrGfjV6tmx6AxV9gK6BSOY85BAiJ818k5PAHkPRHhUXj
         7Va0Sk+s7Gp8v9N3nPJag9qFCPEgYSII9US/w8sI4Tt+xM8IZx2wM4d47A9MC+uXnyES
         vKWqFJjMB1KeblWttElZDFgw+v4Ho4dc1dEdgQGrt8z4JbuIFDTIaVB5cCC1z0tV4LO2
         pckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690184669; x=1690789469;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BpyrcPv8iueswBpTydLc4GM58layvdzbpDW0ErayyrQ=;
        b=EAuPEO+HMzCB+IGuQxlL3cwfPXm7T+LHW3bn+AUr/1ZXvjtcRuLhjZ3sfhT820do7x
         Szi5xUA1J3RXsCbxF0sL7UuUFp1+AJkQpE845Yk87phx0JlOdTjhHTYoAsEHRXR1R7rL
         xBLon0SDpV5kC0lONxY/xJ7njy4qelXf+6Judw3ke3tUvJnTKM0nSPa1yzuN0mM2+GJz
         +awNT1B1WcMel8KYgV/hD8BQ2PNhKV1MW/2FDsvPwwO/j93RYvBLjSOyP3MIpMvvr605
         ieFE1WaO40I6LzuCMJuA0Z0aeN6M/5ewvguKJ73XzVO8a8gSW2gPkrRAz3Amu0KZxCxk
         XLDg==
X-Gm-Message-State: ABy/qLaYdydEhpELxu+BIWtq8KZXyfoAw0jKKt8XDt05Fy0U/P6Ibfq0
	0VWn1FcVojDYwckbpWk8DtAn6Q==
X-Google-Smtp-Source: APBJJlGWOkW59H672cwM7OETkwG0OwlJQD/U3j8bosRDd0mCZORgubRwRWdgLmHAj7V80riAnw175A==
X-Received: by 2002:a17:90a:7c48:b0:268:273e:b75a with SMTP id e8-20020a17090a7c4800b00268273eb75amr348580pjl.16.1690184669077;
        Mon, 24 Jul 2023 00:44:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id rm10-20020a17090b3eca00b002636dfcc6f5sm5943901pjb.3.2023.07.24.00.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 00:44:28 -0700 (PDT)
Message-ID: <64be2bdc.170a0220.8555c.9fc5@mx.google.com>
Date: Mon, 24 Jul 2023 00:44:28 -0700 (PDT)
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
X-Kernelci-Kernel: v6.5-rc1
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 2 builds: 0 failed, 2 passed,
 3 warnings (v6.5-rc1)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 2 builds: 0 failed, 2 passed, 3 warning=
s (v6.5-rc1)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.5-rc1/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.5-rc1
Git Commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/li=
nux.git
Built: 2 unique architectures

Warnings Detected:

arm:

x86_64:
    x86_64_defconfig (gcc-10): 3 warnings


Warnings summary:

    1    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    1    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    1    vmlinux.o: warning: objtool: .altinstr_replacement+0x178b: redunda=
nt UACCESS disable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

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

---
For more info write to <info@kernelci.org>
