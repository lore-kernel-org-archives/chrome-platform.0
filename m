Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BF02F29
	for <chrome-platform@lists.linux.dev>; Tue, 11 Apr 2023 10:50:23 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5180af0e886so352144a12.2
        for <chrome-platform@lists.linux.dev>; Tue, 11 Apr 2023 03:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1681210223; x=1683802223;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3ph9P9zvYpggBXsOe24OG30wlUQbVzmrjDaqJL3pdek=;
        b=UIQCOqhdbaAAm3p7tuIj44w+kYg5DXHb0zPckJedaJS7cAdP8j+TqY2OwOvnp+6rfE
         TEcTk8EdIsl8+s6gZg9mx55E7NCRIGgjkPdOXvoZdyfg0ZwaXmtTaMxobOk2Nf93KRXs
         S8uDMskJqiIuRT6fZH6BpMO4FDBNQwyIPYo8GjsTBju6xqssbi1tUwxHELy7Hjf9/dws
         JgPpf01lNj217n6ylRzqh00xrIMfggfkqSHz/BAyq7D/e4W8HkhYPtIayJioTL9qyGCo
         IdX6YnudZP9lqX/2d0HW+oEiocHubKHdfJm20mwHOiR+IYNsl+WBfbbhVpM9wYz0riJc
         LZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681210223; x=1683802223;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ph9P9zvYpggBXsOe24OG30wlUQbVzmrjDaqJL3pdek=;
        b=ila9lxHuWEn26oKZWGL+65BY0HUhw+wv0xD8X8leIYQCsO30kv2Rb+rlRT+qd5spu/
         5vpzDp82pUVS8n6dyo0CB851pxvAhyTOIpYFhslNipAb+ljh9ZMbKD656BqtNsivQrTt
         T7iXVI0ZRjSHqjwQ/b/gTs2yMw6tR4tLjjxCJuZNCubxsvL4j43LHuA7kjEdIHc0WSD2
         ghr1ByZsGbVysVvcJPu2fYYN3Hvb6XlJlKzTBmltF1LxhMOYbqdHiJHZYnlxZhGFdVK/
         RHX/r+6hWR8v+FFnzP+K5rcK99xM+r2vJLCR5/l6tpaELK3uppeiw9fxwo2UBVhKVnve
         4hLQ==
X-Gm-Message-State: AAQBX9cLsmAd9Vvvem2qkT8BpA4+W21ejGrGLtN41vrZH/9/5eKg6pUn
	km8YQBGDNXejbJx1lm+xMsd6XQ==
X-Google-Smtp-Source: AKy350Z8Mrqk4uhAV2SCEpPh6/q6LKZGtJnYMNRh3PHx2wqZ3jjseI5w6RrK/RZzpgdMGkbF/ghqOg==
X-Received: by 2002:aa7:96ae:0:b0:638:13ab:b0a9 with SMTP id g14-20020aa796ae000000b0063813abb0a9mr5726781pfk.24.1681210222997;
        Tue, 11 Apr 2023 03:50:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t13-20020a62ea0d000000b006363690dddasm4365489pfh.5.2023.04.11.03.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 03:50:22 -0700 (PDT)
Message-ID: <64353b6e.620a0220.eb92c.7875@mx.google.com>
Date: Tue, 11 Apr 2023 03:50:22 -0700 (PDT)
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
X-Kernelci-Kernel: v6.3-rc1-7-g419346a03810
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 86 runs,
 33 regressions (v6.3-rc1-7-g419346a03810)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 86 runs, 33 regressions (v6.3-rc1-7-=
g419346a03810)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =

imx6q-sabrelite              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =

imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =

imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =

imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

odroid-xu3                   | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.3-rc1-7-g419346a03810/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.3-rc1-7-g419346a03810
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      419346a0381034fcc0866be9605108c8612847de =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64352f2e48e317add82e8611

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64352f2e48e317add82e8616
        failing since 3 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first f=
ail: v6.3-rc1-5-gd946c9118047)

    2023-04-11T09:57:46.789628  + set +x

    2023-04-11T09:57:46.796402  <8>[   10.577062] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9933808_1.4.2.3.1>

    2023-04-11T09:57:46.904536  / # #

    2023-04-11T09:57:47.007249  export SHELL=3D/bin/sh

    2023-04-11T09:57:47.008133  #

    2023-04-11T09:57:47.110192  / # export SHELL=3D/bin/sh. /lava-9933808/e=
