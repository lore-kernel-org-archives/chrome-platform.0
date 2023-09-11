Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE1223CC
	for <chrome-platform@lists.linux.dev>; Mon, 11 Sep 2023 06:40:40 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-26d1e5f2c35so3245514a91.2
        for <chrome-platform@lists.linux.dev>; Sun, 10 Sep 2023 23:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1694414440; x=1695019240; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2FIOkW0V8nC3t/Fq1XQHCvwf6T7O1lajrMJbs8WFoUA=;
        b=Zmk/hGmIPwiBt5J10HqL4/lYaubxD1izXpUnM9A26bp2D40+0YZ9dafU2az/DTc3qJ
         8uI4EkC9PgED/NCAbKiCiWU4t9uykgDDbXiIb1CddwptndBPzRUuiKwLKs5UQGn3uVLe
         Sh7jEfsBZ+X+S8+Q0I0HbKQjaOxYceXFyxTmOxpuZjhjqwUDoP9chbYBZCAnbW26qrmJ
         uxIaa9NY6TFRvYUFWOFuhAA5JpySPXECCl/z9JsssWA3k7Hx1EDhi1ySPy4aX9nT46Lt
         fnEsZZr7Do3HEJZm1nHXoB9mbZ44KdIcXZ6Rkwwz/9q753SUMqwu9zApTV0Xt/8yRbBZ
         T8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694414440; x=1695019240;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2FIOkW0V8nC3t/Fq1XQHCvwf6T7O1lajrMJbs8WFoUA=;
        b=pekYhekULJOoUpPW5WGdcSwjNJYVqeLfwj0/nJ90EeBGS0HS+YdTq6XnyFbHkoUQsZ
         cuXSaDnTphbBfRqvVV99nzHKXreASMukvetOU+0h/ggIW2H9lghN0jKxIxsZnrlFvmyX
         T6SnQHI/lHEnImguCf0Io+Eoy1G6uslgdfGDyZBFJNmQaEUisMAXZ6yPuAfy1ewdd8NT
         zLeJvTwqRHL93ov8e3i1CwCpX5/4+33WHpQbGr7Gx7VFmwiNrWwGO5BeXWpAEWtp3K7H
         yvGEAOPSHty4mT4O5BKEk2V2EXbTowQlfsJQVBHZpwVHU35mVrNiK7kR+fg3y/SO5tdJ
         uoVw==
X-Gm-Message-State: AOJu0YzfZGIN62FsmUDeJo2hFGMOeWJZTwKZArgMsF1IZPYpOpod+5v4
	ZlIu/tKT7MQcpDvh74a1otYpWg==
X-Google-Smtp-Source: AGHT+IGuhwidzwWp5VmtmeSmx2nMGrWuGyvYcjas/5/fdCjPW8KW+YXC9lyN1xvQ3qFp+v5C3D9apQ==
X-Received: by 2002:a17:90b:3a90:b0:268:4485:c868 with SMTP id om16-20020a17090b3a9000b002684485c868mr6917191pjb.49.1694414439861;
        Sun, 10 Sep 2023 23:40:39 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d24-20020a17090ac25800b0026b30377c14sm4921097pjx.6.2023.09.10.23.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 23:40:39 -0700 (PDT)
Message-ID: <64feb667.170a0220.15c23.adf2@mx.google.com>
Date: Sun, 10 Sep 2023 23:40:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-firmware-kernelci
X-Kernelci-Tree: chrome-platform
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.6-rc1
Subject: chrome-platform/for-firmware-kernelci cros-ec: 8 runs,
 1 regressions (v6.6-rc1)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-firmware-kernelci cros-ec: 8 runs, 1 regressions (v6.6-=
rc1)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:  https://kernelci.org/test/job/chrome-platform/branch/for-firmwa=
re-kernelci/kernel/v6.6-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     chrome-platform
  Branch:   for-firmware-kernelci
  Describe: v6.6-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
  SHA:      0bb80ecc33a8fb5a682236443c1e740d5c917d1d

  Test suite revisions:
    cros-ec-tests
      URL:  https://github.com/kernelci/cros-ec-tests.git
      SHA:  fad9423ae3c64bfd48c207de34a1177000d45fa8 =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64fe9f8da360be92af286d7c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.6-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/cros-ec-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//chrome-platform/for-firmware-k=
ernelci/v6.6-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/cros-ec-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230623.0/amd64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/64fe9f8da360be92af286d=
7d
        new failure (last pass: v6.5-rc1-1-g0979e7e3cfd7) =

 =20
