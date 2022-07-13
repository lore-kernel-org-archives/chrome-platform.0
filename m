Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0294A0A
	for <chrome-platform@lists.linux.dev>; Wed, 13 Jul 2022 19:05:06 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id 72so11329771pge.0
        for <chrome-platform@lists.linux.dev>; Wed, 13 Jul 2022 12:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=PQ/0n0OMWG5Yx/e0lDVK24jg4fojdbJ0XrG7JBREogc=;
        b=dxMsUUvAhOrRmRKXSH903ac4c1WmnMLqlB13bTP4eksRw4RFO79P648T7B65dHTCd3
         Qop6qiOKgZMzlh3Gl79wquderJVs+XH78uwkv2pElCIAqziAhjMqPOaUmC9+7Ck9sYOL
         KLvg8VP3QPq68f5X4hP2SilNRbkoW860GS+Za/N5PC+HmmaxKu+KMXE7zwYdrrKXJrYk
         iluCpkA7d1dy/9qUOlNZJ+jfI1a9ZDOR+2Gb6/yrwWi/WaA3JW4YVP6YVf/eZY0H4tBw
         w8wZt4bGRzbgWpbtt+++NtnEEOW04v7sI5Pl0J+f3wFT4Nphn3r8gkJS1HETWavycnHE
         o23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=PQ/0n0OMWG5Yx/e0lDVK24jg4fojdbJ0XrG7JBREogc=;
        b=dqOvR+mWVfjmQbxN0g7tiuuxrxHXhJ9YxWPr755WE2TVPM75lFBD8b/nBZ28h/5ClL
         O3ljr/L8FI09U/fxvMGdm/Y8b/mpZjLwX3H5LZoLBGnIB1+h/VroG/tXqOYHuE4hi+Om
         kN2W1wvrjHvqthnw9zugHmlCIp3MS5OwaK0wNePMAP0EQ5YMx7AqL1SJFR7ANcUVs7h6
         6ZQXMIHgAa7rexh0chfJxJ6zdEZagVgOzMWyxMAvuf0b3gStoDkvFfhP+fjWzw6SkEhl
         mukMdE4H3IvihN1LwfNo2tjv+zIRV5vRUXGozvMXz9yc0vWWq3p9pYyIcaB0LtgUPNCH
         dA0w==
X-Gm-Message-State: AJIora+eVG/7xY7FrvOoGLGEKvyN85VW5HwGkUYsuOPbgoAQSbEDWhQN
	ESkuxiZLAmVAmtcBLq9f5qR/Dw==
X-Google-Smtp-Source: AGRyM1scttQ1d4mwZNJx+FbxL2nQiBHVwdqzC6VTFzItVHXaUSdz/zXOUfYUxcM7tAig5N+6GXLCNw==
X-Received: by 2002:a62:1ac4:0:b0:52a:d84c:a28e with SMTP id a187-20020a621ac4000000b0052ad84ca28emr4444234pfa.36.1657739106458;
        Wed, 13 Jul 2022 12:05:06 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b4-20020a170902d50400b0016c16648213sm9330231plg.20.2022.07.13.12.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 12:05:06 -0700 (PDT)
Message-ID: <62cf1762.1c69fb81.bb86e.e0f2@mx.google.com>
Date: Wed, 13 Jul 2022 12:05:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.19-rc1-39-g5ffc0821f4df
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v5.19-rc1-39-g5ffc0821f4df)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v5.19-rc1=
-39-g5ffc0821f4df)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v5.19-rc1-39-g5ffc0821f4df/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v5.19-rc1-39-g5ffc0821f4df
Git Commit: 5ffc0821f4df12a904643030172476b7f537508e
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
