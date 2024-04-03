Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F514139D
	for <chrome-platform@lists.linux.dev>; Wed,  3 Apr 2024 22:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712183821; cv=none; b=tLL25iQNGhu9jJw7rWmsM9njxdwJ8+FtxXbqUOj95XNNqHIymfGB2dL+1Z2gLAO+c4GeC3L36EsVn6qHbVII6UkErrGOjATM2/RCc6MXCS/v7ug00eSrKcBC3aFq3DLSt0esH/UL57wYtJCxPjD4TXixhUB85VLbnn65VU5MDzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712183821; c=relaxed/simple;
	bh=RzUhE1j43mAFH6n1YB63P4WdZodtpBQtbfCJtz1pPUM=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=owuxe6a0xreQp/KRO8SZld/IEKqrFSKnMvh8Vc9w8sL0jP04TdM2Sat6RVhDqES1tAVeukd4Nj6VkM2UZQwnH28ESJd+UwUr2kpYqRpy4SSOeDeBbXAp0JALEwCNKgW47onl5u5eRQSQvSM1uHVpbN3ozXLnOvdYy+m3InAcSVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=qK6zfNgo; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="qK6zfNgo"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e6f4ad4c57so259611b3a.2
        for <chrome-platform@lists.linux.dev>; Wed, 03 Apr 2024 15:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712183819; x=1712788619; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KfO5LhEQzG3UbU151ADdIAggyunW/dBszUU1zhlOzXs=;
        b=qK6zfNgoqsiboMmkvqQ3dbnU90Y68s6njk1drVbggufV3F0/ZIiMrc0G4Gmq0upqZv
         dykJQVjd9LGButn90Lge3+PrQyBpWHnNkQL26tztm/KA7CllpYCO8W2m8vtuaANTQiGz
         NBbFfSyQ/nnwoAZx67ThA8acxjnAZF7R5QlpfpZaym2q5r2YdAMKu/nJ8x4Rx33pq2Qe
         1pnUrZf5GzV5pN4BKqR3DH9SXn8y4gaz6+PGf690omMPT0EGRSC9ky4pneixUfpfIgL9
         IXHDkR570jBCBQOlC4ADvOEAOBOIcjbr9YjTi5tstNEp0GeXC2FKUO3ibOiZLuxdX5uv
         fWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712183819; x=1712788619;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KfO5LhEQzG3UbU151ADdIAggyunW/dBszUU1zhlOzXs=;
        b=jChc1eUwne/kYgIjTvLXSwpyn9KtimFWRM2JvCf8HwtS2Cw8t9urcEwitzEcDqY5LC
         qRnMZPpxZz/M1hxnxuOudLs3nQtcLhWuZn/TPQ+MSLyrv80Ca7CFMWPD2KrlfInofwJX
         M48dN7KWlC7x6TnNoPQU4a7vOHFmui+4Laop6uvT2cRrTH7bOdkMuyMwxeYLjoBUJ4WI
         NjaFcKMG1QzjsPu7/yJAWrt+70L64Yrb4O8LzU1WmpcQ4gDgas+Pn+16q3ZCBUmz+pvS
         RhhbS0f6G2y0n1dUVXSsDTy6QSZ7bFvUxDKJsGuDCtW+PSmmmR/N7IGpnZzfAInH5gNb
         sgrg==
X-Forwarded-Encrypted: i=1; AJvYcCW6HwwH0c0YC5hOswt6tnUmzKM58+Wt5Q50vb4SdFplE3EkayL4jtHSWQzSTZy4H3IAxofhHALPlqQVpvak15aBH5AtRNnvniCEg1eVhy8w
X-Gm-Message-State: AOJu0Yy7p0vgh+2PPi6SvAr1uQ5P74EHz5ZAl9BQRPm5XCv6hJcdF8Zc
	DarOGCiub6RpoNKcUsTIBz+LQcH2jwpX6J1AjeVeCaASy5mLcWau2FNd+Puh9CQ=
X-Google-Smtp-Source: AGHT+IHWBS7Nu6/+YcRXJxQG7rsd8bQwnNUbdlLUTPX7nLRihfNtY9tdzSUQR04NqCWsNmNPOiiHYg==
X-Received: by 2002:a05:6a20:324d:b0:1a3:e37a:d228 with SMTP id hm13-20020a056a20324d00b001a3e37ad228mr927031pzc.27.1712183818835;
        Wed, 03 Apr 2024 15:36:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id x8-20020aa79188000000b006e795082439sm12267611pfa.25.2024.04.03.15.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 15:36:58 -0700 (PDT)
Message-ID: <660dda0a.a70a0220.cd9ca.2b92@mx.google.com>
Date: Wed, 03 Apr 2024 15:36:58 -0700 (PDT)
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
Subject: chrome-platform/for-kernelci baseline: 74 runs,
 3 regressions (v6.9-rc1-15-gd91ca83599cd2)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 74 runs, 3 regressions (v6.9-rc1-15-=
gd91ca83599cd2)

Regressions Summary
-------------------

platform             | arch   | lab           | compiler | defconfig       =
           | regressions
---------------------+--------+---------------+----------+-----------------=
-----------+------------
acer-R721T-grunt     | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig=
+x86-board | 1          =

hp-11A-G6-EE-grunt   | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig=
+x86-board | 1          =

hp-14-db0003na-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig=
+x86-board | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.9-rc1-15-gd91ca83599cd2/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.9-rc1-15-gd91ca83599cd2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      d91ca83599cd2c0ec3f7638a5e8ee712102d8fc2 =



Test Regressions
---------------- =



platform             | arch   | lab           | compiler | defconfig       =
           | regressions
---------------------+--------+---------------+----------+-----------------=
-----------+------------
acer-R721T-grunt     | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig=
+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/660dd047bef7807a9a4c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-15-gd91ca83599cd2/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/baseline-acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-15-gd91ca83599cd2/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/baseline-acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660dd047bef7807a9a4c4=
2db
        failing since 9 days (last pass: v6.7-rc1-4-g57eb6dcd32cf6, first f=
ail: v6.9-rc1) =

 =



platform             | arch   | lab           | compiler | defconfig       =
           | regressions
---------------------+--------+---------------+----------+-----------------=
-----------+------------
hp-11A-G6-EE-grunt   | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig=
+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/660dd038f0e66d45364c43ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-15-gd91ca83599cd2/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-15-gd91ca83599cd2/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660dd038f0e66d45364c4=
3ee
        failing since 9 days (last pass: v6.7-rc1-4-g57eb6dcd32cf6, first f=
ail: v6.9-rc1) =

 =



platform             | arch   | lab           | compiler | defconfig       =
           | regressions
---------------------+--------+---------------+----------+-----------------=
-----------+------------
hp-14-db0003na-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig=
+x86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/660dd03e324cea85994c438c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-15-gd91ca83599cd2/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/baseline-hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-15-gd91ca83599cd2/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/baseline-hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660dd03e324cea85994c4=
38d
        failing since 9 days (last pass: v6.7-rc1-4-g57eb6dcd32cf6, first f=
ail: v6.9-rc1) =

 =20
