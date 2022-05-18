Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FBE7A
	for <chrome-platform@lists.linux.dev>; Wed, 18 May 2022 14:04:48 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id nr2-20020a17090b240200b001df2b1bfc40so5687770pjb.5
        for <chrome-platform@lists.linux.dev>; Wed, 18 May 2022 07:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=GR6kehupJ1aHZ396MVF6MiMKcSM3icUv9zzSPViP3Y4=;
        b=aNCTnGLZbbkEOBCQtWdZ7iZVnjeSEHWXLmvhiTkBuZtUjZzkNY6Y4AnZfvx4LLS4TU
         MkfThe4KRpOmTuMcXN21ipDAnVXNkHRCYL0f+mpKVd0Ce2JJHkrtByM2PqpUHXmSy6Ep
         D+tlt8ZsSvTjGdOF69N2c1VigVNywxAKzD9k10/U4mWteThbaczdhzzzO3ZWosYFjNnO
         Q0LyqFh4SIo5Ot7gf04SIoOZxn0g1+rLEp85ssF7w09gr6jJm3AqpfbV3DpCi/jedfb2
         Ane3Hs6lNFjcMxZoYNv2VhH54HhG7oPDSXJKOd5bnaL3ggn7lrGqyTFklkaMM58kdCZC
         Ao7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=GR6kehupJ1aHZ396MVF6MiMKcSM3icUv9zzSPViP3Y4=;
        b=1ayZUIxMwkImm6KDIcikZUGfQ581J/UBCA/WEX18g7JU0jvTo61BZg8v08Jn1xEgtQ
         mH57cEX5/KBpqQvn5lLQjooBTVlfUrqLptOBmPRtO2H63Vjef3FXLz5WVDsaROFzM9o2
         8KSC4srHNKKHsLM3kSEWMQjXUiCUg296ayzeMB0gmk3XL9+maF5Bb3Ff2ds9xsYaGnjs
         sCAinBrmD31GEudE3gvpnOSApypeFV6qM69DEqZG+hqUrXog1xDg26Tc3MiGXdEqJ4ki
         jNWIBMPpbeimmtBrEzPxho7zIHwMogqrltfng9A8/7k8a5bTY3ZrbJqTSMWEhwqyXzCS
         PZ9w==
X-Gm-Message-State: AOAM530tfwXrQ8YpDoO9/0SRfqRfNKImR7uIcmcPvjCOnnzaSWBXWFcR
	HNsdRD5ewgguYUODa53+rhd+jA==
X-Google-Smtp-Source: ABdhPJw82C08SQUKVyFKBuHHCZrU+38n6ubHRAOQW0oAVwFeJ1/mE8Otw/R35UuobTFb6qYCNab08A==
X-Received: by 2002:a17:902:e3d4:b0:161:888e:e707 with SMTP id r20-20020a170902e3d400b00161888ee707mr13689944ple.118.1652882687900;
        Wed, 18 May 2022 07:04:47 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c3-20020aa79523000000b00512ee8a74a9sm1998848pfp.217.2022.05.18.07.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 07:04:47 -0700 (PDT)
Message-ID: <6284fcff.1c69fb81.89adf.4ab4@mx.google.com>
Date: Wed, 18 May 2022 07:04:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.18-rc1-20-g13ee26318d722
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v5.18-rc1-20-g13ee26318d722)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v5.18-rc1=
-20-g13ee26318d722)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v5.18-rc1-20-g13ee26318d722/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v5.18-rc1-20-g13ee26318d722
Git Commit: 13ee26318d722e82ee98801d3db0d51746a8c885
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
