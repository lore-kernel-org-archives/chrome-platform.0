Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B638B2F7440
	for <chrome-platform@lists.linux.dev>; Sun,  7 Dec 2025 16:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765123233; cv=none; b=SqWr0KcWIbMYrvnEsertZfuqKpc04wZXKa9EI2WRVGizPzzVCC6DdWqG5niX+ElkzNMHNU+MkYzKxkDWD0A7xkZDpsqVBOq2tt5ze+gQYepQxrg2TE0UiuMSiqQYXRu8/n2IbBhwQ2wuasSseWsSeb2dUrLksBV5CASfsKkYiTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765123233; c=relaxed/simple;
	bh=fNaw/pQ6+rIuOq+pZ9tLxQ3v1LQvIrpT0JZXJNXotWc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=J4ENpFQRFwf0wL3X2VrkdCt6WFPBCYXqhvQEk4uujxvqjJSNF2PHGVf5dmwLJZ987bVIAXsLs+g7mlmV0+o37fr5iBjJzGTnP90SEM9bT5iCtVQJOKBn0Ff272TltQicssmALLV9XHg6L4IiZjp6kr6sxOcFgd37CQvdjUTCRtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipUVOcdv; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipUVOcdv"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5de23ddba5eso2891781137.3
        for <chrome-platform@lists.linux.dev>; Sun, 07 Dec 2025 08:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765123231; x=1765728031; darn=lists.linux.dev;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SvyW/VsfDEVpe/uLFhc3QlugzHRA/waosh3tdpzei1U=;
        b=ipUVOcdvrNYJuVSnDwF8rZe7qo8rL7VMArk2iDCL456gcwFm6/2jjozq9l+tixyy+z
         UMPzaBFiX9qF2TxK7xHRZDJEPZYRyTDRJ//KbfFDvGjr/HoAtm4GDOPImOhpWrouKjHK
         KPp9eCH9lZ8zG0KVsrHH/ObohFPIL69DqCKn6yd1SEyI5DGBl4o1KTWKbGS4+LNyYsOH
         XGe+xDhbIebqOPzd0Q33HTMASW0PrYxI/qtJs3v/UJL+XyPh9vWhbAzlMlFe9+Kv4CeP
         TtqfhL9Nt5aDa3WSyPNjbOos3cVKyuu2uf3PR7VTovvAcbtgws4IplsIe4OM7MfUpmtI
         lOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765123231; x=1765728031;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SvyW/VsfDEVpe/uLFhc3QlugzHRA/waosh3tdpzei1U=;
        b=VIX5suTJnHM4H+2f7elDCwoC4cAJfo35qMGuKqAy4zaaKb92fL2nLx6PaZHC9Y70Tj
         6b0RPvpH3+8RBMGwDIgzbutKOvhqwvbnnq6bY9UQrMQCi+hZx+kppL+XtIpZxB9hlMvm
         a3XPaUloBh//sUpqxHamiDx8/qtQFDIMQgk26IW3TEMguB3fHFFf+oaHSZxGudXppdPI
         Cu7trZPh5Urr4IfKOkdA+1P4lBryUhhMyUTRR/3gY4CfAgwU92UlD7aEBuZlSXZI2/91
         M81SDh2VVfp2/cP+C8l19IUY1810Cb/fFBVoWPj5JzzbmZvjfVPZm3gzpzrBG9mSJX6f
         67Kg==
X-Forwarded-Encrypted: i=1; AJvYcCVRIutj9KHbYTN4FARhVea7VeajIxMjIZpAtnPnPp028+dmsDDdz8XUXga0HZpW8EzhGPfUUniyFMnEJn16B3Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YyVpz2CPTwoSneuc2QIWZPGuvmKfCijXjCQoHn2AYOTH5LYMSeS
	NGz3EZ2F9CP1uFLwh04ht+AyC0u5cLTH8LXKqhxTsERHQ2pSxpETxh3C
