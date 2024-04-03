Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4851E156251
	for <chrome-platform@lists.linux.dev>; Wed,  3 Apr 2024 22:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712184126; cv=none; b=hdGww6q5ylmUsXreQq//z+5D/4UV0tZhIzDXUetDM5X7MoHEwbUH4Gp91Bu4B5IiZYfLZ/IvmKW7kcZ9rUOcGxqEHQIA/DsS4hPOROuARI922V26r6TNeTIky43qlWF3VfCQo8Oq+hMn9bMX5JA4qz+c8d5ccn2y/U3gPNr+ykY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712184126; c=relaxed/simple;
	bh=iWhx1uUYZOvWYeH8DwevIBrPuIdLfBciH5E65JqgN2c=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=mKSxw9KCh27bs8PRVhxfKFRZsVNlZ3tAHpFRdy+dc0LLhwjcga0bnbifj97N3bhxHvcc30xZFcX8aHcLMhM0TMoF0yS7H6+NWrmks/bklP9WjQNBfIo3UoWQ0nph7ES1L+pPragp2OFpvpaRmKaFPLIDM7Xy6fjBntwqD+wcdxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=VPOszZSi; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="VPOszZSi"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1e28856ed7aso2685755ad.0
        for <chrome-platform@lists.linux.dev>; Wed, 03 Apr 2024 15:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712184123; x=1712788923; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iWhx1uUYZOvWYeH8DwevIBrPuIdLfBciH5E65JqgN2c=;
        b=VPOszZSi5crJj0RWVVNAFA3/Qgo+7jIGubNJXq9mjH6XwapY7zym2wvYTaZSy1CHgY
         2oncYO3lMsffJ6JauEP+jIjgqoGMLJRG547zB95+/adVfaKMhUWUY74ATI/Ht1qUzrwV
         0ePjosTEtFU063cqUZAry9xX45pYUM/LgAg8z1tQXsNO+t5HNVmdauxJXv32rh8JqT9g
         KDOKZCH5DQBDXUwGUFRGSNa2JYXd8IIhdvxYxYD6GM0RQkwvTgCA4QwGlTo7ibR6Uep6
         jTD8J9SekiqjFxcfts5NP4wK0KDsLSeLyKCDIld1PvPh9VtB5Rb8LLVVnZxOedsARZgv
         45gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712184123; x=1712788923;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iWhx1uUYZOvWYeH8DwevIBrPuIdLfBciH5E65JqgN2c=;
        b=KtEx+3WTjrAxhj1/GZFOqjwvsyQ6QAyMA73Sm33vasTbVRW6XMVYK+nC0zqk7n5oVW
         CPr7T9Nbh8+iWnmbLHG5sZCrUEWAI4Sgs0Rc50IGZvtnfRtQZ3cmBOGcbvtzUj4e7C9k
         IkNh2TDWlztaOuCxDW0K2LfnnE0mb4S5IDKX1YGO1Td3X0kihI5RsxxsfC/j7MBUHya7
         +a3Gc9yT+pLFemsZ0tmA/ZYRIe798n+tou1ZR6qhC4fFEbu7os+y+xfgatwiGFRE+Sp1
         lAtYKvJkP4ghLkHtQL+FkWQWiP7gP6bx2pWXtXh8uRB2lVSPCzAegElblVXVz/0eA4Oj
         hkow==
X-Forwarded-Encrypted: i=1; AJvYcCVnnGifuR+s6LZQCGVTBzJgmO4wUXZvGphEQqP9DHy+vjDXZMgN3fKInbfl4y07EunlttFrdaN6m2FCo4mlmK7x/HnsPC+8zDZb+WI2ubwQ
X-Gm-Message-State: AOJu0Yx02vqafugf+xKB4s/nZE+vXLu+mjwdlfX3L4r4fzSLLpjLh1Da
	TlTAohAHidphXXQ6kOeTGIrepfQsE9y9ul7NrGbeCsPF/fNXv7Uf32BTj9RnUlU=
X-Google-Smtp-Source: AGHT+IE5N9sR0E+FU5ZfHX7PB9XAkV9Xu4yPliFLBcUxaNj/fJcqTJq8IMQ/SgsuA2lHr0/OUqIvkQ==
X-Received: by 2002:a17:903:404b:b0:1e2:1df1:5ac0 with SMTP id n11-20020a170903404b00b001e21df15ac0mr469010pla.9.1712184123408;
        Wed, 03 Apr 2024 15:42:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id bf7-20020a170902b90700b001dd82855d47sm13859413plb.265.2024.04.03.15.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 15:42:02 -0700 (PDT)
Message-ID: <660ddb3a.170a0220.6aaf8.789f@mx.google.com>
Date: Wed, 03 Apr 2024 15:42:02 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc1-2-g7f20f21c22aa2
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-firmware-kernelci build: 4 builds: 0 failed,
 4 passed (v6.9-rc1-2-g7f20f21c22aa2)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-firmware-kernelci build: 4 builds: 0 failed, 4 passed (=
v6.9-rc1-2-g7f20f21c22aa2)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-f=
irmware-kernelci/kernel/v6.9-rc1-2-g7f20f21c22aa2/

Tree: chrome-platform
Branch: for-firmware-kernelci
Git Describe: v6.9-rc1-2-g7f20f21c22aa2
Git Commit: 7f20f21c22aa22e488530f66bf4fc168e427f5bd
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
