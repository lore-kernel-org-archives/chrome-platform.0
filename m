Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AF515666F
	for <chrome-platform@lists.linux.dev>; Wed,  3 Apr 2024 23:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712186522; cv=none; b=exVSxdUgGMdOLMJlBbH9yYjgi9DhppXc16b+KyKV2aVGdD7G8sWKdtL443unONGr3I+k/VkREOe3ABrAxo9+SEO5vnNEZMGPLLj6swBK30rzirF3HMUXk1nAnGwN0TrJ6ZrEK9uv0oOPbcvEf+knEI4MjeOnRwtUssfFVzn3RsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712186522; c=relaxed/simple;
	bh=fjmJH9zAnHYbEr3kJ16SkuUQ2khKTzDLCy+TP9fIis0=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=IBNXtuBdh1loQon0nAj6Xan0K6IEEwQ1Qnzv1T2pTp/KqlEGUPhB2HOE4ysIgqqwjA4ArSFJr190ePcW/GJYGbMrzKePsHPA1OszA/JDKR+0Kg+Oqze68C1/+2iY5zb18nGi4XEt+FX6+1YCUg4dIVTAvY0LBKqYJ66mypUOZd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=i2AxtZiB; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="i2AxtZiB"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6eaf9565e6bso247790b3a.2
        for <chrome-platform@lists.linux.dev>; Wed, 03 Apr 2024 16:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712186520; x=1712791320; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mrU50FZo+PgCEIFF7JrsvsSF41hiJzcLop7Lrf2IDjk=;
        b=i2AxtZiB/L0PYQUsK2syeuAdOwJ1CkPbssog3T5noxvQzsGf3CYnjNXGyEZJ/v9WXG
         TKRgpizsM2av2UeVKcf8Ys86UTw1dKcj6wyLy0syIBw5nYKsQIlJ+UC9/GVuyiunbJOm
         PV6UMngY3WHJXtdzRYvHwBt3+x45EL3U/a3djvbWMgc8GBCUpup3cF/gPwoKsCHUOnrh
         6jSXnsPwbZ1UAsJ/Cex1LRDLZf1fQB612oiYzUPIQfIWwLtlW/RQd2HRi9lBCUsvMYPM
         gQicHDhnq2O49FeqZyv53j0zua60iulBius+E/rfu8C42iM+ALRpdEbKOisjuvlHTGdb
         bAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712186520; x=1712791320;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mrU50FZo+PgCEIFF7JrsvsSF41hiJzcLop7Lrf2IDjk=;
        b=A0xbTrcSwVJW4qqB8d71U/vnRSGtQUp86vv0jnNysig4VGhssXGVd79IBKxyYkFsUe
         ONW0LDE/B8Q6pWBZHegKTY7UgVGngsstnrVb9bp0OjLVVRvAIoT1tLTF5NZ78eH45gzk
         SQH380DI5AE8aP3UWnSwAjUHqZWq7x3Nc2PCLXfOYUMqug0yWQ8yicoo3rFb+sNrJPEM
         o88oAr1JGqYuDRugSPqoV8taFOFs7xSLFgs/a1kVVPRPlSAt5Qb6F60QWtJamzP2Km4Z
         YuSjS830KXuoEZwobv9xszyFsI0ju7dJOGQBCCclpkGLTKQ/rQ8Ihe4rXYUD1k7andXI
         wYag==
X-Forwarded-Encrypted: i=1; AJvYcCXD6ydC+H4y1GiKqmdqkg75BUkBlr5ZxrvzyDERoqZqZ+bNq2dZ2H+yLi5Igb+HQCXdyMd6JK7ypfTHOUVlyPBS11tT3j0HV3ivznkrFiEA
X-Gm-Message-State: AOJu0Yy5ZA5AvsrW+cSArj2FT0x+mdHSc7GdUD+AbzYz1xu50aRw0Xj4
	EFW0sUq+FzvVBcDpNYCu2hO1mBJEbWol+4f+GvHGw0fGakVAkHrkhhUELay4ho0=
X-Google-Smtp-Source: AGHT+IE3rK9xUX+Q0IEcJN7OEUDQRRBrcVvRaBwiwmWcCCjeVDORHRCAE6uN85h1jNijhYchi0bioA==
X-Received: by 2002:a05:6a20:5486:b0:1a3:c4f4:5bb3 with SMTP id i6-20020a056a20548600b001a3c4f45bb3mr1172275pzk.4.1712186520231;
        Wed, 03 Apr 2024 16:22:00 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id cc10-20020a17090af10a00b002a0981a7af5sm252104pjb.32.2024.04.03.16.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:21:59 -0700 (PDT)
Message-ID: <660de497.170a0220.8e0d8.1594@mx.google.com>
Date: Wed, 03 Apr 2024 16:21:59 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc1-15-gd91ca83599cd2
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci cros-ec: 4 runs,
 1 regressions (v6.9-rc1-15-gd91ca83599cd2)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 4 runs, 1 regressions (v6.9-rc1-15-gd=
91ca83599cd2)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig+x=
86-board | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.9-rc1-15-gd91ca83599cd2/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.9-rc1-15-gd91ca83599cd2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      d91ca83599cd2c0ec3f7638a5e8ee712102d8fc2

  Test suite revisions:
    cros-ec-tests
      URL:  https://github.com/kernelci/cros-ec-tests.git
      SHA:  fad9423ae3c64bfd48c207de34a1177000d45fa8 =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig+x=
86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/660ddbca8b455deafb4c4493

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-15-gd91ca83599cd2/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/cros-ec-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-15-gd91ca83599cd2/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/cros-ec-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/amd64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/660ddbca8b455deafb4c44=
94
        failing since 107 days (last pass: v6.7-rc1-3-g59a9ccf19ee03, first=
 fail: v6.7-rc1-4-g57eb6dcd32cf6) =

 =20
