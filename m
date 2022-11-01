Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E979366
	for <chrome-platform@lists.linux.dev>; Tue,  1 Nov 2022 04:12:32 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id u8-20020a17090a5e4800b002106dcdd4a0so17756499pji.1
        for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 21:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nR+OwvS45N5dspz+5z63156+y0LKf4Q1U3Cj4wSJsPQ=;
        b=n3GZMvoP3Ju3spbKvE8w3qGPmxDG7AhP2lxpksx/3lq31UcO3We0AB0ZvsDhFGoNHT
         LSkawjZVJ4i15ec6O2UiO9vaZfUuAFsWUahGFVfV8S+GDAygTt29qeE4D/XR82oBM/8b
         z4qhgDguGwgSWAj1LCrkKteMVFQnaUTDHqh4CHe4NLVVX9+wbSKb8bhMRK3B0Lqa9AoF
         hTXtG+WEwMJ3QqIWpUQRKqwEBvDnrWH03Dh4CuoGMFSOasV07pXrPTh/EU7VQVMnPFZp
         Kygt44ka3BjuzyTI7PLguv1Q0JjPWeGhibup8ZE9H0EIDSDf0Je3jjUcpr/qmZvSm+ZQ
         pBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nR+OwvS45N5dspz+5z63156+y0LKf4Q1U3Cj4wSJsPQ=;
        b=33fNEvnzfelwdNY3WXHekwb2tHzPKZzkVfyFmXH2GMJCJRgWYW1/WhE86eDuTy5spe
         btxFBHj8aJSYMcJO04TZFzw+KTXzfdDE9NU+jnlc4GVIWmaYiF7i4bL3hsH5tn+k5n4J
         rEOCPGE4OWjgI45O7xmNqoU9nGEmiYYiCeUAA/AG7QE12WEI7HQMfwU9dhHVEbmxhKnf
         ABAw6RwhQPtuCoivJMTsFzXk/wUI6jaCQWhbyg27+YJFP7a8aowb4hbuGYM1CqX+HBHP
         c2y9n59LR9LkIiM+cRhc5tb2IGZGplzFZULowKVvaETPEi5ruTOLYV09hNYIFZjV9nVW
         SALw==
X-Gm-Message-State: ACrzQf3LbM/hGY3tXUIiGqkXiyCUAPM/DJt66QedaH2QghizcG+Avw3E
	6Ov4m/kWj7hbaofM61A44Qy6Bw==
X-Google-Smtp-Source: AMsMyM4kT888HV/XwoYEOM3tcc9PV78eYpVZYxgxA2N2S8iD3w6YgIeAy75SLUXsdjxSMcvL9DzryQ==
X-Received: by 2002:a17:903:1204:b0:186:e114:bea6 with SMTP id l4-20020a170903120400b00186e114bea6mr60467plh.88.1667275951645;
        Mon, 31 Oct 2022 21:12:31 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w145-20020a627b97000000b005632f6490aasm5402447pfc.77.2022.10.31.21.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 21:12:31 -0700 (PDT)
Message-ID: <63609caf.620a0220.bd35e.9c8e@mx.google.com>
Date: Mon, 31 Oct 2022 21:12:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.1-rc1-6-g18ffa74c2259
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.1-rc1-6-g18ffa74c2259)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.1-rc1-=
6-g18ffa74c2259)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.1-rc1-6-g18ffa74c2259/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.1-rc1-6-g18ffa74c2259
Git Commit: 18ffa74c225988fdc907dd59051256d39816346c
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
