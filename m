Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8738FBEF
	for <chrome-platform@lists.linux.dev>; Sat, 15 Jun 2024 02:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718417587; cv=none; b=qT1b6vYiZ2vRcG0S5/IpFm3kFuVpKW9foUvE8bhsxYCybLpSSKl0hoCSWbUXE5OlUNsPssuQQZakZ4MsGzR96+XfTUnjKaeQGXPGKmB/1IwAdSqBV1FI+I4iEI/v0BFCgE+uu+BkrANx89FnslXwmmikk1Tlfp7CQJtLP3QPJ0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718417587; c=relaxed/simple;
	bh=f+2/CjGhnedqsMpZcUVZpeI+oMdAtJ6faLSBoWLlk/I=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=hVz7RvDxwLh4TQ4IGrwij0vXaljd+LH8GASnHthQEIJ197zbbuBudUQIslZbl534ryzpDPbz5Bdv99wG/dGxu0wnHK01mzj0kDN1TUEWxlHFxSHtNjvcQgtj8ZfipHgFF5fuqjZVLhSM6JQxI81zd/V3+G5lUM2mD9aaZmdWUNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=2fgaWT9p; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="2fgaWT9p"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f6559668e1so24402925ad.3
        for <chrome-platform@lists.linux.dev>; Fri, 14 Jun 2024 19:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718417585; x=1719022385; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f+2/CjGhnedqsMpZcUVZpeI+oMdAtJ6faLSBoWLlk/I=;
        b=2fgaWT9p0zDrGbP+8gNMt9Hj6roVdAZi8pXAh2Ie7KFqZyQSnpXwCi5rZhvOfHKicY
         drS8ZBRExymwDAqb/aTNQAhzKMHCmV27vSRBa9x8D3SWsJSjBM7uYTzyEoczYkRO76n+
         fm1GBZdn80u2RUhQM3AHGI4Nzn1KoCs4hNPQMrIybHGmBx08wPKYlxwzcndhqPNFbV50
         juJKKRg9UiIQ6hvwQzh5gMdH/HlIqNUdO+D1QMAtoBXr5lhFcZefbYOvIkkzcbkj2KE0
         LLlzu/+dEMP9ubG2jZaATWFy90fx+KFsFlHf6vq/D1wKex+40KLJ1Um5fOjl5f8K47OP
         ZywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718417585; x=1719022385;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+2/CjGhnedqsMpZcUVZpeI+oMdAtJ6faLSBoWLlk/I=;
        b=veNyHQUF1pN3Gq7LeHj0GSHJsb73AFJd2qivz6IWMrLbREHYq8mO+7i80OaBadXXVY
         KALOYYC0Whdr+R+NzaEV75Zdh43ngvNhGxpz7bxkTWYWQDoBkl0QECVjUyzJ5chh/9Fj
         4ETDHuxNvfNIadtU/8XYXJpzMurIDRBpY5S0HqR4c0IMzN66XzFysMtJ+uX+3ltJrNAe
         gUSTOhxD6dVRiBiyIgEzm3HMqDOrO8zWJIUH1chqnNgQD/dFzAKIfpzDD7Gk8dXepda2
         +SPbEKjrJ4zzj4pLok2P/MuhsSxCWOSu1vviehLYdxrfSbOYUOeUrmv3EP6kbcKlUgVH
         cc6A==
X-Forwarded-Encrypted: i=1; AJvYcCVwSmHNy3JMl7TToRMM7e0PE09ffRr3FO7k5tOA6mKsyeAJOACaq6Fd7yXEtXndwHocUWv1y8ebaiUkmdj2p4gjTCUxxgbKZww0xZnkW9+L
X-Gm-Message-State: AOJu0YyB2nPhtv587swUqDNJPO0WmvUA+qPyJ/VEUxzH/VmH2FEePE9b
	nNSCyCyCkE/p6ionJQ2JpFa5+nBdwy6ZPbDC0a5A+LdEzVRECZmyLmG4qPlEGgI=
X-Google-Smtp-Source: AGHT+IGsb8ENfNX24KV/2p65+AXz8vQLOyD7rr85mLmAbYrlFeyu4iUnAUdApssW9wQIA88K4faaUQ==
X-Received: by 2002:a17:902:e80c:b0:1f4:6f0b:9a4d with SMTP id d9443c01a7336-1f8625ce84amr47283645ad.10.1718417584825;
        Fri, 14 Jun 2024 19:13:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f13562sm39311445ad.212.2024.06.14.19.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 19:13:04 -0700 (PDT)
Message-ID: <666cf8b0.170a0220.eae89.c930@mx.google.com>
Date: Fri, 14 Jun 2024 19:13:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-20-gb57cd5703a16
X-Kernelci-Report-Type: build
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.10-rc1-20-gb57cd5703a16)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.10-rc1=
-20-gb57cd5703a16)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.10-rc1-20-gb57cd5703a16/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.10-rc1-20-gb57cd5703a16
Git Commit: b57cd5703a1618e87772094ac12c5ee7d6c35e2f
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
