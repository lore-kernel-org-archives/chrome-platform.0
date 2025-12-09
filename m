Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC57D2D46B4
	for <chrome-platform@lists.linux.dev>; Tue,  9 Dec 2025 10:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765276417; cv=none; b=tbZFFQw4Us8/rgXPSOgrL21bORDmL2FtaXkJi5M/osPb8kVjprKYKE0y0MqL4IXTJzJckYuuQrtMKgdHBVAdRezb5ecHklotzZ2UAdk1jwWJ23pUDvqrop24htoy4SKF8iKVTb21uSkR1ZoNHXfzb9NaH/ZOvB27pjW1q+D/bfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765276417; c=relaxed/simple;
	bh=6vUYZ7ZB1XA9z9XfSJy6LYoyZNPS3TghgWHThsU7xZg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uhIDsfP+HafWJ19NK1OOqkp9iDM3TGJfP4angjqe1ZK/9gxlTDeZufxDhyAGsNctaC9uy2MXldYY3/ynAWuf+oTwdy3xZrAL4pQZFebau9yBkN+z/XKOpiKZ7GZ5IfgNezeM+rz26ciLjKNEc4yvzi6d8HAXuz5FJ87h3jpDsQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AB4McMJv; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AB4McMJv"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779a637712so40292885e9.1
        for <chrome-platform@lists.linux.dev>; Tue, 09 Dec 2025 02:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765276414; x=1765881214; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6vUYZ7ZB1XA9z9XfSJy6LYoyZNPS3TghgWHThsU7xZg=;
        b=AB4McMJv9c41xHo2acNmewH3U43rbzRC2TGQXVXYINzn4DOb8UoB1cJ4M07JpajL1K
         mOxmDQ9Ce//IOlkjK6Le/DyiBc6apJ+dEOblZVlfo2vAnu3G+WKHWZptfhAXsfRPNRqv
         nmAzwzgErsImXLwAO/JWic/vT/TTNJAOa47gh05aNhPkNob0gD6HLWfL3pLgit78Eeb2
         PNaGMw2TksOpDzBiYywDSPzWVF7FqLVxetf87sTjEPV2SlXT+uwYi5BDjuW0IsGU85Q5
         BViO8sFb8Oh25wevujXojKAgsLxF8lqrncphH5nh6fO3g/uMqcPxyz/OQzvYxYlUz3+C
         BfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765276414; x=1765881214;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6vUYZ7ZB1XA9z9XfSJy6LYoyZNPS3TghgWHThsU7xZg=;
        b=t06v3KUFfWhnK0zqieP4WVwI+sePECOnPDJZjezGSLK2I2GoajPTbXr76oqD68DpWF
         ack5dBRU7UUUmZ9Xiet/DRdXHeOKLG21Umw6pQUb6hZWH6sGbDP4WIPaRRQ97rLpwBpz
         nngjgHX72/aW1gfwqZ3CWlqE85W/dRlrPd/Yx2DmNQKiTGQAvFTnf+RIVd0aJHDMLIVP
         J8nRxp9+QX8Inb9HaPSOxBK7KGmDJRiayEJWSXoo7zobo9jDxWfA5A5QQUSic0A2WtYg
         aoXXmC24apCrfrvv7Oh1pK1/W+GERiczfeC42TyP/GwLn5LE7WQarSsqFLpJs+U7qxGu
         RegA==
X-Forwarded-Encrypted: i=1; AJvYcCXUyqh4/kvNc/JpV3JL2o7AF4kYD+kXgl16735+lKUL4cHIRi8CcsuRWRa3ulZVdANrDDyE7cMNQXe2iipHUJY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz73jLSjaNW2u7hXBU/os/eSDfdrDBmo1ms7JC8F8j0yyJhX/Oy
	yKQHxp+NetVMTVcZSCBxUuWhbF/lRwqufM62f+fz1zhtdsoLZDcZZakZ
X-Gm-Gg: ASbGnctjpr3pPJ7Mq0JlFejv2uiKOTDZ3e538ai5CEThkeM5dqhsoupBYPwaPDIPPqJ
	2URkudtZdjAQvS2IHtb68yqhUkvN5rw6psVyLRP5VmJUERLXP3JDZz6cWt8Broh3VPdM2NtyoHO
	HjGxT+BDATme9Y8hez7dVyXTpMZRwfJmD/oOQykUUz72DIqbwBRTXtr93cvzWW2J8dAS/vex30h
	xZtOHX+BjA6fmv0N5PN9V7wuayn8K7zfGzV+Yi9Pg4itu/RmqP2F7JDZyC9GsDpDFlF8GXHNpep
	4SCFYcG3gWeuUHtY0fri8JxxX7/bU8mVMrcnSKGHQyCRj48PtykVqTbDdzlt8o00DTLM6+ArCfD
	5yzIXbo9KorD2wgSURwtrDH9hIfjVD2PT3YX9eYayR97mJoQ2/kQ4Ti3pTCXxKdKGiGQC1qif/1
	t89C355yGr1v8qKfv8KAg=
