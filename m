Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EEE2FFDC2
	for <chrome-platform@lists.linux.dev>; Tue, 28 Oct 2025 09:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761643650; cv=none; b=s+s+H4V+8oKIZNYPjLAiZPdLs9yIAywJcC/gIfc3WZ5ZtniWnjpz5xmSmk3HOzsi7WF1j4lSLA33EwihG5/kmkkbmAk4bmYuofFwegiNcSOppEO+Gmrd4xNKbXIufMPkYXu1qj/usO6LmY/XojJrAnI8QpAf4f2yguKhgZPfU2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761643650; c=relaxed/simple;
	bh=2nzO/Lgis0CGEF4PRwALL8keP37eKj0EffWsyrHfk8g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RUsGBIR3bpVefYFuuR8X1y16YJ4uhauA9I4u06CUwf/owp98oS5xJ44sXjrCXwWgmYDDUHV7WxB3T7VxAxbYhkl1VwL7IogniDsZiLUcrhxhqdMFeoNYQBn/AuaGHGsJRaq9q4LmzQVhu12VuC9vyf0PUdBY98zb0/YMboqgpj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8TNhso8; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8TNhso8"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso5098334f8f.1
        for <chrome-platform@lists.linux.dev>; Tue, 28 Oct 2025 02:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761643646; x=1762248446; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Fa94rq4LY4WzohJQBw+1+fnrKto/qSLOJsPZx6Z7XI=;
        b=S8TNhso8D/m7H66nt0F9pbWgwlFbpA/DJiWcrbmXR0M28F6Z7Tx9ocf15gMtLd77I6
         RuK67Wb7ARbxW8HlVQ98ZZz+cx2TzygttEoE3IZiMtX7tFT1jYZ0osL4E3Ev4gEZgcMu
         6+ekRYx7cYlIvaSaEQMZ6VfnhbXRLI0KzhRxBktDfprasvCGwJGsT5ll+P02pu0opv4q
         8400vwFJLP4BKEI1ldachSv20fLwp35aUoqChybzQDecUh+6d1tb1ERmCN3qHDU9MMTE
         h+rBIok5kaDezEBOchi5PQF+2HcNUHUh6vDbXOU7dtNjAuqt/BFq5qszUxN/9Y2snzoN
         R4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761643646; x=1762248446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Fa94rq4LY4WzohJQBw+1+fnrKto/qSLOJsPZx6Z7XI=;
        b=buUGHwEtcV2Vfgoxf74ARNzYGRxIbuZpLi2fQcSOkNkOxZh/P1mT0JziJbLrKVC9VS
         gGmXp9KyqyByR2PD8vegbwBNLM86FTgpJpLYPAj2ypA9VnqyI8oremjG4u+3dqGsRc5N
         wHjuVXedlrxzMBDlA4dpYqBCWhkZF/epDKwQd8TU1zx3mYLmISMNmIvdPKiKkSvLOsUS
         /4W3LjqjxiRDdtvrdj5LKjc9OieEgdnVR3q/4vLzoLaZjZqobmBk127HdNU+yg8NXARS
         DTQA/Dl+FTwa7Qqeqngi+exg2h0B/t6JZVH0DaunTP35gWseTtF4TwLzlgO6LEyxo3kI
         +1zw==
X-Forwarded-Encrypted: i=1; AJvYcCXsKhZBL4NC/Xg7j4OSR9iXAbnSoEmwKpu8JMaB9XES5HNYTLfuhl5vs5Pg9hu1D5Ml2VZ97gh8HszSvy9Pk8k=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXo0euzohO8y94aCWpyalPbAq0Gn5Fvu922BCyF2Mgfd+6epo+
	YIzlcobAkBUlGG9Ph7Cc3L9bGv/tJAihfVZ129BqRhcImP9+vK8uoaJI
