Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904DD290A
	for <chrome-platform@lists.linux.dev>; Tue, 10 Jan 2023 09:08:38 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id 7so7789955pga.1
        for <chrome-platform@lists.linux.dev>; Tue, 10 Jan 2023 01:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OayDjVpekysRuE8en7cStjGgJnyfI0Dn7hmDtsu2GBo=;
        b=LiSyr1N7dR3t5u2pfs5cYYhWK861GAuM78QotB3PkhGH0nHMrZp3nO9v+5Y5eQMK8b
         3jj3gB6YWJAXqy/VqgOXeWYkzhnCa+9/l3rjn5nfGjcvM8PGK7uCbc37WejDAg22lDb2
         54ihG7uvH62Rab/69RZPf2H+d5MeEii+8W1ZR+rIV3JS7DGxtRUtd3pSaaj+DkTDCvzu
         zHTahD/7dhVvpOFOVe98cSOC7iwZl0+YhhDI4Zy1P6Wa+E6APh8UZCSR+m1SUFtmcdGb
         ntaFQsTvjwB5jfmahQRw3XnwRBXdvMmapdhncRnuyjFrVGzUlB36ZkZ1M+46vfI3AgD7
         kX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OayDjVpekysRuE8en7cStjGgJnyfI0Dn7hmDtsu2GBo=;
        b=kxd19jSrvNZRTcAuDW9k96PW9tuAk66FmiJUPlT7pIFyIjvQc0Eis35pg/naqjn/ZL
         gRy2VFdGr4h7J8AkiRD0Fcf9jXzEsGitDXU3FGiZxnUX+n3gnYmkz9cOjCEBy/B4g7Af
         A6Bx0VbOi93c0a++oS5OfQtLqW/hfVuXF4+AuwB3YdPoe3Pfw6Xkd5GQrLAPbqcv4xRr
         lkdSN8HRemxPbn/QRuK95APivKv+ko86XUcyA+zEgv+VY7qLPMFsyCzmkaIKr3+fs6kk
         VJu9efTSKAumcOfgc4MgutWbnqb+b+E1NXf1NJwdPPRC5zKfeB3Vnx1Qs+q+s3idNf0h
         NLgw==
X-Gm-Message-State: AFqh2kq7wQFBvVfKpCB9x7Yod4fSIl9WAttjwBX8RnDRemM6yWdEEFBL
	TlaJl82XB8HSdEGUNMU+4wwIlA==
X-Google-Smtp-Source: AMrXdXsBtNTXyX732x0+E4PBDiUWk1VP4iJil7+AW+mO7VgJnUUTUh0l079j2kqvds5AYHtIabsQIw==
X-Received: by 2002:a05:6a00:3490:b0:581:947a:b701 with SMTP id cp16-20020a056a00349000b00581947ab701mr48984696pfb.17.1673341717922;
        Tue, 10 Jan 2023 01:08:37 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k29-20020aa7973d000000b00571f66721aesm7560739pfg.42.2023.01.10.01.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 01:08:37 -0800 (PST)
Message-ID: <63bd2b15.a70a0220.382a3.bec0@mx.google.com>
Date: Tue, 10 Jan 2023 01:08:37 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.2-rc1-19-g7b6d5b3800cb
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.2-rc1-19-g7b6d5b3800cb)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.2-rc1-=
19-g7b6d5b3800cb)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.2-rc1-19-g7b6d5b3800cb/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.2-rc1-19-g7b6d5b3800cb
Git Commit: 7b6d5b3800cba45ff486737a5a831a46f1196fb1
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
