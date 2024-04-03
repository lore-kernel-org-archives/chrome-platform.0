Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0F355C29
	for <chrome-platform@lists.linux.dev>; Wed,  3 Apr 2024 07:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712129471; cv=none; b=St/E0J+mbzJh4GdVJjZ8agxNEiul44XlrHfr16GECaMhu2ve/j4+6FtE4g9AXJ4OfxATOofbBGGQd+je5Re3yX7jCjoJKVrB7RlWr/Pi93gP7QBbtgfUqj6jxBWUHnxLtBdpgEHTA4q1Oe9uYUmOmyengQlXvz0dqW8j9h5ry2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712129471; c=relaxed/simple;
	bh=3a57SLQUhKKYFXglscrRue/37hzqXjY4Gn+8J/Q97Jo=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=cpUyrl1TknUA6YuSAesKe3WE6yftu4C/djvDauDPFXXOi3rFHGxW+epJMd8eGYLqDJhBM9WTJgrTGmv5xcpsbqfhaEg2mXA1Q3wBQ984gv1cbTpnvhk5J5ni5koJp9QPnP4PZTjCFqufqynT8ZZzriYk33N2+NJuDT6KKArA52Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=rZF6vl/Q; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="rZF6vl/Q"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1e0bec01232so48479755ad.3
        for <chrome-platform@lists.linux.dev>; Wed, 03 Apr 2024 00:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712129469; x=1712734269; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xtlQB6M036FR0pedBXoXk6U80iTRFuBXdfkLGO2xmlc=;
        b=rZF6vl/Q8ha/BnNn7tOnVUr2uCjX4wzOVOi5kHx6+5fEzQmj0gjXclIv6N7nHXHccX
         GvBnvItwSANAX8HuCCbbC4fenG53+1gbII2EmlYJDYKXw+Jal0V01xV0Ouwx2G1EC5+W
         8ImxA1i761Sf7k5W57Xb9hVUZD6/A7dn7PTSTfTYCW2o8HapFLmjw+mhOjvrg2lqo3Z+
         4Fl0P7k2U5qfIc+KZiaDU04cCzdoc0O8P5sbcwS1poeblS+Hzajn7CaBGExcpCF9b8AU
         hLgyzyQZ4g5tyc3sxKVHY+mzO11q3H+Rq8LGiTdsXkYo0aNQkwRI0Q+z0BuayhR/nWYc
         dNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712129469; x=1712734269;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xtlQB6M036FR0pedBXoXk6U80iTRFuBXdfkLGO2xmlc=;
        b=mOy+j55rz/nnhko/h3dFLf6Up+BTdF/3j4V6RXcw0fLuRbEDPO707soO/1EonLK/na
         wZzY+qWGfqba7lY2A2CkzTzo7abrS8ulUnQHpZ5YYo53ATGOfFmlydYM8ClPu2e/R9U9
         6qkiyFm1M3U5xidHJJCImL12QAzIesyXVqaz6Hfr7WGWlSeLndM3vjianFwZdxKwOFbl
         kx37e1EN2nfFntMO2SO1qjzwxvwghjtbIhIkjbZZEldWWbehc16HnuLgKzP+Ao7C3dfh
         HsbzEl7QEAukuGiQRiYCUwEsW54dQb2jIsh/JnvEgtVC6blsrEHVbvHciwu8R6mytFF2
         g6dw==
X-Forwarded-Encrypted: i=1; AJvYcCUIBWCrKzDrre/VoETNm8XmwAVE70x0LzG1lyU9htgC63Y7/ikyd+032OOCnvnKjMctP30LlL7jMB0JpnsACzD4gUBkufK7P6nt/bYwPbnm
X-Gm-Message-State: AOJu0YyGV7xkhvo5KcOzmevH0+5WAlTiU1v9wlmyxCX5zmBYBPiUZz1q
	h06glevf34FQTtuBJqk6ENX03Ey8klQvH+WNDV+UuEt0cK3wDUSk0GCCAsXhXjY=
X-Google-Smtp-Source: AGHT+IGxoonVvQuQqM/HqQbbYC/suXl73be738GWwiBePiTWI10e1IQEashf33wztkkM7MTG6DBojA==
X-Received: by 2002:a17:902:f7cf:b0:1e2:8669:74f1 with SMTP id h15-20020a170902f7cf00b001e2866974f1mr2646887plw.33.1712129469572;
        Wed, 03 Apr 2024 00:31:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id l7-20020a170903244700b001e2619b7a97sm3538905pls.275.2024.04.03.00.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 00:31:09 -0700 (PDT)
Message-ID: <660d05bd.170a0220.265f5.c575@mx.google.com>
Date: Wed, 03 Apr 2024 00:31:09 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc1-14-gd8db2c6d7b0e5
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci cros-ec: 9 runs,
 2 regressions (v6.9-rc1-14-gd8db2c6d7b0e5)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 9 runs, 2 regressions (v6.9-rc1-14-gd=
8db2c6d7b0e5)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig+x=
86-board | 1          =

hp-x360-14-G1-sona | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig+x=
86-board | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.9-rc1-14-gd8db2c6d7b0e5/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.9-rc1-14-gd8db2c6d7b0e5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      d8db2c6d7b0e5ca5e64c747236b2464d0c1661f3

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


  Details:     https://kernelci.org/test/plan/id/660cf26b77b4ece70b4c444c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-14-gd8db2c6d7b0e5/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/cros-ec-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-14-gd8db2c6d7b0e5/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/cros-ec-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/amd64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/660cf26b77b4ece70b4c44=
4d
        failing since 106 days (last pass: v6.7-rc1-3-g59a9ccf19ee03, first=
 fail: v6.7-rc1-4-g57eb6dcd32cf6) =

 =



platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
hp-x360-14-G1-sona | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig+x=
86-board | 1          =


  Details:     https://kernelci.org/test/plan/id/660cf3ae2ff80e27b84c433c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-14-gd8db2c6d7b0e5/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/cros-ec-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.9-rc1-14-gd8db2c6d7b0e5/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-coll=
abora/cros-ec-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bookworm-cr=
os-ec/20240313.0/amd64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/660cf3ae2ff80e27b84c43=
3d
        new failure (last pass: v6.9-rc1-1-gf7496450528bf) =

 =20
