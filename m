Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D634503A
	for <chrome-platform@lists.linux.dev>; Thu,  6 Jun 2024 06:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717653856; cv=none; b=kC4ut4yAXknuXoHD3lIa66fAm0uFiFa+lCwi55yF/1nKeIE/H4PxuJt8NKi2+U7QZBI+y7nG1HwwdRRacuteZrjuVuwsednI2aDf5WKmWdqjol7tztwyEgDqmS3k05+N+tCIDHq9YkSj862OYcX7l9FYZG+dx9N4RZuMKUpSF6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717653856; c=relaxed/simple;
	bh=4+8RgLUhCXXf4MbzJUdAbB+MEavuaRc1KV0XuVVugow=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=lByG4uAS5+Dsb/aSN0UdbVnrER6ACqeYzIr4ehxCj+f6Z1QvvRGeawfiWJVPv4FNNYP4z4qRKco2q/kzByovo/8DdEWXY/XU+3tiRet/gdmGBO13wa8gsW5PytuAN8YSh6sgOeL+1KEFVA1e4vmE7h7XP0U9ECUEWIY31qJngCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=t00w0XYv; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="t00w0XYv"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-702492172e3so507802b3a.0
        for <chrome-platform@lists.linux.dev>; Wed, 05 Jun 2024 23:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717653853; x=1718258653; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4+8RgLUhCXXf4MbzJUdAbB+MEavuaRc1KV0XuVVugow=;
        b=t00w0XYvTzbuCHr2COfVO5PQOCKohN+3A8FugqVU/I2f09iQPTRWUrDR8qlJqZcz1R
         oBHium52G10O8mqxT3vqTp4CKJuThqc8A9wnnCpWtcrAMRjVixiLnzOMlrh/2rFvzFRw
         wdUMVnhSV2w7m05hBXalV9CF1gJN7kjlqkRN61hQ4SIcFe5pw7TrRsmlaB5EVifIpv1B
         KbhBZYAQo/3cgEqV0irBh5uJuRAGZcIGzmsYuLVNKQmTR3OQt/9optKMbC04AO9J/Y/b
         +3JCjzVqSUyeMMfhvawUTXWIVhR6zYUKdLAekqd8LyIUympqvMSE/dgSN/rWwkEVr33R
         djQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717653853; x=1718258653;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4+8RgLUhCXXf4MbzJUdAbB+MEavuaRc1KV0XuVVugow=;
        b=H5u41zW4WfKm3sbmGBoFDaOfnNTa0xhWg38w0pPmlA8cVZXfk2U4Kk3CXGFOsgKA1W
         F0VFvpF5xZlUMu/F/hRfJ9JRDNdtdHaIwlICTRqXzf+KADmqia8DG/w9h5NKuM9AKOM6
         Oy1ZilDvYZGWXkXZ7WxrDZ/tvhP9VR9rceWtT2s+cK8Ol4+x4wstZE9jUs8qSwKQI36z
         Plkg8vifeWrYkeXoq0aynHoIMo3/jy6Q5qDljSRHKpf2R75AYiJnFR1Ca1mLRJ4eigOG
         ncnlwnQnRRIllp5F+b/5+xvuTx/5bwRLsZwgju2jI1ErQGBFAIyzYb0tivLkgrdNHxZv
         jP8w==
X-Forwarded-Encrypted: i=1; AJvYcCWwsqJ1p1KSDzlcgp4GBTsZ/Vzi/q5ffu87NGy7OjTWMArkhGXx55HaYckXmrIg/HPZstxoBLIBAVsYmPL/9w3xkJhf/XTP9wM9kec9f0lh
X-Gm-Message-State: AOJu0YzRWwh7C1iIIPgcOeqL5/hTXOJxAObnP9G1KLaZ2UUiPnsVwo0e
	S1nIHQ4n7eqF3djKtUxcntOMFScsJPYOr+IMvduUC/K2Fqq+AyA+Cgw/3DdzGdU=
X-Google-Smtp-Source: AGHT+IGsQbb20GJ3Sq6ibk7sqexypBN46toIY8xBRDknybRxiGKSopStuRZgGsOHPnS0TpVEGF+p8Q==
X-Received: by 2002:a05:6a20:7291:b0:1af:a5b1:2907 with SMTP id adf61e73a8af0-1b2b6e7c965mr5684835637.3.1717653853312;
        Wed, 05 Jun 2024 23:04:13 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c29c2405a8sm663122a91.30.2024.06.05.23.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 23:04:13 -0700 (PDT)
Message-ID: <6661515d.170a0220.20cfff.1ea0@mx.google.com>
Date: Wed, 05 Jun 2024 23:04:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-13-g04ca0a51f1e6
X-Kernelci-Report-Type: build
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.10-rc1-13-g04ca0a51f1e6)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.10-rc1=
-13-g04ca0a51f1e6)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.10-rc1-13-g04ca0a51f1e6/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.10-rc1-13-g04ca0a51f1e6
Git Commit: 04ca0a51f1e63bd553fd4af8e9af0fe094fa4f0a
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
