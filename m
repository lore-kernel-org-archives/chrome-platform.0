Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44B82DE703
	for <chrome-platform@lists.linux.dev>; Fri, 16 Jan 2026 22:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768601291; cv=none; b=C51KkHplsfGg3rDViIcQcpucZKAy1v031scno1b2mGjGBTi2tTML+xFOoI3HvNWma2Q4RC38QcYs8Lk0NpCBHyY79S18NdWasKxiJTJwfmPbRTlns1LrrNntx2LrvyuEm/WGzmL+W1t5+UGBYBlQul5J3v39nKMRyGTRnqqXsZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768601291; c=relaxed/simple;
	bh=oEe9OHwJMl1JJM8nh2NuUNyf1hkrjraAipLQfPvexEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kGQm+FRmJG1/2WstTeaGAaieSWw2HxfQJ8fg1MZtXGYfsiNXrXlCGH2mYUAea1Oj1LxZA/wfII/Jbug4Pf4jdVTmfPiJ+/vqu22X35KOPfTaaI49gdj8vnJdLcmA5IRHYIpo3ZMM+Jnw++uGmo6nxH9VT0rcn1Ih6xkgC10yekw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QfHlvgWP; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QfHlvgWP"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7cfdd3146deso823513a34.2
        for <chrome-platform@lists.linux.dev>; Fri, 16 Jan 2026 14:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768601289; x=1769206089; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hnxLBlPiG6XltTI+ghGxYDwfnQMTS3jgBfwR6N4+E+I=;
        b=QfHlvgWPWU6jQ82/lgO1nMqQB3sC0vC8msHjcsRiiOX+1v9R0PHwknb8ObA06/dtHV
         NwCcXtGsfj+iebDtiG8ENvyVV5tzc5SNSOIkHbM1D9ezo4QolhLwVGo+9YxnMLMylqbZ
         Z1dOtXRy3V5xRgrQ0NK3mOedbKL164bLvZFoqg4iMCCzo/iuFTQqwC0PmQKUGiP8+gAP
         u8Is7qZjEs1wDvkdWtFfWJEzhWuk/B1FvjObLN/37w/jMNtVXmgYWtZ7hObXk/2h7BkD
         IE374EufDoRarfGax5yi18MDXWkISpOsMjAGtskkifA67UBET+vNZT/PA/8whkdOO9Hj
         tVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768601289; x=1769206089;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hnxLBlPiG6XltTI+ghGxYDwfnQMTS3jgBfwR6N4+E+I=;
        b=mATkJz8sQpnp0gkJcBgeYZ9oJeNKiyUwIzsZt3Z43QOLkRAfIUJObnPxNh84WM/TNh
         mtXH0KNLUxI5RPZgSmS8pFLZg0i9o1/jOEe8g0apIeuA3nPmXpnogGYCz5KfR7vVlOvs
         NhJBk8pO/0mkam7+wtrYaKXiUPLXPESBXhKkX5JfWFxN7L+aXlPGOL+/TwJFlDPkAUzp
         I3FDAc8aULDJjtt+SAmIv6LFrL0bbQILJaylFSke/sgZtsQnYF479VheSbjdaWAnDQWB
         b3dNga+y7eu717WYJozC7qHRW39YTEbXbgQ655SyCozFn3Owh1n89As6bUyMx47TqK2w
         BEhw==
X-Forwarded-Encrypted: i=1; AJvYcCVXYeROS7InHsg7hEAXSwpjPUQHMrYzg+0EIdR9XwyO3+R9u7jGiZQajoIdZUHZ8CSTj4jaKBcz/mEqzd00yIE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwqBCY59T/pVEDNjUNSusMXvX9p4gfMOE1VqpVt8ceeTbJgBG1y
	eehCTK0aIOeD511xDeR2zhtZ5ngioJ30Fs0c2aHKm1F8xs5K9EqxXOMwsJqn0mvvp4I=
X-Gm-Gg: AY/fxX74J6yUcPb37um6TV3mD8z+A2ZgA35wc54HHG8d3A2rA3zfBz5G7sex6dtyhNv
	0EHbq6w0db9lVUXDyPsaMSgGkDBtPzhKr5Ifz/WN/F1DO5E/MeV3lELaRyZlthH7mJYnCxk2MjH
	WYYKkCm6Jz8RWd0c8AwPeWOsEhTAv3NhdwPecBAVBKAm7DStmLPnCMrXY5IlIvZLB9UpeHCeslP
	rThxp5w+QOdnUlRSzJ2+noO8BVpIgbWBnME1K8Y2pae7XRGL+AtcUNVm58W/05bpZGg19XeZYa1
	TonYI7hj0AI02HkYiwFR+d1sXyk1BptCYP3BW8l0SMhkUEeLxd5Ok8eNMqsLcl110qEvKeA8ecw
	/BM6I0PCvepcx4wosemoBJ1boOwpQTHrukwpoqwMuxw5M4ZNZFwBxk0dgU2pKtQiTrzCb2Cg7js
	6VwznD5Ph7Ekb7zlcM9LzYZK/KlOeEIxj/DcdJWYjxXF2435y/9e6Z86ja7/iT
X-Received: by 2002:a05:6830:f85:b0:7cf:d191:2a50 with SMTP id 46e09a7af769-7cfded8025cmr1842614a34.13.1768601288855;
        Fri, 16 Jan 2026 14:08:08 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:bd39:740e:f70f:5f7d? ([2600:8803:e7e4:500:bd39:740e:f70f:5f7d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cfdf2a5f0dsm2452490a34.24.2026.01.16.14.08.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 14:08:08 -0800 (PST)
Message-ID: <4e77ebef-07b3-49ae-9d53-d24616569a74@baylibre.com>
Date: Fri, 16 Jan 2026 16:08:07 -0600
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] iio: core: Introduce cleanup.h support for mode
 locks
To: Kurt Borja <kuurtb@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Benson Leung <bleung@chromium.org>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Gwendal Grignou <gwendal@chromium.org>,
 Shrikant Raskar <raskar.shree97@gmail.com>,
 Per-Daniel Olsson <perdaniel.olsson@axis.com>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Guenter Roeck <groeck@chromium.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
References: <20260106-lock-impr-v3-0-1db909b192c0@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260106-lock-impr-v3-0-1db909b192c0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/6/26 2:06 AM, Kurt Borja wrote:
> Hi,
> 
> In a recent driver review discussion [1], Andy Shevchenko suggested we
> add cleanup.h support for the lock API:
> 
> 	iio_device_claim_{direct,buffer_mode}().
> 
> Which would allow some nice code simplification in many places. Some
> examples are given as patches, but the last two are the biggest
> differences.
> 
> In this version I dropped the RFC tag, as the general feeling is to go
> through with this after some modifications. Main one is the addition of
> IIO_DEV_ACQUIRE_{BUFFER,CLAIM}_MODE() wrappers to avoid drivers using
> the guard classes directly. I also added comments on the forbidden ways
> to use this API but I definitely still take suggestions on this.
> 
> For now I dropped iio_device_claim_buffer_mode() rename, as this point
> is still being discussed. My suggestion based on the RFC discussion is
> to do it, but in a separate patch (using coccinelle) and while we're at
> it rename the whole API like this:
> 
> 	iio_dev_mode_lock()
> 	iio_dev_mode_direct_trylock()
> 	iio_dev_mode_buffer_trylock()
> 	iio_dev_mode_unlock()
> 
> Let me know what you think and thanks for taking a look!
> 
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
Like Jonathan, I just had a few minor suggestions, but overall:

Reviewed-by: David Lechner <dlechner@baylibre.com>


