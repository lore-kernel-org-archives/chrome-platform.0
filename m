Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C932F364E
	for <chrome-platform@lists.linux.dev>; Fri,  4 Jul 2025 09:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751619795; cv=none; b=ATMMZPDvRHd8K2wJG8CfuBAI2a3Anmxon7ADXV87J0HQ5/sCyTyzTDSLJVlcVj7TyASzbMevB8Js4px+RaH0s3PYO+atyls0dfsFMUZT6G6OwcKBLCo0EKYwVfWYI0ybZoKvShrpzG63Dd7KVxunymEWTlYS1BE1CaDpkReq8Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751619795; c=relaxed/simple;
	bh=uUzWrBnkFKaNbXlvQ2xhOAf3ndFwok8mFUMeM+8JcOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oT3FIDPF+5DvO/D+NjIc1mPYHWVnU4nszxbbW8DwIPZqCIZ2MobnkzkzYlJBCPj4wgGrBDEZBpUXXtGOP7E91T1hDyZFzV3MvfgGzEvxoRSu5XcdFMo2iV/cqn8/skE13395XBihyUei/w8Yxg6WsV5ew+072qnSAJ1Av10j+74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A3OEr6XB; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A3OEr6XB"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7115e32802bso5258727b3.1
        for <chrome-platform@lists.linux.dev>; Fri, 04 Jul 2025 02:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751619792; x=1752224592; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BTFilYJNXAPNrxQ7dAl/LQhftsdOQUS9mV4AV4qlL04=;
        b=A3OEr6XBlRpX7i+wsMkWD+u9ab3f9dv1L75tPFM10FcOW4md4NBTbDk1NRKM+4UsMf
         HyUp5iw+ual87ZNZZuRu9MOXWtBYbdGV1rG6tVoSiS5gFLpXh7wvhmYLDomLRBEGnamK
         qADw6nhslf4w8KQ6QGo4Kr0ZQrEmwmao1dpJT3THTXaqs9fgeRP2Lku1kNz0nOrP2IWg
         uTwnxKvyzFJH4064AyqdPfeZ5rKobmYq8GwU5gvvQO9dZ8ArRoAGpgco7CJ3G2gmLFO3
         S9y/V/KGyRaawT3Gz6H77GXMX9ByH//7O2Pe8t0R0bD5Cbz5rDlWUT75UC0ZpOm6Ly4d
         Db8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751619792; x=1752224592;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BTFilYJNXAPNrxQ7dAl/LQhftsdOQUS9mV4AV4qlL04=;
        b=L63IcmP8/qCS6XSEyySPQe1jdfjRuiPg3EfGwJ5zLeeTQJw5UkZwS3CE8vhY2UXZxB
         hJfltosqwFyA6mAHidxAoVoiSaASBBQ9GXoYQujAXgrSsXF0jT/R1FTUmguvCMGc45EF
         9IkhQtQzLnelsLDToUjZibzokmCU0mqgefMRWlPmq/wihnu6J4G3tuEIAP1u8aUEJvUk
         W/DcHPefMrVMj1Ny58ZtbABZVGxB15SrkvSLVQuN/oKHUATeyMgRPtXsRJGTnVh7JIOF
         LQeDJ+Kzwfg2C1Hs1iM4xqbekmXelX19MoybHguS9jNdaB17dPewuqBr6AfWzI7F/C4K
         2lUg==
X-Forwarded-Encrypted: i=1; AJvYcCVZKUmpBa7wpxMq+9UoKWgKaBlJi2O/n6RxWh4OCPfgzO9pDaKFZ7f0UVzbBXfd6FUDlyuryo9wx0QtFm8Hsik=@lists.linux.dev
X-Gm-Message-State: AOJu0YxlLy2QNn4lGo1oWy9heexPuel/XWq7/Coaqig0F5WYrtbYmb+f
	RcCtzo8autAoF/ks0pIUgGWS5pw0ZpAaJIptZghEqSsqBUjmhw4ipPGrkzPjMxIrkjFBDgEbovG
	hclRNFWAZv3fUAvNRHXANwOwKPGZMnKchIff3vLqh
