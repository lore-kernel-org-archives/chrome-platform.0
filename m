Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F89D7F
	for <chrome-platform@lists.linux.dev>; Tue, 23 Aug 2022 01:30:55 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id s36-20020a17090a69a700b001faad0a7a34so15697376pjj.4
        for <chrome-platform@lists.linux.dev>; Mon, 22 Aug 2022 18:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=H0xDttqnbKyiCqH7mg2MG0FwC2c48URqPuEzCozAi9k=;
        b=nYMT1sYzdq8xOjuf3/AY9SzbvqG1kDOxYLBgZ5u18Af5WlarVEPHZeeJ4xtuxt9VUQ
         Oum2cLVJncmUBQHPoCHCBbdry3fgyKJPDILag46JqP75FmmOdXkExWVOCac25dnBx7r/
         D144fhdiSb5/igcg0C+KpgIk8VgtcZYQqGRqj2K1f3LIXvO/RcT4xjCaQ1cLrSCycArY
         b0uULMqBAM5sqMn5wNzeQslhxz4C5Qj60RIsIGqbJGyCdlV4PuSS1lIDyzeASqFp4fpA
         XH6wfqFgsYFlBtFm4BOaggDX5YMLfpIL3URIBoiG3SowxmQMNRYgLZ1xBG8KxgEhJE10
         Ajlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=H0xDttqnbKyiCqH7mg2MG0FwC2c48URqPuEzCozAi9k=;
        b=XOaksXYBB+0QdB7lP4pAV8vy/zr35UxP2R9KOv7B2RPwrAmiHoh3j21Z9UV+fCMIFw
         RLRM5lcQqr8r+eqO6uQKLYl2oF0larQXiz5a4wpMYBPpWg03CTy6jIpVI0KC05L4XLAZ
         LZ9DhyH4ymel7TXXF/nrWwzqoGEznwE6k1tNYqj86gv9uM/kGcHj9C8t8KieJCys5l1j
         qDrpOeXbUda62C1leFdRAyZMFH58iM9gQq+WL3c9UW7k5iDHj7xAW4X8sNAmPNruiQ1z
         WPhzZpCgafAixQ8kOGg281Q/ij72Xo6deINDRujDB4gPlN0igpcGERH2Ru43fO8AsCPr
         m5Ig==
X-Gm-Message-State: ACgBeo0Xd4MHufFAcpyg9I7GtWg2rbhmPIrpyVlMfTARrmNWEZiaQY7/
	ccAQS/pDsnmI+KBZDzmCv4A5yA==
X-Google-Smtp-Source: AA6agR43tvR3RsD5xGxlwpsPiqDjoJ44fIX4unKJi0mRYE6SFlaWh+pCmrKFdpIB7I14/IUPNZc6Cg==
X-Received: by 2002:a17:90b:2516:b0:1f7:26dc:3d3a with SMTP id ns22-20020a17090b251600b001f726dc3d3amr984519pjb.115.1661218254598;
        Mon, 22 Aug 2022 18:30:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y15-20020a17090264cf00b00172a8e628e7sm9035842pli.190.2022.08.22.18.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 18:30:54 -0700 (PDT)
Message-ID: <63042dce.170a0220.2951c.0a41@mx.google.com>
Date: Mon, 22 Aug 2022 18:30:54 -0700 (PDT)
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
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.0-rc1-11-g48a86d3e4836
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.0-rc1-11-g48a86d3e4836)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.0-rc1-=
11-g48a86d3e4836)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.0-rc1-11-g48a86d3e4836/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.0-rc1-11-g48a86d3e4836
Git Commit: 48a86d3e48368fd79d1c4b96158cb77346f1867e
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
