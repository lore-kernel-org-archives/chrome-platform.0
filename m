Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0EF10A0E
	for <chrome-platform@lists.linux.dev>; Wed, 12 Jun 2024 04:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718168391; cv=none; b=h4tKteE5QrNf0iuN5QowevRtbKsgUaCEoNNgxNFge9j3u/lNP3HLQrvPiuN0bmVZPEtQe/3bfX7WtKYYel2GriFgnEj12hZ7uR/w4obwq8UGZqPF74Y0fOogeWC2DlhcAZyLplhpDqHAQXKvDFK8YUhy9SmM5jfaU9cmSflOPes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718168391; c=relaxed/simple;
	bh=VfqUlBqZDkDTy+VWccE2yDOn/WfgcjWSogGYyawLynM=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Rq4+/Ysco0lEkQ25t9vX03zMsYlK59O5qyiUv3l3FHELx9pRTxw+kT/fCKDhU8JRjS2att8QregiI268GRMN22CvFtsIrjTvbqv+9Xfm85cw1qLlbNGPm4GGZrUadPnTJgrj6NGIgpNpydBkToEqbZfibpvzlLW2ehF7MZj+bRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Bbo0X1TJ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Bbo0X1TJ"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-703ed15b273so4923916b3a.1
        for <chrome-platform@lists.linux.dev>; Tue, 11 Jun 2024 21:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718168388; x=1718773188; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VfqUlBqZDkDTy+VWccE2yDOn/WfgcjWSogGYyawLynM=;
        b=Bbo0X1TJnnDBx9gc4yzDe2JQKACzKy3baz5oI6pLYnvSi/9dEAVrhnDm3R4otEmI2P
         pCGVKzTJKiveTucN87WdIlO5lscu1iUue1OqnhsYFd3sdpeWHhtCMXr2RATezyRHpaK4
         rsMyYfI/x90XWQKUYX50WubwOLt7AC0TynBhO29Vj4X5NLQOvBjB/xDArLcg+VbNl2l2
         Ue+QYQzNQ3MsU0xgGu4PRDmCqiZErS6Fvz5AeIejgm4z/dNQUYHRbUHFyiOoeVS+czRE
         3lz2I4zSUEl0VUrR4JyGABwN2u6IphuspLIrduCy0axkyRelwLWt0fgjw1xXq6ULZWtq
         TPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718168388; x=1718773188;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VfqUlBqZDkDTy+VWccE2yDOn/WfgcjWSogGYyawLynM=;
        b=MDv9M1x34+4ejgvQf1xoTZIY/etrpLOuOzAhraAu8gBW9sGe23HgGRUCphcu9BDtgS
         luQfXpxa/ITKynu0OuNPLUN278QtKX76/FNINip07/HhV5VP5zxJ0HzUitTDAH2lN6Sz
         xrvd5T5uKy2efzmejGQU9yYBDd+bYhBt8XhE03YNq/4f2UDP/bStCGayfb4uiAj0461t
         Ukoq3PNF7aS5skztJ+73ZV4zENcaQhSN5qeS+P2ID/B5woKsbvq9CAqM9ae4wHbR1bJE
         Kcu7gh/PU6vRQ8HkOkeK7yz+VgcFe7yj5pFDhQcJu0AwXgm5wKINQM4f3aitvPqyKJeN
         252A==
X-Forwarded-Encrypted: i=1; AJvYcCWY/FCl7/cpvUH1VEsuxQPznlHhg9b3rCW2gpYjFAg0Wc0aFyLlc8WH2chnUQbYEDO8tzu+ggKrVj0DZSxl246eEAY/UHnPLpc8aDOug1uI
X-Gm-Message-State: AOJu0YxLpyJcQopVWzjZpfnESQecdaNjuzyc2f+8v7ZX+qLslImuvQqQ
	M2WXZARBm5Cqv14/XMhrLnYjXaijuEhF88C4cVmldhVuHCpkQ+fqN28WWU07c8A=
X-Google-Smtp-Source: AGHT+IGd2bPm3Z3EkhFjpIDmf+f2RyfJExnsEdm2fJA4x/QFMBPiK/RGHV3d2C1u87VR+dkq/L81GA==
X-Received: by 2002:a05:6a20:7f94:b0:1b8:5c3c:7951 with SMTP id adf61e73a8af0-1b8a9b44227mr968664637.3.1718168388527;
        Tue, 11 Jun 2024 21:59:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6e785858fsm84546925ad.221.2024.06.11.21.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 21:59:48 -0700 (PDT)
Message-ID: <66692b44.170a0220.43a3e.90e9@mx.google.com>
Date: Tue, 11 Jun 2024 21:59:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-18-gc2a28647bbb4e
X-Kernelci-Report-Type: build
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.10-rc1-18-gc2a28647bbb4e)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.10-rc1=
-18-gc2a28647bbb4e)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.10-rc1-18-gc2a28647bbb4e/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.10-rc1-18-gc2a28647bbb4e
Git Commit: c2a28647bbb4e0894e8824362410f72b06ac57a4
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
