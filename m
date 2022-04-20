Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BBB1867
	for <chrome-platform@lists.linux.dev>; Wed, 20 Apr 2022 18:27:50 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id k14so2422977pga.0
        for <chrome-platform@lists.linux.dev>; Wed, 20 Apr 2022 11:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=s8W2WMO9LZtC/5T6sqFvaYzb1kKsPHdQqKFjxE2dgXo=;
        b=OqNPf54wT3N+6fYEMn/A2PHtc3SLCQ6CtMvDSzC4JbtvRtmgs+b88TtBPMChP56z2C
         KsvjtjzDPwCZIpCvhi0gme4NHMI/rJ9KZMZVKc6HuZK3CSrDF0Ae+stkujbEywPGdCnJ
         VTDbDEhAJ+LGgvkIYuCFWnfMv/zFlLdTRiizOHDvnhQXir1fnGInp76iPF6pNxuG3Nyp
         J1744N1/keMRwX4Ge8ik9A+1VX/+HqCWOAHM39RlID9wfyHgzTTivdWfA78cNq0cOoS2
         EVEkTUP42Oi4RKyvG6gvEy/laFfQKYiPqQimDy7QiOeOse9LYnnEsoceVVhPO+NXyk7i
         nyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=s8W2WMO9LZtC/5T6sqFvaYzb1kKsPHdQqKFjxE2dgXo=;
        b=l+EqWFSFIsyaJGH/a4m4yNTP6UiCO7ucTXRsXqY1dKAQQy+afM3dlayRpn0JDli++4
         sb+NzKSa7dYQipu1bokhl6W5JRu1Teb3d45CeH0dBGqnFtECzoASSLNTZxkhOgHiIQqE
         8U0Dq3c6u3mtDTAkCKbI/fPpeWySGYae/s2CCHO9K4Ayf7HiCW+coj2B/e+FRK0g5ooa
         Lmd7/MJP+0jqBWSdAGzbrAWanIrVXi5GY+wMHsNffDS02K7EBIYPg+Oiljq306sAqmmz
         dqbtEhshRpd2Ca6WiczL9NUzrDI2c1O004WCNo/U6ZYnCiGAZNxyyXw5OqX1rw7DAfkg
         8+xw==
X-Gm-Message-State: AOAM532qtEJNKKeWwLtucl2Y86YJd2BKdYxv5rHy06pbMy0ICzP5AJJI
	Z1IYZtrBjJgVKvgW4yhePzR+5g==
X-Google-Smtp-Source: ABdhPJzh7JNhnQ+gd1NpaKQYfys8tUqGnubK98L0BC1J5Kdvv6QqXGsnPj+JbQO6ggu/ja24rPtudg==
X-Received: by 2002:a62:ed0e:0:b0:4fa:11ed:2ad1 with SMTP id u14-20020a62ed0e000000b004fa11ed2ad1mr24892362pfh.34.1650479270011;
        Wed, 20 Apr 2022 11:27:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b16-20020a056a00115000b004f6ff260c9esm21008189pfm.207.2022.04.20.11.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 11:27:49 -0700 (PDT)
Message-ID: <626050a5.1c69fb81.421af.1a16@mx.google.com>
Date: Wed, 20 Apr 2022 11:27:49 -0700 (PDT)
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
X-Kernelci-Kernel: v5.18-rc1-8-gc881e7385cfa8
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci sleep: 6 runs,
 1 regressions (v5.18-rc1-8-gc881e7385cfa8)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 6 runs, 1 regressions (v5.18-rc1-8-gc88=
1e7385cfa8)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.18-rc1-8-gc881e7385cfa8/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.18-rc1-8-gc881e7385cfa8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      c881e7385cfa84b27f1489446176aff8a9fb3e8c =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6260415acfd11f909eae069c

  Results:     12 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.18-rc1-8-gc881e7385cfa8/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.18-rc1-8-gc881e7385cfa8/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220411.0/arm64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-4: https://kernelci.org/test/case/id/6260415acfd11f90=
9eae06a3
        new failure (last pass: v5.18-rc1-7-g27d5486ca020b)

    2022-04-20T17:17:55.127421  rtcwake: assuming RTC uses UTC ...
    2022-04-20T17:17:55.132714  rtcwake: wakeup from \"mem\" using rtc0 at =
Wed Apr 20 01:25:36 2022
    2022-04-20T17:17:55.148107  <6>[   30.747477] PM: suspend entry (deep)
    2022-04-20T17:17:55.158134  <6>[   30.757443] Filesystems sync: 0.000 s=
econds
    2022-04-20T17:17:55.176964  <6>[   30.771032] Freezing user space proce=
sses ... (elapsed 0.001 seconds) done.
    2022-04-20T17:17:55.186616  <6>[   30.785502] OOM killer disabled.
    2022-04-20T17:17:55.199589  <6>[   30.792708] Freezing remaining freeza=
ble tasks ... (elapsed 0.001 seconds) done.
    2022-04-20T17:17:55.210762  <6>[   30.806259] printk: Suspending consol=
e(s) (use no_console_suspend to debug)
    2022-04-20T17:17:56.127981  <3>[   30.819706] mwifiex_pcie 0000:01:00.0=
: adapter is not valid
    2022-04-20T17:17:56.152085  <4>[   30.921452] xhci-hcd xhci-hcd.15.auto=
: WARN: xHC CMD_RUN timeout =

    ... (11 line(s) more)  =

 =20
