Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E44D53C
	for <chrome-platform@lists.linux.dev>; Fri,  7 Jun 2024 12:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717761648; cv=none; b=VfEYIFxlURN9qHMacH7K7FEeLqVhds0wV9x2NKHRL6w/Rph7liC5eMrI2DuhrQANTUtPd/n8EXTCqBM+aiHvGqJUbQiOQ5Mbn91A6TSWiS732oRF6oM48DHTi/vkOn2AM7EGOW/uNJuP4cTpjFzunw+XaljHsLv8+QTu97patwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717761648; c=relaxed/simple;
	bh=Bw0PWaqhRKmWYZHyNLRAFWCfjkHevh45N3jfzCadCDk=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=ph2IKNDl+gMcLSLCXtPuoskHrlMiN2k8lJVTi2h3qaaTD2uXUDur1TatyCD9YrGJdO8pnz2AxuLyNTgI6wek6wbaNciMfznb1lOxOHRT6Nc94NA835ybouKl5IyBnI7Dwyqj7w8n/ATjnhxVT/+w/OF4Q4RVMsPrKrtPsTNEtdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=puF4v99M; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="puF4v99M"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7025cb09553so1866029b3a.3
        for <chrome-platform@lists.linux.dev>; Fri, 07 Jun 2024 05:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717761646; x=1718366446; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YS3F4BUNihgUVku6Ze53oPQ9Ju9wF6CJmZA2Xexanz4=;
        b=puF4v99M3q8UjpvGlAZsZieNqs6YnGrfMnfie0afOtOCSonGhEOvG+FneLs8tRsfaS
         vFcBhLZOF1A2GDoexTiGpACdB5dfXlznjSTPP5RYy9BycllUCheBYmotvd1TrSzZKMGl
         cr+8FIc5qzWPJooUYYSqIagaaMNyHe2rixQkJw8xQ2FETHoLhX6oG7UQ3UMqImCiIZ5p
         uOZdRG5xFLDrUHujVgZL1Ly1bF/E197Fv+ncufy1OLmDUiB//rbvQe/BDbCXPn+Vb93B
         x3n2KvFO94i0j3F8dkgp3M43+YsCYeZRK6plWld0K9rtO2MK3S9yMw7scbQmq2kEFjYy
         TKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717761646; x=1718366446;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YS3F4BUNihgUVku6Ze53oPQ9Ju9wF6CJmZA2Xexanz4=;
        b=pRg6oVkfsiOD4xgkmU6tpwU6IouSns6NfXcx76XO6v/b7BSCtgQRmMNlkkLg5rcmat
         VL+OKrgx9mpHs0ZDRwBmeYlkJqY64WMlqG1j8N6tplvEDcfVQ5IOcX7vIARuhkX+hnTE
         ev8Q6q6iIRuYut+eMGluGi4ScqD5PVtKFss0GuEbPqOgBQ+trpn0pKnu8PrACIxYg7mn
         Do2y1Ugs1ScjblMI/i3OomxTPvnP4T4auALf8+6x9XGUvwZVu5xRq0zKGRYueooIdo4/
         rzocIiE2I08zySVzPBEbQxa7nfrSx48MHf6bq/X4hFanBGcpJKkUA4HwCEllb+9ZrcqG
         quDA==
X-Forwarded-Encrypted: i=1; AJvYcCUvhl/A4RHLFgeZYmMhybyrP/EKtrxzU+BOdwft9lq4JVy7YySdATVLHdL+KMg/8bfmJU8ATcnGbwnHmyh+7vmfYOg60j+ICxSxyTZi5MAN
X-Gm-Message-State: AOJu0Yx58HQfELOD+EgcRT9UQFJBkA6hbrvV6590QkUAoJQkVpJr1vkd
	sxlmjsJYUWEIf2lbm7OyILXgAcZ9y8l37N5KvA5d3kL5DkP+nvGdZ86VUb1wFbc=
X-Google-Smtp-Source: AGHT+IEFylTbFAwg3Oz7BhuLEcXWHqW4Et6GyW34Om3OLjGWUkaVZ+E7C0k/u7Uk+RlO1DbsccN38A==
X-Received: by 2002:a05:6a20:7492:b0:1b2:6323:4143 with SMTP id adf61e73a8af0-1b2f9a80210mr2654504637.37.1717761646086;
        Fri, 07 Jun 2024 05:00:46 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6de212c16d6sm2478032a12.24.2024.06.07.05.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 05:00:45 -0700 (PDT)
Message-ID: <6662f66d.630a0220.24c33.6b67@mx.google.com>
Date: Fri, 07 Jun 2024 05:00:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-15-gc8a4bdca928de
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci sleep: 8 runs,
 2 regressions (v6.10-rc1-15-gc8a4bdca928de)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 8 runs, 2 regressions (v6.10-rc1-15-gc8=
a4bdca928de)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
mt8173-elm-hana  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =

rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-15-gc8a4bdca928de/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-15-gc8a4bdca928de
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      c8a4bdca928debacf49524d1b09dbf27e88e1f18 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
mt8173-elm-hana  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6662e88f61eecb91287e7168

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-15-gc8a4bdca928de/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/sleep-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-15-gc8a4bdca928de/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/sleep-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/6662e88f61eecb91=
287e717d
        failing since 74 days (last pass: v6.8-rc1, first fail: v6.9-rc1) =

 =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6662ea39182babca157e744c

  Results:     12 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-15-gc8a4bdca928de/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/sleep-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-15-gc8a4bdca928de/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/sleep-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-7: https://kernelci.org/test/case/id/6662ea39182babca=
157e7451
        new failure (last pass: v6.10-rc1-13-g04ca0a51f1e6)

    2024-06-07T11:05:16.779739  rtcwake: assuming RTC uses UTC ...

    2024-06-07T11:05:16.786659  rtcwake: wakeup from "mem" using rtc0 at Fr=
i Jun  7 11:04:23 2024

    2024-06-07T11:05:16.799686  <6>[   37.327867] PM: suspend entry (deep)

    2024-06-07T11:05:16.816558  <6>[   37.344547] Filesystems sync: 0.000 s=
econds

    2024-06-07T11:05:16.827393  <6>[   37.355216] Freezing user space proce=
sses

    2024-06-07T11:05:16.841835  <6>[   37.366418] Freezing user space proce=
sses completed (elapsed 0.001 seconds)

    2024-06-07T11:05:16.851085  <6>[   37.379653] OOM killer disabled.

    2024-06-07T11:05:16.862691  <6>[   37.390095] Freezing remaining freeza=
ble tasks

    2024-06-07T11:05:16.878935  <6>[   37.402990] Freezing remaining freeza=
ble tasks completed (elapsed 0.000 seconds)

    2024-06-07T11:05:16.889750  <6>[   37.414205] printk: Suspending consol=
e(s) (use no_console_suspend to debug)
 =

    ... (13 line(s) more)  =

 =20
