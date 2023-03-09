Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9625E33C0
	for <chrome-platform@lists.linux.dev>; Thu,  9 Mar 2023 10:30:29 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id u3-20020a17090a450300b00239db6d7d47so1632140pjg.4
        for <chrome-platform@lists.linux.dev>; Thu, 09 Mar 2023 02:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678357829;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Dxt4eWA+7K9WGazvtnncexC57TlTZ6sxB1OM6xi1J7g=;
        b=SfYMBpvVaeuwC8FDfeNZZ1WLxzqhE4FHOHrpuf/IasznwzEByFyd8jXBu+UDMFp00v
         J2gyGmW2vjYXXxbVWImqEFQDcLwcUNfBi7lR1/o8sFFSWnRf6FoVpQYpeV1n099XUyCh
         mZjxDp8HaRbUARa7I7K0DWo+gZKHkMo9klPnZ1CJsa5FjM1Z2Iqdn8y51kb/QzVlSLPb
         cYqAitFjR7dMepNsvqhEGK5JzmS7sSyG1dFUtvbLhSPrW4snKvXiMafFK3zqkA2NkWFY
         AHvWpnPugJKQQyEb0Va86Misdshnog2DyTF0YUiVWetSWjuHkjJjI6ssKNeTDekhXIY/
         Uc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678357829;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dxt4eWA+7K9WGazvtnncexC57TlTZ6sxB1OM6xi1J7g=;
        b=Ojf5W7YcZ3HFgtcZXeNNLFcLkHRPPAWu7KmPdx3iQZg57QLyvTxveLxWDra2JQEvwt
         3MEYhVoHD2b6/FLsKaQU2kyLWd2aHERB+B2YoEP19m5TfL75nQ5Mxn4o7KfZQyOrDEBc
         CHFGvwz/w8FWOsPN9R13CbBWu3dY/zMMBIhYV2oU1XJmoFEUtBqliCd0+WmkT1oDk7cy
         2BhRW9hVUH2CG/i6jk223W8SXNKC3toDvma6fU9fb7guCPW6aafRzvAOPmbLfK4Qa9mi
         qMzkIbMUsoEvkPou+OXxFDtDI6eqjw/7PizJDBCUuPvPrlTHHDmam34eH0UdxhaX46gh
         xDRg==
X-Gm-Message-State: AO0yUKWIfkugDmcE0QQj25tM7WgRQTZzCD7vaJM80SVdL0K/UcQbcVGV
	7UQqxprldUvHbzmK6/tMAFq2gA==
X-Google-Smtp-Source: AK7set9r4CLcWlkbo4cju1hbNIXumhpamsyLNu0Vc9Bm2n57iov/tgvwoDRsKZmOzKF+YHOEy+aT3Q==
X-Received: by 2002:a17:902:ea8a:b0:19e:6b05:ad3a with SMTP id x10-20020a170902ea8a00b0019e6b05ad3amr21030072plb.64.1678357828998;
        Thu, 09 Mar 2023 02:30:28 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w14-20020a170902e88e00b0019e88d9bed3sm11271999plg.210.2023.03.09.02.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 02:30:28 -0800 (PST)
Message-ID: <6409b544.170a0220.71437.458f@mx.google.com>
Date: Thu, 09 Mar 2023 02:30:28 -0800 (PST)
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
X-Kernelci-Kernel: v6.3-rc1-2-gdb7df0cfaff3f
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci cros-ec: 12 runs,
 1 regressions (v6.3-rc1-2-gdb7df0cfaff3f)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 12 runs, 1 regressions (v6.3-rc1-2-gd=
b7df0cfaff3f)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.3-rc1-2-gdb7df0cfaff3f/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.3-rc1-2-gdb7df0cfaff3f
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      db7df0cfaff3ffe5c125f8b79bcd54a4ad163b37

  Test suite revisions:
    cros-ec-tests
      URL:  https://github.com/hardboprobot/cros-ec-tests.git
      SHA:  f6c0dbf63842d5751000c5527808aca38354db55 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/6409b08dc8bc049b0f8c8660

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-e=
c-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.3-rc1-2-gdb7df0cfaff3f/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-e=
c-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230303.0/armhf/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/6409b08dc8bc049b0f8c86=
61
        failing since 3 days (last pass: v6.2-rc1-35-g75a273974d7a, first f=
ail: v6.3-rc1-1-gad79d30ce40d) =

 =20
