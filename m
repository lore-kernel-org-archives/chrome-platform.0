Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64224283FF9
	for <chrome-platform@lists.linux.dev>; Sat, 27 Dec 2025 18:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766858912; cv=none; b=DjbMB2npF5D8ehIsz+MUyKBV+GbuVFw8HM+jRSltsNaox6ZGwpyCvfjqVcHPE7cPQhQJhvFXTwIKSkYNqdoNFc+tHO3jZ4wPTpBwrHj2cfoqzagMQXa8K9Eymwa5Pve1KkOU3NJoV7UJUqq6mgp09wsOKtKY6MnBjoEdB6qurgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766858912; c=relaxed/simple;
	bh=b8VNWawuLEv2VOR0aC030ySiJTNbjx5/+mjSevhatXo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=UNWhg5Q0OdT6hPtiVbxQ4MkyJ9+vbfpJj7+fVgk0Fn99QX+03MP6gHbNzS7IQWo11fFj/f/6upFS5g1Ubi1MGJyMyc/t0iSTUukMXRauUb+1EF1zBhvDMWng202zIqIvTZqU/Yv4m/kNlwX52zXJZqaRHk4jj6anRY6x5rz6Dqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KG4iAu3B; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KG4iAu3B"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-93f5729f159so4753366241.0
        for <chrome-platform@lists.linux.dev>; Sat, 27 Dec 2025 10:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766858910; x=1767463710; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7CS9a/UP1wGl2+5J10FtNTBbvnTiBPo4mSf3bNivDw=;
        b=KG4iAu3BWzWk9UXIpDPDI/RdsCdiaWu9yVWZNgiJVitPMBGYNHx6MZEQ2JHoRhDQrr
         oNtGKgDkdkKL9hgVy+6RCz2L1qij5MHaY6NO3ACDzodP8g42QF11007QNa+mN+GB5gvF
         u9n/hMfpPGERwlabwwRfij3QtdKANDM8npSmih35pREEElB0hWtEh7f8I+gaWuSrVHwi
         KnP59rhVe2QIU72zIYcHw94AmmhkeFDg3TIgcK3IYnwCQU1VqHEGNTP0R4d97XjXQWUs
         wgMWt8HIe2iNm2iUdil9kx0l1+4BhPoV6yGbYWABh66Zg9l1NbtWv7dIKWi1iC9Z25YK
         EqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766858910; x=1767463710;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U7CS9a/UP1wGl2+5J10FtNTBbvnTiBPo4mSf3bNivDw=;
        b=TlUiWoiRxhevdw0cZhnN1AWaHZQmb+mR4zlKA3NVelIZZ9FhOkNd2leQd8bM4wxCzi
         h4doEnOLllTLl6OQ9AsQP0JO9UkZnlAMX5+sBwWEonKkVgQI1x4oB2Vwg/sb8vSDXUwX
         owHj/GkWKVBmuaF3fWb6WCw0XbLX/kjq+GZDuV7B1+61dd+FevvZd51sHwg8sg6xmJND
         fU/vBMUqxZMTGTSA63GbmX2AfZoZFNgJpiGno3V9M5+iXaLNAnFU1IPqssRBL6vNJRUO
         DtFBJH/r5XfK0FwFpPvZjKTmgEpAQHY4eUBWqnuvDAnNgtZNPa2qZIvoTo3uQXYEvqW+
         5XTg==
X-Forwarded-Encrypted: i=1; AJvYcCVzXuBEDBK7Vg53KrS2Ve+R45UvnijsyNWisKb+nOrNpzPcK0tQSngQCg8bnqRF2ct2eLh7YgXliZgOWCviYKQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwKPXFI7x51c8JsHexoIsT9lFWkKciTv79emqE8tEJVvVPUQ9ee
	QH99WvSEtG4LEe/eNDsKMFyWxdVpLZ/hTO5wEh+mSzMEsdfI1YgWg54W
X-Gm-Gg: AY/fxX63rWGnFJvCpeClzohz9xNFgOv9nXqGVDaYzC1IWs2IxRmbzIlTTeYx+4qJ24K
	NYuWzQlwhO2B1ZdWR2i5U8lVtajYJAvlx4nTFUfgCzOsLEndDeHLiMsLBMhTmq63tazp/s74nhs
	KWp2gjSqulqGlNM6EOlm7s17l9NgboHRoCvguAzr6nz2zssUIgXn2WjKUthHcvgh0w9zqIk33gs
	z1kw3oKR/7NIUM3LilovsGVlz/eiWbf5xUvw/LozOB1bjuvu53/3NeRPopDnWkszZNEuDbPoDBh
	HO9R+8chKlvJRSSjpRPyr3k1zX1RrXiJ8Wgha8PHnwhjecpg8gKBPT4PJXafkLRc4tXaMuN+JTH
	1sjYocTR6UNYR4haNwJPmZOVlXEc58xmrJpxlI/sVI23UiJgOiM3rhJu3j/GIswPKQ1Ucsary+I
	W0QlMp2u4azVff
