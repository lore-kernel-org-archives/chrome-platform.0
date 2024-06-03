Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546F520ED
	for <chrome-platform@lists.linux.dev>; Mon,  3 Jun 2024 02:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717380132; cv=none; b=dY4QywZCCbGj+41GSaHP3mDwl0kezgrG9wfSstjuLsZR06w822O4y2eJOW8B+KVG16MeKQBZcgkBQMeQsaLKAE5IoirWr77dZlw5yspG09+Epn8L3E/tqwOLvPXncwnUDEYMJH21fZnkAagP57kD4RC2GlVkjW3tEfQkQr6qsyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717380132; c=relaxed/simple;
	bh=OHP2OSVakwEf+eiXiaR1r9THU2QhY6fvc9lktzLxutM=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=AOu0u6SFH75Jtt1QG0v1q68ESTQvYGpHsIF/hLeWphQDa8cyQWN2mYESv4fUlPj9QIKxhWnw4BZnXXIwnyF/StJgCBaPi/0+uUyQ1tgTHMj/9KazD+bWpqwUqyJD0mNQfOB4bs6VcyP0S131J2Psw7eAgO+Zvgl19hO3Mn1pbQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=cgycArYd; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="cgycArYd"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-701b0b0be38so3504159b3a.0
        for <chrome-platform@lists.linux.dev>; Sun, 02 Jun 2024 19:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717380129; x=1717984929; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OHP2OSVakwEf+eiXiaR1r9THU2QhY6fvc9lktzLxutM=;
        b=cgycArYducMy22CivJ8WLXconAqqL9SCbO6W88rZ/dZWPnMzq7qlRJHjYoo6qSuA/x
         I514Q9Rnn/VYfa4y1b6oP+nZCRcJmtEXZAJimCpluyWBVqAiC3DH9ZCuscsVavX+LQ9E
         sBIjsvVDoCNkKe3FhXl8cYVNnEE+Ug1M1BEyTe9b0LhYuc9MCSe/dnFS4Jw74Cm1dPH4
         DG2Vt4d3+QTfHWSF1KW0F8KOEQk8Lh9kvFkcyMkcIFkVj7dPHpz1p9lH7yi17CmYVFhu
         Gry31DEBq5TyEnbzC5c/B5XmE6r5b+Dl3BT3Vb9P88WPIqTGJVp6meRFRrmyIKof0t3W
         8qow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717380129; x=1717984929;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OHP2OSVakwEf+eiXiaR1r9THU2QhY6fvc9lktzLxutM=;
        b=tGahtNQ+2LbAwDR1PtGZgYNnTNOXoNdgnEho9AsErythud2iHUQj34AMvqga6yZgUw
         QS8FkaJSn9SIFgZsCXH2zE5J5IIDr3cOvuR/YgKvj4WA7cYhyB6lYDjm1fBw+iIgxlYB
         /Aht84I0zmfd3YOam7+UJQ6SeyhxTvt1wJ1KqjnrPQyYyjhT5N+Eul6a7Y66hAWVzBHC
         HXSDA6gNy7WrhHm44ztm2K36c9hlMKz2/+aVCNNu+OFxjaPi58QGYxJ4QTTL0JQS5bc2
         db2qtDsVgiDmzyuBljS41muxeBKwdMTZzAq1bwnJobJJ6Gyv99S4/r315IyBWf2T8fO0
         xBnA==
X-Forwarded-Encrypted: i=1; AJvYcCViVEZVlad5xyijnsRhYK0c1fg2+GT31xnwZTTnCEqzuec0ecuJ3K6f6eQwixSbBKvo2u9KukOIMr8/wj6F8ocfqrgSl70ZiouQbO+O8/VA
X-Gm-Message-State: AOJu0YxFlHbhgD8s4+la2hjr+5LQagGRODro0XmVhDc0gcPp8BKvFdkB
	n0C9mY2qXt5+1xrARYI8d75Apgbzbz/LMjdAI/6XGIoBcZzyEsZoJFDWPpfJC3U=
X-Google-Smtp-Source: AGHT+IFu+rsVj1S62F2yPZRIDM+TolVTH7cS0DxVlkK7lHkmEXCs0VIobYPWpyDevTy8ZA0NZZKseQ==
X-Received: by 2002:a05:6a00:1801:b0:6f8:b83f:d433 with SMTP id d2e1a72fcca58-702477e8f63mr10834731b3a.8.1717380129445;
        Sun, 02 Jun 2024 19:02:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70242b2bfc6sm4485012b3a.193.2024.06.02.19.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 19:02:09 -0700 (PDT)
Message-ID: <665d2421.050a0220.0b31.b1f1@mx.google.com>
Date: Sun, 02 Jun 2024 19:02:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-6-ge8665a1723789
X-Kernelci-Report-Type: build
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.10-rc1-6-ge8665a1723789)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.10-rc1=
-6-ge8665a1723789)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.10-rc1-6-ge8665a1723789/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.10-rc1-6-ge8665a1723789
Git Commit: e8665a172378986159ce8aaf45712c43472f5866
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
