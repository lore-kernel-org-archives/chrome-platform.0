Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE9B1C4B1F
	for <chrome-platform@lists.linux.dev>; Mon, 25 Mar 2024 04:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711342480; cv=none; b=KC2jnGvy0h9tv3pMr3Yc5lggTYLhmt1xRqm2r7Y7Gp0Ub4eVpRgHUsAShrKQ1W+eyHeSOaK2fm+2i8WeCMRm2PStsUyWwYjHeg8w93z1cAEl1F8+/zzmGacZwaGCFlHjaQ7VmDXCNvvuMJBi7dVV2GmR7w0F0Kleb4QquUd+mSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711342480; c=relaxed/simple;
	bh=oYjhf+kFyhHpyYKIkEvjZG87GkAW9GIL67j0n/gvT2I=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=TeLybKZMCeYrgIzoY1a7I1OBu9nb9/Lk1V9e1CUebKu4HbLQ/YRZyKpsBDdlkaHLQr3bss0y1mzw2W4mxvSXCaNv62UwSK8xXK0DgrOloFTgX7qlwczKNCZ7EyAhSw50tMp8qGCWVhkkceZlxilxQ+goQZWYsSg7nk0M0vhvXEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=CU9AOCuT; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="CU9AOCuT"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e6ee9e3cffso2628071b3a.1
        for <chrome-platform@lists.linux.dev>; Sun, 24 Mar 2024 21:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1711342478; x=1711947278; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oYjhf+kFyhHpyYKIkEvjZG87GkAW9GIL67j0n/gvT2I=;
        b=CU9AOCuT5Bv7BS0yd6Rr4gbst3KnnxwlP/XSSsNPmRPGL4tJ9ltMxjS8i6WFCM3rnp
         OhjZdhrws/Pg1v49h0aajQC0evDiHKruYIlmK6zizYtB/U6pgBQcnzImkQiO4Yop/MEG
         TQAVnlvRQOTDK8cJ/ygDJziorCWJqJQ7Am6ZKwcJfk5SXEh3snF2FCnNkxvyhdJ55yAf
         lhrbUz2Mc8VPvLXtyO7VrsbKWi9TaCdoNZFcFo81pXMwiIV7sBHRtXr92yL5VcMhqP+e
         pGbxNBpJLZYOf+/aFg2F2iR9wxGKOb9jCrFXMkMxm6D4GT9T5A96KX2H27O4LFt3sVt+
         psGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711342478; x=1711947278;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oYjhf+kFyhHpyYKIkEvjZG87GkAW9GIL67j0n/gvT2I=;
        b=mmufSha4ieGZ8GVsKlbJf656tKYZjR37aHPuDxmTwVVcrsSzpYSfzDcsbevPx2XsLv
         EPmdsswJZkInoqXoAdEdV/bLVYE0OiVXHZvc3wp+ohxpejxNkp5/D7RbMnRHEgHOitao
         k0Ce7K3blz9DMYxULnVdZdM6gvi5xxdJRI/J1pRfSj9zXL6GviBH63Fwtnq9QwYz4R4X
         ILSpSUXeoq1gDE2p2VJJLAcMa6zXYtSmJ/+vAD2KjXs/Ddqk3dnmuaI5TOzzEqB2yr4V
         veKHcj7cFOf26wR6oCKqH27/QplO9IMMcPiEkBpiQKWCCt5ygILEZloKzh1Rbcfa8t8y
         BpMA==
X-Forwarded-Encrypted: i=1; AJvYcCUllt/zbbFwF0yzLugsWmYRuAXIo+4OL/L1Snu5d8lRkhLnyJihGJ2tZUi0fawkYDTaTaWGrlQAOKD9h7OkVV/c/cvtLD16J3q4nlD0Cjkf
X-Gm-Message-State: AOJu0YxfcOy4M0yjtXCn6d59LYhGVaxvJNDsHJF0BBMRd5Ve9XLRr9e4
	XujeJu+NTY3at7F49eFAPdEtnt7yFOEEnrUn1PG6XRNvljV2pZCjSBjE8RopTQc=
X-Google-Smtp-Source: AGHT+IHyW6NWAmEHUUnUV+MAOetXp7gJ+nv9Y/8z8WqrxZKSnVXV3twkUPcjxZGqCDUXsIiN1MgolQ==
X-Received: by 2002:a05:6a00:cd6:b0:6e6:1712:c543 with SMTP id b22-20020a056a000cd600b006e61712c543mr7460291pfv.12.1711342477711;
        Sun, 24 Mar 2024 21:54:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id i26-20020aa7909a000000b006e64c9bc2b3sm3526704pfa.11.2024.03.24.21.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 21:54:37 -0700 (PDT)
Message-ID: <6601038d.a70a0220.bb038.8864@mx.google.com>
Date: Sun, 24 Mar 2024 21:54:37 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc1-1-gf7496450528bf
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 3 builds: 0 failed,
 3 passed (v6.9-rc1-1-gf7496450528bf)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 3 builds: 0 failed, 3 passed (v6.9-rc1-=
1-gf7496450528bf)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.9-rc1-1-gf7496450528bf/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.9-rc1-1-gf7496450528bf
Git Commit: f7496450528bfe9350c5a62d180b4926b96f571b
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/li=
nux.git
Built: 2 unique architectures

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

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