X-Google-Smtp-Source: AGHT+IHW7mZTpijQh1W0Vlb08EDOefDM9YQfhnD645lciF5cqOP+tlMO2IiZxFXvLAGGhdfgkwosEQ==
X-Received: by 2002:a67:e702:0:b0:5de:31b1:1ffe with SMTP id ada2fe7eead31-5eb1a827522mr10343377137.32.1766858910355;
        Sat, 27 Dec 2025 10:08:30 -0800 (PST)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9434176c1d3sm6868920241.9.2025.12.27.10.08.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Dec 2025 10:08:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Dec 2025 13:08:27 -0500
Message-Id: <DF977KU7WNXA.2B1WDUTKS7NRC@gmail.com>
Cc: "Kurt Borja" <kuurtb@gmail.com>, "Andy Shevchenko"
 <andriy.shevchenko@intel.com>, "Lars-Peter Clausen" <lars@metafoo.de>,
 "Michael Hennerich" <Michael.Hennerich@analog.com>, "Benson Leung"
 <bleung@chromium.org>, "Antoniu Miclaus" <antoniu.miclaus@analog.com>,
 "Gwendal Grignou" <gwendal@chromium.org>, "Shrikant Raskar"
 <raskar.shree97@gmail.com>, "Per-Daniel Olsson"
 <perdaniel.olsson@axis.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, "Guenter Roeck" <groeck@chromium.org>,
 "Jonathan Cameron" <Jonathan.Cameron@huawei.com>,
 <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <chrome-platform@lists.linux.dev>
Subject: Re: [PATCH v2 4/7] iio: core: Add cleanup.h support for
 iio_device_claim_*()
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Jonathan Cameron" <jic23@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251211-lock-impr-v2-0-6fb47bdaaf24@gmail.com>
 <20251211-lock-impr-v2-4-6fb47bdaaf24@gmail.com>
 <f5ef483b-12d8-4ed2-9637-af993c3f8b7d@baylibre.com>
 <20251227145312.0f1c5f87@jic23-huawei>
In-Reply-To: <20251227145312.0f1c5f87@jic23-huawei>

On Sat Dec 27, 2025 at 9:53 AM -05, Jonathan Cameron wrote:
> On Tue, 23 Dec 2025 11:23:24 -0600
> David Lechner <dlechner@baylibre.com> wrote:
>
>> On 12/11/25 8:45 PM, Kurt Borja wrote:
>> > Add guard classes for iio_device_claim_*() conditional locks. This wil=
l
>> > aid drivers write safer and cleaner code when dealing with some common
>> > patterns.
>> >  =20
>>=20
>>=20
>> > These classes are not meant to be used directly by drivers (hence the
>> > __priv__ prefix). Instead, documented wrapper macros are provided to
>> > enforce the use of ACQUIRE() or guard() semantics and avoid the
>> > problematic scoped guard. =20
>>=20
>> Would be useful to repeat this in a comment in the code.
>>=20
> Given David did a much more thorough review than me I've just
> added a few comments on top.

Hi Jonathan,

...

>> > +/**
>> > + * IIO_DEV_ACQUIRE_BUFFER_MODE(_dev, _var) - Tries to acquire the buf=
fer mode
>> > + *                                           lock with automatic rele=
ase
>> > + * @_dev: IIO device instance
>> > + * @_var: Dummy variable identifier to store acquire result
>> > + *
>> > + * Tries to acquire the direct mode lock and automatically releases i=
t at the
>> > + * end of the scope. It most be paired with IIO_DEV_ACQUIRE_ERR(), fo=
r example::
>> > + *
>> > + *	IIO_DEV_ACQUIRE_BUFFER_MODE(indio_dev, claim);
>> > + *	if (IIO_DEV_ACQUIRE_ERR(&claim))
>> > + *		return IRQ_HANDLED;
>> > + *
>> > + * Context: Can sleep
>> > + */
>> > +#define IIO_DEV_ACQUIRE_BUFFER_MODE(_dev, _var) \
>> > +	ACQUIRE(__priv__iio_dev_mode_lock_try_buffer, _var)(_dev)
>
> This one doesn't actually have any users I think?  Do we want to introduc=
e
> it without them? I'm not sure we do.

I can drop it.

I would personally keep it for completeness, but you're right, the
buffer variant is very niche in general.

--=20
 ~ Kurt
