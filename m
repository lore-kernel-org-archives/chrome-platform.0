Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F938167264
	for <chrome-platform@lists.linux.dev>; Wed, 29 May 2024 07:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716967778; cv=none; b=Qx4Rr1vqZ3TbPNzBU/hIehjPaFW1gNDbbYhfiEbcS805e3F3MMx2TGLmYoVawwklVNrK4dziZqHAz7YW5Jfc7igvdQziz+791GbXMjNhmW0p6HQ3XZOXChQZcpGEfGXL7MmrKoUsRHWuZ0LZwczkqC2lHGQ3ZkcrBuDZkYDk7y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716967778; c=relaxed/simple;
	bh=FAL92x7WUETgG420LwjVesJ4uHVF87g/a1XmXf3uJVQ=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=kv+q3reywx1FwUkSccbNEy0fQ/Yju06NaYtFB/5EGAxT6G/igwIaGNfJiiRlY9n2V4PZ6DvubftIKN4qXesYRKGegPLNwGiGs++t+urItRFTlAhcBOlMjY4A2BszUBqDssyN8nAsVlvCJNdVIcetTAmqJagW3VaXgHFTGrxwbK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=vCtnXeY0; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="vCtnXeY0"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-6b92f31c56fso360312a12.2
        for <chrome-platform@lists.linux.dev>; Wed, 29 May 2024 00:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1716967776; x=1717572576; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lT7DNnLB318c1J6elsIpLF5lQFTclYfLSEryNsgZpig=;
        b=vCtnXeY0hX6zQ+GLyE3ijFbJq0I41yCHmQmodui83lJQcRI65uLNghfbbEFIMRc9NV
         JmhOOQqDv4Kp0prQzItA8ESf2AKuCj5aIEeDcF4FfpWI5PZgppfLGKy7Vxpe7+lOd8Sc
         WB+IekC03y5u6FfFOpyL39RLjCg4XoDXeZO4EvM2kc72WmQpQsDPWERNW+3lAPI2f6kf
         0QaTqnX5f2U9j6kvbB/ei7lYaJYPoBP3MkEIX1JGZZGTyrfnQpXdehtPK+jA+WH0Qk63
         FUhH19o6WgIzMtQgQg0YyMQbwityAKI/VtODG4L6QTU05EJrlm28G3Jhyn4qAeiS0jBp
         MLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716967776; x=1717572576;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lT7DNnLB318c1J6elsIpLF5lQFTclYfLSEryNsgZpig=;
        b=kadNkbXYORylCX60UDeOkbvWTt0YsFBwryPRj0ddORE1lcpU/Tu9HQeYckcObEUBRl
         sGtK1w6S0RfnO8S8QCtwKoEmJucYa8Lgh7mavTcYmNJ0j1K+d2vMyC+7gFhO4i1jqwb9
         REH7gdCnAmLj9yfJqmr0lwt5d8qgoSlhF8rtjTGmQpQR98tfTlyX7hrtAkZW3uiFP0aG
         64RvBEcj76g1Be2laJuFZ/MQgJDIYWc0l65/GUL/GKesKd/nMPTArwvALHU28HbPUG4q
         mMD9K3tGxeVkBkIdcqN8QbG/lopkqrIH4tOtx088OhbcKoc33zfIDw/2iOxzuZPkNk1C
         wPiw==
X-Forwarded-Encrypted: i=1; AJvYcCWMP2yrViPKMHq3g2LdA/adxC4SeqZpy8IFsnYMxBJGLfBdWXKWO4ttvh1rFP7hAOmAlvNq2PHXJA5AWZiT3AdVcqQPjLrh4xoG/U63zmVZ
X-Gm-Message-State: AOJu0Yx24vGgd9iJ6jdpEuThwTglHC/WWWKotQ4Hnaye4vWNhrHFm7Br
	VsPaZC2Xy98Foo4tqZ/dqETnlkw7VLNmZrmdoSY9UeWG2hbhTiAw5Y4ZbIZ3wJY=
X-Google-Smtp-Source: AGHT+IEi8lIlRga/o+WCXc26QOKqtMcppkbhB0ToPvwbYVl80HjZmfYrJxjJZ/2r+bD8xhcElHk7Mw==
X-Received: by 2002:a17:90b:30c1:b0:2b2:7e94:c62f with SMTP id 98e67ed59e1d1-2bf5e16eb19mr13753284a91.15.1716967776350;
        Wed, 29 May 2024 00:29:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bf851d76fdsm7173466a91.44.2024.05.29.00.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 00:29:35 -0700 (PDT)
Message-ID: <6656d95f.170a0220.7b0e5.19dc@mx.google.com>
Date: Wed, 29 May 2024 00:29:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-4-g7b44d5381e541
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci cros-ec: 10 runs,
 2 regressions (v6.10-rc1-4-g7b44d5381e541)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 10 runs, 2 regressions (v6.10-rc1-4-g=
7b44d5381e541)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.10-rc1-4-g7b44d5381e541/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.10-rc1-4-g7b44d5381e541
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      7b44d5381e541de3da3cee2e948456b250f41f25

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


  Details:     https://kernelci.org/test/plan/id/6656c7891db342aea67e70ce

  Results:     2 PASS, 1 FAIL, 13 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-4-g7b44d5381e541/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-4-g7b44d5381e541/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_chardev: https://kernelci.org/test/case/id/6656c78=
a1db342aea67e70dd
        new failure (last pass: v6.9-rc4-22-g2fbe479c0024e)

    2024-05-29T06:14:16.085902  test_cros_ec_chardev (cros.tests.cros_ec_mc=
u.TestCrosECMCU.test_cros_ec_chardev)

    2024-05-29T06:14:16.092889  Checks the main Embedded controller charact=
er device. ... FAIL

    2024-05-29T06:14:16.093316  =

   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                  | regressions
-----------------------------+--------+---------------+----------+---------=
-------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6656c9cf1b9ecf55d17e7073

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-4-g7b44d5381e541/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.10-rc1-4-g7b44d5381e541/arm64/defconfig+arm64-chromebook/gcc-10/lab-colla=
bora/cros-ec-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/6656c9cf1b9ecf55d17e70=
74
        new failure (last pass: v6.9-rc4-22-g2fbe479c0024e) =

 =20
