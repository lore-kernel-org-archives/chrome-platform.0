Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5F7D308
	for <chrome-platform@lists.linux.dev>; Mon,  6 Mar 2023 04:11:57 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id y2so8482335pjg.3
        for <chrome-platform@lists.linux.dev>; Sun, 05 Mar 2023 20:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678075917;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=I6TQX1EkaU3kRn7goaRi7scpuv4XN43tsueDAQg618U=;
        b=WADzByIgKhvRYQTVYtK3QPa9M8Ly+WQZ/THZyHwnb1hRnoaFx23SJtZrn/hizyguym
         hIYwtHGggKDAO4MdEwAzfXSW9B1ej7o6bmnnrkAVITL186hI9rstSGbDzs+Kfx9E2YZB
         WXKxOfaWU9sT9YiWt0mzAFVcCwgnW/pHhSGTJtxY6hCTl3yRA7Y+S1qOu4ld88352L15
         FLsySkMOO9OP7hfBRJoVCjgtBVMbs4unua2tIk6/kKD6VkDkt6CWYm+woeX0fG/9+wk5
         NlqD5kwmA51434cssAMCG1sqGyUiKwyR+mjS+fKc32Upt2gEBsqKESugQ6NywmmCZX6h
         Jddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678075917;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6TQX1EkaU3kRn7goaRi7scpuv4XN43tsueDAQg618U=;
        b=kZGBAQDEQwtT2PSISyAbq9+M3TcXOwCgVGc/vrpqY3w/oTnJG7Uy3HMbikf4C1daQZ
         2SXgser1iAfJPwCytb+CEuXgJkxuQcco/cF0eH8Ew/o1Xcs2lG78fOuD5y5uhakodPXf
         zuDU0ao5kLiXhh9q/PRJCeHv8ofJbK7A2vEQieRBfCQqUspZvsOaUSDpmtVamtTz+nMv
         RV8bNiVrCJOBHkAXYwUqcpSSfVGrMVYSB6wMjRQueRPimgx3aBMX+H21xoKsv2Tr8M2U
         L4ZZ+sWmCj8y7ibWXmTy6CGd4DDfzI1wF9UxCvP7xFR1atTb+sMDhtveUnbuJcdGE+OS
         kgIQ==
X-Gm-Message-State: AO0yUKVPkOyLvTGpz15HIKQq42HVbt+/GHzlTj2tjc9xK14+Ng4kbuVA
	DJ/01sELcOLMSu2SQlIV/5ihnQ==
X-Google-Smtp-Source: AK7set+v3jSrPQM6CMMaA4j4Z78dI6y7IJ1FYCux1UkkFbBmksvJV6FyEisBTDGsKNgWNohJD08uDw==
X-Received: by 2002:a05:6a20:7343:b0:cc:fbdc:886 with SMTP id v3-20020a056a20734300b000ccfbdc0886mr10924407pzc.18.1678075917388;
        Sun, 05 Mar 2023 20:11:57 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d23-20020aa78697000000b005afda149679sm5346393pfo.179.2023.03.05.20.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 20:11:57 -0800 (PST)
Message-ID: <6405680d.a70a0220.b5b35.9edd@mx.google.com>
Date: Sun, 05 Mar 2023 20:11:57 -0800 (PST)
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
X-Kernelci-Kernel: v6.3-rc1-1-gad79d30ce40d
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.3-rc1-1-gad79d30ce40d)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.3-rc1-=
1-gad79d30ce40d)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.3-rc1-1-gad79d30ce40d/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.3-rc1-1-gad79d30ce40d
Git Commit: ad79d30ce40d8c5edf5e93b1d334162af3a15aac
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
