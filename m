Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169281FD8
	for <chrome-platform@lists.linux.dev>; Wed, 20 Jul 2022 07:16:55 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id d7-20020a17090a564700b001f209736b89so1231057pji.0
        for <chrome-platform@lists.linux.dev>; Wed, 20 Jul 2022 00:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=RtXso/NG6/FN6oPZrkQolHGYKiRGHQpV3EneOLH4eF4=;
        b=KulRHJpGyKAqQP/3vNW0RNUAXWI7TCpxE/S/civZfPHjdJtRDjgAC7EXllN4pUT/1+
         K4UwNQVNazhHkQeb+0TBevlngMvegl7fOsO5fvDEBcrgcGoM4sJP8tmAI6pBWkorD5zB
         UgL/RxPVPuGrOCtp2AL8uFnUj38CbgVqVMNUzP7YnFxXPB18uLm0m672uvK49ISKzx9Z
         4jT/o1R14w2lP1Fr1Vx6oIbHS5UCIF2HzmdbI1bUIaAn1peE0DBE2L18ZDPMQWTKHAjH
         INuSyDOYkCwZrhhSuhFLOg44Cku3WTekcT0oz/JamGjUnnLB44IxJ7ooLHV+1jyx7EMt
         y/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=RtXso/NG6/FN6oPZrkQolHGYKiRGHQpV3EneOLH4eF4=;
        b=WjBubZAzdyWgvVN9jDGpyZ01x1ZDeUtb1tKX0XwkQkNR5w6jYqYokgLRSF/VhphhWc
         S3xSp71Qr6w1cCnaRqVRXMh2zAtT6biXNxDFhi+u/42fIz+Q95gYX8/9EGYzXJyrV3K9
         BIMNWZ5OzoMbVTd28tDXvbx6XfFwvPb428X6H1i4MckS3QAudlZGolozB/gb/FBoy54L
         7vzRpSa4oHRYDA4fYnrUaUNvJKp+3X4J8rCM3/ajEtyzcTe/5lSPWyzeMugVle20q58P
         6P8VCrdyg7arrH+8SKzv2V4jN6z8VazaA9g+t0tbGXS2a5UutMTJCcaFzPH9yhHXNY1x
         M6MA==
X-Gm-Message-State: AJIora9/ro3Pen0FVcVN4YzI1ANFWbAY0/7KMyXMqXE0hykNXM2UPa2e
	y3fRrhSaw5DyhaPt/rkJMhh7GQ==
X-Google-Smtp-Source: AGRyM1uui8iVoJrarb8EpebLQ3Ky876U3RwFlJD0cKJ77A4e7/huj5LnRiXlZo5K3T8toFRzc+wx1g==
X-Received: by 2002:a17:902:a513:b0:16c:e25e:16b with SMTP id s19-20020a170902a51300b0016ce25e016bmr19460516plq.86.1658301414508;
        Wed, 20 Jul 2022 00:16:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id mz21-20020a17090b379500b001efc46f7eaesm841151pjb.5.2022.07.20.00.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 00:16:53 -0700 (PDT)
Message-ID: <62d7abe5.1c69fb81.ab190.16bf@mx.google.com>
Date: Wed, 20 Jul 2022 00:16:53 -0700 (PDT)
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
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc1-58-gad1e2226017a9
Subject: chrome-platform/for-kernelci cros-ec: 10 runs,
 2 regressions (v5.19-rc1-58-gad1e2226017a9)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 10 runs, 2 regressions (v5.19-rc1-58-=
gad1e2226017a9)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =

tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.19-rc1-58-gad1e2226017a9/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.19-rc1-58-gad1e2226017a9
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      ad1e2226017a9e56e242029f834a2cfc14f6fa83

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  86181a7fbd379fc42314c450740d2cea8cdf04c1 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62d79ffd63fc88238ddaf05c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-58-gad1e2226017a9/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros=
-ec-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-58-gad1e2226017a9/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros=
-ec-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220716.0/armhf/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/62d79ffd63fc88238ddaf0=
5d
        failing since 44 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc) =

 =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62d79d20099547a0d7daf076

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-58-gad1e2226017a9/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros=
-ec-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.19-rc1-58-gad1e2226017a9/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros=
-ec-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220716.0/armhf/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/62d79d20099547a0d7daf0=
77
        failing since 44 days (last pass: v5.18-rc1-24-gc2d7e384924d, first=
 fail: v5.19-rc1-5-g4a0e708bb23fc) =

 =20
