Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5063B17D3
	for <chrome-platform@lists.linux.dev>; Tue,  5 Apr 2022 11:46:58 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id ch16-20020a17090af41000b001ca867ef52bso1998290pjb.0
        for <chrome-platform@lists.linux.dev>; Tue, 05 Apr 2022 04:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=eQVTnASMrdCvyK+s8XdaYUvMVTO9mC5L/MWzjUKN2QQ=;
        b=w1V2AMzSD8wbJpJoAuZQw9/C2RDVe9C4VEoFi/VSBKr995O1s+htR32uB74d5Z6Bk8
         d/QSA9XIg43kbF8x7rKKodKKhpAu/rF7rtzWb5ubmKu7EDIjWc2/RSwZb9KU6w2x7DJC
         kh91wuOICET+AOITABwZTHlIHV5zAkMg6nyLuMCanUoUTOCgX4B0mIEMS8+s9NsRziju
         OMGUSRKqj76SoCTo/ZEtbK6AYa/bwV/urXHOqic/6DCWZCNryXhxit+YkrH4bbQPShEi
         6oNu/8IX6mdJflj7xXq+3kYyRy0tbU1YAzGdJQ+BUsV5TfWK8iPz7kP90DiLr0iIwlHL
         Ou+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=eQVTnASMrdCvyK+s8XdaYUvMVTO9mC5L/MWzjUKN2QQ=;
        b=6zKWDtCimp/38bJ+Ii0A/PgEtvzUQjduq2LfP8ELPxZ7OACTA9KBWxcaFOHu+k29+J
         U3Y+q7ybxO+JLLahEjiTE1em5qX0pY/NaLZcZQyFsZs0vPo/E+UAgDjXdPoX13ivDxtE
         WOAxHqYJ/p61jECl+G9a4/ucSZZw+Ok9efkGa/a887ouMVEiGXUwvE/zoScpGwdBxfpE
         t2GPO43asRRYyPUwlqNqX066GKRxo71vaLmDXysoI4MDvWtoEvl5BPIsAcG3hbUhDrlc
         TOUtdiRrLIa1rUxzVOEI5M9KIe50qSIIb1XUloul1Jpqt9pqh6bpoyqtI8VTbuHKfymr
         OTig==
X-Gm-Message-State: AOAM533TkyhojNFcEOQRPyQDGyEBSaAL+hr369Gave6VrNZolDHvG99h
	CFJrSDivPUggaR9LTgjIGgL2mg==
X-Google-Smtp-Source: ABdhPJw1HKIrQyM/Kz2Gk7Vsd6q9ZxqNDvE9ChuA/mbUKH+5X2vYutaE9nULw8i9o8M1TcIiSwkfxA==
X-Received: by 2002:a17:902:7618:b0:156:509b:68df with SMTP id k24-20020a170902761800b00156509b68dfmr3026188pll.1.1649159217605;
        Tue, 05 Apr 2022 04:46:57 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id oa16-20020a17090b1bd000b001c72b632222sm2368005pjb.32.2022.04.05.04.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 04:46:57 -0700 (PDT)
Message-ID: <624c2c31.1c69fb81.193b9.5ba6@mx.google.com>
Date: Tue, 05 Apr 2022 04:46:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Kernel: v5.18-rc1-1-gbf84b10d9901d
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci sleep: 5 runs,
 1 regressions (v5.18-rc1-1-gbf84b10d9901d)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 5 runs, 1 regressions (v5.18-rc1-1-gbf8=
4b10d9901d)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.18-rc1-1-gbf84b10d9901d/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.18-rc1-1-gbf84b10d9901d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      bf84b10d9901ded51d33411499079ce64e0c4ae7 =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/624c23739559470fc1ae06e2

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.18-rc1-1-gbf84b10d9901d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab=
-collabora/sleep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.18-rc1-1-gbf84b10d9901d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab=
-collabora/sleep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220401.0/amd64/rootfs.cpio.gz =



  * sleep.rtcwake-freeze-2: https://kernelci.org/test/case/id/624c237395594=
70fc1ae06ec
        new failure (last pass: v5.17-rc1-10-g0ef49b25b7cc)

    2022-04-05T11:08:23.018609  <6>[   34.885877] PM: suspend entry (deep)
    2022-04-05T11:08:23.025327  <6>[   34.888979] r8152 2-4:1.0 eth0: carri=
er on
    2022-04-05T11:08:23.028468  rtcwake: assuming RTC uses UTC ...
    2022-04-05T11:08:23.035099  rtcwake: wakeup from \"freeze\" using rtc0 =
at Tue Apr  5 11:08:27 2022
    2022-04-05T11:08:23.038067  <6>[   34.896874] Filesystems sync: 0.000 s=
econds
    2022-04-05T11:08:23.041734  <6>[   34.910388] PM: suspend entry (s2idle)
    2022-04-05T11:08:23.044734  <6>[   34.914401] PM: suspend exit
    2022-04-05T11:08:23.048258  rtcwake: write error
    2022-04-05T11:08:23.054761  <6>[   34.917757] Freezing user space proce=
sses ... (elapsed 0.001 seconds) done.
    2022-04-05T11:08:23.057834  <6>[   34.926752] OOM killer disabled. =

    ... (1142 line(s) more)  =

 =20
