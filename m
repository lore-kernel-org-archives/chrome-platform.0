Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DFC190463
	for <chrome-platform@lists.linux.dev>; Wed,  5 Jun 2024 06:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717569764; cv=none; b=Pmx2ouakFAQ4sgJMCuwMjxwu1zg+SjZtGVCtrU44Eyv+SY+YN3GwAzjgcwQK2FKYboKMyywn8E0P+ND1nSnRhJpkVqSfKgb4xBzxKRBvEIpADeJbbLFqt63+XtIsGheUEPYolBW1iYjYmVKkpfMs9SxA661g+VQidTYsqMWzkho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717569764; c=relaxed/simple;
	bh=grRNp05oLFWhezf7QgYMw8XkIU4cM4fQ2NG1fmF5jsk=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=RjDJXSs9KcrvpD5D2AlSTUbaFWVEfTmFbdv0EidqIATEGJlamPLEYo6e90Rgv50bBtlxGKYVF623CufOntPM2gTnqde4TzpDeFY3qKtmjzHMtCcOk2uylZgwZFZp2AbiJ7zN7ORoiRtaBkkhIsZ922VN5GHmPr3kmPxx9Ts9ZyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Y8/P4KGV; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Y8/P4KGV"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-702508bf0a9so3678620b3a.0
        for <chrome-platform@lists.linux.dev>; Tue, 04 Jun 2024 23:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717569762; x=1718174562; darn=lists.linux.dev;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=grRNp05oLFWhezf7QgYMw8XkIU4cM4fQ2NG1fmF5jsk=;
        b=Y8/P4KGVtbWx4s4YvJQvOaJoICi9Db2Imnfbmk0U1nVmgGn8P3biu6FAnUHu8aJP09
         0SmZv7Uz+83BE3/Wy6o/bp+PpnBPyoQfdk2rjfh1F5c4hgJ1dsjWQPO/j6BaNtnfUUFC
         QJG8pr77mWV7jH/Z4OUOjaS8DZnHBNwSpEgwQC+dod6zzHmCgA4AFdHqjYEZsYlJlX+S
         /1ZisFxmcYIiHESk3Zjvj+YQYdzdPvBzMPd8Hox3GEN8njAxCgaQKHaPPJ42Ms1F/9yO
         nH31Mk3W72p1H8OiWGNmyIu+74Fq07Do5WSwMAouIjmI/LFgqM2uhPhy2sVy1i9gQCmP
         GfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717569762; x=1718174562;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=grRNp05oLFWhezf7QgYMw8XkIU4cM4fQ2NG1fmF5jsk=;
        b=eL//sYxHYPiYfNHDnsyPlTsh4FgtBAFtjU7n1gCS/65/G6xay3pT6wJ1enZwQ5/RSR
         a34sUbwHvWDKqcdY8DKYUAcPeLvQmTt7JOLtiPA1COA2QWhKTzkxYwu7kYYfGOpmHgFS
         1/PL3S4xcuYwqSNE5cYy8QO/FrOaNSc+p/vd16AqmUSIOkJ50joGJBFtYtjrNLBIo65Y
         NatQ0vbxEY6LThBQ/JIFOWo0VjQAlHXFZsEDedH8NCgBZNlWc8/OhaaGLwDHL6qLWjPn
         ogWuYlzLk/ZYbLAiQGSvZpA4r7oS9EazTSHtWnjiuItJS0eX1MG621dClirIZLRm533v
         n0iw==
X-Forwarded-Encrypted: i=1; AJvYcCUBj61jeFNNRBQvU3WNkOKZ2H/yfiUWu62TnZx8qSmYJXaUwrUQQ5XcVP2rCezC0ILtmqS8oApZ/TkGzp5PBJxUMK3RXqsxCQ99D2O32G9w
X-Gm-Message-State: AOJu0YypgMYk7Frby3+6+rMSLpWbyj+r18pvrzz276tL4XiO6yK0cSwS
	WWN9yLFpEPuecJ2QbRcOsnq+kj9Y/THQFOL4lGAW3zRzy2ykKQByL8DhMZilKAI=
X-Google-Smtp-Source: AGHT+IFeSFqEO8jlYyFODK62e1pjD85a1DByFYxYoACffmxa6COIzdf4Lydp+D3QMO2CRBL3Wiv3iw==
X-Received: by 2002:a05:6a00:21d0:b0:6ec:faff:ec1f with SMTP id d2e1a72fcca58-703e597a6fdmr1666841b3a.11.1717569762339;
        Tue, 04 Jun 2024 23:42:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70266890d94sm4754837b3a.96.2024.06.04.23.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 23:42:42 -0700 (PDT)
Message-ID: <666008e2.050a0220.25e9e3.d18d@mx.google.com>
Date: Tue, 04 Jun 2024 23:42:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc1-8-g106d673982336
X-Kernelci-Report-Type: build
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: chrome-platform
Subject: chrome-platform/for-kernelci build: 5 builds: 0 failed,
 5 passed (v6.10-rc1-8-g106d673982336)
To: kernel-build-reports@lists.linaro.org, kernelci-results@groups.io,
 chrome-platform@lists.linux.dev, eballetbo@gmail.com, bleung@chromium.org,
 groeck@chromium.org, pmalani@chromium.org
From: "kernelci.org bot" <bot@kernelci.org>

chrome-platform/for-kernelci build: 5 builds: 0 failed, 5 passed (v6.10-rc1=
-8-g106d673982336)

Full Build Summary: https://kernelci.org/build/chrome-platform/branch/for-k=
ernelci/kernel/v6.10-rc1-8-g106d673982336/

Tree: chrome-platform
Branch: for-kernelci
Git Describe: v6.10-rc1-8-g106d673982336
Git Commit: 106d6739823369c734a8fc3b13634274eee4f60e
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
