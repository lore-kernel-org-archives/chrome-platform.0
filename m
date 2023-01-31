Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EAB63C
	for <chrome-platform@lists.linux.dev>; Tue, 31 Jan 2023 21:02:42 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id v23so16398611plo.1
        for <chrome-platform@lists.linux.dev>; Tue, 31 Jan 2023 13:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lPNFeFqoALBQz6Qtq1MMp/3UqqO7CuUd26yuaze+t0s=;
        b=IMNRtg7X2i3j9oT3TU7n6ieYrlkCIvoQIk8o7q1xI+hn2GL2Ah8dQw7fVxA/Rwn7Vu
         hwR4IqOL4ZaS6578Jha2p2sK2wEsonDlejMGLykKyyY9phQPuDVUmYDFV/lYsYhXH82v
         ksH2pdkLteQwUajcDM9qm5HRE2DFR5IaDfixGnJiHRmEik1WD8eIHV1Q1o5WJM3LRKbd
         K7URcxnk9wQmuX1iacKIqVJudqQ9qMo4LnUJd+yQzzsnuFaj5DNAmmflKjf5w/gFXgsG
         SaHHORaX/KFqTg8GbgXW2iiIQRCztnLX3TSxmuLYQTq4SOP8D/gaUEHpOo7xegKNNidX
         y8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lPNFeFqoALBQz6Qtq1MMp/3UqqO7CuUd26yuaze+t0s=;
        b=hu0z0Up/ootyS5+/MnE49ILex6oSC6O89X1GJqWfXImlhksT5WWuR+6UdswyPB4esk
         vVwA8Tabnq43dh7JV8YHUIYxwS6nha7Wgh5rNnKnzd5zeGApq8aw2UrNN2rxxrgnAOmD
         CeCGSCLU+KcqtCX7NCS0tbdLoncCFaCk1rvuHHOy/51WQsj6OUI4X47Swe7hp/MC43VX
         uXILwB+HWRoIPtVk8ERzFSJPWaNDo6mC4edZwDbAvgHKLk+xrLcFhtCInXzL6nyiz3ys
         CvfSUIXcwkLCeXM4fJqPornoqZ3/KzOCtya77sZHB54O9AcWmCI2nkYyqMSX6EmD8i9S
         Q9Nw==
X-Gm-Message-State: AO0yUKV+JAvUiK66ib3uoQsxjD7WXdESrcWZzvfTejZ4+vscst9VqGfb
	Hs6KR7+MyFEStYMIdQSO20mXrA==
X-Google-Smtp-Source: AK7set9pokBgs9wlCY/12tkcNAbMl6H0mffIXNHrFwN2YyoK4D75IFbzBfraYjZT2CKzjGeXiTXYhA==
X-Received: by 2002:a17:902:d0d3:b0:194:8c75:29d with SMTP id n19-20020a170902d0d300b001948c75029dmr313213pln.12.1675198961600;
        Tue, 31 Jan 2023 13:02:41 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p18-20020a170902ebd200b00196053474a8sm10204046plg.53.2023.01.31.13.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 13:02:41 -0800 (PST)
Message-ID: <63d981f1.170a0220.fc0f6.2bf4@mx.google.com>
Date: Tue, 31 Jan 2023 13:02:41 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: chrome-platform
X-Kernelci-Branch: for-kernelci
X-Kernelci-Kernel: v6.2-rc1-34-gfcc9e52d591e
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.2-rc1-34-gfcc9e52d591e)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.2-rc1-=
34-gfcc9e52d591e)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.2-rc1-34-gfcc9e52d591e/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.2-rc1-34-gfcc9e52d591e
Git Commit: fcc9e52d591ee65aca385c3f426f7e943ee10ccc
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
