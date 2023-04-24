Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EECD7C
	for <chrome-platform@lists.linux.dev>; Mon, 24 Apr 2023 07:06:50 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1a66e7a52d3so32435165ad.0
        for <chrome-platform@lists.linux.dev>; Mon, 24 Apr 2023 00:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1682320010; x=1684912010;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WBQpWeksGgdaclzKRaY60L8bwRdNTIwYI4kmdJrHAdg=;
        b=LzmlO6T3vBcDv9WZ9o0Gqam1ZaIQKQVFms7arqKuzzJBFf7+ncw/OkbxOnkygvYmYV
         SJPakeOS6MsVDLYhduh/wwOQNjRSzKR080e44/4zsklpxxAAfBn10M9z7VaGJrpBSTFn
         2NqI/Nnrh9OzeZMqM0GP3MU2yBkFoATAVsteQGOOfIp48QMvhI4FpXheXIUfuBhifms6
         hKnZ0rood6yK4qs0Ugc/Mdt+phqeEDBfO72fhB/0jywMYWmli7vJ2cp2/l+OjysWWuDq
         HwGq8oULB15ZFHQL8TKkarD/8V7ekwugV8eFSTr0m1ZWY1S1cffTHkUPEqp1OeqpOZds
         0Lpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682320010; x=1684912010;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WBQpWeksGgdaclzKRaY60L8bwRdNTIwYI4kmdJrHAdg=;
        b=iWdxwgSZVEffhk1cuRJVwoojDnSO53RPgmWT+QxbeKXmlEAb+dXUPaqOgH0V2T+2Wr
         M2eA9VyqseEWqDcn3ui04Dy5JybuukicVoVV849YDFTW08EVsk7sY2YdEPjpZGjE+cV2
         fHTczYquvnQRSU2NGVLbWoNXt8g82i2O3s9JwWQOnOtLYDhovuARaLLICHLNzizJGQbO
         w0oipNN3SZLrMeLOwaxsB0fQdygjLmK3lhYxfvHOmI1yk44U9l10bohX1WUP/vw7FvR4
         +eav/QVk+q0ewhS2aQ7xP0qNNYiT/J3dGh2KOYlPmGr5VHZsCrYz2p4hoHkxWBAY1zZU
         NElw==
X-Gm-Message-State: AAQBX9cbJPckcySft8OA/L2ZWXkhP0H7UVXIak7xnXtTDHHHPvFw/tgX
	m6QlkEeJ6ReqsAnnmwyCdmLsbA==
X-Google-Smtp-Source: AKy350ZLXAXHjoHPeWXwPV28Lf2pxGnZLjSVsyavcZXWYBvnty3YW3x4r7wH1ujeX4JHlRxpakh3pQ==
X-Received: by 2002:a17:903:548:b0:1a4:fae1:d6b0 with SMTP id jo8-20020a170903054800b001a4fae1d6b0mr12093274plb.28.1682320010373;
        Mon, 24 Apr 2023 00:06:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id jj2-20020a170903048200b001a6d08dc847sm5964012plb.173.2023.04.24.00.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 00:06:49 -0700 (PDT)
Message-ID: <64462a89.170a0220.9ff90.bafc@mx.google.com>
Date: Mon, 24 Apr 2023 00:06:49 -0700 (PDT)
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
X-Kernelci-Kernel: tag-chrome-platform-for-v6.4
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (tag-chrome-platform-for-v6.4)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (tag-chrom=
e-platform-for-v6.4)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/tag-chrome-platform-for-v6.4/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: tag-chrome-platform-for-v6.4
Git Commit: d184d60aa301e424cd0cf7de90b40744710a2417
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
