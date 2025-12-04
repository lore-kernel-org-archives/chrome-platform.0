Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043C635F8DE
	for <chrome-platform@lists.linux.dev>; Thu,  4 Dec 2025 17:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764870435; cv=none; b=ShOMiGq6xtZDMu9INN3RSYcFOb1CrukA/vLcZuydSe8VrDWx0LSgzLB0aWH4s8VjQLjBjcM4qLhQVX7tSSCXVs2t6U1eiVqL4i2KEIkO/BJFnPaR1ytlbTtG0EGTtws/xkrP4ZCx70rMIDOvy0mZzIB6PqKqybKpdpDjbQztlcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764870435; c=relaxed/simple;
	bh=j5ce4MuyBvQjrpJELeEil3FKt7d/yeDPVp6ZsfzCR7E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=H1o9JhFOsrXhq6Z/NnWLTMpcGqGJZRw3OGzyQV8xer6kZ2sqsp5EQq1PeYkuazXNc39JDZW05Zcs/oiYZDDhkackF0aCYN6XEByXVnuYUuvh5mhGWK8hpGDx3Bn3m9VZOWUb93SUYLFnypvj02wxdVOiVTI1s2psX2l40nIs9ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fw5pks2c; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fw5pks2c"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5dbd8bb36fcso1002409137.1
        for <chrome-platform@lists.linux.dev>; Thu, 04 Dec 2025 09:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764870431; x=1765475231; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxTuuhC6K5r77VKAabl7de61jARiW/6sGzO1IjQmqtg=;
        b=Fw5pks2c0GaRgt80uuWXyS5Xv+3TYqsi4BXB/RKP17QH/UY+69Wg0tT1phuCqpOySl
         tYcOTicW3yOh8cJTYs1ImzpogKAaVzxNJXi4o0Co14qaBaEIfenSRm6WN1SRxa7dA7gG
         9vgn4BDs/0fnHOb3S55n6PXP9P79B2PBV9l5VWcbBpNiDYJsAlp7cpEEI6hv1p/QMKEK
         MkFJbOEFN57iAh66RsppV5/a2hds92YKU82DhEpjFmIKitaRuuuDX5PVAHch7BWT7D/1
         De0uE+Ty0w2HjdJaJP2ppY63Hxk07ownXGEmmsAP8prx6JA0kgBP2JFiqr8SfL+sMXrO
         IRMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764870431; x=1765475231;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lxTuuhC6K5r77VKAabl7de61jARiW/6sGzO1IjQmqtg=;
        b=ZlcldyHefGxsohVjnzY/CFOsLNZf/UYVuDgpdWCs3Wfcu6nfpDMWlgXUjdQe1OwduJ
         9bHqtWeLF1SD2iVJstnL33WFyH4bXAmz++4+i4Ue10vmsnwgFXCUCblR7zrs2SA7CDSg
         0kVEF9XHrvszUjcY+V7zwigxm3PUYkVgvpFGoYejyYdT0EXWmmmIMu0loyeVKX9QSB13
         xKZxQvrLFOjo+89HU/0yecd0KkDliGU6Y4XBLopnw9kFDdZwwNQytpSPmXYbtzKYH+vZ
         3Yr410jUoVh3vPBHBkk6AK6yuVLotB+R+qAbiBIa+bWjwD+g7Bfh1CSLrXDQr0xoWz8Z
         EwRw==
X-Forwarded-Encrypted: i=1; AJvYcCXIRJYZC8H0jmGrqegZ3bYwVNUC7adQpNq597/+hhTiMAXr360kKQOQfnv5dOYrxZCvK4wFrLsBYzHz8ycoEoU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCylLxOCba7OZIbA0aETZFfnGy64PWCinpjdiaOl3r2MmWbKSn
	cQRgFsFAn6Gh4AhTihhhRramWONsvfhUAI7oqG1vv4qW5u7ao1Z67Zr6
X-Gm-Gg: ASbGncuAcdKGgXIhk8Ir+QL526PY7t0dBUnXcaetHAjGPaNyO62xdzzWDPQcqf2hgls
	xoaaARljmX8Tu5dVzd0gi4skOSvOkj8kzBgyRsLJ/FzeX5SlyvKah7cuR0PzwwyTryBobQmlmFv
	oVI3IeBshr0yRse8btX6VCIC+HgFe8vdniSpE+PDMy/wRXKRl0WL3b+dJ3qY8yvPTrZnuP8WLHU
	ppBaeXmidTEO8FJdqKgW/og/BcjZWClNTNNcrlklHWO+piMRxGd/x4CyULxnc9Q5XWO1TBetva9
	yBczedLz97V8kKxjhxsfGHAnIytDmbAlVXjoR4f+a+H5NjevIPIi/iysrTw/ektgWZx1JcL+VhB
	z2x26NRds7yRU2gOHAKYR/Rdrcqv6RFGJ7WSOCRnCZMEPepVMMvtwND9ioFrZyxGsl64SiBBR/Q
	REqhuSh72q24tHTj32