X-Gm-Gg: ASbGncv5YPa0TM8yoPheg68VJVIk1PBL2wnlsuzjfRAuJS32T8qSPUACF9rW/anXxMW
	JgV67tzOL5XmQ7Q3dPTZm3kDh+hoKk0cE00oRTfLnaiUKby7lXFmiR91ImbdDMwYusBDMDzcPxg
	2U9w4b2ZklrJEmVkgKZ0e63wdSJdKFon3DLTGdIBSGPxYL
X-Google-Smtp-Source: AGHT+IGSkKvJXDwp3Qlxewac1A95jZijcHa2HWTON+RGUIumk5bR5gd04+WBy2wsJXVwGh73pzqbDoGsvMyM/CYfBqA=
X-Received: by 2002:a05:690c:386:b0:714:21c:5553 with SMTP id
 00721157ae682-7166b5d65a0mr12737017b3.3.1751619792400; Fri, 04 Jul 2025
 02:03:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250624110028.409318-1-dawidn@google.com> <aF5N5jrRUlj3SUGS@google.com>
 <CAJ_BA_CppC58kc-Uv49PSmWFcCih-ySuGDuRcO5-AWQQqcqWVQ@mail.gmail.com>
 <aGOiu-sXFj1EUQAB@google.com> <CAJ_BA_CZWvC2=i8riNe5LReLKzPXK1vPwymiG2dzLEntda7TRg@mail.gmail.com>
 <aGSuS81Psqm_Ie4N@google.com> <CAJ_BA_BQOQe61r9t9rL=UiOqpHwOoTSbQcZNe=CrCcjMha_YQg@mail.gmail.com>
 <aGZrhe8Ku7eEIRqm@google.com>
In-Reply-To: <aGZrhe8Ku7eEIRqm@google.com>
From: =?UTF-8?Q?Dawid_Nied=C5=BAwiecki?= <dawidn@google.com>
Date: Fri, 4 Jul 2025 11:03:01 +0200
X-Gm-Features: Ac12FXyja0jg_LweiVgDD_zMC00gBd5URyWe4Lg_tLXCva5kdNJ_qsJNwacpodY
Message-ID: <CAJ_BA_AMaz0GWxOHJYws95h3fRdErghqUXPBkhrB1_eYegOJ0A@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: Add ChromeOS EC USB driver
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, chromeos-krk-upstreaming@google.com, 
	=?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Content-Type: text/plain; charset="UTF-8"

> We have seen a similar crash before but I didn't come out with a solution
> at that time. Could you please try [3]?
>
> [3]: https://patchwork.kernel.org/project/chrome-platform/cover/20250703113509.2511758-1-tzungbi@kernel.org/
>

Sure, I'll try the fix once it gets its final shape.

> Given that:
> - The crash you encountered is a common issue for all cros_ec_X drivers.
> - I prefer to keep cros_ec_X drivers simple and similar rather than have
>   something special (e.g. the memorized `struct cros_ec_device` in current
>   cros_ec_usb) for fixing the crash.
> Could you give [3] a try to see if it fixes the crash and also call
> cros_ec_register()/cros_ec_unregister() everytime in the probe/disconnect?

I agree that the drivers should be simple and similar as much as possible.
But to be precise, I think, it should behave in a similar way as much
as possible
(e.g. reboot EC device doesn't cause re-registering), not be implemented in the
same way. That's why I believe the current implementation of the drivers follows
the already present drivers in a better way.

The specification of a certain interface influences the driver
implementation a lot.
E.g. the SPI driver never frees the cros_ec_device struct [1], because
it is very rare
that the driver is removed and reprobed (only manual unbind/bind). I believe the
SPI device structure is constant in the system. On the other hand, the
USB device
structures are recreated every unplug/plug (reboot, sysjump etc. in
this case), so
this approach is unacceptable.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/chrome/cros_ec_spi.c#n752
