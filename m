Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622EDC120
	for <chrome-platform@lists.linux.dev>; Tue, 18 Jul 2023 08:55:29 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-666e64e97e2so3593142b3a.1
        for <chrome-platform@lists.linux.dev>; Tue, 18 Jul 2023 01:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1689670529; x=1692262529;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Wk7SwznEYrKwM3nazDzIuSG4QofxEdSGWLOCHicv7U0=;
        b=4nVrvLQyKn9biBt23N3wlU6PP8I+P+L/7xGAtioJbLJR1RXnrStvm6AkpyEqN943Sl
         DTP1pNr+eRvBRjc6SGBCKy0dbpJ1GDrfIBFSSpoGXn5QEaA0RKsNrKTWuLPTO2/d99kE
         u6CnPeWfGxYhNvsgAfffIqUrl7XmU9GjLi8+7VnTmbQW0mOj+HagZfI0NUYB24swxZqQ
         unU4IXO4dM2zGLjLO0E38oEY4jzKUcEa7DCFwazQ/wAnUOXflAVIYcQv9pjflv7OBB1u
         9GhhIgdBtxC2h4VZNX2+ZSEe6qDJ0Bxk+TSOuu4iTg/cKE81qb9BpnIdscDQTUJQ3bcZ
         iO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689670529; x=1692262529;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wk7SwznEYrKwM3nazDzIuSG4QofxEdSGWLOCHicv7U0=;
        b=I+PNi7Rf9q0T3Ju5bcp1AmiVI0Qg0A6RDVx3WS5OwwV9daiziGQ16oc7JCGwFWIGfQ
         zmnhNLy42ikBUdRdUPzIA2rG9GXpWAh2yfuYYcheFCMKy/9F/eFd26AMMG43JHlL+CDv
         gEDEa9vykrU7zN9w7PbhgYrIA9DqLz9lENwJg9i68Hy8SEzztlURr175GwbxACGFhIAe
         WhDORHa29SWKuFwQBN41PWgpeJ9l76Ksu2PasaPGIkcRLx7gqaQe6dO0x/dwWoqjogyp
         TmihlyqQctdl1RSC5tzQROgZGIADGvKy3olGRMkx0KJ0ncJc9GwCX625JRh0AtVQfKl+
         m3mw==
X-Gm-Message-State: ABy/qLYCmavnslkzSjmxjQ9hZ9oS4wY6RR6WbswLzumnXqJSxRL/nm1W
	QnFTVfwS8ZU7imtQrocbOL4Ivw==
X-Google-Smtp-Source: APBJJlHT5mtp3Kfn1LGpuI9wUmfn5DZQZCIwye3O66YIkh7A5KK/sppPlBFqN1LteCUevx24uweaiA==
X-Received: by 2002:a05:6a20:7a22:b0:132:7bdf:bc9d with SMTP id t34-20020a056a207a2200b001327bdfbc9dmr11140859pzh.41.1689670528643;
        Tue, 18 Jul 2023 01:55:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id v8-20020aa78508000000b00673e652985bsm1078515pfn.118.2023.07.18.01.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 01:55:27 -0700 (PDT)
Message-ID: <64b6537f.a70a0220.ace6e.2884@mx.google.com>
Date: Tue, 18 Jul 2023 01:55:27 -0700 (PDT)
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
X-Kernelci-Kernel: v6.5-rc1-1-ga6edd5f5d9cc
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci baseline: 78 runs,
 8 regressions (v6.5-rc1-1-ga6edd5f5d9cc)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 78 runs, 8 regressions (v6.5-rc1-1-g=
a6edd5f5d9cc)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

