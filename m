Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8706A1D5CC6
	for <chrome-platform@lists.linux.dev>; Mon, 28 Oct 2024 10:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730112352; cv=none; b=GTX4Z3PPZGAn7ejveNd7GH7hzdEqledhZ0xMJKYKXqwAN4v0UCspFsjzzsKSXEmxzkiYStt0Vd6th2qPOa3ioCWweqHC/JShATTMBDEX4pffz+RHoAFEwHuTmz5ix5H2B3jnI6YiLsgGkEeb0jGYxvCsfMqSSm4hnR6vq+C7V2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730112352; c=relaxed/simple;
	bh=6b50ePtAdtOkQkt9tuPEdfSEndFpdv2MHsY6mUVAccs=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=W+N11L9g8t3zSRDcvQFBQEcuVYPFQee3piIfRllpc8kJjHN6R4DLAwViAxniFKv59nLUxL7QcrlpQwkOV4CVlwQoWcv/VzEAQbPMLoXgDUybBzdob2YevevYdTDyqhhxw/bryElrndidPHAFA1kpJtewZzWGaPSvxwG6gOPJVl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=R4VCJlCW; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="R4VCJlCW"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-72070d341e5so1051023b3a.1
        for <chrome-platform@lists.linux.dev>; Mon, 28 Oct 2024 03:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1730112350; x=1730717150; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cKGZa90YFBOlmvMhqPl1BNLlI9LdcCLLxhvWLREfk7E=;
        b=R4VCJlCW0qUD7Jc7Xmi+2XrY6X1CLIA5D5BhLYojDzy8lgPH4fjf/GYqlOvnhcTowV
         6KJK6rrPTKHoVmMxb81hkwJkAre2RTl9U552CP5tGz6hLw/D3HWEcB5f+oveKQeOzZjB
         dvVx3FWuivXnBKMrKvfbCH3niKxVFDWk2o6uXcj/BErl/tOU/tjjvt4Kz5qghLIpUiPb
         qKWcYtBSEu460YR+H2bLx+zaZJ2PP1FM6xJmzf4WXWbKSxL1Y3DJRbg7WRvieUr+ZteI
         fslWOXEZ8Nw+QbJtQ0mVLsibPfFOo2nBpG/m9ZIVGM2r0nzBbHtnxD1NT3zg5no0VGea
         K+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730112350; x=1730717150;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cKGZa90YFBOlmvMhqPl1BNLlI9LdcCLLxhvWLREfk7E=;
        b=sfFnoCaj2JqkiCGvC99T1ORQhsGUogxk+1QTZJv5j8pEs1wBQp4hKE1kqEPB8aQrTz
         O4Jn+iwLTj2u4vGuiRes2JoE8ttRFC1zJqTD5x6btHwQr+54+cHLKw7I//x8li/MCIWk
         enMivgcteuk3zGdTAjM6iXgJVK1ZRN3CIaoqeNySFwMrVM1fKEIUKa1Pc6fwywA9mF4d
         l4z72LcgOyOfKDCsGbHTH7hDnluC+7xSq7Dk9HD6tIUlNh1pmVjeZ+LeukIY7qC0Gc96
         Q5+B9Fe+fyWnvQ0otpgcoLDomfnMpHvOFmjf5/xXvLXkCIJoFWRGj5VjZ8J98hOY5nzL
         0UcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhEmvRdzVtuaFPCPpVE2GmCIaTBiwCAFGoA1waY9Mysk/QJ2aHDF+Sn3Srrl3ptay039P5dsFrcpgMsnSGvEc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2ZMs0mGMPylIis5yEA57oIp3aSxuWfadRVXRgtfRl8ZcUW/Sj
	jghJFUOPZYfiuaa6IevMT/Y/9HcLszMq6rXZ2rVLte9bkLIgF6IaOUlSD7W+mMM=
X-Google-Smtp-Source: AGHT+IHZGcUTizybsutlzrAfNM7NwhEDDPMuQ2bVNDmwRMbAlrmHyGKGVWoEMxaBrn6TARCdotW46g==
X-Received: by 2002:a05:6a21:6b0c:b0:1d9:1334:27e1 with SMTP id adf61e73a8af0-1d9a83ca04dmr11814759637.13.1730112349787;
        Mon, 28 Oct 2024 03:45:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0b707sm5406185b3a.128.2024.10.28.03.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 03:45:49 -0700 (PDT)
Message-ID: <671f6b5d.050a0220.10298f.142a@mx.google.com>
Date: Mon, 28 Oct 2024 03:45:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.12-rc1-3-gea45f3f46734
X-Kernelci-Branch: for-next
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-next build: 5 builds: 1 failed,
 4 passed (v6.12-rc1-3-gea45f3f46734)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-next build: 5 builds: 1 failed, 4 passed (v6.12-rc1-3-g=
ea45f3f46734)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-n=
ext/kernel/v6.12-rc1-3-gea45f3f46734/

Tree: chrome-platform
Branch: for-next
Git Describe: v6.12-rc1-3-gea45f3f46734
Git Commit: ea45f3f46734a47bdbcfb31f41748484219d2ea6
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/li=
nux.git
Built: 3 unique architectures

Build Failure Detected:

arm64:
    defconfig+arm64-chromebook: (gcc-12) FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, gcc-12) =E2=80=94 FAIL, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-board (x86_64, gcc-12) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---
For more info write to <info@kernelci.org>
