Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E4362D
	for <chrome-platform@lists.linux.dev>; Mon, 29 May 2023 03:34:13 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2562cc85d3dso2353456a91.1
        for <chrome-platform@lists.linux.dev>; Sun, 28 May 2023 20:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685331253; x=1687923253;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Lob5vZMfboAD85Hv7MvG5hKMyzwikcjE1JunLHyp+9A=;
        b=pX8vUh3BbjdX2bMY7oLz7sBVN528T7zX5h6sLPnaDROBJaRAYOxjkWbzHpoS/zqsF8
         q92LNj3ZkM/i2UDvkl6/RNuq0b88//YtmDVeThpZTbfWNg+yh/uF6B1Zgnm6yRjyyZyp
         gfxLcWCqFb26wmlxRjEdF/HZJAB3IEodOyTZxDUMJ24Z7OaWABXOVj9mHsIut5h5xECF
         4W5WN2WpLc3LcGg9ykU59r3i2nxOMnfbTdMnkhUrowxvGziUPJgndvyOruDO4swvh9Qk
         baYc4uwIyP1CHj8ncuZxhFnCV12h9z4/YY192Zth0CDYsQmBnjNf6g6nJtqBqNQvAchl
         rAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685331253; x=1687923253;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lob5vZMfboAD85Hv7MvG5hKMyzwikcjE1JunLHyp+9A=;
        b=StvwL7RwZHh35LyXnv/qvA5Nr4s7HlJSGI9jwn7NBsTRF0gzh/e9eMoYdfUX1ax67U
         cTxesHv5TKpPuEarwKqEdrNF6L6IlKnE6y7fP5r9bQ7VTeTW7ITcY4jzlEH00Rq3cIcA
         I9lhQzjJNYOVu604TJPyf8Dlt7DuP+5KvS9K25NSrJlXJOXX1FQyJJoBTRYKqEuk6HEP
         IOefpZBKps2wPlGPQizmdbkN7JBaxJngJSdw7WvUfFREBypcMqcK64gc093Va5ATHkm1
         kUR4cblOB2wLz7tKdmFhAaRKKmaIl+jm+TD8yjKGq1hWIYSHj50A9jW+Nex6vVTR+gD3
         5LtQ==
X-Gm-Message-State: AC+VfDw4V6vNkXdGel6vjyQEkiEdjIodwgDqRyFxxUzxH9hFKP+5hsSA
	k3LfFVwIB9jwxmt1EI3eVmrj+w==
X-Google-Smtp-Source: ACHHUZ6Cc9Oel6wwPsZxHSvCxMBmKKzi5xvtgRkNzxIiRY0K6/G+GUei6M44kzNTyw5LCGRGQb/BNw==
X-Received: by 2002:a17:90a:2f81:b0:256:468b:fb50 with SMTP id t1-20020a17090a2f8100b00256468bfb50mr6513933pjd.47.1685331253313;
        Sun, 28 May 2023 20:34:13 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w123-20020a636281000000b00528b78ddbcesm6101553pgb.70.2023.05.28.20.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 20:34:12 -0700 (PDT)
Message-ID: <64741d34.630a0220.738c6.b8cc@mx.google.com>
Date: Sun, 28 May 2023 20:34:12 -0700 (PDT)
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
X-Kernelci-Kernel: v6.4-rc1-4-gf5bb4e381290
X-Kernelci-Report-Type: test
Subject: chrome-platform/for-kernelci cros-ec: 10 runs,
 3 regressions (v6.4-rc1-4-gf5bb4e381290)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci cros-ec: 10 runs, 3 regressions (v6.4-rc1-4-gf=
5bb4e381290)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v6.4-rc1-4-gf5bb4e381290/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v6.4-rc1-4-gf5bb4e381290
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      f5bb4e381290883a014a9e865ee2c430447ef953

  Test suite revisions:
    cros-ec-tests
      URL:  https://github.com/kernelci/cros-ec-tests.git
      SHA:  fad9423ae3c64bfd48c207de34a1177000d45fa8 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6474098bca7fcae7532e85f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/cros-ec-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/cros-ec-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230519.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/6474098bca7fcae7532e85=
fa
        new failure (last pass: v6.4-rc1-3-g4b9abbc132b86) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64740b05027fc677cf2e85f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/cros-ec-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/cros-ec-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230519.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/64740b05027fc677cf2e85=
f9
        failing since 20 days (last pass: tag-chrome-platform-for-v6.4, fir=
st fail: v6.4-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64740c6f0c315f82802e861f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/cros-ec-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
6.4-rc1-4-gf5bb4e381290/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabo=
ra/cros-ec-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230519.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/64740c6f0c315f82802e86=
20
        failing since 20 days (last pass: tag-chrome-platform-for-v6.4, fir=
st fail: v6.4-rc1) =

 =20
