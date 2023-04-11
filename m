Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D611844
	for <chrome-platform@lists.linux.dev>; Tue, 11 Apr 2023 04:05:45 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id px4so4560045pjb.3
        for <chrome-platform@lists.linux.dev>; Mon, 10 Apr 2023 21:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1681185945; x=1683777945;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LE7Le0qhWIlu5LMwVrDIwtcZk2NW0OkFC2I0dpieGyo=;
        b=I2aolrk/2K7glwkSk6NDT6/tj4/crDydCyy8+ubXlnDwaZ+AyO5MLO5BFAkv+lzzPc
         Qc0kkJuUXXuhHpSGQjwyFxtV826BdLJ2kQ+8/wo4avuIeq15sLiJCwqBzrKsTGnKMByw
         9bd5hd3tpYlTSmonESP8LcTSoALC8IsYCPp0joTzkxCMElRltwMlQloXv0s+qY0epczW
         9dmilLC7CEyAPycSB2vr2w3rRNLhL1rNCczTterzjZfOWBDun0WEC6bQuConWQ5L8mbd
         fAnhh2QXirds4yscwl9wOpTNyL3IOyd8bUMlX/Iaxg2Ul3cSb1A6JCtNw+zwUtx1+MPw
         Y+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681185945; x=1683777945;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LE7Le0qhWIlu5LMwVrDIwtcZk2NW0OkFC2I0dpieGyo=;
        b=Iekkw+YAidlIAXA4ngO4B6BBEF/+MGy3LC+7J5bBi0CZ8fm4rmoOdJ2IMjpYfh5obq
         0iN6zeSYnPvWbGqGCCyEhpMk2M0UmkZOTuyJhvhUlWlq8iZUhfYnOIITwLj/zbdjQelw
         mqEHuDhMIl20rKDk+cGLdJY4nKbHPMjdxkZ7qqMdhHGrasSABxa6V/ZbHdDlsyy4YiO+
         50x4vm8Fmb4ocbuwtcPk2y07S8BC/TZ+2lFcvVBcq0Z/XbI0lujXfSNRFL6CRoFPdmWM
         d16k3x39WPBHYhEdje7YAA87RRanJ9cX59WultPG0ZttfF8ZvkBO9L2Sa8sFhdboRgM/
         DIzg==
X-Gm-Message-State: AAQBX9dmUsR/O1nKQh9H3wyHS4b3gGAeWenbWzik1T1ilIYrTr9fLBqG
	cncuQVPyb98N9pSwY7e68POWaA==
X-Google-Smtp-Source: AKy350aMNIjlMTP8PQocSqWbkVRcuuAUXVIUb29DaNg4RwPOJNFGlM5UBbf61de/ThMy6JUUv7Gvpg==
X-Received: by 2002:a17:902:cec6:b0:1a1:e112:4607 with SMTP id d6-20020a170902cec600b001a1e1124607mr1561003plg.50.1681185945388;
        Mon, 10 Apr 2023 21:05:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902c20200b001993a1fce7bsm5362795pll.196.2023.04.10.21.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 21:05:45 -0700 (PDT)
Message-ID: <6434dc99.170a0220.1a565.9e48@mx.google.com>
Date: Mon, 10 Apr 2023 21:05:45 -0700 (PDT)
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
X-Kernelci-Kernel: v6.3-rc1-6-g14bb09b32f43
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.3-rc1-6-g14bb09b32f43)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.3-rc1-=
6-g14bb09b32f43)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.3-rc1-6-g14bb09b32f43/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.3-rc1-6-g14bb09b32f43
Git Commit: 14bb09b32f433c1c87d96732ad71442d03fd4e73
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
