Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E0323D6
	for <chrome-platform@lists.linux.dev>; Thu, 19 May 2022 11:51:35 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id pq9-20020a17090b3d8900b001df622bf81dso5011579pjb.3
        for <chrome-platform@lists.linux.dev>; Thu, 19 May 2022 04:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=nmbvF1u5h/w1aeoegSItwvYYG6T9wzjxTSQKK+gJCy0=;
        b=BNUoWxMMaddSw6ZmH+8DP/SOk0XVu7A5Om7NwnLwMWTfhk9BviMM84w8JNTBve3PQO
         Jw/Yi3vrFbKHhnrDnKP+pRmV1pgw54QhMyI9sI1JX6ozBZBpbm7lI52iPp01rDBko2+2
         5egcQTHy8bnKV3hkOFbRJFN2B02RAf3ymNY8VTg58BY5dNlheYxzOi8LJDKRZfPGVEBO
         od0ka67p+5w7MQOaqA6rmatUczzZtzmBSVtGOOBHsorDoG/UXLuBSqedGyHcLZkM32Y+
         BmklmKU+nkDQFo/Q9fyPUklqRsq1JYWsBP2pyNmzkA/quzpPwpZDHpfWbWxQGFh5p1W2
         J8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=nmbvF1u5h/w1aeoegSItwvYYG6T9wzjxTSQKK+gJCy0=;
        b=m5wmT6xqLZCje8GD2h8c7xXNqv5lN44I7eVKaQ6qZEPEVBPkn01MnMEkR7gaO4EQ2A
         N1swbEjM5HPy1fqIYBCrZ6pZc/QMjDQsgdJFz9wgZ5a9v86uoWTZOOw4E3CyRjhbLDN0
         nm2NMlXFx4oM46iTlhHgz/6JPJdLpbwI8QzZk21GZFoH05HJBlbNSwzj/1wBOrJiytIG
         inS904JtGdhOh7EHZ5uffGoolbRbclNFWaovlwyAFhI2L11SqmplfY3J6JDaBhfDHExu
         8RoZgvHFvUR6zXhlEZO7pIsZDyoxD53cHqt+Pu53vb4xDYBY441hQS0PGchR4zB/mAVw
         EhUA==
X-Gm-Message-State: AOAM531gFsvXbf0gpBHEPlSN4QT0oQPyLHh67o929F1paCZ+jcE3VVBK
	PiRjZbOLAkk1RpoAEninEqiR9w==
X-Google-Smtp-Source: ABdhPJywf2gssaYi7LCj71woTgDl7ahw0ukgsjQZr9lif9DcGFJtlqA36J/6EwJaPQV2SAKOrdUrVg==
X-Received: by 2002:a17:902:ed93:b0:161:6e0f:e8a1 with SMTP id e19-20020a170902ed9300b001616e0fe8a1mr4392117plj.102.1652961094505;
        Thu, 19 May 2022 04:51:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 16-20020a621410000000b0050dc762819fsm3875447pfu.121.2022.05.19.04.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 04:51:34 -0700 (PDT)
Message-ID: <62862f46.1c69fb81.7d29a.9052@mx.google.com>
Date: Thu, 19 May 2022 04:51:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.18-rc1-24-g37fbbeb52a2d
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v5.18-rc1-24-g37fbbeb52a2d)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v5.18-rc1=
-24-g37fbbeb52a2d)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v5.18-rc1-24-g37fbbeb52a2d/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v5.18-rc1-24-g37fbbeb52a2d
Git Commit: 37fbbeb52a2d2670a76d8b9445dce2ffa7591a0f
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
