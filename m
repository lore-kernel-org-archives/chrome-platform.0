Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28075801
	for <chrome-platform@lists.linux.dev>; Wed,  2 Nov 2022 10:56:55 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id k7so6494855pll.6
        for <chrome-platform@lists.linux.dev>; Wed, 02 Nov 2022 03:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nPv/lQ29HuwF+CHZ+SAeHy+QJLZqKig/LJrQH2GOoqo=;
        b=w3rIQqY5bJs+WY0HzvmdfVRge+mnMa8XxV9sxi5hcUyky6G2BFE9HZwasbWAYLaWdu
         eg/RohAL3N/dUAwmh30++XCjM1BwJM/f0xl786exikl6rQB6uVZk8fW3x5GGiH/CeDuL
         kS3HKMIdrui3ORLJA9VjcoPHn+N3TgtEcEzkuEBlH5VmDWxZDTDsoiQLHQYkMTeFXeqh
         fFMcYJaZ5IubxXBd7iW9/d6skiqhUMllI6lNo4Mq7UTX+H5fguY9coLGII70+l/+9Mw+
         AUshmNmM0NQtNyWbCVrOs6+42MBJzev2AqbrJvDk8j297wbZ7rwRRBwj6C46a+UWX60L
         1MFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nPv/lQ29HuwF+CHZ+SAeHy+QJLZqKig/LJrQH2GOoqo=;
        b=boUU3zhA4y9ZqkRJMzVMtQRKRB98fUQvpon3ygDPT8sAgUA+0398dMMcWJkaowqwuq
         d3bLQ0/bXdUWLb5/ULuxLxm6sMltCyyg4UykurxuBVuZNxZKWn1+K8HQjN/Vs8oXhWkR
         FdwCAHNpv64rmT9Gv4dSqJg9CK4pu3k2iO67HzGmgkG+hKpxCYqng+FuN9hheB0wvl3w
         Asam+lol4ZgrY5xgPQHA7nxeqVZedbQqoTjmEuWKffshj3G1RykWtdixN0dCcQRxjDGE
         Ed+8855uRR4GJMSJrbS7Goju9vHLSF1LF3Oh/UNgYdvynL4LzM7E8C5G/lv7cBTKFp0m
         9CbA==
X-Gm-Message-State: ACrzQf3r5YEz1Fj+17itrh0smpBD5mc5r3dVK+OBSF+kfLOM/Ufq2AVt
	lP9Ie5Vu4SfyXDlj4JhXyKwoqQ==
X-Google-Smtp-Source: AMsMyM4yXSWTFUfexURoHmIpAw/OkzxlXdiEQMY3DHRtYpKztTOLfDiQoB+0vmYCojbHwXyuCjgB8Q==
X-Received: by 2002:a17:90b:1d90:b0:213:c798:86f6 with SMTP id pf16-20020a17090b1d9000b00213c79886f6mr19876281pjb.84.1667386614614;
        Wed, 02 Nov 2022 03:56:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id qe15-20020a17090b4f8f00b0020d9c2f6c39sm1170879pjb.34.2022.11.02.03.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 03:56:54 -0700 (PDT)
Message-ID: <63624cf6.170a0220.a58b3.1d3c@mx.google.com>
Date: Wed, 02 Nov 2022 03:56:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.1-rc1-12-g52f572342440
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.1-rc1-12-g52f572342440)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.1-rc1-=
12-g52f572342440)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.1-rc1-12-g52f572342440/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.1-rc1-12-g52f572342440
Git Commit: 52f5723424401d8d2efb78818d5a38684d70d519
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
