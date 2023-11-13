Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CC533E2
	for <chrome-platform@lists.linux.dev>; Mon, 13 Nov 2023 06:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Iu05zfA0"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1cc5916d578so35607295ad.2
        for <chrome-platform@lists.linux.dev>; Sun, 12 Nov 2023 22:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1699855702; x=1700460502; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QMfMcldEBCDluhigvLtqg4AuFAPOBwgnf7fBTpgXD8s=;
        b=Iu05zfA0j2nHfLVBP01y8W0Y/c6EnLHv7LhpSpqQO6XQM8txZYf6Ll10WPoREtJlWE
         zhflBl6mekEuKAq2LCBC9jIU6XIDfYSKdSl1uBu1CXVBWVBrqcxKnu/IJwNWCMc9xft6
         fPV23lshOqZURyee5sI9F9VNgPLjNMwFKKjqh51zcDqVitvTIgjQhzRi/ujjEyH/ibAn
         dXB4CW5leXUMpAVfNj2zKSDxPECLZPNsNCNqGhkgdtrA9uLZYoOKdbmmDjukq0g1aM0C
         1bg0oOlV1l7CgJdNVRQlgvKVQTEtIZRlHODKqtIDNXf66LSmoYy4vJPg1kMioCyZ/PnV
         KmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699855702; x=1700460502;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QMfMcldEBCDluhigvLtqg4AuFAPOBwgnf7fBTpgXD8s=;
        b=v18sTKmaJgWMtYlp779M7HKWztRB4iNSB0+TnyY1ZjPvIU0Vtb4vUe/5mMHP9nMs0z
         MFZ0zaeYENJ1nAOHF5Xq5K8pBe1Uihl4ktK1QA8t+4TxqfJqwb0qlW4w0yqoI5mRr83p
         G2SfO6RLi3acBGr8TJ7/mU8ouMbD5hC506K9bxG1r4pOT/2pAsS+yIgHf5sKrQGKd4cw
         LC3/68Pl2zOrN9mfhWOo8GTHdXDqTeB2tsJpmDaHEHoVfKBu2L1Pa6eRZVIHoIZEr+1L
         zn+lDYgsDdewB+gGTRmsDEMogK1amj1sZDL4XzBnoYLGPfYczJN1/rdUIQhNwIo5pf8o
         sGuw==
X-Gm-Message-State: AOJu0Ywi44e4wdfLbRAdkmDNJ6oiczX2ftloff/bWWlVJpMWI5AHNMXQ
	ekiDuiwH3jZNJw9A0BXjS2e/7w==
X-Google-Smtp-Source: AGHT+IHnqMzU1XaykH0FGutGvAcqT1DeUsBuG1aDjFwZ7rCUOjuy/06/oMl8aSdoEf6AgYvVkH35TQ==
X-Received: by 2002:a17:902:b08f:b0:1cc:4cbb:c564 with SMTP id p15-20020a170902b08f00b001cc4cbbc564mr5111004plr.69.1699855701659;
        Sun, 12 Nov 2023 22:08:21 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id h10-20020a170902f54a00b001c5f7e06256sm3396525plf.152.2023.11.12.22.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 22:08:20 -0800 (PST)
Message-ID: <6551bd54.170a0220.479b.6eb0@mx.google.com>
Date: Sun, 12 Nov 2023 22:08:20 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.7-rc1-2-gd131f1f3b459
X-Kernelci-Report-Type: build
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 2 failed,
 3 passed (v6.7-rc1-2-gd131f1f3b459)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 2 failed, 3 passed (v6.7-rc1-=
2-gd131f1f3b459)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.7-rc1-2-gd131f1f3b459/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.7-rc1-2-gd131f1f3b459
Git Commit: d131f1f3b459980d38a59adc3598c96cc3a6ad5e
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/li=
nux.git
Built: 3 unique architectures

Build Failures Detected:

arm64:
    defconfig+arm64-chromebook: (gcc-10) FAIL

x86_64:
    x86_64_defconfig+x86-board: (gcc-10) FAIL

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
defconfig+arm64-chromebook (arm64, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warn=
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
x86_64_defconfig+x86-board (x86_64, gcc-10) =E2=80=94 FAIL, 0 errors, 0 war=
nings, 0 section mismatches

---
For more info write to <info@kernelci.org>