X-Google-Smtp-Source: AGHT+IGXScj2mOQRJ9yhwkdaTxAxTBw1Wgm1t0kR6AWVQduW0M5uS1qVXYn/b2A569iZ2os9zht/cg==
X-Received: by 2002:a05:6102:3706:b0:5df:abc1:e6b5 with SMTP id ada2fe7eead31-5e4f926ca67mr1992475137.17.1764870430714;
        Thu, 04 Dec 2025 09:47:10 -0800 (PST)
Received: from localhost ([2800:bf0:4580:3149:7d4:54b1:c444:6f2f])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93eed696d96sm816691241.3.2025.12.04.09.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 09:47:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Dec 2025 12:47:08 -0500
Message-Id: <DEPMCPWLO4FO.2B2OXMF2CZ1G@gmail.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, "Guenter Roeck" <groeck@chromium.org>, "Jonathan
 Cameron" <Jonathan.Cameron@huawei.com>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <chrome-platform@lists.linux.dev>
Subject: Re: [PATCH RFC 5/6] iio: health: max30102: Use cleanup.h for IIO
 locks
From: "Kurt Borja" <kuurtb@gmail.com>
To: "David Lechner" <dlechner@baylibre.com>, "Kurt Borja"
 <kuurtb@gmail.com>, "Andy Shevchenko" <andriy.shevchenko@intel.com>,
 "Lars-Peter Clausen" <lars@metafoo.de>, "Michael Hennerich"
 <Michael.Hennerich@analog.com>, "Jonathan Cameron" <jic23@kernel.org>,
 "Benson Leung" <bleung@chromium.org>, "Antoniu Miclaus"
 <antoniu.miclaus@analog.com>, "Gwendal Grignou" <gwendal@chromium.org>,
 "Shrikant Raskar" <raskar.shree97@gmail.com>, "Per-Daniel Olsson"
 <perdaniel.olsson@axis.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251203-lock-impr-v1-0-b4a1fd639423@gmail.com>
 <20251203-lock-impr-v1-5-b4a1fd639423@gmail.com>
 <f96694db-2ad5-46d3-a380-cba3eaa2de2f@baylibre.com>
 <DEPLIJFBZQ36.20XX5DCMCJVB3@gmail.com>
 <c9efd563-9d52-4761-a5f1-be0df0222dff@baylibre.com>
In-Reply-To: <c9efd563-9d52-4761-a5f1-be0df0222dff@baylibre.com>

On Thu Dec 4, 2025 at 12:35 PM -05, David Lechner wrote:
> On 12/4/25 11:07 AM, Kurt Borja wrote:
>> On Wed Dec 3, 2025 at 4:52 PM -05, David Lechner wrote:
>>> On 12/3/25 1:18 PM, Kurt Borja wrote:
>
> ...
>
>>> I would write the whole function like this:
>>>
>>> static int max30102_read_raw(struct iio_dev *indio_dev,
>>> 			     struct iio_chan_spec const *chan,
>>> 			     int *val, int *val2, long mask)
>>> {
>>> 	struct max30102_data *data =3D iio_priv(indio_dev);
>>> 	int ret;
>>>
>>> 	switch (mask) {
>>> 	case IIO_CHAN_INFO_RAW: {
>>> 		/*
>>> 		 * Temperature reading can only be acquired when not in
>>> 		 * shutdown; leave shutdown briefly when buffer not running
>>> 		 */
>>> 		guard(iio_device_claim)(indio_dev);
>>=20
>> AFAIK you can't guard() inside switch-case blocks. I don't know the
>> exact reason, but it has to be scoped_guard().
>
> You can. You just need the braces like I showed in my suggestion.
>
> The reason is that guard() is declaring local variables and some
> compilers like LLVM don't like declaring local variables in a
> switch case. By adding the { } scope, the variables are limited
> to that scope and the issue goes away.

Ah - You're right. I dind't see the braces.

Now it is overly complicated. In this case I see why guard() isn't
really an improvement.


--=20
 ~ Kurt

