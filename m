Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F26D33F6
	for <chrome-platform@lists.linux.dev>; Tue,  3 May 2022 23:29:22 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id iq10so16702198pjb.0
        for <chrome-platform@lists.linux.dev>; Tue, 03 May 2022 16:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ORQoTv9ZTEWysxEUKNL7JT37Qc57o1PB8wP2jrIQUu4=;
        b=rNO/ac+ReGvti4r8As+1UCrkWFQIp33OFUWcxgAM870cFShwRBu09TLUXQJR685UCx
         cey0xyivN1Au0t6GgMxz5Ti7Z0zvTCrXOiA8VS45B+4+7Dv622FESt4YtTdlDz0DERg4
         TJjKRZokK1wD0tU0Sn4rZp7hBqvLPJZD8kfgGlHaS5zXXQuyC1O3SJaJVv4M6oKXG8ZE
         o5YPpblpjAKpT4F+t4BxMxPin6yh4Go8SrrdjtEKRoIN25CafxiGhxHMP7uQGDqJ3jvo
         pRmsFlzPptKCSO4oIUdMjGxvpkJHuCLtGeKBk78SJCKqwypoWYvGOJAHoP9WTwQnGIi8
         d+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ORQoTv9ZTEWysxEUKNL7JT37Qc57o1PB8wP2jrIQUu4=;
        b=d4gsw+nrdY/+9022HBhPO1wK5YeF9VEWEK/lsZquxjPEzUjfT5+39JMdZMUxyK79CQ
         SZUVHMdnNNqeE0JhwK8/DTvwOaQLnrwxHaOKP/51f8hnrjiQyXVjeIV1CDg4ei5piHYS
         JqnRCiJi7jUl/j2F4OgbPT3haCsckKoerVwLAVDWaMkEXXWhWivV7kdGej8M1OUKsYGU
         9x1q/HhbnfEYKrb4YA0dPRz1Jrzx8A15vrXMozoiXdQ6aytvfrQhlzeE1Cz3vEGp06Ea
         5fpw4+nL9p8q5nOgMcsB6m79dZZa4XB9vbqkxWXa+0vayPZFXWT6T+Bxe0uVDLSdRdyN
         vA6Q==
X-Gm-Message-State: AOAM531F+HmiPRrUa+wAUeeD5Oozqr50MC90kY7/ct4tTWlK0zQX6H+f
	Yy85MV0rjnJtJGO356yJyOFutmyJFKgGVKU3B3Q=
X-Google-Smtp-Source: ABdhPJxiI+RvDKE16W35xA8sdRzmqkm+hKVdetDk4jqx28tjFgzolayRZxUdmZ4t0FbYvLQYEr5iBA==
X-Received: by 2002:a17:90b:1651:b0:1dc:4362:61b8 with SMTP id il17-20020a17090b165100b001dc436261b8mr7333351pjb.159.1651620562041;
        Tue, 03 May 2022 16:29:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h10-20020a170902f70a00b0015e8d4eb287sm6869325plo.209.2022.05.03.16.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 16:29:21 -0700 (PDT)
Message-ID: <6271bad1.1c69fb81.18dc8.1376@mx.google.com>
Date: Tue, 03 May 2022 16:29:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.18-rc1-9-g647ca66a238b
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci baseline: 54 runs,
 1 regressions (v5.18-rc1-9-g647ca66a238b)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 54 runs, 1 regressions (v5.18-rc1-9-=
g647ca66a238b)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.18-rc1-9-g647ca66a238b/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.18-rc1-9-g647ca66a238b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      647ca66a238bb661523362bde8805c45019ad88b =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6271b34e75a585eda7dc7b4d

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.18-rc1-9-g647ca66a238b/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.18-rc1-9-g647ca66a238b/arm64/defconfig+arm64-chromebook/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/6271b34f75a585eda7dc7b72
        failing since 28 days (last pass: v5.17-rc1-10-g0ef49b25b7cc, first=
 fail: v5.18-rc1-1-gbf84b10d9901d)

    2022-05-03T22:56:55.520105  /lava-6254272/1/../bin/lava-test-case
    2022-05-03T22:56:55.530972  <8>[   33.754597] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
