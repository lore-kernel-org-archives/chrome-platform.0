Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA2217C61
	for <chrome-platform@lists.linux.dev>; Mon,  1 Jul 2024 05:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719810437; cv=none; b=tLwiVeGBzeOM2NLlolQ5RwLAEbfNRlG721vnRurjmyfPTEwPTsEWsEnANLRvVTpSWfSfkdr5F8rGVxfbWos5n6avAyuI7L+hklBFEoEPdKfLkH5GdarmuWCPZMWELAvHf5MEPY2w9+AShDDkKFFwBtb8nBiN4oBH6YF6Fytwf2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719810437; c=relaxed/simple;
	bh=+OCaqTgu0AhQ4g3jhljeBX5jkx8EAOpCSzpM8mcac6Y=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=VwCQJ3gLgdZ0ZOGjX2gYbiORb/QFpl5syPWPjYI6z0Z/qYWINqKq2UKDzoZu4EBVO5qmUDQoc4cmXcIW1hCfba7S4VCUcc2f7RoZLsh7fKm3H4tMNTMeQuA88IHMRuReos0VT0UIWLW6KKyg7RFPNCWCbOjpKVnLtoSBuBejzwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=LLmek1mk; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="LLmek1mk"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-652fd0bb5e6so1690437a12.0
        for <chrome-platform@lists.linux.dev>; Sun, 30 Jun 2024 22:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719810434; x=1720415234; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+OCaqTgu0AhQ4g3jhljeBX5jkx8EAOpCSzpM8mcac6Y=;
        b=LLmek1mkSVw+mYipR1Rg0NEmQAZnSIidKO+G4WrqokKOJnO7dcGU7KWA3lyHsTnCmn
         zFEEe0Td60Nz10z7lE/bewXP9Q296mPePI62PW2gRIeL/hkk0MIJH3xQDWWcl2bwlhvU
         g2HAGregRNtwZhyB5NXWupCm4HuubqHohlS6KR8VmWK6MZtGR1fihJu27BO+h8W7bvtQ
         3qG5jzEDqQQ+kcpVWPP8jPONJuOhYmpiJJPzziHEF/Wq1KDOtDxU0eR0XJp9BIhsFYRV
         oMte/iEIanQ3kFmgJo2Rn9e0Gq8B/xxWVlqhIwUr/RYg7NBbHJXMZv8O53GDk2WuWIK0
         Z1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719810434; x=1720415234;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+OCaqTgu0AhQ4g3jhljeBX5jkx8EAOpCSzpM8mcac6Y=;
        b=geOGjmZb+ryE4iAqaug3Zo2NP7yvuGo1IV+GK9D5gfuSbfx6Gx6WKwBcU1F4bcgetG
         PoGlnR6r2AO1YlC6rsidROcnpKDlJQ91SmRbvoNDUH3zQpC1sNYGaRiit1Shl2IugKE3
         lYrfVYAbZWffL3pSb8qO9YMm1Qc85cZprYbGEcj9DDk1P1Ghyz4BGtMQc14E85ClBgK1
         aKee+ch6/DJKHpErqKkj+jI9yG+wL4PADHDYvqqk+t9iXsaxFI8ZEvfN2Smml2JkcOBQ
         ijrSD5BqwCzVHraV0eyD+Kcyfi7BuEVMBbn3K9UDfZcg/7TgAvLRMCKMUlo8ff+PXEeV
         qscg==
X-Forwarded-Encrypted: i=1; AJvYcCVEdw6zr6j1x1128dWN5gwOXZd+Zp4yQyTKATS1GV/2mawnq37l+ozL90Mp9JSe5jPaO44NjLWrEjbbPzW5FtIOxH2hf4m7qRS0GRgbvyvn
X-Gm-Message-State: AOJu0YxEyKdVpIBI19k6t5BQSap4LmJa7/jsOqBrViNnO0dxq+d7pJ2t
	w8puCrAhmyKYvnxKLLsiR4f9Yhbo1FarnISsT8zqFE1h4tbffnaw2MA2KaJTe40=
X-Google-Smtp-Source: AGHT+IGeZsqXnkp93lQb9idazW0aVlqm3vKuCK1C8mNpkoXZHHuaIDLSXUvrE2KVJc3rOhmi20BLoQ==
X-Received: by 2002:a05:6a20:da9c:b0:1be:e39d:6ca1 with SMTP id adf61e73a8af0-1bef610e62emr7872014637.14.1719810433770;
        Sun, 30 Jun 2024 22:07:13 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1535d4dsm54808825ad.177.2024.06.30.22.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 22:07:13 -0700 (PDT)
Message-ID: <66823981.170a0220.b646e.fc2e@mx.google.com>
Date: Sun, 30 Jun 2024 22:07:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-21-g5b8feca8dee44
X-Kernelci-Report-Type: build
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.10-rc1-21-g5b8feca8dee44)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.10-rc1=
-21-g5b8feca8dee44)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.10-rc1-21-g5b8feca8dee44/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.10-rc1-21-g5b8feca8dee44
Git Commit: 5b8feca8dee443055049c8ccfdd97f64a0e1d2b4
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
x86_64_defconfig+x86-board (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---
For more info write to <info@kernelci.org>