nvironment

    2023-04-11T09:57:47.111009  =


    2023-04-11T09:57:47.212949  / # . /lava-9933808/environment/lava-993380=
8/bin/lava-test-runner /lava-9933808/1

    2023-04-11T09:57:47.214310  =


    2023-04-11T09:57:47.219756  / # /lava-9933808/bin/lava-test-runner /lav=
a-9933808/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64352e07b24c23ac5d2e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64352e07b24c23ac5d2e85eb
        failing since 3 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first f=
ail: v6.3-rc1-5-gd946c9118047)

    2023-04-11T09:52:48.467091  + set<8>[   11.584094] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9933871_1.4.2.3.1>

    2023-04-11T09:52:48.467575   +x

    2023-04-11T09:52:48.575002  / # #

    2023-04-11T09:52:48.677980  export SHELL=3D/bin/sh

    2023-04-11T09:52:48.678778  #

    2023-04-11T09:52:48.781037  / # export SHELL=3D/bin/sh. /lava-9933871/e=
nvironment

    2023-04-11T09:52:48.781894  =


    2023-04-11T09:52:48.883897  / # . /lava-9933871/environment/lava-993387=
1/bin/lava-test-runner /lava-9933871/1

    2023-04-11T09:52:48.885191  =


    2023-04-11T09:52:48.890137  / # /lava-9933871/bin/lava-test-runner /lav=
a-9933871/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64352df44819abe7bf2e8602

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64352df44819abe7bf2e8607
        failing since 3 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first f=
ail: v6.3-rc1-5-gd946c9118047)

    2023-04-11T09:52:36.073919  <8>[   11.317577] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9933865_1.4.2.3.1>

    2023-04-11T09:52:36.077292  + set +x

    2023-04-11T09:52:36.182945  #

    2023-04-11T09:52:36.184302  =


    2023-04-11T09:52:36.286686  / # #export SHELL=3D/bin/sh

    2023-04-11T09:52:36.287491  =


    2023-04-11T09:52:36.389431  / # export SHELL=3D/bin/sh. /lava-9933865/e=
nvironment

    2023-04-11T09:52:36.390344  =


    2023-04-11T09:52:36.492462  / # . /lava-9933865/environment/lava-993386=
5/bin/lava-test-runner /lava-9933865/1

    2023-04-11T09:52:36.493925  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64352dfb3a0b1d3dcd2e8611

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64352dfb3a0b1d3dcd2e8616
        failing since 3 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first f=
ail: v6.3-rc1-5-gd946c9118047)

    2023-04-11T09:52:46.184002  + set +x

    2023-04-11T09:52:46.190293  <8>[   10.257384] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9933834_1.4.2.3.1>

    2023-04-11T09:52:46.295661  / # #

    2023-04-11T09:52:46.396748  export SHELL=3D/bin/sh

    2023-04-11T09:52:46.396987  #

    2023-04-11T09:52:46.497910  / # export SHELL=3D/bin/sh. /lava-9933834/e=
nvironment

    2023-04-11T09:52:46.498141  =


    2023-04-11T09:52:46.599127  / # . /lava-9933834/environment/lava-993383=
4/bin/lava-test-runner /lava-9933834/1

    2023-04-11T09:52:46.599431  =


    2023-04-11T09:52:46.604158  / # /lava-9933834/bin/lava-test-runner /lav=
a-9933834/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64352dd0531933076e2e85eb

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64352dd0531933076e2e85f0
        failing since 3 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first f=
ail: v6.3-rc1-5-gd946c9118047)

    2023-04-11T09:52:04.545902  <8>[   10.932533] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9933830_1.4.2.3.1>

    2023-04-11T09:52:04.549595  + set +x

    2023-04-11T09:52:04.651364  /#

    2023-04-11T09:52:04.752458   # #export SHELL=3D/bin/sh

    2023-04-11T09:52:04.752619  =


    2023-04-11T09:52:04.853688  / # export SHELL=3D/bin/sh. /lava-9933830/e=
nvironment

    2023-04-11T09:52:04.853886  =


    2023-04-11T09:52:04.954712  / # . /lava-9933830/environment/lava-993383=
