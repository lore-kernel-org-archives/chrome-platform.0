Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C995663
	for <chrome-platform@lists.linux.dev>; Mon, 25 Sep 2023 03:06:06 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6bf58009a8dso3547720a34.1
        for <chrome-platform@lists.linux.dev>; Sun, 24 Sep 2023 20:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695611165; x=1696215965; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c7pRYXqsQTrzcE7brlQMc2Lc7GZv5Cc+5Sb5tqBjtgk=;
        b=Swm2b2wWqkuqWMw20tZoU/3TRLm25Dqi2qza2s+hPBuJaoqC1sMuni7j5N0wxEGgJa
         7cLqq+PG1n5Xq27gzm6BG5v9CJopermIT8wax/5K3teEEfhEet0q6Lq9tb8E0MzNB7Ol
         /ck8fkFkr0Nk3UIkm4HU42f97M2jSFIMusIpKAx4NadQC2b6fYfbYQoIb3xw2iyuMy1w
         pvwyR4UrN2uNbRVMb8QBZYVQaVhEfoiDyPZiE4SvvmbjdSXd7q51dUdRMU5Wl1RfFtrq
         /rodHE2teVmd39uMza02HJIRUODQBxc8o6qdeqJ6MwS0HAnXVpmsmY1bFwa36BYTbjzz
         tEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695611165; x=1696215965;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7pRYXqsQTrzcE7brlQMc2Lc7GZv5Cc+5Sb5tqBjtgk=;
        b=skB2ZqoizDKnai1Ta6gCmRJsEUE9BgB94o70p9Y0SMhukC7jfyBMIUJsew7x0u9rsQ
         r4I0YSbSOw55r2FjhsFQQp5aWFwOHOEaYBc4GtAI9PMEkzNeT5JKHdiLZcdI0ERnJ8yK
         ZdnGy4L/iXs7qZtI1zQ+cDAFYcyCq8J+Co0kbUXRq/XchENQVVyWt/MXzpR6qpji/gPP
         rIVkqHRNsRA9TMnC5sErgRNnBBgkCa59xwXWaHuBN2pDaUhHAMBcq0tpNMk3K2zEAdiw
         6FCYfv5yOUXdUfm0oIzEEWlva8IPaPAuNHvB8CFi9yfswHtMTPWTqKihJ4i+bYoHjXrq
         P23g==
X-Gm-Message-State: AOJu0YwGVizWK8/Tj5Y4oyhe5frgh9ySKyAzHDa8f6MXhpQqNLPI+cuo
	EOezrxSQHQls+oRL229BwVzhWQ==
X-Google-Smtp-Source: AGHT+IEhcFlDyM7Qm1WTlbi7z2Q3JOIMIGJAnv/4pg1+rJBI2BEX8yE3BCi57kA4kjvyOaGx7V+Lvw==
X-Received: by 2002:a9d:62cc:0:b0:6b9:350e:4051 with SMTP id z12-20020a9d62cc000000b006b9350e4051mr5935837otk.4.1695611165317;
        Sun, 24 Sep 2023 20:06:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id g14-20020aa7874e000000b00690fa3ccd1fsm6952200pfo.111.2023.09.24.20.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 20:06:04 -0700 (PDT)
Message-ID: <6510f91c.a70a0220.6eb58.fe34@mx.google.com>
Date: Sun, 24 Sep 2023 20:06:04 -0700 (PDT)
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
X-Kernelci-Kernel: v6.6-rc1-1-g1aa8df90f456
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.6-rc1-1-g1aa8df90f456)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.6-rc1-=
1-g1aa8df90f456)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.6-rc1-1-g1aa8df90f456/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.6-rc1-1-g1aa8df90f456
Git Commit: 1aa8df90f4569acd36d2c94a9cfe1eee561575d6
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
