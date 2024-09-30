Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E054979EA
	for <chrome-platform@lists.linux.dev>; Mon, 30 Sep 2024 03:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727665454; cv=none; b=gtcN6asiOHTFVMz5w8+xg3u9LnlnW3c2mrmvnkYufBGQpTKKWTyosERJ3KQb7Vp5Nj831oW07b/xRKu/hrITR8OjJ8pfbT+BKpzzomfkCeUZGna1sux+vUMKRv48FJvGSWJtpwLd3CSdfFayVlMY/BOGvYEy3ewMUfeULQRb1Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727665454; c=relaxed/simple;
	bh=qtUOE0jK2c4lkPMskLv4BV/1nYhI0KNW90bNKDu/qcc=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=T09GdpMUZcLjnPScj5VuX0lnybafUi0W0Qwuz0jvv7uRfWbyhyAoaj6TrJEyAvP6Rp2FKfDH03pghsJ1rH4D7vdb65Fpx12fWGHchvN7HHaRU98E/whYB/Xy8w1VDwoZmVWAiEHz09XdZL6J679BAwSDovbtEFZyN31Ef3Su4wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=iI7ibA6l; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="iI7ibA6l"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7d4fa972cbeso2766214a12.2
        for <chrome-platform@lists.linux.dev>; Sun, 29 Sep 2024 20:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1727665452; x=1728270252; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O/TaVg1yM1JGK/S04xCZKqbpMM8he1NmFSPwCxrGfhQ=;
        b=iI7ibA6l5gbuwj/MwqWRd4obfZ9+AXh3E1v72r//mKs02J+XbzYgvmu0Gr5GPSuJ/J
         Mq8DNQyIjWcx9golk7rLlsH0mo6GE2efMDIi3s6FZbeCJCFuZaxA2fbkFx6xmoJzRwFv
         VyQkcma2s0fS05fF5kESeDLPocX19IoEngxEgzbtZ46NxgNCTXwkJWcxYVZliOOF+zdD
         r9gjyE5hioaQmuolgZXh2TVier8tGpJzWmkKZWpzgffblK+ZyLjYsDBZU6Y2RyfLHLKe
         zmn4Y+PMwkn9gVhCzSf79tdBxjK9SpIs3YS3ClKBpbPKmVl4N5Gp8hQ6KqtMMLJ9Cl3A
         7bzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727665452; x=1728270252;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/TaVg1yM1JGK/S04xCZKqbpMM8he1NmFSPwCxrGfhQ=;
        b=X7SrYljyNXZQyoVFzmInI02PuLjrKelRV6ICyLWkkjG7LNHswI+wDL8d4vSgh74ULx
         6xqsIBp6Hk69Bie1V2mqMoVnhIUurrb4pAvVNJ81nceZVgwI9Ivk2rpN3+YEtNCzqa5o
         TN4r3Ic9DOVjgMlDLsyu7fzobcDvmn3FEqRokuQxjg5kuFx9TN1QUOfeyYrMrgzu/gn5
         2bhqHbO96edzph71xfWOXXT+xlNvbqW3KxHXhORW2z0PDCHpm2q44g4hnJSWD32cQ5Rd
         PWVI4Gr8TTZ8TOria/Wt3UKVob36VH10txXC7SfT06+INYqfhbP8xyFlNzHiUuD48clq
         1Z7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNxgpvqv8637wdhzZrzwpS1n6w4a0pJhIPwS9me3wH2TuaJAmeLTKSPvKsINfNmSbMGDPtyELP4Egj+g2JbIk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxWndmNxNnXVejq5CuTcFm5Pzu2u3FojACldfSuzDgsBDfH7tCH
	wLA073vhzedh6tO0l1GlbPUQQjQL1/NNRfX7u+H+MohAKji2Kknfn5uS+AOvZ3w=
X-Google-Smtp-Source: AGHT+IHd1MbPzlkR7C/5CfKwbCrCaPhaFw0omDfvRIJNzEPDrwrTbr2ngzNtewUZ2xr6dyJbl1zh6A==
X-Received: by 2002:a05:6a21:9209:b0:1cf:44bb:1cc4 with SMTP id adf61e73a8af0-1d4fa7ae07emr15803026637.40.1727665452058;
        Sun, 29 Sep 2024 20:04:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264c2560sm5204647b3a.87.2024.09.29.20.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 20:04:11 -0700 (PDT)
Message-ID: <66fa152b.050a0220.2d7539.2f62@mx.google.com>
Date: Sun, 29 Sep 2024 20:04:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.12-rc1-2-g67f488dff17e5
X-Kernelci-Branch: for-firmware-next
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-firmware-next build: 5 builds: 1 failed,
 4 passed (v6.12-rc1-2-g67f488dff17e5)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-firmware-next build: 5 builds: 1 failed, 4 passed (v6.1=
2-rc1-2-g67f488dff17e5)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-f=
irmware-next/kernel/v6.12-rc1-2-g67f488dff17e5/

Tree: chrome-platform
Branch: for-firmware-next
Git Describe: v6.12-rc1-2-g67f488dff17e5
Git Commit: 67f488dff17e535ac3a8a52b47ff1363d8134983
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
