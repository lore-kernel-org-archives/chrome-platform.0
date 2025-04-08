Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D38254B06
	for <chrome-platform@lists.linux.dev>; Tue,  8 Apr 2025 15:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744127789; cv=none; b=e46CaZDFrYiGXcIwKWm14EwrLxeauW0QIss3v88+MR2qFJkoQZl0/evkoldRSFjHjoxTFtbXoOOQwOBVjyaME3XFyPUtiQPHHtsUYx/7+xIV98jGOJTD7qcI5L7TMf5ri+ZeIshTb/iK8DafS5/IZo1Zbb/9EDhrmqEtuc3+nIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744127789; c=relaxed/simple;
	bh=SsbsF7KGX/EryEglMhWGujq9L4z4osJUyCBu6RILvQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XvSq4oA9QkQO17ydTn7bZ9yYzKdbkUbSbnin8gzVN8X+LcH83A155pXolXvvBKJQjRFNmcMG41/Rvi0yrhghuaV4p4oncuA+4Rv6Za32dZR2omJyzldBloIGadvqZdGREfSn6t+V27XtAhbmlpQ6bsUDaGNkPiOnzNKmYP1KRcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k4OAyzsm; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k4OAyzsm"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-524168b16d3so5124130e0c.0
        for <chrome-platform@lists.linux.dev>; Tue, 08 Apr 2025 08:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744127786; x=1744732586; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AM/+ze0roZREPn6ppfFn1kwGBymFDwlbRv56FB2XFog=;
        b=k4OAyzsmSoXc/tJoUEFJxa67wm+sGeY/uKD0DD1jHhyDAOBYdAopqvSnXfeafTo5SS
         XAnA2ErRS2RkwaKsPqweYuD2Pv48iI0M2m43bk7Le0ewE3SKB8VKLkMdj11rWFu8Dd+l
         njtEGZeo5gpsBBbbGAGdR1WRTRtt7fpyp2QDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744127786; x=1744732586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AM/+ze0roZREPn6ppfFn1kwGBymFDwlbRv56FB2XFog=;
        b=xHronMFX2cvHGysX/yoK3pGw182zzzTfLqlCIN0CILZ+QVOtD8aZ/UzrMz5Cjk3/YX
         2DTOcfQhKP/p5O/L/+I/2CxHUp2g/k48pwpDorOE5XoDWAH/oBJR0BbUxUskwgbnz77/
         XaMfwmBh9kdmkKqyX09BmC608J4UDMQSJBUxNrBVZvpzZZqiHhOU7/LtX00NKHpVXLpS
         8TFseyUkm5kK83+mpoqicldBU+s0Ke2p55ejasseRPzXctXOiNtuTIBKUPBdFlKedg6T
         GtvoR4qSNbUcjZ8XGO3Y2SVGYwFyaiaqEKj8VT/6KgvY3dc5+S/JqPFPsQlH1BLGkGws
         0vbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXX/bUJU4KHdOvxA5HIpwJ7AobrzW3sFA7ftGpQ/y1WvKqkS1wrY7Z8TntTZdSmMMEzIHE/MLUWYGbUnW6OcNI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwPYudKLEw+uE/Tgz6AVkRFLh8WppHGxaoOEHiP5hWkG0/XBY03
	gI+MskdLnWH1NXOskDGfDOW+wJGcWe3FexWfZJ4QvfmYYy0ZOR3ITsTVjydpjRS8tUPuVM4+h26
	SiMBtd3zeuYT0g0s+VYKkS8IHW6S40vEzC4jvo0BYwFk5tH8=
X-Gm-Gg: ASbGncuuIj570XKxc+TC9Gdhh8ugB3BEIjL4rAR1YCVR1BDR0nv7kwrXF1Kc+l4vY9c
	3MykF5+qH2Bgu2mj5iUVchDwmWTyMzHImnTuQo+QchuOv6kANHzOwwZyI7QJIXpMghQSTnhk6L6
	cymMz7c4gwcPHSPlgoy6XFLkhoft3SgPPoQDdcbaLD4cTYKJoy+nsz
X-Google-Smtp-Source: AGHT+IFYyAoCweRNfVg0Eb4XcmWkknHyVugsHXwiVWQe/fbO2tHXGAdvyfXp4bwwisjC4UC8IqhtPCRhfCDCo+/RJAI=
X-Received: by 2002:a05:6122:828d:b0:516:1ab2:9955 with SMTP id
 71dfb90a1353d-52765d2d52amr13537968e0c.6.1744127786500; Tue, 08 Apr 2025
 08:56:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPUE2uuY=BaPFro5cQSmQg4JS1Z5J5aBL7XvqqAo-X=LR4be3Q@mail.gmail.com>
 <20250408055412.1623257-1-gwendal@chromium.org> <Z_TXZT3SPEpTm6tc@google.com>
In-Reply-To: <Z_TXZT3SPEpTm6tc@google.com>
From: Gwendal Grignou <gwendal@chromium.org>
Date: Tue, 8 Apr 2025 08:56:14 -0700
X-Gm-Features: ATxdqUEZN_bemcGEIflJoObVScAUucOJdbwr9cZYFcOZt1ojv8QO1Xx95dJLyFs
Message-ID: <CAPUE2us3WRVVLeqLs-wZgo7g3DspuAyJUMmBMjDvdegaQ+9aFw@mail.gmail.com>
Subject: Re: [PATCH v2] iio: cros_ec_sensors: Flush when changing the FIFO timeout
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: jic23@kernel.org, linux-iio@vger.kernel.org, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 12:59=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Mon, Apr 07, 2025 at 10:54:11PM -0700, Gwendal Grignou wrote:
> > @@ -853,6 +859,16 @@ int cros_ec_sensors_core_write(struct cros_ec_sens=
ors_core_state *st,
> >               st->param.sensor_odr.roundup =3D 1;
> >
> >               ret =3D cros_ec_motion_send_host_cmd(st, 0);
> > +
> > +             /* Flush the FIFO in case we are stopping a sensor.
> > +              * If the FIFO has just been emptied, pending samples wil=
l be
> > +              * stuck until new samples are available. It will not hap=
pen
> > +              * when all the sensors are stopped.
> > +              */
> > +             if (ret >=3D 0 && frequency =3D=3D 0) {
>
> To disambiguate, `ret =3D=3D 0` or `!ret`[1].
Fixed in V3.
>
> [1]: https://elixir.bootlin.com/linux/v6.13/source/drivers/iio/common/cro=
s_ec_sensors/cros_ec_sensors_core.c#L411
