Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219622D1916
	for <chrome-platform@lists.linux.dev>; Thu,  4 Dec 2025 15:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764860769; cv=none; b=HLSsJfk9sI1Ir8WmzbbXyzMBPn8VnFQJGrVL9xO80/vSwhSOL/xfGj+s27BQHWvVsUxU91knMS7H70DzP4xgDkxc9L+PevcyJmfNWO7xLV1mYM4flK1S1njMKUvEYmEnILXycg9DKGij88kXqo3pCH2dM25vYvNtt3atij6befs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764860769; c=relaxed/simple;
	bh=hFqO6XHrjSFGl0jcBtxfzmKc1hL5nO7fIAsuruPYZW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cLUlzgXwh/XXzz5GMQ6zizJqwrnwvjp0QX0jpmCKnT1/pLhaOgcrxg3NZKUDIOZ4RybIfHKZyGsrlg+LWh7kceefGW0/hchPZa1iag6Lqk9SB1ir9CipBYhl6fxEZFaTOEwlDyziJvCM795zv/PweAhO3q5BHGrThRcHkdzhUHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEp8ddNt; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEp8ddNt"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-640ca678745so1731518a12.2
        for <chrome-platform@lists.linux.dev>; Thu, 04 Dec 2025 07:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764860766; x=1765465566; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFqO6XHrjSFGl0jcBtxfzmKc1hL5nO7fIAsuruPYZW0=;
        b=IEp8ddNtpZDO2QOyLQK+7xit402d+VfVN+GlJesG9cBTwb5wzFW2Xdu+IpD2L/d3gE
         Zw0CLZesX93N46unIgBtilX/+CxtMqPj8qxztxghAlmUj7eJdN7V3qf0YLSy+yrVIF2R
         IcedjWoyNpPYXDGvorVQeBc7zyE6gTOqPK3wCjAcB1XdeHAC9QSmecYGGqszCkQ5XagJ
         NtqlrBEzEQSQ8rQw4YQiF+mjq0hyIVFLAy8Za2rAoFAoafOc8mruCNzinG97A424TPYj
         tRTjfZ9rt2Ne1oFNOaK/3iU8+PCdf42Eb7yhAL1gf13wT6JQby9p9K0XEjHU+ylXqygO
         M4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764860766; x=1765465566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hFqO6XHrjSFGl0jcBtxfzmKc1hL5nO7fIAsuruPYZW0=;
        b=grEVEQlohoeY43i1a1QkDp7uxGYw0S7FFGPd/TKODYma4V/LvgAwTwF4mtnfct11D+
         l0P6jFQ2ft+Olm4OrEsWBio5bkd/Ui4WsX7tXE074dvMatswmbghPvOWgORJHUTTwUaA
         Anv5NK4Lg4rLsgtvz5aSxN0RoJ27iuiDncyo+MgpbxyJPiM/bsCwmcY8M6mAyv5eiYoo
         qRgAi037GQBBHvm/jK7pQnFxE35yBn6uNte84zpX1vVgX+GfxNalZb2Z0xknjTTxdtlW
         chzM/EklaCPZ4mg66//OefjYpffqGgKUto0rm7vSmAVvijkttQAT0yXO//7pvaCMuwcR
         0LCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsZhlb9Ua4wboSp5HPPyYdCUNHjQ+8Sd+bB7+F85wnN6OnfyVKlLV/yYZw26LGUwPLhM0aKLzEfTq5YDyW7T8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxdBhXTM1IT2yGwQQiEjp7UByymbbCbVNa7qaYOi8Y32LvSPZ33
	ytWIpHjQFptcbvgDoGIKnF3GLbpRK/hnzFaxZuwmdEJ1Ub5IcVLhVs1VeUldYUYJoyLzMfNkLVE
	+gyPGvduFrpG1raI4v0UX5p3HLQG4Q+E=
X-Gm-Gg: ASbGnctMtRr1r7MPvDqYkWxkoIy9KNyySBuMLUT/mIsHm+XchyExRhrhh6ZcZt9uYCD
	XltFtLNtpC/3f2YwqNHjPdXLqhrGvg+oT+7T6O+cRmRjvrZRZQh8vi/SUeC8vWeCEnASNMpuBHz
	GbMXYtYTcYspuebF4ixr7D9bqUXG6UYkCDwtJ9zQBKPPZfYngQ9nwN/DLHK65HMrOCsELl7Ut+4
	CAJrN6+/khsYL0O7kJ1J4npFeAO2AZPHf1WORJwDTKEEDda1HYfkanokKqJYrL8LljPJE3Il+4H
	D3MDSMsuPt6ztzgfXS6Hk8GtaFfH+cpdKt+mxyRxK3Kl8abXmfPabUdi6x48j2gTNRH0Z5c=
X-Google-Smtp-Source: AGHT+IEsIHi5AAyYHsYb+1id4Y7bouRrkpL0pgoTUjdg/klJNiuzZs0555iyiXeYZPtCteRrxlasCr65nCQD/rIGNlQ=
X-Received: by 2002:a17:907:9803:b0:b73:7d96:5c97 with SMTP id
 a640c23a62f3a-b79dc73ccccmr671810666b.34.1764860766031; Thu, 04 Dec 2025
 07:06:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251203-lock-impr-v1-0-b4a1fd639423@gmail.com>
 <20251203-lock-impr-v1-1-b4a1fd639423@gmail.com> <9562673ef83dd73b6092b5a7d2042b380a55700c.camel@gmail.com>
In-Reply-To: <9562673ef83dd73b6092b5a7d2042b380a55700c.camel@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 4 Dec 2025 17:05:29 +0200
X-Gm-Features: AWmQ_blGRDM7MVTXB5gFlZZg3yPo51cK-pjKGPxgtiikcQ6KAiNmodUFfEJCy1M
Message-ID: <CAHp75VerpV6u8DgQH53a=2eAPQGk4KgFobXTueh90EBnFL=BTg@mail.gmail.com>
Subject: Re: [PATCH RFC 1/6] iio: core: Match iio_device_claim_*() return semantics
To: =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>
Cc: Kurt Borja <kuurtb@gmail.com>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Antoniu Miclaus <antoniu.miclaus@analog.com>, Gwendal Grignou <gwendal@chromium.org>, 
	Shrikant Raskar <raskar.shree97@gmail.com>, Per-Daniel Olsson <perdaniel.olsson@axis.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 4:22=E2=80=AFPM Nuno S=C3=A1 <noname.nuno@gmail.com>=
 wrote:
> On Wed, 2025-12-03 at 14:18 -0500, Kurt Borja wrote:
> > In order to improve API consistency with conditional locks, use
> > true/false return semantics in iio_device_claim_buffer_mode().
> >
> > This also matches iio_device_claim_direct() return semantics.

> Even if the rest gets a NACK, I think at least this patch makes sense. In=
 fact I
> would even extend it so that we have the same inline API with proper anno=
tations:
>
> https://elixir.bootlin.com/linux/v6.18/source/include/linux/iio/iio.h#L67=
9
>
> So it really has the same semantics as iio_device_claim_direct()

I remember I looked into this when Jonathan provided an API, but I
have no memory of why we have the -EBUSY which is not used in the
callers.

--=20
With Best Regards,
Andy Shevchenko
