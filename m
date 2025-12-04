Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8632C2365
	for <chrome-platform@lists.linux.dev>; Thu,  4 Dec 2025 15:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764860889; cv=none; b=A/+P+XAVV+lufTvuSjpqkRnsohiEnhlXvyirmBd2wz6PSuY63mLMhI95vAlM65LaVXIKKsX4NYPRxTbQsscA9BmhDXsL9rMJyo8uuNvk994OQPAa/AtyUVf2vFcSXf7CvOKb68I+TZ3KalONig3KqE0qEw/nmZ0tIasWpdAQicI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764860889; c=relaxed/simple;
	bh=V08uaRjfaEg2wLqAVhUd3vtB545Y9YlqH+LX5++XV6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AYYtF6K489DFifbdWw7EO6wxgZPsRInvAvF7IBcSwxP6UlW3v2Wmv5xPU/CFbJnptcQlh0IMCr7JmvOuS/vVKGiWPJ4OG/wB4t9E33tWMrbPj22vf55Gu0fMQRUDwIZ7mqufdaIWXwarFv5Q5FqeBv5LghNbanfpUGXvD+dLIIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9F58w2N; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9F58w2N"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b736d883ac4so178798366b.2
        for <chrome-platform@lists.linux.dev>; Thu, 04 Dec 2025 07:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764860885; x=1765465685; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSSRRIrYsHc+BU7z4a8pMplGe0ESdbsiENi8Hosq9ek=;
        b=Y9F58w2NX3zDV+hBlOL+r6nh4+DyotgRBpNZZlof+hTe5b4Yf92GhnS+w9IMkGS8A4
         LqGPJLHbt+TGDFXjBdVpRzRVtUrgigZPM1ZwwDTWS+ngT6LYV576RNGH2HyCtdxJIr8m
         dUkjlBfrBf/+spq5h0Y8+sIDY/SvFvHNCuW8tQJ6wYshgWmxv7FU056V8Bk1Y3AbA1zl
         6kVake20ONK7SMT4Kiclk0kR2B8mcZcGmRTkVEwmgwQiIezcj46R6o311phYdRZh+2WZ
         SPO9gc2rNry6tcPfRD0uUWVynHWtqFqQFN/qkCp0kM8kgkRHnHZwVIO6NP2DbSKm99s3
         xoaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764860885; x=1765465685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JSSRRIrYsHc+BU7z4a8pMplGe0ESdbsiENi8Hosq9ek=;
        b=vSit35sPeHTVkk4suz2b05jVEarHbz00JDgiBiVdJ0tnbxIGbuClsL2ZDZBcGMZZ2i
         lw4jM+ViN67zlURJTtoE+0ThtSeKKmX36jW+WScm40lomyRCkZqblX4vT+vjL4ZnHSr0
         lnPd5ht87rOhyv/ItzGujyKhPrrCDylgmfk3hxztIv3G8OECs7bIzonjtH505lDZhBxW
         yZrflx8CK3FX1S9Aju/bQrnvzoLfV9Fe7xCAIx/hQpdnAonDk+JxVAUjPTp2IoUlCmXA
         xScxTyMc9CtYMxdVBgaVUVeNFYugHaXQjg8CsNlpfTlh1UidmOic4o5qmFfNCojxMnEd
         o4oA==
X-Forwarded-Encrypted: i=1; AJvYcCXDcYLkz2wLi/pNu7X02r76xA6aSdFJclGgAiyw6PpoXqd/sMNPLEoTmXgkf5pf31YnGrwyo4SCdiQvBJvC+HA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+vURV2/SLQD+VuxChZkngaPvZXHECiFDepNZo5o53kqnHYeY+
	fpw5aCJ4kF+yY/luk++zc+hZ/yQs8R5a0Aj7ERh6HMzKVLntZ/UHOxQKUtQkuVLGUMYqo2ZrW5I
	ULvuP7vMT2f+NBViMDyWk8uwaQDO3Jew=
X-Gm-Gg: ASbGnctp4wtNUbevaFVjhA/nh0QZM6Mz095zHrQ3YpUE49Tmbwl3w+g8pGnvJl1/w3R
	Xbm+KD3B5QfpGMj32HcsddXcjJu1weC+qoEm2JoJP6ZqROOstuGirzkDJTanq0P9H6lNBK1Et9J
	shh6OGeP1LLJhVZp0JZDMdhYC6yXao+BVrTru9AQffjoO6TThtqPVc2B5L01fQ9kQ1SHZk6Km+h
	mrCHyo8YnCF9ednuwl4Z2TQiWf0EuML1g1tjC7v1WgyKZxKXQhUWTn3c8dFqXGsWvodXRtKGLiZ
	rE4QEzczXvgxr3/rd94MB4tIQdAzjHt2LdWxa8Huq2ZJ+PFEq/4BUztG2FL1gzMVDANLyuENdFu
	qmQ1Lvw==
X-Google-Smtp-Source: AGHT+IFAol8FvXCQ/hzm9jQyOszGYW1+GC5PlRTh2p4qUMEuQIBmClzMD5AVXoFgMQXWWHxnQr0H1H4I0vDWKP8M6oE=
X-Received: by 2002:a17:907:3f11:b0:b73:7652:efc2 with SMTP id
 a640c23a62f3a-b79dc77c26amr662911366b.60.1764860885095; Thu, 04 Dec 2025
 07:08:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251203-lock-impr-v1-0-b4a1fd639423@gmail.com> <77ca77847511e67066a150096a7af2fb84f1f25f.camel@gmail.com>
In-Reply-To: <77ca77847511e67066a150096a7af2fb84f1f25f.camel@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 4 Dec 2025 17:07:28 +0200
X-Gm-Features: AWmQ_bmly8zqW9i6ZFrS7i-LUxALKOP59XpLcQJF_VzkA0upKuwiwj5K7wgTCUA
Message-ID: <CAHp75VdNjqZdy0+aSbBzn9CwEwHUhjwED+KRVqkdOMc_N+nX9w@mail.gmail.com>
Subject: Re: [PATCH RFC 0/6] iio: core: Introduce cleanup.h support for mode locks
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

On Thu, Dec 4, 2025 at 4:35=E2=80=AFPM Nuno S=C3=A1 <noname.nuno@gmail.com>=
 wrote:
> On Wed, 2025-12-03 at 14:18 -0500, Kurt Borja wrote:
> >
> > In a recent driver review discussion [1], Andy Shevchenko suggested we
> > add cleanup.h support for the lock API:
> >
> >       iio_device_claim_{direct,buffer_mode}().
>
> We already went this patch and then reverted it. I guess before we did no=
t had
> ACQUIRE() and ACQUIRE_ERR() but I'm not sure that makes it much better. L=
ooking at the
> last two patches on how we are handling the buffer mode stuff, I'm really=
 not convinced...
>
> Also, I have doubts sparse can keep up with the __cleanup stuff so I'm no=
t sure the
> annotations much make sense if we go down this path. Unless we want to us=
e both
> approaches which is also questionable.

This, indeed, needs a (broader) discussion and I appreciate that Kurt
sent this RFC. Jonathan, what's your thoughts?

--=20
With Best Regards,
Andy Shevchenko
