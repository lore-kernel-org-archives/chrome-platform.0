Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2A94A0A
	for <chrome-platform@lists.linux.dev>; Wed, 13 Jul 2022 20:03:16 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id o15so13651999pjh.1
        for <chrome-platform@lists.linux.dev>; Wed, 13 Jul 2022 13:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=dmIdnNOb6BbQjd1iFmpBZrCaoyD3Fw/rU/vlarvK2Pw=;
        b=xMURspd9/tm3gse3nVD9mNkw8Mk02FuPUNFQ6C0UIHrzgXq1nQlKDJ8T6mvkh4xZGz
         652l7BUv82nV5KV4DTq80OJndSpCEaloChGssnbZ++UpqyNZ/LJv1YNT8p46RkvcDzo1
         wRwayFRr2zfx62uhRAbZryMXqE40uS/s0/xTSWpTWhfOP86iwsCELwpEL7FxQJQBGPyP
         drng6Rw1giEC00CSgGCJnEESePKpIsUWG5H0iZaWga+mZDX4m/y+ZDU0fc8UA03Y40aH
         Jg7q8vNqKWnCDqxur+CHV88gtPzzfLSfTq6w8q+ugzHo5sAnP8SVA4End/GlevDZYpcM
         aR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=dmIdnNOb6BbQjd1iFmpBZrCaoyD3Fw/rU/vlarvK2Pw=;
        b=8MuWCOgvA36olQkZrDl3CXX11ayrpZkv2ZH1TGLsaMbZa+T1ZbTrfrxjVgZ15rLj71
         Ir2+32ra4KfN7N0u9n9nI22D/Trcx1Qr+ldW5Mj4kTs67vFvwuA3QwPn5bg07z5UPU30
         CMe1CI5LE0Lub4BJ4gFa9egCe4KgLKHJEXTsgsUoSX0mEjv6SC25xmFH1APOB+TtUjy3
         8wPJnRKc4x4dQBLGw48IeXRIIyWgW2BQIE9UbERY/wPSlKjsPtIsWp2ST10YKsvUhH4x
         bRh6yzgohZP3upLnR8yZHGxcGgub9I9KeFoXOzQVWbPpATIXGxqhPiU6AhA7wGrQQM3B
         d8mg==
X-Gm-Message-State: AJIora+Cc2HzLTQc2zW0+JMmb4hXVXGWXnnbIvfxdUf5tDixk07zqbnG
	b83664gCJiNjedmaeqt9jhhtpLNnXfolwAwTNOM=
X-Google-Smtp-Source: AGRyM1v4jPjP9JoKc+lGHUEqzSqTZrk8F8HpnFuefJXEISEPrrLcDsY3LTnOnwbPrSg2W1px3IkApA==
X-Received: by 2002:a17:903:2d1:b0:168:e83e:dab0 with SMTP id s17-20020a17090302d100b00168e83edab0mr4672590plk.118.1657742596115;
        Wed, 13 Jul 2022 13:03:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o12-20020a170902d4cc00b0016c433f7c12sm7297481plg.271.2022.07.13.13.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 13:03:15 -0700 (PDT)
Message-ID: <62cf2503.1c69fb81.2387d.b46e@mx.google.com>
Date: Wed, 13 Jul 2022 13:03:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc1-39-g5ffc0821f4df
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci sleep: 5 runs,
 1 regressions (v5.19-rc1-39-g5ffc0821f4df)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci sleep: 5 runs, 1 regressions (v5.19-rc1-39-g5f=
fc0821f4df)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.19-rc1-39-g5ffc0821f4df/plan/sleep/

  Test:     sleep
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.19-rc1-39-g5ffc0821f4df
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      5ffc0821f4df12a904643030172476b7f537508e =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/62cf17307a4b232d62a39bd3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-39-g5ffc0821f4df/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-39-g5ffc0821f4df/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/sleep-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220708.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/62cf17307a4b232d62a39bd4
        failing since 18 days (last pass: v5.19-rc1-35-g412b193d93912, firs=
t fail: v5.19-rc1-38-g15288cf9f149) =

 =20