X-Gm-Gg: ASbGncvUlhfNsnwsRpuuv4LUmQNxRqPmrmdQ/iN0jyttZoqtXhCrWY1bHrCXfyDlqhN
	EgG8TyDlJetJ+AMFSLCjTUmaJaxKsPJnqCtZTuZLf+x+SIVHBwjSgHtKiiGtPlYrg0WMJXMmh2B
	L5X/DdW6PToXS+nFwlF+G88IhVj3xhIaYAf81ELFjMSqi36pw8d9wb4nHZbk1M7bQC8q5r7loZm
	+nCDe4m+cXotCEfIyDxSi982xzCDovdIJhcxCqLok1MzYCh5xZJ7dOtvNbikxQshKiwLggaK7NU
	7D25PqL+riRdhcEolsRHlDpiv+VxhUqPovJkzxQKtIh6wqdOTVq7ZPz0bABd2105YxWAFTPY2mQ
	FGAcsenJ+eHzuS5F6BZ5kk93nTBFzz0Qj+caYgCGAFnGjekGF//9aSyyG2B6HOiEp3PK7/UsKIh
	8L5bWVl90Ebvbt1g==
X-Google-Smtp-Source: AGHT+IHBnqs2aQ2Fr8RdGbKL8fSqIjGYHTr6uO5d9m6cWkZ3v0f4Dr1+0rK9s9F+7cBhyVY8YBiQwg==
X-Received: by 2002:a05:6102:448c:b0:5db:ebb4:fded with SMTP id ada2fe7eead31-5e52cbcfd70mr1635134137.25.1765123230579;
        Sun, 07 Dec 2025 08:00:30 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93f01d022a4sm3058685241.3.2025.12.07.08.00.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Dec 2025 08:00:30 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 07 Dec 2025 11:00:28 -0500
Message-Id: <DES3YOKEMZ16.2OIHKXA8ESBUX@gmail.com>
Cc: "Kurt Borja" <kuurtb@gmail.com>, "David Lechner"
 <dlechner@baylibre.com>, "Andy Shevchenko" <andriy.shevchenko@intel.com>,
 "Lars-Peter Clausen" <lars@metafoo.de>, "Michael Hennerich"
 <Michael.Hennerich@analog.com>, "Benson Leung" <bleung@chromium.org>,
 "Antoniu Miclaus" <antoniu.miclaus@analog.com>, "Gwendal Grignou"
 <gwendal@chromium.org>, "Shrikant Raskar" <raskar.shree97@gmail.com>,
 "Per-Daniel Olsson" <perdaniel.olsson@axis.com>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>, "Guenter Roeck"
 <groeck@chromium.org>, "Jonathan Cameron" <Jonathan.Cameron@huawei.com>,
 <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <chrome-platform@lists.linux.dev>
Subject: Re: [PATCH RFC 3/6] iio: core: Add cleanup.h support for
 iio_device_claim_*()
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Jonathan Cameron" <jic23@kernel.org>, "Andy Shevchenko"
 <andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251203-lock-impr-v1-0-b4a1fd639423@gmail.com>
 <20251203-lock-impr-v1-3-b4a1fd639423@gmail.com>
 <3b80f8f3-c435-49f8-8c55-42568215bf0b@baylibre.com>
 <bf1c82f7-da25-47b6-846d-9f8427ee5790@baylibre.com>
 <DEPLQT84HBAO.2GAY5BHP05HNL@gmail.com>
 <CAHp75VfpG4PAG6rC5aFYAPLgnOZZzfJcGP6bMzKPMkMjpuymoQ@mail.gmail.com>
 <20251206184332.426cc30f@jic23-huawei>
In-Reply-To: <20251206184332.426cc30f@jic23-huawei>

