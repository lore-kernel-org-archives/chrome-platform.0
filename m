Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCA72FA0DB
	for <chrome-platform@lists.linux.dev>; Sun,  7 Dec 2025 16:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765123256; cv=none; b=uQqa9ZedpZx2J3blyAy5w60KFmYjTOfOnZWDeoplGvnWvYxBagF/DfTl5n+ODWcr6FaZnilRzXR61EuB1zfShqXxiN3dNjrTLkPPf2+UJCv8gtBHOpubOABD4ifxN+hrtP5p8/I0ZRdAnR9zfg2acLRNtv1dQVgRZP003IaTmFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765123256; c=relaxed/simple;
	bh=ONfJbGREEVhf0xPpAs1SAV4Q3KV7qHQ5RDVEi5NK7LQ=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:Mime-Version:
	 References:In-Reply-To; b=PfwX5fv1/9XDJb4SNp99oteNB9yNNtEdPtlveFHCsoZJWzcA2HoB0Xs6ftdClfAnfUNOOjhftPEpNCwLEplb+VoMdgc1903AjIEDDcTuN4awA/zv8PSmHVu9VG0zAZK6+XUOGOPBhMdCWca+CyF9qN/wczsxFx2EUZzxvVRP/CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WIVRSOwu; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WIVRSOwu"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5dbe6be1ac5so1563970137.1
        for <chrome-platform@lists.linux.dev>; Sun, 07 Dec 2025 08:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765123253; x=1765728053; darn=lists.linux.dev;
        h=in-reply-to:references:mime-version:content-transfer-encoding:cc:to
         :from:subject:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C05hxMdhSejZs7B3U82wBg7N+6ftUEeKG49qP2la0+o=;
        b=WIVRSOwu6xbHKo9SptynIYsyhNGZRpR7GXeVihUf5hQltJe4b9ghBALj56WDfsgFJ0
         YxcHnw0SfJZ65OVyDZv9ivAeAN4VQdNV/0p9knFJN90RTfz6/gI0GZuuGcwduX3XL2fa
         +zSjTbmdrVDef5A0xrYjOivyU0OuxpASRlCHPX0YuCLsbgPvtbcrwZqC4JgmeFczGVqb
         FFwvqVhYxmywML8N/whtL/p988Oh50Lq4vcch4CRMO7+y2uTAFWhYUP/uUnwn/MJnTIb
         rgUsdYMxKU1H+5pK3WQLY+SJtMegUWhZRWytxcEjRneNR7YvTIPyKa0lqVmCH1j1UHDm
         jbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765123253; x=1765728053;
        h=in-reply-to:references:mime-version:content-transfer-encoding:cc:to
         :from:subject:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C05hxMdhSejZs7B3U82wBg7N+6ftUEeKG49qP2la0+o=;
        b=OKnhm7WittAI90RgairnkYJAmuIxkj1wwgUEMhndqR+tT3iABD13dx4bhPL+o9XZx7
         65Ko2mjToubbC2zSXSh+sQ3Zg5heydT+M84ruC6MeohJQEBlBhlpLGoUOWVKQ8zh3e4O
         XXzZbZ1s4c2yAfko9sTIOTE5CXlQ/1uzNzrxbyYEJVOxCAuNEbekalUox25H0Otj0++E
         +Be2W4yZHdfxGeRpyAtrYpW4pvj0YqbsWE9mOdW38WVAmbNBuTgf9liW2Y/+JG7uzW8+
         LAuqi+SrKyKocmkFowvhXEsBc7lx3GGcgHKsEva+t+2DuArkLN71Wbx4aDzaF7nhzUSx
         jPzA==
X-Forwarded-Encrypted: i=1; AJvYcCULrPEuvx3Q6dkjqLCRYbx0VsXnPaU3JSyu2G0E8a7cBMUZClKBpPb2QDKxNW19FQPzWLf7KbPr3CH5KeMDWrQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxjvoUOPLpefCdiz7MhZdEUAUGC/pJ5Qt11Gk4OXpeov2JXZu5q
	i2Nx5jhKPVaGNZmHKmSLGknhuEYX7qGnzbU6KT9sn/BuXoFwrwDW0tRd
X-Gm-Gg: ASbGnctopYFleAlfL0G61WDnxWKmnuVmDqpLssZy+TjWv0odfv+iR6mVEthdr384c7L
	Qk6tzXjKgCGo48rLQqUd6xFzaZR1BpWG1L4/L/jku/nlj0V1qyjWExXZNHj//QkwVETcrBU8Mzw
	suydGaPp1+8YUESmcPhnnSGNrZUF+y5aC4ORFcPjlttgIVBvVPn67IhZpPkxoL/zwOD1pTC63W1
	X1q4L/gkZlKerYfcXLUjjC8LFClvadHjSgVm5r2neP3mf2pSOTMJXeIwOi+uZJq7iFkp4tf4KsK
	45YfJsKYWjTSeCzlRijWiLz8C0JoyfH937e7ngb6Z3n66GBHpZVz/sYObQ8UZqtIhz79KdagNZW
	tuTgvwLd/dWhagOmY2iJ8D5Yitqs6XJvlfoPO35fH5Px9rPedOEsAzeH1KVggT2Xu2xbx/FRGT0
	04x9rwLKvQss+AJw==
