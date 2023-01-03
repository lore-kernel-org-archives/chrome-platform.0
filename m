Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354B5625
	for <chrome-platform@lists.linux.dev>; Tue,  3 Jan 2023 07:03:03 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id b2so31690755pld.7
        for <chrome-platform@lists.linux.dev>; Mon, 02 Jan 2023 23:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DQy77OWbsV37VowjX7DnjEhAuQqrAcMVGSnzH5EZkcE=;
        b=Mjwi5xIxb0Hfw/aG4kdRseZDtnUtWkLGZQRNSicsBdPA3/aMEFqeW2BGQpZiRLqdWe
         lvkqA3iJeQBxqyiwhFnJp/FViozE1KlYJgoEOtWe0XLPggo2fNVEFy8L4Y0N7HSQY7co
         uU87zDFAveBakXYHxBNyI0gXZIH43DdBJK/SmmmjqIi+znnYzpBy52C2llrwWV/vGfwi
         lGKDexS3d8jhLTK2ZBSLqzai1balElkqU1MVx3nWjEHVeiIsOTDQhVPoS0qcg5IlES+S
         rvxkAnXHNtuYmd3i9Fd5kKQlBw+/6PaeOcLCU267WWOML4nu12ARFVlafbR9AC16FKNz
         WjcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQy77OWbsV37VowjX7DnjEhAuQqrAcMVGSnzH5EZkcE=;
        b=QLsP3KShcUYb/vaNJ4QB2MLXIcHhKIglv7J57zPhyXRKBeYRg6kzj7QZzoSxss6f5S
         foVRdDZxu0YmF0ICYrW+81MVnJli53pidyFkKPWfpQK5IZCS1SmdSk+vhB1Aegi7QLOp
         fzq79Ry648nJ0MU9etj6Ef3yYlN3iYb538UTqn8ONW68enX0UnLSUTwIvLwoB3XAXnUg
         nuJoPfjwZMa+PC+b/zNpfCbQeX5tHObjTWn4omo3StGLIYHnbFQe4wpUMsOoyM8eSKB6
         u++EVmaY7XdNK9xbYb/uuYAlYP06g4QzPwwt8KtcoNNKOR7uX4rBeHQ0xFaCGOCtbmiD
         9Y3w==
X-Gm-Message-State: AFqh2kpnDUI+kF3yBQWDXRGBLiPx4JES1cfmgI+AILLa8ofV76YBhWKg
	IOeAMoRUyeN+Ve0ji0vCMeRRqQ==
X-Google-Smtp-Source: AMrXdXsXtqFVpcHSRMxHz5inI54feIs+xG7lPlRq8xSAYJQdDpsncsUZeISaC1o4QN1YXu18rMtfXg==
X-Received: by 2002:a17:902:aa96:b0:18e:8223:6447 with SMTP id d22-20020a170902aa9600b0018e82236447mr43569175plr.22.1672729382616;
        Mon, 02 Jan 2023 23:03:02 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z2-20020a170903018200b00192588bcce7sm21239984plg.125.2023.01.02.23.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 23:03:02 -0800 (PST)
Message-ID: <63b3d326.170a0220.8072f.26b7@mx.google.com>
Date: Mon, 02 Jan 2023 23:03:02 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.2-rc1-7-g51b1cbc6f5d0
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.2-rc1-7-g51b1cbc6f5d0)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.2-rc1-=
7-g51b1cbc6f5d0)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.2-rc1-7-g51b1cbc6f5d0/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.2-rc1-7-g51b1cbc6f5d0
Git Commit: 51b1cbc6f5d04563e30c87f61c36d3e5a2d58ceb
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
