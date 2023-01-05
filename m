Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B29EB03
	for <chrome-platform@lists.linux.dev>; Thu,  5 Jan 2023 17:05:27 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id n4so39969587plp.1
        for <chrome-platform@lists.linux.dev>; Thu, 05 Jan 2023 09:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yo1xWqL2CtHB/mYTJMV7ztwqekdC0uWPszQJax7grdY=;
        b=yy+dJiqq07GtyJI12DrDMQw7ZjIhS9AI/xh9Zy0MFZTMgxrTCAPTAGHBwRd6FjGtm9
         ACu4SxGHxXAt49qspjFJtphrIyqH4eERUnlV98cpTQS0jQgFNYin6tZGuv66CwUQl7i5
         jAj47zFLc+fY5qnWVIZxqiR0j3JAx03sebYxi/sULVe/mKxIo1Y4oXSFcVCGUFzGV1jJ
         qi7lLSUogazSpykOPLiH5OqQ964YZZTyV+i6iW6QGmLt/g/H5e5QyuA35Pk5UfqbKfwO
         w6HTpvwW2MF9gTYQgjricKr7Kz+BvABCJ40bs5CZh/0FTSos2BoYXZBmT/orAed/JGzQ
         oP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yo1xWqL2CtHB/mYTJMV7ztwqekdC0uWPszQJax7grdY=;
        b=tg6vXaAEbcsDSW0YquvLVWMh8OZ9XtdfLX0fNYmNlpjoXcCW3LH1cjGpsI5h11Fnxv
         tJsxJAJb7oB7rBi4xMBDlq6gTKy2ysxqToigR88errcD57s5ouSmTvxnuEH+Q6G1FkXC
         l6HCAsVoMEVZPeLNEs9s9sgG+NQhIPkkCvHDzgOo4QTWsU2Cp8FEbfI4wcpGN2wsdvxE
         /3sNwmJ9xSTE5VDAt+mowedjuCoFUh7ixjkuKtFGZdftLN3zD89PULA5fJFVKHjcyw9R
         yHj4doECxHtDkV6Ju5iLaeF0H/GwELkwDQk4dLJiGjs+CsEnrw1Qg36hCSqzQAm6qwtA
         fa0g==
X-Gm-Message-State: AFqh2kouaOHdcIGjcVrxub1BIVU21YANfISY1sOzeOg+pURy4VKOdAHt
	k2GC3OCTZfS7pKKsFesQxYpqeg==
X-Google-Smtp-Source: AMrXdXv71xUx6vhgrsjBJTa0tY+tV7Xw8b60PrMwcYh4YaBXLnPaNWaB71fB+SDZCz/1xhKEZaxhRQ==
X-Received: by 2002:a17:902:cf01:b0:18b:3389:2caf with SMTP id i1-20020a170902cf0100b0018b33892cafmr87701215plg.59.1672938326631;
        Thu, 05 Jan 2023 09:05:26 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c5-20020a170902c1c500b001891ea4d133sm26234113plc.12.2023.01.05.09.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 09:05:26 -0800 (PST)
Message-ID: <63b70356.170a0220.6620d.9541@mx.google.com>
Date: Thu, 05 Jan 2023 09:05:26 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.2-rc1-7-ga31a107a10f0
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.2-rc1-7-ga31a107a10f0)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.2-rc1-=
7-ga31a107a10f0)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.2-rc1-7-ga31a107a10f0/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.2-rc1-7-ga31a107a10f0
Git Commit: a31a107a10f0178f66880c4e6ef2347a2d7db302
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
