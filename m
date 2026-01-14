Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D525272816
	for <chrome-platform@lists.linux.dev>; Wed, 14 Jan 2026 20:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768422795; cv=pass; b=iqfiafYs/9VoqtCEC3W+EhssFZ6wp+s9zt0sZ2VQCnxtl3YlDpVISe0ip37peOVyYbsYv+oZACXkbP58Wh61pDvlK55XzCH9Zbx7VRalHllkLV6n9OuM6rHHv/152VfB0ulr6pIzN8dpIiVk82D2eqV3oDpTm23b6Gp4bssDeIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768422795; c=relaxed/simple;
	bh=L2qUhi5GqLcT68OEJKLecI02kmIzgIz9YY1G1+QA60A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KGGv2mfoTLEykSc/6S/wdO+DWUjzJkzXg4XkD1613vB4681UurH0b2Ej3YGnpE05tCqWu7Lx5U/Lf73pAVCn+HrcmcDxc5VjYFB8kAaUhYRJGdCYtGJMTwZhuiep5dyuzKIQ5/ciyGaJCeZ5O0gLYqzBhd5b0sB5NOaU/d09Ye4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=A4Q+d5zX; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A4Q+d5zX"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5014b5d8551so78151cf.0
        for <chrome-platform@lists.linux.dev>; Wed, 14 Jan 2026 12:33:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768422793; cv=none;
        d=google.com; s=arc-20240605;
        b=juIs8LXxpHwdg18eu5TonQGjuz9zEVTFxcTVTRNnZ7Vo+pVwmqCuahoERA6oge8Ma/
         FMM87ZLFGKTABQRs/pcsykNNTVp54Qp2VkN8NVKmLHgjsd9+GCtdltVjBok+h3Ob6kSv
         Qp40nhIE+eZD2cgu5kL0PQLjZrvW6iSPlOvTGaHlELy8DE/kb3Q9BNUxMJtotisZMBLx
         clP+Sph5wVzKOEhJqiZe8zar4ZkoAI6EAuXpsZzb353AJ+xSYGJcg6lNb/v6u8lkl0Ks
         swFmCmekCDzwqaKROmhSxO7m/cUChLDmDnpoaH4VPKyDxK0cVbhYVcLJkI7KruXOrWad
         Mvjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L2qUhi5GqLcT68OEJKLecI02kmIzgIz9YY1G1+QA60A=;
        fh=pStS84zGOxfELWUcCDI6nmzUP3wsh7p5PXRJCUTlPbw=;
        b=PcCUso76TIMzWdsiEXSsNODyoEhWenqN5/LzmCXdBl18/GLS/1fb66dIMUj9UHN/14
         pY1HfzI6GUwPAQ61RZKPP6r9h27Ml0BMVt15vf5r2I81ck8r0jLW1p2U8mC5yDtClZlb
         L/iga6ylcwstyL7RG+0UesI148TJJrRimTNd7OAjLDUojezeh7hUv6g/3vDVxpilc6ai
         EPClFzOBy3uz/Zpah7sSU4wZrglNtYyUsNwd0YvTuVcllFF/ObFyz+oszoP8zYdti6R5
         E5txlwDabWvBVG4hP+eQLbrFIdQsyW+BbKH/gkQYgcp/X/Z80FcxEzcBRwC7v0KjJw/o
         etdA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768422793; x=1769027593; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L2qUhi5GqLcT68OEJKLecI02kmIzgIz9YY1G1+QA60A=;
        b=A4Q+d5zXw03kZ7qCv+VDzT4jYPSbzXBbyiHwdoVNg+AuuCr/C4PACdOP09Vjku8LDI
         Z2RPobUDLaekVo68oD4Z0zegInumcT1Wz2rIvP2DP9k+LTFu3EAOV3A7DIsUWovSIVCJ
         NOsdjCT/hqPwWgk5ZxudFcf0uwLsfrUGUUJfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768422793; x=1769027593;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2qUhi5GqLcT68OEJKLecI02kmIzgIz9YY1G1+QA60A=;
        b=KjScJZPEOGdMMhL0iF7NbVudPJmL79F1RqVUP0ksrCgEn2mO98KCtjC/DHxUzxYtQy
         gtC77J/beq8+lhMxWmtlU6VrONHj1bYBC7TJg0QUJm4VvzuRA3wBdfhffpuT0DSv7wPj
         3lgXu9+E6Jk9toNzgEWCZxGjIzj3LRxHx/gFy5w+iUwGVyfTRaB2pG9dWNShoVRzXsM8
         LZfx4ony4syz5k4cIQxlhvjfR4Y4UBkaEfNpn7tLpugkCNkRw8ftneFeoG7lhXXWl3tp
         HTNQ0h8ZnVWhmm+ouhANuQPkezWmfX+lfILuzOhEt40I3Bzwrmg0n9ownCoJVh67Qy4p
         hj8A==