X-Google-Smtp-Source: AGHT+IGZQrJg+7CP7PO6TcoDaHyiNMGgsBliDZ1Lgu0m6bB12DU/JkBOondvRTh7wk+YcAEp6Q+UiQ==
X-Received: by 2002:a05:600c:a43:b0:47a:75b6:32c with SMTP id 5b1f17b1804b1-47a7b17cfdfmr29371385e9.2.1765276413463;
        Tue, 09 Dec 2025 02:33:33 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d3749bbsm15685995e9.3.2025.12.09.02.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 02:33:33 -0800 (PST)
Message-ID: <54483083c42cf7500239ebb7c0d32d25f11bb02f.camel@gmail.com>
Subject: Re: [PATCH RFC 0/6] iio: core: Introduce cleanup.h support for mode
 locks
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko
	 <andy.shevchenko@gmail.com>
Cc: Kurt Borja <kuurtb@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>,  Lars-Peter Clausen	 <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>, Benson Leung
 <bleung@chromium.org>, Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Gwendal Grignou	 <gwendal@chromium.org>, Shrikant Raskar
 <raskar.shree97@gmail.com>,  Per-Daniel Olsson <perdaniel.olsson@axis.com>,
 David Lechner <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?=	
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Guenter Roeck	
 <groeck@chromium.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Date: Tue, 09 Dec 2025 10:34:13 +0000
In-Reply-To: <20251206184645.51099254@jic23-huawei>
References: <20251203-lock-impr-v1-0-b4a1fd639423@gmail.com>
		<77ca77847511e67066a150096a7af2fb84f1f25f.camel@gmail.com>
		<CAHp75VdNjqZdy0+aSbBzn9CwEwHUhjwED+KRVqkdOMc_N+nX9w@mail.gmail.com>
	 <20251206184645.51099254@jic23-huawei>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sat, 2025-12-06 at 18:46 +0000, Jonathan Cameron wrote:
> On Thu, 4 Dec 2025 17:07:28 +0200
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>=20
> > On Thu, Dec 4, 2025 at 4:35=E2=80=AFPM Nuno S=C3=A1 <noname.nuno@gmail.=
com> wrote:
> > > On Wed, 2025-12-03 at 14:18 -0500, Kurt Borja wrote:=C2=A0=20
> > > >=20
> > > > In a recent driver review discussion [1], Andy Shevchenko suggested=
 we
> > > > add cleanup.h support for the lock API:
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iio_device_claim_{direct,buffer_mode=
}().=C2=A0=20
> > >=20
> > > We already went this patch and then reverted it. I guess before we di=
d not had
> > > ACQUIRE() and ACQUIRE_ERR() but I'm not sure that makes it much bette=
r. Looking at the
> > > last two patches on how we are handling the buffer mode stuff, I'm re=
ally not convinced...
> > >=20
> > > Also, I have doubts sparse can keep up with the __cleanup stuff so I'=
m not sure the
> > > annotations much make sense if we go down this path. Unless we want t=
o use both
> > > approaches which is also questionable.=C2=A0=20
> >=20
> > This, indeed, needs a (broader) discussion and I appreciate that Kurt
> > sent this RFC. Jonathan, what's your thoughts?
>=20
> I was pretty heavily involved in discussions around ACQUIRE() and it's us=
e
> in CXL and runtime PM (though that's still evolving with Rafael trying
> to improve the syntax a little).=C2=A0 As you might guess I did have this=
 use
> in mind during those discussions.
>=20
> As far as I know by avoiding the for loop complexity of the previous
> try we made and looking (under the hood) like guard() it should be much
> easier and safer to use.=C2=A0 Looking at this was on my list, so I'm ver=
y happy
> to see this series from Kurt exploring how it would be done.
>=20
> Sparse wise there is no support for now for any of the cleanup.h magic
> other than ignoring it.=C2=A0 That doesn't bother me that much though as =
these
> macros create more or less hidden local variables that are hard to mess
> with in incorrect ways.
>=20
> So in general I'm very much in favour of this for same reasons I jumped
> in last time (which turned out to be premature!)
>=20
> This will be particularly useful in avoiding the need for helper function=
s
> in otherwise simple code flows.
>=20

Ok, it seems we are going down the path to introduce this again. I do agree=
 the new ACQUIRE()
macros make things better (btw, I would be in favor of something similar to=
 pm runtime). Though
I'm still a bit worried about the device lock helper (the iio_device_claim =
one). We went through
some significant work in order to make mlock private (given historical abus=
e of it) and this
is basically making it public again. So I would like to either think a bit =
harder to see if we
can avoid it or just keep the code in patches 5 and 6 as is (even though th=
e dance in there is
really not pretty).

At the very least I would like to see a big, fat comment stating that lock =
is not to be randomly
used by drivers to protect their own internal data structures and state.

- Nuno S=C3=A1
