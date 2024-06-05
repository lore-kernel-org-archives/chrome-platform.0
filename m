Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F7518C33B
	for <chrome-platform@lists.linux.dev>; Wed,  5 Jun 2024 07:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717573256; cv=none; b=ZYAPOOFUp4wPT94h32PAoqsj6NN/fO/+JE/rjjLVJtUxEpPiN9Zik4L3hKWVsMERodZ4z/bXzFVOcsf9IG6jtQMqN+tKa67ATSF00M5yiyJizIE2VCqAdwTJV0AqhYjGgHk2/sIBQIugVxs6IaJFgAy6f1Yvr8Iq5X1qVU5t6do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717573256; c=relaxed/simple;
	bh=pbh7fKDZuza/arkifRov18WBlWiElXoODHiL/VeswvY=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=j6CNtxknJedEE5w7hJmGRd6BAGwbEApIHPDX0/suE2shfdo70xv/882e/5O9M9hwnU3iVa+1tUzOCSfM68nHVIm/petUNaeGjgdZ4UxLnpjCRyd5TMr+loSumw5V/gwpeyB2Q5G9Wv0ZKov687njdXSXII7eYlIehnhkWOFzDfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=jp+iFWNU; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="jp+iFWNU"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7024494f7daso4406942b3a.3
        for <chrome-platform@lists.linux.dev>; Wed, 05 Jun 2024 00:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717573254; x=1718178054; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IafV/QOQlglhG0rDWda1CPs5TmRLPq977iERnPwrfcE=;
        b=jp+iFWNUaSBXu2Xb1OlcGutgLwCj+BwU/7BBsW8Q7c8xUzf/1tym/ilt57GWz6LhlE
         Mq8H4IY3eBwzA6spd0lpiVfoMFxdb7oD2qiTz0co64NLRvixqZed5ieRIRMBhG7loSRP
         /B1LXkcIdg3z6KGVUAZuVJhjWLbD5OjpKjy21BerJRPRp5zt9IsMns/fz3vAhXjZLCdj
         VtfVFmmgoe37f4nXKMStYMUSjYwrQaMxDE+WFZmyqug5xlUQig3jBH/yaPM+QITaL1Y7
         0CHN4sApGnGHQt0HMs6u64LGQosoM8vJ4sIW2fS3wHAqyo1ywF43AGZnmMDY0kFqcqYD
         47tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717573254; x=1718178054;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IafV/QOQlglhG0rDWda1CPs5TmRLPq977iERnPwrfcE=;
        b=aasfVi2wlWimhV38SEYrx7hiupzNDY7friNxpr6WCvEVMVZ7REOOqO7GJ3VQheFH5i
         m/ADim87htRU/1oozNqWub5WBtnc3n4GvGrTeKz5lwElQ+OqLpanl6AUxy9pGPMGcCEa
         BvNzEHhz02zlZsia4tNDaFShdnATQU+RTwjtgF0ji5w9Iymk2pk+4g7CcDt1ihy70WKZ
         sxQXomTUxsW/V9idWMR5XAgK/+M2/+tjPLy36qeam4Mt/3U6qYzzxLTlO/c/M3icxn0i
         v3JFBRMyo3+e4EnlTcTwPDp33FKUItTsKnrB226hGpzwsN+4Wgb1biitbcqmoKdWHsKL
         Effg==
X-Forwarded-Encrypted: i=1; AJvYcCV8AAJAh5VI+Z76+UxXers7fq0NzEQwrhpzi2I0OwM4DKfI2ZbiyVZK4atVr/BDGK1NtC0svVLEGb0t0ZXmAbZ6c7YgGdO/eL831UOxzxta
X-Gm-Message-State: AOJu0YwhVhgvOWM01uBI5gV/z82fnoJ9wYiMs38WzRQ/85/cY5fgVPjx
	2S0IF4pKFw+vyAtjyd/1kg2eKEn0nbYMZhTP84aIdCiWydVs41amjknAUTFxoXY=
X-Google-Smtp-Source: AGHT+IFObBHB2zPHBAVSoJiDEXUjoTTFZjJWqTezfV+YwR/5FGgMXlzz3EDBwMBugGy42W7UOv2CDA==
X-Received: by 2002:a05:6a21:193:b0:1b2:b60a:a425 with SMTP id adf61e73a8af0-1b2b713c70bmr2198647637.46.1717573254585;
        Wed, 05 Jun 2024 00:40:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7025a955dd1sm5861784b3a.64.2024.06.05.00.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 00:40:54 -0700 (PDT)
Message-ID: <66601686.a70a0220.c2ae6.f1eb@mx.google.com>
Date: Wed, 05 Jun 2024 00:40:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-8-g106d673982336
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci sleep: 8 runs,
 2 regressions (v6.10-rc1-8-g106d673982336)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 8 runs, 2 regressions (v6.10-rc1-8-g106=
d673982336)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig+x=
86-board | 1          =

mt8173-elm-hana    | arm64  | lab-collabora | gcc-10   | defconfig+arm64-ch=
romebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-8-g106d673982336/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-8-g106d673982336
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      106d6739823369c734a8fc3b13634274eee4f60e =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig+x=
86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/66600a2af57d212d507e71eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-8-g106d673982336/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/sleep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-8-g106d673982336/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/sleep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/amd64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/66600a2af57d212d507e71ec
        new failure (last pass: v6.10-rc1-6-gbc3e45258096f) =

 =



platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
mt8173-elm-hana    | arm64  | lab-collabora | gcc-10   | defconfig+arm64-ch=
romebook | 1          =


  Details:     https://kernelci.org/test/plan/id/66600a43a7bd75455a7e727a

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-8-g106d673982336/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-8-g106d673982336/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/66600a43a7bd7545=
5a7e728f
        failing since 72 days (last pass: v6.8-rc1, first fail: v6.9-rc1) =

 =20
