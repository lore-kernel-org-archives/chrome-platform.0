Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2C93382CF
	for <chrome-platform@lists.linux.dev>; Fri, 24 Apr 2026 08:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777019730; cv=pass; b=FYHnKvWpOkzLHUAuAdHUxblqDeFmb5LYV+UwCpw7iGq1jiYzBVhzWIrHOD1jg8d2kdwU69swBQM/iwVTc0VBznbHJg/thWoWkI+TaOfcCMgwFBYeHjUIi6h9jYkRROxMVGvOy+/YrYEKmYW3sMpfCeqzi/qOvhvvd33if54LDek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777019730; c=relaxed/simple;
	bh=Wb2NZyk9p3ZD1RGi+a3TbZh1s1hBC5hYX5GzQEEx/bY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=GRLDdZquZxBI3M5G4/2YWxrYSKZpoSW0u/4scpFIRawkXP4d9b/t7325hL8rkaNXXqSFOU3EPWP0n5hlrn7D8akogA8bmtinT8hhmJZFP0VCvqKQUDIiIgRyzHbT2DnUHRiiH0nB0/H+6nEmKJd6a+nKoOdD/3TfYXFRsxPEwRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tbnu+e7y; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tbnu+e7y"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79a46ebe2beso77680577b3.2
        for <chrome-platform@lists.linux.dev>; Fri, 24 Apr 2026 01:35:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777019726; cv=none;
        d=google.com; s=arc-20240605;
        b=cA1oB7rIrP2zTMTGBV4e3Ik4+9XuJpf50Z+Bp6qIvS/mw9iBxHNuCV2Hc7cjNlV3Zh
         4ue/SPPs84F3jJUaj9OLduPgCUae31jIqIVi0xqkUZxogRzsLAU0YHModKNkGKSR1y2d
         rHDs90xMU0YjokyZhpDsr89zE7H4O6dr4Uy6IuhPJegv5hA+ARme5+Q3WIWL9OeptsM7
         mt0dLt8EGgoLlwP4f08iIGEE2xiBe82Dz1vg+BxPtl2nHE0d1W9I90fy+nt2f96XmzOA
         /FXRiNrJ3/Xbq/6D0YgF+2PFluwNBdDVAdYAJ0R2s3wXjjo4D2ANU0xfslydaNkZ3TTk
         oPfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Yf/8IqNQDaovdpOFSKcYce7f9qCZwLgafviBhsZ3I5w=;
        fh=hg3yhbvMiPkvyTMUEB0j4E3RAnnx4a4TCF1COjfNEz0=;
        b=J0Q0KVvCCgNSnFAK4302hIte4djaJG5ihlz0/hbmqhCMt/k6pX/Z2uHeGF089lRGwm
         DYc/Qi6NDe60Td0bNaJiJErxgagCfYaZgpPUwuWwU4kWGJ9kA6sbF+blXN4wUo0oYc61
         YSYupbYvbm6zAeUVfpEYySX6DNzEYj6ZxZaHN+WykOTDWGiHZLB8oL/1OdBrSVQxL0Hn
         x+T5bWhaayKPdLIUhhH/FsBlfnd357+FmXtpxslCMMmC2ygvMM4Dy6P1BQa4OZhvhvY/
         u5mTd6qLhtSXgVMWFiceCOtIRAwKDMye5GUz0W/zfIqJkJQzmJGMhIbknFwfVo0tFz3B
         X5yA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777019726; x=1777624526; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yf/8IqNQDaovdpOFSKcYce7f9qCZwLgafviBhsZ3I5w=;
        b=Tbnu+e7y2Hg4ApgEQjcMQIz57YhjnDJ17Um8RKQz8NlwE8IvQpXqcutNgX2CuH6R0w
         coBtv5nwH8qb93qmHR2akSXoPyBTH1Rh26KaKox0Eh0SlYNpxDi0gfGjXDEWEoV7KXFp
         QLWriEbHvwobAVLAD5coqYudUM9GUxWzzhby3PsSDerdS7HmxjK0uYMqn/FmSnaMF8VT
         Gbo+Vj1Kk++yvQkWQqa4Omv5BS9P6dx4fEMZLvugRQzZhT6NRXVMgcrgOTCvoDtNFfyt
         4f9YmNDTnvjQhvVJCauTBj3D35HpJ9cyVJZb2y1WpoiVej5+ZIoM9+Ca+GfoHd8ohn+7
         rR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777019726; x=1777624526;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yf/8IqNQDaovdpOFSKcYce7f9qCZwLgafviBhsZ3I5w=;
        b=Cka5VNuGXtmGm4mJCfAt+BVgbqm1fEVWzRBMEXAX6SeOOcHfRRSDx+0P3eXW9+Bo20
         yPLt8Shg2jCrf/fvS6Wx1kr3exAievW9zSquefZUf//qgK/T8jTtAtBNTP4OBZLjGgCG
         quqQnisurr55CwwytsBd5BVLKdCQZXPFfzKy8/oPLQseO7eCSUhc6pkL+v6rAsquMu4V
         jl5ELcwmysL376Xgg4u25XZZHY6ovkHu4+zEVCcgbgwzTPH183qdkPZ8VAGeiYAoBzSY
         vXop/u5WN7zLsrSkhxT6Yb1Zdyhn68HHFIMekXyM73OlW/9Ndn/tJDrBkNJr/e1s/Y8X
         n9IQ==
