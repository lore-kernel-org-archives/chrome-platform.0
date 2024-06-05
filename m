Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761B018F2E4
	for <chrome-platform@lists.linux.dev>; Wed,  5 Jun 2024 08:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717575057; cv=none; b=rY/kTHpJtGrHm2rKjzgP607giA0NCGiTKP54JWVEivyLCz2i+guTVSt2GYQjsmfje6I8LO++2aKlMZGkG3BUHgl6lFiI5PRX9bIX6I6SMmOfRvvWiZNR4A0c4hu3LGKlbCSOPN8y0/qSAqJgqEy+zDoxL98TGPwXee2Qa5HHFfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717575057; c=relaxed/simple;
	bh=JrKZgcbiZSMuAJhAj6wbDbnzFmkKY2QOmp7iSW+T39U=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Ogrk0cVRHSTClMkl88eDwfZf5nsJ2gDweRsjnpFvuhzpjwHUDl/7AezRZuNjGiYJlQ5NYHZl0JtHewdF/+ZLka6V88j6vCTrbbkH6LM3XCB88w6KOih3K9oVeJGSL0BylmEDOKnYeX6IvowHUeYNCwYwR1PsW8+Wp9fCnicmuWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=iNxS9DWb; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="iNxS9DWb"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-681953ad4f2so4896692a12.2
        for <chrome-platform@lists.linux.dev>; Wed, 05 Jun 2024 01:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717575055; x=1718179855; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=65Qwcdyw6BNbdlkMhgNJrkp18jfhJhQxGNUmi5TFic8=;
        b=iNxS9DWb+ofGrjzDeHMKLZdE5l+JCwXfSIIIDVEuFb15+qrzJDzehOukAi4N3tSZGM
         Exsaj6iAoAQN4tswuavWQJGbEYUIzj6QZZXB8N7DK3Lyn1TazpQUmC4FsfWxRQTOPNir
         i2QMj5Rf0bxBOj8UMfuOI694R+JQU2PRModfC284b4sPYrqN7Cjbpi40gobdkLU+DEFg
         lj+H0AUXroPYsOzJK6ZNmL2d5dLlqqFlIakpKnjg3pLyYYsw0sPKf1VTBhSzGx9RL8QO
         G5QY0JhPgLDYMyZz1pX20cmorThWefDYwAFR8ZEjhrF4exlaKi2xeuLRftZhNQDNGxsZ
         aCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717575055; x=1718179855;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65Qwcdyw6BNbdlkMhgNJrkp18jfhJhQxGNUmi5TFic8=;
        b=RMfdGdAphXj9EP7r7Fw5J/0s38UeSASa6wMS9dS1IzlBLQbnNB7yQUoTE46e+N3nWA
         4oHTl9tM0zEVOKiHdS8cx1vQHgOUmIFTOWX4naTmu7HYeFdC2OHpg2RqnsWLu5MXFk3P
         q32HP/9p0z4byBxUE/XPzoGFOqvpVZDr9Bmjo+ZQk3lmWwt4ERRLQEa+DZiZUZfd75Nw
         AYKs/rfEZMARE8jcRtkzhNuMhQTiTkzDEYyZRhO34BtksYp6NthLTwMT7Ku9FUvQ84Sr
         nHMcRzdWr/Dy332uRRYR+y3xuEVZscWTbqJDMbXVFbTMafW5ArMXvh5p4RUyJW7XpgjM
         TfLw==
X-Forwarded-Encrypted: i=1; AJvYcCV1Qbiw3n7wPs4GCEP+M/1BGabD2cR5p+44+XDBAHMHbQzjU/2T3AWCxA4SnpdJYjB9LT8y+ToZQkHOvSbuVZ0u86MRa15hxOnEewEJ0VFV
X-Gm-Message-State: AOJu0Yz6ojxLedCOAQ0VHjwYwvpt9PhQA9iWwcveCxe68d+BXw+qXqoC
	REG15IuBKdLGd4APNzgH0+V2E1LE0EhjrMghkZYDS+MIx8pqKCzObOkddNeuuq8=
X-Google-Smtp-Source: AGHT+IENbNjiRkYATDc9ndO8yERP/AkkqXIvK9D/9Pf7FLtgkzIkEtsLVXS5F4OYnRagiH4U/YN4Xw==
X-Received: by 2002:a17:90b:128e:b0:2c2:8d2c:8292 with SMTP id 98e67ed59e1d1-2c28d2c8317mr154532a91.48.1717575054486;
        Wed, 05 Jun 2024 01:10:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c254a76729sm3220594a91.0.2024.06.05.01.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 01:10:54 -0700 (PDT)
Message-ID: <66601d8e.170a0220.33ae9c.85c4@mx.google.com>
Date: Wed, 05 Jun 2024 01:10:54 -0700 (PDT)
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
Subject: chrome-platform/for-kernelci cros-ec: 11 runs,
 6 regressions (v6.10-rc1-8-g106d673982336)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 11 runs, 6 regressions (v6.10-rc1-8-g=
106d673982336)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board | 1          =

mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-8-g106d673982336/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-8-g106d673982336
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      106d6739823369c734a8fc3b13634274eee4f60e

  Test suite revisions:
    cros-ec-tests
      URL:  https://github.com/kernelci/cros-ec-tests.git
      SHA:  fad9423ae3c64bfd48c207de34a1177000d45fa8 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/66600925fc8e097ccc7e706f

  Results:     2 PASS, 1 FAIL, 13 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-8-g106d673982336/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-8-g106d673982336/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_chardev: https://kernelci.org/test/case/id/6660092=
5fc8e097ccc7e707d
        failing since 2 days (last pass: v6.10-rc1-6-ge8665a1723789, first =
fail: v6.10-rc1-6-gbc3e45258096f)

    2024-06-05T06:48:26.317936  test_cros_ec_chardev (cros.tests.cros_ec_mc=
u.TestCrosECMCU.test_cros_ec_chardev)

    2024-06-05T06:48:26.324756  Checks the main Embedded controller charact=
er device. ... FAIL

    2024-06-05T06:48:26.324863  =

   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/66600a5bd0f7d84cb97e708b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-8-g106d673982336/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-8-g106d673982336/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/66600a5bd0f7d84cb97e70=
8c
        new failure (last pass: v6.10-rc1-6-gbc3e45258096f) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/66600a190c11723eb37e7085

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-8-g106d673982336/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-8-g106d673982336/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/66600a190c11723eb37e70=
86
        failing since 2 days (last pass: v6.10-rc1-6-ge8665a1723789, first =
fail: v6.10-rc1-6-gbc3e45258096f) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/666009ea82e16435e17e7075

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-8-g106d673982336/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-8-g106d673982336/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/666009ea82e16435e17e70=
76
        new failure (last pass: v6.10-rc1-6-gbc3e45258096f) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/66600989955744b9637e706f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-8-g106d673982336/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-8-g106d673982336/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/66600989955744b9637e70=
70
        failing since 7 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first =
fail: v6.10-rc1-4-g7b44d5381e541) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/66600afb57a062ca2d7e707d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-8-g106d673982336/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-8-g106d673982336/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/66600afb57a062ca2d7e70=
7e
        failing since 6 days (last pass: v6.9-rc4-22-g2fbe479c0024e, first =
fail: v6.10-rc1-4-g7b44d5381e541) =

 =20
