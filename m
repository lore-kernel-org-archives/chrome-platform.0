Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9BF1E49E
	for <chrome-platform@lists.linux.dev>; Mon, 29 Jul 2024 04:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722227828; cv=none; b=BQjjV0yXB30M11Nd9kO7DQcsEnPXkuzww35pr6dBORjKUSbB3gK6vArzsx11aq/OBVmEVhJ/yAyDkQGqGyHtHUPdOW7cUAXW6WNh3OiM6PaNdVd/qbnuGFbeTzUs5FFoVHpIyS7yXYi6gCn5rd7Iie8bQNJwpKrb70XryJ2scfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722227828; c=relaxed/simple;
	bh=ugUW/uScC7T4eHGSO8ObFQMtPIXuY3GhvOSiT5x+a2k=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=n9B4n4HLrvSDH3lq+Fn3KDff/OPk12QkKL2FmYLlUZsR+WGC+kDjjRAdQ5Kncp1nl89AWlK5PkH4Zt+moJBvBCjoKzx5xkakl1EgQYMQpZSAtfnXXXKwN6qfYDz+FIBzw64mew4d0NybRAhvWKGDziVgX1bAMSMwADG/QFOILEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=3IZYc6v5; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="3IZYc6v5"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1fc66fc35f2so15736745ad.0
        for <chrome-platform@lists.linux.dev>; Sun, 28 Jul 2024 21:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1722227826; x=1722832626; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W5a5nnzWe2kfrui5Q1uEaTwwZEnxKMwgepQYBxXo8Xc=;
        b=3IZYc6v5yKj2it+Ck5BcHJKjr+zGW0L0TBiy3lgkD/++eeAqY4pU29qCiUmKr4yhgq
         EHZbBYblWxiZlRdDfAfeNvQX1wtM3MaYUizzFe2YsGuiuOdvW7sKCy+JATH1iFuDAoFr
         FQDChpn7sUx6Zg59BOjJkbbuRfw9w0aULlx4K2EP8atnsqMEHac5X/46UoPbMY+dpe/+
         ukMlcDEh0HQI+OxlG/TnJ5OO6RjQUsPxkiD28qnLtY3L9z/PhSvoEckGpN7GT+a3XKq9
         dXGVICc5Kct4gMF/gXIEIRjCiGUU3um5EbrCIJqH1VkjaidJjcQyU9A5/p7VtbzMs477
         /Mwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722227826; x=1722832626;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5a5nnzWe2kfrui5Q1uEaTwwZEnxKMwgepQYBxXo8Xc=;
        b=vbTGnAEJ7EUfjD6bg9Sx2goqvZUHe/7ZQACALXxZauoE1EIawzXVVh1GUtyygicG48
         1gSekqDnnvWA/fRh0LODhgOvr8Z1pXRXbn57GCBdOuZHLHI/IB0FLd9VEEmNKlHY7jcx
         qYLIEh9l1Bc5/dIIEib1SaPrLvdjtmflF3Uok25BYF1xgZ9C4joM5VB2n6Dtm8TBdEGm
         GIy6IovCyqOqW0wtEZEj42IWHYoDbR8J5Ttk/iWROU86QOpy/25yo2pzSQV+3ggG2B6q
         R9W1tPe1iQqMvA47r5V4VtH3Ys8nO/tZLearVIie1Jhb8WEyqsqoLokOi1IzRBzGBYcb
         Fgqw==
X-Forwarded-Encrypted: i=1; AJvYcCX0+Czm5QPZZTTYJK6nJd/jSBmXJvD05aAsRwqI2HbQcYS9fIhLATfI2/RsYYv47+71xTdtEbFpIBEX4yMYJJazAAF18Ob1aDQ5b78RFETA
X-Gm-Message-State: AOJu0YyDjufMhk+kkr/qtSUy/ZLfoN25VHbKCVRkzVkBKQH3Jgo8m3Il
	77hnerGkMz5NI2AgN5Glb1f3iY4B9I5Jq2cWGzd2/90Upd+kbylBZeru1PnKWkI=
X-Google-Smtp-Source: AGHT+IF24Lz36KfGwmH+h4Dj80ZdlzMjToFjpC6e/KnBabTj0DQV9Gme5bkrs1Vr8HzUjwJhRYmkOA==
X-Received: by 2002:a17:902:dacc:b0:1fd:d4c4:362a with SMTP id d9443c01a7336-1ff04b01cccmr102100355ad.24.1722227826283;
        Sun, 28 Jul 2024 21:37:06 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7fc5e81sm72500985ad.278.2024.07.28.21.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jul 2024 21:37:05 -0700 (PDT)
Message-ID: <66a71c71.170a0220.199d7a.14dc@mx.google.com>
Date: Sun, 28 Jul 2024 21:37:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.11-rc1
X-Kernelci-Report-Type: build
X-Kernelci-Branch: for-next
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-next build: 5 builds: 1 failed,
 4 passed (v6.11-rc1)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-next build: 5 builds: 1 failed, 4 passed (v6.11-rc1)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-n=
ext/kernel/v6.11-rc1/

Tree: chrome-platform
Branch: for-next
Git Describe: v6.11-rc1
Git Commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
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
