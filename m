Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8645B7C
	for <chrome-platform@lists.linux.dev>; Wed,  4 Jan 2023 04:02:41 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id b2so34715957pld.7
        for <chrome-platform@lists.linux.dev>; Tue, 03 Jan 2023 20:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sd2gl8/boeeZqb27b5aC8GAJj36NQRMx3BclViKtB4c=;
        b=ROFoOwxkrmp+0l0/VpeO5yzK8eQsKGid6YwRjj0RP6xcg6k7r4Fl/SuuDAniIdoRdL
         ivxNHJv/uA5eU2yFh3uUk/UvEL4yh0uxwuCZ5BW20I8hu3cb2yUbXM2g43VFF8PLmpb/
         hkKCcJa9CURXOqw5dPJYQHLJQ8DcKlniJnts0o8kJVFhsxLIKncFguoxJmCnfl4FjhYt
         0rs5a2LGwJ1wHZTHD+JxGrFPXd9OK3QmRWz32XXJ+zdCg2gPC75Ug6hxg8xXS1yeXDbd
         7CAHrZdyc2geAnwp77eQHLgTT4FJcnm2ne8HYrEpzNQ9zQlpRc1ZwQ/Hzmip4OaIu1mC
         trRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sd2gl8/boeeZqb27b5aC8GAJj36NQRMx3BclViKtB4c=;
        b=kGHK8302Ovkw7H1xK2uf7DD10IMCcPcmlU/jaOSAp7YPeBzs4mZ4ZUiTOuDwWwa0oD
         jmuZN4AGObzlte5dO1DVVCFZ6VZuT75+EHPcKIRdl30Z5ZeZCEMAS0LKkasE1VimbYFj
         Wv0aPYT7fzo3pLlRhLM6mo/NONBQKE5qURbD3b3QjjwCDdqQ7jkDCWdcbyyfUbsabnLA
         ILJEPLCSdDb98h5mq0g71h3nsQ4OU+7Vx2x3vByew6aVIkpBcFrsc7d2qQnzaPIZou9g
         q0yDaI5A6TY3lHAfOIg9mSyu20u7HC1ZkooqOkhZQX6l8rTXpA9DiC3Z/mCh2QHhkLHO
         FnBg==
X-Gm-Message-State: AFqh2kq8XF7B3Qz69XMqPoKoCf+lCZ8CzB45SkMT16UhYm/4f9u4HA1V
	rxzcyli3KnDRf6pLuO4FZ7csHA==
X-Google-Smtp-Source: AMrXdXtOZIGL1cWWpf178EnDiEghhmrmV6ejapeRTYWAcztk1Tv5nTqw8QSaqnBtpAhLIPEeYY8XJg==
X-Received: by 2002:a05:6a20:438d:b0:b2:18da:1515 with SMTP id i13-20020a056a20438d00b000b218da1515mr60709090pzl.20.1672804960969;
        Tue, 03 Jan 2023 20:02:40 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i7-20020a17090332c700b00192d9b86318sm2683542plr.137.2023.01.03.20.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 20:02:40 -0800 (PST)
Message-ID: <63b4fa60.170a0220.18ecb.4c90@mx.google.com>
Date: Tue, 03 Jan 2023 20:02:40 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.2-rc1-8-gf9a0ae83af2e
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci sleep: 4 runs,
 1 regressions (v6.2-rc1-8-gf9a0ae83af2e)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 4 runs, 1 regressions (v6.2-rc1-8-gf9a0=
ae83af2e)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.2-rc1-8-gf9a0ae83af2e/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.2-rc1-8-gf9a0ae83af2e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      f9a0ae83af2ee586e38850de121f25382427a23c =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/63b4ecf865bee7035f4eee44

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-8-gf9a0ae83af2e/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/sleep-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.2-rc1-8-gf9a0ae83af2e/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/sleep-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221230.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/63b4ecf865bee7035f4eee45
        new failure (last pass: v6.2-rc1-7-g51b1cbc6f5d0) =

 =20
