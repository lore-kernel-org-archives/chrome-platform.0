Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5675A4A20
	for <chrome-platform@lists.linux.dev>; Mon, 18 Jul 2022 23:40:11 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id q5so10444288plr.11
        for <chrome-platform@lists.linux.dev>; Mon, 18 Jul 2022 16:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=zCvSe/H5GbNdNRYYznvVc3np+AznlIWfS9c2NY5WAB0=;
        b=mU2+pdxDUcPKt1NEXCFFEUvuF82WMTmQKe7v6artWis5XXfkLJ/fAc9heMSi7p0Nni
         rS1oDGYwmFaDvhV+FA8srXvCo189/93CYqY3uKjssgDN+c55xcFLJm/9+U1MmEVLAnof
         xMH3ZeDXrxJAkaaofl/4YpQyVy2bLzlFMXzRsLrMt3hIHAoeMG5y6iSVtbptN2WeDmL2
         34Uk0kAALR+DgJphHWYTBDJ4ixC9GxujXlDup6dbxY2iz4lRFNgnW54REXTtKBtrTs6a
         zv7/KDNHW7AT5Q0B6a1nRcjMWMS1aARbMswPcIve+UhdTnMIR4w5qHKpTpkd0xjxuzOF
         dDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=zCvSe/H5GbNdNRYYznvVc3np+AznlIWfS9c2NY5WAB0=;
        b=VCLQGLVmbKZWw8vtNj9SkTZwExBKtAtHKl2Ds60eEt0ABWmPhOrnmIdhxixN+y3J2p
         x/NEtbdmnvWbYtG7FNzALxRtcZZosgjcZ5fVLj0q/TCj0VCxVtJRD2/UC7+tMC+1TKww
         0WCcqtvvhS5RZyCb+hBKYJuE4yVJL+vlfv03uxeiJaVIL/stfnavpC9pqvITBSy5GuxJ
         HX5B4C3+jYqc6a5yZdPPMke5Dr0O76//6CeStDWXEWxkx92c2v8l6fqJ7sk3c0SivRo1
         8thd8Oinp+xNGVAYXWdwJ6uU3GH2jZpgN2MZR/jsSYD6Ns1nDS2gj7yQMSRIEQs0ZHdx
         BwNw==
X-Gm-Message-State: AJIora8KpMy9esTGaejq1xkrvzVcfZXR5HTk1A9WkD/bpaFE94BRNX9K
	CUMxkkkF8ZghFoP1JKY3h6KCrg==
X-Google-Smtp-Source: AGRyM1ua9IcjtFYqthUwYSJ06WZALZzsesmGonobenDegxZ3Kf5NG4EZgdo8MtaHf/ppLUZl8qd3Pw==
X-Received: by 2002:a17:90b:1643:b0:1f0:2094:57db with SMTP id il3-20020a17090b164300b001f0209457dbmr34517449pjb.140.1658187610614;
        Mon, 18 Jul 2022 16:40:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 124-20020a621982000000b005289ffefe82sm9863430pfz.130.2022.07.18.16.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 16:40:10 -0700 (PDT)
Message-ID: <62d5ef5a.1c69fb81.79cc6.eb36@mx.google.com>
Date: Mon, 18 Jul 2022 16:40:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.19-rc1-41-gc30628bce72f
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 1 failed,
 4 passed (v5.19-rc1-41-gc30628bce72f)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 1 failed, 4 passed (v5.19-rc1=
-41-gc30628bce72f)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v5.19-rc1-41-gc30628bce72f/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v5.19-rc1-41-gc30628bce72f
Git Commit: c30628bce72fc72d64c6764aee770e59d727ede3
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/li=
nux.git
Built: 3 unique architectures

Build Failure Detected:

arm:
    multi_v7_defconfig: (gcc-10) FAIL

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
multi_v7_defconfig (arm, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 se=
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