fsl-ls2088a-rdb              | arm64  | lab-nxp       | gcc-10   | defconfi=
g                    | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.5-rc1-1-ga6edd5f5d9cc/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.5-rc1-1-ga6edd5f5d9cc
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      a6edd5f5d9cc4ae3bc9f77123d1bd7ebac38bb9a =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64b64655bfde2ab1d88ace29

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-ga6edd5f5d9cc/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-ga6edd5f5d9cc/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b64655bfde2ab1d88ace2e
        failing since 101 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-07-18T07:58:56.309723  + set<8>[   11.877873] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11106138_1.4.2.3.1>

    2023-07-18T07:58:56.310285   +x

    2023-07-18T07:58:56.418069  / # #

    2023-07-18T07:58:56.520496  export SHELL=3D/bin/sh

    2023-07-18T07:58:56.521388  #

    2023-07-18T07:58:56.622990  / # export SHELL=3D/bin/sh. /lava-11106138/=
environment

    2023-07-18T07:58:56.623661  =


    2023-07-18T07:58:56.725109  / # . /lava-11106138/environment/lava-11106=
138/bin/lava-test-runner /lava-11106138/1

    2023-07-18T07:58:56.726536  =


    2023-07-18T07:58:56.731659  / # /lava-11106138/bin/lava-test-runner /la=
va-11106138/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64b6465de6da5b88af8ace4a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-ga6edd5f5d9cc/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-ga6edd5f5d9cc/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b6465de6da5b88af8ace4f
        failing since 101 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-07-18T07:59:12.956859  <8>[   11.295544] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11106125_1.4.2.3.1>

    2023-07-18T07:59:12.960060  + set +x

    2023-07-18T07:59:13.064754  #

    2023-07-18T07:59:13.065931  =


    2023-07-18T07:59:13.167538  / # #export SHELL=3D/bin/sh

    2023-07-18T07:59:13.168160  =


    2023-07-18T07:59:13.269581  / # export SHELL=3D/bin/sh. /lava-11106125/=
environment

    2023-07-18T07:59:13.270208  =


    2023-07-18T07:59:13.371623  / # . /lava-11106125/environment/lava-11106=
125/bin/lava-test-runner /lava-11106125/1

    2023-07-18T07:59:13.372686  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
fsl-ls2088a-rdb              | arm64  | lab-nxp       | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64b6486785f2b1ff2c8ace9f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-ga6edd5f5d9cc/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a=
-rdb.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-ga6edd5f5d9cc/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a=
-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b6486785f2b1ff2c8acea2
        new failure (last pass: v6.0-rc1-19-gd378c6f0456c)

    2023-07-18T08:07:51.080594  + [   15.522484] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 1237248_1.5.2.4.1>
    2023-07-18T08:07:51.080761  set +x
    2023-07-18T08:07:51.186164  =

    2023-07-18T08:07:51.287502  / # #export SHELL=3D/bin/sh
    2023-07-18T08:07:51.287901  =

    2023-07-18T08:07:51.388859  / # export SHELL=3D/bin/sh. /lava-1237248/e=
nvironment
    2023-07-18T08:07:51.389292  =

    2023-07-18T08:07:51.490296  / # . /lava-1237248/environment/lava-123724=
8/bin/lava-test-runner /lava-1237248/1
    2023-07-18T08:07:51.490990  =

    2023-07-18T08:07:51.494532  / # /lava-1237248/bin/lava-test-runner /lav=
a-1237248/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64b646519f684531ba8ace3f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-ga6edd5f5d9cc/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-ga6edd5f5d9cc/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b646519f684531ba8ace44
        failing since 101 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-07-18T07:58:54.365814  + set +x

    2023-07-18T07:58:54.372793  <8>[   10.135401] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11106120_1.4.2.3.1>

    2023-07-18T07:58:54.476613  / # #

    2023-07-18T07:58:54.577112  export SHELL=3D/bin/sh

    2023-07-18T07:58:54.577256  #

    2023-07-18T07:58:54.677711  / # export SHELL=3D/bin/sh. /lava-11106120/=
environment

    2023-07-18T07:58:54.677868  =


    2023-07-18T07:58:54.778329  / # . /lava-11106120/environment/lava-11106=
