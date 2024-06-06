Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFBB1BDD5
	for <chrome-platform@lists.linux.dev>; Thu,  6 Jun 2024 07:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717657349; cv=none; b=ugCAMCWpG6G3/KwwOdYC1YbhqfRNx+0Tk/1rS0xCczymOY1JZjhg6lO49eeriB2lda+xP2EhgS+TZakwab0EIOLnq2X49XIHxYsbGRKKFKLAm+9sHZfB2LIt8nr2RPYvmVtCm1N0zUYGeFAULo2mgOHjf2zsUPzFbOaIpBwJcao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717657349; c=relaxed/simple;
	bh=0MjgWD/M8NDUAeEHNFjnxm87quEsGT53QvAWJJqpO/U=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=igSiTbBFOtzr2n9iaG8blgEo3kUNnPPL+4GQIVt/spnCgXb7zKph7ucDm3lOpfxCGJ+XFIqltRCgqPwvNck44PHMrZdreLnD3V22YyVy4p+cuQyqaMJX9HQgV7/jbp6XvmqYzfUTpnVjHsUZnSz/1uRExm39FVnP+MEdqBUJN3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=G0gYlkEX; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="G0gYlkEX"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f6b941844dso5091385ad.2
        for <chrome-platform@lists.linux.dev>; Thu, 06 Jun 2024 00:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717657347; x=1718262147; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=96cJduHFuweHYXfT7PZ2BbniiKBBBdPayX9Rlpo33nQ=;
        b=G0gYlkEX5/r+XquGCfp6K2YqHaDeKN2uvFeJuZVe0Dj9hokGlKTjPWFRS1lcOeAML/
         248mTqttoIlyDOVxNjpYRSH7fVaw51ERs7pUl87nc0tHuKC17h5AZNoAC8Jj4VqO0r++
         ofl3uLdKJoa39tnBg0puZyKoKiCSt9a49eckTDTkLlkimWe5VcmWEU3A+CsYgXV6G4xH
         kvs4fwN5Uc0OmYlb6uMlf5QXEmKj4x9M1wSBvlkGEzG9K2wLX8cOKdZZqOkTfgjZs5Na
         787NNzz2krBpe1u0CJmXv6z1SWbnPKiZLgbkFlfTkq3t7cz3zvxUBKO+Y8OIsMmUVrLy
         KN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717657347; x=1718262147;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=96cJduHFuweHYXfT7PZ2BbniiKBBBdPayX9Rlpo33nQ=;
        b=MtnITMMZoN+8tgeJyxcu8g6iZQgkxXtLqeWUP67SZxsZsUa3toZmZzSHlMdKX1Of6m
         jlOPY4n8IZHrJgl12qvAiCAIRP2EJqSNKCtAzYYPTC8GXDaCyB3y/FBZQZrblsc1YXvz
         9CkvYiMoCOkQE42pP/uj71jCmBCyr9RRxfpO90B6yS6GtQRzbDZfdfIi08bRX70yB+Z6
         CMa0D23B1R8B8Hg4IpseHUvOIa5hGvIuJ6IZTgZzUtoMWF+8oGoZBmO0u+LhyOCyZhYl
         BUfKsEaWHPhx6LjXIHiWAglzZtUn4302REuw64nvh0SB0JWVrsZTJk25AUCR8VCGUtI1
         LmVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuxtTfUhLYMGMcOPjMc9IwslABkrn7fpAQ2sGKy6nfLbsu+eASztXtrpmZ4v4LSlpB0cAp/w+czvskG0L8GMR2S6TsRVVX+bKnjALHwRUZ
X-Gm-Message-State: AOJu0YwDVy9+sDPHf8vXSzqQYN6AeYqWdXb2kkFIYERmTQ1EMg90VEGx
	0UTTQDYYkVzQm72XGkb0SmCgtFIzkIOBfj6ZI/hrCttUkTjUOpNQtbaVm3T63xk=
X-Google-Smtp-Source: AGHT+IETizFo29JllG/HPeo6Mds89+LgdoedtODunkXD9Id0XUp1PKnP96hschNKos0UEsK7BFA+MA==
X-Received: by 2002:a17:902:e892:b0:1f3:b9d:87e6 with SMTP id d9443c01a7336-1f6a5a052a4mr57787955ad.8.1717657347513;
        Thu, 06 Jun 2024 00:02:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd80dc3csm6899335ad.292.2024.06.06.00.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 00:02:27 -0700 (PDT)
Message-ID: <66615f03.170a0220.352016.19eb@mx.google.com>
Date: Thu, 06 Jun 2024 00:02:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-13-g04ca0a51f1e6
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci sleep: 8 runs,
 1 regressions (v6.10-rc1-13-g04ca0a51f1e6)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 8 runs, 1 regressions (v6.10-rc1-13-g04=
ca0a51f1e6)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-13-g04ca0a51f1e6/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-13-g04ca0a51f1e6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      04ca0a51f1e63bd553fd4af8e9af0fe094fa4f0a =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/66614fe2bf25c11c8f7e707a

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-13-g04ca0a51f1e6/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-13-g04ca0a51f1e6/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/66614fe2bf25c11c=
8f7e708f
        failing since 73 days (last pass: v6.8-rc1, first fail: v6.9-rc1) =

 =20
