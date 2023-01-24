Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D7E8F4B
	for <chrome-platform@lists.linux.dev>; Tue, 24 Jan 2023 20:23:45 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id jm10so15843211plb.13
        for <chrome-platform@lists.linux.dev>; Tue, 24 Jan 2023 12:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vwPZJJACyGUciNjEt3yo3Djdaa0xVNRyxqaZHCxTYNg=;
        b=Mnu09gOXHfUSu01iQRGujvqMZHYHSgy/BpS+vH3C/hb6mUNacbvGt/DH8y6AeXIO2b
         ExTowV3HOz5Q7OHd2CupZrFVQ5k/ACgWGEw48TtQQ0yLKcnfO4tTVn6mXAmm6PGmcGJ2
         FL6X/VGL3qUDLy1PYor1kvFexSpb7nV8Ra4lRpowDvjlzox0wLOXUMgOFQmryvUO3TAg
         UfoP27jqiYFCJI+HSX/fZqBTvnjkIDpao3OT/csE4REzMUJvMC8ihXxPevtoeP9C+ftZ
         6cEZ3HGucznkgJzah23QBtRkoHKy62tmdbzdKD+Mb+3ts7fzlN/nEw3U8Lh3v9l6QzpA
         lIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vwPZJJACyGUciNjEt3yo3Djdaa0xVNRyxqaZHCxTYNg=;
        b=kt7iIx09j07HJVDl3mWDwMfy9vvMazgiHxWg35guma185Xdlzrek/RdWbOEJ9HaDHh
         yaaPD1Mr7Xht5IvrCtMR/Nm70GZKb+Zgb+aT2Y24cYqX8XwDcf3AFK5BBZnE+yabMmBk
         TEL/IWhd7oPDYJHXQU7QKttvQbgBMAd/U7XkjXqtzrm4FRWbdvsUwhNRfIen27vAW3lo
         2AYO7Xp1JTSjzj6YqbqzEdient3BWZ+vUKbdlMsRsHSNg4faswFkgWd5qtVIdYBvyY/h
         sW7JzasuGR2ehXG6J3AQK8w4rDQ1NjMSu1UnsUMsUbH1rvYFy4wryFKGgIaFMktg39Gg
         UByg==
X-Gm-Message-State: AFqh2krkeJZcxZjkGsTou4qXJTGGIkTgt93q5CmsNiI8FXEwvg6T9o64
	i+jSSNUkvXPpVdF7vOCtKVCMGA==
X-Google-Smtp-Source: AMrXdXv/H7hHCGBa/YRoeUC0XoZs+wI1+BLwXzyPw7dyXev40p15rfhC2wV6qyOHwY9Mj24SJJQP4Q==
X-Received: by 2002:a17:90b:3e81:b0:22b:a73d:8a8a with SMTP id rj1-20020a17090b3e8100b0022ba73d8a8amr18843781pjb.33.1674591825237;
        Tue, 24 Jan 2023 12:23:45 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p9-20020a17090a348900b0021900ba8eeesm8955361pjb.2.2023.01.24.12.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 12:23:44 -0800 (PST)
Message-ID: <63d03e50.170a0220.abbdc.da2b@mx.google.com>
Date: Tue, 24 Jan 2023 12:23:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Kernel: v6.2-rc1-32-g7ae7deb4a4b4
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.2-rc1-32-g7ae7deb4a4b4)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.2-rc1-=
32-g7ae7deb4a4b4)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.2-rc1-32-g7ae7deb4a4b4/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.2-rc1-32-g7ae7deb4a4b4
Git Commit: 7ae7deb4a4b4d48a89d95cd03162bcfc408dce11
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