120/bin/lava-test-runner /lava-11106120/1

    2023-07-18T07:58:54.778565  =


    2023-07-18T07:58:54.782730  / # /lava-11106120/bin/lava-test-runner /la=
va-11106120/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64b646499f684531ba8ace2d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-ga6edd5f5d9cc/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-ga6edd5f5d9cc/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b646499f684531ba8ace32
        failing since 101 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-07-18T07:58:57.090473  + set<8>[   11.056383] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11106112_1.4.2.3.1>

    2023-07-18T07:58:57.091073   +x

    2023-07-18T07:58:57.198869  / # #

    2023-07-18T07:58:57.301204  export SHELL=3D/bin/sh

    2023-07-18T07:58:57.301984  #

    2023-07-18T07:58:57.403566  / # export SHELL=3D/bin/sh. /lava-11106112/=
environment

    2023-07-18T07:58:57.404303  =


    2023-07-18T07:58:57.505820  / # . /lava-11106112/environment/lava-11106=
112/bin/lava-test-runner /lava-11106112/1

    2023-07-18T07:58:57.507135  =


    2023-07-18T07:58:57.512118  / # /lava-11106112/bin/lava-test-runner /la=
va-11106112/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64b6464c74ec7b0e678ace81

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-ga6edd5f5d9cc/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-ga6edd5f5d9cc/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b6464c74ec7b0e678ace86
        failing since 101 days (last pass: v6.3-rc1-4-g9ce5f3b3c18e2, first=
 fail: v6.3-rc1-5-gd946c9118047)

    2023-07-18T07:58:47.495556  + set +x<8>[   11.904155] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 11106131_1.4.2.3.1>

    2023-07-18T07:58:47.496065  =


    2023-07-18T07:58:47.603795  / # #

    2023-07-18T07:58:47.704357  export SHELL=3D/bin/sh

    2023-07-18T07:58:47.704528  #

    2023-07-18T07:58:47.805060  / # export SHELL=3D/bin/sh. /lava-11106131/=
environment

    2023-07-18T07:58:47.805283  =


    2023-07-18T07:58:47.905789  / # . /lava-11106131/environment/lava-11106=
131/bin/lava-test-runner /lava-11106131/1

    2023-07-18T07:58:47.906047  =


    2023-07-18T07:58:47.910934  / # /lava-11106131/bin/lava-test-runner /la=
va-11106131/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64b648f80f1c23624a8aced9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-ga6edd5f5d9cc/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-=
a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-ga6edd5f5d9cc/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-=
a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b648f80f1c23624a8ac=
eda
        new failure (last pass: v6.4-rc1-5-g2b8cc5858a07a) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64b6480ba3408f085b8ace55

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-ga6edd5f5d9cc/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50=
i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.5-rc1-1-ga6edd5f5d9cc/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50=
i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b6480ba3408f085b8ace5a
        new failure (last pass: v6.4-rc1-5-g2b8cc5858a07a)

    2023-07-18T08:07:50.978312  / # #

    2023-07-18T08:07:51.080440  export SHELL=3D/bin/sh

    2023-07-18T08:07:51.081190  #

    2023-07-18T08:07:51.182557  / # export SHELL=3D/bin/sh. /lava-11106153/=
environment

    2023-07-18T08:07:51.183268  =


    2023-07-18T08:07:51.284723  / # . /lava-11106153/environment/lava-11106=
153/bin/lava-test-runner /lava-11106153/1

    2023-07-18T08:07:51.285895  =


    2023-07-18T08:07:51.302310  / # /lava-11106153/bin/lava-test-runner /la=
va-11106153/1

    2023-07-18T08:07:51.371326  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-18T08:07:51.371826  + cd /lava-11106153/1/tests/1_boot<8>[   18=
.353301] <LAVA_SIGNAL_STARTRUN 1_bootrr 11106153_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
