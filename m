Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1F526C39E
	for <chrome-platform@lists.linux.dev>; Wed,  5 Nov 2025 21:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762379358; cv=none; b=l3evLGv4vuYcuVPdA0c/KS/qhXnv7vHDSSAY1V78XdZW5Qk4B2uEbrwmSL0h0EOm2qh1Oabdy0YueTO8QaqBYc+48SMyLROhzbwF695d0tKkashuXgZuJe/Nnbq6km9oSm9Ynx3Nn4SFxaEnQLYj1EzVUr2Y1afwUe1rkcbSy64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762379358; c=relaxed/simple;
	bh=T3OpidHX2IFHWxcVVbNy5goWv2uX9ql1ENT6uZoLM6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bh69WRKr/T+cBJqmggJmIHj/HB+YLf8ZDSutub9W389BAzLbodjEhfDl5M0jNdGEo+GMUqvx/byVsxvnXNqqZrMRNCh5ybylJ5fb2iQc5XXoZo3fujz/1tweLIrFay78+fDYb3yICWTEyFmDWrHm9IyJlCzuPv7Byd9b9tejazQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XCjy53DZ; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCjy53DZ"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7aace33b75bso338873b3a.1
        for <chrome-platform@lists.linux.dev>; Wed, 05 Nov 2025 13:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762379356; x=1762984156; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YkSXNAZbOjzhQnnQ/OeMxCnZIysKbvh766e3GOcQ37M=;
        b=XCjy53DZow7c7TQw+H4rB59NTNvYE40pUJsmk04YazKdAmf6+su0C5a/U6l86v7rI9
         02ErcczKhByAeFKpu8GHFb9/+0XsCc9Ojp0zl4U9uFU/MPLdeFudG3/QoKf/dIA4U566
         czfLvpvvsVcnhsJlsU0XZkIpCt0h0ElyAeHtMqr89NLDF1D+HhdxL65TRLNW/eb7r2mp
         EREwye/QuNvEktVKw2rDwgVNShR1rI3FJVonrp+V7/s7LEMKDW3CWz+Kp3tnu6tJWb3o
         xXIVeVJ8txZa+msZactWlK5bX35EFqqB8GBpzXTqdL0cnlsvE6boXJGK3sCfUpxzRYzV
         K6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762379356; x=1762984156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YkSXNAZbOjzhQnnQ/OeMxCnZIysKbvh766e3GOcQ37M=;
        b=Min5cp5nnz9LtMpW/Rd/KVqnNeejcOwFON0a66Yns512XXNgDZb00YF6w9kuvXzD0F
         HLwgQSW5lpqxY7xt07tX6uBuF0PbYHP1LD61k0QYMPqCiE+Rsy/000RsU2yThPZbsmfP
         UD5sTQSTGx/JEX3l1aYpCS9Wgbze89B2K/6b6dc8ePcvSD5J84wt6WhLg+PVxwW8CGHp
         nl1GaUFATUJG5X6ro5fEOUWd8+rkB27NUh7lVSoijLza3YtKq9CBLp77hkeRLNTKgkjF
         UWwn0LzJIp3qMdgUrCmEk2OwsIo3tiiKikK6GX0cDuKQUjesomelL3KmkdMg0XI3vkyo
         Py4w==
X-Forwarded-Encrypted: i=1; AJvYcCWwOx6iDO9VLEmqOmCldYcLFjkh6bss2mMqy7FhZaYqlTgYzUeUX5EapgNuL+KCO7qZXPpl91grw9Nt6lACy5k=@lists.linux.dev
X-Gm-Message-State: AOJu0YxeQm53Wavkdy+WeOM08kCbrcWAvf62VFI1j9mOKy6E82sEdmA3
	jPTdEd4EyeAEIOyTvQAcAiUmc5eut9oav66hnkisLgECH+MZFSZ4nUSA
