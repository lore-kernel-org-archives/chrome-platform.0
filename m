Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6182ED0
	for <chrome-platform@lists.linux.dev>; Wed, 28 Dec 2022 06:38:44 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id g8so7198851qkl.2
        for <chrome-platform@lists.linux.dev>; Tue, 27 Dec 2022 22:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2O4yAVncKE+GjhSY3Bq3sNbJyMyEqhpeRe25b+viI7o=;
        b=j6cNfCXxJgPOZFTcdv6sYnXKwXir1Zt1tXHB3LBwUGvbbXAs+/h8QHNPZTdXmxiC2t
         nemFi8OJs3dhRZrw1k/l4+z4zzAxXMo9OVzyLNq9CaggKiOzhi7riSifpd6rOLZMg6p0
         NgLvD/YfOZFVNEOsZgZnmFOjbwJ5Dkh0Qcvkwnp301tXKcJauvKjP2LtNi2QmtVr+Bxx
         LhMHxzs4zNf1KePVhDYhKoEZZRhO/GzHWOP8aLo2L7fa5vHlBKm4a3FPNexLf7ER1ytW
         kYcaLkcG/97OruRY73M0bB6u3ZWfyiKw495hy6BVN5K5cRJGYsOrB3MBxPPyP2xRy1Js
         OUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2O4yAVncKE+GjhSY3Bq3sNbJyMyEqhpeRe25b+viI7o=;
        b=zdVJpJsuI/XKngW4AReICRegv0HHR66J4d7RVEe7bHr0ELFu5s2SG5uVUdfBhUT7UW
         unKnsfkwDVq+QEHvLVwbJPrTry2aeKBjH0T9pcLH1dnJK/WJx1ouaarvlAlEc0zWThot
         W38XnZp2gYfvjvInMT7LZrb3TPc5kAnjc/7TheUBtaQOtXyuzKiog/NijKIZsNJG0pl/
         gpr06LpnErcnNv3tfb1kt8BA9f+TmUWkTRihEGn6+sb8gW1v+GZgZHFLQdWx8IyJf65P
         NFEup4cfh74T0A2oEr0vcQF7ax1Fgl8nz+ugcTSz6MX7Z+bdD7pj/nWjMsSvN79A3+8t
         9d5g==
X-Gm-Message-State: AFqh2krlC3kytcZlsh7/IJo8sdJVhHn+oz3dqhqH3gyvdAlhZNHbUWKo
	ldhhCwxwTxDRF3yHNf/YDGkAVdIGOpLcGwNIFObdxWvevn9tNNJ8
X-Google-Smtp-Source: AMrXdXtKh2BgmkaMnxOZ1XDm4d/FGFhAwODMlfEHCnkCOCkBYUx0IcJoP6yyGTmbcHAVZZDErBzsPGNG39veBDT58AI=
X-Received: by 2002:a37:a4b:0:b0:702:5f06:cbe2 with SMTP id
 72-20020a370a4b000000b007025f06cbe2mr577841qkk.217.1672209523286; Tue, 27 Dec
 2022 22:38:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <63a978a2.a70a0220.4d38c.bd1a@mx.google.com> <CA+Px+wWgj8x4YTMeU1_ggR4h-T5sqYi0ieo2wUjrdcJC8X+ysg@mail.gmail.com>
In-Reply-To: <CA+Px+wWgj8x4YTMeU1_ggR4h-T5sqYi0ieo2wUjrdcJC8X+ysg@mail.gmail.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 28 Dec 2022 14:38:31 +0800
Message-ID: <CA+Px+wUhtXo85-pXt-YV+4mj=6MhuDuqW-jQyyZXk9BEwBfNBw@mail.gmail.com>
Subject: Re: chrome-platform/for-kernelci cros-ec: 8 runs, 7 regressions (v6.2-rc1-3-g942956ddbb33c)
To: "kernelci.org bot" <bot@kernelci.org>
Cc: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io, 
	chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org, 
	groeck@chromium.org, pmalani@chromium.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 28, 2022 at 1:35 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> (Resent in plain-text mode.)
