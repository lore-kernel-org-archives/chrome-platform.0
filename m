Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D8115A85F
	for <chrome-platform@lists.linux.dev>; Mon,  1 Jul 2024 17:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719855918; cv=none; b=ODceNIvT2/QdGIVapiJMTPg3smtcSFpT37bnAUYf9nwmDbJ1TRDefzmgfWUzLF93vslZ7GeZDLduy9HHQy2/zBQjW+3C9HOt1MQzvfw832amrS33HPzPXIP1+A6EilkdWs5DsAB93OxiRm2INfLsvyzy+1ZXD6wn4p8R/F6MoJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719855918; c=relaxed/simple;
	bh=P/Rdlc2AA10bkeIum9oQfpmUTYpkPojZnzvM+9drHaM=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=DXatbDiOrCgpgNm658GLs7rCoOuxEXZXE+RvYTlSDgIt9FMfiflT2GYc8/lLIwRFJFbhJfLccZI9Py/NqWmX60epkpL5BpLtUz10K1emOB6huAFHtX1eUxUmc6Tp6tcNRorhJAufEXrdBn/YlgsccBLQtzIlaNUFVsfLxepM3FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=ZvN3liWK; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="ZvN3liWK"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-70aaab1cb72so1877848b3a.0
        for <chrome-platform@lists.linux.dev>; Mon, 01 Jul 2024 10:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719855916; x=1720460716; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P/Rdlc2AA10bkeIum9oQfpmUTYpkPojZnzvM+9drHaM=;
        b=ZvN3liWKDoghmFX5vqac5IzurFxOmOahzO439FiFm81kzOrMwrKAQRjpzJtLUj0DhJ
         5aRR+Ap27xrg5ZQpEjECWKLG+NxdOfn8+Cjky0Yg3/pzcGyMLySGl55zzaPvkrOAaEbQ
         hh6G567dt4YxX5yjp7eOeU2I7ELwn6OhyWcAWAwJxOwfwlpmq/mX90AuSM9R8FJq12zf
         A1RLUFpSFcAJm0kJi7A3q1CT9jsJGu2hSA/rRi//T1Cd/z4BVnS2TKQXevKRKDr/w+5v
         U9RPn4ruQipzOsfNxuSqKu6QHDs6+1Y91wa7sz4ofWGtmG9veJRuFDHfU9SlEU4pOHu0
         NtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719855916; x=1720460716;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P/Rdlc2AA10bkeIum9oQfpmUTYpkPojZnzvM+9drHaM=;
        b=Ny574AFGe5K9GhRtx9TLEpm4TstWfj2Sy23uauef2CuaceSMEZMSXYn4y6RktxQpGD
         YSuZFKmOrXQsTKKLVYiruHT0i6WAkrnknRwBQk3frFsGjQrCCTvfpc96tUbudOs/1SLM
         RaQ91wowxIsfMZmmY/s9UFOYhKjbAouvVIVZ1tiNK3fAQQStI9wVv9VvEgyKkjy8w9D8
         cWQqoNzWDXXn5ziaBB/r5WdzH4mmump+p5Cc3Lz9th8ZOwC3hjmKAd347IgsYQWS2T7U
         H4u1He4YyVXP0fZhkx0JO/mzU76t+/J1Wl5fX8nMq4do7Td33F6lp6uxqeqAJnwPtbds
         LWCg==
X-Forwarded-Encrypted: i=1; AJvYcCUaUcTle6EGLCGF8NRYmJQGO2kT5B/2TeARfm7bItghMYU8IJQClVN8pkT0U2KEXAJYVXsPGBPtfo+t4SbdMT1fNnrMGK2C9YqeYtm8lmg5
X-Gm-Message-State: AOJu0YyYaUmanzmxTSiBly1UptLKnd7VP+jhIGnz71u28f+1LItGYrRd
	SWRqa/cbm2RIlMlSw2FMwEU0Ak6hIE+UdnPlMbGsGZHYYJvJAa63uz2jOkPY03c=
X-Google-Smtp-Source: AGHT+IFuE4cvHVXNjvT5RE4jgtzwK1hZ9HYbxH6KJVZR0TRyg8n4VvKVmcTTiXstUFceW8GHapM/mQ==
X-Received: by 2002:a05:6a00:2442:b0:705:c30d:d6c3 with SMTP id d2e1a72fcca58-70aaad3b2d5mr9140183b3a.11.1719855916309;
        Mon, 01 Jul 2024 10:45:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7080246a92asm6786010b3a.47.2024.07.01.10.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 10:45:15 -0700 (PDT)
Message-ID: <6682eb2b.050a0220.9180a.648a@mx.google.com>
Date: Mon, 01 Jul 2024 10:45:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-26-g3664706e875f8
X-Kernelci-Report-Type: build
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.10-rc1-26-g3664706e875f8)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.10-rc1=
-26-g3664706e875f8)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.10-rc1-26-g3664706e875f8/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.10-rc1-26-g3664706e875f8
Git Commit: 3664706e875f84bd4e3fa25ed1c6e46934cb32cd
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
