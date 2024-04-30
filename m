Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4203122067
	for <chrome-platform@lists.linux.dev>; Tue, 30 Apr 2024 07:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714462667; cv=none; b=bw70AgjsOOHimct8uGcqZ8eTPsoflvAVyHavlOkmw5RbWJGvMSh16nK21laQVM2PUfvYNk9AWcUnq6cFMVazclgK45i8wMVITbKEjMcYNBXsrc+26cIE5/XI6EKB01HNlnp/Er1+3CFOOm8qpPcsZlj4y7LD6cBQaWK9QIFJX8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714462667; c=relaxed/simple;
	bh=4UVmp/GS8W6mO49N7MTcUDxIDD43K/MUspAXydOO29c=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=C+3OA21qFAPRKam5wWcWQ+/l/F38t553Ab3rxksBZ/7gsCD4KpwXfAeD1+cIDshtl7plxwPXW0snm21sdXEcBvi3PsJsOYuj144BVgudIQp3yN+UmDRJCK9/X/HlsHQaMh6vOUP9sNX3kcQ0UyWbrZ4xajlkc16GBXWIYw+Bd4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=wXfyzQdv; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="wXfyzQdv"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5ad21f3e5dcso3795955eaf.3
        for <chrome-platform@lists.linux.dev>; Tue, 30 Apr 2024 00:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1714462665; x=1715067465; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ntvdD0XoqmUp+tvpWyEYEp1adivSz1v24HI2priA1VY=;
        b=wXfyzQdvp/GlaGgjjB+d/al4m9w6DaESFubk1NZOAfJtcOIBY8Hzjp5kiJWFs2UzQ5
         1cuzgYzUhQQaaWaGNQWUbOw12Rqw2yDxvMbpUE3uFKpUGWJbozwBUwNVUUQOwA2JUuxm
         q+PqHVyCNEXFeHnAfd75DmNxjDLVrMfv7nzeYylsKqnru2xIfJWjBdcDEQl0v+pXrPwR
         cwrj1xLUabM8sEH5gxvWeXNeeqHqNTyyLDseUyHuL+jno4jRhTNqnCbQOTSpw7BeSG5W
         UMoG0sHR8HUH5LV5PugtjD5WXs0LGnGOzPdQvWk0Nu1F6Rfxs9yy9pX81FDxXfEss5nx
         YPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714462665; x=1715067465;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ntvdD0XoqmUp+tvpWyEYEp1adivSz1v24HI2priA1VY=;
        b=VKfp2T7yO6H+Tw2VX5Ry/mClEMhVlmcMIuIBLJGtVv23ifyojax42SmpQmMUWSnef6
         +dToSXIrxcHRVDnpSznJygfO8iAVWU8BEk+IOs4i2MhYNravpJWYuFwsHR0MayJEReiz
         Z8ucVjTjrvQcwA3YpoiUomZWkiQJCtTdkaJtPH9a52/BSgzWiJFGq/4Th6XdK5i+so+V
         JdMt6XMeKcK/5OWUA1Q9jX5PJSVUAf9Ejq81uPmStClgmEO18Cq0p25bk1m22rIvgXFU
         ru70WwkV9Sx7IK4zNI6n0ZqacoCkRcMFj7ZiixSNSRkqm9FrusqEJBaJd22KVIx6Ril4
         wbrA==
X-Forwarded-Encrypted: i=1; AJvYcCVfzO+mC+kaarK1kpzK/wajph6Vts55wF5t3GnvoZEYMc1bQSMKgmWiRdh8pjjUJ4mJERuQkVy28GcCqTzupeKCPqs/GDfkfHiqf+iaO48+
X-Gm-Message-State: AOJu0YyUBDq4R0gSBhQBEnfr7bmmMQNJ7S2wwEPH+WMndfKj8FbXLT8t
	BKNE0vwVmN5zdehOlr146M28CVa5viU9QegkhKl8W7SQDLfU3Te8+VruFomB3g8=
X-Google-Smtp-Source: AGHT+IGPfg2gcIDzXwhA9Gg503Ts0s6RwqX8qdXmDY3cDxB5/Od/3ZTaZ0PbBO6isllwZIUQi1e+Rg==
X-Received: by 2002:a05:6358:3399:b0:186:1ea9:3072 with SMTP id i25-20020a056358339900b001861ea93072mr10278600rwd.15.1714462665061;
        Tue, 30 Apr 2024 00:37:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id u9-20020a637909000000b006047eb9c7fcsm11397854pgc.34.2024.04.30.00.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 00:37:44 -0700 (PDT)
Message-ID: <66309fc8.630a0220.8b2d5.c3cd@mx.google.com>
Date: Tue, 30 Apr 2024 00:37:44 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc4-22-g2fbe479c0024e
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 91 runs,
 2 regressions (v6.9-rc4-22-g2fbe479c0024e)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 91 runs, 2 regressions (v6.9-rc4-22-=
g2fbe479c0024e)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
mt8192-asurada-spherion-r0 | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook | 1          =

mt8195-cherry-tomato-r2    | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.9-rc4-22-g2fbe479c0024e/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.9-rc4-22-g2fbe479c0024e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      2fbe479c0024e1c6b992184a799055e19932aa48 =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
mt8192-asurada-spherion-r0 | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6630961b086f1875c24c45c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc4-22-g2fbe479c0024e/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc4-22-g2fbe479c0024e/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6630961b086f1875c24c4=
5c3
        new failure (last pass: v6.9-rc4-21-gc8f460d991df) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
mt8195-cherry-tomato-r2    | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/66309607086f1875c24c4442

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc4-22-g2fbe479c0024e/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-mt8195-cherry-tomato-r2.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc4-22-g2fbe479c0024e/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-mt8195-cherry-tomato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66309607086f1875c24c4=
443
        new failure (last pass: v6.9-rc4-21-gc8f460d991df) =

 =20