On Sat Dec 6, 2025 at 1:43 PM -05, Jonathan Cameron wrote:
> On Thu, 4 Dec 2025 19:36:28 +0200
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
>> On Thu, Dec 4, 2025 at 7:18=E2=80=AFPM Kurt Borja <kuurtb@gmail.com> wro=
te:
>> > On Wed Dec 3, 2025 at 5:34 PM -05, David Lechner wrote: =20
>> > > On 12/3/25 3:50 PM, David Lechner wrote: =20
>> > >> On 12/3/25 1:18 PM, Kurt Borja wrote: =20
>>=20
>> ...
>>=20
>> > > When I made the comments about keeping "mode" in the name, I forgot
>> > > that DEFINE_GUARD_COND() only extends a DEFINE_GUARD(). So I underst=
and
>> > > if we need to make names that fit a certain pattern rather than what
>> > > I suggested.
>> > >
>> > > Still would be nice to have:
>> > >
>> > > iio_device_claim_mode()
>> > > iio_device_claim_mode_direct()
>> > > iio_device_claim_mode_buffer()
>> > > iio_device_release_mode()
>> > >
>> > > Just really annoying to rename iio_device_{claim,release}_direct()
>> > > everywhere since we just did that. We could keep both names around
>> > > for a while though to avoid the churn. =20
>
> Definitely. Possibly indefinitely. I don't want a rename just to make
> this facility easier to use as people won't see what is under the
> ACQUIRE() anyway if we end up doing something like Rafael has done for
> runtime PM where you don't call ACQUIRE() directly but use a runtime pm
> specific macro (not sure if that will make this cycle or not, was
> still being discussed when I went on holiday).
>
> https://lore.kernel.org/all/3400866.aeNJFYEL58@rafael.j.wysocki/

That looks nice.

>
>
>> >
>> > If we rename iio_device_claim_direct() (which is huge), maybe we can
>> > pick shorter names and more descriptive names while at it? I was
>> > thinking something like:
>> >
>> >         iio_mode_lock()
>> >         iio_mode_lock_direct()
>> >         iio_mode_lock_buffer()
>> >         iio_mode_unlock() =20
>>=20
>> The device context is important, so at least iio_dev_mode_lock() (and so=
 on).
>
> If we are bringing lock into the name do we need to make it explicit whic=
h can fail?
> Given you can't use them in the wrong place, maybe not.
>
> iio_mode_lock_try_direct() or maybe iio_mode_lock_direct_try()?

As Andy mentioned, maybe iio_mode_trylock_{direct,buffer}()?

>
> This was less relevant when they all could fail.  Maybe we don't need to
> bother given how rarely used the unconditional ones are.
>
> I did like the claiming of mode terminology because it made it a little
> more clear that we were taking a lock that was there for a purpose rather=
 than
> a normal lock.  Also the fact it's a lock is an implementation detail I'd
> rather not back into the ABI.

Even if it's an implementation detail, from what I've seen, a lot of
drivers might depend on this being a lock.

I my other series (ti-ads1x18), I dropped my private lock in favor of
iio_device_claim_direct() per David's suggestion too.

>
> Maybe it's worth something inspired by Rafael's patch linked above?
>
> #define IIO_DEV_ACQUIRE_DIRECT_MODE(_dev, _var) \
> 	ACQUIRE(iio_device_claim_direct, _var)(_dev);
> #define IIO_DEV_ACQUIRE_BUFFER_MODE(_dev, _var) \
> 	ACQUIRE(iio_device_claim_buffer, _var)(_dev);

I like this a lot, I'll add it here.

>
> For the two more complex ones and fine using guard() for the rare
> any mode variant.
>
> Then we can have whatever naming we like for the helpers under
> the hood as no one will ever use them directly.

Yes, I do think a rename would be nice, but maybe we can leave that for
a (near) future patch.

On that note, should I really rename iio_device_claim_buffer_mode()?
With this macros I don't think is necessary anymore.

>
> Hohum. Hardest problems in computer science etc, coherency and naming. :)

Indeed :)


--=20
 ~ Kurt

