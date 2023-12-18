Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91077462
	for <chrome-platform@lists.linux.dev>; Mon, 18 Dec 2023 06:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="a3YDEStZ"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6d9dadc3dc0so2402882a34.1
        for <chrome-platform@lists.linux.dev>; Sun, 17 Dec 2023 22:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702880061; x=1703484861; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E85wclCKdj+VUaM1btOhx4iuoKI1F7o+XcQR+jOqnYo=;
        b=a3YDEStZheGFfSvLXiC8PelbhMYYE9uRb3NZ/fejzBU8XV4ZzVLKaXRhUT4ryOwebX
         NQXdpDeeCaIrSjeplk3yXErt0/1O0R7F6EIFD8NdYHeM/umkmyMRl0aMYiVcAyU1I1mQ
         vWrE1D2wJAuZ6th8PQ1nw2AF39NXuf099wXOCUc+cYw/0siXrSQlQMtwgQpiQ6b4FfZz
         j9+MsWduJ00OCA9/3O/nn8G/Wob/oRp/yMuOZZo1oNhhaYldEuav3MnS3FScKPZoxIka
         oASFda6WwmXcXFmgFodww9SizdVo1OsSrLAZ1Fb/b65mTH1zZsTLwgLbaAPnGFFmVATp
         fIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702880061; x=1703484861;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E85wclCKdj+VUaM1btOhx4iuoKI1F7o+XcQR+jOqnYo=;
        b=uOQdO7xNLM+DdbSLUFt/3HY/ORaUrGf+TXcZ8CuYcvznKppVUlOc2WzWAvuw7aQOgG
         x2NXw0AbrqqeWA0+XkjjJg0QRJIUO0OhHsKI4RH4t59fmNWVZ/lXuBic7mWyd4wnQEYT
         euhm5pUrzqQchI7t7z7y9R0H0Its8pLBxWQR23fuiWDxydt5eZvk01bhvCnGuOAuYXKH
         9XjXVkqeMQtrXL5FwehWuKN4ZwM23mQhUjwEpN/WQCquhrlN3OvvuKGFUbVA+CJ8Gerr
         YCi7cq5Jxi8hz3QoWrjp33HuE5NYbmBC/52LhCBXQfcZkg9ctlDtnwoEBhyuTQddw2p1
         yocg==
X-Gm-Message-State: AOJu0YywFikpVfo6p79tg7JsdDWyOgijOYpP+YHDidNNTM5Vmj9mG5y2
	bb79snGTAJDvAYb9IWbmRN6YwA==
X-Google-Smtp-Source: AGHT+IE5wGVMMdCMgA8jaDMHaRNFOZiZ4tuVnbPLFc6HfxpREAIblKNTJY79QXdpZLdQMKWWeoJbJA==
X-Received: by 2002:a05:6808:118c:b0:3b9:d5ae:5d53 with SMTP id j12-20020a056808118c00b003b9d5ae5d53mr19420260oil.41.1702880060845;
        Sun, 17 Dec 2023 22:14:20 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id m18-20020a63fd52000000b005ccf10e73b8sm2604441pgj.91.2023.12.17.22.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 22:14:20 -0800 (PST)
Message-ID: <657fe33c.630a0220.2a755.592b@mx.google.com>
Date: Sun, 17 Dec 2023 22:14:20 -0800 (PST)
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
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.7-rc1-4-g57eb6dcd32cf6
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.7-rc1-4-g57eb6dcd32cf6)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.7-rc1-=
4-g57eb6dcd32cf6)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.7-rc1-4-g57eb6dcd32cf6/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.7-rc1-4-g57eb6dcd32cf6
Git Commit: 57eb6dcd32cf6b49c38eff81e60e8fd471aa05a8
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
