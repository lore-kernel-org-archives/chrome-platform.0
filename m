Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7030753B7
	for <chrome-platform@lists.linux.dev>; Tue, 11 Apr 2023 10:06:36 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id n14so32463315plc.8
        for <chrome-platform@lists.linux.dev>; Tue, 11 Apr 2023 03:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1681207596; x=1683799596;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LAoY9JDmyzeUE8cETw3d5dDb16k6tfq5nBENo/fEV70=;
        b=ngHbNKKiATlytdE5+ZaIuJu2PnHRuqKnn0GP7+7H8zUuePFziKaLQxHlVFSu8KJdp1
         3CnDkOC50M/zOE5UrAR5MOpstHSQ+aFI+Vx0nINGtr3qB9/VzOaDfN0frldeLvc1SpnR
         s/1xtGmsmY33ClBDL5B0UvZirEdPP05OObf8x4OqDmTY3cFlXIUrE9L0W2CEtrB4dY/s
         0MEQKixObzxQSDkD0kiP3+hl5qvPFAofng0RyH/4bEr7w8FPOhibsS1VuZkpN+J4roML
         NOr51qNBCGo+Ghf68FG/MhWwjijZzTRWoxzLAUN+LpkcB7Vf87U7KLAPypMQvg1sX6fO
         sgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681207596; x=1683799596;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LAoY9JDmyzeUE8cETw3d5dDb16k6tfq5nBENo/fEV70=;
        b=w/iOd2phQc+TqroCkJUzpSUDemUF3OEqQVPB7v49cHoUuXYdyO3nKOS5HZnt4//Jzf
         Fcoi3FQXELEXmdn0jOOEYItn5MSQ8Qm5770HYJ3E13weHXFj4Nr8fshuT1sHJ12SrzSq
         mrE1TTORLQaEf9iiczArIFROuzZ7dVZmt+eNO1LLcrZ21uhRdzu7UdXEZ6GjRHcqygUI
         5yKn0dFeMYPIBxpEseCYqaaz+5QPoic7xyWSB9k81PLQ9gmcWAHI8iHLqLSz1HP9SY/T
         LzHMOSwcfQM46aNLSnaeBJ3FQdhtfS2Hjm/zaSGTcEbLfHJ8xrKfQxZ2bUyiRvaKEpM2
         ROVw==
X-Gm-Message-State: AAQBX9coyUKQ1+Kb7dqshrWukVL5zNhHey0NxG4OkUrtH+YHKTdBdg7W
	fODoTl4eAxZQBJZj9Agps9I+Dw==
X-Google-Smtp-Source: AKy350bd/MBaxizSeFb/HaFtjIMCxl/8w6NrfnR1bZE7m8teU7C3cxewX/D7OXJF2vdQVGMkZtsFEQ==
X-Received: by 2002:a17:902:d4d1:b0:1a0:57dd:b340 with SMTP id o17-20020a170902d4d100b001a057ddb340mr19664273plg.64.1681207595861;
        Tue, 11 Apr 2023 03:06:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x10-20020a170902b40a00b001a50ae08284sm8084959plr.301.2023.04.11.03.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 03:06:35 -0700 (PDT)
Message-ID: <6435312b.170a0220.2738b.fa36@mx.google.com>
Date: Tue, 11 Apr 2023 03:06:35 -0700 (PDT)
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
X-Kernelci-Kernel: v6.3-rc1-7-g419346a03810
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.3-rc1-7-g419346a03810)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.3-rc1-=
7-g419346a03810)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.3-rc1-7-g419346a03810/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.3-rc1-7-g419346a03810
Git Commit: 419346a0381034fcc0866be9605108c8612847de
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
