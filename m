Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDCC1876
	for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 22:00:09 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id h14-20020a17090a130e00b001b88991a305so4475613pja.3
        for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 14:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=be23y+K6ZTpcYYh2t+o+N5f2DgHzcdIMmCKO6ecFGx8=;
        b=BHVkrsljJaDH+vjQXoVRxPZe5sjRTao1C8uMv7lYWGLTKhr3ql2spLJSDXG28XzM7r
         RFQqErv9T4fYJM3fsqY0vJDkgLHrr/vyQDBI376vV89k02wN51dMjaU0O43+6J5XxnO5
         eRztxwkGYHq/M9fHeOd0agN+wrns9XiBE6M+HXY6VXn3b2TFpkttLuKQ28GeogO7uLg2
         jMwXnpNflUxyioS1aGgJSoTAjs0+7DOuOTTdHiBoXz/VPlAIAibCFWKPmnORokHop1qw
         U1+qOBfTowUI6l9ot9UTAO+zpYokRf5E23NcNN9U33TXD3qRXB+7wFI7ejTYTbxrcEeN
         rE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=be23y+K6ZTpcYYh2t+o+N5f2DgHzcdIMmCKO6ecFGx8=;
        b=fbYV30eJ65t6lty2fzEinB8v20YrcY6UijEfEreb+316L2rp2ngtZPl440kTfVp/6x
         QPNOdcwm06kkmzvKNURS2nmJViK98eKgBLRw6GUw5FJO77CfqKcwc5FNabs2iusvlo4C
         VACnzQkdg7sp2XN6PgudatjWwxhFo+9XkLS/WM8OTKlAhkHStaGUSsPYpAYRUiFIsx7N
         M25aiwBIw936JSQO/LSpTkL3zB4YDcVyZmbN1LzcjOnjNl7F77VXjGQjSmhVhaSj7i6H
         6rG1A1W+G5HPgNYYOiuh8H5xkEX6xh0TGFsUu5nWVMJFVmOrVA0wSyByx8b559Viz3pl
         SbvA==
X-Gm-Message-State: AOAM532BZhekNgSHwkkkX/doM/wf5sS1scnZ9R2zuXsLmGOUDKE7wyDv
	ogdM4erM9XBtklEu6y+pXBEVzw==
X-Google-Smtp-Source: ABdhPJx4ENZ01xPX8oEpW7m0TQnryzS36IB4jm1qOWMkrFDMw2PzDJSlL/ER7iqE0c0EO2eaxLmDhQ==
X-Received: by 2002:a17:90a:987:b0:1b8:b906:2499 with SMTP id 7-20020a17090a098700b001b8b9062499mr6773463pjo.108.1644962408794;
        Tue, 15 Feb 2022 14:00:08 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a15sm3303497pgd.11.2022.02.15.14.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 14:00:08 -0800 (PST)
Message-ID: <620c2268.1c69fb81.e7938.9052@mx.google.com>
Date: Tue, 15 Feb 2022 14:00:08 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Kernel: v5.17-rc1-8-g981d3de32cfb
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v5.17-rc1-8-g981d3de32cfb)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v5.17-rc1=
-8-g981d3de32cfb)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v5.17-rc1-8-g981d3de32cfb/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v5.17-rc1-8-g981d3de32cfb
Git Commit: 981d3de32cfb74afd48d44805b8f5943a1723aa0
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
