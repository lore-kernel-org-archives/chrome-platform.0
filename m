Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC682907
	for <chrome-platform@lists.linux.dev>; Fri, 25 Nov 2022 10:34:47 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id 140so3795122pfz.6
        for <chrome-platform@lists.linux.dev>; Fri, 25 Nov 2022 02:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3l7nTOw7PcKYSS4a31JIPJyOHiQNFayLBIXx+E8JUgg=;
        b=sMWz2lyudaYgjwkOVSxhDwQuStMOfFuXbIQ3w7yWp5Wde9hibDKSiHiZ82wjf70Y+1
         dwl7o5h3S28XNIsrxVBZpympQa8WH/G8BnqwXMiEPyVHDDdEsJ3cHOQfhsQuX/J7Ro2U
         9ZS6zjwMLsjfAVhZnFAHQP3NpxOOs06zKGHo3tWWiuWhQ+haS9qIPG8RLu52X3kc2zSE
         spKzkMEqtEFViE52Isf3O/YWU6A2LMsZHkjjoJVeE3W8EjD1xVKaElHHgDGaLpPyeqq7
         sjsAei++1q6ez8m/7qzy3AJw9W9I6VwEgnPTWeuDNI8/wspb/VfUa1jw6vreL2H9WsEj
         NX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3l7nTOw7PcKYSS4a31JIPJyOHiQNFayLBIXx+E8JUgg=;
        b=DlfCe2OFWuGcpip422eEh0DrJYOwtXwY7q2gx24s3BC7SLP2BDMxI7YmrNU9xq1tPN
         W2Awq+2WNL5mr5rD6Y3nc1iw779UftfSKyumQzb6rUOM+1W5IBKt9aQCKOAVz6hCyNBH
         6bpTzkxvIskjcmnReMVH748ICpU2LTse59mfTQEICJGpMgo/oD6SeIZPlfhLuzi2fVR/
         gFyU6UKLX7jCJGjqCwAa+C8CaROBdHMCKtfx5eNwhD4uv8qy382vujzorXLGo89aJIND
         lR02iAh8Aiv1pd5Rbscxw9vFHnZ9qJHEbjhLVazPbcQtQTiJ7edsCiP7M2AMRhHDV6A7
         Nulw==
X-Gm-Message-State: ANoB5pnGQdgst5LqRkxMXD/yie5+1mnZ5Z0Y3kZrimBI8edPZlVHmB3g
	j9wZNrtOvniBIIT9xIHsf9NEeQ==
X-Google-Smtp-Source: AA0mqf4MulTQbqKOn84bduCoLoiY92WKdiHk+tdG8XzRLw+QBa2Ruhbof5ZnNdq0Tlq3kg6LKqnWcA==
X-Received: by 2002:a05:6a00:f95:b0:56c:a60d:54d7 with SMTP id ct21-20020a056a000f9500b0056ca60d54d7mr24606081pfb.18.1669372487527;
        Fri, 25 Nov 2022 02:34:47 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b6-20020a170903228600b00188fc33e96dsm3020751plh.198.2022.11.25.02.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 02:34:47 -0800 (PST)
Message-ID: <63809a47.170a0220.f5bd.4165@mx.google.com>
Date: Fri, 25 Nov 2022 02:34:47 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-kernelci
X-Kernelci-Kernel: v6.1-rc1-15-g6c7053bf3514
X-Kernelci-Report-Type: build
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.1-rc1-15-g6c7053bf3514)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.1-rc1-=
15-g6c7053bf3514)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.1-rc1-15-g6c7053bf3514/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.1-rc1-15-g6c7053bf3514
Git Commit: 6c7053bf3514b2a9684d5638e98351bde1c94951
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
