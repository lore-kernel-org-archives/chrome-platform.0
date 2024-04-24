Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A3315A489
	for <chrome-platform@lists.linux.dev>; Wed, 24 Apr 2024 11:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713956493; cv=none; b=nIx+IOi7xPPtcQPyajDLD7WXtzQuN59w7hrCgyIk0SRtKe/84zZ4iX7fdepF3OrFpFZyyNCRjMu07IfwQ1ZXgAjS/kBCD7yDw25CcvPhUGkoQkuS/HN0VfY6LMAwVe7yg7yBeN5qVVduZPTqtWQn/8q4iOV9jgRk7pj4e2C6avc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713956493; c=relaxed/simple;
	bh=xA0SlX415TKuHCVwiI4JnaGdf0eAiGuelXMrgCRQ39g=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=hfznxPS+fNkdXPDNdXRyXyLMC/IEebt6qbKgTR92wZsfEp5K0u2nfH9iPxWjkOO5RoGZmzaIqwcXwBQjOPWYeoDdy2Aknlin0Gl/QIT+QjEQtbEwfkz0nc7G1G2sgvKg31dvfuIvXc5CYGr8qE1ZD+O4VljxYcqW6njKJ1uoxVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=cNS6jAps; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="cNS6jAps"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e51398cc4eso59226445ad.2
        for <chrome-platform@lists.linux.dev>; Wed, 24 Apr 2024 04:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1713956489; x=1714561289; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xA0SlX415TKuHCVwiI4JnaGdf0eAiGuelXMrgCRQ39g=;
        b=cNS6jApsbENxsV4cQk8eI4o27NkLMeVP3Qe5hbvC976aiXhjLTIAIYrKN/D52eS2Gj
         JGiGeNHkOwA08pFgNVT78K4nCE17HiLAgKeRlzTRhhIFHyTBXR7DlDme71vIaY+zYnD2
         r1stkEJyMhpaiZFLFN/IKR4+ZWZe3dGUda6p9o1gyrKN+LlfRauXYAKdU5kyxhef9/f5
         dd7s9MFp5bA80uLp/YTgRnkdddKnaC+Yk5FAJrAlsC/PFWe5OXcSp/8brKdfJxnDyIWI
         rk9D2UMcvD1fU0s7btTGcuAxneUwwEGvAotEQ1TCoYOUcW1yXUvh42fRvhLV9i/EyoyO
         GOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713956489; x=1714561289;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xA0SlX415TKuHCVwiI4JnaGdf0eAiGuelXMrgCRQ39g=;
        b=s11+ey2QBTd26eJkZF1xmEN+sJhGsYDF9MRVp0Y5ZqlmFdI7hX8zYh7PbgG90DoG+m
         UtsbnbweAgaQf/hy7iaqKj87RmiSiDFm1pOdI8REQNsbC0FUooEtZED8KASC+QH/UtRA
         2mKpPivFDqCMlXZsxRn/bgiU3KiwFEVV6tkgqlxkykLArutAvsuOqxAe0dmoLL1l+A6u
         yk/L4w2v12TfZf7EQAUYfLlFzsRKezDjQi30N5GH+gzj/C+TPdCYdMoVPmL++Cisz1Mx
         0Qkd8++ms0no6d5OV12kzAN8EzP0lD5RmygFJ9/JGtO3lCxA4ot54iICnknlGkLiwDKU
         B1DQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrcmXMKhKlwcBam5V1mGtLBxL273bdfFMyMVAG9yrhs5H8ZrolQ5YxkXp8KGJ8JbPRrx8f4MjjR4EKsf49MwWmhVVyecF4nnYVtfdFPT2w
X-Gm-Message-State: AOJu0Yw2Cd9aZ6yqHY1G847nYPXVDzf91G6R8H31sf4dnDBhFpkoeYn/
	vqQmJt5OpxOZ0Mtb4S7rtqfKc/lu3xBbtjJzcOXKz1fq/6ApetIkrnuVYQCV204=
X-Google-Smtp-Source: AGHT+IGxk2pGK8NyTHcc8lgp2UO8ojOv/fnYY58+9OSA7Lu4l3v/9EuwcMMaQNpZmZLFript5QiGuA==
X-Received: by 2002:a17:903:245:b0:1dc:7bc:d025 with SMTP id j5-20020a170903024500b001dc07bcd025mr2990309plh.4.1713956488592;
        Wed, 24 Apr 2024 04:01:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ju6-20020a170903428600b001e2b36d0c8esm11681730plb.7.2024.04.24.04.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 04:01:27 -0700 (PDT)
Message-ID: <6628e687.170a0220.9cd8d.7b50@mx.google.com>
Date: Wed, 24 Apr 2024 04:01:27 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc4-21-gc8f460d991df
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 4 builds: 0 failed,
 4 passed (v6.9-rc4-21-gc8f460d991df)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 4 builds: 0 failed, 4 passed (v6.9-rc4-=
21-gc8f460d991df)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.9-rc4-21-gc8f460d991df/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.9-rc4-21-gc8f460d991df
Git Commit: c8f460d991df93d87de01a96b783cad5a2da9616
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
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

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
