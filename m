Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EC4179954
	for <chrome-platform@lists.linux.dev>; Tue, 11 Jun 2024 12:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718108205; cv=none; b=InS1IVy8dAVTTFqqUWN142VvwX4m13QfAccsCej0nr4HE+ccIrzW6MV4boMXECylTXLCvaNFzTjf2KmaAn/0GlKN0Mu1XgwWagGLW1RfOFPE2zIgh8RRDp2XOrI40kcxkGswrTJ+rMA0nl51D3VuDnD6ty10sDHDXQcSutExDQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718108205; c=relaxed/simple;
	bh=p69iBXZkYsvNC/g976peuF4khFZcYeAlAdMA0rpU0qg=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=eO83dCgakYwn4w/RDkT7JMV82lUCtqL19xRLfqFtx4ewQDCfDWoav1e2eovHVLpd3XoZ8ZU+vHsqePYYNcnXwpXaWynV+jCTy3cCGoVo0e2sxdr1qJ3XTsQdnkMo7z0aa10RyfXmmdO7792M4dVVNJvms5wUY5Ex/dHd52Xs6tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Ikwi6sGz; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Ikwi6sGz"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70432d3406bso2041976b3a.1
        for <chrome-platform@lists.linux.dev>; Tue, 11 Jun 2024 05:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718108203; x=1718713003; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p69iBXZkYsvNC/g976peuF4khFZcYeAlAdMA0rpU0qg=;
        b=Ikwi6sGzMW0yWQej/uGVZrwPYK3sfGogpgjWF0ZUxA9i4aOEeT5oOiYg855IWLMVO8
         9JRtUqc/6WdGqwJVANBUVu3IBpY54nJo3jWmdGPyCpuf/XwKl0y3hQJN4zUqVVVJJofB
         s1I13FRMAoVzcfPlwr8J6NAxYqlX2rMwgsdBHpnq1lt13Z5enikU5RrUHl+iqah5eY88
         IoK33gXNLV7KkATO0zgOyJPmqlZNA9au9+FDln5ch9uYyXgmiTtcdzkuY4XdWjWoMk1x
         isZHb6cJiJ1fMv/RKCdcGqst2W6IzuBdXBemtxvzx6b8PvlOYpiZM0+XHM2s1EcWPZVQ
         d7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718108203; x=1718713003;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p69iBXZkYsvNC/g976peuF4khFZcYeAlAdMA0rpU0qg=;
        b=vnbFc7Zb2fXCFt1A3iI9GzMomP1YTJmocMvYyF3QnjZzco4fsLaZDvb6mO4i/fPdO8
         73HriFz4Vx9WjuAcJQVUsh/acwlj49y6alXvxeYS5LDujhLkuUa3bZafOghK19d8tx2i
         lbLgk1oYP6RJM3se9sABHp4HjNxMKI4SNV3hwgSGGLEmEKz36cgK8ew/1jn60FByG1ac
         6KF/L/ppZ4X+uwlRAsXVAVS2FXo7iAApJRY0eV6LPa7yC4cgcm/HVQ89zjVybNWviSSb
         VTwcj/jLTc0s/5qGOv1DU1X8M3x2wF00+9r3GbGSiBS61xbJcoxxhjilpItvz6nHP0J3
         7Nzw==
X-Forwarded-Encrypted: i=1; AJvYcCXeiJEshvzENEyjLSBuKh85nvxIQ+hj6ZoJDQSBKHEbQI0CV0tFmJvUtb5DjJ+CFnBrBHPOPWT+UVpIFQjNEpRpu7jtn4w0bOdlD2vZVjfQ
X-Gm-Message-State: AOJu0Yw1ttirxh8C8yeRrXEiUQEMPKKrYEFR370zdbbuLaXmakbSvsO6
	DT+hIUF+eqxc/swFIbQftkpjUCrIImzGHdLSBN04/Guh4tAl3yDar31QcOVgOF0=
X-Google-Smtp-Source: AGHT+IGmGTBqwn/xg/7YSHAvt2ZJiRFLebcBzoza93L9fmrED60c6+clYZzMwrdV3lPbcolemKpEOg==
X-Received: by 2002:a05:6a00:1404:b0:704:6ea0:2bac with SMTP id d2e1a72fcca58-7046ea05af3mr7417637b3a.8.1718108202572;
        Tue, 11 Jun 2024 05:16:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd495181sm8318107b3a.114.2024.06.11.05.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 05:16:42 -0700 (PDT)
Message-ID: <6668402a.050a0220.323630.73bb@mx.google.com>
Date: Tue, 11 Jun 2024 05:16:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-16-gd11c00292a31
X-Kernelci-Report-Type: build
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.10-rc1-16-gd11c00292a31)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.10-rc1=
-16-gd11c00292a31)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.10-rc1-16-gd11c00292a31/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.10-rc1-16-gd11c00292a31
Git Commit: d11c00292a31537ae1e46ddea8f101f8822ede34
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
