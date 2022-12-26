Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65457E3
	for <chrome-platform@lists.linux.dev>; Mon, 26 Dec 2022 09:05:24 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id b2so10272652pld.7
        for <chrome-platform@lists.linux.dev>; Mon, 26 Dec 2022 01:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r2r7nbUlBQ09uX3BHu2WXuv8fH1VGPWoHVpFkfHoqSw=;
        b=TBYxI4by0ackxPXlmJ1xMfFdeFIZeFbxHAgYxqiIj0OXURi6RpWyEDUUdcCszd5NG2
         tDxmhq7knjp5CGUc7tJXy+0bT/xxueySQ/b+TDQMHuVuMAzWl4bg5xGFE4zITqExkwGL
         0h/U++tt1tNfqXuQcNxI/7nYLijrMV/46kXtWggfZEOBqaYxfu0ZSvy2FGZdEBwosN8L
         4HMjUY+q+QXWZVOWmxoKPx0YeRrcahDpqStjgIADOTDkTT5G84sa+Pc6xmCBMf46gdOH
         o7FC3SyweYMmIcWJLLbGo25+Sd3wE+sX6pxLY7Vh2eSzTXKxaI7F6HsZQ20Ox548smta
         jBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r2r7nbUlBQ09uX3BHu2WXuv8fH1VGPWoHVpFkfHoqSw=;
        b=u45RDxEmp85LHJReKDor15CaWLf7AgrNUeaFUJlE9RmvQNW62VEJPPY5CRr5xS/s6T
         dsXMoc6F5C8/fi7zmi2oPoVTMRSQZLRK4+bp9g/ZDhqZUbvEfsdimgorl4tmFzCkkw5V
         zQ6Y2Bvm3JaauTADFE6ta4K8J/v7Lgl/sJfPgXKXEdCzbYg6x5lVcwapizEXGaQdWHrZ
         0pP/XgBnsfEvGOlXF/OJRZx2HSCUL3F0qO/iaUyll5JGGDNdxhznIvGkIdLGDUgIm+3g
         WRCrSG6NKoV7sr0ptlxEF202jgQok38BEKMczagTCVmncFAgJYbzA8KC6mwMdDhEUtUG
         B8hA==
X-Gm-Message-State: AFqh2kotULnnQ9y3WFoO2hUJ2PAeLP1cQVWKksOz7SS2HMZste8GOc+1
	/Afnm/veWGwBd0UmG0jhb/feow==
X-Google-Smtp-Source: AMrXdXsiG+QEjHkrMF7iBSX+rVOmevhrhaBHdV3VPp2CzCL9qVLyKbq1iQcevx6v6II4PeXL393Nwg==
X-Received: by 2002:a17:90b:4cc2:b0:225:f095:a3dc with SMTP id nd2-20020a17090b4cc200b00225f095a3dcmr3234194pjb.14.1672045524273;
        Mon, 26 Dec 2022 01:05:24 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o22-20020a17090a421600b002086ac07041sm5877198pjg.44.2022.12.26.01.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 01:05:23 -0800 (PST)
Message-ID: <63a963d3.170a0220.90265.a81d@mx.google.com>
Date: Mon, 26 Dec 2022 01:05:23 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.2-rc1-3-g942956ddbb33c
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.2-rc1-3-g942956ddbb33c)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.2-rc1-=
3-g942956ddbb33c)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.2-rc1-3-g942956ddbb33c/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.2-rc1-3-g942956ddbb33c
Git Commit: 942956ddbb33c13ba4381d9557cd69d1e36cf856
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
