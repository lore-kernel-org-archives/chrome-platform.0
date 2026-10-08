Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E06F35C6A8
	for <chrome-platform@lists.linux.dev>; Thu,  8 Oct 2026 08:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449048; cv=none; b=F9v8bQzjL7TMM2UonFzizYVdCy/YG/Q7cXJPXMoXviRqlg/1ulNXz03GnFPGagfnNPWRo1EovXR5Vu3VzLQUDBIdMnQCa0xb8TKBf1yn/KAFVg8NiCpZ9sKeOdZ+8ZkAWUe6T6KNt2xqXQTD33767llkSE5SjbAtoEb9QzeyfEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449048; c=relaxed/simple;
	bh=2KIhFcZHqJ9+pe8RaJcUtCeBjZwM7wSmim2j/mLmpTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rO/SH96hJTkvhsh6VHk0F3CUvwI78dVlETN5kfnPOgrt6gR/1Mz65kvuf9DzcPDhC/WBBbpOTPr3LEMPmTRWXXeiI8aCC0MCx4vATeT8+uMWX80NNHICDCG2jAoYyxny+G5F/NKF1IZB/NkFZ89Lgih4l7E5+ULBacMmAfVXwIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9XxfOnK; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9XxfOnK"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4f48d91ba7dso1439840b6e.2
        for <chrome-platform@lists.linux.dev>; Thu, 08 Oct 2026 01:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791449046; x=1792053846; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X9QWLs+iWZ+eZ7ZEkdtW4NIWcT6hdsnE5DwV3JPb2uE=;
        b=k9XxfOnKpJNj+Z07drfpAnsmT+dUAbZZ/MKbg4ZH2fUnTyK0CXb191qXlF3NKnlfJA
         YkEhFVjEy1gjOfEwyykQl3nuiLCwvw1vITimV1Txd4Tn8L7pilBx3gPLkXvjsKY1wVyT
         O1A9EHDJG28ToKS5T76qIfT+8LuwK/WT5nNS9w40RDc0/NnVMfYFOKc+SfF9En12L0ON
         0orGYa6LEWBEL98FAalO01YntAhTFPINyT6hX1rvr4HEIcTsgHhGedBJBlduZrTllVo+
         qugl0feZLpILoZMGUqh+G70K8IkWFQbXInCIkgimi7WdaVvP3oY+WwITher8nlALZRR/
         xW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791449046; x=1792053846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X9QWLs+iWZ+eZ7ZEkdtW4NIWcT6hdsnE5DwV3JPb2uE=;
        b=BaYxNIMD7KdySTrpBOppRgj4SWOUzAmplKp/RfqbBRSyskMw4xbLsWDAGjXcFMpFdz
         Un0pn/TxCDosG8HIq+kzEu2Dc9uCFc2FgCsbsZou4Uhi5mCO95SkBjA5jYBXGauwFHou
         LAhUdF/mvYvGfOUbzx8xkNzGCXP+9PHo3jQqmIRzOqVwlk/nbL/fXMIrJBg7eI23MHNx
         kmVqJ5gBkdVnj2ch6JJ9/51Zm/eBDDP4LpK/ViYJw0FrPWPUVmCmfI15ahNlA00eovKO
         tzbBQbvAseRcCMOuw/hcWt0hBvPs1zbXghgKSfojJTBspqxTp/olN862y6Mq664bAus8
         Qbqg==
X-Gm-Message-State: AFuF++lfArGryOKRB0uX6orC1JAh8QIZp5YH4LImY8kpHNMgfCUlVhGI
	Yj8GaQpeTxMTzc8KWeKBt3WF9x4zVdBsyTvJFnL0MZoSRBaHDsii3dkD
X-Gm-Gg: AYBFou2vFQQd19LEPCeuKZmIeQ2bqE3g/EeLz3vn1BfF/YLfX0T7JW4K5dbAgwioyH2
	0F//omTHEIx7W3oQBWmtjg8fR57JwTlqlAC9x6rBGB1EKrMm+HLabrQwVfwwl3X6mKDgg1LZ+5o
	WW+6PkdS4H0ad6d67V0cVHEvslPjXpQyeeL18NvnSOxy8QmjzzIukl2XMcGulQSCzcOYKi46lHT
	HBClPnCnDQyB0aEp5blkoJIXOBQkAbHtls9NeQAuOSfincfp/Snlc6IenH+IjSOiXtsOGIN9SyO
	LAuv8ujpaiXiALPoqwZDZWbVCQvD7j1y4CpuR3aMqQBDqOgzYjmnUqVgS2aWt9O34NSgrEZ1tPw
	nqUgtYd4H2o1r8RHiCSFr/6ZDnxar5nRPjWrS1p05jTq0LJLQ3y3Xwf4y/YECM7Wwlh0fjfrj8W
	HSb92/+gjHRIOWaXE0xrR48nhWjXeG9JHlXMeXI+gNzxAEB+FIegzfUPxmuVi9lQ231Tkn/tRUu
	AYv8a37bxVQ7mA5JfY=
X-Received: by 2002:a05:6808:2e43:b0:4f3:890b:5fec with SMTP id 5614622812f47-4fc464799d4mr4704509b6e.25.1791449045853;
        Thu, 08 Oct 2026 01:44:05 -0700 (PDT)
Received: from omarchy.home.arpa ([66.69.194.205])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4fc49032c44sm5375407b6e.10.2026.10.08.01.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:44:04 -0700 (PDT)
From: wendler.david@gmail.com
To: james.a.fairweather@gmail.com
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_usbpd_notify: Only use parent drvdata when parent is GOOG0004
Date: Thu,  8 Oct 2026 03:43:51 -0500
Message-ID: <20261008084351.7680-1-wendler.david@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003222855.23707-1-james.a.fairweather@gmail.com>
References: <20261003222855.23707-1-james.a.fairweather@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi James,

I wanted to report successful testing of this fix on another affected
Chromebook.

Hardware:
- ASUS Chromebook C223NA (BABYMEGA, CORAL)
- Intel Apollo Lake
- Omarchy / Arch Linux, kernel 7.2.5-3-omarchy

Before the fix, disconnecting and reconnecting the USB-C charger could
cause a kernel oops and leave the system unresponsive. On this machine,
GOOG0003:00 has PNP0C09:00 as its parent rather than GOOG0004.

I built and loaded a locally adapted version of cros_usbpd_notify
incorporating the parent-device validation and NULL fallback described
in your patch.

After applying the fix:
- Six consecutive USB-C charger disconnect/reconnect cycles succeeded.
- No kernel oops or system hangs were observed.
- SSH remained responsive throughout testing.
- USB-PD negotiation reached 15V/3A (45W).
- The battery correctly reported Charging after reconnection.

The driver also produced the expected diagnostic message:

  Couldn't get Chrome EC device pointer.

This was a locally adapted implementation rather than a byte-for-byte
build of the submitted patch, but the results support the fix on the
BABYMEGA platform as well.

Thanks for tracking this down!

David
