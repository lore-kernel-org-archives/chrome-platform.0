Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E05C1FAB
	for <chrome-platform@lists.linux.dev>; Wed, 18 May 2022 14:48:14 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id d22so1977201plr.9
        for <chrome-platform@lists.linux.dev>; Wed, 18 May 2022 07:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Oy4JKXnimfkiSrzdBXFumR+o8eRVj+KTX1tbfm5GzRI=;
        b=0f8VGXpKJ5GoUkAK9KwOSh1AJMsYi+qwsH/uEmhB0Fq9KSFvZvDHLb/4mgAsxlg868
         5f6HnhOl1Y+4Eqx1elsmOIqAHUsIuCSnjfjZnA1R657bwtDedQmM8I5tNPSxbsyM+fWl
         4GsKZcDiiwXzZ6FPMs1yYk6PJ9I24pWIjKFvEVh8JjK7psl/JZ9KL4zfndgJOm22Heoz
         bI7EYkOOPv6OVfJ48xnMtfFbLOvzJVR8kyMYIRJhdnsW7/dykdhPAbcIsRjh8rPOh3lF
         rNqDaJis9an+H4ZKTQ/8gUbCpZ4MbZXcA65fjaLL/e502bFaYV/VObW9oakb+5xgCw3/
         7zMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Oy4JKXnimfkiSrzdBXFumR+o8eRVj+KTX1tbfm5GzRI=;
        b=GJrA+2PbE+KV9wNVUpoNrwgsZm7CzpcmRW2BDNiWWv4hUQlFWkcQ/kZcYmAwUXMELQ
         msvBj3TGFHOq/akpq3amUu2rhEP73FioAgKF7F+ArU8Yscb0/+Ev/Q885o3RdGCOV179
         WnK/cqUBB9mdjxjjgPophgGJG4IF99oOTtXjjuhdUzJYacY7/TYUYaFGmk+yX6pPx2/o
         KnO/5F2FbIGvp33gU6uZcltT7fBLfakP6k59EpcXz6Vl1I80mIzQoIFN0SK8cK/0Awaw
         RyADVC+mPED3atH48VcMjXunUm6E8tIfwIHQuHOMEFG+k+SYDhOW4Ss32XKPjadiirSd
         5L+Q==
X-Gm-Message-State: AOAM532V4UkljjQWNEpyJnH6f+CE7/uJAtxvwwZjby0el+qzJ7FzIiOm
	ess7WEabNx20AOSGEWwHRnRkOTo/WJ970vq8cjU=
X-Google-Smtp-Source: ABdhPJwI2pMGFo9+j0MB/pEk5ykjp1BYrDigzVz9NvJ9LD2snoyVViepyYqV69Chgy0dlPbSa6hWgg==
X-Received: by 2002:a17:902:da8b:b0:15e:c0e8:d846 with SMTP id j11-20020a170902da8b00b0015ec0e8d846mr100492plx.34.1652885293598;
        Wed, 18 May 2022 07:48:13 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v18-20020a62c312000000b0050dc762817csm1974274pfg.86.2022.05.18.07.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 07:48:13 -0700 (PDT)
Message-ID: <6285072d.1c69fb81.dcb27.4abc@mx.google.com>
Date: Wed, 18 May 2022 07:48:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.18-rc1-20-g13ee26318d722
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci baseline: 88 runs,
 1 regressions (v5.18-rc1-20-g13ee26318d722)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci baseline: 88 runs, 1 regressions (v5.18-rc1-20=
-g13ee26318d722)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernel=
ci/kernel/v5.18-rc1-20-g13ee26318d722/plan/baseline/

  Test:     baseline
  Tree:     chrome-platform
  Branch:   for-kernelci
  Describe: v5.18-rc1-20-g13ee26318d722
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      13ee26318d722e82ee98801d3db0d51746a8c885 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62850077c19de168fea39bfb

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.18-rc1-20-g13ee26318d722/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-kernelci/v=
5.18-rc1-20-g13ee26318d722/arm64/defconfig+arm64-chromebook/gcc-10/lab-coll=
abora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62850077c19de168fea39c21
        failing since 43 days (last pass: v5.17-rc1-10-g0ef49b25b7cc, first=
 fail: v5.18-rc1-1-gbf84b10d9901d)

    2022-05-18T14:19:21.362274  /lava-6414468/1/../bin/lava-test-case   =

 =20
