Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB904CB4E
	for <chrome-platform@lists.linux.dev>; Wed,  3 Apr 2024 06:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712124180; cv=none; b=WGAhEhlR7SswhGAuPcfKFVePZ/O31X0iqzVZ4gRNtp7bYN6uFSUGIGjedDUChookB4VRuHyDILBF9xkw6G+2dSTcdSaiH1eHkdee61TaVktqp6MeVnKuz/jd4EHkgjPiYuJ2nWlFBHDasEUNUgMkzG7fys8rQXiHxa/dK7sTHyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712124180; c=relaxed/simple;
	bh=VHZlDDn8+obxcAY8UM9iVtdUp7xjMGLFFpGwLETdNzQ=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Lz9doqm8AhTvPT4ARVyxBulOaojqDzrI16UKcKv3H+S7ClfYhk8alhmLND8PdwrLXcBDLyeKd/x5Hfxzn00xaWCIkgExx1+40HmkU1WF01FRfEFMwHc5qx/bp3BZXmSW7q/RZq2BBn19YfCiI2/PVeLl5OGctCCJPlz2T3sBtus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=WaIaGlFo; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="WaIaGlFo"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1e2987e9d06so590615ad.2
        for <chrome-platform@lists.linux.dev>; Tue, 02 Apr 2024 23:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712124178; x=1712728978; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VHZlDDn8+obxcAY8UM9iVtdUp7xjMGLFFpGwLETdNzQ=;
        b=WaIaGlFoRptwA16kNAVBmS83B45vgq2gLDBOGRJPs0s6FDNat5zbW8XY1dgRWV6Aiu
         sGD7K5jbWY6H1ueQCUET0/YIAxXaprdtHj7rXlU6H7tTsEHOzcnxLpbtHjzOUyDKk/I5
         UViem4oMoWpnYCklT8gLyodsqLqpmboBCdjdhe6pz/YJa12bVasrjuFPQi89SjK6K4Yi
         rHpc7bNwDLeVkqnCwfKBTwTUGGlocGMRyiuS0ZToK0j0j5mLUK0zjCo6Bq3FYb1aU+0Q
         pzT7Xw4X/pOETOX2iTciBqFFkkqXbOw89HN7Ll35GdEFrsBrBi24P+zjM0EOo/OEERbv
         RLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712124178; x=1712728978;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VHZlDDn8+obxcAY8UM9iVtdUp7xjMGLFFpGwLETdNzQ=;
        b=FS9kDI8jNwswk/Lw5Ny264ETtJyevVA3uITYj2ofi1wabfJq428zD6ykxClZLMpKIy
         CRkzaFF63KNiYLwOjpBmcg16M2HvJu9wHvhYdOWV2QRDeQoAr1+t9D7+8TSLfJgYohX/
         QoSzeFpsXu6vpZiUnQMKvUSq7T9I+iQSyaPjb3HPK1sQ247PSo7mJAYhHoFHCJ3H0K52
         +U63HRfn9KPhDEfj2U/n0wYXK2CJhkb49LV1W00ChOD4aqWro7tMmQ87mKhHJYckFFyg
         61m4qzMefpAQTj/KBEEZtaocmoVQfWJMX2RX3ephIVxwzxpjcQHl+RIQDOV5iLQ5oKFt
         dMyw==
X-Forwarded-Encrypted: i=1; AJvYcCUPjvCOKIvgT5gOcSJxs3C4Cv3YBTc2aLoLaxJPLIERDrV5uIaygvizUFTz5q41k88Qnx2se/MNbC3TcfP+tvUq01UAP8v0XV3KYQWg93f5
X-Gm-Message-State: AOJu0YxaTR3oKrdlUt2rfy5Je36+3XtAKu3W10EGcgmgfrclTM/clbRI
	u4W7GufSZzlONfJ2ikJRNPNETSblRgFIyVlLaNRhM1e2EDJdTzYGvmXQQ7zUVXs=
X-Google-Smtp-Source: AGHT+IG6voIb0Mwqp0R+yhjSV4IBY/+L5vp6m3JMEg9u/q6qjXSEf1y3kGq+CUpD0T5GKzb0Qzh26g==
X-Received: by 2002:a17:902:ab98:b0:1e0:c5cc:8f1c with SMTP id f24-20020a170902ab9800b001e0c5cc8f1cmr10702752plr.26.1712124178542;
        Tue, 02 Apr 2024 23:02:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id g22-20020a170902d5d600b001dba98889a3sm12210170plh.71.2024.04.02.23.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 23:02:58 -0700 (PDT)
Message-ID: <660cf112.170a0220.d5b66.16db@mx.google.com>
Date: Tue, 02 Apr 2024 23:02:58 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc1-14-gd8db2c6d7b0e5
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.9-rc1-14-gd8db2c6d7b0e5)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.9-rc1-=
14-gd8db2c6d7b0e5)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.9-rc1-14-gd8db2c6d7b0e5/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.9-rc1-14-gd8db2c6d7b0e5
Git Commit: d8db2c6d7b0e5ca5e64c747236b2464d0c1661f3
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
