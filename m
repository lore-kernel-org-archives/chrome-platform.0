Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2602D1925
	for <chrome-platform@lists.linux.dev>; Fri, 10 Oct 2025 23:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760139774; cv=none; b=T1Kgq2LExLWH3CCHUgnn9dTKBgQSY5TLPCx/BT4MOY09Ig85QcURO/Z39G+5SsrjTr2QHUcjodVklPWnv2Zd4zaZ7Lbge4YPP9JPVVpPATkIL2LRXBnbWoi9P+1G+26S7Rnr7RdoMHBgPsUegnEEhI6uYlLhq5jwX3O6ClpOSV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760139774; c=relaxed/simple;
	bh=1DHRMQqIywXJrr6QTGXP6duk0tt6J5QON/Qjub4crf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m+qVqG8fSCn1/SXi69P139dcEMERj55TSGdt0P2Qwx+My0wpxx3mY/zG6UAeJqL/n9OvwZN/d0r9dVIU5i8XiPhBuwObY7/Xn9VTvkP8B0AD4GWIG303LjIxq+SUvJBTFa0W0oGUFjQ3gJD53xi5920Nb6sZ9Zi+PoWG4cctfCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J0SfrZoI; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J0SfrZoI"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-421b93ee372so1339433f8f.2
        for <chrome-platform@lists.linux.dev>; Fri, 10 Oct 2025 16:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760139771; x=1760744571; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qjgmlS/nwdme/rqi8+Zl0mMzFEWA0WaAZGElUraE+oY=;
        b=J0SfrZoIPrPCaYd2oPv2HUlEVNb1rsjYocutbNLk+Hf8wGwyQx9nq+VXdvbP8ZjKA+
         pMuqpZadJrfd6ZrwTc8yrrewOArUvCtXTIt+opR4jEs1s///h1cIAsaii/tllMUYnWgy
         uifIMV5ICe8bgLruFExRXXgffg0R/QXMyuB9gBcdfHd8Rg+yw9jls+hN0Saz7IKUrF/+
         32VTIYVJ5H/ccjV5dq6bvzGuFKNJsLRHsaKZmvo+ZiFAHc741cRMCxjmQ+c0xj1QIC/M
         N36WdJTR2+DpdgHhcxpjpmlnAIItt/1u8nUt12uFmCfMdHPtlPZ71YTuDHqU3J8M2H0d
         bAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760139771; x=1760744571;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qjgmlS/nwdme/rqi8+Zl0mMzFEWA0WaAZGElUraE+oY=;
        b=FgktyizOuGu06rFUf9gjcfZY9Ik7cuQ2VJHYbs1MR1o0u4kUv1lYLgbZUhZhJePUO+
         Ey9vr6TC9JWOmEicgCRV0vFAoeYs70iLvRXYOWomfDPavg2SRwn5S/9odGxIoTFp8YcL
         tVsrfEfw3TQOZHWDqfvIZsvSgQLSwoQqijuOzJinsURZVLhPAfjEVMrMB+JQFpBzNHmz
         4wo3hriBFBB422A95zo9MyfnscEn2+dRmtxeP3D2HrWecpBFaXWNIJqbGZw7bMTYO+3M
         YexbAv6rTJFxMfbVUsbkWeAfcvn2L2GmhtAp30U3FA5jUBDcb9pdXv6KIv9p4QbOjHUY
         svWA==
X-Forwarded-Encrypted: i=1; AJvYcCVr63Cxs0glhKCaYlSRw6+HqOpEhTp9/zhlS5A+wZCnuA28evnWucmKHCvdKxbC2oOD2ZyVvauKJAsge9KzVE8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw1zg6911ZWeSsGP5pE3QTfiDSfllbG2RGpTCsPMZAaqx1UE6Q
	JfD50wQ4UCJWu0/4+LcCnpyTAgVAeeOMxKrckSr/sXEz8uRrQ1AwtHv3aVYbG+u2wkM2BC8g7wu
	yHMcz+bUNqZz32P0vUyHA9cL+tjKDPd1SXXexMbmp
X-Gm-Gg: ASbGnctr1sR2rS8S0+zgTuNJOmeJ5pCJiU7Nao6gBqY0zVY9tKE3g66ST6od6iKKt3K
	SnYdYweYa2D6TYtOKhOqSboPKnO5VK5f1oFz7CNZJB2Ex1+vc8LcdZJ1w1jlDCjK1qvr/F+4Vfr
	wFSeX1D3ynzWUviAJKqrMyJsmXU2HklF7UF8kRLjF5SnfIn65dw930lDzafv08kZSmZfRe52hqK
	eW377SDM3HFgroynxn3cJVwfCtInqvq72vBSU8JN3toT13HoEtf1ecDxbqIHTMsTpZ1Bu1rBg==
X-Google-Smtp-Source: AGHT+IHwk0C8u8+BGJMJhnPgtDgiHfihQd43A30Zms6p211AfNBUz2Fb03qCPj3iq3U+g5DYO0xAbnnUFf3zJMfbsts=
X-Received: by 2002:a05:6000:1a8f:b0:3fb:aca3:d5d9 with SMTP id
 ffacd0b85a97d-42666ac39c0mr7811026f8f.1.1760139771103; Fri, 10 Oct 2025
 16:42:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251009010312.2203812-1-jthies@google.com> <20251009010312.2203812-4-jthies@google.com>
 <zcs3utvlaac336ezw2y7mzbbjsqocbls3e4nx5sc4tufiig475@cekebowcrpmz>
In-Reply-To: <zcs3utvlaac336ezw2y7mzbbjsqocbls3e4nx5sc4tufiig475@cekebowcrpmz>
From: Jameson Thies <jthies@google.com>
Date: Fri, 10 Oct 2025 16:42:38 -0700
X-Gm-Features: AS18NWAbdJz1C0NgiYf1yQNoHH17CeGVC6GnFq4ht1hoOI5sdcoyeMHRLCTzf2I
Message-ID: <CAMFSAReOGgXAKsTPiGi55t2Xt=FsKu9FAznmYzDU=i71N-GTyA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] mfd: cros_ec: Don't add cros_ec_ucsi if it is
 defined in OF or ACPI
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: akuchynski@chromium.org, abhishekpandit@chromium.org, krzk+dt@kernel.org, 
	robh@kernel.org, bleung@chromium.org, heikki.krogerus@linux.intel.com, 
	ukaszb@chromium.org, tzungbi@kernel.org, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> It still can be a subdevice of the EC, if it has a correct DT node.

That's correct. What I meant to say in the commit message is that it
does not need to be added as  a subdevice of the cros_ec_dev mfd. I'll
clarify the commit message in the v4 series.
