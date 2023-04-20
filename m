Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5748217ED
	for <chrome-platform@lists.linux.dev>; Thu, 20 Apr 2023 03:05:36 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1a920d484bdso5933455ad.1
        for <chrome-platform@lists.linux.dev>; Wed, 19 Apr 2023 20:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1681959935; x=1684551935;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q20YQ3l3V56j4JvSoCL4v3s5tivy6o9msax9GS6qTOU=;
        b=4u12NFKMcLqJ//cRrHJMZL5fWYVZTK/bIjg3SfamENrx21gxNiwq4mvdV7dji+/H/B
         VzK0e7oI3QXI0Fk8d7dd0bzXnzclkU1DJgPWo0mR/qyisrQ7W0ikBvdWMRJmRHu2ZT+t
         ndr0brFHtjo5hyE+F8WA5VC+NWU4JcVASZFwcANf4xYN4joqXsgV+IWvuwZe1yQdf/VG
         414ADv9vq3hQ1pg6Y6kv53qFA/4ESXhYHINZDzirgs/Xyibgzw3DzEpuIfhhBSCi5xhy
         2Y1k38xNIrJ73WLbS7eGPTiYHjUszY/v6eoNpeDVTN7e84phXVzPLbqrVq+1+C0LvmBI
         1u0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681959935; x=1684551935;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q20YQ3l3V56j4JvSoCL4v3s5tivy6o9msax9GS6qTOU=;
        b=dBJq5A56put/f7hhcWtO+LhcOFvcuwjsVkOh5KM76c5C1qAKCrqMDzc5MWD9dxHOnh
         OtHVHyinz0JhlVF2bbG/W8wi5ZzNgvkvG65irEFBz2pug+iU1ahF/kQhqnzR8kNNeTge
         UtE1fIaHpAjuHZUCjrhKRr0/4gRtI9v7nsFQC8QxIDOWMMo1tFIBdissDS3+NdTtjYBL
         Dc4kmPIfZJTjpI1TyF1xhpxXqDQzxHEvhdeb3xBlX1mVpa10GzuIu8NEXkI0RQ6KjmR/
         I/mmJWGMp876/g8Ds45LB6M8pak7CwZS3FKJFMKvPCtfVB+xjZfG7cPKyIQeGtXd6R8D
         RzXg==
X-Gm-Message-State: AAQBX9dr1L0+AbRcTNUodjOBQuwSEieaq0W+6TE2fTG5y0jXXT7TGU0V
	pS30DzzNpx4NaNYWc7gW0530vQ==
X-Google-Smtp-Source: AKy350bs6nTNR7SEbIKRT6Zdc32CDDPk+FsDDul0mAK7/NCM8uzWdmf6DZ+HJQVDi+Di+2T/dPfI2Q==
X-Received: by 2002:a17:902:e748:b0:1a6:ff6a:83ed with SMTP id p8-20020a170902e74800b001a6ff6a83edmr9040558plf.65.1681959935655;
        Wed, 19 Apr 2023 20:05:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s2-20020a170902988200b0019a7d58e595sm149605plp.143.2023.04.19.20.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 20:05:35 -0700 (PDT)
Message-ID: <6440abff.170a0220.e4515.089d@mx.google.com>
Date: Wed, 19 Apr 2023 20:05:35 -0700 (PDT)
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
X-Kernelci-Kernel: v6.3-rc1-8-g0ad5ce8407db
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.3-rc1-8-g0ad5ce8407db)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.3-rc1-=
8-g0ad5ce8407db)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.3-rc1-8-g0ad5ce8407db/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.3-rc1-8-g0ad5ce8407db
Git Commit: 0ad5ce8407db2e44922ee21d2f2a9de4df336038
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
