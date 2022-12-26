Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB5163B
	for <chrome-platform@lists.linux.dev>; Mon, 26 Dec 2022 06:27:12 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id o8-20020a17090a9f8800b00223de0364beso14017972pjp.4
        for <chrome-platform@lists.linux.dev>; Sun, 25 Dec 2022 22:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5ws0DHOltAsap3Yl3u1kjLOQmIkwbJjE2Yg630ShpIM=;
        b=bACH686VBGQLElAz1k9OzPA406JEFHh8YBcwz7kodmhldq+te1Wh2KG4v1s680PWP7
         2/lv/2FnS1pjZl9d5XAWMisfNIdQW19BKBDVhizxZAJzAPjFiAp5mzJwJZ3K2/2UyVQG
         mvFFrRBujWREm+O57b9J864VcE40RRuQ53A+HMd2Gg3DBIxGbYlljqdmdYkAH/ZdUzxm
         XuQtAYKrL7aMefQXRtmbC1JDWGizzcIQwGAiSYtJffza6lp4MQPTcLrBmTTMpDEJ3bi5
         DfHXD4XAeW+g6IO6L/ILUvNrSmdJtqYqLfN9ZAXJuSgsxwANxfOvENV+Zhan3dhzTrvE
         fOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ws0DHOltAsap3Yl3u1kjLOQmIkwbJjE2Yg630ShpIM=;
        b=2AVILhZZfJiLRV/NuZimCkivkZmekBnOaQUm1GOKlguQVyYKfeb6ZUum4wYH8Lz/fi
         jCv6+N1bQJmBAdyOxfW52QYoLhgoQm2hw8ZyPSRVGfOuq5oew03DQHb/SNuHawgvtEpY
         SATkyOIqhW7ORqkT1KFc65YOWfu++WHbf/RLe8Zyw97DbVjQn72c6GWmxqJJweRXFo0V
         Ib7cTVr2uyroVS3jXElOHXNKpe2yI4ONrumAykZP7hbXaPJ4e0cf8v6T2bkCa9GYJ9Jq
         xPaibwGRJ/f14Y6sxUJ7vGdngFC5DO4KvZ7fTO5qKdsSFVRSFbJAo+l3nqTEQC3ZnCVr
         wklA==
X-Gm-Message-State: AFqh2kpR+kRAUGeCSsD0D6hg/1O07f6zD+cO2Do/Jtl4yDR0JyD4Y1Ol
	yyEwlyVZz+mCWUIhLn60piOq1Q==
X-Google-Smtp-Source: AMrXdXv1+vjez87G8LnBbmCT70NZBpxt5fMDAJdHYaPndAkinr6Rs9wwYSfpRcKLl7ISURcoecFG3w==
X-Received: by 2002:a17:902:d4d1:b0:189:c322:df3a with SMTP id o17-20020a170902d4d100b00189c322df3amr26437284plg.43.1672036031881;
        Sun, 25 Dec 2022 22:27:11 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q10-20020a170902daca00b00185402cfedesm6213257plx.246.2022.12.25.22.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 22:27:11 -0800 (PST)
Message-ID: <63a93ebf.170a0220.3ff3.b954@mx.google.com>
Date: Sun, 25 Dec 2022 22:27:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.2-rc1-2-g65291e76da37
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.2-rc1-2-g65291e76da37)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.2-rc1-=
2-g65291e76da37)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.2-rc1-2-g65291e76da37/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.2-rc1-2-g65291e76da37
Git Commit: 65291e76da37b896f54a2948431f4d6ea28767b3
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