0/bin/lava-test-runner /lava-9933830/1

    2023-04-11T09:52:04.954952  =


    2023-04-11T09:52:04.959777  / # /lava-9933830/bin/lava-test-runner /lav=
a-9933830/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64352df2497f145f652e86f5

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64352df2497f145f652e86fa
        failing since 3 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first f=
ail: v6.3-rc1-5-gd946c9118047)

    2023-04-11T09:52:33.682881  + set<8>[   10.689630] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9933814_1.4.2.3.1>

    2023-04-11T09:52:33.682992   +x

    2023-04-11T09:52:33.787661  / # #

    2023-04-11T09:52:33.888681  export SHELL=3D/bin/sh

    2023-04-11T09:52:33.888926  #

    2023-04-11T09:52:33.989879  / # export SHELL=3D/bin/sh. /lava-9933814/e=
nvironment

    2023-04-11T09:52:33.990081  =


    2023-04-11T09:52:34.091077  / # . /lava-9933814/environment/lava-993381=
4/bin/lava-test-runner /lava-9933814/1

    2023-04-11T09:52:34.091440  =


    2023-04-11T09:52:34.095998  / # /lava-9933814/bin/lava-test-runner /lav=
a-9933814/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/64353107ac39dc55e22e867f

  Results:     13 PASS, 12 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-=
imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-=
imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64353107ac39dc5=
5e22e8699
        failing since 36 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-04-11T10:05:17.443181  k<8>[   17.836621] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
    2023-04-11T10:05:17.443546  ern  :alert : Register r0 information: non-=
slab/vmalloc memory
    2023-04-11T10:05:17.443770  kern  :alert : Register r1 information: non=
-paged memory
    2023-04-11T10:05:17.444229  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-04-11T10:05:17.444504  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-11T10:05:17.465275  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0ce4000 allocated at kernel_clone+0x8c/0x=
36c
    2023-04-11T10:05:17.465869  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-04-11T10:05:17.466114  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-04-11T10:05:17.488468  kern  :alert : Register r7 information: sla=
b task_struct start c4c5d500 pointer offset 0 size 2176
    2023-04-11T10:05:17.489014  kern  :alert : Register r8 information: non=