X-Forwarded-Encrypted: i=1; AFNElJ9dx8oRTuOlyw9SC5o4wz/inaRpzFhr0k6U/XH7rl1/bX5ExnQY4kUvFE1y5TKRkSIuMrIuIecExfxY0E0B8EM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4nGwEqz1f/IjKbPKpUJjAClnajaBVWewdG9AZkwz51Kb7vcCN
	agpovKwon+/itbaudiO59Ud7hBnTLqIPBsGUoLZXnUqkgteT9ueuOim58MQuVscu0qy39Wdk0vl
	TWUNuyZDon1PrBRSNy2A9oju5QhBeZ3Y=
X-Gm-Gg: AeBDieuLpm6OQgs8oMjo1dFv6jKq0Bi7LotFB08xnqwmUXZm9cG7etn+6YOeAKlvfmQ
	b2j2v7KtqEnVtTDwRO95V8ZbNrJFCCmp/e5J7o7fmJnHeGWlJGmrymtbx9lz5g5GT8wrcKvRTg6
	v+PwJD2XrNFn7noV1PJ3pMvWV3kYHzLXxwWewxOc+6lFhavjNzFz1vcBoawGbrewxzIDyCumuIt
	r3j2/fGxx4PmqnRe68g+7Hm2Nhp5YXniE4yj6cQdVtDhoBse+H4r7cZb4XoaTlYzvIHt2nA27sq
	iAaGrqIYZvJ88muaGbVvmYCwro8RGyY=
X-Received: by 2002:a05:690c:6d84:b0:7a0:17f4:e761 with SMTP id
 00721157ae682-7b9ed00282amr317144297b3.45.1777019726201; Fri, 24 Apr 2026
 01:35:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415175707.3640225-1-lgs201920130244@gmail.com>
In-Reply-To: <20260415175707.3640225-1-lgs201920130244@gmail.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Fri, 24 Apr 2026 16:35:12 +0800
X-Gm-Features: AQROBzBCfh8cC53ewJFLzjr4G6uwJAuOd39fpxEBr2W3Pept2Dd28_9YtSYr5pI
Message-ID: <CANUHTR9_c=msO7mAax=Aj4U--GB=2ozserOvrTU8WueqdSMN8Q@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: fix reference leak on
 failed device registration
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Thierry Escande <thierry.escande@collabora.com>, 
	Gwendal Grignou <gwendal@chromium.org>, Enric Balletbo i Serra <eballetbo@kernel.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Please disregard this patch.

On Thu, 16 Apr 2026 at 01:57, Guangshuo Li <lgs201920130244@gmail.com> wrote:
>
> When platform_device_register() fails in cros_ec_lpc_init(), the
> embedded struct device in cros_ec_lpc_device has already been
> initialized by device_initialize(), but the failure path only reports
> the error and unregisters the platform driver without dropping the
> device reference for the current platform device:
>
>   cros_ec_lpc_init()
>     -> platform_device_register(&cros_ec_lpc_device)
>        -> device_initialize(&cros_ec_lpc_device.dev)
>        -> setup_pdev_dma_masks(&cros_ec_lpc_device)
>        -> platform_device_add(&cros_ec_lpc_device)
>
> This leads to a reference leak when platform_device_register() fails.
> Fix this by calling platform_device_put() before unregistering the
> platform driver.
>
> The issue was identified by a static analysis tool I developed and
> confirmed by manual review.
>
> Fixes: 5f454bdf63536 ("platform/chrome: cros_ec_lpc: Register the driver if ACPI entry is missing.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/platform/chrome/cros_ec_lpc.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
> index 78cfff80cdea..cb3ff76d29e9 100644
> --- a/drivers/platform/chrome/cros_ec_lpc.c
> +++ b/drivers/platform/chrome/cros_ec_lpc.c
> @@ -892,6 +892,7 @@ static int __init cros_ec_lpc_init(void)
>                 ret = platform_device_register(&cros_ec_lpc_device);
>                 if (ret) {
>                         pr_err(DRV_NAME ": can't register device: %d\n", ret);
> +                       platform_device_put(&cros_ec_lpc_device);
>                         platform_driver_unregister(&cros_ec_lpc_driver);
>                 }
>         }
> --
> 2.43.0
>

After re-checking it, cros_ec_lpc_device is a static platform_device and
it does not provide a dev.release callback. Therefore calling
platform_device_put() on the platform_device_register() failure path is
not appropriate here and can trigger the missing release callback
warning.

This falls into the same static platform_device pattern pointed out in
the other reviews, so I will drop this patch.

Sorry for the noise.

Best regards,
Guangshuo Li
