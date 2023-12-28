Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0AD1396
	for <chrome-platform@lists.linux.dev>; Thu, 28 Dec 2023 04:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="3bWXn9Wr"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d427518d52so26589245ad.0
        for <chrome-platform@lists.linux.dev>; Wed, 27 Dec 2023 20:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1703736683; x=1704341483; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wQaL9wlyL5I+9sf1mYzMIOboJAEWEWjPq/PsPSn/tC8=;
        b=3bWXn9WrgBaebfexazD9u7Ugh7Uhh5WMAInRT68OJvByKkO8dcjRZE2pAVvWmv/BIe
         UuT/T440+5p0bY9woNTME9AznvTXcNPTGZRI6uAuJZaQTL2lrmwhnJeyloZsXXFr+Gp+
         9zY6hfFg3NJzTfWxs6YigaT4jx/EJgSKTMzQSmj5Ylw09FL5K6SO/JwInECtYbFkzx43
         nOMZtbd3Qybfvc/g00lF1Y1rzw3znCOiGBXO6i42yUC7RCAKABG3yIEMT3HzxL24uiB3
         g8XS0FcHW59I2AQS6C0baJO+56kgr8lPWrMS9YPU/1S0R5QA1NhrXW8/uls/5UJ1z4to
         VULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703736683; x=1704341483;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wQaL9wlyL5I+9sf1mYzMIOboJAEWEWjPq/PsPSn/tC8=;
        b=n28Odguz+PExzIgGl+zR45Om5H5PJKX6Z6xvm26HloeRPRzIxMRQscbsoJzG+moRJK
         gBPcHSug4hwn9FgJiFhf87+NnQKLnuZtI45d0+ja8e2JAUPU9LifLtIoK1cjWtiQh/RM
         eb5K/1RwAL4GzlArv0vN/pkoHTIDHDSQHn7vTYYIwG0gk9xODF2DVcHHExnBZHqfQ/bw
         ycYlviR1hLPdJRAMtD88DzQxO7KKxkD0riDvChIuUitgisdLGa/4dCORb5Xv7N81yI0z
         fFY362ahZLaDSHV+jeb0fS2XpLmOEM7uIFH47Bj+hFRv67bTCuq7kvHfTpVH5DXE9C68
         SVmg==
X-Gm-Message-State: AOJu0Yz0K5dRwLCVJXf2MqT/deoj559jmvZ69cZ52s1uIwBTM76sSMWK
	TyHVmEsEX0BDSnTG7pgZV4E0u3YlCsBFgQ==
X-Google-Smtp-Source: AGHT+IEPnkWlvKd3EDuZ8KVkCFH0at2ufihgzOqml8vWSVUijtRGNKqqMqoiB41rRj8AZ9IsdinCrA==
X-Received: by 2002:a17:902:ecc4:b0:1d4:1b96:4232 with SMTP id a4-20020a170902ecc400b001d41b964232mr12430869plh.64.1703736683514;
        Wed, 27 Dec 2023 20:11:23 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id u10-20020a170902b28a00b001d3dfebc05esm12798541plr.21.2023.12.27.20.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 20:11:23 -0800 (PST)
Message-ID: <658cf56b.170a0220.ce86b.e3cd@mx.google.com>
Date: Wed, 27 Dec 2023 20:11:23 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-firmware-kernelci
X-Kernelci-Tree: chrome-platform
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.7-rc1-2-g09aeaabebdaf
Subject: chrome-platform/for-firmware-kernelci build: 5 builds: 0 failed,
 5 passed (v6.7-rc1-2-g09aeaabebdaf)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-firmware-kernelci build: 5 builds: 0 failed, 5 passed (=
v6.7-rc1-2-g09aeaabebdaf)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-f=
irmware-kernelci/kernel/v6.7-rc1-2-g09aeaabebdaf/

Tree: chrome-platform
Branch: for-firmware-kernelci
Git Describe: v6.7-rc1-2-g09aeaabebdaf
Git Commit: 09aeaabebdafbcf4afd1c481beaff37ecbc6b023
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
