Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477BD20F0
	for <chrome-platform@lists.linux.dev>; Mon,  6 Mar 2023 08:08:36 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id u3-20020a17090a450300b00239db6d7d47so8082369pjg.4
        for <chrome-platform@lists.linux.dev>; Mon, 06 Mar 2023 00:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678090115;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9QISt8GUlHUg3PRoc5u8nR03jwzbOv96dH1w2RHSP5Q=;
        b=wev0PJMCC9mIA3R8dv9EEEoSSqtVMmcW0OGfxp78H+WcfD/uEAj0nZHSFisLw7n5e6
         KNCcPM5Z6VqNpBo1Yzch/YSgTk6yrrNHnGxcdyc6D9htycbr/Dzmu47vSZru+yabpnP+
         OwBnZFdHyHqfp+nL6XyJUJqBIXPHsa9kelV8EptXFX1TFrFALJrhfQIl7ozzd2UrLmZL
         VKuRwRKasYMBHl/TthSGMjbj4ygtGO3vjvvKQfcUaDSz83ysgul7lmWAfUvbdEfJaQjw
         A+1leRN6H48DhPDCvWUxdq3PvEmpyAXAKiaVSBS6xE0tAS8aQK3P+u5UDkHzFsjfyEWl
         kvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678090115;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9QISt8GUlHUg3PRoc5u8nR03jwzbOv96dH1w2RHSP5Q=;
        b=X9UDZe9sI4utD2KFIUUtOsGA6tPMmCZskjWnaRT4Mm/D2eAZ786AlQxEd5rhTcWUsK
         ehv8iH1vfA2N0u3y6oSbPzGpXh7X+pAi6FoYWNDQEVSW6w0RgM5xVxqfR+L9TCF4FYGf
         5Z0nwmiAOLejpe35YUpaJzSjcj5xPfEByb+uZZoVBR17+9Lu/J43m2JnKAOc/qEFjq+Y
         +dTlDgQbZY6Kzddqq1MKrd0HcajpKErTnhwhDQ2aNBxBkfhzWmUUJUmcfUGZQuRpzdJh
         jM0b+sA+n+OI6htCy6BAWH7ZhqmzrqWyyju0592DIfcoU+7dYmSjFcldF28PM3vPbTUw
         tPDg==
X-Gm-Message-State: AO0yUKXGiJvrjkCBZEaK6ngPL8ocoWxYT7Zj+iqh1O9IhVd7arGxLMqZ
	7uPMTGAUHuwAe1G+8e7GKKiajw==
X-Google-Smtp-Source: AK7set9yj2LncTlSFD70NpuhcIKs1wwUBTgizjafcvaDgh9b3c6zSvF9U0pxTA0PZEnsG3jEOl0FQA==
X-Received: by 2002:a17:902:f64f:b0:19e:bc8e:6421 with SMTP id m15-20020a170902f64f00b0019ebc8e6421mr3780276plg.47.1678090115652;
        Mon, 06 Mar 2023 00:08:35 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id kt16-20020a170903089000b0019a7385079esm5998787plb.123.2023.03.06.00.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 00:08:35 -0800 (PST)
Message-ID: <64059f83.170a0220.dc697.a534@mx.google.com>
Date: Mon, 06 Mar 2023 00:08:35 -0800 (PST)
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
X-Kernelci-Kernel: v6.3-rc1
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci sleep: 9 runs, 1 regressions (v6.3-rc1)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 9 runs, 1 regressions (v6.3-rc1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.3-rc1/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.3-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      fe15c26ee26efa11741a7b632e9f23b01aca4cc6 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/640594023c34f48cd08c86ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-tegra124-nyan-big=
.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-tegra124-nyan-big=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/armhf/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/640594023c34f48cd08c86af
        failing since 0 day (last pass: v6.2-rc1-35-g75a273974d7a, first fa=
il: v6.3-rc1-1-gad79d30ce40d) =

 =20
