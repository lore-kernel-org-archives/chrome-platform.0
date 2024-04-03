Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9E3155A46
	for <chrome-platform@lists.linux.dev>; Wed,  3 Apr 2024 21:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712181223; cv=none; b=AW2jFDM8UCs11W5k5WsfnFxcyvR4hB8By/ZB3KyZf6SnrCmO5dKdHqdUzOfEQu+nFXr1sTf+3rNdZPcigfMQQaj4qD2PZZUR4D0Hbzl/AAJO8I+FkPLIj7wiTWxwo4krhYADcNV60nYqLJT+jnHrVSiCgXw6AdEjJjLPMLSODDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712181223; c=relaxed/simple;
	bh=JWGOZg+O4sUuYv53LZrUKZHadmdINGTCLgsmDJaKe9Q=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=IPykgiiEGEqDpQkBw2SoijB9qiPg6jmPzkUIMAO2YWD2qkPwUOmu8QWY+9n4Fgc1k3IRUlWtqOAaf45fctOHAjJvJhACxnMKAjpNK7UfmD4HtoW/6k2cfcD9iRoXAWigesJYU417dXSFsklOVDUXFqpUNTge67XTCjxTKnQfaNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=MiVzKwXB; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="MiVzKwXB"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5d81b08d6f2so344486a12.0
        for <chrome-platform@lists.linux.dev>; Wed, 03 Apr 2024 14:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712181221; x=1712786021; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JWGOZg+O4sUuYv53LZrUKZHadmdINGTCLgsmDJaKe9Q=;
        b=MiVzKwXBQUIvz3k6uGueeWF6DIigfNMAKzgzdbx2w4jizbaXGrSuZlKRJwcF6UMWl4
         rqm8Hxgbf3n/O03H7/Zgglu1OuP4Sf2/rdIGSTmgha+qT9yCnyJiC2k4STENwm/gHb4w
         cYy0aQtxEQnEWWWIV6mo2JGqWI1W5layqvZV6BzPOmJMrQ969x8VRocj7dIQ59El7enN
         vjzB00Xl4MpNjpt36kLGr98H6vuHxeBZuHgm254nsjN6Yt0GflY1yfZjOe1HPJKkPji+
         MYy4bWQ6tqBCHrkAfivsXd2JBx/ss2EcGOe+Awj3mCdkX3yTLqu4/P9zBtVh7ntUx+kM
         gSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712181221; x=1712786021;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JWGOZg+O4sUuYv53LZrUKZHadmdINGTCLgsmDJaKe9Q=;
        b=Clko05IVIkhpcqj4mMSyAaxh1Ikn8/DGgwfsR4AlOL1eEvTXBHMG99jhIigIUdtgzB
         enMk8xcg/isemV9K3VuJr7D+4YInXBLtQzavyFuczQM3zyn92EsVCftf3H/AA9p1/lY8
         uOitnK4uJNojIv6AlGc5T/UHfMIuzwnYp/yvaXVvuXJvjo4D1FLZ92vULvIHyUOH2fC+
         eHPpZM4rzlGG3cVjgyRixOKhk9sNJ5EsSCbWYNujWrX2AIKaR+/qm7gfAoEXb7dYJaMX
         csfvH2uC7r80eDoZEyzV04njS09LQjdqn1tK84ZCdbH7aUUkOBQhyWdA1rviJblWBEnI
         1Ncw==
X-Forwarded-Encrypted: i=1; AJvYcCUfjReGIk21K1XeXlmXDPWs1cF36uc4E2Z/G75FW2hUPiwFlI07CTyeqxmVGzHS5ZfVkQN9IZwhPMEeEvYdowao8v+RQlp9jbtBUnygN+hc
X-Gm-Message-State: AOJu0YyfdeqHzn9QSF41I+258RJuP69eDV/KwqZ+7s2t3Ne+c5Q6oEqT
	7Hl8XZt1w1NzR1737nRe5Latp2wMNPjLxMhENcGDeFS9lz1SYQG00jgPEkB74Xg=
X-Google-Smtp-Source: AGHT+IErl7opKx1sPdCqtLXI2gjYgpxEv/8SA+R05b6wx7CNPwmjztMahnso5FgBhvi+z2Ywi5i9gg==
X-Received: by 2002:a05:6a20:748e:b0:1a3:558f:13e9 with SMTP id p14-20020a056a20748e00b001a3558f13e9mr1291462pzd.19.1712181221019;
        Wed, 03 Apr 2024 14:53:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id q14-20020a17090a2dce00b002a056551c1dsm179366pjm.6.2024.04.03.14.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 14:53:40 -0700 (PDT)
Message-ID: <660dcfe4.170a0220.bf08a.0e96@mx.google.com>
Date: Wed, 03 Apr 2024 14:53:40 -0700 (PDT)
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
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.9-rc1-15-gd91ca83599cd2)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.9-rc1-=
15-gd91ca83599cd2)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.9-rc1-15-gd91ca83599cd2/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.9-rc1-15-gd91ca83599cd2
Git Commit: d91ca83599cd2c0ec3f7638a5e8ee712102d8fc2
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/li=
nux.git
Built: 3 unique architectures

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-board (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---
For more info write to <info@kernelci.org>