X-Gm-Gg: ASbGncvOy3xAV3MuUoBWvbOR154DhJpNqIYho7SnkcQXN8SR5SH4hDepwLmoMnoE/MF
	Q/wMrcPJeoOpnjcMcvq77pNzelysg7jO+PBkf0IPGCMZFE1m77n0hkWVLjj/UiPBoc4nBy2JoCj
	FsLf4wQFmV1PBuRvvdQoOATp7PA+Hm/n8AO1C1mGfzqPHXbQa9d9NrMSwzfCZkVxhpfu8/uNeO8
	ZWsRrL/gyRsoPhf2AmVIdLS5Jjq8Jzmba61fWAeBOuClt6yYwGdPEUCroM2g0h5yp2k+STW53lo
	u6AWm9b08DYfOVSZZvLI2SBmgxJWinJNtMjAzcanA8M1ebY4hQ/lUYFU0xk/wwofbkz+ovXsG0W
	Q9LxzxPx3M28nOW4rKTV5MSlJLBqA+CzyyhlyGptDr7oSK/IzgSb6KAF+ZVB2dzfTkmipJ2gYeE
	R7dXfOSMc3+Gtt9O3fKajGxpVrKqVdzG5++ZyawCALLA==
X-Google-Smtp-Source: AGHT+IEfxkY2DlYd44idBXTNooK+9iUwvWUJNyG06J8FehkzWiWIPxPnEv5UUZ5iB1IZqawGc7+gAg==
X-Received: by 2002:a05:6a00:1883:b0:7ab:21ca:a3be with SMTP id d2e1a72fcca58-7ae1d153f44mr6218257b3a.12.1762379356504;
        Wed, 05 Nov 2025 13:49:16 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:35dd:7def:e1d1:adfe])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7af7fd5238csm416558b3a.17.2025.11.05.13.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 13:49:16 -0800 (PST)
Date: Wed, 5 Nov 2025 13:49:13 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, linux-input@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v2] Input: cros_ec_keyb - Fix an invalid memory access
Message-ID: <qtqemibhs47cdi3rwboz6rjej7dlopyr4wwnion4nsutk2rpb4@ycb525kmsgmr>
References: <20251104070310.3212712-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104070310.3212712-1-tzungbi@kernel.org>

Hi Tzung-Bi,

On Tue, Nov 04, 2025 at 07:03:10AM +0000, Tzung-Bi Shih wrote:
> If cros_ec_keyb_register_matrix() isn't called (due to
> `buttons_switches_only`) in cros_ec_keyb_probe(), `ckdev->idev` remains
> NULL.  An invalid memory access is observed in cros_ec_keyb_process()
> when receiving an EC_MKBP_EVENT_KEY_MATRIX event in cros_ec_keyb_work()
> in such case.
> 
>   Unable to handle kernel read from unreadable memory at virtual address 0000000000000028
>   ...
>   x3 : 0000000000000000 x2 : 0000000000000000
>   x1 : 0000000000000000 x0 : 0000000000000000
>   Call trace:
>   input_event
>   cros_ec_keyb_work
>   blocking_notifier_call_chain
>   ec_irq_thread
> 
> It's still unknown about why the kernel receives such malformed event,
> in any cases, the kernel shouldn't access `ckdev->idev` and friends if
> the driver doesn't intend to initialize them.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> v2:
> - dev_info() -> dev_warn_once().
> 
> v1: https://lore.kernel.org/chrome-platform/20251104064353.3072727-1-tzungbi@kernel.org
> 
>  drivers/input/keyboard/cros_ec_keyb.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> index f7209c8ebbcc..324c98b1cb52 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -261,6 +261,11 @@ static int cros_ec_keyb_work(struct notifier_block *nb,
>  	case EC_MKBP_EVENT_KEY_MATRIX:
>  		pm_wakeup_event(ckdev->dev, 0);
>  
> +		if (!ckdev->idev) {
> +			dev_warn_once(ckdev->dev, "No key matrix\n");

Adjusted the message to "Unexpected key matrix event" and applied, thank
you.

-- 
Dmitry
