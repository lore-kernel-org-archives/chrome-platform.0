Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105FB33FE
	for <chrome-platform@lists.linux.dev>; Mon,  1 Jul 2024 06:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719813940; cv=none; b=Lvs3K2tu+icLzANKIlFxo/ziO74DJ4dyKmfQo3aq9uBqNDiUbBprB+6KqBW4w8JhcKWunnph9T8PU0owq7thvTR/0aQbfH634HFqEh9JPqj+a+NPC2FjoQqUxfYtN8vumhKRt63SSwQ7CvH5bwET44dWFUg6uZnkXf/PZtmY4n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719813940; c=relaxed/simple;
	bh=QgkL0lWuSQvOwCI1FUWic1fotvcpzB1OnNem3qg16N8=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Y+BBnY+DOHEM2zsiur/+TmMR+Q1stqKZv408G9sEBQRf4w0WLGGDOUM1r8XZhTQLXhwzpFwphhrh9v0iYDV1ZAAHBTN8rC15NdA0gU8TcZa47lm7qgancWj74QauDo9KuRrfswB2b7laLv4WBVoUXeGY0CF08fy7uovWCMmOWu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=GA0OPree; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="GA0OPree"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-25cc6962c24so1155543fac.3
        for <chrome-platform@lists.linux.dev>; Sun, 30 Jun 2024 23:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719813938; x=1720418738; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ygIEDnSzA3cyh/wahU+MDJ938ye6KS0JTwHqwMawAXs=;
        b=GA0OPreeOzpxNLPpghkvz43xQvb3UOyWPr0Mw83EbwsvYhccpPd/98GqJb3Qb0L8bq
         wV226QhT4Yls+FNbMZyqzvYpnRngQRbKU9IQqBIL94/NNisx8AyMl3UeaMDNHcFJKgSH
         s86znZ/UvJRIhqKmRQjRl5hv3eBGeLb6UjU3AwzK8rgH6k1TTvIFZUlyu9Wf8MQDGXdq
         +yBzLYEDaCGEBYIQ+6KFEtzH8nM8Z2LFnfcnzUCExk6/0hKuhU8poQphq+ABf7r01KcS
         9Af3OmXa9+8qUxFj7TpOwYhLHk9EYP+lFiWNQOt3ixm3Kg/utmtpBdXxYOAGAZp1NAgx
         kGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719813938; x=1720418738;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ygIEDnSzA3cyh/wahU+MDJ938ye6KS0JTwHqwMawAXs=;
        b=DbJLqOFwfS+6pKocPC3BVmysbvNn247DvBEwohMD5P6xslbqFIlhy88f4HEpLasIPu
         dnm8Twrh8KOahiIFp1ZKf5NPTMQ/y7h6aCRokPL6Spmcylqu6llNB5CI1cwNN9mFS/LZ
         UcDzcZsY4axqU+ISAJifa/BKdVTvfPwMahFCiR5HuM8ONFxXhAUZB1Knq7RGQb5BQI9R
         cwjUeFj5EfJ5tQr5DczdrL9EdbBYLAQUZ3z5Ao15Obs8kCBIs/Wpb2pBK51YfzhaKaDB
         nTlu+ovxoT/SMGQVTJs8yVDMHuG+uGZmcfzeY3NQD7dK4G1KwDvvGesEgHUNtkZtZnTk
         dhfw==
X-Forwarded-Encrypted: i=1; AJvYcCUyoO4fWAoqlM3EfTytChFeDRqmhyupjiXz6MhGtVP9Toej10F+TOhppjBzk6dl3JMg46yi60itsENxqIcf8JPhqS4T4ak6a1NGMLDxH5Sa
X-Gm-Message-State: AOJu0YyqggmcpEXns5ssXHu4aqj002TbrdWzfDZ2kUVED1C5oxyFX1bI
	3yJGCCdb57zAxvp1pBpr9Cw6R6kbYVG952sfDTGyoECImD5Pm4ydT/IAqxCHWxs=
X-Google-Smtp-Source: AGHT+IH5F7swJbeFlxbaR6bW/s1F2SgnOwr/drOyhY8U4SMA53Gf4Xs3T9d+kmFf2QR1qqE9/Mf+yQ==
X-Received: by 2002:a05:6870:89a5:b0:25c:9a02:cb64 with SMTP id 586e51a60fabf-25db350b592mr2656839fac.16.1719813938028;
        Sun, 30 Jun 2024 23:05:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803ecfbe9sm5636730b3a.114.2024.06.30.23.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 23:05:37 -0700 (PDT)
Message-ID: <66824731.050a0220.19c00.ffa8@mx.google.com>
Date: Sun, 30 Jun 2024 23:05:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-21-g5b8feca8dee44
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci sleep: 3 runs,
 1 regressions (v6.10-rc1-21-g5b8feca8dee44)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 3 runs, 1 regressions (v6.10-rc1-21-g5b=
8feca8dee44)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-21-g5b8feca8dee44/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-21-g5b8feca8dee44
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      5b8feca8dee443055049c8ccfdd97f64a0e1d2b4 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/668239ab9cf44866067e7186

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-21-g5b8feca8dee44/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/sleep-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-21-g5b8feca8dee44/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/sleep-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/668239ab9cf44866=
067e719b
        failing since 98 days (last pass: v6.8-rc1, first fail: v6.9-rc1)

    2024-07-01T05:05:56.096538  rtcwake: assuming RTC uses UTC ...

    2024-07-01T05:05:56.102977  rtcwake: wakeup from "mem" using rtc0 at Mo=
n Jul  1 05:05:56 2024

    2024-07-01T05:05:56.110758  <6>[   18.082079] mwifiex_sdio mmc2:0001:1:=
 info: FW download over, size 717068 bytes

    2024-07-01T05:05:56.114229  <6>[   18.089701] PM: suspend entry (deep)

    2024-07-01T05:05:56.119375  <6>[   18.094043] Filesystems sync: 0.000 s=
econds

    2024-07-01T05:05:56.123762  <6>[   18.099008] Freezing user space proce=
sses

    2024-07-01T05:05:56.868582  <6>[   18.842188] mwifiex_sdio mmc2:0001:1:=
 WLAN FW is active

    2024-07-01T05:05:56.874122  <6>[   18.848776] btmrvl_sdio mmc2:0001:2: =
wake by bt

    2024-07-01T05:05:56.886289  <3>[   18.855219] Freezing user space proce=
sses aborted after 0.751 seconds (1 tasks refusing to freeze, wq_busy=3D0):

    2024-07-01T05:05:56.890904  <6>[   18.866250] OOM killer enabled.
 =

    ... (4 line(s) more)  =

 =20