-slab/vmalloc memory =

    ... (102 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64353107ac39dc5=
5e22e869a
        failing since 36 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-04-11T10:05:17.421257  kern  :alert : 8<--- cut here ---
    2023-04-11T10:05:17.421641  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-04-11T10:05:17.422120  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-sabrelite              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/64352f5662351768132e867b

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64352f566235176=
8132e8682
        failing since 36 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-04-11T09:58:35.134951  ern  :alert : Register r0 information: non-=
slab/vmalloc memory

    2023-04-11T09:58:35.139339  kern  :alert : Register r1 information: non=
-paged memory

    2023-04-11T09:58:35.146204  kern  :alert : Register r2 information: non=
-slab/vmalloc memory

    2023-04-11T09:58:35.149692  kern  :alert : Register r3 information: non=
-paged memory

    2023-04-11T09:58:35.160708  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0e00000 allocated at kernel_clone+0x8c/0x=
36c

    2023-04-11T09:58:35.166953  kern  :alert : Register r5 information: non=
-slab/vmalloc memory

    2023-04-11T09:58:35.172116  kern  :alert : Register r6 information: zer=
o-size pointer

    2023-04-11T09:58:35.180804  kern  :alert : Register r7 information: sla=
b task_struct start c266b300 pointer offset 0 size 2176

    2023-04-11T09:58:35.185316  kern  :alert : Register r8 information: non=
-slab/vmalloc memory

    2023-04-11T09:58:35.190205  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
 =

    ... (101 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64352f566235176=
8132e8683
        failing since 36 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-04-11T09:58:35.108116  kern  :alert : 8<--- cut here ---

    2023-04-11T09:58:35.116193  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741

    2023-04-11T09:58:35.119261  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)

    2023-04-11T09:58:35.130584  k<8>[    7.939330] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/64352fd0552f67e7472e85f1

  Results:     13 PASS, 12 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-=
imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-=
imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64352fd0552f67e=
7472e860b
        failing since 36 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-04-11T10:00:16.851930  k<8>[   16.404150] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
    2023-04-11T10:00:16.852534  ern  :alert : Register r0 information: non-=
slab/vmalloc memory
    2023-04-11T10:00:16.852883  kern  :alert : Register r1 information: non=
-paged memory
    2023-04-11T10:00:16.853467  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-04-11T10:00:16.853745  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-11T10:00:16.874083  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0d54000 allocated at kernel_clone+0x8c/0x=
36c
    2023-04-11T10:00:16.874863  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-04-11T10:00:16.875171  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-04-11T10:00:16.896283  kern  :alert : Register r7 information: sla=
b task_struct start c4908880 pointer offset 0 size 2176
    2023-04-11T10:00:16.896861  kern  :alert : Register r8 information: non=
-slab/vmalloc memory =

    ... (102 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64352fd0552f67e=
7472e860c
        failing since 36 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-04-11T10:00:16.830088  kern  :alert : 8<--- cut here ---
    2023-04-11T10:00:16.830610  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-04-11T10:00:16.831217  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/64352f30739b42dc552e8606

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/basel=
ine-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64352f30739b42d=
c552e860d
        failing since 36 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        90 lines

    2023-04-11T09:57:59.844638  mation: non-slab/vmalloc memory
    2023-04-11T09:57:59.844788  kern  :alert : Register r1 information: non=
-paged memory
    2023-04-11T09:57:59.853723  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-04-11T09:57:59.853906  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-11T09:57:59.862751  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0ddc000 allocated at kernel_clone+0x8c/0x=
36c
    2023-04-11T09:57:59.871740  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-04-11T09:57:59.880738  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-04-11T09:57:59.889883  kern  :alert : Register r7 information: sla=
b task_struct start c238cc80 pointer offset 0 size 2176
    2023-04-11T09:57:59.890049  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-04-11T09:57:59.898862  kern  :alert : Register r9 information: non=
-slab/vmalloc memory =

    ... (102 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64352f30739b42d=
c552e860e
        failing since 36 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)
        48 lines

    2023-04-11T09:57:59.817873  kern  :alert : 8<--- cut here ---
    2023-04-11T09:57:59.826640  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-04-11T09:57:59.826842  kern  :alert : [c1a50741] *pgd=3D11a1141e(b=
ad)
    2023-04-11T09:57:59.835844  kern  :alert : Register r0 infor[    5.5407=
38] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines =
MEASUREMENT=3D48>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/64352f99916c391aec2e8610

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6=
ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6=
ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64352f99916c391=
aec2e8617
        failing since 18 days (last pass: v6.2-rc1-8-gf9a0ae83af2e, first f=
ail: v6.3-rc1-4-g9ce5f3b3c18e2)
        90 lines

    2023-04-11T09:59:22.459643  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-04-11T09:59:22.459886  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-11T09:59:22.479975  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xe0c40000 allocated at kernel_clone+0x8c/0x=
36c
    2023-04-11T09:59:22.480562  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-04-11T09:59:22.480823  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-04-11T09:59:22.494842  kern  :alert : Register r7 information: sla=
b task_struct start c7985d80 pointer offset 0 size 2176
    2023-04-11T09:59:22.496082  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-04-11T09:59:22.505866  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
    2023-04-11T09:59:22.514152  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory
    2023-04-11T09:59:22.524155  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory =

    ... (105 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64352f99916c391=
aec2e8618
        failing since 18 days (last pass: v6.2-rc1-8-gf9a0ae83af2e, first f=
ail: v6.3-rc1-4-g9ce5f3b3c18e2)
        48 lines

    2023-04-11T09:59:22.435976  kern  :alert : 8<--- cut here ---
    2023-04-11T09:59:22.436300  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-04-11T09:59:22.436807  kern  :alert : [c1a50741] *pgd=3D81a1141e(b=
ad)
    2023-04-11T09:59:22.437055  kern  :alert : Register r0 information: non=
-slab/vmalloc memory
    2023-04-11T09:59:22.457972  kern  :alert : Register r1 in<8>[   19.3640=
54] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines =
MEASUREMENT=3D48>
    2023-04-11T09:59:22.458285  formation: non-paged memory   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/64352f8724dca14d8f2e86a7

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7=
d-sdb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7=
d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64352f8724dca14=
d8f2e86ae
        failing since 36 days (last pass: v6.2-rc1-32-g7ae7deb4a4b4, first =
fail: v6.3-rc1)
        90 lines

    2023-04-11T09:59:19.966493  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-11T09:59:20.006480  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0e24000 allocated at kernel_clone+0x8c/0x=
36c
    2023-04-11T09:59:20.007001  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-04-11T09:59:20.007255  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-04-11T09:59:20.007492  kern  :alert : Register r7 information: sla=
b task_struct start c38ccc80 pointer offset 0 size 2176
    2023-04-11T09:59:20.007725  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-04-11T09:59:20.008200  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
    2023-04-11T09:59:20.049565  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory
    2023-04-11T09:59:20.050283  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory
    2023-04-11T09:59:20.050541  kern  :alert : Register r12 information: NU=
LL pointer =

    ... (97 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64352f8724dca14=
d8f2e86af
        failing since 36 days (last pass: v6.2-rc1-32-g7ae7deb4a4b4, first =
fail: v6.3-rc1)
        48 lines

    2023-04-11T09:59:19.963474  kern  :alert : 8<--- cut here ---
    2023-04-11T09:59:19.963792  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-04-11T09:59:19.964295  kern  :alert : [c1a50741] *pgd=3D81a1141e(b=
ad)
    2023-04-11T09:59:19.964541  k<8>[   10.883219] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D48>
    2023-04-11T09:59:19.964779  ern  :alert : Register r0 information: non-=
slab/vmalloc memory
    2023-04-11T09:59:19.965010  kern  :alert : Register r1 information: non=
-paged memory
    2023-04-11T09:59:19.965236  kern  :alert : Register r2 information: non=
-slab/vmalloc memory   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/64352f96916c391aec2e8604

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7=
ulp-evk.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7=
ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64352f96916c391=
aec2e860b
        failing since 36 days (last pass: v6.2-rc1-23-g93899a4cb7b1, first =
fail: v6.3-rc1)
        90 lines

    2023-04-11T09:59:24.163973  -paged memory
    2023-04-11T09:59:24.164523  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-04-11T09:59:24.164773  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-11T09:59:24.186018  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0bdc000 allocated at kernel_clone+0x8c/0x=
36c
    2023-04-11T09:59:24.186332  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-04-11T09:59:24.186832  kern  :alert : Register r6 information: zer=
o-size pointer
    2023-04-11T09:59:24.187106  kern  :alert : Register r7 information: sla=
b task_struct start c232dd80 pointer offset 0 size 2176
    2023-04-11T09:59:24.207994  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2023-04-11T09:59:24.208288  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
    2023-04-11T09:59:24.208786  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory =

    ... (104 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64352f96916c391=
aec2e860c
        failing since 36 days (last pass: v6.2-rc1-23-g93899a4cb7b1, first =
fail: v6.3-rc1)
        48 lines

    2023-04-11T09:59:24.132024  kern  :alert : 8<--- cut here ---
    2023-04-11T09:59:24.132323  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741
    2023-04-11T09:59:24.132823  kern  :alert : [c1a50741] *pgd=3D61a1141e(b=
ad)
    2023-04-11T09:59:24.133065  kern  :alert : Register r0 information: non=
-slab/vmalloc memory
    2023-04-11T09:59:24.142371  kern  :alert : Register r1 information: non=
<8>[   24.579213] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail =
UNITS=3Dlines MEASUREMENT=3D48>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64352ddf4819abe7bf2e85f1

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64352ddf4819abe7bf2e85f6
        failing since 3 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first f=
ail: v6.3-rc1-5-gd946c9118047)

    2023-04-11T09:52:22.981559  + set +x<8>[   11.872917] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 9933835_1.4.2.3.1>

    2023-04-11T09:52:22.981641  =


    2023-04-11T09:52:23.086339  / # #

    2023-04-11T09:52:23.187340  export SHELL=3D/bin/sh

    2023-04-11T09:52:23.187523  #

    2023-04-11T09:52:23.288416  / # export SHELL=3D/bin/sh. /lava-9933835/e=
nvironment

    2023-04-11T09:52:23.288552  =


    2023-04-11T09:52:23.389447  / # . /lava-9933835/environment/lava-993383=
5/bin/lava-test-runner /lava-9933835/1

    2023-04-11T09:52:23.389728  =


    2023-04-11T09:52:23.394120  / # /lava-9933835/bin/lava-test-runner /lav=
a-9933835/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/643531daa685dab5252e8614

  Results:     166 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/643=
531dba685dab5252e8662
        failing since 36 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)

    2023-04-11T10:09:17.370098  /lava-9934029/1/../bin/lava-test-case

    2023-04-11T10:09:17.376584  <8>[   23.643828] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/643531dba685dab5252e86bb
        failing since 36 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)

    2023-04-11T10:09:14.505666  /lava-9934029/1/../bin/lava-test-case

    2023-04-11T10:09:14.515933  <8>[   20.780089] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/643531dba685dab5252e86bc
        failing since 36 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d)

    2023-04-11T10:09:13.459763  <3>[   19.727295] Bluetooth: hci0: Opcode 0=
x1002 failed: -110

    2023-04-11T10:09:13.466385  <3>[   19.727474] Bluetooth: hci0: command =
0x1002 tx timeout

    2023-04-11T10:09:13.478525  /lava-9934029/1/../bin/lava-test-case

    2023-04-11T10:09:13.487919  <8>[   19.751925] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
odroid-xu3                   | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64352fc9552f67e7472e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64352fc9552f67e7472e8=
5e7
        new failure (last pass: v6.3-rc1-6-g14bb09b32f43) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/64352decb179bfceb22e861d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline=
-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline=
-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64352decb179bfceb22e8=
61e
        failing since 18 days (last pass: v6.3-rc1-2-gdb7df0cfaff3f, first =
fail: v6.3-rc1-4-g9ce5f3b3c18e2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64352e4eef02ccbc642e861e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-b=
roonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-b=
roonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64352e4eef02ccbc642e8=
61f
        failing since 18 days (last pass: v6.3-rc1-2-gdb7df0cfaff3f, first =
fail: v6.3-rc1-4-g9ce5f3b3c18e2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/64352d72646ec71e242e85f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline=
-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline=
-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64352d72646ec71e242e8=
5f5
        failing since 36 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64352e12f33d96e0062e8600

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-b=
roonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-b=
roonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64352e12f33d96e0062e8=
601
        failing since 36 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/64352dc271df3756572e85eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline=
-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline=
-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64352dc271df3756572e8=
5ec
        failing since 36 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64352e3afb8caac2992e8607

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-b=
roonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-b=
roonie/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64352e3afb8caac2992e8=
608
        failing since 36 days (last pass: v6.2-rc1-35-g75a273974d7a, first =
fail: v6.3-rc1-1-gad79d30ce40d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/64352f545094c0f0552e85f6

  Results:     10 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-7-g419346a03810/arm/multi_v7_defconfig/gcc-10/lab-collabora/baselin=
e-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64352f545094c0f=
0552e8603
        new failure (last pass: v6.3-rc1-6-g14bb09b32f43)
        30 lines

    2023-04-11T09:58:30.546654  kern  :alert : Register r2 information: n<8=
>[   14.683995] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UN=
ITS=3Dlines MEASUREMENT=3D30>

    2023-04-11T09:58:30.547100  on-slab/vmalloc memory

    2023-04-11T09:58:30.547446  kern  :alert : Register r3 information: <8>=
[   14.698953] <LAVA_SIGNAL_ENDRUN 0_dmesg 9933889_1.5.2.4.1>

    2023-04-11T09:58:30.547941  non-paged memory

    2023-04-11T09:58:30.548256  kern  :alert : Register r4 information: 2-p=
age vmalloc region starting at 0xf0d44000 allocated at kernel_clone+0x8c/0x=
36c

    2023-04-11T09:58:30.548563  kern  :alert : Register r5 information: non=
-slab/vmalloc memory

    2023-04-11T09:58:30.548847  kern  :alert : Register r6 information: zer=
o-size pointer
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64352f545094c0f=
0552e8604
        new failure (last pass: v6.3-rc1-6-g14bb09b32f43)
        16 lines

    2023-04-11T09:58:30.498076  kern  :alert : 8<--- cut here ---

    2023-04-11T09:58:30.498515  kern  :alert : Unhandled fault: alignment e=
xception (0x001) at 0xc1a50741

    2023-04-11T09:58:30.498770  kern  :alert : [c1<8>[   14.654594] <LAVA_S=
IGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D16>

    2023-04-11T09:58:30.498975  a50741] *pgd=3D01a1141e(bad)

    2023-04-11T09:58:30.499173  kern  :alert : Register r0 information: non=
-slab/vmalloc memory

    2023-04-11T09:58:30.499381  kern  :alert : Register r1 information: non=
-paged memory
   =

 =20
