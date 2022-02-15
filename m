Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6729C1844
	for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 22:58:19 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id a11-20020a17090a740b00b001b8b506c42fso4719647pjg.0
        for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 14:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=MkypjUo+nbMMfcxFi0E3BKUltZPIAlbhyUldCE4pPH8=;
        b=XC5QK0yCbdg1WZwQgN4eK+HrA8Xdik85FhGe61Q2ca7+Hl/kPLT6UHmmoD9CPVuWSd
         IsGnsxYxrgyfeTBP8XurlaLfJ2D61Pl946PFD/41UW3EBgCAAALa6gXV1DzjTJ60eIs/
         tXnFyGvaVLhuYch6cZ5vkSHhhsMPbHC7w8umiMT8ioZzb1WPNGci5seJ2nun0NGnIenp
         YX7YdEKlLukrBrDcZHojBLXWaWstGUGJzSNA5vF7w9jZmqDU7LSDKuTlZdKfTXE/cUzv
         0seVjVHucPVWuOx1ZOvFdjz4I7+WfMqtZLTBtyJXXFH7UgSOkQag54+wOPtSQRX33OBC
         sKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=MkypjUo+nbMMfcxFi0E3BKUltZPIAlbhyUldCE4pPH8=;
        b=xJzMYlePhjjQlw5pBQDoTyProuXzm2pSIgiyNK0ZnXiUEhQq3eQtB/CSrL+vGDmUvu
         3Lyr2f1DFfVS24G3HP4XYrXGuQSvM3YbHzQkY/tk/aLUrFR4E+NQj0s9uGYEEMje8tvt
         vF7DTVSVXvT3e5Y23tLJ+zyQ8XvAqqj3VV4ojpJcApmFMi0R5hfx4KQhSG+fEIG1O8gJ
         LNxjObkq+0DhiwUbs5Qagxj7mLWloyuF2az5uDjZVY9ghHjIMC34LnctaKlKbt0xc/WD
         RWXXzrxMdypnc+gOPZTBnNSVtn3KwKRhpiOH7qkOZokinWkjXkfD6uLGRPfXNqnlJc2o
         nzKg==
X-Gm-Message-State: AOAM531JuctKKMyWg+N5HBZzyxzNzJsqAm4sPU4X7j7HHHITJziaASR0
	Zyo7Qb4ZaJJuSzF9WStCJNpr2g==
X-Google-Smtp-Source: ABdhPJwxYN0CSr/DHlHNW4JLunenEvOOGyohMGHprw5yj+eMpE/vbQCjUW+gpnv1aOOBQTPNf571Pw==
X-Received: by 2002:a17:90a:6902:b0:1b8:9249:d486 with SMTP id r2-20020a17090a690200b001b89249d486mr7021492pjj.76.1644965898901;
        Tue, 15 Feb 2022 14:58:18 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j18sm43658039pfj.13.2022.02.15.14.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 14:58:18 -0800 (PST)
Message-ID: <620c300a.1c69fb81.8d64d.b89c@mx.google.com>
Date: Tue, 15 Feb 2022 14:58:18 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Kernel: v5.17-rc1-8-g981d3de32cfb
Subject: chrome-platform/for-kernelci sleep: 7 runs,
 1 regressions (v5.17-rc1-8-g981d3de32cfb)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 7 runs, 1 regressions (v5.17-rc1-8-g981=
d3de32cfb)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.17-rc1-8-g981d3de32cfb/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.17-rc1-8-g981d3de32cfb
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      981d3de32cfb74afd48d44805b8f5943a1723aa0 =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/620c20e6a59bf7860ac62985

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/sleep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.17-rc1-8-g981d3de32cfb/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/sleep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220204.0/amd64/rootfs.cpio.gz =



  * sleep.rtcwake-freeze-2: https://kernelci.org/test/case/id/620c20e6a59bf=
7860ac6298f
        new failure (last pass: v5.17-rc1-4-g5c223bb92642)

    2022-02-15T21:52:26.548061  <6>[   34.072441] r8152 2-4:1.0 eth0: carri=
er on
    2022-02-15T21:52:26.551777  rtcwake: assuming RTC uses UTC ...
    2022-02-15T21:52:26.554735  rtcwake: wakeup from \"freeze\" using rtc0 =
at Tue Feb 15 21:52:32 2022
    2022-02-15T21:52:26.561516  <6>[   34.080269] PM: suspend entry (deep)
    2022-02-15T21:52:26.564602  <6>[   34.094053] Filesystems sync: 0.000 s=
econds
    2022-02-15T21:52:26.574302  <6>[   34.098694] Freezing user space proce=
sses ... (elapsed 0.001 seconds) done.
    2022-02-15T21:52:26.577533  <6>[   34.107429] OOM killer disabled.
    2022-02-15T21:52:27.554041  <6>[   34.110918] Freezing remaining freeza=
ble tasks ... (elapsed 1.013 seconds) done.
    2022-02-15T21:52:27.560836  <6>[   35.087741] printk: Suspending consol=
e(s) (use no_console_suspend to debug)
    2022-02-15T21:52:27.662521   =

    ... (1143 line(s) more)  =

 =20
