Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F472DECA0
	for <chrome-platform@lists.linux.dev>; Sat, 17 Jan 2026 19:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768679072; cv=none; b=BXxZ/3vGJ60GcoEusF6btapfml3ECRBIxvy+O7Lm4oEZqfjCg/zwA0YWk1J7Z5H4enfT0aexnqgcFycDqqpe19iIILX2H9H6t8JSA7pd3znQ9BZAwhby00SwKYFlGSS7C8OXAJH70Ny91RCzhtzadqE1RDzy6gisbls0dnYZeoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768679072; c=relaxed/simple;
	bh=xkKytNjeVcjDL10/GqrC/ZAsjwWotwsWzGLKnH3NAuc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=qj6g/XwcNSCFPGSU/Q9PK1AFOQU0yXPebbxzVdhsWhXnWJuMuFtinLhS/C89HYOFxv6FieWsWYdonlql/+9aP+lyY0KYtT9kTtBbem9TSL7EIKxKhvw5VYrHsqMcVW/cZMXbPO7gyvQ4xf/waNzZgFkL3+RylCoq9x/2zfUCkkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ht9DeU0S; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ht9DeU0S"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5eeaae02888so888074137.1
        for <chrome-platform@lists.linux.dev>; Sat, 17 Jan 2026 11:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768679069; x=1769283869; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1uCAAMUi0Dl9Xk8gsU5DOI/xVq90HWLTJ/j/86WebA=;
        b=Ht9DeU0SopXS+G7zT48gykUkL0TGHBb+KoawPFEh1RgVZBZ0bpxFL1E57i+BSp/rnA
         a/gSGJfQvPaVo19wAE3ZSS/a1wC9jo7ib+0yvS0o7xppA/sQMrVrQnTldqK601x+0RIR
         7Pcn1caIkl0Z69ZsNiGz0bl3agrfFh7hd291mMTXoBNk8TUkDmjnE0xOk2/TEb6zVUlx
         9kQ1WfEXxp+kCa0lHeIMdmm/ax+cWzAox5L843Y5+/chBfbO5h9sSVR1ideGVo75QSzm
         VgS/SMDm4YViR+fwXePaNydAX347uTBu7saJBsxknSIh1tOWPBlOjzbgye/batUYM30E
         5Mlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768679069; x=1769283869;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u1uCAAMUi0Dl9Xk8gsU5DOI/xVq90HWLTJ/j/86WebA=;
        b=CtuEVqVPQEUa7Sy7y6hqAGh+8fnmf6RsDOUEpR9GhnAvDMXGPkLdQEK429NIPopUFN
         4MHTvPT0R/A30ILzYhR+qu5EGEwmY+QJ4FVfm2kn+a/7DZprqHMp2BwlQAoIsTWVnHGR
         D2WOe62LcP7+OISYxh0/AKcE65/q4TAgzKYyAZswPVxwIAPvt9goblFA+mpEJsix1J4q
         ptD3ejJMVeQ9XI+xt/9FvfG0o4Wr2CZlr8fd3C6impu0o8m3isptwY4+wVjek4cSwcUB
         DELyZ8LmhclEUnVbM7JQJa2EWZc4Pt9wFPuYQ5izBw4X6KBkVOMm/8SzxAo1662Rr4m0
         pYgA==
X-Forwarded-Encrypted: i=1; AJvYcCUr5cWm09OZAH6k6RNIQ5/+1J92RhEK+zjmj+81CKrHlFdMC6wefdXD6nr0KNPCXBFhSxbCytw8YWtxwi6T7Ug=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxtg2dxdJGOHP6sX+wtf6J8SdTzhNWbDeuULdSmHY0mmWNrZjY2
	2h+TGLpdIG/24W6AYyHQzd+Lj/s0ik7IPckLVjk6/gwLkXQ3/ncFlEzm
X-Gm-Gg: AY/fxX6mdgg4/GftcZCSSnLbBSwqBZ3NzWo4Jwv76y+PWlm5kYkY3ayai4CEpbj/A5d
	jOclWKqc9ERKx4scz9zNJWKkyZma0dP8qlhBOxFhtb00TS+EPAq4nGmuwkMjcNhdHfrcAnwDJ+W
	pzRjS8+xCxTNRWtzLxOnouccbj0IXSjVB4iz8FnWjj/zfI9mJJuc1WlNjcTbQGGf5P5lQFfXbR7
	OZ7znhtJqd87xVwgJDgtRJ1bNWRTaetW7wTJ5VgQY/6Y8DWShl36AdSbRGXRlPnNorAd6aHChHi
	ISQVSfYy4sXXpIfalYnqoWwgpJjLY1EISsR8VLImyUMoyxadOj3EVi6+oPPiufRjcmZRULGSiJE
	bEEXxo3zPnGLfDT4eGJe4B58nrXiEPhsDXvhd2DIHzAGXP/On++4STC6BMS0ZwCpKBMKX05nRGN
	Ik8Q==
X-Received: by 2002:a05:6102:f10:b0:5ee:a309:6684 with SMTP id ada2fe7eead31-5f1a4dc26femr2032982137.10.1768679069122;
        Sat, 17 Jan 2026 11:44:29 -0800 (PST)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-947d04377bfsm1854349241.10.2026.01.17.11.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jan 2026 11:44:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 14:44:21 -0500
Message-Id: <DFR4EFO39YMN.2B4GMZC3TPMQ8@gmail.com>
Subject: Re: [PATCH v3 0/7] iio: core: Introduce cleanup.h support for mode
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
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, "Guenter Roeck" <groeck@chromium.org>, "Jonathan
 Cameron" <Jonathan.Cameron@huawei.com>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <chrome-platform@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260106-lock-impr-v3-0-1db909b192c0@gmail.com>
 <4e77ebef-07b3-49ae-9d53-d24616569a74@baylibre.com>
In-Reply-To: <4e77ebef-07b3-49ae-9d53-d24616569a74@baylibre.com>

On Fri Jan 16, 2026 at 5:08 PM -05, David Lechner wrote:
> On 1/6/26 2:06 AM, Kurt Borja wrote:
>> Hi,
>>=20
>> In a recent driver review discussion [1], Andy Shevchenko suggested we
>> add cleanup.h support for the lock API:
>>=20
>> 	iio_device_claim_{direct,buffer_mode}().
>>=20
>> Which would allow some nice code simplification in many places. Some
>> examples are given as patches, but the last two are the biggest
>> differences.
>>=20
>> In this version I dropped the RFC tag, as the general feeling is to go
>> through with this after some modifications. Main one is the addition of
>> IIO_DEV_ACQUIRE_{BUFFER,CLAIM}_MODE() wrappers to avoid drivers using
>> the guard classes directly. I also added comments on the forbidden ways
>> to use this API but I definitely still take suggestions on this.
>>=20
>> For now I dropped iio_device_claim_buffer_mode() rename, as this point
>> is still being discussed. My suggestion based on the RFC discussion is
>> to do it, but in a separate patch (using coccinelle) and while we're at
>> it rename the whole API like this:
>>=20
>> 	iio_dev_mode_lock()
>> 	iio_dev_mode_direct_trylock()
>> 	iio_dev_mode_buffer_trylock()
>> 	iio_dev_mode_unlock()
>>=20
>> Let me know what you think and thanks for taking a look!
>>=20
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
> Like Jonathan, I just had a few minor suggestions, but overall:
>
> Reviewed-by: David Lechner <dlechner@baylibre.com>

Hi David,

I'll add your remarks in the next version. Thanks for all the feedback!


--=20
Thanks,
 ~ Kurt

