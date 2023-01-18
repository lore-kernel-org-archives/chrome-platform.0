Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFFA1C04
	for <chrome-platform@lists.linux.dev>; Wed, 18 Jan 2023 04:02:33 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id r21so3552747plg.13
        for <chrome-platform@lists.linux.dev>; Tue, 17 Jan 2023 20:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+V5DIsCfm30oyKzZq5nFCPGP2ywaXP6KUu37/SugOBA=;
        b=Ve1N1J8FR1gNg2LLLciBal+J0rw2+3xSpJwjw2CpdfOhK38CdnKSoiUcoxE6AEl5PA
         VTqVnOsy8YTvOGP3EY7QvWyY1Xi/YJdQ8S/d7KWxmJLl76DGwYuplHqNSGqJbIkBJnRv
         I3UAmXodUmIuiNqyMWmU3DZ8N4t7HFGzISN6gPXlXW0tLKp+r6aE2PjHtpB9RSVQOnXh
         IscKnrHdFn8Pju9qfvTBAZ2HRqccB0v3LNTBitNvhX6PZZQ8AbW8wnPqPpCGMVeNvFgc
         vkwSOWobhmPb5qGMpAVi+K7xD84TQ+VOFyxvqXm+1khHbO36DoRJn5kBaWPKMh3/iKRd
         5icw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+V5DIsCfm30oyKzZq5nFCPGP2ywaXP6KUu37/SugOBA=;
        b=ONwCwoVOZZxzRs2zm5e5bI4S20O230vwdn5Kzh08Jxq/uOT3PLYULXymB7a7FjE4LO
         7thMjohzHIo7yc7Q7nBXtjsjZNciQ9X6Tm30ctDtOWEwdZxOlGJDNPC8i5TrHIg5QDfy
         Q+y6yfUrJYKPFrXIPfK8NfPIJ1zaVpRKacaPW8Pc57HcrohIjXf0tI86hrmbx6uRdQ6p
         6OgBxf+HLwo8bYJ6VClpT9UPuticE/TOD3QYSvs0VD8ktgwSMr7AhT6F0fNo6fPgYbP4
         LzdJY2rGIhBkQYVeyFW1AHK2lvqTohgDeKSklEgHvfUVNQSDHMHDceppdVyEr1Y+KaGg
         rTog==
X-Gm-Message-State: AFqh2kpOXF7bXCF3QvRJvHFqcn34fgG9FzGheCin5dE4rHlF4zmRzq8l
	US3K7K+HQGOBu5vctx11n+A8qQ==
X-Google-Smtp-Source: AMrXdXvrhJzwe4FNNrALyeQE8hsYn8wq66b+UTX6mGSybh7pXtZUjbyM41b0yvvw5Q0DEUW+yTHqUQ==
X-Received: by 2002:a17:902:8503:b0:192:ba5f:b743 with SMTP id bj3-20020a170902850300b00192ba5fb743mr5619644plb.32.1674014552585;
        Tue, 17 Jan 2023 20:02:32 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h5-20020a170902b94500b001949ae8c275sm4065347pls.141.2023.01.17.20.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 20:02:32 -0800 (PST)
Message-ID: <63c76f58.170a0220.b9d26.6c23@mx.google.com>
Date: Tue, 17 Jan 2023 20:02:32 -0800 (PST)
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
X-Kernelci-Kernel: v6.2-rc1-30-gf2fe7d2bb64e
X-Kernelci-Report-Type: build
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.2-rc1-30-gf2fe7d2bb64e)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.2-rc1-=
30-gf2fe7d2bb64e)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.2-rc1-30-gf2fe7d2bb64e/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.2-rc1-30-gf2fe7d2bb64e
Git Commit: f2fe7d2bb64e9d2369f2348ccc77f8de19ab58a8
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
