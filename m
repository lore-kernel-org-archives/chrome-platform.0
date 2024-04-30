Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DA9199AD
	for <chrome-platform@lists.linux.dev>; Tue, 30 Apr 2024 06:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714460072; cv=none; b=Ynui6WzO1tsZyTQ2y68/MRR1JQK7Uwg7b9fRf/8eXF5tKWwh6vM+KSH4QVnzAD+LrOI8WrN7aUG1k1wEAVIS4CTIFA5G3BI5M8uhCw7kl1dOqDdlnwdc7Wxx2q/lokmO7vJ/NXVZuge9Cwts7hgL8JQuV8O2TnIcfQc2n8mWW6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714460072; c=relaxed/simple;
	bh=lyBSsLGo8OL+ZBs/D+5bUYereWbMFxBdgVjUbbvX1bk=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=CreLbycKJX9EZfhuCQ4mfCGMIJ495xMHojSXj73UosPkXwzbnIZATnwFcQp46DTK+U2liknl5OJzteeDqRULIT3qtKUl7G0Zy2qWdcIROAV5AH1VFK8Dx6ciN4GChkgk5C8+d4pmfr51RwTDy3Z4ExqxjBygYg3jkhZ7+c27zYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=BlO4fE48; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="BlO4fE48"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6f28bb6d747so4521824b3a.3
        for <chrome-platform@lists.linux.dev>; Mon, 29 Apr 2024 23:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1714460070; x=1715064870; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lyBSsLGo8OL+ZBs/D+5bUYereWbMFxBdgVjUbbvX1bk=;
        b=BlO4fE48jmwMKotwThLiicT6wezZSp/NpLVs2A1lfjHVCuz7Wna4IncGoPW2a4+S54
         MjnqJOvVwKuo9SkErMrymDXu7dBT4CcYBRkZfsw+WVgHwhhjqgTbKN1s5dggY99ayjke
         wBSO2InrtU25nerwZN8uyhTUiTQm0cDwMk/C1yQl+Lwm9HiMdr6a+J3mbZ+SJ1mSMmDO
         /LF9BY/fSC0oOCTffyfE8gVudafTcw7GUsgiqXxLUjPrVz3pSIj/OdSx5b9Yt+3Uy/m9
         d3MvsfwxO7nf88eJ0mIWCwVrpwvPfv7aBkI2dDn5+PBjZUKerG4S78/8cmZcFcpmwzsh
         Seeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714460070; x=1715064870;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lyBSsLGo8OL+ZBs/D+5bUYereWbMFxBdgVjUbbvX1bk=;
        b=NMR8Im5lyqZ8NwmXFInCYVTxSgW0tJ7nN1Uw8kJtJTyhSyPu4MIf/ML/N0BW0Zyoav
         iBt+t73PnmNj+E79apSr8vQgn46QZHPgapzUAVfYJEJkY6eszH0tcSmd0a629AZvsfkr
         13Sx4SQRzTIttSRdyNpIGZJdOPxqMBqH6el0k8coXH7IKTKmz3KZ4izzskI4POGhPH3o
         kBhWN8HXu03gMOUzr3HUKWP9vY+nejE52z2hNTPJR2R04gFMYPu/cgyx2tOhnORmkuhw
         y49X6/qGIInip9aOXnBwPBP1TLMMPkT9iDPM4Y58h3b0Oj54q/iDCJTkzW+uKoCKBua4
         80Dw==
X-Forwarded-Encrypted: i=1; AJvYcCX3TOExL58b5aaw36R/jfZVgNVZY1+sDuduPXT+RdCWRLJa8f/aCZ/E5kFjThYbi98/jVHj7cAPT2e8bnE6fvYacP6b+ai07VtozrV8sBpJ
X-Gm-Message-State: AOJu0YxsJyt0dsBsLj0V4T7qxT4AgnrxMbD7YeFA5bgD1ODEK1W52Dzb
	JMLZnA1IwtesXV3I7WPn2zkvGAaaBwhf5EKhxMrRFRxEOj1/QxxUY58hgs0MWV4=
X-Google-Smtp-Source: AGHT+IHh4h9AsNcTBJEMoAac2A0vlbN5kNfv1COC8tXGmH/n81y/TY8PAJob4ORTDoxINiOg6MRuvA==
X-Received: by 2002:a05:6a21:394b:b0:1ae:4269:eada with SMTP id ac11-20020a056a21394b00b001ae4269eadamr12677714pzc.61.1714460069887;
        Mon, 29 Apr 2024 23:54:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id u29-20020a056a00099d00b006ecff9f9edbsm10834455pfg.77.2024.04.29.23.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 23:54:29 -0700 (PDT)
Message-ID: <663095a5.050a0220.a1878.ba81@mx.google.com>
Date: Mon, 29 Apr 2024 23:54:29 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc4-22-g2fbe479c0024e
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.9-rc4-22-g2fbe479c0024e)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.9-rc4-=
22-g2fbe479c0024e)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.9-rc4-22-g2fbe479c0024e/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.9-rc4-22-g2fbe479c0024e
Git Commit: 2fbe479c0024e1c6b992184a799055e19932aa48
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
