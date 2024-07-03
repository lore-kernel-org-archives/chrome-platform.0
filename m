Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EF0135414
	for <chrome-platform@lists.linux.dev>; Wed,  3 Jul 2024 07:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719990429; cv=none; b=D8qA8ftnqBOq9IzU3cUuv39ubPhi6PUnuSrLs/9oIMwqf5iatRU6ASMr5quOER5HbBQbsYh1WF5mubWsraM7AjiLU0IGCJUaiMkkNjYoivvGHVUbeqVnTiqLWlUtBfgzzvC7v5MrpACNLtdNBz+/5z6lZvwF0zcpe6YfHm+ZvVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719990429; c=relaxed/simple;
	bh=94/YiQevyIJ6f5oF+UZGXc3nPNCmtYJQcSbSpFNU7Ns=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Yis/bxx/dUYx7balwLK5JgmPsJGlsy85QBGBIY9pOGQg6jPzs5RkT2+klDqK8yE1Ic5DsC01vsy+IIT/cLKfd+tnaB7T9l/a63DmbRcqvjWiJ2+W4GgeOxqlDGLQZI5v5XpbVLBJJauFLN/Rh+b8ubCYu9VF9mnXjpd/1DmrKZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFrdZ/ca; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFrdZ/ca"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-36733f09305so2747973f8f.3
        for <chrome-platform@lists.linux.dev>; Wed, 03 Jul 2024 00:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719990426; x=1720595226; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=94/YiQevyIJ6f5oF+UZGXc3nPNCmtYJQcSbSpFNU7Ns=;
        b=UFrdZ/cahv2rAA/yTsE88/JdowcWYw/U6OzDJHZmWyFlqOZxOKYWeIhWvv/+puqTzq
         1gJagqB0aEC30Hhbda8g6aI0dPKgYHQ9r54iuWQvoir6cOosmUz/hgHqSPsHUMReRPHL
         V9YJkLHwyCDO48+3HwhBoULFtOvcUTyAzIbe8QdhSMUIM2KSarJbnBvOcytf0LNtDEnI
         +FS3uEh3rwoJ9eX+jF6Z+AUowKe/UIkHV5pJ+OZJp6Pi7CwX378WX4CdH/q7o4fxzNq4
         WWrlnKUwspM10IoLwBA+GSgzkMiX/ovfry2On85o2zi1ci1Tb10Rs1KaQtG1rjsACi1n
         wsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719990426; x=1720595226;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=94/YiQevyIJ6f5oF+UZGXc3nPNCmtYJQcSbSpFNU7Ns=;
        b=T6Ny7sDSiZo+2AE6aE88QoKGU7vFuA5w2TkEARPkfdBXVIOmuohx7mWulQT3FciQB9
         5JzOEThJcR4w1e1xCTahpmg2RatQch5Xp5bAAbnZXgEjToGv3XdOK/8h57LAM+KtWuVH
         mWopQcVjpVzI8QXQRth2ik1WjMmf2jFjsqEbaBH74u5j5OwuYe73y19Yv7VbrJ6Xhlgz
         fkgW2T8wZtLiBEKYnjs3wfz+L6Pl4s5s7TEYW48ELDdI7nJjplj1OJuEj9lQxdBFpvRX
         oRPz0eFY86xmicAJtdmHfYpE9N/tEYBQuVaSCwwH9tso2q1w0OarZaH5t0VT9Z5mZv39
         65/g==
X-Forwarded-Encrypted: i=1; AJvYcCVUFrewStRLXS/hXLGRwfwawca6BYZimpiSnSOxPYL4BElH0uejZ62KOko0lq/DDIeCJWQfnPvRRSxIH3prnbfZIt07iHm0VUPrAJsh0ugf
X-Gm-Message-State: AOJu0YzEaS5GiSYGLEk9aDPWNXn7smZdTYxrpXdcKdlZ3l0AMB5IJrzA
	KbHyKkCJFzGs0BAtoJD2ydC4qqvOyd/Xavv0TFdqqeD7cSG5cnWc
X-Google-Smtp-Source: AGHT+IE7bT6cMVZUlOrcczuiH3P+xPe2/ItQj4QMgGAX8UbgshHV5ACRpsWC3AW25jDa7wzoDssy3Q==
X-Received: by 2002:adf:e782:0:b0:362:bb3e:93da with SMTP id ffacd0b85a97d-367757282c1mr6854744f8f.62.1719990425492;
        Wed, 03 Jul 2024 00:07:05 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef1c:c500:ee59:d953:f148:40ba? (p200300f6ef1cc500ee59d953f14840ba.dip0.t-ipconnect.de. [2003:f6:ef1c:c500:ee59:d953:f148:40ba])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0d91fesm15226681f8f.40.2024.07.03.00.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 00:07:05 -0700 (PDT)
Message-ID: <c13f761e08cbe3c5021be34f5da774e44037c9a8.camel@gmail.com>
Subject: Re: [PATCH 00/20] iio: make masklength __private (round 1)
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, Nuno Sa via B4 Relay
	 <devnull+nuno.sa.analog.com@kernel.org>
Cc: nuno.sa@analog.com, linux-iio@vger.kernel.org, 
 chrome-platform@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Lars-Peter Clausen <lars@metafoo.de>, Cosmin Tanislav
 <cosmin.tanislav@analog.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Benson Leung <bleung@chromium.org>, Guenter
 Roeck <groeck@chromium.org>, Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Claudiu Beznea <claudiu.beznea@tuxon.dev>
Date: Wed, 03 Jul 2024 09:10:58 +0200
In-Reply-To: <20240702212652.01241fc2@jic23-huawei>
References: 
	<20240702-dev-iio-masklength-private-v1-0-98193bf536a6@analog.com>
	 <20240702212652.01241fc2@jic23-huawei>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2024-07-02 at 21:26 +0100, Jonathan Cameron wrote:
> On Tue, 02 Jul 2024 18:02:32 +0200
> Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org> wrote:
>=20
> > Hi Jonathan,
> >=20
> > Here it goes the first round of what we discussed in [1] about
> > annotating .masklength as __private. Patches should be fairly simple so
> > hopefully I did not messed up much...
> >=20
> > Note that in core, there's one place where we're still directly writing
> > into .masklength (when it's effectively set). The plan is then to
> > directly use ACCESS_PRIVATE() in there in the same patch where we mark
> > .masklength as __private.
>=20
> Makes sense. Series looks good to me, but I'll not pick it up just yet.
> I've tagged a like second 6.11 pull request, so this is probably 6.12 mat=
erial
> unless things go particularly smoothly and Greg takes an additional last
> minute one as there is one set waiting for a fix that is in char-misc
> but not yet iio-togreg.
>=20
> Jonathan
>=20

Yeah, looks sane to me. Advantage of going in 6.12 is that (likely) we'' ge=
t all
the conversions done.

- Nuno S=C3=A1
>=20

