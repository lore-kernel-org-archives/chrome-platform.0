Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B70220F0
	for <chrome-platform@lists.linux.dev>; Mon,  6 Mar 2023 07:09:47 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id v11so9228601plz.8
        for <chrome-platform@lists.linux.dev>; Sun, 05 Mar 2023 23:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678086587;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWjbUGWk+MX6yGAMhai2U2X7TQt4X4sX0Z8BQSNsbbM=;
        b=7036w/odIe5eL7DkR5svPtqpFaucuyZtSuHZd7H3/dX3/Y/kr5uzmhCeHK/qyt+j8T
         oA7vsgAgqd+RTfywbUHaaDo/BPS0TWA/xCbO1eW1XSYx6kjKOUToub1crLX5BqLTa3DB
         e1Bi82WnU8i8FvizG9ElKJqr+TzliCGwE76Lq18N6eXB0col9DP65V2qPemHfz9HviRR
         skzR/hrecbEd9bM/ng8x7OBbgvwVG2p5cljLDIheZVVSWegBi9BWuvmhcx3qZBe2gNmo
         uRn+lXvQEJbGtTAcM8ApOsBbAlGWMy7xC0d+EnVMr01K4tRhqKqYaDR6M0pao/kgd7Z2
         oiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678086587;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWjbUGWk+MX6yGAMhai2U2X7TQt4X4sX0Z8BQSNsbbM=;
        b=8A33tiJVCTI7FDZYA2iZUJqYWFCZ4SssZyp73z5yHw+a0MTVfHzVMMYWBQQ3N26ge4
         W1UKqAVhhdi2XKM0d2f93pvdX02aLlk69kYrZtP7GEHK6GFrSlcuv9AEYVuq5KgkqqpO
         McCqb+v2P3U0KMyA3wnA4QB0rskpEOTnl7BQtmzBOUqIwFTHpJaOg6ySjlgux/HxtDea
         EonSiw0Z7t0e0NuD6GRXqppo6ohOi72Z2OuB0JTbGiyzz3rfhsnapCA13XW+axcAhtFb
         rlkAfc7NQXV9UuWSUcINgibAFkj72N7hUvJSf7UGKpRFHGDQFnVILfvjo2AmgqoO1oOX
         BhwQ==
X-Gm-Message-State: AO0yUKWHzLyD+yA84sVuIAUN38K8lDkGf9J3/B8rdYKa12AA0v+FneGc
	9m7Hnyhzmm56raBS0XId4M8H0Q==
X-Google-Smtp-Source: AK7set96n19tMgp2Yh0hgFDDB80L+JKvEkvcnOxXgm8w53ARv5wNhLdbttPu9V90oW5EhcegrwKPeQ==
X-Received: by 2002:a17:902:d38c:b0:19c:d6d0:7887 with SMTP id e12-20020a170902d38c00b0019cd6d07887mr9311652pld.30.1678086587547;
        Sun, 05 Mar 2023 23:09:47 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id bc10-20020a170902930a00b0019949fd956bsm5865743plb.178.2023.03.05.23.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 23:09:47 -0800 (PST)
Message-ID: <640591bb.170a0220.9e62e.a77b@mx.google.com>
Date: Sun, 05 Mar 2023 23:09:47 -0800 (PST)
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
X-Kernelci-Kernel: v6.3-rc1
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.3-rc1)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.3-rc1)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.3-rc1/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.3-rc1
Git Commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
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
