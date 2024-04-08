Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6435810E9
	for <chrome-platform@lists.linux.dev>; Mon,  8 Apr 2024 08:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712565447; cv=none; b=ND6JgM/mufS2VQlAuKlpCT8yT5mORIGsAWA2G1VIuvaFjpruQbFNh/5/qqzwuAuc5PNON4+DPCxtToSQ5r7po87UANpHkB4NrsJSHsVbXD0dNrYm4z2Mob7AcGUpBJxtVBx09A5FGh2VCQ/wC5Zi2lHiUH8svf6Kl+aasoa1UKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712565447; c=relaxed/simple;
	bh=wvlqrmhKe64ecGYKfX2SzFqAEF5k3HkC4MC9KC+PdUs=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=lKGFNTNhfdGVerTqmAVdmfp/bxXppKWlna6Na2W5r9/mKp1C1IrKTYIRR4DZrxpWm3CjmHmsxp317z3jmxKxWBLjTOI7oKnGupblGgSEwEvUF+jDGVCCrAdcUf3ILACf8JQYCQmzWz3Crli/viASY1VY5zaoiyrLGo9W4AivOrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Ct8p3f1g; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Ct8p3f1g"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2a2dd2221d3so2607753a91.0
        for <chrome-platform@lists.linux.dev>; Mon, 08 Apr 2024 01:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712565445; x=1713170245; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WhJkoVHJ7/0k8agP8XhH/T4IohXq7lSPe2rLVvoBR4c=;
        b=Ct8p3f1g1A/L3M65a5BEmSzvxm0fbtG9aOhCRZf3OHFFiBrPOYJFgHDB2M2oOTdCen
         MR61w9lINWH12k4yTCHema6LYSh+TC0Mce2EDP1Gz2YLaa6zIxQDihE/VY5MUm8gDzso
         MraeJdJrlLY8/492/C4ymgQID82yBmd5G91ETOGbzfF5LKhhOENWx40yuCyN0P21Hhu5
         fYLP9euMYuvfnMOFi/skJ1RvrgxfkXz+EnpwymOVkMi/zK/0Nuv/iurO87zXdju1XL+z
         o6LxJDzeNmXFEZltcRftQawZPra0NONC8eazVpw2PATZqChGw1LNfyIwLXwJNuRAy7wW
         tVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712565445; x=1713170245;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WhJkoVHJ7/0k8agP8XhH/T4IohXq7lSPe2rLVvoBR4c=;
        b=JbkvfkbNigIAqcVRlPMnoKXzaG5PCCKnVjWNFJVPHuGAgGJShCKLK7TdFC++nTchXM
         gOGvGZda+Tldxh/tA9ZK4zVqGCyCK+siUrRa4r8iR7ZYpMPS3CPqtyX0yEkCXzQiuMDa
         g68UZfRH7fvyv8aBlkkQLIJ1RtHwJfkNgqHYhG3VBfPLYHy2Je4JNBgQgd7fOK/4kIOg
         eOUPcVJujB1BoBXmtCfq2p08e788v40ewTAl+ZxELrMG5x0BFWQ6rxGI0C+Y7i/wKnZ6
         P34o1v7NzSSKjEyCVS4Ltylm7ThFyVQ2FM4WxYmqizPTGvXrC56jEgcgYHlfFv8Fr29g
         6Xyg==
X-Forwarded-Encrypted: i=1; AJvYcCVuOSU1zUMUpOXuyHb5Ld6GcjiQ0jXqJzIxnBLefB2uvq+eWNcPF3O6xJ7Wi0smkg3st7U0k1iTnmq6AQwjHcMCqMsObdEAx6WXLx9fmGb8
X-Gm-Message-State: AOJu0YxGH1fQAwVH9I5tdT7iwdiS8MxgsezB846FXX+5bVhGpJseSm9d
	qsNH2mBM80yicjD/KDAs4CuwxRUz/sRnR4KeEJYiOgiov0zJjT5EXwTFy7Rtjfk=
X-Google-Smtp-Source: AGHT+IEKIYz+iqekH9JMdCvhHgkpgroz+RhjMF3kIRpwJpOFtfYlg/PLckK3Tj0S18/RXe9To6cfyA==
X-Received: by 2002:a17:90b:4414:b0:2a3:be59:e969 with SMTP id hx20-20020a17090b441400b002a3be59e969mr4907740pjb.47.1712565445119;
        Mon, 08 Apr 2024 01:37:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id cu12-20020a17090afa8c00b002a2f6da006csm5884123pjb.52.2024.04.08.01.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 01:37:24 -0700 (PDT)
Message-ID: <6613acc4.170a0220.5de16.e5bf@mx.google.com>
Date: Mon, 08 Apr 2024 01:37:24 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc1-17-g3b89336c9ccf5
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci cros-ec: 9 runs,
 1 regressions (v6.9-rc1-17-g3b89336c9ccf5)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 9 runs, 1 regressions (v6.9-rc1-17-g3=
b89336c9ccf5)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig+x=
86-board | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.9-rc1-17-g3b89336c9ccf5/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.9-rc1-17-g3b89336c9ccf5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      3b89336c9ccf5961e9ec9521868a4c48bd6dded5

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


  Details:     https://kernelci.org/test/plan/id/6613957252cbf612524c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-17-g3b89336c9ccf5/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/cros-ec-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-17-g3b89336c9ccf5/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/cros-ec-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/amd64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/6613957252cbf612524c42=
db
        failing since 112 days (last pass: v6.7-rc1-3-g59a9ccf19ee03, first=
 fail: v6.7-rc1-4-g57eb6dcd32cf6) =

 =20