X-Gm-Gg: ASbGncvhSkP1S0u+Sde/gr3YYhX63UOL7Qkrf4EcJLegSLCvnU2wBIuIEuiPXpmpu5k
	0zKakah2WL2lNSPsNzilJBoA3IPTCtGH0cNImR+5r461hBHWsM926HN25S5TGfspuil9wIQHzbw
	h2fLGmaRnygXkYd7Ryi6E5brjG/ZrIUzQC9MgxfqhpK6GF2+IyBUiezynzBJTND7kX2RkjIQDja
	Aue7cqTC9L08aCrE+u/DSrl4/uLSYqKN0uslB93uRbkndAnJUgFujYxx7+MS2Fz/XkHt/ouO4sG
	PumXufag/Qs5/pzlCWXa5HF5rFOLYZppEoTzpLpChDRpxqJUpzbj6rSbjvaDCaqKeenlVuIr4qr
	S+qQEDXRi8OzEIL9b9FwwEasqqj+FcwoPYiZXeGt6fVvraTenszu9Rp7V5nho7ZbD//m06x/NFD
	+FH1pgnhp/7rFsCMWbNH26T7NW06eFFvKXuPVawVq1Xg==
X-Google-Smtp-Source: AGHT+IFF5YJfFnpTtTAVxGmV5ZlBFo/mf4gYcQP7jzA5jKthEnOt4UjCXc6otkG5ppk07jpyxXmDJg==
X-Received: by 2002:a05:6000:25f4:b0:429:a7f1:bdda with SMTP id ffacd0b85a97d-429a7f1bf31mr2313106f8f.47.1761643645777;
        Tue, 28 Oct 2025 02:27:25 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d4494sm19408803f8f.21.2025.10.28.02.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 02:27:25 -0700 (PDT)
Date: Tue, 28 Oct 2025 09:27:23 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, Jonathan Cameron
 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: Re: [PATCH v1 2/6] units: Add value of =?UTF-8?B?z4A=?= *
 =?UTF-8?B?MTDigbk=?=
Message-ID: <20251028092723.3403d122@pumpkin>
In-Reply-To: <aQB55GjWQL3VD1MO@smile.fi.intel.com>
References: <20251027143850.2070427-1-andriy.shevchenko@linux.intel.com>
	<20251027143850.2070427-3-andriy.shevchenko@linux.intel.com>
	<20251027193033.69728215@pumpkin>
	<aQB55GjWQL3VD1MO@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 28 Oct 2025 10:08:04 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Mon, Oct 27, 2025 at 07:30:33PM +0000, David Laight wrote:
> > On Mon, 27 Oct 2025 15:34:51 +0100
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >  =20
> > > There are a few drivers that want to have this value, and at least one
> > > known to come soon. Let's define a value for them. =20
>=20
> > > +/* Value of =CF=80 * 10=E2=81=B9 */

Thinks - should non-ascii characters be allowed in comments.
They can cause grief.

> > > +#define PI	3141592653LL =20
> >=20
> > Is that the right value?
> > IIRC the next digits are 58979 (I used to know the next few as well)
> > which means it should be rounded up. =20
>=20
> Right, today I have the same thought that actually ChromeOS driver has a
> off-by-one issue there.

Not as though it is likely to make a difference.
If any code needs anything more accurate than 3.1416 it probably cares
whether the value is rounded down or up.

> Btw, do you know if we can have compile-time divisions that can make 32-b=
it
> constants out of the 64-bit input? DIV_ROUND_CLOSEST_ULL() doesn't seem a=
llow
> that.

Not sure, I did wonder how much thought had gone into the LL suffix.
The value used will fit in u32 - but then any maths becomes unsigned.
OTOH using LL forces 64bit maths on 32bit - not good.

I suspect it would be better to drop a digit so the value fits in a
signed 32bit variable.

The other issue is whether scaling by a power of 10 is even right.
If the code has to rescale the value using divides you really want
to divide by a big power of 2 not 10.
So multiplying by 2**29 may be more useful.

	David





