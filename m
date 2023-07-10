Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A563523C6
	for <chrome-platform@lists.linux.dev>; Mon, 10 Jul 2023 05:44:34 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-55bc29a909dso1994887a12.3
        for <chrome-platform@lists.linux.dev>; Sun, 09 Jul 2023 22:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1688967874; x=1691559874;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BpyrcPv8iueswBpTydLc4GM58layvdzbpDW0ErayyrQ=;
        b=MVoYbHmE4Rz5/JfXdWacIQkWxxM0bqrV8vd4mVOA6x6NeC3YNo3rZkti8je75NjnSE
         pp7vtH6v9ZPXRpr+YL3zAXqzrVdfAYryKbvVSVUAAoHmy2hmcKgUehAP0x92CSs6qtNo
         D0SsfG+uv3hcRtX/Rutv37UC3fPUluef0SnSl7+85sEmJHlo/flYThmpSiaGHcHsXnpb
         Q0iHJ3G+S1i6z3e9SbqBwyCbVFFpm2KD90h2YKMt5pQMzYSfEIBLpnUwIb3KcYg4rmWA
         wcgXfCq4CenT79WN23LXDlzlK0UeC0KeuFPOA+88AEtqKVrWoTxK3T2QDJRDyjvN2iKu
         ajxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688967874; x=1691559874;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BpyrcPv8iueswBpTydLc4GM58layvdzbpDW0ErayyrQ=;
        b=lvEG4BNX70MK6ePNqbFrnmtRXclai9CUIhp/eRtNhhW/cS4snrFEB5ZKhuGdtcl8ks
         NsF7AzPe3cgtIn92fvcnnD+cPcEPECXod43iqXT8VcnQVGZ/Bqfkldkv8Lx9gONnK8By
         JMEZJNW/5wA6wYmRcOHb/CoLE6c5csmdInHi8mr8fGvkWvqqhbuGepU4ClLTC9VfhXaR
         KI1asYzltTQsaVjs6ZsvUHYIEMJ78/wd63NGp0U5h6UvqbgNaSxVFLPliu57JxPsQmkg
         8CrnsVGXvaeYMy6wXgwMgr92VnQCR48AuA6YzEoOotYds0lermfY3km4W2uQlP0PqbQS
         2W9A==
X-Gm-Message-State: ABy/qLYxg5uKGXOIzcqd/YWKxc34HIcQRNC9Si4lmmv/dh0eSjroMSAf
	cMzxj1xsdIWAryNZHytJpAUaXA==
X-Google-Smtp-Source: APBJJlH2mseQKjiiacZ+/mhH27jcC5ia52qZIUxEKsEQU24UOzQFdfgu6sxfTX3XaTzTaT3DRkREeg==
X-Received: by 2002:a05:6a00:228e:b0:63d:3339:e967 with SMTP id f14-20020a056a00228e00b0063d3339e967mr12067498pfe.19.1688967873796;
        Sun, 09 Jul 2023 22:44:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id k21-20020aa790d5000000b00682af93093dsm6210392pfk.45.2023.07.09.22.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 22:44:33 -0700 (PDT)
Message-ID: <64ab9ac1.a70a0220.2b67d.be3f@mx.google.com>
Date: Sun, 09 Jul 2023 22:44:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.5-rc1
X-Kernelci-Tree: chrome-platform
X-Kernelci-Report-Type: build
X-Kernelci-Branch: for-kernelci
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