>
> On Mon, Dec 26, 2022 at 6:34 PM kernelci.org bot <bot@kernelci.org> wrote:
> >
> > chrome-platform/for-kernelci cros-ec: 8 runs, 7 regressions (v6.2-rc1-3-g942956ddbb33c)
> >
> > Regressions Summary
> > -------------------
> >
> > platform                     | arch   | lab           | compiler | defconfig                    | regressions
> > -----------------------------+--------+---------------+----------+------------------------------+------------
> > asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-chromebook | 1
> > hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-chromebook | 2
> > hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-chromebook | 2
> > rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfig+arm64-chromebook   | 2
> >
> >   Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernelci/kernel/v6.2-rc1-3-g942956ddbb33c/plan/cros-ec/
> >
> >   Test:     cros-ec
> >   Tree:     chrome-platform
> >   Branch:   for-kernelci
> >   Describe: v6.2-rc1-3-g942956ddbb33c
> >   URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
> >   SHA:      942956ddbb33c13ba4381d9557cd69d1e36cf856
> >
> >   Test suite revisions:
> >     cros-ec-tests
> >       URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/cros-ec-tests.git
> >       SHA:  86181a7fbd379fc42314c450740d2cea8cdf04c1
> >
> >
> > Test Regressions
> > ----------------
> >
> >
> > platform                     | arch   | lab           | compiler | defconfig                    | regressions
> > -----------------------------+--------+---------------+----------+------------------------------+------------
> > asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-chromebook | 1
> >
> >   Details:     https://kernelci.org/test/plan/id/63a9622ea531ea406a4eee51
> >
> >   Results:     8 PASS, 2 FAIL, 9 SKIP
> >   Full config: x86_64_defconfig+x86-chromebook
> >   Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
> >   Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v6.2-rc1-3-g942956ddbb33c/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/cros-ec-asus-cx9400-volteer.txt
> >   HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v6.2-rc1-3-g942956ddbb33c/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/cros-ec-asus-cx9400-volteer.html
> >   Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cros-ec/20221216.0/amd64/rootfs.cpio.gz
> >
> >
> >   * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/63a9622ea531ea406a4eee60
> >         failing since 125 days (last pass: tag-chrome-platform-for-v5.20-2-gddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)
> >
> >     2022-12-26T08:58:03.276135  / #
> >     2022-12-26T08:58:03.282554
> >     2022-12-26T08:58:03.388160  / # #
> >     2022-12-26T08:58:03.394512  #
> >     2022-12-26T08:58:03.496825  / # export SHELL=/bin/sh
> >     2022-12-26T08:58:03.503528  export SHELL=/bin/sh
> >     2022-12-26T08:58:03.605548  / # . /lava-8472886/environment
> >     2022-12-26T08:58:03.611619  . /lava-8472886/environment
> >     2022-12-26T08:58:03.713741  / # /lava-8472886/bin/lava-test-runner /lava-8472886/0
> >     2022-12-26T08:58:03.720316  /lava-8472886/bin/lava-test-runner /lava-8472886/0
> >     ... (7 line(s) more)
>
> The test failure is fixed (see
> https://github.com/kernelci/kernelci-project/issues/145) and the test
> passes if using the newer rootfs
> http://storage.staging.kernelci.org/images/rootfs/debian/bullseye-cros-ec/20221220.0/amd64/rootfs.cpio.gz
> (see https://lava.collabora.dev/scheduler/job/8495311).
>
> >
> >
> >
> > platform                     | arch   | lab           | compiler | defconfig                    | regressions
> > -----------------------------+--------+---------------+----------+------------------------------+------------
> > hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-chromebook | 2
> >
> >   Details:     https://kernelci.org/test/plan/id/63a96241a531ea406a4eee74
> >
> >   Results:     6 PASS, 2 FAIL, 11 SKIP
> >   Full config: x86_64_defconfig+x86-chromebook
> >   Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
> >   Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v6.2-rc1-3-g942956ddbb33c/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
> >   HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v6.2-rc1-3-g942956ddbb33c/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
> >   Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cros-ec/20221216.0/amd64/rootfs.cpio.gz
> >
> >
> >   * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63a96241a531ea406a4eee85
> >         failing since 125 days (last pass: tag-chrome-platform-for-v5.20-2-gddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)
> >
> >   * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/63a96241a531ea406a4eee87
> >         failing since 125 days (last pass: tag-chrome-platform-for-v5.20-2-gddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)
> >
> >     2022-12-26T08:58:25.697945  / #
> >     2022-12-26T08:58:25.702857
> >     2022-12-26T08:58:25.804437  / # #
> >     2022-12-26T08:58:25.808936  #
> >     2022-12-26T08:58:25.909898  / # export SHELL=/bin/sh
> >     2022-12-26T08:58:25.914703  export SHELL=/bin/sh
> >     2022-12-26T08:58:26.015602  / # . /lava-8472865/environment
> >     2022-12-26T08:58:26.020241  . /lava-8472865/environment
> >     2022-12-26T08:58:26.121144  / # /lava-8472865/bin/lava-test-runner /lava-8472865/0
> >     2022-12-26T08:58:26.125612  /lava-8472865/bin/lava-test-runner /lava-8472865/0
> >     ... (7 line(s) more)
>
> Ditto.  They're fixed by using newer rootfs (see
> https://lava.collabora.dev/scheduler/job/8495361).
>
> >
> >
> >
> > platform                     | arch   | lab           | compiler | defconfig                    | regressions
> > -----------------------------+--------+---------------+----------+------------------------------+------------
> > hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-chromebook | 2
> >
> >   Details:     https://kernelci.org/test/plan/id/63a961f6842d5d29404eee1a
> >
> >   Results:     6 PASS, 2 FAIL, 11 SKIP
> >   Full config: x86_64_defconfig+x86-chromebook
> >   Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
> >   Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v6.2-rc1-3-g942956ddbb33c/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/cros-ec-hp-x360-14-G1-sona.txt
> >   HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v6.2-rc1-3-g942956ddbb33c/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/cros-ec-hp-x360-14-G1-sona.html
> >   Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cros-ec/20221216.0/amd64/rootfs.cpio.gz
> >
> >
> >   * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63a961f6842d5d29404eee2b
> >         failing since 125 days (last pass: tag-chrome-platform-for-v5.20-2-gddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)
> >
> >   * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/63a961f6842d5d29404eee2d
> >         failing since 125 days (last pass: tag-chrome-platform-for-v5.20-2-gddffaa3d76750, first fail: v6.0-rc1-11-g48a86d3e4836)
> >
> >     2022-12-26T08:57:12.140812  / #
> >     2022-12-26T08:57:12.147914
> >     2022-12-26T08:57:12.254040  / # #
> >     2022-12-26T08:57:12.261111  #
> >     2022-12-26T08:57:12.363771  / # export SHELL=/bin/sh
> >     2022-12-26T08:57:12.370595  export SHELL=/bin/sh
> >     2022-12-26T08:57:12.472759  / # . /lava-8472873/environment
> >     2022-12-26T08:57:12.479678  . /lava-8472873/environment
> >     2022-12-26T08:57:12.581741  / # /lava-8472873/bin/lava-test-runner /lava-8472873/0
> >     2022-12-26T08:57:12.588084  /lava-8472873/bin/lava-test-runner /lava-8472873/0
> >     ... (7 line(s) more)
>
> They passed by using the newer rootfs (see
> https://lava.collabora.dev/scheduler/job/8495378).
>
> >
> >
> >
> > platform                     | arch   | lab           | compiler | defconfig                    | regressions
> > -----------------------------+--------+---------------+----------+------------------------------+------------
> > rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfig+arm64-chromebook   | 2
> >
> >   Details:     https://kernelci.org/test/plan/id/63a964df3d24038af94eee56
> >
> >   Results:     4 PASS, 2 FAIL, 12 SKIP
> >   Full config: defconfig+arm64-chromebook
> >   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
> >   Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v6.2-rc1-3-g942956ddbb33c/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-ec-rk3399-gru-kevin.txt
> >   HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v6.2-rc1-3-g942956ddbb33c/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-ec-rk3399-gru-kevin.html
> >   Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cros-ec/20221216.0/arm64/rootfs.cpio.gz
> >
> >
> >   * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63a964df3d24038af94eee66
> >         failing since 116 days (last pass: tag-chrome-platform-for-v5.20-2-gddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483)
> >
> >   * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/63a964df3d24038af94eee68
> >         failing since 116 days (last pass: tag-chrome-platform-for-v5.20-2-gddffaa3d76750, first fail: v6.0-rc1-18-gf36a064d1483)
> >
> >     2022-12-26T09:09:30.339531  / #
> >     2022-12-26T09:09:30.342450
> >     2022-12-26T09:09:30.450879  / # #
> >     2022-12-26T09:09:30.454025  #
> >     2022-12-26T09:09:30.454912
> >     2022-12-26T09:09:30.558284  / # export SHELL=/bin/sh
> >     2022-12-26T09:09:30.561999  export SHELL=/bin/sh
> >     2022-12-26T09:09:30.665642  / # . /lava-8472977/environment
> >     2022-12-26T09:09:30.666550  <6>[   29.514350] mwifiex_pcie 0000:01:00.0: info: FW download over, size 638992 bytes
> >     2022-12-26T09:09:30.669090  . /lava-8472977/environment
> >     ... (12 line(s) more)
>
> rk3399-gru-kevin crashed for now (see
> https://lava.collabora.dev/scheduler/job/8495436) but I would suppose
> test_cros_ec_gyro_iio_abi and test_cros_ec_accel_iio_abi are fixed by
> using the newer rootfs.

Just relaized the reason of crash because rk3399-gru-kevin uses arm64
rootfs: http://storage.staging.kernelci.org/images/rootfs/debian/bullseye-cros-ec/20221220.0/arm64/rootfs.cpio.gz.
The tests passes after using the newer rootfs (see
https://lava.collabora.dev/scheduler/job/8495601).

>
> >
> >