X-Google-Smtp-Source: AGHT+IFvMMi8SeriD8ofLkkikPJ/IRwJH9eX2CR7z1bizsi4e0heB2zUKTRYwSBWyo5tPo+Bc0Pzbw==
X-Received: by 2002:a05:6102:f93:b0:5db:3bbf:8e62 with SMTP id ada2fe7eead31-5e52c96d23cmr1323197137.1.1765123253190;
        Sun, 07 Dec 2025 08:00:53 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e510cd624csm4396150137.13.2025.12.07.08.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Dec 2025 08:00:52 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 07 Dec 2025 11:00:50 -0500
Message-Id: <DES3YYXIH4ML.1K5X4KDG273HD@gmail.com>
Subject: Re: [PATCH RFC 0/6] iio: core: Introduce cleanup.h support for mode
 locks
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Jonathan Cameron" <jic23@kernel.org>, "Andy Shevchenko"
 <andy.shevchenko@gmail.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>, "Kurt Borja"
 <kuurtb@gmail.com>, "Andy Shevchenko" <andriy.shevchenko@intel.com>,
 "Lars-Peter Clausen" <lars@metafoo.de>, "Michael Hennerich"
 <Michael.Hennerich@analog.com>, "Benson Leung" <bleung@chromium.org>,
 "Antoniu Miclaus" <antoniu.miclaus@analog.com>, "Gwendal Grignou"
 <gwendal@chromium.org>, "Shrikant Raskar" <raskar.shree97@gmail.com>,
 "Per-Daniel Olsson" <perdaniel.olsson@axis.com>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, "Guenter Roeck" <groeck@chromium.org>,
 "Jonathan Cameron" <Jonathan.Cameron@huawei.com>,
 <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <chrome-platform@lists.linux.dev>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251203-lock-impr-v1-0-b4a1fd639423@gmail.com>
 <77ca77847511e67066a150096a7af2fb84f1f25f.camel@gmail.com>
 <CAHp75VdNjqZdy0+aSbBzn9CwEwHUhjwED+KRVqkdOMc_N+nX9w@mail.gmail.com>
 <20251206184645.51099254@jic23-huawei>
In-Reply-To: <20251206184645.51099254@jic23-huawei>

On Sat Dec 6, 2025 at 1:46 PM -05, Jonathan Cameron wrote:
> On Thu, 4 Dec 2025 17:07:28 +0200
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
>> On Thu, Dec 4, 2025 at 4:35=E2=80=AFPM Nuno S=C3=A1 <noname.nuno@gmail.c=
om> wrote:
>> > On Wed, 2025-12-03 at 14:18 -0500, Kurt Borja wrote: =20
>> > >
>> > > In a recent driver review discussion [1], Andy Shevchenko suggested =
we
>> > > add cleanup.h support for the lock API:
>> > >
>> > >       iio_device_claim_{direct,buffer_mode}(). =20
>> >
>> > We already went this patch and then reverted it. I guess before we did=
 not had
>> > ACQUIRE() and ACQUIRE_ERR() but I'm not sure that makes it much better=
. Looking at the
>> > last two patches on how we are handling the buffer mode stuff, I'm rea=
lly not convinced...
>> >
>> > Also, I have doubts sparse can keep up with the __cleanup stuff so I'm=
 not sure the
>> > annotations much make sense if we go down this path. Unless we want to=
 use both
>> > approaches which is also questionable. =20
>>=20
>> This, indeed, needs a (broader) discussion and I appreciate that Kurt
>> sent this RFC. Jonathan, what's your thoughts?
>
> I was pretty heavily involved in discussions around ACQUIRE() and it's us=
e
> in CXL and runtime PM (though that's still evolving with Rafael trying
> to improve the syntax a little).  As you might guess I did have this use
> in mind during those discussions.
>
> As far as I know by avoiding the for loop complexity of the previous
> try we made and looking (under the hood) like guard() it should be much
> easier and safer to use.  Looking at this was on my list, so I'm very hap=
py
> to see this series from Kurt exploring how it would be done.
>
> Sparse wise there is no support for now for any of the cleanup.h magic
> other than ignoring it.  That doesn't bother me that much though as these
> macros create more or less hidden local variables that are hard to mess
> with in incorrect ways.
>
> So in general I'm very much in favour of this for same reasons I jumped
> in last time (which turned out to be premature!)
>
> This will be particularly useful in avoiding the need for helper function=
s
> in otherwise simple code flows.

Good to hear!

Next version, after we agree on the naming approach, I'll drop the RFC
and thake all suggestions for the next version.

Thank you all for your suggestions and comments :)

>
> Jonathan


--=20
 ~ Kurt

