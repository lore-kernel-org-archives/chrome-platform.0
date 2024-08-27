Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107194414
	for <chrome-platform@lists.linux.dev>; Tue, 27 Aug 2024 11:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724757935; cv=none; b=tDef+awCLYqPUDSdl+otfjak7Pj2ZTTsfHfTb8Upg+F9+YJ3Mpzl6FjMTr1sx3jZlrBr9x2IzBwEmBtoX0dO1d8oQbUFi6ZbrpwKk3OZZCdjxPd9ZMBwuC1pwQ+vy0frXL5H/FsshbPeTYhmph6g/0EdmL9zd+tWHv7fJ9h2bwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724757935; c=relaxed/simple;
	bh=p9nzXCkh0N+ol0Gh4OIZiLXM2kgHZY+FNZuHYpiyVFk=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=WYDX7J0mrMljoAPUMBko0Si8mz0TSj7O4d+sA/Z+wHVeN2dlNCws5LBVfgzDDXJB0WrQJesqvX0IAjpHw5BBBKwDsaaxbfB924LEwpfGfGhnCdwQQh2Hb3EHArTLpMyiDoZqOz/UyIAFdbC1RdFQlqq1AnL9c8gEd4Qc0fHEX6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=nec2QfI7; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="nec2QfI7"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71446fefddfso2910329b3a.0
        for <chrome-platform@lists.linux.dev>; Tue, 27 Aug 2024 04:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1724757933; x=1725362733; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2p/FwwUmqB37B3vOvIjs5INE6Oznf98mjgzJidc6/ws=;
        b=nec2QfI7uSaxPcV4dAyqGE1hTOARFLxZpnF2M1k/tVAy+Gffxpn9+ls5W1pK44FBv7
         Kej0JT6kp85VfFIIUUlGbWOoY+jpcv3kVX7nypbFqTJOBiVZmBACrzt413iJl9J7O9QD
         KNRat3KRWBap/X3byB+ETofpkMo2TuQSQq/leiWHKcz7r0rOLz+Oo792/xQl7vEGT6yP
         mH8gaowrtqpG0wHaLlzIKi5CuR9udr3stQzIf9NPLenWjcE05+J/BMsUBkRRYyWYY32E
         x51vZunfSquJ/8g/2OTqnikYvQ94fvBdb1i3rAmmMibYT/sYZBh2heU5jBGNfOno6YhJ
         YNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724757933; x=1725362733;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2p/FwwUmqB37B3vOvIjs5INE6Oznf98mjgzJidc6/ws=;
        b=Xk1byLtlo8emHd/Qng9BeCwyMPMF+gMLuIKOLZQy2W4cB3rSbPnoJbnVbkRZApRn/j
         5xTna0i67XhGsbS2o4sbeVOqjx2rV5pHt22p4uTWHX3ooBa+Mwp6/oo+dFlATJBh1kUi
         0/vbNVQbtXP9loOh9tUGshLN1Tn8tBd/RddSd9sRj1iTEw9csQOh9u94ccvg5ZpQI3lu
         +RktAdExdeKTFl/JMMyPB2Uoc4VnMZOt/KEbD4+zIMm6soSqo7cimJ/e7AZeE3AY7rA9
         856V2CBU5nJoprIXrYJQe9WCm9uF+4itQ+uh+M74CbUaKY4+TP+hIRqQal425TMLBB+g
         SXCw==
X-Forwarded-Encrypted: i=1; AJvYcCWWT3gyjLS/rGYD0/wHjysPGawqhbBOU9ftA61Zor7mU1I2TVqIPMaAS9pnPOypu82Hbt1Bnq/L6GAepOGwHSE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxnH6Bew8na9QmmVakH6uwu2bo6uHQwhm/N2ST+R/0c+Rfk6RNp
	/7rBR14OyuZDacO0adVzH8uPBpx/SZRCtilZO5B7iVDU7CrBwwenIa3jbumLA60=
X-Google-Smtp-Source: AGHT+IFELfCZ34cvappipPE04UkaNK9dYXu1T0+wckV38BI3CcAQD3CWQ8trgUu264nko9d2J5X87A==
X-Received: by 2002:a05:6a21:3483:b0:1c8:a0c4:2349 with SMTP id adf61e73a8af0-1cc8a07c029mr13937751637.45.1724757932873;
        Tue, 27 Aug 2024 04:25:32 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038557ee79sm82182625ad.82.2024.08.27.04.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 04:25:32 -0700 (PDT)
Message-ID: <66cdb7ac.170a0220.46be0.ee29@mx.google.com>
Date: Tue, 27 Aug 2024 04:25:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.11-rc2-3-gd1b35e6d34e9b
X-Kernelci-Branch: for-next
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-next build: 5 builds: 1 failed,
 4 passed (v6.11-rc2-3-gd1b35e6d34e9b)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-next build: 5 builds: 1 failed, 4 passed (v6.11-rc2-3-g=
d1b35e6d34e9b)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-n=
ext/kernel/v6.11-rc2-3-gd1b35e6d34e9b/

Tree: chrome-platform
Branch: for-next
Git Describe: v6.11-rc2-3-gd1b35e6d34e9b
Git Commit: d1b35e6d34e9b46fbf98444dd7aa114c032e9ac0
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
