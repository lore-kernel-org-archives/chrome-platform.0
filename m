Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF50880617
	for <chrome-platform@lists.linux.dev>; Mon, 29 Jul 2024 04:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722225662; cv=none; b=ud4K/gJlqp02i0J1xrVlZiHwGjj/+3JGJJy+1XTokuStAr0GccKshyX+pZ9ivIZqjalAy5nmpNpPz8uq4FdYyqdydX3T3EMBYct2DqBAwckKKi1eTlnKSONk92HB+Gsw2JW2uV7b/DkNS+y3vLFSS5kCy7BsM63nRrS1RY9yfIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722225662; c=relaxed/simple;
	bh=UypkIIaX51uZa/GsT4ajPtLS4Z4ThWYUk5BJXE7Gu8w=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=H4P3ix6QyuUpNC9GgnT3dIyfbWAzUV+lJHnG4gl9aawtIwlHt/sAagEvE6MyDX/VNej19YZVsjnkC1Vvka35YsWjXeRIJ3g8KpCuTwDkzWIRyDkw1522MTMRigO57iN89VG7EiLpdE4MhVAFOEje+tWOUMwn1vBJY11+bTunjFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=jN29ebql; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="jN29ebql"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1fd9e6189d5so17017135ad.3
        for <chrome-platform@lists.linux.dev>; Sun, 28 Jul 2024 21:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1722225660; x=1722830460; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aZYz5rOI30VLy3vL+/4U9rfWz7XUxuarEFt2qnB1d58=;
        b=jN29ebqlshIBKsjEBa4HLNVdRGlEcmShLmoDY07JceO7osgSywLAh7BaODh5lULmq0
         py/FX4z/0PGhog6od60KeVzrnNvT/vlgi7BDy0wcnnJkVGEPeEKbAOXndWeYXfd2656N
         ghrlKPIDSomdjWoI3tghoT2KP+aaxKA7EyokT8dkTmvXZ/nwWvz/HYKXZ5KBJKLERpvz
         0GQ1OPLwMgzkDENyKKT/ew2WSBqzz7juIxOqoX2hmZ0YpQsqQT2tKSqyfL8iRxfgw2AU
         nM2kdXeSDb1Fq8UceT3N0KP7N0kJ3demAUJscTyzu6vL9ib9ESA1Q0CKcc2+rUlCUscc
         v4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722225660; x=1722830460;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZYz5rOI30VLy3vL+/4U9rfWz7XUxuarEFt2qnB1d58=;
        b=ZFPVofjHTfzVxU3fbSw3E2FnAgZDM2QJSb2Z6BbWs+jLNZROlZ4lfQt2LuULa7gJtY
         L4+zTNecLtuIQhmY1NtaeBREJ/cbJ3XFnHoe6CilWtjiBqPXrWaHAdkGuNuFfgqUfgxU
         A316t3I32BGCltRrmLSqfd4W0z9SHS1iZANvgle7uv0v4tSg8TtgnvV8X6NBFewRitWc
         aBppG2KW1IveY6PPhIb/1LPyU/md7ahxhxGh0tKaVmzfr6J/TNE7Lb0iXCk34dpXTWwb
         hVxCGXQH0pkbA4qIlQOdbIqgHYNbexwVS2cOKnBDDU1Eh40w1RPpmPf5Wlcc3MofBYCU
         USBQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4ogPxLeqFrWKPZtiE7PxR3zil9nM4/fFRRsifhFlpn1xhGHi+XWKgvrOBm7tFiOcLyN1/sIPlSoNq8Qpd3J8V/hx55anY75F4vZwL9ydB
X-Gm-Message-State: AOJu0YzRRb1nCRaHoRAjcTpg0YwVOWNlEKeOwF/V+4q7jep/MoV2fv/W
	a6xEvJEa3X4oBi0BqtgNmKG80fmW7wFNBxnDUPiR74xt/chPZZH+f2zI4RV2vgc=
X-Google-Smtp-Source: AGHT+IFxKvnO7zocOF7yjCs7LFUUYQjytgJxIaz0qqBDGWEE09zA+WDt5CD9q/kZ6UTt2V1r9SOJfA==
X-Received: by 2002:a17:902:ecc2:b0:1fb:8f72:d5e9 with SMTP id d9443c01a7336-1ff0489f5cbmr45421565ad.48.1722225659991;
        Sun, 28 Jul 2024 21:00:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7d3947esm72010725ad.116.2024.07.28.21.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jul 2024 21:00:59 -0700 (PDT)
Message-ID: <66a713fb.170a0220.3a3d9f.1637@mx.google.com>
Date: Sun, 28 Jul 2024 21:00:59 -0700 (PDT)
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
X-Kernelci-Branch: for-firmware-next
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-firmware-next build: 5 builds: 1 failed,
 4 passed (v6.11-rc1)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-firmware-next build: 5 builds: 1 failed, 4 passed (v6.1=
1-rc1)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-f=
irmware-next/kernel/v6.11-rc1/

Tree: chrome-platform
Branch: for-firmware-next
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
