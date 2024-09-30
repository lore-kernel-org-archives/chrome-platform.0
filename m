Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A061D545
	for <chrome-platform@lists.linux.dev>; Mon, 30 Sep 2024 03:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727665716; cv=none; b=Daac8pC3NlBFkKYze+HRuv6iLRFZQzYi8HUYWjkmnO27t7Zc0ZdXU0gBpgSPcWwgaw+dZqgfSYluaKxQe+3n3icL5Cib71+ctQyRx0fXtAS2g+gCYjrk3DS7Z28gH5XE5JARkxOfPIRkwa5WwAwC4n69oTzbZiBum8L12YExkQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727665716; c=relaxed/simple;
	bh=b6mBsREyjPn76u0w6MzapoKhbBwnT1zsNtbG8zjbqys=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=eI/0KcVh1YPekWwjJAvsFIoNd0Y2eN+lROBH901IlroPKIPHwEyjQSfebB9a8w/xBi+jOAj9TR5hfpcwSYbcTCd6usNddjKDW5xIz9qNHGps1niTzAZzY+BMwF1TNtMuW9m3KCMAtjStB51n+1we2eVapWVTYlnV2qwlvNK4LiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=mV259JWS; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="mV259JWS"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20b8bdea19aso2640675ad.0
        for <chrome-platform@lists.linux.dev>; Sun, 29 Sep 2024 20:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1727665714; x=1728270514; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=osZ81/q0wveNEDXK73rsrxjsQ36wo7SvmoPKE7XxLMo=;
        b=mV259JWSITkMPMmOjqkgG6IQ2NbCE2geTf6tL9J/03Yl3fvmajOMyOg4uHg+lCICgJ
         V5KSWAHsyxNOTWd6a/wyHNRdX2cAhShcjKfdG1oQbjVneH9biOCXrxkU5v7/ryc9lxuK
         PSFZ/4IUxf4pwEFje412AmQG30pbhl+GOYIlgIAHLgTMi3J2B2tMgU7dSIrywPGcUrMn
         NdtQ1JI/620TtyQElRtV85CUzwJ9DEU8kDtrOk2rAESGQ+2ZydcTOsAbLi7IOlNaNNxt
         fztphZZiMTFG0RucX1rgl5wfio9TPum4K8Swhz8EHDo1AKxUfsYd27d1ctPPa2IK773p
         zUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727665714; x=1728270514;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=osZ81/q0wveNEDXK73rsrxjsQ36wo7SvmoPKE7XxLMo=;
        b=X5RK4AOK4sNKTop3BCKfdr2rvcNv2qVSEROAvX1+APbr/eDlOTk7BbpDi5HCSJ92hM
         ue38vlTthMJieStwPVkxQ6eWwiyabnkD7KR+iNYp4jUaTPjGe7Rl5xE+S5vKtuDvBp+A
         rFVtj29oMcDNIIOvjFqQo6+6fin745kZmLf6T6hVZolhVB1CAS1fcuJ32HRnD47cc9R5
         z+Q7YiojruYImwgXCo7rsQBn9it8p+H4+Q6MfUXON+En68FRvJyWc0XaAJS6oSLZ1t5v
         3rrLFbr9BM9BFmeHZNh+q1uVAXA1uWUjJI6OXq7nBK3DLVS1xTrd7odByAKIdpmTp0Gm
         Usjg==
X-Forwarded-Encrypted: i=1; AJvYcCXvZ9R/0cEDoiRpR4+YQlWCbwPTS78UsnJHxKCT6IOxt/LYbMYdwi0QuGAwPNNm5YD0Sy46YYqg+8UmyJhgD2g=@lists.linux.dev
X-Gm-Message-State: AOJu0YzPxJZVHifRSvTO+jPNRa7FsbgK6PwWvCD6ZjMr4SAr3mdLhCwX
	fA6lHEropnQ/uviuWVG0L3/bnT258xsf4xwE4ARbrCJcoqgmnTXPykEhpxmnkNU=
X-Google-Smtp-Source: AGHT+IHnynwqB4JF6S+o0F49+TClD86nskVD75IMLa/awhF4U3VzF/14XvaIPelMdnnR9qji4eJcxQ==
X-Received: by 2002:a17:903:41c5:b0:203:a0ea:63c5 with SMTP id d9443c01a7336-20b3670582cmr150637255ad.0.1727665714315;
        Sun, 29 Sep 2024 20:08:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e075873b6fsm9936431a91.57.2024.09.29.20.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 20:08:33 -0700 (PDT)
Message-ID: <66fa1631.170a0220.17a483.46a1@mx.google.com>
Date: Sun, 29 Sep 2024 20:08:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.12-rc1-1-g7cbf28998d73
X-Kernelci-Branch: for-next
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-next build: 5 builds: 1 failed,
 4 passed (v6.12-rc1-1-g7cbf28998d73)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-next build: 5 builds: 1 failed, 4 passed (v6.12-rc1-1-g=
7cbf28998d73)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-n=
ext/kernel/v6.12-rc1-1-g7cbf28998d73/

Tree: chrome-platform
Branch: for-next
Git Describe: v6.12-rc1-1-g7cbf28998d73
Git Commit: 7cbf28998d737e04c4872cfeedd1a546d22cfb44
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