X-Forwarded-Encrypted: i=1; AJvYcCXTe5wJYHQ1uQdgzU7Mi68ScAtf2JLidnMwfO5VhSEB0zaVWAmPxZahJtq7PBQB84TtYtbhGDE3V4b5jMYuyvE=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywb5YKxGL6/24FlIj/AUe5z36dUFZptFgPtE2SDiPRF0/FV5QVr
	KK/acxUlp53vpNUENXC2BA22lAEsd7B8bEIRQUz+HoYAESqYlxJUZuuQfP6hTbov5zqeB9dA45s
	LVP5TOseayRaxFBwu7XY+xHoXzlrQGdJ0PNGEEcbp
X-Gm-Gg: AY/fxX7dIbyGfT9E667zu+jbfBE147lt9amaKoEpPDpa6F0wXzCw3W4VvgPcNEskII0
	WfD9L4UPIHmVBML6OW8Un+gaXXrKgTanXnylZfc9odsdQfSq7ibO6WbojZkSSE9RcCukaTex97O
	DtIsdTUUL6X/yrSRwnoGieCpR23E1/xmheN6gM/YbjefSEQMJ9+ok5/OXcKIHfqE+N2YLG82kTi
	ONxnFo1vbYrboJbMP7R0VbUUmSM0AuVMJLXYFHtthxIKoJK8Cv5j3nz/Oj5qEaU15aB8vmfdtEU
	m/EqsKjgFQQjtryFftMNHjnN
X-Received: by 2002:a05:622a:4b0f:b0:501:5180:3c90 with SMTP id
 d75a77b69052e-502009984cfmr1248501cf.15.1768422792691; Wed, 14 Jan 2026
 12:33:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260108145058.56943-1-tzimmermann@suse.de> <20260108145058.56943-2-tzimmermann@suse.de>
 <CAODwPW9_ym3E4za3yoUAs0+1sQfaKTDOau4Oh9Zm8+2uvYVgFQ@mail.gmail.com>
 <9d9015fa-aba4-4dd7-a024-563f58b7f43a@suse.de> <87tswvf5n3.fsf@ocarina.mail-host-address-is-not-set>
 <CAODwPW-JdJh1QmyMWxoZdaXKTE-y0n5BRSZPaj8Ntszyu10OuA@mail.gmail.com> <85fbdbe9-28bb-43c1-a5cc-6ad8861b96a5@suse.de>
In-Reply-To: <85fbdbe9-28bb-43c1-a5cc-6ad8861b96a5@suse.de>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 14 Jan 2026 12:32:59 -0800
X-Gm-Features: AZwV_QjVwzBhyPz60Pd4NCPrZZoJImvApT5iRWKTNbJvb1nRjPpq98n5BJnB29I
Message-ID: <CAODwPW9vkYdqtHbVbwrrJ5P7Hp=6N7HwrSGiog1DwzuNSruSOA@mail.gmail.com>
Subject: Re: [PATCH 1/8] firmware: google: Do sysfb test before creating
 coreboot framebuffer
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Julius Werner <jwerner@chromium.org>, Javier Martinez Canillas <javierm@redhat.com>, 
	Samuel Holland <samuel@sholland.org>, tzungbi@kernel.org, briannorris@chromium.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
	simona@ffwll.ch, chrome-platform@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

> IDK. My take would have been to provide the coreboot table under
> /sys/firmware; similar to DT. And then walk over it and create devices
> for the known entries.

We have established userspace infrastructure relying on the current
sysfs layout (at least the `cbmem-XXXXXXXX` nodes), so while you may
be right that there may have been better approaches to do this to
begin with, I would much prefer if we can stick with what's there now.

> I have a new iteration of the series that creates a coreboot-framebuffer
> platform device for at the same place that currently creates the
> simple-framebuffer device (in framebuffer_probe()). So we can leave most
> of the code it as. There are also a number of bugs that this is going to
> fix. I'll post it soon.

Sounds good, thanks!
