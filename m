Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F19628
	for <chrome-platform@lists.linux.dev>; Tue, 24 May 2022 02:40:36 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id ob14-20020a17090b390e00b001dff2a43f8cso842772pjb.1
        for <chrome-platform@lists.linux.dev>; Mon, 23 May 2022 19:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=vFwUW25lppZ6ubrRrS2YumoNoZolm8AF3iQRxvjwr/c=;
        b=ODGGM/qdUpUmOh4SQCugxQ7rPaKZFLWYAWLhAK4jx9hDT4znwVIETiggzE52+4vrIV
         glllScFfCS98R4izNu8Wk7ljZ2FYjPPGONa5iZ+o9kxEivhP0pbhf83C66o0S7HVBK8w
         8QRDTJnMMefiOuGgdl/ph12I9e1u7IQRe+0om2fAtmc4QEckmCf7iDnEg9pxvyBSDQVn
         1bPhZHyG5ABe8pUKLCFq8uw5maLBNyU/jwbgs/HK5gCALMxdTJLmVX/RhZvoC5wJGP1p
         yN5KYtqKlZZu0oaVsP3D+XVtcdjonS5Aa3ApfJsfl3Wa7n+Et6C4+CGWzHYHsZ9ZlLZk
         7ZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=vFwUW25lppZ6ubrRrS2YumoNoZolm8AF3iQRxvjwr/c=;
        b=6BHzPvi57VSlCebi2gamW8WnMeM5tWFQtQQaL147vtt3qN9iacxurcPJPDj5c++qG4
         fK4373nbebI9PaQB1axovPMBWXIuUMSOieIhPMSl/Ah3wFpiNnArnyRPgayOqdc2GdMe
         myarV9376EosEu3hf6jAlQpJcuAFtBzqFBM/WHDEhW7ickDgyd/X62G+PShknRiaFTig
         GQb7V7+4J23/vQAzxmkBhQbk2QU+N0D53NpQ9vHHAII/Cqfe0DsHbP0JYCaGBxVZSd6O
         25t9mAjOKaE5sT0dYFRUODG2fSIqRFi1WzDyHVvaellu82Fe9vIrVH1wBoHJHQL1+wOv
         JVFg==
X-Gm-Message-State: AOAM531DN9jNXt2G8qbNNwcftwG7f3HVENoT5C1QTn0EEqRf8T4xBB5T
	tkKSoE6FGqn5UHpU4rmjReAQag==
X-Google-Smtp-Source: ABdhPJw9QdyUtG2xXwZKQIe4P6bjjid0dvePzOq49XqWbjFtRotDFbRj3mH8n84mDUpiwBhdTIUjYQ==
X-Received: by 2002:a17:902:b413:b0:15e:e6a8:b3e with SMTP id x19-20020a170902b41300b0015ee6a80b3emr25466769plr.24.1653360036510;
        Mon, 23 May 2022 19:40:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id iw17-20020a170903045100b0015e8d4eb2dfsm5774720plb.297.2022.05.23.19.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 19:40:36 -0700 (PDT)
Message-ID: <628c45a4.1c69fb81.bd976.dd74@mx.google.com>
Date: Mon, 23 May 2022 19:40:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.18-rc1-24-gc2d7e384924d
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci baseline: 92 runs,
 1 regressions (v5.18-rc1-24-gc2d7e384924d)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 92 runs, 1 regressions (v5.18-rc1-24=
-gc2d7e384924d)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.18-rc1-24-gc2d7e384924d/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.18-rc1-24-gc2d7e384924d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      c2d7e384924df85db92e45390ef0c00f2b89d9c2 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/628c3a8362fa0b6a19a39bf8

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.18-rc1-24-gc2d7e384924d/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.18-rc1-24-gc2d7e384924d/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/628c3a8362fa0b6a19a39c1a
        failing since 48 days (last pass: v5.17-rc1-10-g0ef49b25b7cc, first=
 fail: v5.18-rc1-1-gbf84b10d9901d)

    2022-05-24T01:52:55.714200  <8>[   32.237568] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-05-24T01:52:56.743469  /lava-6452639/1/../bin/lava-test-case
    2022-05-24T01:52:56.753311  <8>[   33.278098] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
