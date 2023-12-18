Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBFE101C8
	for <chrome-platform@lists.linux.dev>; Mon, 18 Dec 2023 07:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="lM94l2vq"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6da5d410432so1634395a34.2
        for <chrome-platform@lists.linux.dev>; Sun, 17 Dec 2023 23:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702885355; x=1703490155; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XwPbUuYJd8hyKYPqAAjRyOl2PjcVbCPzQgnh+jq3uS4=;
        b=lM94l2vq7jcm34cPeHSeetLlmqt+xULxlr6029jIutMonEpiAX2xEJun06uasD9WGm
         mWvmuDb0UJ5j1CKjF106csX947Qwa70ft3RpBf71vBP78kVgYAsIyhAWip/gbAru8AR5
         5pNHk8K0yOO+jZx5YoFaYAs41wn1F2GgG0MY3D4L4SJsoDIJbcsX+BKBGfJgo3ern3Om
         1E6y1tqCFAMcu7YdzUJLoEadm4NCnZzmE9Zr8C4YYDeWsgji+tfsjKduIMsbOfM0XeAY
         IEJmM5blD6GocQjj5cfv+f9n3hEogQG4rtvXUW6C4kBt1XYVcJ8qc/Rr1MqS6FuNFD2d
         30aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702885355; x=1703490155;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XwPbUuYJd8hyKYPqAAjRyOl2PjcVbCPzQgnh+jq3uS4=;
        b=sxXIThAvbK5gy564QWIetgjJQmPxqmGZ4LYwvieioUioYge6AeIjcNw4wQ0XPm55oQ
         0RzdY5+pXToNxnlTzbXHI3d1ZVNFPV8NQtCxdtk6+84A/3MQGWu1/eUc/myvjzEhgoxt
         AAYdeWRjCP1Ck+AXKGpvolHju0LZPS7LEs9ydzj8ns3zfLNch2jxHe4KccaQSy+Qfdth
         rEJEztvknu6JZdNhDakQwYQJ0Id/BtKzvFBO2ZAZsxzBrfaFAnhNwuVvgpq5diYEOHIg
         hRCQ0fPZwiD7o85XX4UkUNiPQSwtOiA6eVkMAeYT6S+decAAvV9cA+KeJnbXWeogsty/
         lU5w==
X-Gm-Message-State: AOJu0YxEJL4eyKyQQ8nVXnjeaAzOXCrJ6+S/ht1YlKYU+7tiCnSseMPx
	R466MAtZzJDHxVMbqrg3WmyDEw==
X-Google-Smtp-Source: AGHT+IHv6ceOCuahWemu+EBZgevB5bXCgqDwPKgk4uQ0YlhW2FLGgw9d089jM44DMagbA0u64vu2dw==
X-Received: by 2002:a05:6358:911:b0:172:d2c4:938f with SMTP id r17-20020a056358091100b00172d2c4938fmr1705339rwi.9.1702885355382;
        Sun, 17 Dec 2023 23:42:35 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id h2-20020a056a00170200b006cea0054b9esm17314175pfc.213.2023.12.17.23.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 23:42:34 -0800 (PST)
Message-ID: <657ff7ea.050a0220.a1c62.3e68@mx.google.com>
Date: Sun, 17 Dec 2023 23:42:34 -0800 (PST)
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
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.7-rc1-4-g57eb6dcd32cf6
Subject: chrome-platform/for-kernelci cros-ec: 10 runs,
 2 regressions (v6.7-rc1-4-g57eb6dcd32cf6)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 10 runs, 2 regressions (v6.7-rc1-4-g5=
7eb6dcd32cf6)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig+x=
86-board | 1          =

mt8173-elm-hana    | arm64  | lab-collabora | gcc-10   | defconfig+arm64-ch=
romebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.7-rc1-4-g57eb6dcd32cf6/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.7-rc1-4-g57eb6dcd32cf6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      57eb6dcd32cf6b49c38eff81e60e8fd471aa05a8

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


  Details:     https://kernelci.org/test/plan/id/657fec30dbf221f1ece13475

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.7-rc1-4-g57eb6dcd32cf6/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-colla=
bora/cros-ec-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.7-rc1-4-g57eb6dcd32cf6/x86_64/x86_64_defconfig+x86-board/gcc-10/lab-colla=
bora/cros-ec-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230623.0/amd64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/657fec30dbf221f1ece134=
76
        new failure (last pass: v6.7-rc1-3-g59a9ccf19ee03) =

 =



platform           | arch   | lab           | compiler | defconfig         =
         | regressions
-------------------+--------+---------------+----------+-------------------=
---------+------------
mt8173-elm-hana    | arm64  | lab-collabora | gcc-10   | defconfig+arm64-ch=
romebook | 1          =


  Details:     https://kernelci.org/test/plan/id/657fe4bcd06b66be23e13494

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.7-rc1-4-g57eb6dcd32cf6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.7-rc1-4-g57eb6dcd32cf6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/cros-ec-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230623.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/657fe4bcd06b66be23e134=
95
        new failure (last pass: v6.7-rc1-3-g59a9ccf19ee03) =

 =20
