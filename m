Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2034403
	for <chrome-platform@lists.linux.dev>; Thu, 28 Sep 2023 06:08:07 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-691c05bc5aaso11023588b3a.2
        for <chrome-platform@lists.linux.dev>; Wed, 27 Sep 2023 23:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695881287; x=1696486087; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JsQitvNyLpB+S+Vk/3bgWOZ4EptlwZxhJs1DCYuqn00=;
        b=xVVWjO79LU0vqMTNnz9d7JfZO+gIJuMM8btvoPqnE9gHoM0ZRR1CkYKN6dYQLV2U5p
         WFaWFWBvFxVtGlgudnfTBhgHhMOdPMGwIbcMd6mz/dA5prD8mg/HuXLIunJhBucsT/0x
         klwakVXb6+tRCv/PCHovs0rQtWhWnCQ+y2qofriyV1CWWwltMRSKFakDR5M5h5J6b+PZ
         g2kkJhxYSfSZK5rZ/n8ItAvR808ki1RmCspY37ROPMjyve+9Vf6j9BriebhrPgqg94uW
         qc1vykPktdYNTWfiPCHvNQfW8sDb0Rx/vnbvkhtLQg5OGf6cXeMMjUemWudsK5cwjUyC
         n+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695881287; x=1696486087;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JsQitvNyLpB+S+Vk/3bgWOZ4EptlwZxhJs1DCYuqn00=;
        b=Dk131BTrqaIPQQrYz9tShHUDzfv6sFsRPYCpeGVHDUkWVIZEQGLKH93KMtnH3IR023
         CSmH4TgjyyKO/YqYqDAQBWfSuHFtPwRurqGQA5Zsa3y6kXPVmVSXwjrIgTt1POAUVyYt
         GTSnQEOzaQ4a9vEI8W9Jday+rtPE3ndtsXPsKLLSjamtvvndNXwZRy7btM7gn4pXtt8t
         GDO5GvSNlj2cOjW6BtHkg93te9gEUenUe+oGBERMN69z7/W+sc8gAhVioj9/3mY9rDTQ
         qr4sbcMmay3kDECotDr7ECw2OQ2PW6ujrpWy1KaON9IxduthQewY6ygwAdjawzX2r6aq
         nczA==
X-Gm-Message-State: AOJu0YzHIwv2j8hvKDe2b2vyus80fmR0mSehYi4T4v6M2QV0BtQYbim0
	WODzQ8sfj1UoEoa8CzBRuPx5AQ==
X-Google-Smtp-Source: AGHT+IFx2e6oPIfwxrsk4O/NiIXRqD9hwMxs4t1MgqeEJGZUkW4k71dflSmMPJDyAGi6CXKNjyn7oQ==
X-Received: by 2002:a05:6a20:9184:b0:153:8754:8a7e with SMTP id v4-20020a056a20918400b0015387548a7emr398146pzd.3.1695881286779;
        Wed, 27 Sep 2023 23:08:06 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id b5-20020a170902d50500b001b89a6164desm8326293plg.118.2023.09.27.23.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 23:08:06 -0700 (PDT)
Message-ID: <65151846.170a0220.f5e2b.c696@mx.google.com>
Date: Wed, 27 Sep 2023 23:08:06 -0700 (PDT)
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
X-Kernelci-Kernel: v6.6-rc1-13-g7396a5b980fd
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.6-rc1-13-g7396a5b980fd)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.6-rc1-=
13-g7396a5b980fd)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.6-rc1-13-g7396a5b980fd/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.6-rc1-13-g7396a5b980fd
Git Commit: 7396a5b980fdeb2cb97136db45405b4fb5d21dfc
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
x86_64_defconfig+x86-chromebook (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, =
0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
