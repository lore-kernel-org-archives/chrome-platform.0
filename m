Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20461538C
	for <chrome-platform@lists.linux.dev>; Thu, 28 Sep 2023 07:36:24 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-68bed2c786eso10153657b3a.0
        for <chrome-platform@lists.linux.dev>; Thu, 28 Sep 2023 00:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695886584; x=1696491384; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5CrEEpUgyB0bQm1LwUVQDss4W2aDViZ0GGL/Dx00CLU=;
        b=WbWMMB7lkyRufYj5Y1CvMzDlVjLE4dSZYDr/ZgGPj0cUfcPBVA3rzzOZnPqkSvIOh/
         F8kxfcdyJpqHxj/DKh8V6Tkt/+8b5etVa2sSTlq86nsAKoGdTnTQGyqaHwUqUu/UeJOX
         hJ2qdAYsqNuMM5wsg/CIzN351O/5tgw6kVEzA5RhaBdlq37XwxL5YTFX4GuA36jEJuNw
         +D8Ki6dXY99hW3AV9wgQaVYmYjQapCxRA1skIqarIBDQlzwrfnNBxsX1gemZJ8eF6b1s
         IbK4WwbteV6PrT56MzJRYW2lVHrQcrgdWjy1Sk7Z0oJzHOFCn59eu38jU20pM5twzliB
         +Vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695886584; x=1696491384;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5CrEEpUgyB0bQm1LwUVQDss4W2aDViZ0GGL/Dx00CLU=;
        b=gFywr6rOK6zt0DVH7sCJyOjGP2FzwEQfLvmszzIhHR0GBw3EP+7fE0RzPlcf1psL68
         Eb/Ae1qEk7MXwaeUdqJYqeroLgXs8tlHMOdYED/EnMptduIy8XQedGLniTNWfw7/9Jy8
         hWgruymKdJGaQNkxMfSsAA2Srspp2hl+2fnDrMhw0BX6dIR7L4EH4JhnX3v4v7as+nAo
         zRB115OJl2cXI2fxfcKvOsvagUWniyjr8lUGMSVGikiSU5ZeeQ74ZZr39EpirO4NXGzI
         XvbUwyUuBflOIoQPWdHfMSJWYCZeoILW+Abz/LvzAGpM1j+b/kS8UBsNNgPXQ38TlA5e
         Qm0g==
X-Gm-Message-State: AOJu0YxoloM48gS4cE+wl4f8CogGJaernPnjg1W4mjpQMdw//DV/DDal
	fYYuYrr9Ew4UO89eRetiqAHzww==
X-Google-Smtp-Source: AGHT+IGfTCw7emYOwz/c7XMWl4ghIc85rVxsdS462qhtQrqZCAwp8xl4LVPeOG10y/iWkiguVM0/HA==
X-Received: by 2002:a05:6a00:1828:b0:690:d008:8cfc with SMTP id y40-20020a056a00182800b00690d0088cfcmr391347pfa.32.1695886584344;
        Thu, 28 Sep 2023 00:36:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id f15-20020aa78b0f000000b0068fcc7f6b00sm12666994pfd.74.2023.09.28.00.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 00:36:23 -0700 (PDT)
Message-ID: <65152cf7.a70a0220.bd630.35b2@mx.google.com>
Date: Thu, 28 Sep 2023 00:36:23 -0700 (PDT)
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
X-Kernelci-Kernel: v6.6-rc1-13-g7396a5b980fd
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci cros-ec: 9 runs,
 1 regressions (v6.6-rc1-13-g7396a5b980fd)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 9 runs, 1 regressions (v6.6-rc1-13-g7=
396a5b980fd)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.6-rc1-13-g7396a5b980fd/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.6-rc1-13-g7396a5b980fd
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      7396a5b980fdeb2cb97136db45405b4fb5d21dfc

  Test suite revisions:
    cros-ec-tests
      URL:  https://github.com/kernelci/cros-ec-tests.git
      SHA:  fad9423ae3c64bfd48c207de34a1177000d45fa8 =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/65151969d49d2fa5848a0a63

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-13-g7396a5b980fd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.6-rc1-13-g7396a5b980fd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-=
collabora/cros-ec-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230623.0/amd64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/65151969d49d2fa5848a0a=
64
        new failure (last pass: v6.6-rc1-1-g1aa8df90f456) =

 =20
