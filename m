Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D270E180
	for <chrome-platform@lists.linux.dev>; Wed, 11 Jan 2023 00:13:49 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id d9so14960463pll.9
        for <chrome-platform@lists.linux.dev>; Tue, 10 Jan 2023 16:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mQM7IqSDPA4zVYLVT9EoszQZgOzeI4RQb7Oq8506t+0=;
        b=b03lPnovWl/2mXndFrG/wrp/0NthRwCt18HUVs53KmnU/ebZeqkdsNDrEILJ5YRwVi
         caz7FPqzX4s9We+rfPvkCmSg/5ugNmo7pa0fmM/tNxq+DKjrFH4bfUFIa+wcypZcspp0
         IMs+5ecWnfO1w/Pf68OqhvrEpEwsPAMAQMQd5Or5Mj7i8BdnZ/vv7gmh+Tp9b7V61qYq
         iiX9MlnqUJDms7cNVgBI7g0+WePJHoYFstrXxvc5TTDmGJtHluUBxVd5hX2X4TUcYcUq
         cr9YvXXuSlPSxvR4NTusAooQurikwxOMIty1GDJk4L30/LXOs+GZ1SjihtEoTPT7NUHd
         bUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mQM7IqSDPA4zVYLVT9EoszQZgOzeI4RQb7Oq8506t+0=;
        b=0/HaUq2pCn0oHRieIgSs4NhiSqYN6g818A3BITdU4aqIoO2AhktZCe70JRL2362Jhk
         W+wNzQMpdUcqAu3yO04CKTOh/4cMw/jFeW30j88OzUdMtHJkAXp4U2a0WUDfOXJHv/4R
         yZG4TfWUb+hRAj06vOlusWeLJjr6uB+HQma7HV/OF8Z3v7oSZI7UwOQ4361TbDq96MrY
         KoFTimGiYbGo6O9ofqyquTSxp+pQdNKiqGDlRAnw6lDbKPm0UhQz2N40wzUEgoQUTWnh
         ir/yG69KLFUvIas136rwYdRIsbnr2txG89JrOVMilcbjs2ANqBDU9BNAjzLRYOlJsQ+/
         HLRg==
X-Gm-Message-State: AFqh2krJeOb3EuOYRQq3Yo8qH2WStTc6AkpUezcQ/6DHkkklzQ+TeJqD
	d/YxSn6vkmf9vKvJZo9R49wxQg==
X-Google-Smtp-Source: AMrXdXu4ja4X+9jXBuN8vEawD55pmukua5QoehWDCAF8BBIRl6grBaNJ9tHdXlNPlo+Ec7xH2rCsCw==
X-Received: by 2002:a05:6a21:3d0e:b0:b2:40a8:abc0 with SMTP id bi14-20020a056a213d0e00b000b240a8abc0mr91396187pzc.40.1673396029170;
        Tue, 10 Jan 2023 16:13:49 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ij4-20020a170902ab4400b00192ed1330c8sm8579973plb.260.2023.01.10.16.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 16:13:48 -0800 (PST)
Message-ID: <63bdff3c.170a0220.c2a16.d956@mx.google.com>
Date: Tue, 10 Jan 2023 16:13:48 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.2-rc1-21-gd6c3ad38d6f0
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.2-rc1-21-gd6c3ad38d6f0)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.2-rc1-=
21-gd6c3ad38d6f0)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.2-rc1-21-gd6c3ad38d6f0/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.2-rc1-21-gd6c3ad38d6f0
Git Commit: d6c3ad38d6f0511669f27eeab29e3e08042c7045
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
