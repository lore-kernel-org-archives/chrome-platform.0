Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAA2266A7
	for <chrome-platform@lists.linux.dev>; Thu, 13 Jun 2024 17:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718300693; cv=none; b=csHNXCHzFubTu3/c74vcsybJBZWerfcfp8TFo8zJvK4xMP+x4tZfMBAeWVKqyI3omXO9OGPFFYIRxUsGmwof1E/FqCH38CYi1AShGvPBFHlpa1PxHTgKyYBHfE+Zxgg1HllQFyqtrIPjjFj8Sa+K278ijdhnP8Sv5PJMHXoz/1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718300693; c=relaxed/simple;
	bh=Cob0LB2XALOsBUE0oPEqLcIwGTnhyyR3d7E6pcuJJg0=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=cK/ILhOFVDyml2b8b+iXkKGUSgb8mZu4nbHaraBKT3Tb+PZkFBFpjZ0v1WmFeVnJQqug63oSnmLwl+dmoPu+g3EJDQFWS5ilEgjGV09tj/U0xKsYimgKNmZSriRYA8BNEZAP7hM49p4ezDG+9DgOtFKFASUu4zgGNSPOvnwyM0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=ieIrzpTH; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="ieIrzpTH"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f4a5344ec7so9594825ad.1
        for <chrome-platform@lists.linux.dev>; Thu, 13 Jun 2024 10:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718300691; x=1718905491; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Cob0LB2XALOsBUE0oPEqLcIwGTnhyyR3d7E6pcuJJg0=;
        b=ieIrzpTHqRHj1C+hOPGouSaSe9tHw7fDSXeE5lKvyJC0GnhPbl9EFQx8cnQfPlnwVU
         I3whssTt5n3Z+tNk+9Q9Ar+mNqcvARkE90gRRCd2Q1r9MHZR3II5PQuEQVscBcqoLvJu
         zJfCm/TC3GmaoHlmzDH++HsECYZ2oPbXf3dkDFOH30GWfbYLX/jsOBAguyoP3w3IZB57
         dYqvNpKTkGQgddd7g2IcYeDScmqZDbBYiqagYlbCTQMfm2bG3RuGcFax2WKNjVa1+K2P
         Kzamig13XnV9ZPG5lxm6Uy8cbYbRkNz9oQh0jwiUFRghl6gP+JwzfOPfrdUctLOrkGAj
         mkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718300691; x=1718905491;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cob0LB2XALOsBUE0oPEqLcIwGTnhyyR3d7E6pcuJJg0=;
        b=JCosRcpGwFYr3eEeX3fSU+GvPrvEJg2wME/9LncvYPYFrHXubcOqLtohkgJlI3tQgI
         LsDKm4PZWbIHqo4WWKV1BN3uMTenGKPVKFMWcKeaCMQTqiGzl8vv2DjFchM5SfB19Tns
         Dj6MG3nT39JZbOERcSu9tgMhBPMg5xLLk1H41jii/1DfN++pr9+VHmBCF08uf5K3CKkS
         kcHi3k9kKmr+7QMVdx0q4XPGaaam2lPPnLWI9dE6w5dkvOinY0ib+oT3SPpcTJ7MvAdO
         yM60EhvHKazib/VOhq3MioLlytGwZ5aheruSU7S3tXuljdYNG2nwi4YljncWCnZKVy2t
         pymQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1dLbh2ZR4N8s7DFZqtf5RuXzeY1AcSFNHoPZfQxRaJc4IWu9bQ4vBk4FzYhkf1YmwvdnPrAkAQmSsUiVj3pbAOHCRRk2sGYS9NhUXoTt2
X-Gm-Message-State: AOJu0Ywo09SKegR6jB8CcdHJItG7vgmwrqWNWbavvGgmR3hyG/Z+WIJ6
	e2ReltdwrkJjcmS4ELI2OqL+ZFrBEoKNlr4us+lYLPORBYiujeN7k80NbS4cxTA=
X-Google-Smtp-Source: AGHT+IFMElTETuO/eY5ZJFSBxB/vpsTIHg4LELmtaIdkx9z8qhqfds9ObKYnFSNy3BhdIGGwWj3h4Q==
X-Received: by 2002:a17:903:22c6:b0:1f8:62a1:b6af with SMTP id d9443c01a7336-1f862a1b85bmr5219835ad.21.1718300691279;
        Thu, 13 Jun 2024 10:44:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855ee6eebsm16647275ad.158.2024.06.13.10.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 10:44:50 -0700 (PDT)
Message-ID: <666b3012.170a0220.159b7.4761@mx.google.com>
Date: Thu, 13 Jun 2024 10:44:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-19-g77a714325d09e
X-Kernelci-Report-Type: build
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.10-rc1-19-g77a714325d09e)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.10-rc1=
-19-g77a714325d09e)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.10-rc1-19-g77a714325d09e/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.10-rc1-19-g77a714325d09e
Git Commit: 77a714325d09e1527d865dc011ef91c4972ffedd
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
