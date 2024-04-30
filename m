Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B093EA83
	for <chrome-platform@lists.linux.dev>; Tue, 30 Apr 2024 07:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714463567; cv=none; b=JdsnwkbursURMI6jeWjqPSiV0vSCxDfl5swZwnGGduEmjCHNXCym6IjRkKG3oCCOyZ8u8stuz1F0W1r9hmsOjttCatpc0d6ndbQYjSEB/PyhqbrqZd5sPHbLw12+uEKoIae3f+rKV0TfKbl4TTqcDu1B1z2Hvgi85PCeJVSqZbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714463567; c=relaxed/simple;
	bh=eWztkUeRMHTj44etbRgKTJWlUdXVIcTinDtvmPAyQx0=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=SV9p7/uHwegStMXsvB/dK0V/rzis2xmZtSeSKMowWoCYbWm/n+ECQAGSeqpt/1fvTT2a/ogHDXN0+z3blSGJBtNVYdvAH6ed0ba40HH5XFGvCZlFcp/ZKTakqVHW0umGKtG3UaDPEXunLOlewexdN8k5aUWxuzQOVQPVASAgLNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=0b3mQlAP; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="0b3mQlAP"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e65a1370b7so49861685ad.3
        for <chrome-platform@lists.linux.dev>; Tue, 30 Apr 2024 00:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1714463565; x=1715068365; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GB5j/nTyoDvI+TT3g7H8iMnQ9jpRvfYYNS6VqLcx//c=;
        b=0b3mQlAPVLnEk0Xb8K0A8FVTLDyJ6fqcM4zgeFRifJ7VYF7smEzXL9BKBsrNJDeQ5u
         didVBOMcjaGbYesbeIsCA9B4PjLFWLFb/TMuiKIIqsYppMKWXOtVd/JhePazYKyixRF7
         Y8xKeD+2+czcRc79FGiSt+vz2jMRnmQsJt2VEJOH3VXm7OMIFhqS7JkdFovvPTNu5kiQ
         sF/dUzEXmXZ5v2PP0Ab6vleoMWW9prvJfE9njp+QdiM+JQyM3yKglnWowfRGmtT4JIbS
         MGmfhTNrzo26r60DFjk0ukbuahgGQeZhd8m6S56SVaFvTHgfPGpWAr+cIKyjDdwFsST8
         rH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714463565; x=1715068365;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GB5j/nTyoDvI+TT3g7H8iMnQ9jpRvfYYNS6VqLcx//c=;
        b=Tf3iq6RNX1w2ihWzFdSKSODar8/Qt4ckYuCbVoDMQmxGUFKQvJ3V1NF7G8bW21jWuD
         Kd5J3ZJ1J3xIg4884QJCd3m+JvrmY/TNG259q8oQfN4fFylvmuGbFSIeX4EmpQne9sk/
         Q6QwvGMAjzqEu9+E/V2Iebh9znpYCY51kVZx7SabSLdMQ7NEYRVe6JeQoyIPFAidWWsv
         l8lrVrQEe1chXDGihXz3xxeeldueL6QKeTw9b2YbuXaYK/16vnBrmf+W/meb8XLdzWga
         gtXPVhcBZdpA66HMYgYrkyBZ1/ln4erHCyAe7RrSLtD4pX4X6APkOz/AXS14ZolZ7JKj
         2UCw==
X-Forwarded-Encrypted: i=1; AJvYcCWOKiNmm7dAV7+bs5nXfAlG3fl4XTlYQSKjxbPb4fEoNAJV8Pb1xbnOaQgcwXKGb+IkjXZ+LvwO+SMQOcsh572qHfYkFlBJ81B9b9GV7o8m
X-Gm-Message-State: AOJu0YzmhEARCbJBrp2S/2yzueAkXt89oBB3K5jjmn4XQ7YYp81I22DI
	ZZ0mUhO2crX2IUtBms0MPlg6zF9NNLM1tEccHLa7uXmIVtqyDOwr46UjqA1pPn8=
X-Google-Smtp-Source: AGHT+IEsn5RyXH5/8ZUdY+5D82l+c2DoQ2bVSiREGcubyuTRXZhG1zxrkUC4i7DWcAE7QlX/ATkdnw==
X-Received: by 2002:a17:902:d345:b0:1e4:24cc:e025 with SMTP id l5-20020a170902d34500b001e424cce025mr15491171plk.59.1714463565572;
        Tue, 30 Apr 2024 00:52:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id x8-20020a170902a38800b001ec552ff7e0sm414277pla.269.2024.04.30.00.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 00:52:45 -0700 (PDT)
Message-ID: <6630a34d.170a0220.911d0.0acc@mx.google.com>
Date: Tue, 30 Apr 2024 00:52:45 -0700 (PDT)
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
Subject: chrome-platform/for-kernelci sleep: 6 runs,
 1 regressions (v6.9-rc4-22-g2fbe479c0024e)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 6 runs, 1 regressions (v6.9-rc4-22-g2fb=
e479c0024e)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.9-rc4-22-g2fbe479c0024e/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.9-rc4-22-g2fbe479c0024e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      2fbe479c0024e1c6b992184a799055e19932aa48 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/6630964c1cbf5850c34c43eb

  Results:     21 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc4-22-g2fbe479c0024e/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc4-22-g2fbe479c0024e/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm/20=
240313.0/arm64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/6630964c1cbf5850=
c34c4400
        failing since 36 days (last pass: v6.8-rc1, first fail: v6.9-rc1)

    2024-04-30T06:55:43.941917  rtcwake: assuming RTC uses UTC ...

    2024-04-30T06:55:43.947066  rtcwake: wakeup from "mem" using rtc0 at Tu=
e Apr 30 06:55:49 2024

    2024-04-30T06:55:43.956828  <6>[   17.688629] PM: suspend entry (deep)

    2024-04-30T06:55:43.961831  <6>[   17.693279] Filesystems sync: 0.000 s=
econds

    2024-04-30T06:55:43.967642  <6>[   17.698797] Freezing user space proce=
sses

    2024-04-30T06:55:44.364154  <6>[   18.092106] mwifiex_sdio mmc2:0001:1:=
 info: FW download over, size 717068 bytes

    2024-04-30T06:55:45.115188  <6>[   18.845415] mwifiex_sdio mmc2:0001:1:=
 WLAN FW is active

    2024-04-30T06:55:45.119778  <6>[   18.846085] btmrvl_sdio mmc2:0001:2: =
wake by bt

    2024-04-30T06:55:45.129832  <6>[   18.857415] Freezing user space proce=
sses completed (elapsed 1.167 seconds)

    2024-04-30T06:55:45.132497  <6>[   18.864898] OOM killer disabled.
 =

    ... (12 line(s) more)  =

 =20
